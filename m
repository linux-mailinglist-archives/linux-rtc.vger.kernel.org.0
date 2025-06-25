Return-Path: <linux-rtc+bounces-4351-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 931C2AE817A
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Jun 2025 13:37:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5341A3AD4F3
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Jun 2025 11:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 775D82DA744;
	Wed, 25 Jun 2025 11:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oGkAowJz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1212C2ACE;
	Wed, 25 Jun 2025 11:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750850963; cv=none; b=NJFBN5z9Aag8aV3pq+d8gZ0gOWZ5ZRCAgCJoYUmzq+uTI+syRC7r0eEQoSH6wYYMte80/n1cR8uIM9XuZQ3pAGtadjbobmKMp9JhxJfqAlCXjWD8wRtEhvh9QWCVTIf9Tr3LBug8SLLa+qA8hxrJpGOzMvVYblAO3QM3Jy4miKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750850963; c=relaxed/simple;
	bh=CcWYS6fKwMpfwwV3JsNJq0FJ07VqNzGU5p6m3hA9+RA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a5J99N1BdWYBy7QbjnGxg+4/c4RmS7o8Xf5v0lSbcdJVc5bRhbtEc7UwrvQTbYCbvYGAbxuihVKF7uyadccir+utwfAi23X4Ue8wsGcNB6DL80n2cl5F/FZKAHZzSUlPesleGTFMYZXKQBQrgLJngVaVeLrS3GAxSdaiIs5Vnj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oGkAowJz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CCF3C4CEEA;
	Wed, 25 Jun 2025 11:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750850962;
	bh=CcWYS6fKwMpfwwV3JsNJq0FJ07VqNzGU5p6m3hA9+RA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oGkAowJzjZpzsbecACapkEVOBa2ryl01cMiiCPmJ5abjPtHSlnaRypjdKysZl32hz
	 uRm4adx+N5JMZlQqJaFT0mCkNIoG7xOwXos0ZRnFxBFCx3bJhAcJC+0nmGGbEUCNwH
	 SdjPlldScLx+wZ+OtjLjf/A17H+idis+alqkP10+YPep9EXI5TJ2ji/xd/G6LZQepx
	 Q7qyMJSeyejpmrsT2l4FUhewIra1Mkn4QG3mm9ZuNDX/uzaJukFMDFh1n45UlWNz2F
	 jgHk8ygJZoSPuYfcITambrQ+1chiIsyka5UDRZJp/Y8HkCp0PtBCUsww79JA+jetwK
	 dkKxQXneYkMSA==
Date: Wed, 25 Jun 2025 12:29:17 +0100
From: Lee Jones <lee@kernel.org>
To: Shubhi Garg <shgarg@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 3/6] mfd: nvvrs: add NVVRS PSEQ MFD driver
Message-ID: <20250625112917.GV795775@google.com>
References: <20250619084427.3559207-1-shgarg@nvidia.com>
 <20250619084427.3559207-4-shgarg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250619084427.3559207-4-shgarg@nvidia.com>

With respect to the subject line, please remove "MFD driver".

You can use "core driver" or replace it for whatever this is.

> Add support for NVIDIA VRS (Voltage Regulator Specification) power
> sequencer device driver. NVIDIA VRS PSEQ provides 32kHz RTC support with
> backup battery for system timing. It controls ON/OFF and suspend/resume
> power sequencing of system power rails on below NVIDIA platforms:
> 
> - NVIDIA Jetson AGX Orin Developer Kit
> - NVIDIA IGX Orin Development Kit
> - NVIDIA Jetson Orin NX Developer Kit
> - NVIDIA Jetson Orin Nano Developer Kit
> 
> Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
> ---
> 
> v4:
> - no changes
> 
> v3:
> - added rate limiting to interrupt clearing debug logs
> - removed unnecessary braces in if blocks
> - changed dependency from I2C=y to I2C in mfd Kconfig
> 
> v2:
> - removed unnecessary error logs
> - changed dev_info to dev_dbg
> - changed dev_err to dev_err_probe
> - fixed "of_match_table" assignment
> 
>  drivers/mfd/Kconfig                 |  12 ++
>  drivers/mfd/Makefile                |   1 +
>  drivers/mfd/nvidia-vrs-pseq.c       | 267 ++++++++++++++++++++++++++++
>  include/linux/mfd/nvidia-vrs-pseq.h | 127 +++++++++++++
>  4 files changed, 407 insertions(+)
>  create mode 100644 drivers/mfd/nvidia-vrs-pseq.c
>  create mode 100644 include/linux/mfd/nvidia-vrs-pseq.h
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 6fb3768e3d71..9a3451eebd6e 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1437,6 +1437,18 @@ config MFD_SC27XX_PMIC
>  	  This driver provides common support for accessing the SC27xx PMICs,
>  	  and it also adds the irq_chip parts for handling the PMIC chip events.
>  
> +config MFD_NVVRS_PSEQ

Suggest separating the company from the product.

If you want to use NV for this (I only see a single other instance of
this), then use NV_VRS_PSEQ.

> +	tristate "NVIDIA Voltage Regulator Specification Power Sequencer"

"NVIDIA Voltage Regulator Specification (VRS) Power Sequencer"

> +	depends on I2C
> +	select MFD_CORE
> +	select REGMAP_I2C
> +	select REGMAP_IRQ
> +	help
> +	  Say Y here to add support for NVIDIA Voltage Regulator Specification

(VRS) at the end.

> +	  Power Sequencer. NVVRS_PSEQ supports ON/OFF, suspend/resume sequence of

NVVRS_PSEQ seems like the wrong terminology for this paragraph.

"The NVIDIA VRS PSEQ" perhaps.

What does ON/OFF mean?

> +	  system power rails. It provides 32kHz RTC clock support with backup

This paragraph doesn't flow.  You only have a list of 2 items here and
no connecting "and" anywhere.

"a backup battery"

> +	  battery for system timing.

Is it a "backup battery" if it has a primary function?

>  config RZ_MTU3
>  	tristate "Renesas RZ/G2L MTU3a core driver"
>  	depends on (ARCH_RZG2L && OF) || COMPILE_TEST
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 79495f9f3457..9b07289985b5 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -183,6 +183,7 @@ obj-$(CONFIG_MFD_MT6360)	+= mt6360-core.o
>  obj-$(CONFIG_MFD_MT6370)	+= mt6370.o
>  mt6397-objs			:= mt6397-core.o mt6397-irq.o mt6358-irq.o
>  obj-$(CONFIG_MFD_MT6397)	+= mt6397.o
> +obj-$(CONFIG_MFD_NVVRS_PSEQ)    += nvidia-vrs-pseq.o
>  
>  obj-$(CONFIG_RZ_MTU3)		+= rz-mtu3.o
>  obj-$(CONFIG_ABX500_CORE)	+= abx500-core.o
> diff --git a/drivers/mfd/nvidia-vrs-pseq.c b/drivers/mfd/nvidia-vrs-pseq.c
> new file mode 100644
> index 000000000000..cef7abac08b7
> --- /dev/null
> +++ b/drivers/mfd/nvidia-vrs-pseq.c
> @@ -0,0 +1,267 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * SPDX-FileCopyrightText: Copyright (c) 2025 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
> + * NVIDIA VRS Power Sequencer driver.

Put this at the top followed by a line separator before the copyright
line.

Drop "driver".

> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/nvidia-vrs-pseq.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +#include <linux/err.h>

Alphabetical.

> +
> +static const struct resource rtc_resources[] = {
> +	DEFINE_RES_IRQ(NVVRS_PSEQ_INT_SRC1_RTC),
> +};
> +
> +static const struct regmap_irq nvvrs_pseq_irqs[] = {
> +	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_SRC1_RSTIRQ, 0, NVVRS_PSEQ_INT_SRC1_RSTIRQ_MASK),
> +	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_SRC1_OSC, 0, NVVRS_PSEQ_INT_SRC1_OSC_MASK),
> +	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_SRC1_EN, 0, NVVRS_PSEQ_INT_SRC1_EN_MASK),
> +	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_SRC1_RTC, 0, NVVRS_PSEQ_INT_SRC1_RTC_MASK),
> +	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_SRC1_PEC, 0, NVVRS_PSEQ_INT_SRC1_PEC_MASK),
> +	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_SRC1_WDT, 0, NVVRS_PSEQ_INT_SRC1_WDT_MASK),
> +	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_SRC1_EM_PD, 0, NVVRS_PSEQ_INT_SRC1_EM_PD_MASK),
> +	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_SRC1_INTERNAL, 0, NVVRS_PSEQ_INT_SRC1_INTERNAL_MASK),
> +	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_SRC2_PBSP, 1, NVVRS_PSEQ_INT_SRC2_PBSP_MASK),
> +	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_SRC2_ECC_DED, 1, NVVRS_PSEQ_INT_SRC2_ECC_DED_MASK),
> +	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_SRC2_TSD, 1, NVVRS_PSEQ_INT_SRC2_TSD_MASK),
> +	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_SRC2_LDO, 1, NVVRS_PSEQ_INT_SRC2_LDO_MASK),
> +	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_SRC2_BIST, 1, NVVRS_PSEQ_INT_SRC2_BIST_MASK),
> +	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_SRC2_RT_CRC, 1, NVVRS_PSEQ_INT_SRC2_RT_CRC_MASK),
> +	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_SRC2_VENDOR, 1, NVVRS_PSEQ_INT_SRC2_VENDOR_MASK),
> +	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_VENDOR0, 2, NVVRS_PSEQ_INT_VENDOR0_MASK),
> +	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_VENDOR1, 2, NVVRS_PSEQ_INT_VENDOR1_MASK),
> +	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_VENDOR2, 2, NVVRS_PSEQ_INT_VENDOR2_MASK),
> +	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_VENDOR3, 2, NVVRS_PSEQ_INT_VENDOR3_MASK),
> +	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_VENDOR4, 2, NVVRS_PSEQ_INT_VENDOR4_MASK),
> +	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_VENDOR5, 2, NVVRS_PSEQ_INT_VENDOR5_MASK),
> +	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_VENDOR6, 2, NVVRS_PSEQ_INT_VENDOR6_MASK),
> +	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_VENDOR7, 2, NVVRS_PSEQ_INT_VENDOR7_MASK),
> +};
> +
> +static const struct mfd_cell nvvrs_pseq_children[] = {
> +	{
> +		.name = "nvvrs-pseq-rtc",
> +		.resources = rtc_resources,
> +		.num_resources = ARRAY_SIZE(rtc_resources),
> +	},
> +};

One device is not and MFD.  This is not allowed.

> +static const struct regmap_range nvvrs_pseq_readable_ranges[] = {
> +	regmap_reg_range(NVVRS_PSEQ_REG_VENDOR_ID, NVVRS_PSEQ_REG_MODEL_REV),
> +	regmap_reg_range(NVVRS_PSEQ_REG_INT_SRC1, NVVRS_PSEQ_REG_LAST_RST),
> +	regmap_reg_range(NVVRS_PSEQ_REG_EN_ALT_F, NVVRS_PSEQ_REG_IEN_VENDOR),
> +	regmap_reg_range(NVVRS_PSEQ_REG_RTC_T3, NVVRS_PSEQ_REG_RTC_A0),
> +	regmap_reg_range(NVVRS_PSEQ_REG_WDT_CFG, NVVRS_PSEQ_REG_WDTKEY),
> +};
> +
> +static const struct regmap_access_table nvvrs_pseq_readable_table = {
> +	.yes_ranges = nvvrs_pseq_readable_ranges,
> +	.n_yes_ranges = ARRAY_SIZE(nvvrs_pseq_readable_ranges),
> +};
> +
> +static const struct regmap_range nvvrs_pseq_writable_ranges[] = {
> +	regmap_reg_range(NVVRS_PSEQ_REG_INT_SRC1, NVVRS_PSEQ_REG_INT_VENDOR),
> +	regmap_reg_range(NVVRS_PSEQ_REG_GP_OUT, NVVRS_PSEQ_REG_IEN_VENDOR),
> +	regmap_reg_range(NVVRS_PSEQ_REG_RTC_T3, NVVRS_PSEQ_REG_RTC_A0),
> +	regmap_reg_range(NVVRS_PSEQ_REG_WDT_CFG, NVVRS_PSEQ_REG_WDTKEY),
> +};
> +
> +static const struct regmap_access_table nvvrs_pseq_writable_table = {
> +	.yes_ranges = nvvrs_pseq_writable_ranges,
> +	.n_yes_ranges = ARRAY_SIZE(nvvrs_pseq_writable_ranges),
> +};
> +
> +static const struct regmap_config nvvrs_pseq_regmap_config = {
> +	.name = "nvvrs-pseq",
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = NVVRS_PSEQ_REG_WDTKEY + 1,
> +	.cache_type = REGCACHE_RBTREE,
> +	.rd_table = &nvvrs_pseq_readable_table,
> +	.wr_table = &nvvrs_pseq_writable_table,
> +};
> +
> +static int nvvrs_pseq_irq_clear(void *irq_drv_data)
> +{
> +	struct nvvrs_pseq_chip *chip = (struct nvvrs_pseq_chip *)irq_drv_data;

This cast is superfluous.

> +	struct i2c_client *client = chip->client;
> +	u8 reg, val;

This line on the bottom please.

> +	unsigned int i;
> +	int ret = 0;
> +
> +	/* Write 1 to clear the interrupt bit in the Interrupt

Properly formatted multi-line comments please.

Nit: The top line should be blank.

> +	 * Source Register, writing 0 has no effect, writing 1 to a bit
> +	 * which is already at 0 has no effect
> +	 */
> +
> +	for (i = 0; i < chip->irq_chip->num_regs; i++) {
> +		reg = (u8)(chip->irq_chip->status_base + i);
> +		ret = i2c_smbus_read_byte_data(client, reg);
> +		if (ret) {
> +			val = (u8)ret;
> +			dev_dbg_ratelimited(chip->dev,

How useful is this now that it's ready for publishing?

> +					    "Clear IRQ reg 0x%02x=0x%02x\n",
> +					    reg, val);
> +
> +			ret = i2c_smbus_write_byte_data(client, reg, val);
> +			if (ret < 0)
> +				return ret;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +static struct regmap_irq_chip nvvrs_pseq_irq_chip = {
> +	.name = "nvvrs-pseq-irq",
> +	.irqs = nvvrs_pseq_irqs,
> +	.num_irqs = ARRAY_SIZE(nvvrs_pseq_irqs),
> +	.num_regs = 3,
> +	.status_base = NVVRS_PSEQ_REG_INT_SRC1,
> +	.handle_post_irq = nvvrs_pseq_irq_clear,
> +};
> +
> +static int nvvrs_pseq_vendor_info(struct nvvrs_pseq_chip *chip)
> +{
> +	struct i2c_client *client = chip->client;
> +	u8 vendor_id, model_rev;
> +	int ret;
> +
> +	ret = i2c_smbus_read_byte_data(client, NVVRS_PSEQ_REG_VENDOR_ID);
> +	if (ret < 0)
> +		return dev_err_probe(chip->dev, ret,
> +				     "Failed to read Vendor ID\n");

You use 100-chars above - why not use that everywhere to prevent these
line-breaks?

> +
> +	vendor_id = (u8)ret;

All vendor IDs are supported?

Why does 'vendor_id' have to be u8?

> +	ret = i2c_smbus_read_byte_data(client, NVVRS_PSEQ_REG_MODEL_REV);
> +	if (ret < 0)
> +		return dev_err_probe(chip->dev, ret,
> +				     "Failed to read Model Rev\n");
> +
> +	model_rev = (u8)ret;
> +
> +	if (model_rev < 0x40) {

No magic numbers.  Please define them.

What if the model_rev is some larger unsupported number?

> +		dev_err(chip->dev, "Chip revision 0x%02x is not supported!\n",
> +			model_rev);
> +		return -ENODEV;
> +	}
> +
> +	dev_dbg(chip->dev, "NVVRS Vendor ID: 0x%02x, Model Rev: 0x%02x\n",
> +		vendor_id, model_rev);

How useful is this now, really?

> +	return 0;
> +}
> +
> +static int nvvrs_pseq_probe(struct i2c_client *client)
> +{
> +	const struct regmap_config *rmap_config;

"config"

Why does this need to exist at all?

> +	struct nvvrs_pseq_chip *nvvrs_chip;

"ddata"

> +	const struct mfd_cell *mfd_cells;
> +	int n_mfd_cells;
> +	int ret;
> +
> +	nvvrs_chip = devm_kzalloc(&client->dev, sizeof(*nvvrs_chip), GFP_KERNEL);
> +	if (!nvvrs_chip)
> +		return -ENOMEM;
> +
> +	/* Set PEC flag for SMBUS transfer with PEC enabled */
> +	client->flags |= I2C_CLIENT_PEC;
> +
> +	i2c_set_clientdata(client, nvvrs_chip);
> +	nvvrs_chip->client = client;
> +	nvvrs_chip->dev = &client->dev;

What are client and dev used for?

I suggest you only need one of them.

> +	nvvrs_chip->chip_irq = client->irq;

Just "irq".

> +	mfd_cells = nvvrs_pseq_children;
> +	n_mfd_cells = ARRAY_SIZE(nvvrs_pseq_children);

Why are you placing this into another variable?

> +	rmap_config = &nvvrs_pseq_regmap_config;

As above.  Why have we created another local variable for this?

> +	nvvrs_chip->irq_chip = &nvvrs_pseq_irq_chip;

Where is irq_chip used outside of this function?

> +	nvvrs_chip->rmap = devm_regmap_init_i2c(client, rmap_config);

"regmap"

> +	if (IS_ERR(nvvrs_chip->rmap))
> +		return dev_err_probe(nvvrs_chip->dev, PTR_ERR(nvvrs_chip->rmap),
> +				     "Failed to initialise regmap\n");
> +
> +	ret = nvvrs_pseq_vendor_info(nvvrs_chip);
> +	if (ret < 0)
> +		return ret;

dev_err_probe()

> +	nvvrs_pseq_irq_chip.irq_drv_data = nvvrs_chip;
> +	ret = devm_regmap_add_irq_chip(nvvrs_chip->dev, nvvrs_chip->rmap,
> +				       client->irq, IRQF_ONESHOT | IRQF_SHARED,
> +				       0, &nvvrs_pseq_irq_chip,
> +				       &nvvrs_chip->irq_data);
> +	if (ret < 0)
> +		return dev_err_probe(nvvrs_chip->dev, ret,
> +				     "Failed to add regmap irq\n");

"IRQ Chip"

> +	ret = devm_mfd_add_devices(nvvrs_chip->dev, PLATFORM_DEVID_NONE,
> +				   mfd_cells, n_mfd_cells, NULL, 0,
> +				   regmap_irq_get_domain(nvvrs_chip->irq_data));
> +	if (ret < 0)
> +		return dev_err_probe(nvvrs_chip->dev, ret,
> +				     "Failed to add MFD children\n");

Failed to add {children ,sub-}devices.

> +	return 0;
> +}
> +
> +#ifdef CONFIG_PM_SLEEP

Use the helper instead.

git grep CONFIG_PM_SLEEP -- drivers/mfd
<nothing>

> +static int nvvrs_pseq_i2c_suspend(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +
> +	/*
> +	 * IRQ must be disabled during suspend because if it happens

IRQs or The IRQ.

> +	 * while suspended it will be handled before resuming I2C.
> +	 *
> +	 * When device is woken up from suspend (e.g. by RTC wake alarm),
> +	 * an interrupt occurs before resuming I2C bus controller.
> +	 * Interrupt handler tries to read registers but this read

The interrupt ...

> +	 * will fail because I2C is still suspended.
> +	 */

Most of this is pretty self explanatory and implied TBH.

> +	disable_irq(client->irq);
> +
> +	return 0;
> +}
> +
> +static int nvvrs_pseq_i2c_resume(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +
> +	enable_irq(client->irq);

'\n' here.

> +	return 0;
> +}
> +#endif
> +
> +static const struct dev_pm_ops nvvrs_pseq_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(nvvrs_pseq_i2c_suspend, nvvrs_pseq_i2c_resume)
> +};
> +
> +static const struct of_device_id nvvrs_dt_match[] = {
> +	{ .compatible = "nvidia,vrs-pseq" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, nvvrs_dt_match);
> +
> +static struct i2c_driver nvvrs_pseq_driver = {
> +	.driver = {
> +		.name = "nvvrs_pseq",
> +		.pm = &nvvrs_pseq_pm_ops,
> +		.of_match_table = nvvrs_dt_match,
> +	},
> +	.probe = nvvrs_pseq_probe,
> +};
> +

Remove this line.

> +module_i2c_driver(nvvrs_pseq_driver);
> +
> +MODULE_AUTHOR("Shubhi Garg <shgarg@nvidia.com>");
> +MODULE_DESCRIPTION("NVIDIA Voltage Regulator Specification Power Sequencer Driver");

As above.

> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/mfd/nvidia-vrs-pseq.h b/include/linux/mfd/nvidia-vrs-pseq.h
> new file mode 100644
> index 000000000000..7e6f3aa940e7
> --- /dev/null
> +++ b/include/linux/mfd/nvidia-vrs-pseq.h
> @@ -0,0 +1,127 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +// SPDX-FileCopyrightText: Copyright (c) 2025 NVIDIA CORPORATION & AFFILIATES. All rights reserved

This should be part of the comment above.

> +
> +#ifndef _MFD_NVIDIA_VRS_PSEQ_H_
> +#define _MFD_NVIDIA_VRS_PSEQ_H_
> +
> +#include <linux/types.h>
> +
> +/* Vendor ID */
> +#define NVVRS_PSEQ_REG_VENDOR_ID		0x00
> +#define NVVRS_PSEQ_REG_MODEL_REV		0x01
> +
> +/*  Interrupts and Status registers */
> +#define NVVRS_PSEQ_REG_INT_SRC1			0x10
> +#define NVVRS_PSEQ_REG_INT_SRC2			0x11
> +#define NVVRS_PSEQ_REG_INT_VENDOR		0x12
> +#define NVVRS_PSEQ_REG_CTL_STAT			0x13
> +#define NVVRS_PSEQ_REG_EN_STDR1			0x14
> +#define NVVRS_PSEQ_REG_EN_STDR2			0x15
> +#define NVVRS_PSEQ_REG_EN_STRD1			0x16
> +#define NVVRS_PSEQ_REG_EN_STRD2			0x17
> +#define NVVRS_PSEQ_REG_WDT_STAT			0x18
> +#define NVVRS_PSEQ_REG_TEST_STAT		0x19
> +#define NVVRS_PSEQ_REG_LAST_RST			0x1A
> +
> +/* Configuration Registers */
> +#define NVVRS_PSEQ_REG_EN_ALT_F			0x20
> +#define NVVRS_PSEQ_REG_AF_IN_OUT		0x21
> +#define NVVRS_PSEQ_REG_EN_CFG1			0x22
> +#define NVVRS_PSEQ_REG_EN_CFG2			0x23
> +#define NVVRS_PSEQ_REG_CLK_CFG			0x24
> +#define NVVRS_PSEQ_REG_GP_OUT			0x25
> +#define NVVRS_PSEQ_REG_DEB_IN			0x26
> +#define NVVRS_PSEQ_REG_LP_TTSHLD		0x27
> +#define NVVRS_PSEQ_REG_CTL_1			0x28
> +#define NVVRS_PSEQ_REG_CTL_2			0x29
> +#define NVVRS_PSEQ_REG_TEST_CFG			0x2A
> +#define NVVRS_PSEQ_REG_IEN_VENDOR		0x2B
> +
> +/* RTC */
> +#define NVVRS_PSEQ_REG_RTC_T3			0x70
> +#define NVVRS_PSEQ_REG_RTC_T2			0x71
> +#define NVVRS_PSEQ_REG_RTC_T1			0x72
> +#define NVVRS_PSEQ_REG_RTC_T0			0x73
> +#define NVVRS_PSEQ_REG_RTC_A3			0x74
> +#define NVVRS_PSEQ_REG_RTC_A2			0x75
> +#define NVVRS_PSEQ_REG_RTC_A1			0x76
> +#define NVVRS_PSEQ_REG_RTC_A0			0x77
> +
> +/* WDT */
> +#define NVVRS_PSEQ_REG_WDT_CFG			0x80
> +#define NVVRS_PSEQ_REG_WDT_CLOSE		0x81
> +#define NVVRS_PSEQ_REG_WDT_OPEN			0x82
> +#define NVVRS_PSEQ_REG_WDTKEY			0x83
> +
> +/* Interrupt Mask */
> +#define NVVRS_PSEQ_INT_SRC1_RSTIRQ_MASK		BIT(0)
> +#define NVVRS_PSEQ_INT_SRC1_OSC_MASK		BIT(1)
> +#define NVVRS_PSEQ_INT_SRC1_EN_MASK		BIT(2)
> +#define NVVRS_PSEQ_INT_SRC1_RTC_MASK		BIT(3)
> +#define NVVRS_PSEQ_INT_SRC1_PEC_MASK		BIT(4)
> +#define NVVRS_PSEQ_INT_SRC1_WDT_MASK		BIT(5)
> +#define NVVRS_PSEQ_INT_SRC1_EM_PD_MASK		BIT(6)
> +#define NVVRS_PSEQ_INT_SRC1_INTERNAL_MASK	BIT(7)
> +#define NVVRS_PSEQ_INT_SRC2_PBSP_MASK		BIT(0)
> +#define NVVRS_PSEQ_INT_SRC2_ECC_DED_MASK	BIT(1)
> +#define NVVRS_PSEQ_INT_SRC2_TSD_MASK		BIT(2)
> +#define NVVRS_PSEQ_INT_SRC2_LDO_MASK		BIT(3)
> +#define NVVRS_PSEQ_INT_SRC2_BIST_MASK		BIT(4)
> +#define NVVRS_PSEQ_INT_SRC2_RT_CRC_MASK		BIT(5)
> +#define NVVRS_PSEQ_INT_SRC2_VENDOR_MASK		BIT(7)
> +#define NVVRS_PSEQ_INT_VENDOR0_MASK		BIT(0)
> +#define NVVRS_PSEQ_INT_VENDOR1_MASK		BIT(1)
> +#define NVVRS_PSEQ_INT_VENDOR2_MASK		BIT(2)
> +#define NVVRS_PSEQ_INT_VENDOR3_MASK		BIT(3)
> +#define NVVRS_PSEQ_INT_VENDOR4_MASK		BIT(4)
> +#define NVVRS_PSEQ_INT_VENDOR5_MASK		BIT(5)
> +#define NVVRS_PSEQ_INT_VENDOR6_MASK		BIT(6)
> +#define NVVRS_PSEQ_INT_VENDOR7_MASK		BIT(7)
> +
> +/* Controller Register Mask */
> +#define NVVRS_PSEQ_REG_CTL_1_FORCE_SHDN		(BIT(0) | BIT(1))
> +#define NVVRS_PSEQ_REG_CTL_1_FORCE_ACT		BIT(2)
> +#define NVVRS_PSEQ_REG_CTL_1_FORCE_INT		BIT(3)
> +#define NVVRS_PSEQ_REG_CTL_2_EN_PEC		BIT(0)
> +#define NVVRS_PSEQ_REG_CTL_2_REQ_PEC		BIT(1)
> +#define NVVRS_PSEQ_REG_CTL_2_RTC_PU		BIT(2)
> +#define NVVRS_PSEQ_REG_CTL_2_RTC_WAKE		BIT(3)
> +#define NVVRS_PSEQ_REG_CTL_2_RST_DLY		0xF0
> +
> +enum {
> +	NVVRS_PSEQ_INT_SRC1_RSTIRQ,		/* Reset or Interrupt Pin Fault */
> +	NVVRS_PSEQ_INT_SRC1_OSC,		/* Crystal Oscillator Fault */
> +	NVVRS_PSEQ_INT_SRC1_EN,			/* Enable Output Pin Fault */
> +	NVVRS_PSEQ_INT_SRC1_RTC,		/* RTC Alarm */
> +	NVVRS_PSEQ_INT_SRC1_PEC,		/* Packet Error Checking */
> +	NVVRS_PSEQ_INT_SRC1_WDT,		/* Watchdog Violation */
> +	NVVRS_PSEQ_INT_SRC1_EM_PD,		/* Emergency Power Down */
> +	NVVRS_PSEQ_INT_SRC1_INTERNAL,		/* Internal Fault*/
> +	NVVRS_PSEQ_INT_SRC2_PBSP,		/* PWR_BTN Short Pulse Detection */
> +	NVVRS_PSEQ_INT_SRC2_ECC_DED,		/* ECC Double-Error Detection */
> +	NVVRS_PSEQ_INT_SRC2_TSD,		/* Thermal Shutdown */
> +	NVVRS_PSEQ_INT_SRC2_LDO,		/* LDO Fault */
> +	NVVRS_PSEQ_INT_SRC2_BIST,		/* Built-In Self Test Fault */
> +	NVVRS_PSEQ_INT_SRC2_RT_CRC,		/* Runtime Register CRC Fault */
> +	NVVRS_PSEQ_INT_SRC2_VENDOR,		/* Vendor Specific Internal Fault */
> +	NVVRS_PSEQ_INT_VENDOR0,			/* Vendor Internal Fault Bit 0 */
> +	NVVRS_PSEQ_INT_VENDOR1,			/* Vendor Internal Fault Bit 1 */
> +	NVVRS_PSEQ_INT_VENDOR2,			/* Vendor Internal Fault Bit 2 */
> +	NVVRS_PSEQ_INT_VENDOR3,			/* Vendor Internal Fault Bit 3 */
> +	NVVRS_PSEQ_INT_VENDOR4,			/* Vendor Internal Fault Bit 4 */
> +	NVVRS_PSEQ_INT_VENDOR5,			/* Vendor Internal Fault Bit 5 */
> +	NVVRS_PSEQ_INT_VENDOR6,			/* Vendor Internal Fault Bit 6 */
> +	NVVRS_PSEQ_INT_VENDOR7,			/* Vendor Internal Fault Bit 7 */
> +};
> +
> +struct nvvrs_pseq_chip {
> +	struct device *dev;
> +	struct regmap *rmap;
> +	int chip_irq;
> +	struct i2c_client *client;
> +	struct regmap_irq_chip_data *irq_data;
> +	const struct regmap_irq_chip *irq_chip;
> +	void *irq_drv_data;

Where is this used?

> +};
> +
> +#endif /* _MFD_NVIDIA_VRS_PSEQ_H_ */
> -- 
> 2.43.0
> 

-- 
Lee Jones [李琼斯]

