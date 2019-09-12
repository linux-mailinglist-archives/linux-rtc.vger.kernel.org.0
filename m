Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B28ADB09E7
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2019 10:10:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729905AbfILIKC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 12 Sep 2019 04:10:02 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:50019 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729903AbfILIKB (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 12 Sep 2019 04:10:01 -0400
X-Originating-IP: 213.58.148.146
Received: from localhost (unknown [213.58.148.146])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 1F9C4E0003;
        Thu, 12 Sep 2019 08:09:59 +0000 (UTC)
Date:   Thu, 12 Sep 2019 10:09:53 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Nick Crews <ncrews@chromium.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Duncan Laurie <dlaurie@google.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH] rtc: wilco-ec: Sanitize values received from RTC
Message-ID: <20190912080953.GO21254@piout.net>
References: <20190910151929.780-1-ncrews@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190910151929.780-1-ncrews@chromium.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Nick,

On 10/09/2019 16:19:29+0100, Nick Crews wrote:
> Check that the time received from the RTC HW is valid,
> otherwise the computation of rtc_year_days() in the next
> line could, and sometimes does, crash the kernel.
> 
> While we're at it, fix the license to plain "GPL".
> 
> Signed-off-by: Nick Crews <ncrews@chromium.org>
> ---
>  drivers/rtc/rtc-wilco-ec.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-wilco-ec.c b/drivers/rtc/rtc-wilco-ec.c
> index 8ad4c4e6d557..0ccbf2dce832 100644
> --- a/drivers/rtc/rtc-wilco-ec.c
> +++ b/drivers/rtc/rtc-wilco-ec.c
> @@ -110,8 +110,16 @@ static int wilco_ec_rtc_read(struct device *dev, struct rtc_time *tm)
>  	tm->tm_mday	= rtc.day;
>  	tm->tm_mon	= rtc.month - 1;
>  	tm->tm_year	= rtc.year + (rtc.century * 100) - 1900;
> -	tm->tm_yday	= rtc_year_days(tm->tm_mday, tm->tm_mon, tm->tm_year);

If your driver doesn't care about yday, userspace doesn't either. You
can simply not set it.

>  
> +	if (rtc_valid_tm(tm)) {
> +		dev_warn(dev,
> +			 "Time computed from EC RTC is invalid: sec=%d, min=%d, hour=%d, mday=%d, mon=%d, year=%d",
> +			 tm->tm_sec, tm->tm_min, tm->tm_hour, tm->mday,
> +			 tm->mon, tm->year);
> +		return -EIO;
> +	}
> +
> +	tm->tm_yday = rtc_year_days(tm->tm_mday, tm->tm_mon, tm->tm_year);
>  	/* Don't compute day of week, we don't need it. */
>  	tm->tm_wday = -1;
>  
> @@ -188,5 +196,5 @@ module_platform_driver(wilco_ec_rtc_driver);
>  
>  MODULE_ALIAS("platform:rtc-wilco-ec");
>  MODULE_AUTHOR("Nick Crews <ncrews@chromium.org>");
> -MODULE_LICENSE("GPL v2");
> +MODULE_LICENSE("GPL");

This should be in a separate patch.

>  MODULE_DESCRIPTION("Wilco EC RTC driver");
> -- 
> 2.11.0
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
