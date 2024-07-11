Return-Path: <linux-rtc+bounces-1476-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8725292E99A
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Jul 2024 15:34:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3188E281161
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Jul 2024 13:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DCB81607A7;
	Thu, 11 Jul 2024 13:33:56 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7B114CE09;
	Thu, 11 Jul 2024 13:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720704836; cv=none; b=DW95i0rF8bpUykCLmNTCcOXJYcTOKXKDRK9crPQAOL86kzIQZoQ1qtAG+htDba1Sm6VFZ/yaDhrLe8UjN5CPkIMEgfr98bbnCMaRJeF0c1HXwac9lKyGwu8e4Q8RDs8aGox8Fh5gb0b5Wu7hkJQnk5mhfij+mpMTt0SAQ5owwuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720704836; c=relaxed/simple;
	bh=G0Y5MS/fG5nofaxo9KxIn5gYLBj3YWsywp6BEyBcgac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aOARDFiSLkvEuxUnt5/PeJ/ZGyxdpJlelKM8J8E7z2Zw20ZpkjnquZoIQp01Qm3z5RCj2oMuYwX3C/FoigamOaNqMTdEmiIMqLZgdSBWJLYEvGTuuVgNBj/X44f2REPSXS5NCaFOuWekDcZKAIMQ8iHv8hrg2e+3YvmmnHWiKis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 508CAFEC;
	Thu, 11 Jul 2024 06:34:19 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F8523F766;
	Thu, 11 Jul 2024 06:33:49 -0700 (PDT)
Date: Thu, 11 Jul 2024 14:33:39 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v5 5/7] firmware: imx: add i.MX95 MISC driver
Message-ID: <Zo_fM8c485SSnTDF@pluto>
References: <20240621-imx95-bbm-misc-v2-v5-0-b85a6bf778cb@nxp.com>
 <20240621-imx95-bbm-misc-v2-v5-5-b85a6bf778cb@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621-imx95-bbm-misc-v2-v5-5-b85a6bf778cb@nxp.com>

On Fri, Jun 21, 2024 at 03:04:40PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The i.MX95 System manager exports SCMI MISC protocol for linux to do
> various settings, such as set board gpio expander as wakeup source.
> 
> The driver is to add the support.
> 

Hi,

a small style nitpick down below.

Other than that,

LGTM.
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/firmware/imx/Kconfig    |  11 ++++
>  drivers/firmware/imx/Makefile   |   1 +
>  drivers/firmware/imx/sm-misc.c  | 119 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/firmware/imx/sm.h |  33 +++++++++++
>  4 files changed, 164 insertions(+)
> 
> diff --git a/drivers/firmware/imx/Kconfig b/drivers/firmware/imx/Kconfig
> index 183613f82a11..477d3f32d99a 100644
> --- a/drivers/firmware/imx/Kconfig
> +++ b/drivers/firmware/imx/Kconfig
> @@ -22,3 +22,14 @@ config IMX_SCU
>  
>  	  This driver manages the IPC interface between host CPU and the
>  	  SCU firmware running on M4.
> +
> +config IMX_SCMI_MISC_DRV
> +	tristate "IMX SCMI MISC Protocol driver"
> +	depends on IMX_SCMI_MISC_EXT || COMPILE_TEST
> +	default y if ARCH_MXC
> +	help
> +	  The System Controller Management Interface firmware (SCMI FW) is
> +	  a low-level system function which runs on a dedicated Cortex-M
> +	  core that could provide misc functions such as board control.
> +
> +	  This driver can also be built as a module.
> diff --git a/drivers/firmware/imx/Makefile b/drivers/firmware/imx/Makefile
> index 8f9f04a513a8..8d046c341be8 100644
> --- a/drivers/firmware/imx/Makefile
> +++ b/drivers/firmware/imx/Makefile
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_IMX_DSP)		+= imx-dsp.o
>  obj-$(CONFIG_IMX_SCU)		+= imx-scu.o misc.o imx-scu-irq.o rm.o imx-scu-soc.o
> +obj-${CONFIG_IMX_SCMI_MISC_DRV}	+= sm-misc.o
> diff --git a/drivers/firmware/imx/sm-misc.c b/drivers/firmware/imx/sm-misc.c
> new file mode 100644
> index 000000000000..342e1254a356
> --- /dev/null
> +++ b/drivers/firmware/imx/sm-misc.c
> @@ -0,0 +1,119 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2024 NXP
> + */
> +
> +#include <linux/firmware/imx/sm.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/scmi_protocol.h>
> +#include <linux/scmi_imx_protocol.h>
> +
> +static const struct scmi_imx_misc_proto_ops *imx_misc_ctrl_ops;
> +static struct scmi_protocol_handle *ph;
> +struct notifier_block scmi_imx_misc_ctrl_nb;
> +
> +int scmi_imx_misc_ctrl_set(u32 id, u32 val)
> +{
> +	if (!ph)
> +		return -EPROBE_DEFER;
> +
> +	return imx_misc_ctrl_ops->misc_ctrl_set(ph, id, 1, &val);
> +};
> +EXPORT_SYMBOL(scmi_imx_misc_ctrl_set);
> +
> +int scmi_imx_misc_ctrl_get(u32 id, u32 *num, u32 *val)
> +{
> +	if (!ph)
> +		return -EPROBE_DEFER;
> +
> +	return imx_misc_ctrl_ops->misc_ctrl_get(ph, id, num, val);
> +}
> +EXPORT_SYMBOL(scmi_imx_misc_ctrl_get);
> +
> +static int scmi_imx_misc_ctrl_notifier(struct notifier_block *nb,
> +				       unsigned long event, void *data)
> +{
> +	/*
> +	 * notifier_chain_register requires a valid notifier_block and
> +	 * valid notifier_call. SCMI_EVENT_IMX_MISC_CONTROL is needed
> +	 * to let SCMI firmware enable control events, but the hook here
> +	 * is just a dummy function to avoid kernel panic as of now.
> +	 */
> +	return 0;
> +}
> +
> +static int scmi_imx_misc_ctrl_probe(struct scmi_device *sdev)
> +{
> +	const struct scmi_handle *handle = sdev->handle;
> +	struct device_node *np = sdev->dev.of_node;
> +	u32 src_id, flags;
> +	int ret, i, num;
> +
> +	if (!handle)
> +		return -ENODEV;
> +
> +	if (imx_misc_ctrl_ops) {
> +		dev_err(&sdev->dev, "misc ctrl already initialized\n");
> +		return -EEXIST;
> +	}
> +
> +	imx_misc_ctrl_ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_IMX_MISC, &ph);
> +	if (IS_ERR(imx_misc_ctrl_ops))
> +		return PTR_ERR(imx_misc_ctrl_ops);
> +
> +	num = of_property_count_u32_elems(np, "nxp,ctrl-ids");
> +	if (num % 2) {
> +		dev_err(&sdev->dev, "Invalid wakeup-sources\n");
> +		return -EINVAL;
> +	}
> +
> +	scmi_imx_misc_ctrl_nb.notifier_call = &scmi_imx_misc_ctrl_notifier;
> +	for (i = 0; i < num; i += 2) {
> +		ret = of_property_read_u32_index(np, "nxp,ctrl-ids", i, &src_id);
> +		if (ret) {
> +			dev_err(&sdev->dev, "Failed to read ctrl-id: %i\n", i);
> +			continue;
> +		}
> +
> +		ret = of_property_read_u32_index(np, "nxp,ctrl-ids", i + 1, &flags);
> +		if (ret) {
> +			dev_err(&sdev->dev, "Failed to read ctrl-id value: %d\n", i + 1);
> +			continue;
> +		}
> +
> +		ret = handle->notify_ops->devm_event_notifier_register(sdev, SCMI_PROTOCOL_IMX_MISC,
> +								       SCMI_EVENT_IMX_MISC_CONTROL,
> +								       &src_id,
> +								       &scmi_imx_misc_ctrl_nb);
> +		if (ret)

missing {
		dev_err(&sdev->dev, "Failed to register scmi misc event: %d\n", src_id);

	}


Thanks,
Cristian

