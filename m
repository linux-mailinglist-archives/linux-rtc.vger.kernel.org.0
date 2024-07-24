Return-Path: <linux-rtc+bounces-1572-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8CF93B32A
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jul 2024 16:54:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8190C281D3D
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jul 2024 14:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD3F415B14E;
	Wed, 24 Jul 2024 14:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y8w/ulxe"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C3115B12F;
	Wed, 24 Jul 2024 14:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721832827; cv=none; b=uRsPGAK8ucUKrKEZJvWVCHc3by50Ht41MMtSY0g1jAL68B9eRaRtOwzSCA2fZkOBPmUjVrp4Toepqt6Gk6sDTJjAsniPc8bMh1DlryapKa7F8VsmRqoRU/i6EINPAlurCd/gAEJlsWicanrgsYGSnCDSsuG4Rm41ab2KfqemtyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721832827; c=relaxed/simple;
	bh=EhGs3QHFWEAF4yCV+iWV8W/2NsVyT7nTpnaTm8KpojA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n4TPLW3PoBoV2oagfvfpPaMMks5mgeTg8fcgHsiI/qHHlnZmoNU9UnBZjBunN5jF1GKwxKO776+wDQ8mEmFRnNOGDZMyfU5kevFlykUQnfkL6f8BgwbBgbgrqV8OTV//Avq+suIXhSi00VpglV7oP0ampzDkPhjJpEx4m3DDZsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y8w/ulxe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE0E0C32781;
	Wed, 24 Jul 2024 14:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721832827;
	bh=EhGs3QHFWEAF4yCV+iWV8W/2NsVyT7nTpnaTm8KpojA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y8w/ulxe88J1URS6wQyFwZkVk96GQDqEdMvZ/kNvD5gdyiNEYnmjJpdp3UfGhJaO1
	 ep0Wa8g0j2Rcto37s2A1/9Vsh4PodRY3AelZyYEARm5OOIH4OSWPLgaElb9FYPgRYA
	 wf2gEc8rjccb2jqMqDvjnzjKe5Zr0G1fU5aHjfCv1rlsLJ3V1gINaoc1+2Ku6b6YUM
	 lc1UiY3+ugOFBLyDazhUrEB5XtjAdAwZjfuh9UEI+N4VQElhqL1RQEzkOJTRqyusj5
	 Ss28XcUpzbYB4BrvWqE7syKnqiySR/RjW1SBbJO8bYUEMm3dNSyYBtrfoD35h91M0h
	 TwkxB5OIhh1SA==
Date: Wed, 24 Jul 2024 15:53:40 +0100
From: Lee Jones <lee@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	alexandre.belloni@bootlin.com, geert+renesas@glider.be,
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org,
	p.zabel@pengutronix.de, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v2 02/11] mfd: renesas-vbattb: Add a MFD driver for the
 Renesas VBATTB IP
Message-ID: <20240724145340.GZ501857@google.com>
References: <20240716103025.1198495-1-claudiu.beznea.uj@bp.renesas.com>
 <20240716103025.1198495-3-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240716103025.1198495-3-claudiu.beznea.uj@bp.renesas.com>

On Tue, 16 Jul 2024, Claudiu wrote:

> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Renesas VBATTB IP has logic to control the RTC clock, tamper detection
> and a small 128B memory. Add a MFD driver to do the basic initialization
> of the VBATTB IP for the inner components to work.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
> 
> Changes in v2:
> - none; this driver is new
> 
>  drivers/mfd/Kconfig          |  8 ++++
>  drivers/mfd/Makefile         |  1 +
>  drivers/mfd/renesas-vbattb.c | 78 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 87 insertions(+)
>  create mode 100644 drivers/mfd/renesas-vbattb.c
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index bc8be2e593b6..df93e8b05065 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1383,6 +1383,14 @@ config MFD_SC27XX_PMIC
>  	  This driver provides common support for accessing the SC27xx PMICs,
>  	  and it also adds the irq_chip parts for handling the PMIC chip events.
>  
> +config MFD_RENESAS_VBATTB
> +	tristate "Renesas VBATTB driver"
> +	depends on (ARCH_RZG2L && OF) || COMPILE_TEST
> +	select MFD_CORE
> +	help
> +	  Select this option to enable Renesas RZ/G3S VBATTB driver which
> +	  provides support for the RTC clock, tamper detector and 128B SRAM.
> +
>  config RZ_MTU3
>  	tristate "Renesas RZ/G2L MTU3a core driver"
>  	depends on (ARCH_RZG2L && OF) || COMPILE_TEST
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 02b651cd7535..cd2f27492df2 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -186,6 +186,7 @@ pcf50633-objs			:= pcf50633-core.o pcf50633-irq.o
>  obj-$(CONFIG_MFD_PCF50633)	+= pcf50633.o
>  obj-$(CONFIG_PCF50633_ADC)	+= pcf50633-adc.o
>  obj-$(CONFIG_PCF50633_GPIO)	+= pcf50633-gpio.o
> +obj-$(CONFIG_MFD_RENESAS_VBATTB)	+= renesas-vbattb.o
>  obj-$(CONFIG_RZ_MTU3)		+= rz-mtu3.o
>  obj-$(CONFIG_ABX500_CORE)	+= abx500-core.o
>  obj-$(CONFIG_MFD_DB8500_PRCMU)	+= db8500-prcmu.o
> diff --git a/drivers/mfd/renesas-vbattb.c b/drivers/mfd/renesas-vbattb.c
> new file mode 100644
> index 000000000000..5d71565b8cbf
> --- /dev/null
> +++ b/drivers/mfd/renesas-vbattb.c
> @@ -0,0 +1,78 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * VBATTB driver
> + *
> + * Copyright (C) 2024 Renesas Electronics Corp.
> + */
> +
> +#include <linux/mod_devicetable.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/reset.h>
> +
> +static int vbattb_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct reset_control *rstc;
> +	int ret;
> +
> +	rstc = devm_reset_control_array_get_exclusive(dev);
> +	if (IS_ERR(rstc))
> +		return PTR_ERR(rstc);
> +
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = reset_control_deassert(rstc);
> +	if (ret)
> +		goto rpm_put;
> +
> +	platform_set_drvdata(pdev, rstc);

Where is this consumed?

> +	ret = devm_of_platform_populate(dev);


Which devices will this probe?

> +	if (ret)
> +		goto reset_assert;
> +
> +	return 0;
> +
> +reset_assert:
> +	reset_control_assert(rstc);
> +rpm_put:
> +	pm_runtime_put(dev);
> +	return ret;
> +}
> +
> +static void vbattb_remove(struct platform_device *pdev)
> +{
> +	struct reset_control *rstc = platform_get_drvdata(pdev);
> +
> +	reset_control_assert(rstc);
> +	pm_runtime_put(&pdev->dev);
> +}
> +
> +static const struct of_device_id vbattb_match[] = {
> +	{ .compatible = "renesas,r9a08g045-vbattb" },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, vbattb_match);
> +
> +static struct platform_driver vbattb_driver = {
> +	.probe = vbattb_probe,
> +	.remove_new = vbattb_remove,
> +	.driver = {
> +		.name = "renesas-vbattb",
> +		.of_match_table = vbattb_match,
> +	},
> +};
> +module_platform_driver(vbattb_driver);
> +
> +MODULE_ALIAS("platform:renesas-vbattb");
> +MODULE_AUTHOR("Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>");
> +MODULE_DESCRIPTION("Renesas VBATTB driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.39.2
> 

-- 
Lee Jones [李琼斯]

