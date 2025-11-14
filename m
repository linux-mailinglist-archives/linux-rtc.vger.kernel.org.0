Return-Path: <linux-rtc+bounces-5380-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B094C5E594
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Nov 2025 17:53:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5C697387252
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Nov 2025 16:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE541337B8F;
	Fri, 14 Nov 2025 15:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FSHfay3A"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491153370EC
	for <linux-rtc@vger.kernel.org>; Fri, 14 Nov 2025 15:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763135910; cv=none; b=dlXihpgU93bY7Fc5TOOJtOkTExt2KHfRu74CubqmaHZi2ZNIKANn/vPRb9H+KaN9hMrw9AxIwhzvl4JenjHkcSKWSXvRvMjnsLVAZwGh4oMOLBviDBbcqvQsQuMKbGL0EFn/llfiGHUK1hpDQ0k269WXH/IhxcCvFhDmpCT4o14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763135910; c=relaxed/simple;
	bh=/4jpfOVdwxaqs5UuVbb+nzeLmNtMSQLkUWtDXm7PJeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WgCBxegqWgGKFi/7iQ+CxlvUNZFfTaHmLVob0V61QaporXOBmKoXahWQxmhC3AeNfN7U1J4Ii1Hgq3P8WT9Mo4Y3kGP68gRyVx8QXhsePvKd6fJVK7ZgbgmRE9vHcCfQgrTDqBjtKh2YY0DAyBuN15fKWmFs5IJHukUBuTqVExo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FSHfay3A; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6EBF61A1A99;
	Fri, 14 Nov 2025 15:58:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4114C6060E;
	Fri, 14 Nov 2025 15:58:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 71864102F23EE;
	Fri, 14 Nov 2025 16:58:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763135904; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ateTgk+5rjws/58LFnBTFYJ2F6CnbGYyxzpZqXut2Hk=;
	b=FSHfay3A0McuC6t6OlkmslKsXxEHWuaPHvzGO346RrJxdiQ3y9WMOUNULJ4WHA7XB5WA/n
	VkO1reeq1lc7WqlPXR75B1PkCvRfq+QWJ1WSM82O9HA9vvnR5rQvt0vDwHigaj874d08lL
	rA6fKpLtkBzBU06WexJPT7+F5JHdUN5LyHCGO9ASaRbKd3XJ2QcBZ0BkiPpeVSxTtNhDV/
	auy4L9HnnM2DwoFxRRZgwkr1XrM0Mr6hTZmNt9I8pi7B6kAMcmvomO6PXIy48tYL0WOGEa
	ex7d5dhMshKIma6fR/X5eq05FmbRb5MYA9smwRRjx88lBBHoYTObHcMeLSUGfw==
Date: Fri, 14 Nov 2025 16:58:21 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	Juan Yescas <jyescas@google.com>,
	Douglas Anderson <dianders@chromium.org>, kernel-team@android.com,
	Kaustabh Chakraborty <kauschluss@disroot.org>,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH 2/3] rtc: s5m: query platform device IRQ resource for
 alarm IRQ
Message-ID: <2025111415582194c6ee16@mail.local>
References: <20251114-s5m-alarm-v1-0-c9b3bebae65f@linaro.org>
 <20251114-s5m-alarm-v1-2-c9b3bebae65f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251114-s5m-alarm-v1-2-c9b3bebae65f@linaro.org>
X-Last-TLS-Session-Version: TLSv1.3

On 14/11/2025 11:47:22+0000, André Draszik wrote:
> The core driver now exposes the alarm IRQ as a resource, so we can drop
> the lookup from here to simplify the code and make adding support for
> additional variants easier in this driver.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>

Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  drivers/rtc/rtc-s5m.c | 21 ++++++++-------------
>  1 file changed, 8 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
> index a7220b4d0e8dd35786b060e2a4106e2a39fe743f..c6ed5a4ca8a0e4554b1c88c879b01fc384735007 100644
> --- a/drivers/rtc/rtc-s5m.c
> +++ b/drivers/rtc/rtc-s5m.c
> @@ -15,7 +15,6 @@
>  #include <linux/rtc.h>
>  #include <linux/platform_device.h>
>  #include <linux/mfd/samsung/core.h>
> -#include <linux/mfd/samsung/irq.h>
>  #include <linux/mfd/samsung/rtc.h>
>  #include <linux/mfd/samsung/s2mps14.h>
>  
> @@ -683,22 +682,18 @@ static int s5m_rtc_probe(struct platform_device *pdev)
>  		case S2MPS15X:
>  			regmap_cfg = &s2mps14_rtc_regmap_config;
>  			info->regs = &s2mps15_rtc_regs;
> -			alarm_irq = S2MPS14_IRQ_RTCA0;
>  			break;
>  		case S2MPS14X:
>  			regmap_cfg = &s2mps14_rtc_regmap_config;
>  			info->regs = &s2mps14_rtc_regs;
> -			alarm_irq = S2MPS14_IRQ_RTCA0;
>  			break;
>  		case S2MPS13X:
>  			regmap_cfg = &s2mps14_rtc_regmap_config;
>  			info->regs = &s2mps13_rtc_regs;
> -			alarm_irq = S2MPS14_IRQ_RTCA0;
>  			break;
>  		case S5M8767X:
>  			regmap_cfg = &s5m_rtc_regmap_config;
>  			info->regs = &s5m_rtc_regs;
> -			alarm_irq = S5M8767_IRQ_RTCA1;
>  			break;
>  		default:
>  			return dev_err_probe(&pdev->dev, -ENODEV,
> @@ -719,7 +714,6 @@ static int s5m_rtc_probe(struct platform_device *pdev)
>  					     "Failed to allocate regmap\n");
>  	} else if (device_type == S2MPG10) {
>  		info->regs = &s2mpg10_rtc_regs;
> -		alarm_irq = S2MPG10_IRQ_RTCA0;
>  	} else {
>  		return dev_err_probe(&pdev->dev, -ENODEV,
>  				     "Unsupported device type %d\n",
> @@ -730,13 +724,14 @@ static int s5m_rtc_probe(struct platform_device *pdev)
>  	info->s5m87xx = s5m87xx;
>  	info->device_type = device_type;
>  
> -	if (s5m87xx->irq_data) {
> -		info->irq = regmap_irq_get_virq(s5m87xx->irq_data, alarm_irq);
> -		if (info->irq <= 0)
> -			return dev_err_probe(&pdev->dev, -EINVAL,
> -					     "Failed to get virtual IRQ %d\n",
> -					     alarm_irq);
> -	}
> +	alarm_irq = platform_get_irq_byname_optional(pdev, "alarm");
> +	if (alarm_irq > 0)
> +		info->irq = alarm_irq;
> +	else if (alarm_irq == -ENXIO)
> +		info->irq = 0;
> +	else
> +		return dev_err_probe(&pdev->dev, alarm_irq ? : -EINVAL,
> +				     "IRQ 'alarm' not found\n");
>  
>  	platform_set_drvdata(pdev, info);
>  
> 
> -- 
> 2.52.0.rc1.455.g30608eb744-goog
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

