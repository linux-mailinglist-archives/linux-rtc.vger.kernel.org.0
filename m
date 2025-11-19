Return-Path: <linux-rtc+bounces-5410-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A124C6C674
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Nov 2025 03:35:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 0C913298D0
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Nov 2025 02:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF3B6286426;
	Wed, 19 Nov 2025 02:35:53 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9045017BA1;
	Wed, 19 Nov 2025 02:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763519753; cv=none; b=YI+/D9eNZTKRQOKOOCUc9hKqUFVERdIgUPX/NUZ8Nce5pFueaF6+iTZziPhNgK1SVsG8eBf5MU8L0naabrHtKjVvZyfs9db9TKUxQsgWF4Y+bBmC7rxtYh6SCCiCL1ZquzyJ1W6IPDURB2J0UccYNbVGz8JEz4x0V4IO+VBOWJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763519753; c=relaxed/simple;
	bh=014ovtrA7seX6bLGyJxqCdyEZcNKnMDc6qIU9ej5CFQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CZCWhOpo242K/8aN8igeRgVlZntN/AQNUlbKZT17TCWo8TAZc1InMSkKZEYpUcPQJvJ/ROgVeNUKOyLRIkNukeyecsaaQo6f9QwAWFZH8wwcO7MF3tKPU+Zv2u1f3JEClRV/HOVr3DA0nWWgNEK71L4orabiR4sqvil0rXHPhkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=permerror header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 5AJ2ZNOI060352
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Nov 2025 10:35:23 +0800 (+08)
	(envelope-from cl634@andestech.com)
Received: from swlinux02 (10.0.15.183) by ATCPCS31.andestech.com (10.0.1.89)
 with Microsoft SMTP Server id 14.3.498.0; Wed, 19 Nov 2025 10:35:23 +0800
Date: Wed, 19 Nov 2025 10:35:23 +0800
From: CL Wang <cl634@andestech.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>, <cl634@andestech.com>
Subject: Re: [PATCH next] rtc: atcrtc100: Fix signedness bug in probe()
Message-ID: <aR0s653C4g2auavf@swlinux02>
References: <aRxPGBEX8hbY6sjV@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aRxPGBEX8hbY6sjV@stanley.mountain>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 5AJ2ZNOI060352

On Tue, Nov 18, 2025 at 01:48:56PM +0300, Dan Carpenter wrote:

Hi Dan,

Thank you for pointing out the issue and for providing the fix.

You're absolutely correct that using an unsigned type for alarm_irq
prevents proper error handling when platform_get_irq() returns a
negative value. I will apply your patch and also review other return
value checks to ensure there are no similar issues elsewhere.

Thank you again for your detailed review and suggestions.

Best regards,
CL

> 
> The "atcrtc_dev->alarm_irq" variable is an unsigned int but it needs to
> be signed for the error handling to work.  Use the "ret" variable
> instead.
> 
> Fixes: 7adca706fe16 ("rtc: atcrtc100: Add ATCRTC100 RTC driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/rtc/rtc-atcrtc100.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-atcrtc100.c b/drivers/rtc/rtc-atcrtc100.c
> index 51933ae1a2fa..9808fc2c5a49 100644
> --- a/drivers/rtc/rtc-atcrtc100.c
> +++ b/drivers/rtc/rtc-atcrtc100.c
> @@ -296,10 +296,12 @@ static int atcrtc_probe(struct platform_device *pdev)
>                                      "Failed to initialize RTC: unsupported hardware ID 0x%x\n",
>                                      rtc_id);
> 
> -       atcrtc_dev->alarm_irq = platform_get_irq(pdev, 1);
> -       if (atcrtc_dev->alarm_irq < 0)
> -               return dev_err_probe(&pdev->dev, atcrtc_dev->alarm_irq,
> +       ret = platform_get_irq(pdev, 1);
> +       if (ret < 0)
> +               return dev_err_probe(&pdev->dev, ret,
>                                      "Failed to get IRQ for alarm\n");
> +       atcrtc_dev->alarm_irq = ret;
> +
>         ret = devm_request_irq(&pdev->dev,
>                                atcrtc_dev->alarm_irq,
>                                atcrtc_alarm_isr,
> --
> 2.51.0
> 

