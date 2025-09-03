Return-Path: <linux-rtc+bounces-4811-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDE7B423FB
	for <lists+linux-rtc@lfdr.de>; Wed,  3 Sep 2025 16:47:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4F903BCA76
	for <lists+linux-rtc@lfdr.de>; Wed,  3 Sep 2025 14:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C81B92E92D1;
	Wed,  3 Sep 2025 14:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RpoJeYYf"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FFD1EA7E4
	for <linux-rtc@vger.kernel.org>; Wed,  3 Sep 2025 14:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756910861; cv=none; b=lmy4OyHhh2f3FS79Xpqg/+Ye8HZdjMstREAleUVI5oOCw1wcTklO1yBFKk91FAH6hHDA2+mcP19V8Oe4Gb/glfhlrkE7tUbKgRlN1orvx8IJTsLnCrSEQSVZG7yH5rH24VWesR09JxKGfXRjTgY3afALpdKLrrsN9LFCEakh934=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756910861; c=relaxed/simple;
	bh=uIiHVfgXcBHll4tp5RO1iUvvwxGAS287ADmVmicJIzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kPuuVsBh6P2mj/sO1X3Gt8SFdH+uvRcgBWcXpd5D6zoW2b5m2w6PZ9Jxn4cCz5GaUDgX53zvwiWxBNm54TJO1o5ktgdKsGtMQ6hWgtSIAfIzfLFR8XYwNjzSoyBJSZPhh6ylEG/z5Nt6q/oCGdC/epSz0YT8HGKPGJICGE7x/Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RpoJeYYf; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A936B4E40C09;
	Wed,  3 Sep 2025 14:47:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 80808606C3;
	Wed,  3 Sep 2025 14:47:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1BC6A1C22D933;
	Wed,  3 Sep 2025 16:47:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756910855; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=ujR0yYZ5vFQl06mtsamsbnkJePIHaLtqM3Tp5y6BL2U=;
	b=RpoJeYYf/ZHQRw1WFqCDTpBR6Tqg5/1v1LPVh9t0KkpFMj6ZUT+1o1EB987g4ZG6jaF5NZ
	Dm0I6Cdw8RRBspPKZ+ihoaeGMqbkoLI26dcFg6h9Y+3IAMpgrMUPipQnHNPRy+qfKbf42O
	wksiz8pIqvPkYuIz67rDkTvvUZMqu62Drro8GVFdbJhSo8DasJhqHsWE+DQ68I8pFNT6zT
	HbSjAJqnVcpPP5MMY5rLxU8dm+GBQewjQ2ClnRzN8B8NxkYNdjyT3XjoONXIS2d3TyyN8z
	cq3jekRx+zTS95mLK+Y8UY5pk4/XqCSXhRhZuhOqLiH5Yd1+/cG/tILaT4om7Q==
Date: Wed, 3 Sep 2025 16:47:23 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org,
	skhan@linuxfoundation.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	akhileshpatilvnit@gmail.com
Subject: Re: [PATCH 5/7] rtc: m41t93: fix device connection/detection logic
 during probe
Message-ID: <2025090314472377b79cdf@mail.local>
References: <cover.1756908788.git.akhilesh@ee.iitb.ac.in>
 <c3deec9e679cd4e4a49a2cc1cba340c552faefdc.1756908788.git.akhilesh@ee.iitb.ac.in>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3deec9e679cd4e4a49a2cc1cba340c552faefdc.1756908788.git.akhilesh@ee.iitb.ac.in>
X-Last-TLS-Session-Version: TLSv1.3

On 03/09/2025 19:57:21+0530, Akhilesh Patil wrote:
> Fix the incorrect assumption about WDAY register (0x4) bits 3 to 7
> being 0 after initial power-on to test response from device during probe
> 
> Do not expect these bits to be 0 after power on as datasheet does not
> explicitly mention these power on defaults but recommends software to
> clear these bits during operation. Refer section 3.15 for initial
> power-on default bits.
> 
> Fix the random probe failures after power on by removing this condition
> check. Add alternate response check logic which performs write, read,
> compare check on device SRAM register to check device connection.
> 
> Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
> ---
>  drivers/rtc/rtc-m41t93.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-m41t93.c b/drivers/rtc/rtc-m41t93.c
> index 8cc179e08a4a..902797070246 100644
> --- a/drivers/rtc/rtc-m41t93.c
> +++ b/drivers/rtc/rtc-m41t93.c
> @@ -30,6 +30,7 @@
>  #define M41T93_BIT_A1IE                 BIT(7)
>  #define M41T93_BIT_ABE			BIT(5)
>  #define M41T93_FLAG_AF1                 BIT(6)
> +#define M41T93_SRAM_BASE		0x19
>  
>  
>  #define M41T93_REG_ALM_HOUR_HT		0xc
> @@ -290,17 +291,25 @@ static int m41t93_probe(struct spi_device *spi)
>  		return PTR_ERR(m41t93->regmap);
>  	}
>  
> -	ret = regmap_read(m41t93->regmap, M41T93_REG_WDAY, &res);
> -	if (ret < 0) {
> +	ret = regmap_write(m41t93->regmap, M41T93_SRAM_BASE, 0xA5);

Nope, probe is not called at RTC power on but when linux starts. The
whole point of the RTC is to survive Linux. Writing to this register is
breaking functionnality.

> +	if (ret) {
>  		dev_err(&spi->dev, "IO error\n");
>  		return -EIO;
>  	}
>  
> -	if (res < 0 || (res & 0xf8) != 0) {
> -		dev_err(&spi->dev, "not found 0x%x.\n", res);
> +	ret = regmap_read(m41t93->regmap, M41T93_SRAM_BASE, &res);
> +	if (ret) {
> +		dev_err(&spi->dev, "IO error\n");
> +		return -EIO;
> +	}
> +
> +	if (res != 0xA5) {
> +		dev_err(&spi->dev, "No valid response from device 0x%x.\n", res);
>  		return -ENODEV;
>  	}
>  
> +	dev_notice(&spi->dev, "m41t93 device response success\n");
> +

This is too verbose.

>  	spi_set_drvdata(spi, m41t93);
>  
>  	m41t93->rtc = devm_rtc_device_register(&spi->dev, m41t93_driver.driver.name,
> -- 
> 2.34.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

