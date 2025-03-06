Return-Path: <linux-rtc+bounces-3415-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AE0A53F2C
	for <lists+linux-rtc@lfdr.de>; Thu,  6 Mar 2025 01:32:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C260F18868D1
	for <lists+linux-rtc@lfdr.de>; Thu,  6 Mar 2025 00:32:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B77D41C69;
	Thu,  6 Mar 2025 00:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NRvSEAn4"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591C73CF58;
	Thu,  6 Mar 2025 00:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741221134; cv=none; b=Tj7hbsRGwJFnJg7m4n/f7YrKaSUS+lYV85qkn5cG0hjbVZCPZNYS0lovZpBbg3zCYdnw3jP593OH2dG8PpZp3Qhtow+nHvv8b0pcYtId9U+jXdAMtWbEd9yMbUnzg7Vn9vFO3W48g/8qrcRjT+830VCqHDDEOiNJyYK43zzLsYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741221134; c=relaxed/simple;
	bh=R4KqX0E4mpkohaWHx+uYZ/ddOOFMeKdtAnsPl1grY1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uqh4osqqH8wKRo5v7gNZ7sIADVlpZbRxC89vgTGATNlyNS1GxguKrceNRPBXwsa/Heabk3tv69zTZChwUSDi4aYi6Yoay76LlcQidPkYT+xMrrAmb8GYT+7B1kEsdkIym7wZOczHDnlVZp7Fu8lolb+6zfetU716Vf/rcNcAOTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NRvSEAn4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FB3EC4CED1;
	Thu,  6 Mar 2025 00:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741221133;
	bh=R4KqX0E4mpkohaWHx+uYZ/ddOOFMeKdtAnsPl1grY1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NRvSEAn4ItpuQqydCQhIGkZzJ/Y36MrDbOc0qr9x9B8ktMK6BOefvbXwKrzxGxSB/
	 cMgshWY5g3yrdg/uyj4o6jJcrqQgU7moo2siP9dwBI3LoVe0VkdWTVTguZXEGFaLTz
	 K51ZTLy+aREh93Udqau+bIbzLmKVmi3AK1YzPLgxMK3REz26vw0Il1cFVa/cQahrUQ
	 tQrollL2GBQkzpIGiqKaz0drr4Qe2D563StZI69/PNXrY3WFv4BnUhqaCaifH92zoh
	 lQclqERw9TpMrpMNhWQau79b2dWwyYPMuTMvurP5KjB5pNWeOWrhqhbD5GKT16R+e+
	 3+RNx/PS0bbBA==
Date: Wed, 5 Mar 2025 16:32:11 -0800
From: Lee Jones <lee@kernel.org>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-rtc@vger.kernel.org, Inochi Amaoto <inochiama@gmail.com>,
	dlan@gentoo.org, linux-kernel@vger.kernel.org,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	sophgo@lists.linux.dev
Subject: Re: [PATCH v12 2/3] mfd: sophgo: cv1800: rtcsys: New driver
 (handling RTC only)
Message-ID: <20250306003211.GA8350@google.com>
References: <20250302195205.3183174-1-alexander.sverdlin@gmail.com>
 <20250302195205.3183174-3-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250302195205.3183174-3-alexander.sverdlin@gmail.com>

On Sun, 02 Mar 2025, Alexander Sverdlin wrote:

> Add driver for Sophgo CV1800 series SoC RTC MFD. The RTC module comprises
> a 32kHz oscillator, Power-on-Reset (PoR) sub-module, HW state machine to
> control chip power-on, power-off and reset. Furthermore, the 8051 subsystem
> is located within RTCSYS including associated SRAM block.
> 
> This patch only populates RTC sub-device.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
> Changelog:
> v12:
> - new patch
> 
>  MAINTAINERS                 |  1 +
>  drivers/mfd/Kconfig         | 14 ++++++++
>  drivers/mfd/Makefile        |  1 +
>  drivers/mfd/cv1800-rtcsys.c | 66 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 82 insertions(+)
>  create mode 100644 drivers/mfd/cv1800-rtcsys.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 92fc0eca7061..446156998380 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22185,6 +22185,7 @@ M:	Chen Wang <unicorn_wang@outlook.com>
>  M:	Inochi Amaoto <inochiama@outlook.com>
>  T:	git https://github.com/sophgo/linux.git
>  S:	Maintained
> +F:	drivers/mfd/cv1800-rtcsys.c
>  N:	sophgo
>  K:	sophgo
>  
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 6b0682af6e32..842cc4d95c4b 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -285,6 +285,20 @@ config MFD_CS42L43_SDW
>  	  Select this to support the Cirrus Logic CS42L43 PC CODEC with
>  	  headphone and class D speaker drivers over SoundWire.
>  
> +config MFD_CV1800_RTCSYS
> +	tristate "Sophgo CV1800 RTC MFD"
> +	depends on ARCH_SOPHGO || COMPILE_TEST
> +	select MFD_CORE
> +	help
> +	  If you say yes here you get support the RTC MFD driver for Sophgo
> +	  CV1800 series SoC. The RTC module comprises a 32kHz oscillator,
> +	  Power-on-Reset (PoR) sub-module, HW state machine to control chip
> +	  power-on, power-off and reset. Furthermore, the 8051 subsystem is
> +	  located within RTCSYS including associated SRAM block.
> +
> +	  This driver can also be built as a module. If so, the module will be
> +	  called cv1800-rtcsys.
> +
>  config MFD_MADERA
>  	tristate "Cirrus Logic Madera codecs"
>  	select MFD_CORE
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 9220eaf7cf12..3cf03ffeedbb 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -18,6 +18,7 @@ obj-$(CONFIG_MFD_CROS_EC_DEV)	+= cros_ec_dev.o
>  obj-$(CONFIG_MFD_CS42L43)	+= cs42l43.o
>  obj-$(CONFIG_MFD_CS42L43_I2C)	+= cs42l43-i2c.o
>  obj-$(CONFIG_MFD_CS42L43_SDW)	+= cs42l43-sdw.o
> +obj-$(CONFIG_MFD_CV1800_RTCSYS)	+= cv1800-rtcsys.o
>  obj-$(CONFIG_MFD_ENE_KB3930)	+= ene-kb3930.o
>  obj-$(CONFIG_MFD_EXYNOS_LPASS)	+= exynos-lpass.o
>  obj-$(CONFIG_MFD_GATEWORKS_GSC)	+= gateworks-gsc.o
> diff --git a/drivers/mfd/cv1800-rtcsys.c b/drivers/mfd/cv1800-rtcsys.c
> new file mode 100644
> index 000000000000..72d11284f1de
> --- /dev/null
> +++ b/drivers/mfd/cv1800-rtcsys.c
> @@ -0,0 +1,66 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Driver for Sophgo CV1800 series SoC RTC MFD
> + *
> + * The RTC module comprises a 32kHz oscillator, Power-on-Reset (PoR) sub-module,
> + * HW state machine to control chip power-on, power-off and reset. Furthermore,
> + * the 8051 subsystem is located within RTCSYS including associated SRAM block.
> + *
> + * Copyright (C) 2025 Alexander Sverdlin <alexander.sverdlin@gmail.com>
> + *
> + */
> +
> +#include <linux/mfd/core.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/property.h>
> +
> +static struct resource cv1800_rtcsys_irq_resources[] = {
> +	DEFINE_RES_IRQ_NAMED(0, "alarm"),
> +};
> +
> +static const struct mfd_cell cv1800_rtcsys_subdev[] = {
> +	{
> +		.name = "cv1800-rtc",
> +		.num_resources = 1,
> +		.resources = &cv1800_rtcsys_irq_resources[0],
> +	},
> +};
> +
> +static const struct mfd_cell cv1800_rtcsys_rtc_subdev =
> +	MFD_CELL_NAME("cv1800-rtc");

How is this different from the one above?

Adding a single device does not constitute an MFD.

> +static int cv1800_rtcsys_probe(struct platform_device *pdev)
> +{
> +	int irq;
> +
> +	irq = platform_get_irq_byname(pdev, "alarm");
> +	if (irq < 0)
> +		return irq;
> +	cv1800_rtcsys_irq_resources[0].start = irq;
> +	cv1800_rtcsys_irq_resources[0].end = irq;
> +
> +	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
> +				    cv1800_rtcsys_subdev,
> +				    ARRAY_SIZE(cv1800_rtcsys_subdev),
> +				    NULL, 0, NULL);
> +}
> +
> +static const struct of_device_id cv1800_rtcsys_of_match[] = {
> +	{ .compatible = "sophgo,cv1800b-rtc" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, cv1800_rtcsys_of_match);
> +
> +static struct platform_driver cv1800_rtcsys_mfd = {
> +	.probe	= cv1800_rtcsys_probe,
> +	.driver	= {
> +		.name		= "cv1800_rtcsys",
> +		.of_match_table	= cv1800_rtcsys_of_match,
> +	},
> +};
> +module_platform_driver(cv1800_rtcsys_mfd);
> +
> +MODULE_AUTHOR("Alexander Sverdlin <alexander.sverdlin@gmail.com>");
> +MODULE_DESCRIPTION("Sophgo CV1800 series SoC RTC MFD driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.48.1
> 

-- 
Lee Jones [李琼斯]

