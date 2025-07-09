Return-Path: <linux-rtc+bounces-4446-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC7EAFF1EE
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Jul 2025 21:37:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19EA43BEFC5
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Jul 2025 19:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40F4F23B614;
	Wed,  9 Jul 2025 19:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X208eXa1"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F101EDA2F;
	Wed,  9 Jul 2025 19:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752089847; cv=none; b=sx74ezb0j+wtWvQcxRLTPdTTeu3kUH8nnQe+4PN8sborzM+1mjOlQsClxGIMpLLfGqRqAYkTe7OHvnJwWuZlbuLsedwu0DUHQI3g2yBPQZgZ5OnT6hwn/n+fTmN5XnLIf8NZ92SjuRFEBuS8fMrxf+0whLf6G/ld5CgS18kQFa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752089847; c=relaxed/simple;
	bh=5TAy1CJ6PgVUXJPq1NIn4jwcsuO+cVyf0liE1fZ5cyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kaUF8sFJMk0hun+4KZegZQtohdiuV5+1rJ8pAQwZa4oATE4ve5P/WVPXeH4lfbdpuc25TD3iXtn1L2q/I3QrzUL+xK+xChZPfZ4WBeeAxB5Aw3nKoVzwJmQ15zXQUoUechPlTGJ3Hy9UHUxJHHnbmI2zimzMR+HUp0J+EnnsclM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X208eXa1; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-454aaade1fbso2218975e9.3;
        Wed, 09 Jul 2025 12:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752089843; x=1752694643; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g6F7sBJOVYzaTZLPh0vr/ZEP7zbA5wl98nXj7vDhV+c=;
        b=X208eXa1IscPRjO8QJYXjPykMmGFzWfMEhBsK4WWpSuK5elHzfCqZcJoCHIT1KXBst
         yj65MFqp1Nvh4HnUB4HgprCrNRcldaHJctpbhjTSaroZ2SvK5ocJv7K4dHBd4RbXy0ka
         eN5MabYAwyd9+gALZyJRLOFDzcwxKiM5Z6Md1yjX2GNmvJHsGMLqhiXhIR2DubfCa9W6
         PzSVez3lTH4NRALYi52UsfwwBHyZHSGB/3YlYdKc3tMz95G6ZfVODJ1JrsQbV9OdPEdz
         P2yw9pBLImQZHOT1qPeebtnvoaEO57X4La0zXwyR4uSdxIY9LSIsktMqAqxNGrxamoI2
         M2DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752089843; x=1752694643;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g6F7sBJOVYzaTZLPh0vr/ZEP7zbA5wl98nXj7vDhV+c=;
        b=Ff5KQRGUCTM+8o0AKOve7Ev83PROs6BO2H3GuQCfbFN6NMCgkHGMoysndplnUJj557
         P/1ghWdQk0SQn0g8bgk7IVu+heHtSAzxTLypHP/Ea/JvIA3sNybgdTa5p2cIYqFuZjOE
         GA/95HpredWAintJcSDYMvS8O33CEBegHUiVr5cnWo6L+Sfh35JlFTjvDHl8TqqKBOHQ
         o6giJb8sv9TjaAI/Mb2gm7/Pt6SSBW0uRrmOO0HZpJ0Yx68slQk2vctr6xehXhiuNvN5
         fkiza0+G9CE0Jt/vXhOo1c7urgkaLx7xsMEpN6If1Xdx3+Un5w9C3oaSCfLKNA9YGrbv
         IUsw==
X-Forwarded-Encrypted: i=1; AJvYcCVysjIjC32rFonyEy5cLYU14CEG8wkI82ziG3xjAaDmAC0YY93M7GGLA81ykOTMPi9K9qjK8S7tUxJ9@vger.kernel.org, AJvYcCWngh+fiJpWXZNkQD+PGJu/sztebmsBydGD2sPk9ibphathUVdFoDKFYLmHj+3poHXKlVaFLah/QGQN@vger.kernel.org, AJvYcCX2Hznkvi9fiaYyTrCUQu+ni1nuGK9XRl95u/qX2O9jLKRR/F3YEXN9K+AJy6t1H43QdHhNqguFoTK7MR9l@vger.kernel.org
X-Gm-Message-State: AOJu0YzffhuijRR1TnHCZv419bunrU0jwkvS9KthpbPS8ksRfmoB/3Ge
	+vDZCexB2kyAYz2A2YIVACHQTBUJB5O0tix2KnLYHeo0Vc6zC8Q89APZ
X-Gm-Gg: ASbGnct0OT/X5o4woMujCnilEKymZMwEtCVJjG//5Hx2Tu4mJDwpDYu4i33P+44g0vO
	RWk+XcluC0siIbflAwRTDKYADSnEeQC+IWzv+fE+/QRM05RyLq+oVhNe5fU7RgilHUXOVIoIBQb
	xd7BlsRvXgJBSdbUupldP9onJCNzR3iVp+Mj9wul8SxFz3WKGqDA0nbj4AtRujf157CpzgFi+G9
	L9GwTOCF9cerAuuhWAk2tIF8f8MiWEaqtvidNfmBAuactvLzsK3MBRFCoIZQICYGtaEOsgpo6n+
	sjiJjM9uzukQMzV8GLAUVbWvnDvGs7YX9YQlN0mfOMx9l07+wuin8PYqIcXIDSt1B2DZFDkofsp
	/hcm1pR430qVbpEbOsbbOsYXGsO9I
X-Google-Smtp-Source: AGHT+IEsYVcmDAsCDSZyGG1DdYCl5yjNR3m+GC3uhIowkAfdCEjFdKVVXyfExMjO5LZEtyGND3fgSA==
X-Received: by 2002:a05:600c:314c:b0:43c:f44c:72a6 with SMTP id 5b1f17b1804b1-454d5311363mr38315545e9.2.1752089843343;
        Wed, 09 Jul 2025 12:37:23 -0700 (PDT)
Received: from antoni-VivoBook-ASUSLaptop-X512FAY-K512FA ([78.208.32.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d508cc8asm38903645e9.35.2025.07.09.12.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 12:37:22 -0700 (PDT)
Date: Wed, 9 Jul 2025 21:37:04 +0200
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: alexandre.belloni@bootlin.com
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org,
	alexander.stein@ew.tq-group.com, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND v4 3/3] rtc: pcf85063: add support for RV8063
Message-ID: <20250709193704.r7p6wkst3ydvdtqx@antoni-VivoBook-ASUSLaptop-X512FAY-K512FA>
References: <20250509183750.95836-1-apokusinski01@gmail.com>
 <20250509183750.95836-4-apokusinski01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250509183750.95836-4-apokusinski01@gmail.com>

Hello,
Since there was no feedback for this patch I'd like to send a reminder here.
Is there a chance that this patch series will get integrated into the mainline?

Kind regards,
Antoni Pokusinski

On Fri, May 09, 2025 at 08:37:50PM +0200, Antoni Pokusinski wrote:
> Microcrystal RV8063 is a real-time clock with SPI interface. Its
> functionality is very similar to the RV8263 rtc.
> 
> Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
> ---
>  drivers/rtc/Kconfig        | 21 +++++----
>  drivers/rtc/rtc-pcf85063.c | 87 +++++++++++++++++++++++++++++++++++++-
>  2 files changed, 98 insertions(+), 10 deletions(-)
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
>  config RTC_DRV_RV3029C2
>  	tristate "Micro Crystal RV3029/3049"
>  	depends on RTC_I2C_AND_SPI
> diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
> index 03dfc58f4cd7..d9b67b959d18 100644
> --- a/drivers/rtc/rtc-pcf85063.c
> +++ b/drivers/rtc/rtc-pcf85063.c
> @@ -17,6 +17,7 @@
>  #include <linux/of.h>
>  #include <linux/pm_wakeirq.h>
>  #include <linux/regmap.h>
> +#include <linux/spi/spi.h>
>  
>  /*
>   * Information for this driver was pulled from the following datasheets.
> @@ -29,6 +30,9 @@
>   *
>   *  https://www.microcrystal.com/fileadmin/Media/Products/RTC/App.Manual/RV-8263-C7_App-Manual.pdf
>   *  RV8263 -- Rev. 1.0 — January 2019
> + *
> + *  https://www.microcrystal.com/fileadmin/Media/Products/RTC/App.Manual/RV-8063-C7_App-Manual.pdf
> + *  RV8063 -- Rev. 1.1 - October 2018
>   */
>  
>  #define PCF85063_REG_CTRL1		0x00 /* status */
> @@ -559,6 +563,18 @@ static const struct pcf85063_config config_rv8263 = {
>  	.force_cap_7000 = 1,
>  };
>  
> +static const struct pcf85063_config config_rv8063 = {
> +	.regmap = {
> +		.reg_bits = 8,
> +		.val_bits = 8,
> +		.max_register = 0x11,
> +		.read_flag_mask = BIT(7) | BIT(5),
> +		.write_flag_mask = BIT(5),
> +	},
> +	.has_alarms = 1,
> +	.force_cap_7000 = 1,
> +};
> +
>  static int pcf85063_probe(struct device *dev, struct regmap *regmap, int irq,
>  			  const struct pcf85063_config *config)
>  {
> @@ -725,14 +741,83 @@ static void pcf85063_unregister_driver(void)
>  
>  #endif /* IS_ENABLED(CONFIG_I2C) */
>  
> +#if IS_ENABLED(CONFIG_SPI_MASTER)
> +
> +static const struct spi_device_id rv8063_id[] = {
> +	{ "rv8063" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(spi, rv8063_id);
> +
> +static const struct of_device_id rv8063_of_match[] = {
> +	{ .compatible = "microcrystal,rv8063" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, rv8063_of_match);
> +
> +static int rv8063_probe(struct spi_device *spi)
> +{
> +	const struct pcf85063_config *config = &config_rv8063;
> +	struct regmap *regmap;
> +
> +	regmap = devm_regmap_init_spi(spi, &config->regmap);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	return pcf85063_probe(&spi->dev, regmap, spi->irq, config);
> +}
> +
> +static struct spi_driver rv8063_driver = {
> +	.driver         = {
> +		.name   = "rv8063",
> +		.of_match_table = rv8063_of_match,
> +	},
> +	.probe          = rv8063_probe,
> +	.id_table	= rv8063_id,
> +};
> +
> +static int __init rv8063_register_driver(void)
> +{
> +	return spi_register_driver(&rv8063_driver);
> +}
> +
> +static void __exit rv8063_unregister_driver(void)
> +{
> +	spi_unregister_driver(&rv8063_driver);
> +}
> +
> +#else
> +
> +static int __init rv8063_register_driver(void)
> +{
> +	return 0;
> +}
> +
> +static void __exit rv8063_unregister_driver(void)
> +{
> +}
> +
> +#endif /* IS_ENABLED(CONFIG_SPI_MASTER) */
> +
>  static int __init pcf85063_init(void)
>  {
> -	return pcf85063_register_driver();
> +	int ret;
> +
> +	ret = pcf85063_register_driver();
> +	if (ret)
> +		return ret;
> +
> +	ret = rv8063_register_driver();
> +	if (ret)
> +		pcf85063_unregister_driver();
> +
> +	return ret;
>  }
>  module_init(pcf85063_init);
>  
>  static void __exit pcf85063_exit(void)
>  {
> +	rv8063_unregister_driver();
>  	pcf85063_unregister_driver();
>  }
>  module_exit(pcf85063_exit);
> -- 
> 2.25.1
> 

