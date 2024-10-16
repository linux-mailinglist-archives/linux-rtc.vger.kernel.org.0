Return-Path: <linux-rtc+bounces-2209-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 517DF9A01AA
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Oct 2024 08:43:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75C3C1C232CC
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Oct 2024 06:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3CED192D9D;
	Wed, 16 Oct 2024 06:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nAu+fXzN"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CBB190073;
	Wed, 16 Oct 2024 06:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729060960; cv=none; b=ZDvH58sAaMz7BM5ejm7e22aGXcXF+cp2hOZdBZ483lawOo0Iuy3qUF+Pgcyiy91N8cqMp6Nib0tLWhC+2p1dUo0mSIylfsovTSdbDFCEMCmvjpanndGJ+HeYgrskrnXGKuXuGt4JTS/YyJYlw4rYIjeCXSllVqziDME4eO0E2e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729060960; c=relaxed/simple;
	bh=SodGRJK6SdKaiOHwTixQxzX5Vp7/ZcsL2J0q86kEjOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kQlrTwcp/But2+MMiTIkfImRhPSz6fiShgK0rX0z7+7Q2e3fjErk2XO6EFas8cFnvMu4C1AVOhylkFl0tuNBLr/wBOmOZYmKTuh+gqVv5ohJfR5KCo2sJZVY9mz/yenXzaTZN4uUcEDtqurHEnITNdLzmfzysNAiAnPzIFRb0G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nAu+fXzN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 409FBC4CEC5;
	Wed, 16 Oct 2024 06:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729060960;
	bh=SodGRJK6SdKaiOHwTixQxzX5Vp7/ZcsL2J0q86kEjOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nAu+fXzNo/4J58eTjlJvWwgg1LcCUch4gsRi8eWWo/QqieaARhDEenGBptNjRK8Q7
	 UF3UrHHl3i+LHFpZQU/Qd1o70QDQWnhZKzJjXqK7wzbDHHfEIzm4U+vlpYEENNUlFF
	 B+N8rdbfYB7Jo+WbeLMS3Vs0pDk3MrwAicDUopeF1g8BEARKKEK1lBcNhaz0nxgsEN
	 cUC4m7oF+Erk0LYna+3hHsGztpzlVvCVnVIBchRkLIEarllmNfRXAxNE7cg5uLGHHC
	 WU53Rta3jJDDSFHQh2ufZASF3kkkF5Uy8v/gH5zrv0ciCDJYIE82JNzwqsBw8CvjZm
	 bYyDiGLwm0ZAQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t0xk6-000000004nI-36Dv;
	Wed, 16 Oct 2024 08:42:46 +0200
Date: Wed, 16 Oct 2024 08:42:46 +0200
From: Johan Hovold <johan@kernel.org>
To: Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/5] rtc: pm8xxx: implement qcom,no-alarm flag for
 non-HLOS owned alarm
Message-ID: <Zw9gZkLPMB9ZBQlh@hovoldconsulting.com>
References: <20241015004945.3676-1-jonathan@marek.ca>
 <20241015004945.3676-2-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015004945.3676-2-jonathan@marek.ca>

On Mon, Oct 14, 2024 at 08:47:26PM -0400, Jonathan Marek wrote:
> Qualcomm x1e80100 firmware sets the ownership of the RTC alarm to ADSP.
> Thus writing to RTC alarm registers and receiving alarm interrupts is not
> possible.
> 
> Add a qcom,no-alarm flag to support RTC on this platform.

An alternative may be to drop the alarm interrupt from DT and use that
as an indicator.

> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/rtc/rtc-pm8xxx.c | 44 +++++++++++++++++++++++++++-------------
>  1 file changed, 30 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
> index c32fba550c8e0..1e78939625622 100644
> --- a/drivers/rtc/rtc-pm8xxx.c
> +++ b/drivers/rtc/rtc-pm8xxx.c
> @@ -61,6 +61,7 @@ struct pm8xxx_rtc {
>  	struct rtc_device *rtc;
>  	struct regmap *regmap;
>  	bool allow_set_time;
> +	bool no_alarm;

How about inverting this one and naming it has_alarm or similar to avoid
the double negation in your conditionals (!no_alarm)?

>  	int alarm_irq;
>  	const struct pm8xxx_rtc_regs *regs;
>  	struct device *dev;
> @@ -473,9 +474,14 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
>  	if (!rtc_dd->regmap)
>  		return -ENXIO;
>  
> -	rtc_dd->alarm_irq = platform_get_irq(pdev, 0);
> -	if (rtc_dd->alarm_irq < 0)
> -		return -ENXIO;
> +	rtc_dd->no_alarm = of_property_read_bool(pdev->dev.of_node,
> +						 "qcom,no-alarm");
> +

Stray newline.

> +	if (!rtc_dd->no_alarm) {
> +		rtc_dd->alarm_irq = platform_get_irq(pdev, 0);
> +		if (rtc_dd->alarm_irq < 0)
> +			return -ENXIO;
> +	}
>  
>  	rtc_dd->allow_set_time = of_property_read_bool(pdev->dev.of_node,
>  						      "allow-set-time");
> @@ -503,7 +509,8 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, rtc_dd);
>  
> -	device_init_wakeup(&pdev->dev, 1);
> +	if (!rtc_dd->no_alarm)
> +		device_init_wakeup(&pdev->dev, 1);
>  
>  	rtc_dd->rtc = devm_rtc_allocate_device(&pdev->dev);
>  	if (IS_ERR(rtc_dd->rtc))
> @@ -512,27 +519,36 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
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
> +	} else {
> +		clear_bit(RTC_FEATURE_ALARM, rtc_dd->rtc->features);

I assume that you should be clearing the feature bit before registering
the RTC.

> +	}
>  
>  	return 0;
>  }

Johan

