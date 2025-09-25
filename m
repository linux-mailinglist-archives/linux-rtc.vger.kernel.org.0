Return-Path: <linux-rtc+bounces-5027-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D009BA1AE0
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Sep 2025 23:50:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E21F518879EE
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Sep 2025 21:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B5281DBB13;
	Thu, 25 Sep 2025 21:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="k1J2+JDg";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ac+d0AcW"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC88DDAB;
	Thu, 25 Sep 2025 21:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758836985; cv=none; b=jIXJO0txkwlix10qXUf1eY/ShmqDDR+W0K9vgV8FxhqqIpgAUJKEY11SJg77bBlRMZEIDQCaziQDhX1dg3uu7CMWC05cyCA2LaSs0Duz1HjnZlUEj0usWqz5MW79PivPyqeoYXhYcmiuBqFPxunsoRBgJbDUEcgEwUOiInfQzTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758836985; c=relaxed/simple;
	bh=m4lGjOOroPNUp0gx85pv1Wi9t3KZeYNzJobctwBTKE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WP81MF9fcq/Tv2eCjmcX++wHQS7jj0XaqXAoU5/zExhf2JvRJXV6nJhTXx5K8gH6V6Tnvi/HoZKO5RL2GqYIqGr6YqZ34BlHggEcXyqQjX6hpcbVK4BfG06Kx44nkHBLtA8Bv8sVXzsroYIZKmtKT8IXeyM+QL2/romvCGBNeBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=k1J2+JDg; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ac+d0AcW; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 0BEB07A0020;
	Thu, 25 Sep 2025 17:49:42 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 25 Sep 2025 17:49:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1758836981; x=1758923381; bh=6nk2oVhcXQ
	aCHBv7NWVPxtdUgNyCssU/J2K3ZQPZuM4=; b=k1J2+JDgtUdQpUcWjjN9sPb0dE
	+xhkUc39QjNdjbYCe5luLzLMnvGu8MZ0gTFrlpCzTx5lhdkOO8Nkh4QE1XkLLblA
	cwcuUwzOVyxKz3Jb83Bo+LRNwEw4KA23/Q1/WPSe4YATSQptgtDGMmZJpyW7Zd/K
	Uwxi+054G3jAxLCPEmHM/3aJY6QK6kuaN1YB98TYw5zJkyqcaSpoiWvRWe16G/yr
	kLeyd39CJ2nvEVjYUn1SG9uMms8gFAh6eec+bMcmuakawLUMylH6bCKospWXkbmZ
	m4tpEOrLYkMwpdXlw3LkBqQtzHpWWqa8tJzposlOV4oUWhZ7Hk5Z4hWhzLGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1758836981; x=1758923381; bh=6nk2oVhcXQaCHBv7NWVPxtdUgNyCssU/J2K
	3ZQPZuM4=; b=ac+d0AcW3q4fTpnABSE+ezWR46BHIdHIxSdu11hmNuJ6cwYeXO5
	H5vF6sZQHtLsAiE3IWiIeuvqfK+YXquPn7QPaTQS0Ab5khguJ8hxh2baOCPvBz43
	OCO34N3Q0ijX/6vBvV+ztQFv+4SODvRQtTjYAdJXi4xgH3sK1qO8A07KvtiASl6e
	JKy2GK4epVg3edwuD03VZC84+J+5WtpN+dB34Kly9vJf3h6M1E5YuAOCqmsgNyRs
	6YWXPZI/FJSdxXYfM1izbnVcrhdn7F2awVHJ71+iBD7faMmKX4S8pmnp05xX9QZD
	PlZ0diMlsxRQI1VOzEuJTY7Kc9UlyoZkxqw==
X-ME-Sender: <xms:9LjVaJqsltGvRdGJWHrK8GvbFwr4J8t9uCq69k4Y4iQtjQoSwDH2Zw>
    <xme:9LjVaMCNQBA0k9adYVb7n8t9895aP9AYtcLS-rfmCAybYnMNnnk4OeM8oErm-ZWZV
    F07CVoQtVRnMwIMCJo4k-8v4pR3-nEzMt4PhSWlUKoZsiDIAtRzpRk>
X-ME-Received: <xmr:9LjVaHXokJaForMUNiI1QW0HAUkjLBEktkPFfTP9KIZFg_auVIZR1odWxZCDPLPCmYFOG9CBfL9UQoO17H7Mebudk0LiCq9CIfM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeijeeiudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeflrghnnhgvucfi
    rhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepgfdvff
    evleegudejfeefheehkeehleehfefgjefffeetudegtefhuedufeehfeetnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurd
    hnvghtpdhnsggprhgtphhtthhopedvtddpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepjhgtrghllhhighgvrhhoshelleesghhmrghilhdrtghomhdprhgtphhtthhopehsvh
    gvnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlhihsshgrsehrohhsvghniiif
    vghighdrihhopdhrtghpthhtohepnhgvrghlsehgohhmphgrrdguvghvpdhrtghpthhtoh
    eplhgvvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrghn
    ughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomh
X-ME-Proxy: <xmx:9LjVaA7JOazVjAEetUEy1oLyfcETjRdAfx6jYiGNScg6deBp38pgLA>
    <xmx:9LjVaIAzVFcrvRACDU2oxKdNoCG5kpeyWnXqsfi0R71wcfvPHhccAg>
    <xmx:9LjVaFCV2vnqGRVaxF42HPQYZQvMTh3mPfb1TPci07I-f7ED1hqJgg>
    <xmx:9LjVaIgQHRD5ZeFQXQM_kxCkvLm7pcy4yz1KVOsPaD1cMn02yEBOVw>
    <xmx:9bjVaH8oetlWdplwWAndq8oXDSdmROS2hxyIz7Op-ORoZpNh3XOhxPoP>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Sep 2025 17:49:40 -0400 (EDT)
Date: Thu, 25 Sep 2025 23:49:38 +0200
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
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH v2 07/11] input: macsmc-hid: New driver to handle the
 Apple Mac SMC buttons/lid
Message-ID: <20250925214938.GC637503@robin.jannau.net>
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
 <20250827-macsmc-subdevs-v2-7-ce5e99d54c28@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250827-macsmc-subdevs-v2-7-ce5e99d54c28@gmail.com>

On Wed, Aug 27, 2025 at 09:22:41PM +1000, James Calligeros wrote:
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
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Co-developed-by: Sven Peter <sven@kernel.org>
> Signed-off-by: Sven Peter <sven@kernel.org>
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  MAINTAINERS                     |   1 +
>  drivers/input/misc/Kconfig      |  11 ++
>  drivers/input/misc/Makefile     |   1 +
>  drivers/input/misc/macsmc-hid.c | 209 +++++++++++++++++++++++++

I would rename this driver to macsmc-input. I would expect hid driver to
live in drivers/hid/ and use HID report descriptors

>  4 files changed, 222 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2eb23522654dd050262eb06e077587030cc335aa..b3b5220fcd0d4bbef67613c8ee9afa880c0aa45d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2412,6 +2412,7 @@ F:	drivers/hwmon/macsmc_hwmon.c
>  F:	drivers/pmdomain/apple/
>  F:	drivers/i2c/busses/i2c-pasemi-core.c
>  F:	drivers/i2c/busses/i2c-pasemi-platform.c
> +F:	drivers/input/misc/macsmc-hid.c
>  F:	drivers/input/touchscreen/apple_z2.c
>  F:	drivers/iommu/apple-dart.c
>  F:	drivers/iommu/io-pgtable-dart.c
> diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
> index 0fb21c99a5e3d1230d7f40f99e0c2d360bbe80e8..a430c50e7f63f245bba56bd526026ec7901cf821 100644
> --- a/drivers/input/misc/Kconfig
> +++ b/drivers/input/misc/Kconfig
> @@ -961,4 +961,15 @@ config INPUT_STPMIC1_ONKEY
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called stpmic1_onkey.
>  
> +config INPUT_MACSMC_HID
> +	tristate "Apple Mac SMC lid/buttons"
> +	depends on MFD_MACSMC
> +	help
> +	  Say Y here if you want to use the input events delivered via the
> +	  SMC controller on Apple Mac machines using the macsmc driver.
> +	  This includes lid open/close and the power button.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called macsmc-hid.
> +
>  endif
> diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
> index d468c8140b93da5bb537e8a3baea2b90e7bb4229..95b8ebbb9ebbe6f3afc9db724d2ebeba1d75d1a6 100644
> --- a/drivers/input/misc/Makefile
> +++ b/drivers/input/misc/Makefile
> @@ -51,6 +51,7 @@ obj-$(CONFIG_INPUT_IQS7222)		+= iqs7222.o
>  obj-$(CONFIG_INPUT_KEYSPAN_REMOTE)	+= keyspan_remote.o
>  obj-$(CONFIG_INPUT_KXTJ9)		+= kxtj9.o
>  obj-$(CONFIG_INPUT_M68K_BEEP)		+= m68kspkr.o
> +obj-$(CONFIG_INPUT_MACSMC_HID)		+= macsmc-hid.o
>  obj-$(CONFIG_INPUT_MAX77650_ONKEY)	+= max77650-onkey.o
>  obj-$(CONFIG_INPUT_MAX77693_HAPTIC)	+= max77693-haptic.o
>  obj-$(CONFIG_INPUT_MAX8925_ONKEY)	+= max8925_onkey.o
> diff --git a/drivers/input/misc/macsmc-hid.c b/drivers/input/misc/macsmc-hid.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..c7cd56e5c17f08936cc623f7d3690f27e05012a5
> --- /dev/null
> +++ b/drivers/input/misc/macsmc-hid.c
> @@ -0,0 +1,209 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Apple SMC input event driver
> + * Copyright The Asahi Linux Contributors
> + *
> + * This driver exposes HID events from the SMC as an input device.
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
> + * struct macsmc_hid
> + * @dev: Underlying struct device for the HID sub-device
> + * @smc: Pointer to apple_smc struct of the mfd parent
> + * @input: Allocated input_dev; devres managed
> + * @nb: Notifier block used for incoming events from SMC (e.g. button pressed down)
> + * @wakeup_mode: Set to true when system is suspended and power button events should wake it
> + */
> +struct macsmc_hid {
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
> +static void macsmc_hid_event_button(struct macsmc_hid *smchid, unsigned long event)
> +{
> +	u8 button = (event >> 8) & 0xff;
> +	u8 state = !!(event & 0xff);
> +
> +	switch (button) {
> +	case BTN_POWER:
> +	case BTN_TOUCHID:
> +		if (smchid->wakeup_mode) {
> +			if (state)
> +				pm_wakeup_hard_event(smchid->dev);
> +		} else {
> +			input_report_key(smchid->input, KEY_POWER, state);
> +			input_sync(smchid->input);
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
> +			dev_crit(smchid->dev, "Triggering forced shutdown!\n");
> +			if (kernel_can_power_off())
> +				kernel_power_off();
> +			else /* Missing macsmc-reboot driver? */
> +				kernel_restart("SMC power button triggered restart");
> +		}
> +		break;
> +	default:
> +		dev_warn(smchid->dev, "Unknown SMC button event: %04lx\n", event & 0xffff);
> +	}
> +}
> +
> +static void macsmc_hid_event_lid(struct macsmc_hid *smchid, unsigned long event)
> +{
> +	u8 lid_state = !!((event >> 8) & 0xff);
> +
> +	if (smchid->wakeup_mode && !lid_state)
> +		pm_wakeup_hard_event(smchid->dev);
> +
> +	input_report_switch(smchid->input, SW_LID, lid_state);
> +	input_sync(smchid->input);
> +}
> +
> +static int macsmc_hid_event(struct notifier_block *nb, unsigned long event, void *data)
> +{
> +	struct macsmc_hid *smchid = container_of(nb, struct macsmc_hid, nb);
> +	u16 type = event >> 16;
> +
> +	switch (type) {
> +	case SMC_EV_BTN:
> +		macsmc_hid_event_button(smchid, event);
> +		return NOTIFY_OK;
> +	case SMC_EV_LID:
> +		macsmc_hid_event_lid(smchid, event);
> +		return NOTIFY_OK;
> +	default:
> +		/* SMC event meant for another driver */
> +		return NOTIFY_DONE;
> +	}
> +}
> +
> +static int macsmc_hid_probe(struct platform_device *pdev)
> +{
> +	struct apple_smc *smc = dev_get_drvdata(pdev->dev.parent);
> +	struct macsmc_hid *smchid;
> +	bool have_lid, have_power;
> +	int ret;
> +
> +	/* Bail early if this SMC neither supports power button nor lid events */
> +	have_lid = apple_smc_key_exists(smc, SMC_KEY(MSLD));
> +	have_power = apple_smc_key_exists(smc, SMC_KEY(bHLD));
> +	if (!have_lid && !have_power)
> +		return -ENODEV;
> +
> +	smchid = devm_kzalloc(&pdev->dev, sizeof(*smchid), GFP_KERNEL);
> +	if (!smchid)
> +		return -ENOMEM;
> +
> +	smchid->dev = &pdev->dev;
> +	smchid->smc = smc;
> +	platform_set_drvdata(pdev, smchid);
> +
> +	smchid->input = devm_input_allocate_device(&pdev->dev);
> +	if (!smchid->input)
> +		return -ENOMEM;
> +
> +	smchid->input->phys = "macsmc-hid (0)";
> +	smchid->input->name = "Apple SMC power/lid events";
> +
> +	if (have_lid)
> +		input_set_capability(smchid->input, EV_SW, SW_LID);
> +	if (have_power)
> +		input_set_capability(smchid->input, EV_KEY, KEY_POWER);
> +
> +	ret = input_register_device(smchid->input);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to register input device: %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (have_lid) {
> +		u8 val;
> +
> +		ret = apple_smc_read_u8(smc, SMC_KEY(MSLD), &val);
> +		if (ret < 0)
> +			dev_warn(&pdev->dev, "Failed to read initial lid state\n");
> +		else
> +			input_report_switch(smchid->input, SW_LID, val);
> +	}
> +
> +	if (have_power) {
> +		u32 val;
> +
> +		ret = apple_smc_read_u32(smc, SMC_KEY(bHLD), &val);
> +		if (ret < 0)
> +			dev_warn(&pdev->dev, "Failed to read initial power button state\n");
> +		else
> +			input_report_key(smchid->input, KEY_POWER, val & 1);
> +	}
> +
> +	input_sync(smchid->input);
> +
> +	smchid->nb.notifier_call = macsmc_hid_event;
> +	blocking_notifier_chain_register(&smc->event_handlers, &smchid->nb);
> +
> +	device_init_wakeup(&pdev->dev, 1);
> +
> +	return 0;
> +}
> +
> +static int macsmc_hid_pm_prepare(struct device *dev)
> +{
> +	struct macsmc_hid *smchid = dev_get_drvdata(dev);
> +
> +	smchid->wakeup_mode = true;
> +	return 0;
> +}
> +
> +static void macsmc_hid_pm_complete(struct device *dev)
> +{
> +	struct macsmc_hid *smchid = dev_get_drvdata(dev);
> +
> +	smchid->wakeup_mode = false;
> +}
> +
> +static const struct dev_pm_ops macsmc_hid_pm_ops = {
> +	.prepare = macsmc_hid_pm_prepare,
> +	.complete = macsmc_hid_pm_complete,
> +};
> +
> +static struct platform_driver macsmc_hid_driver = {
> +	.driver = {
> +		.name = "macsmc-hid",
> +		.pm = &macsmc_hid_pm_ops,
> +	},
> +	.probe = macsmc_hid_probe,
> +};
> +module_platform_driver(macsmc_hid_driver);
> +
> +MODULE_AUTHOR("Hector Martin <marcan@marcan.st>");
> +MODULE_LICENSE("Dual MIT/GPL");
> +MODULE_DESCRIPTION("Apple SMC HID driver");
> +MODULE_ALIAS("platform:macsmc-hid");

The module alias should be removed.

Janne 

