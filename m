Return-Path: <linux-rtc+bounces-2171-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB9C99A7F3
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Oct 2024 17:38:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1E282830ED
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Oct 2024 15:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D03919580A;
	Fri, 11 Oct 2024 15:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Jh5BPLOP"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F3B7DA82;
	Fri, 11 Oct 2024 15:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728661090; cv=none; b=kz179c2rNqe2Zq1RVaQD0lqLdry1DfRIgTiMRv9pXnIKLs6ec0LjRWeE32fP0ObUCTm9sizrvZvsnr81lqAzyHfaS4DZytEj0hphZWBWHTkXWb0ewKbp4jNev1+5UvoN9oqsU0Ev1hlTSLKlMK25fLKT56P7GMg9jeN05lDCy+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728661090; c=relaxed/simple;
	bh=yGHTcCatpZSTCpG+wm3+0VIinh0Bye4B+8DChRfwgz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=imfuSGOkF2WuQFMdyyCngLTlyS6RcuZh/XZgzLtxUrw+G3R02n4sZSssMGxDBlFJ0Nvz5KdO3TIJLhkbUXVBrz8rkSxp9wBw18MfN6x0K5GIR//nKAbvBpGgUldxtRFOa35He7dNfOXvDPf5196NK4iWwhxYI4CBl2gbOFmjUck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Jh5BPLOP; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 133D11C0002;
	Fri, 11 Oct 2024 15:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728661079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xxi7xc/L/MvU8Pm+2deYhSx0dINp1uz5C974UZOhQPI=;
	b=Jh5BPLOPmHev3TjwpuItRN8dxBdAjQGFpBfHtdK+QkYH6Dwlbk1BllD5lT4/d9mfERz+nm
	rpdP47fAOVEM2VbJkKT+BnegjFID+Dr4Qu8bF2Yp7Si40a9uBq+1Sj7xiTNKFxqaZcRrXt
	fgogCfK1Asus4vGnkuJKbPEE0/RGV50oKOYzkwY6fI4MnFbAU3DP0zTDCC08xN2p939lBj
	b7FQdLN5ywMrOn1K/6HT7JPJLo+qxKzlTA6LCGpqxnwf3Xk3kTXfR9vio9Ip64E3ROEG6C
	uhbhPt8KdGPh0cK2oCroa9Nu/5RQ4n5GR5uw2WD0NwsE9K9w+qR6gxSATEaZ4g==
Date: Fri, 11 Oct 2024 17:37:58 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org,
	"open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/5] rtc: pm8xxx: implement no-alarm flag for non-HLOS
 owned alarm
Message-ID: <20241011153758fd3f559d@mail.local>
References: <20241011152244.31267-1-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011152244.31267-1-jonathan@marek.ca>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 11/10/2024 11:22:39-0400, Jonathan Marek wrote:
> Qualcomm x1e80100 firmware sets the ownership of the RTC alarm to ADSP.
> Thus writing to RTC alarm registers and receiving alarm interrupts is not
> possible.
> 
> Add a no-alarm flag to support RTC on this platform.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/rtc/rtc-pm8xxx.c | 48 ++++++++++++++++++++++++++++------------
>  1 file changed, 34 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
> index c32fba550c8e0..9240844022092 100644
> --- a/drivers/rtc/rtc-pm8xxx.c
> +++ b/drivers/rtc/rtc-pm8xxx.c
> @@ -61,6 +61,7 @@ struct pm8xxx_rtc {
>  	struct rtc_device *rtc;
>  	struct regmap *regmap;
>  	bool allow_set_time;
> +	bool no_alarm;
>  	int alarm_irq;
>  	const struct pm8xxx_rtc_regs *regs;
>  	struct device *dev;
> @@ -375,6 +376,11 @@ static const struct rtc_class_ops pm8xxx_rtc_ops = {
>  	.alarm_irq_enable = pm8xxx_rtc_alarm_irq_enable,
>  };
>  
> +static const struct rtc_class_ops pm8xxx_rtc_no_alarm_ops = {
> +	.read_time	= pm8xxx_rtc_read_time,
> +	.set_time	= pm8xxx_rtc_set_time,
> +};
> +

Please clear the alarm feature flag instead of duplicating the ops

>  static irqreturn_t pm8xxx_alarm_trigger(int irq, void *dev_id)
>  {
>  	struct pm8xxx_rtc *rtc_dd = dev_id;
> @@ -473,9 +479,13 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
>  	if (!rtc_dd->regmap)
>  		return -ENXIO;
>  
> -	rtc_dd->alarm_irq = platform_get_irq(pdev, 0);
> -	if (rtc_dd->alarm_irq < 0)
> -		return -ENXIO;
> +	rtc_dd->no_alarm = of_property_read_bool(pdev->dev.of_node, "no-alarm");
> +
> +	if (!rtc_dd->no_alarm) {
> +		rtc_dd->alarm_irq = platform_get_irq(pdev, 0);
> +		if (rtc_dd->alarm_irq < 0)
> +			return -ENXIO;
> +	}
>  
>  	rtc_dd->allow_set_time = of_property_read_bool(pdev->dev.of_node,
>  						      "allow-set-time");
> @@ -503,7 +513,8 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, rtc_dd);
>  
> -	device_init_wakeup(&pdev->dev, 1);
> +	if (!rtc_dd->no_alarm)
> +		device_init_wakeup(&pdev->dev, 1);
>  
>  	rtc_dd->rtc = devm_rtc_allocate_device(&pdev->dev);
>  	if (IS_ERR(rtc_dd->rtc))
> @@ -512,27 +523,36 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
>  	rtc_dd->rtc->ops = &pm8xxx_rtc_ops;
>  	rtc_dd->rtc->range_max = U32_MAX;
>  
> -	rc = devm_request_any_context_irq(&pdev->dev, rtc_dd->alarm_irq,
> -					  pm8xxx_alarm_trigger,
> -					  IRQF_TRIGGER_RISING,
> -					  "pm8xxx_rtc_alarm", rtc_dd);
> -	if (rc < 0)
> -		return rc;
> +	if (!rtc_dd->no_alarm) {
> +		rc = devm_request_any_context_irq(&pdev->dev, rtc_dd->alarm_irq,
> +						  pm8xxx_alarm_trigger,
> +						  IRQF_TRIGGER_RISING,
> +						  "pm8xxx_rtc_alarm", rtc_dd);
> +		if (rc < 0)
> +			return rc;
> +	} else {
> +		rtc_dd->rtc->ops = &pm8xxx_rtc_no_alarm_ops;
> +	}
>  
>  	rc = devm_rtc_register_device(rtc_dd->rtc);
>  	if (rc)
>  		return rc;
>  
> -	rc = dev_pm_set_wake_irq(&pdev->dev, rtc_dd->alarm_irq);
> -	if (rc)
> -		return rc;
> +	if (!rtc_dd->no_alarm) {
> +		rc = dev_pm_set_wake_irq(&pdev->dev, rtc_dd->alarm_irq);
> +		if (rc)
> +			return rc;
> +	}
>  
>  	return 0;
>  }
>  
>  static void pm8xxx_remove(struct platform_device *pdev)
>  {
> -	dev_pm_clear_wake_irq(&pdev->dev);
> +	struct pm8xxx_rtc *rtc_dd = platform_get_drvdata(pdev);
> +
> +	if (!rtc_dd->no_alarm)
> +		dev_pm_clear_wake_irq(&pdev->dev);
>  }
>  
>  static struct platform_driver pm8xxx_rtc_driver = {
> -- 
> 2.45.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

