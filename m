Return-Path: <linux-rtc+bounces-2404-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C591C9B8119
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Oct 2024 18:22:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3DB61C208DC
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Oct 2024 17:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 484401B654A;
	Thu, 31 Oct 2024 17:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BhN3a2Mk"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EBA19DF60;
	Thu, 31 Oct 2024 17:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730395341; cv=none; b=m2NC5KmdqNyTnEguh0Eu6p8Dg8Uo5RNNQpr2fB2l9WPTIDQKXp3LIREn6fzW+JZ2dI64jKoUfc9mhfK+B65GxTpvET03Aduej84z9xJY9ByzidYUnVV7f4uVttKsQNsH8fyipuZlEqVF21CyumNK3xDR52tEHOmDdswWERd9Iu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730395341; c=relaxed/simple;
	bh=gi6YJqLrQqmFLpsqmUIt3UQDuJw8TObOdOH5wGU8aHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PeXH9v+PsdhuvWbIYzJZ191KYemX0eJpN8q+7GrDLa1NaxoT5QgFtt7SzgL0prCmn+1/5JA6DxZrCYXG432ARPXxjrp6KD3jtLKFZYoID7kuhc4lgKZAxqe5VZnnBIDQWgmT7W0PtD8cpuUrba56tfAovE2Cv2t0XsI/KBeEDU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BhN3a2Mk; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 24E9440003;
	Thu, 31 Oct 2024 17:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730395330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DqxtyXYvVz4SALuwZ1hNCgm2VOAHSObz6R1DC5+jyEA=;
	b=BhN3a2MkiW4FWXUFx/nh96+EAaetep4+zHuy/pWm0Xed9dxIaviLKT7+CeNSHDYYfoR8Vh
	OSl24Jw4aRDwcg4RBzTnonM/p8ym11XUMW2FJ689Rau9tnYyFTEKIV0U9lt+UcN8xbNdxl
	3iAWiQJBATvq8Ry5ziTLTvsnFdPAxFcXypzlwYExabBpWWaXaSBfNlQeNs5kHOhbBqwhKy
	6GJIT/6e7vr8NBPsYKZ1TsljjaIFfoC2plWhZW03ubQjDlxmofA1Z6ink6whWdgOH7p4Aq
	wd/+tOPWxFs3M5KLRUfkC8Qir2Lg2Y5YwywxnyuqkhWbOkDMBJTnAIA0aIQ1bw==
Date: Thu, 31 Oct 2024 18:22:09 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH] mfd: rtc: bd7xxxx Drop IC name from IRQ
Message-ID: <202410311722099104e7b6@mail.local>
References: <ZvVNCfk10ih0YFLW@fedora>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZvVNCfk10ih0YFLW@fedora>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 26/09/2024 15:01:13+0300, Matti Vaittinen wrote:
> A few ROHM PMICs have an RTC block which can be controlled by the
> rtc-bd70528 driver. The RTC driver needs the alarm interrupt information
> from the parent MFD driver. The MFD driver provides the interrupt
> information as a set of named interrupts, where the name is of form:
> <PMIC model>-rtc-alm-<x>, where x is an alarm block number.
> 
> From the RTC driver point of view it is irrelevant what the PMIC name
> is. It is sufficient to know this is alarm interrupt for a block X. The
> PMIC model information is carried to RTC via the platform device ID.
> Hence, having the PMIC model in the interrupt name is only making things
> more complex because the RTC driver needs to request differently named
> interrupts on different PMICs, making code unnecessary complicated.
> 
> Simplify this slightly by always using the RTC driver name 'bd70528' as
> the prefix for alarm interrupts, no matter what the exact PMIC model is,
> and always request the alarm interrupts of same name no matter what the
> PMIC model is.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> 
> ---
> This contains both the RTC and MFD changes in order to not break the
> functionality between commits to different subsystems.
> 
> Changes are based to stuff being merged in for v6.12-rc1. I can rebase
> and re-spin when 6.12-rc1 is out if needed.
> ---
>  drivers/mfd/rohm-bd71828.c | 12 ++++++------
>  drivers/rtc/rtc-bd70528.c  |  5 +----
>  2 files changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/mfd/rohm-bd71828.c b/drivers/mfd/rohm-bd71828.c
> index 39f7514aa3d8..738d8b3b9ffe 100644
> --- a/drivers/mfd/rohm-bd71828.c
> +++ b/drivers/mfd/rohm-bd71828.c
> @@ -32,15 +32,15 @@ static struct gpio_keys_platform_data bd71828_powerkey_data = {
>  };
>  
>  static const struct resource bd71815_rtc_irqs[] = {
> -	DEFINE_RES_IRQ_NAMED(BD71815_INT_RTC0, "bd71815-rtc-alm-0"),
> -	DEFINE_RES_IRQ_NAMED(BD71815_INT_RTC1, "bd71815-rtc-alm-1"),
> -	DEFINE_RES_IRQ_NAMED(BD71815_INT_RTC2, "bd71815-rtc-alm-2"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_RTC0, "bd70528-rtc-alm-0"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_RTC1, "bd70528-rtc-alm-1"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_RTC2, "bd70528-rtc-alm-2"),
>  };
>  
>  static const struct resource bd71828_rtc_irqs[] = {
> -	DEFINE_RES_IRQ_NAMED(BD71828_INT_RTC0, "bd71828-rtc-alm-0"),
> -	DEFINE_RES_IRQ_NAMED(BD71828_INT_RTC1, "bd71828-rtc-alm-1"),
> -	DEFINE_RES_IRQ_NAMED(BD71828_INT_RTC2, "bd71828-rtc-alm-2"),
> +	DEFINE_RES_IRQ_NAMED(BD71828_INT_RTC0, "bd70528-rtc-alm-0"),
> +	DEFINE_RES_IRQ_NAMED(BD71828_INT_RTC1, "bd70528-rtc-alm-1"),
> +	DEFINE_RES_IRQ_NAMED(BD71828_INT_RTC2, "bd70528-rtc-alm-2"),
>  };
>  
>  static struct resource bd71815_power_irqs[] = {
> diff --git a/drivers/rtc/rtc-bd70528.c b/drivers/rtc/rtc-bd70528.c
> index 59b627fc1ecf..954ac4ef53e8 100644
> --- a/drivers/rtc/rtc-bd70528.c
> +++ b/drivers/rtc/rtc-bd70528.c
> @@ -236,7 +236,6 @@ static int bd70528_probe(struct platform_device *pdev)
>  {
>  	struct bd70528_rtc *bd_rtc;
>  	const struct rtc_class_ops *rtc_ops;
> -	const char *irq_name;
>  	int ret;
>  	struct rtc_device *rtc;
>  	int irq;
> @@ -259,7 +258,6 @@ static int bd70528_probe(struct platform_device *pdev)
>  
>  	switch (chip) {
>  	case ROHM_CHIP_TYPE_BD71815:
> -		irq_name = "bd71815-rtc-alm-0";
>  		bd_rtc->reg_time_start = BD71815_REG_RTC_START;
>  
>  		/*
> @@ -276,7 +274,6 @@ static int bd70528_probe(struct platform_device *pdev)
>  		hour_reg = BD71815_REG_HOUR;
>  		break;
>  	case ROHM_CHIP_TYPE_BD71828:
> -		irq_name = "bd71828-rtc-alm-0";
>  		bd_rtc->reg_time_start = BD71828_REG_RTC_START;
>  		bd_rtc->bd718xx_alm_block_start = BD71828_REG_RTC_ALM_START;
>  		hour_reg = BD71828_REG_RTC_HOUR;
> @@ -286,7 +283,7 @@ static int bd70528_probe(struct platform_device *pdev)
>  		return -ENOENT;
>  	}
>  
> -	irq = platform_get_irq_byname(pdev, irq_name);
> +	irq = platform_get_irq_byname(pdev, "bd70528-rtc-alm-0");
>  
>  	if (irq < 0)
>  		return irq;
> 
> base-commit: abf2050f51fdca0fd146388f83cddd95a57a008d
> -- 
> 2.45.2
> 
> 
> -- 
> Matti Vaittinen, Linux device drivers
> ROHM Semiconductors, Finland SWDC
> Kiviharjunlenkki 1E
> 90220 OULU
> FINLAND
> 
> ~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
> Simon says - in Latin please.
> ~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
> Thanks to Simon Glass for the translation =] 



-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

