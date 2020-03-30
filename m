Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 487FF198547
	for <lists+linux-rtc@lfdr.de>; Mon, 30 Mar 2020 22:19:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727437AbgC3UTN (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 30 Mar 2020 16:19:13 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:53759 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727170AbgC3UTN (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 30 Mar 2020 16:19:13 -0400
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id AA2F8240004;
        Mon, 30 Mar 2020 20:19:10 +0000 (UTC)
Date:   Mon, 30 Mar 2020 22:19:10 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] rtc: sun6i: let the core handle rtc range
Message-ID: <20200330201910.GA752154@piout.net>
References: <20200330201510.861217-1-alexandre.belloni@bootlin.com>
 <20200330201510.861217-2-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200330201510.861217-2-alexandre.belloni@bootlin.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This was en unattended resend.

On 30/03/2020 22:15:09+0200, Alexandre Belloni wrote:
> Let the rtc core check the date/time against the RTC range.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  drivers/rtc/rtc-sun6i.c | 25 ++++++++++---------------
>  1 file changed, 10 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
> index 415a20a936e4..446ce38c1592 100644
> --- a/drivers/rtc/rtc-sun6i.c
> +++ b/drivers/rtc/rtc-sun6i.c
> @@ -108,7 +108,6 @@
>   * driver, even though it is somewhat limited.
>   */
>  #define SUN6I_YEAR_MIN				1970
> -#define SUN6I_YEAR_MAX				2033
>  #define SUN6I_YEAR_OFF				(SUN6I_YEAR_MIN - 1900)
>  
>  /*
> @@ -569,14 +568,6 @@ static int sun6i_rtc_settime(struct device *dev, struct rtc_time *rtc_tm)
>  	struct sun6i_rtc_dev *chip = dev_get_drvdata(dev);
>  	u32 date = 0;
>  	u32 time = 0;
> -	int year;
> -
> -	year = rtc_tm->tm_year + 1900;
> -	if (year < SUN6I_YEAR_MIN || year > SUN6I_YEAR_MAX) {
> -		dev_err(dev, "rtc only supports year in range %d - %d\n",
> -			SUN6I_YEAR_MIN, SUN6I_YEAR_MAX);
> -		return -EINVAL;
> -	}
>  
>  	rtc_tm->tm_year -= SUN6I_YEAR_OFF;
>  	rtc_tm->tm_mon += 1;
> @@ -585,7 +576,7 @@ static int sun6i_rtc_settime(struct device *dev, struct rtc_time *rtc_tm)
>  		SUN6I_DATE_SET_MON_VALUE(rtc_tm->tm_mon)  |
>  		SUN6I_DATE_SET_YEAR_VALUE(rtc_tm->tm_year);
>  
> -	if (is_leap_year(year))
> +	if (is_leap_year(rtc_tm->tm_year + SUN6I_YEAR_MIN))
>  		date |= SUN6I_LEAP_SET_VALUE(1);
>  
>  	time = SUN6I_TIME_SET_SEC_VALUE(rtc_tm->tm_sec)  |
> @@ -726,12 +717,16 @@ static int sun6i_rtc_probe(struct platform_device *pdev)
>  
>  	device_init_wakeup(&pdev->dev, 1);
>  
> -	chip->rtc = devm_rtc_device_register(&pdev->dev, "rtc-sun6i",
> -					     &sun6i_rtc_ops, THIS_MODULE);
> -	if (IS_ERR(chip->rtc)) {
> -		dev_err(&pdev->dev, "unable to register device\n");
> +	chip->rtc = devm_rtc_allocate_device(&pdev->dev);
> +	if (IS_ERR(chip->rtc))
>  		return PTR_ERR(chip->rtc);
> -	}
> +
> +	chip->rtc->ops = &sun6i_rtc_ops;
> +	chip->rtc->range_max = 2019686399LL; /* 2033-12-31 23:59:59 */
> +
> +	ret = rtc_register_device(chip->rtc);
> +	if (ret)
> +		return ret;
>  
>  	dev_info(&pdev->dev, "RTC enabled\n");
>  
> -- 
> 2.25.1
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
