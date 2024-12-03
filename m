Return-Path: <linux-rtc+bounces-2660-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 086B99E1FB3
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Dec 2024 15:41:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8AF1DB29665
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Dec 2024 13:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BCAD1EE019;
	Tue,  3 Dec 2024 13:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gXxGUy3T"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C319224F0;
	Tue,  3 Dec 2024 13:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733232351; cv=none; b=KpsfVfa8bTZ9AlwOao6IhfyIN4M7eTYNvs0Yo3zRlWvNwD7dqAkDnD80c1u3SCFTJR4Vh/56JgjRMLmQukpHjJbDhUtMQIHZdyiQVni1seeOFiMtRQHySr11fNv/UVYF/kYKg44e/szkbs36lNbeVeW1JTuUMVYr5nEoKEDf9Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733232351; c=relaxed/simple;
	bh=x/Y8fX5yMGfvxlaB580F9geegXRxmC1pN/iHzBe8VZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bF7S5M/Ij4TPWcacB3EkPt2rTowUfuYO4xMTA8MAkvDt2FD/hZpimVouzXwQu34aiMe0XZshCxG/MfKdO80GMaIHQDiYmk9v4wSWtD06d1uDXb+RSUO62Y/hJw8Tjn5K+KBDs6vLJjoqW3kX2jK9f7ps3uGhcDPOAYTQ5s/QpmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gXxGUy3T; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 49835FF803;
	Tue,  3 Dec 2024 13:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733232341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WXLrd8ABNcSoG1qW8IbIWSc1U86lTtpYwQQ7tf8PS7M=;
	b=gXxGUy3TlyX+gEi+BKC7mldOYoyJZZF95bB7ImyGoWvuyLqwNDnIeORJb1JCPJpZkkE3FH
	ytcRAYM+s+EAcUCcd07TiDkWfrxUO1+i5PaSoBOGzwpJf3BV5ESv8D5z2shI8Vvngsw3rm
	W2xLp9IMI7f/bGmJlzTp+AT3YoBm18x1yGisqOZTy4LS+vcv4k0IFHH9/Ur+ZLDn6cukyN
	ncZn1iA9Z+G2inxyEv26vH8MU1GMwEcSkktBKd7dIsBfoOJngaueBHl7FPOG/EWXZHvXiH
	PS7L0C8i0XuifQrh/rpvQFrQOI1kURlH+1y+GNfPWgeP3q1b8RQy6iVb49ydtg==
Date: Tue, 3 Dec 2024 14:25:40 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Esben Haabendal <esben@geanix.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Patrice Chotard <patrice.chotard@foss.st.com>
Subject: Re: [PATCH 4/6] rtc: st-lpc: Fix initial enable_irq/disable_irq
 balance
Message-ID: <202412031325408acbe302@mail.local>
References: <20241203-rtc-uie-irq-fixes-v1-0-01286ecd9f3f@geanix.com>
 <20241203-rtc-uie-irq-fixes-v1-4-01286ecd9f3f@geanix.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203-rtc-uie-irq-fixes-v1-4-01286ecd9f3f@geanix.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 03/12/2024 11:45:34+0100, Esben Haabendal wrote:
> Interrupts are automatically enabled when requested, so we need to
> initialize irq_enabled accordingly to avoid causing an unbalanced enable
> warning.
> 
> To: Patrice Chotard <patrice.chotard@foss.st.com>
> Signed-off-by: Esben Haabendal <esben@geanix.com>
> ---
>  drivers/rtc/rtc-st-lpc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/rtc/rtc-st-lpc.c b/drivers/rtc/rtc-st-lpc.c
> index c6d4522411b312f94de2701ff4ff491e5323aa96..dbc2c23bca23f5de6de3fd4b39c9c67290bfd78d 100644
> --- a/drivers/rtc/rtc-st-lpc.c
> +++ b/drivers/rtc/rtc-st-lpc.c
> @@ -218,6 +218,7 @@ static int st_rtc_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
>  
> +	rtc->irq_enabled = true;
>  	ret = devm_request_irq(&pdev->dev, rtc->irq, st_rtc_handler,
>  			       IRQF_NO_AUTOEN, pdev->name, rtc);

Seeing the IRQF_NO_AUTOEN here, I guess the patch is not correct.

>  	if (ret) {
> 
> -- 
> 2.47.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

