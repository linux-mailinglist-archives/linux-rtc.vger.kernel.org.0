Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F6822F3E84
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Jan 2021 01:45:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394323AbhALWI6 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 12 Jan 2021 17:08:58 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:58471 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394322AbhALWI6 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 12 Jan 2021 17:08:58 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id E295FE0006;
        Tue, 12 Jan 2021 22:08:15 +0000 (UTC)
Date:   Tue, 12 Jan 2021 23:08:15 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Daniel =?iso-8859-1?Q?Gonz=E1lez?= Cabanelas <dgcbueu@gmail.com>
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 1/2] rtc: rs5c372: support alarms up to 1 week
Message-ID: <20210112220815.GK3654@piout.net>
References: <2876529.n6mMd1HPca@tool>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2876529.n6mMd1HPca@tool>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

On 23/11/2020 11:38:44+0100, Daniel González Cabanelas wrote:
> The Ricoh R2221x, R2223x, RS5C372, RV5C387A chips can handle 1 week
> alarms.
> 
> Read the "wday" alarm register and convert it to a date to support up 1
> week in our driver.
> 
> Signed-off-by: Daniel González Cabanelas <dgcbueu@gmail.com>
> ---
>  drivers/rtc/rtc-rs5c372.c | 48 ++++++++++++++++++++++++++++++++++-----
>  1 file changed, 42 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-rs5c372.c b/drivers/rtc/rtc-rs5c372.c
> index 3bd6eaa0d..94b778c6e 100644
> --- a/drivers/rtc/rtc-rs5c372.c
> +++ b/drivers/rtc/rtc-rs5c372.c
> @@ -393,7 +393,9 @@ static int rs5c_read_alarm(struct device *dev, struct rtc_wkalrm *t)
>  {
>  	struct i2c_client	*client = to_i2c_client(dev);
>  	struct rs5c372		*rs5c = i2c_get_clientdata(client);
> -	int			status;
> +	int			status, wday_offs;
> +	struct rtc_time 	rtc;

You have a few spaces before tabs, please fix them.

> +	unsigned long 		alarm_secs;
>  
>  	status = rs5c_get_regs(rs5c);
>  	if (status < 0)
> @@ -403,6 +405,30 @@ static int rs5c_read_alarm(struct device *dev, struct rtc_wkalrm *t)
>  	t->time.tm_sec = 0;
>  	t->time.tm_min = bcd2bin(rs5c->regs[RS5C_REG_ALARM_A_MIN] & 0x7f);
>  	t->time.tm_hour = rs5c_reg2hr(rs5c, rs5c->regs[RS5C_REG_ALARM_A_HOURS]);
> +	t->time.tm_wday = ffs(rs5c->regs[RS5C_REG_ALARM_A_WDAY] & 0x7f) - 1;
> +
> +	/* determine the day, month and year based on alarm wday, taking as a
> +	 * reference the current time from the rtc
> +	 */
> +	status = rs5c372_rtc_read_time(dev, &rtc);
> +	if (status < 0)
> +		return status;
> +
> +	wday_offs = t->time.tm_wday - rtc.tm_wday;

Note that you can not rely on tm_wday being set correctly. The core will
not (currently) enforce that and most tools jut pass a bogus value or 0.
So you need to calculate wday in rs5c372_rtc_set_time.
I'm currently working on a way for the drivers to ask the core to ensure
wday is correct.

> +	alarm_secs = mktime64(rtc.tm_year + 1900,
> +			      rtc.tm_mon + 1,
> +			      rtc.tm_mday + wday_offs,
> +			      t->time.tm_hour,
> +			      t->time.tm_min,
> +			      t->time.tm_sec);
> +
> +	if (wday_offs < 0 || (wday_offs == 0 &&
> +			      (t->time.tm_hour < rtc.tm_hour ||
> +			       (t->time.tm_hour == rtc.tm_hour &&
> +				t->time.tm_min <= rtc.tm_min))))
> +		alarm_secs += 7 * 86400;
> +
> +	rtc_time64_to_tm(alarm_secs, &t->time);
>  
>  	/* ... and status */
>  	t->enabled = !!(rs5c->regs[RS5C_REG_CTRL1] & RS5C_CTRL1_AALE);
> @@ -417,12 +443,20 @@ static int rs5c_set_alarm(struct device *dev, struct rtc_wkalrm *t)
>  	struct rs5c372		*rs5c = i2c_get_clientdata(client);
>  	int			status, addr, i;
>  	unsigned char		buf[3];
> +	struct rtc_time 	rtc_tm;
> +	unsigned long 		rtc_secs, alarm_secs;
>  
> -	/* only handle up to 24 hours in the future, like RTC_ALM_SET */
> -	if (t->time.tm_mday != -1
> -			|| t->time.tm_mon != -1
> -			|| t->time.tm_year != -1)
> +	/* chip only can handle alarms up to one week in the future*/
> +	status = rs5c372_rtc_read_time(dev, &rtc_tm);
> +	if (status)
> +		return status;
> +	rtc_secs = rtc_tm_to_time64(&rtc_tm);
> +	alarm_secs = rtc_tm_to_time64(&t->time);
> +	if (alarm_secs >= rtc_secs + 7 * 86400) {
> +		dev_err(dev, "%s: alarm maximum is one week in the future (%d)\n",
> +			__func__, status);

Please avoid adding an error message. It will not be read anyway.

>  		return -EINVAL;

Maybe it is a good opportunity to change to -ERANGE?

> +	}
>  
>  	/* REVISIT: round up tm_sec */
>  
> @@ -443,7 +477,9 @@ static int rs5c_set_alarm(struct device *dev, struct rtc_wkalrm *t)
>  	/* set alarm */
>  	buf[0] = bin2bcd(t->time.tm_min);
>  	buf[1] = rs5c_hr2reg(rs5c, t->time.tm_hour);
> -	buf[2] = 0x7f;	/* any/all days */
> +	/* each bit is the day of the week, 0x7f means all days */
> +	buf[2] = (t->time.tm_wday >= 0 && t->time.tm_wday < 7) ?
> +		  BIT(t->time.tm_wday) : 0x7f;

Here, you also need to calculate buf[2] from t->time.tm_mday instead of
relying on t->time.tm_wday.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
