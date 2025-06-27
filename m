Return-Path: <linux-rtc+bounces-4383-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FE8AEB825
	for <lists+linux-rtc@lfdr.de>; Fri, 27 Jun 2025 14:51:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 094BE3AAB42
	for <lists+linux-rtc@lfdr.de>; Fri, 27 Jun 2025 12:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A63A02D3EEC;
	Fri, 27 Jun 2025 12:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EY1X793v"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A5D2BEC35;
	Fri, 27 Jun 2025 12:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751028686; cv=none; b=kvB2y2nOGrsrLBVSBo8GvrkTB8uCD1Z6bx8U2PwB6M6JP4GbvBvO0LwhfBe+xe7NmMs2y9MRuI/oQsW7RfKMuezv9/GhccFYuNR5siPqKX4lSO8Vh4yeuKe3f1JlFLljoN42dXUuKxpWCSkuVculcRl/oQWxSzVKZf6miB9/b48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751028686; c=relaxed/simple;
	bh=vkTWHdyY2LgTLEhdW6ywJcKCt9UErdA7gq50ddD4J7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o4W8zAfcKoT2n21niLyWR28MRLWfNgy/v7dztc5DowTtiVr76bo0AoLAPwANioNShWiu6lmJmw9hlGj+5mL1jpH9xziwWSsq/fiyyma6PnZ8VVsKRvC0Wo96prtp3jI0DPtKGZzRZXycuiA5Sw5Xh1mL5yJmIqVr4XqUkfDOsQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EY1X793v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD1F4C4CEE3;
	Fri, 27 Jun 2025 12:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751028686;
	bh=vkTWHdyY2LgTLEhdW6ywJcKCt9UErdA7gq50ddD4J7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EY1X793vtCOEYQVu60/1GWtMu/J/QR4ff5coXtHaO1S5KX6WWx1sz8cpC9H43vD92
	 PbDEyMg3DoFr6qAsB6Hc10WJTPqHvzt8umwtLBIX1gl2a5R3vaINtixLt9jZtacy38
	 WRbCMgIlkSnT8OWPnKsGZDgn/EziNXBzClIPsvxM+SEKHO8hwyCgtEOUvLC+qR7kYI
	 qBcNdQ127+NSLu3G/FW8GtY/PN5fOF5qObxDiUgfh4Tts28h32mOi4HzAABvUhHOJ1
	 Pw3p19wn+i9kRDjuDONH7oqhuXX5uPrkr7dQ135iWCKjcAab4aUXloJ+tnm9jz6Bya
	 gtHC0gMJMd1fQ==
Date: Fri, 27 Jun 2025 13:51:19 +0100
From: Lee Jones <lee@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, alexandre.belloni@bootlin.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	mat.jonczyk@o2.pl, dlan@gentoo.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	troymitchell988@gmail.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/7] mfd: simple-mfd-i2c: add SpacemiT P1 support
Message-ID: <20250627125119.GF10134@google.com>
References: <20250625164119.1068842-1-elder@riscstar.com>
 <20250625164119.1068842-3-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250625164119.1068842-3-elder@riscstar.com>

On Wed, 25 Jun 2025, Alex Elder wrote:

> Enable support for the RTC and regulators found in the SpacemiT P1
> PMIC.  Support is implemented by the simple I2C MFD driver.
> 
> The P1 PMIC is normally implemented with the SpacemiT K1 SoC.  This
> PMIC provides 6 buck converters and 12 LDO regulators.  It also
> implements a switch, watchdog timer, real-time clock, and more.
> Initially its RTC and regulators are supported.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
> v4: - Add a dependency on I2C, to avoid a CROSS_COMPILE build error
> 
>  drivers/mfd/Kconfig          | 11 +++++++++++
>  drivers/mfd/simple-mfd-i2c.c | 18 ++++++++++++++++++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 6fb3768e3d71c..01805c3eec57d 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1182,6 +1182,17 @@ config MFD_QCOM_RPM
>  	  Say M here if you want to include support for the Qualcomm RPM as a
>  	  module. This will build a module called "qcom_rpm".
>  
> +config MFD_SPACEMIT_P1
> +	tristate "SpacemiT P1 PMIC"
> +	depends on I2C
> +	select MFD_SIMPLE_MFD_I2C
> +	help
> +	  This option supports the I2C-based SpacemiT P1 PMIC, which
> +	  contains regulators, a power switch, GPIOs, an RTC, and more.
> +	  This option is selected when any of the supported sub-devices
> +	  is configured.  The basic functionality is implemented by the
> +	  simple MFD I2C driver.
> +
>  config MFD_SPMI_PMIC
>  	tristate "Qualcomm SPMI PMICs"
>  	depends on ARCH_QCOM || COMPILE_TEST
> diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
> index 22159913bea03..026cd92e20ad3 100644
> --- a/drivers/mfd/simple-mfd-i2c.c
> +++ b/drivers/mfd/simple-mfd-i2c.c
> @@ -93,12 +93,30 @@ static const struct simple_mfd_data maxim_mon_max77705 = {
>  	.mfd_cell_size = ARRAY_SIZE(max77705_sensor_cells),
>  };
>  
> +static const struct regmap_config spacemit_p1_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = 0xaa,
> +};

Suggest making this more widely useful by adding the 'max_register'
attribute to 'struct simple_mfd' and conditionally overriding
regmap_config_8r_8v's value during probe.

> +static const struct mfd_cell spacemit_p1_cells[] = {
> +	{ .name = "spacemit-p1-regulator", },
> +	{ .name = "spacemit-p1-rtc", },
> +};
> +
> +static const struct simple_mfd_data spacemit_p1 = {
> +	.regmap_config = &spacemit_p1_regmap_config,
> +	.mfd_cell = spacemit_p1_cells,
> +	.mfd_cell_size = ARRAY_SIZE(spacemit_p1_cells),
> +};
> +
>  static const struct of_device_id simple_mfd_i2c_of_match[] = {
>  	{ .compatible = "kontron,sl28cpld" },
>  	{ .compatible = "silergy,sy7636a", .data = &silergy_sy7636a},
>  	{ .compatible = "maxim,max5970", .data = &maxim_max5970},
>  	{ .compatible = "maxim,max5978", .data = &maxim_max5970},
>  	{ .compatible = "maxim,max77705-battery", .data = &maxim_mon_max77705},
> +	{ .compatible = "spacemit,p1", .data = &spacemit_p1, },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, simple_mfd_i2c_of_match);
> -- 
> 2.45.2
> 

-- 
Lee Jones [李琼斯]

