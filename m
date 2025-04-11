Return-Path: <linux-rtc+bounces-3938-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 338A5A86642
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Apr 2025 21:25:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33D8817FE38
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Apr 2025 19:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BB9027D774;
	Fri, 11 Apr 2025 19:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RFdeOe9u"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F941232395;
	Fri, 11 Apr 2025 19:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744399492; cv=none; b=TUkGxQ23O2ZweOmbiTB4ZPZuDAa+q/vV735sv339NJLISGwF1vA8dNOTcQ1EqlH3TVXCNid1uq5NLukeeRQuJjUVazCBa6ccJX19bC6xExIyN0Irfy+DW7ON2jBYohFxCiZGCQzO9uXjewKYwINPN9dtye7hU/2f2zK9dSDbmJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744399492; c=relaxed/simple;
	bh=9VMbXJK31PLZybTQVziy1hqetP2iBYbxW2h7Q6gWJrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KpTpaGVcd9v3KaQukYijw5qR2K4pez3ke73f2EXFsWcPfEGTCW1hyQuKalCtZL5xPJGOsrBgCi6cgO52TJna0YgtOsgItpLpSq30y0lIE6qmQX1JCXS1SARPmXEIdsdSA1vsaEf5GiJcEQ1pNtBC5N9OaUD4pMoca3U1A6Ckt88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RFdeOe9u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62F25C4CEE2;
	Fri, 11 Apr 2025 19:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744399491;
	bh=9VMbXJK31PLZybTQVziy1hqetP2iBYbxW2h7Q6gWJrk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RFdeOe9uMlrjVjPwwGP2lnKd5NszvMxaneyCw/ow9MxtqIYB1MMctkYVMiErM6aw6
	 KaLwZKJPge7fv3T/LsCCiNxzziZErcKQOd+t2OhGhFpvaGzDDpgVKJhFTSLv+7aq/i
	 VhSdy5bfLu2i6PdN2O2aQ2/4P+B10jPVaG1RISn0366H+FMQyyZODSwNXzzgo+28nf
	 k+kIaqM6NndPFh4Tqlm/FIcqu0lwj7lWbMjL5phi36Xgj4SDOHc0qCmVMbpOztvbVI
	 Bt9uCkCr68KTkGJGggvx93iWM1SX1FPvrZ0U+/2m4A9VzkJTqOvuW/KV2KZQDwgioW
	 36L9XMCRTz2gQ==
Date: Fri, 11 Apr 2025 14:24:50 -0500
From: Rob Herring <robh@kernel.org>
To: Antoni Pokusinski <apokusinski01@gmail.com>
Cc: alexandre.belloni@bootlin.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	alexander.stein@ew.tq-group.com, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/3] rtc: pcf85063: add support for RV8063
Message-ID: <20250411192450.GA3750226-robh@kernel.org>
References: <20250410202317.25873-1-apokusinski01@gmail.com>
 <20250410202317.25873-4-apokusinski01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250410202317.25873-4-apokusinski01@gmail.com>

On Thu, Apr 10, 2025 at 10:23:17PM +0200, Antoni Pokusinski wrote:
> Microcrystal RV8063 is a real-time clock with SPI interface. Its
> functionality is very similar to the RV8263 rtc.
> 
> Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
> ---
>  drivers/rtc/Kconfig        | 21 +++++-----
>  drivers/rtc/rtc-pcf85063.c | 80 +++++++++++++++++++++++++++++++++++++-
>  2 files changed, 91 insertions(+), 10 deletions(-)
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
> index 03dfc58f4cd7..bcfefe823044 100644
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
> @@ -725,14 +741,76 @@ static void pcf85063_unregister_driver(void)
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

You need the of_device_id table too.

Rob

