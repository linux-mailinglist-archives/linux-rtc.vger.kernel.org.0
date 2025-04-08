Return-Path: <linux-rtc+bounces-3824-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 563E8A7F4D5
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Apr 2025 08:15:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF90517A079
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Apr 2025 06:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3A2025F7B8;
	Tue,  8 Apr 2025 06:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pWMP7Rkk"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A810825F78A;
	Tue,  8 Apr 2025 06:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744092881; cv=none; b=SWcmS8FHOAyk8Yu6ZJgytb9UtmIIRkHLf32g1VbmmEXLi8sUMmqclwf9KtY1xa8wCdZPFrDVFlIUapWH4adpJdmsL7+/UsYVbvah7aEOiykcUaC2fO0a5QVAapvbwG3ufXwGq/VNUlcVxPdYohCXtML3EsFOzNWUAD80jJunjaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744092881; c=relaxed/simple;
	bh=Elost/Mp9LOpFMKw3ECQbchp60Pk4nCo9BS25BLcjU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ElfD6D5KX6LOHY/EemIbRV8CjrOP0y20MhG0x6CowHYdGBbBq0D6CRpO/JPN8WXdPWtWg1+gecplhZ+fk9rtyaLq97WtT3UuDXALM+FalW55sgOVE0pbVuMMkOzvDryajAQ4e6ZhxiTfd6Beu24y7uPJlRuxpF8JUtFNxs5wNXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pWMP7Rkk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A4B4C4CEE5;
	Tue,  8 Apr 2025 06:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744092881;
	bh=Elost/Mp9LOpFMKw3ECQbchp60Pk4nCo9BS25BLcjU4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pWMP7RkkRXBj3iOjr+ovwvSgOp4FFHgerx1RnHwODEiR3AgLM+w0mf+UUYwLON62l
	 JVVpZDYQX4F9QoQEDYeB7PTh+Sjxv2NzSf3RHvkdsO1gnXPmJ6xVNuFb0yVpUrcYU4
	 3bs7drxCNOB1Pv82XMtb31lk3Ebz9CCZOhE/KMNZv52a4pbnFHwcUZsYF7l4lbE/TU
	 crWkcaA29U8raafRaQZcb8tg8KH7XxTIG9tIQR8mbMO7IbESnaxUjMU+RIa8xC0EMS
	 QtXjv4P8e/bUvEoEVY5QDZEVAQESGqSZn+oAh7PTrP5WNzt5f5pnOur57osM+kekPr
	 e6AEffvFIHL7g==
Message-ID: <b42d082e-0568-4d2c-849c-a0b9ab762afd@kernel.org>
Date: Tue, 8 Apr 2025 08:14:36 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] rtc: pcf85063: add support for RV8063
To: Antoni Pokusinski <apokusinski01@gmail.com>,
 alexandre.belloni@bootlin.com, krzk+dt@kernel.org, conor+dt@kernel.org,
 robh@kernel.org, alexander.stein@ew.tq-group.com
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250407193521.634807-1-apokusinski01@gmail.com>
 <20250407193521.634807-3-apokusinski01@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250407193521.634807-3-apokusinski01@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/04/2025 21:35, Antoni Pokusinski wrote:
> Microcrystal RV8063 is a real-time clock with SPI interface. Its
> functionality is very similar to the RV8263 rtc.
> 
> Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
> ---
>  drivers/rtc/Kconfig        | 21 ++++++-----
>  drivers/rtc/rtc-pcf85063.c | 74 +++++++++++++++++++++++++++++++++++++-
>  2 files changed, 85 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 838bdc138ffe..1b9be96faa13 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -483,15 +483,6 @@ config RTC_DRV_PCF8523
>  	  This driver can also be built as a module. If so, the module
>  	  will be called rtc-pcf8523.
>  
> -config RTC_DRV_PCF85063
> -	tristate "NXP PCF85063"
> -	select REGMAP_I2C
> -	help
> -	  If you say yes here you get support for the PCF85063 RTC chip
> -
> -	  This driver can also be built as a module. If so, the module
> -	  will be called rtc-pcf85063.
> -
>  config RTC_DRV_PCF85363
>  	tristate "NXP PCF85363"
>  	select REGMAP_I2C
> @@ -971,6 +962,18 @@ config RTC_DRV_PCF2127
>  	  This driver can also be built as a module. If so, the module
>  	  will be called rtc-pcf2127.
>  
> +config RTC_DRV_PCF85063

Why? This breaks the order.

> +	tristate "NXP PCF85063"
> +	depends on RTC_I2C_AND_SPI
> +	select REGMAP_I2C if I2C
> +	select REGMAP_SPI if SPI_MASTER
> +	help
> +	  If you say yes here you get support for the PCF85063 and RV8063
> +	  RTC chips.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called rtc-pcf85063.
> +


...

>  module_exit(pcf85063_exit);
> @@ -740,3 +811,4 @@ module_exit(pcf85063_exit);
>  MODULE_AUTHOR("Søren Andersen <san@rosetechnology.dk>");
>  MODULE_DESCRIPTION("PCF85063 RTC driver");
>  MODULE_LICENSE("GPL");
> +MODULE_ALIAS("spi:rv8063");

Drop and use proper ID tables.


Best regards,
Krzysztof

