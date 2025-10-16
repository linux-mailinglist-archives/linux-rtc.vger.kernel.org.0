Return-Path: <linux-rtc+bounces-5092-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB02BBE5A03
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Oct 2025 23:58:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F5DB5E5CD3
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Oct 2025 21:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30C3D2E54B6;
	Thu, 16 Oct 2025 21:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="TypI8VKG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IVMDpe3N"
X-Original-To: linux-rtc@vger.kernel.org
Received: from flow-a4-smtp.messagingengine.com (flow-a4-smtp.messagingengine.com [103.168.172.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF1D2E0B4B;
	Thu, 16 Oct 2025 21:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760651917; cv=none; b=e/2M7UT0kZuES6+uCdF4E6vGYvBNKEgDPGpSdoSjwDmLEHq7/c0gjOIOuKH+Ucb0SZb3SMetc0Ge0QhRPckZpapvO40KXKOgDVM2l/Vi/+GQU/6jOrjuN58Pne3uKFCDdSBULx/M+jfg6T+xU8OFtGXr3rEHdWz3IgEn2S3FYkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760651917; c=relaxed/simple;
	bh=H21AE76WwHBQk12gXFO2TEh8OI2wc3S/ARWmhsvHoGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iAH1ywvOUP/5uddc8i+mEn5RVp3E2KyZWSHebxSQ+vfJ79yeqdEYgMVKKBNYrikILXj1LhiKLRLVeCKl2slM0fOExPC5x4YRww3cf0bNPwbpLiJgwpxxrO1oQoVRpHzNBEPKf1pRVbBSk6pd+OYCzXav2RPv5Zgi4aTJff66kMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=TypI8VKG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IVMDpe3N; arc=none smtp.client-ip=103.168.172.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailflow.phl.internal (Postfix) with ESMTP id BBABE138069E;
	Thu, 16 Oct 2025 17:58:32 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Thu, 16 Oct 2025 17:58:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1760651912; x=1760659112; bh=UI+sVWBcPP
	0x85ZhHwy4+aIuicNgMVj9A4FiE22p1+4=; b=TypI8VKGgTYpsdIOVoLcgPc9qY
	e7dyq1M03qqv4UIbP5uxgL4ltagPKrR+9NHXls8+VZ4Nv52pWwVcR9GKEW1BiYVQ
	4NFpjGW2mE0aofJTsdLt8lDDWZsfSgkB/G6kESwBmXrSRhB+b4o+A1jtJa70KPTn
	fS9W2KnKvLNdTVBDcLKQhcZ3t3MRj4oAyc+PdGihEjVT13rM92VDsaKjSKiyH+U+
	3/5s83qu3iMhtXUAyWkMClF5gW7HLB8IHoR03gbFcGvPdlFrv5mPNywUNeAmojQK
	2anfm/pTqpL0IBOKE2OetJ0qojEzuOJOXxNE1PkpDY96LahV4IQWsvZmC0Bw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1760651912; x=1760659112; bh=UI+sVWBcPP0x85ZhHwy4+aIuicNgMVj9A4F
	iE22p1+4=; b=IVMDpe3NWHgQZpUmFl0L1i3nd+AZXkMX9WKx0MYDViQkyt4yN/Q
	Lqaizzx6nyLwb9w011LLR3h6pWKEQJvu430ToHamBejhrzs3zysQRu/vMkuPLfAd
	59oz/UjKp3FtJ68W0yFF8v6ZcLYRpRpSJGyY+PigNuoamgBjf/eADbfr8UeS2anj
	2vjzGZ7xOZExhjCeq5pcoahloya8gQvyz9p/zefpmeiHwMwq4qBWfqtFFwwx9+VJ
	71iQ6KJCZSQsVXjH8dhlKb7Hjc3aCBl3mLKHLNPDsJeIoxKY+9CUAbKpA9JyBiOH
	DGDviZ4xSGM0t1GVIrMhYuJQx4d+rSgq7HA==
X-ME-Sender: <xms:h2rxaBTZc4vMkr7TJaihDee-yfgs4ywZS4aqJXRFkN1yWOfXsXPkpw>
    <xme:h2rxaFh290MyPNVvBJ-KSh6zmnLjsnvtxSjWFrEzx3Ok7ZzQxVUWwK2olEkcWFlb9
    gfzKD8z73NWfmsrMNEyOw4Mk8bClfZprNYRAvwOna0EsUy2OcCWdC4>
X-ME-Received: <xmr:h2rxaFtDc7qTDKHmns_PGtLyOl522aAF5fa7V5gjmda79zQocmCvo8kkTZdRJX8IDd_pMPNSTREJ81wbmp9RF6cJXG4jD3oSIaI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduvdejgeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomheplfgrnhhnvgcu
    ifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpefgvd
    ffveelgedujeeffeehheekheelheefgfejffeftedugeethfeuudefheefteenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruh
    drnhgvthdpnhgspghrtghpthhtohepvddvpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehjtggrlhhlihhgvghrohhsleelsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsh
    hvvghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhihshhsrgesrhhoshgvnhii
    figvihhgrdhiohdprhgtphhtthhopehnvggrlhesghhomhhprgdruggvvhdprhgtphhtth
    hopehlvggvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpth
    htoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgigr
    nhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhm
X-ME-Proxy: <xmx:h2rxaPzIw4_2O8z31f6GCnQM7ZSYhKqd18DauhUrGeB1kamJFX03Fg>
    <xmx:h2rxaLNCabtpdBpjn_Ip60_FhMDx6bDQHE8n_ikbPPF8NAFpggaF1w>
    <xmx:h2rxaB14f13M2Nxf0J4q372yCiICPaDQeItIHo66YS2vF69FCHc6Rg>
    <xmx:h2rxaDFDyKc5P_4MAiK1AWmS-ZJoWrR8I5UVTHq5lCQJOLz9s3WMGw>
    <xmx:iGrxaBwss5XyjxEs_pREVgR4_pVID7Mfq53P7Sk4kdxoI5FfQvz86bn_>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Oct 2025 17:58:31 -0400 (EDT)
Date: Thu, 16 Oct 2025 23:58:30 +0200
From: Janne Grunau <j@jannau.net>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org, Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH v3 08/13] input: macsmc-input: New driver to handle the
 Apple Mac SMC buttons/lid
Message-ID: <20251016215830.GC897177@robin.jannau.net>
References: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
 <20251007-macsmc-subdevs-v3-8-d7d3bfd7ae02@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251007-macsmc-subdevs-v3-8-d7d3bfd7ae02@gmail.com>

On Tue, Oct 07, 2025 at 09:16:49PM +1000, James Calligeros wrote:
> From: Hector Martin <marcan@marcan.st>
> 
> This driver implements power button and lid switch support for Apple Mac
> devices using SMC controllers driven by the macsmc driver.
> 
> In addition to basic input support, this also responds to the final
> shutdown warning (when the power button is held down long enough) by
> doing an emergency kernel poweroff. This allows the NVMe controller to
> be cleanly shut down, which prevents data loss for in-cache data.
> 
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Co-developed-by: Sven Peter <sven@kernel.org>
> Signed-off-by: Sven Peter <sven@kernel.org>
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  MAINTAINERS                       |   1 +
>  drivers/input/misc/Kconfig        |  11 ++
>  drivers/input/misc/Makefile       |   1 +
>  drivers/input/misc/macsmc-input.c | 208 +++++++++++++++++++++++++
>  4 files changed, 221 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 79b9f40224a9..e8283f127f11 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2451,6 +2451,7 @@ F:	drivers/hwmon/macsmc-hwmon.c
>  F:	drivers/pmdomain/apple/
>  F:	drivers/i2c/busses/i2c-pasemi-core.c
>  F:	drivers/i2c/busses/i2c-pasemi-platform.c
> +F:	drivers/input/misc/macsmc-input.c
>  F:	drivers/input/touchscreen/apple_z2.c
>  F:	drivers/iommu/apple-dart.c
>  F:	drivers/iommu/io-pgtable-dart.c
> diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
> index 0e6b49fb54bc..5ab8a4729e0a 100644
> --- a/drivers/input/misc/Kconfig
> +++ b/drivers/input/misc/Kconfig
> @@ -981,4 +981,15 @@ config INPUT_STPMIC1_ONKEY
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called stpmic1_onkey.
>  
> +config INPUT_MACSMC_INPUT

INPUT_MACSMC_INPUT looks redundant, is there a reason for not just using
INPUT_MACSMC?

> +	tristate "Apple Mac SMC lid/buttons"
> +	depends on MFD_MACSMC
> +	help
> +	  Say Y here if you want to use the input events delivered via the
> +	  SMC controller on Apple Mac machines using the macsmc driver.
> +	  This includes lid open/close and the power button.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called macsmc-input.
> +
>  endif
> diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
> index ae857c24f48e..480a0d08d4ae 100644
> --- a/drivers/input/misc/Makefile
> +++ b/drivers/input/misc/Makefile
> @@ -51,6 +51,7 @@ obj-$(CONFIG_INPUT_IQS7222)		+= iqs7222.o
>  obj-$(CONFIG_INPUT_KEYSPAN_REMOTE)	+= keyspan_remote.o
>  obj-$(CONFIG_INPUT_KXTJ9)		+= kxtj9.o
>  obj-$(CONFIG_INPUT_M68K_BEEP)		+= m68kspkr.o
> +obj-$(CONFIG_INPUT_MACSMC_INPUT)	+= macsmc-input.o
>  obj-$(CONFIG_INPUT_MAX7360_ROTARY)	+= max7360-rotary.o
>  obj-$(CONFIG_INPUT_MAX77650_ONKEY)	+= max77650-onkey.o
>  obj-$(CONFIG_INPUT_MAX77693_HAPTIC)	+= max77693-haptic.o
> diff --git a/drivers/input/misc/macsmc-input.c b/drivers/input/misc/macsmc-input.c
> new file mode 100644
> index 000000000000..ebbc7dfc31f5
> --- /dev/null
> +++ b/drivers/input/misc/macsmc-input.c
> @@ -0,0 +1,208 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Apple SMC input event driver
> + * Copyright The Asahi Linux Contributors
> + *
> + * This driver exposes HID events from the SMC as an input device.

s/HID //

> + * This includes the lid open/close and power button notifications.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/input.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/macsmc.h>
> +#include <linux/module.h>
> +#include <linux/reboot.h>
> +
> +/**
> + * struct macsmc_input
> + * @dev: Underlying struct device for the input sub-device
> + * @smc: Pointer to apple_smc struct of the mfd parent
> + * @input: Allocated input_dev; devres managed
> + * @nb: Notifier block used for incoming events from SMC (e.g. button pressed down)
> + * @wakeup_mode: Set to true when system is suspended and power button events should wake it
> + */
> +struct macsmc_input {
> +	struct device *dev;
> +	struct apple_smc *smc;
> +	struct input_dev *input;
> +	struct notifier_block nb;
> +	bool wakeup_mode;
> +};
> +
> +#define SMC_EV_BTN 0x7201
> +#define SMC_EV_LID 0x7203
> +
> +#define BTN_POWER		0x01 /* power button on e.g. Mac Mini chasis pressed */
> +#define BTN_TOUCHID		0x06 /* combined TouchID / power button on MacBooks pressed */
> +#define BTN_POWER_HELD_SHORT	0xfe /* power button briefly held down */
> +#define BTN_POWER_HELD_LONG	0x00 /* power button held down; sent just before forced poweroff */
> +
> +static void macsmc_input_event_button(struct macsmc_input *smcin, unsigned long event)
> +{
> +	u8 button = (event >> 8) & 0xff;
> +	u8 state = !!(event & 0xff);
> +
> +	switch (button) {
> +	case BTN_POWER:
> +	case BTN_TOUCHID:
> +		if (smcin->wakeup_mode) {
> +			if (state)
> +				pm_wakeup_event(smcin->dev, 0);
> +		} else {
> +			input_report_key(smcin->input, KEY_POWER, state);
> +			input_sync(smcin->input);
> +		}
> +		break;
> +	case BTN_POWER_HELD_SHORT: /* power button held down; ignore */
> +		break;
> +	case BTN_POWER_HELD_LONG:
> +		/*
> +		 * If we get here the power button has been held down for a while and
> +		 * we have about 4 seconds before forced power-off is triggered by SMC.
> +		 * Try to do an emergency shutdown to make sure the NVMe cache is
> +		 * flushed. macOS actually does this by panicing (!)...
> +		 */
> +		if (state) {
> +			dev_crit(smcin->dev, "Triggering forced shutdown!\n");
> +			if (kernel_can_power_off())
> +				kernel_power_off();
> +			else /* Missing macsmc-reboot driver? */
> +				kernel_restart("SMC power button triggered restart");
> +		}
> +		break;
> +	default:
> +		dev_warn(smcin->dev, "Unknown SMC button event: %04lx\n", event & 0xffff);
> +	}
> +}
> +
> +static void macsmc_input_event_lid(struct macsmc_input *smcin, unsigned long event)
> +{
> +	u8 lid_state = !!((event >> 8) & 0xff);
> +
> +	if (smcin->wakeup_mode && !lid_state)
> +		pm_wakeup_event(smcin->dev, 0);
> +
> +	input_report_switch(smcin->input, SW_LID, lid_state);
> +	input_sync(smcin->input);
> +}
> +
> +static int macsmc_input_event(struct notifier_block *nb, unsigned long event, void *data)
> +{
> +	struct macsmc_input *smcin = container_of(nb, struct macsmc_input, nb);
> +	u16 type = event >> 16;
> +
> +	switch (type) {
> +	case SMC_EV_BTN:
> +		macsmc_input_event_button(smcin, event);
> +		return NOTIFY_OK;
> +	case SMC_EV_LID:
> +		macsmc_input_event_lid(smcin, event);
> +		return NOTIFY_OK;
> +	default:
> +		/* SMC event meant for another driver */
> +		return NOTIFY_DONE;
> +	}
> +}
> +
> +static int macsmc_input_probe(struct platform_device *pdev)
> +{
> +	struct apple_smc *smc = dev_get_drvdata(pdev->dev.parent);
> +	struct macsmc_input *smcin;
> +	bool have_lid, have_power;
> +	int error;
> +
> +	/* Bail early if this SMC neither supports power button nor lid events */
> +	have_lid = apple_smc_key_exists(smc, SMC_KEY(MSLD));
> +	have_power = apple_smc_key_exists(smc, SMC_KEY(bHLD));
> +	if (!have_lid && !have_power)
> +		return -ENODEV;
> +
> +	smcin = devm_kzalloc(&pdev->dev, sizeof(*smcin), GFP_KERNEL);
> +	if (!smcin)
> +		return -ENOMEM;
> +
> +	smcin->dev = &pdev->dev;
> +	smcin->smc = smc;
> +	platform_set_drvdata(pdev, smcin);
> +
> +	smcin->input = devm_input_allocate_device(&pdev->dev);
> +	if (!smcin->input)
> +		return -ENOMEM;
> +
> +	smcin->input->phys = "macsmc-input (0)";
> +	smcin->input->name = "Apple SMC power/lid events";
> +
> +	if (have_lid)
> +		input_set_capability(smcin->input, EV_SW, SW_LID);
> +	if (have_power)
> +		input_set_capability(smcin->input, EV_KEY, KEY_POWER);
> +
> +	if (have_lid) {
> +		u8 val;
> +
> +		error = apple_smc_read_u8(smc, SMC_KEY(MSLD), &val);
> +		if (error < 0)
> +			dev_warn(&pdev->dev, "Failed to read initial lid state\n");
> +		else
> +			input_report_switch(smcin->input, SW_LID, val);
> +	}
> +
> +	if (have_power) {
> +		u32 val;
> +
> +		error = apple_smc_read_u32(smc, SMC_KEY(bHLD), &val);
> +		if (error < 0)
> +			dev_warn(&pdev->dev, "Failed to read initial power button state\n");
> +		else
> +			input_report_key(smcin->input, KEY_POWER, val & 1);
> +	}
> +
> +	error = input_register_device(smcin->input);
> +	if (error) {
> +		dev_err(&pdev->dev, "Failed to register input device: %d\n", error);
> +		return error;
> +	}
> +
> +	input_sync(smcin->input);
> +
> +	smcin->nb.notifier_call = macsmc_input_event;
> +	blocking_notifier_chain_register(&smc->event_handlers, &smcin->nb);
> +
> +	device_init_wakeup(&pdev->dev, 1);
> +
> +	return 0;
> +}
> +
> +static int macsmc_input_pm_prepare(struct device *dev)
> +{
> +	struct macsmc_input *smcin = dev_get_drvdata(dev);
> +
> +	smcin->wakeup_mode = true;
> +	return 0;
> +}
> +
> +static void macsmc_input_pm_complete(struct device *dev)
> +{
> +	struct macsmc_input *smcin = dev_get_drvdata(dev);
> +
> +	smcin->wakeup_mode = false;
> +}
> +
> +static const struct dev_pm_ops macsmc_input_pm_ops = {
> +	.prepare = macsmc_input_pm_prepare,
> +	.complete = macsmc_input_pm_complete,
> +};
> +
> +static struct platform_driver macsmc_input_driver = {
> +	.driver = {
> +		.name = "macsmc-input",
> +		.pm = &macsmc_input_pm_ops,
> +	},
> +	.probe = macsmc_input_probe,
> +};
> +module_platform_driver(macsmc_input_driver);
> +
> +MODULE_AUTHOR("Hector Martin <marcan@marcan.st>");
> +MODULE_LICENSE("Dual MIT/GPL");
> +MODULE_DESCRIPTION("Apple SMC input driver");

mssing 'MODULE_ALIAS("platform:macsmc-input");'. This is required when
using MFD_CELL_NAME(). My ask for it to be removed was based on my
mistaken idea to add a pointless node to the DT and use MFD_CELL_OF().

Janne

