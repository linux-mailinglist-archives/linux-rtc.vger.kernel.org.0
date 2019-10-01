Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11681C4154
	for <lists+linux-rtc@lfdr.de>; Tue,  1 Oct 2019 21:53:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726010AbfJATxp (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 1 Oct 2019 15:53:45 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:41235 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725851AbfJATxp (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 1 Oct 2019 15:53:45 -0400
X-Originating-IP: 86.202.229.42
Received: from localhost (lfbn-lyo-1-146-42.w86-202.abo.wanadoo.fr [86.202.229.42])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id E4C6240002;
        Tue,  1 Oct 2019 19:53:42 +0000 (UTC)
Date:   Tue, 1 Oct 2019 21:53:42 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Nick Crews <ncrews@chromium.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        enric.balletbo@collabora.com, bleung@chromium.org,
        dlaurie@chromium.org, djkurtz@chromium.org, dtor@google.com
Subject: Re: [PATCH v3] rtc: wilco-ec: Handle reading invalid times
Message-ID: <20191001195342.GH4106@piout.net>
References: <20190925203209.79941-1-ncrews@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190925203209.79941-1-ncrews@chromium.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Nick,

On 25/09/2019 14:32:09-0600, Nick Crews wrote:
> If the RTC HW returns an invalid time, the rtc_year_days()
> call would crash. This patch adds error logging in this
> situation, and removes the tm_yday and tm_wday calculations.
> These fields should not be relied upon by userspace
> according to man rtc, and thus we don't need to calculate
> them.
> 
> Signed-off-by: Nick Crews <ncrews@chromium.org>
> ---
>  drivers/rtc/rtc-wilco-ec.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-wilco-ec.c b/drivers/rtc/rtc-wilco-ec.c
> index 8ad4c4e6d557..53da355d996a 100644
> --- a/drivers/rtc/rtc-wilco-ec.c
> +++ b/drivers/rtc/rtc-wilco-ec.c
> @@ -110,10 +110,15 @@ static int wilco_ec_rtc_read(struct device *dev, struct rtc_time *tm)
>  	tm->tm_mday	= rtc.day;
>  	tm->tm_mon	= rtc.month - 1;
>  	tm->tm_year	= rtc.year + (rtc.century * 100) - 1900;
> -	tm->tm_yday	= rtc_year_days(tm->tm_mday, tm->tm_mon, tm->tm_year);
> -
> -	/* Don't compute day of week, we don't need it. */
> -	tm->tm_wday = -1;
> +	/* Ignore other tm fields, man rtc says userspace shouldn't use them. */
> +
> +	if (rtc_valid_tm(tm)) {
> +		dev_err(dev,
> +			 "Time from RTC is invalid: second=%u, minute=%u, hour=%u, day=%u, month=%u, year=%u, century=%u",
> +			 rtc.second, rtc.minute, rtc.hour, rtc.day, rtc.month,
> +			 rtc.year, rtc.century);

Do you mind using %ptR? At this point you already filled the tm struct
anyway and if you print century separately, you can infer tm_year.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
