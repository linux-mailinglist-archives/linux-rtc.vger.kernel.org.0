Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 647DC433B0E
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Oct 2021 17:48:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbhJSPvF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 19 Oct 2021 11:51:05 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:59357 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229803AbhJSPvE (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 19 Oct 2021 11:51:04 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 40B39100007;
        Tue, 19 Oct 2021 15:48:50 +0000 (UTC)
Date:   Tue, 19 Oct 2021 17:48:50 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] rtc: s3c: Fix RTC read on first boot
Message-ID: <YW7o4iVhJNmv/ea6@piout.net>
References: <20211019131724.3109-1-semen.protsenko@linaro.org>
 <20211019131724.3109-5-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211019131724.3109-5-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 19/10/2021 16:17:24+0300, Sam Protsenko wrote:
> On first RTC boot it has the month register value set to 0.
> Unconditional subtracting of 1 subsequently in s3c_rtc_gettime() leads
> to the next error message in kernel log:
> 
>     hctosys: unable to read the hardware clock
> 
> That happens in s3c_rtc_probe() when trying to register the RTC, which
> in turn tries to read and validate the time. Initialize RTC date/time
> registers to valid values in probe function on the first boot to prevent
> such errors.
> 

No, never ever do that, the time is bogus and it has to stay this way,
else userspace can't know whether the time on the RTC is the actual wall
time or just some random value that you have set from the driver.

> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  drivers/rtc/rtc-s3c.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
> index 238928e29fbc..c7e763bcf61f 100644
> --- a/drivers/rtc/rtc-s3c.c
> +++ b/drivers/rtc/rtc-s3c.c
> @@ -403,6 +403,28 @@ static int s3c_rtc_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +/* Set RTC with valid date/time values on first boot */
> +static int s3c_rtc_init_time(struct s3c_rtc *info)
> +{
> +	struct rtc_time tm;
> +	int ret;
> +
> +	ret = s3c_rtc_read_time(info, &tm);
> +	if (ret)
> +		return ret;
> +
> +	/* Only init RTC date/time on first boot */
> +	if (tm.tm_mday > 0)
> +		return 0;
> +
> +	/* Init date/time: 1 Jan 2000 00:00:00 */
> +	memset(&tm, 0, sizeof(struct rtc_time));
> +	tm.tm_mday = 1;	/* tm_mday min valid value is 1 */
> +	tm.tm_mon = 1;	/* January in internal representation */
> +
> +	return s3c_rtc_write_time(info, &tm);
> +}
> +
>  static int s3c_rtc_probe(struct platform_device *pdev)
>  {
>  	struct s3c_rtc *info = NULL;
> @@ -471,6 +493,10 @@ static int s3c_rtc_probe(struct platform_device *pdev)
>  
>  	device_init_wakeup(&pdev->dev, 1);
>  
> +	ret = s3c_rtc_init_time(info);
> +	if (ret)
> +		goto err_nortc;
> +
>  	info->rtc = devm_rtc_allocate_device(&pdev->dev);
>  	if (IS_ERR(info->rtc)) {
>  		ret = PTR_ERR(info->rtc);
> -- 
> 2.30.2
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
