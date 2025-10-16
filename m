Return-Path: <linux-rtc+bounces-5091-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B852BE59AB
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Oct 2025 23:52:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14132545196
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Oct 2025 21:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E32B2E54A8;
	Thu, 16 Oct 2025 21:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="EuwJalI/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YCfcWXvV"
X-Original-To: linux-rtc@vger.kernel.org
Received: from flow-a4-smtp.messagingengine.com (flow-a4-smtp.messagingengine.com [103.168.172.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDD72DE6F4;
	Thu, 16 Oct 2025 21:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760651525; cv=none; b=DvzxNUH3NsAMkwN6wmp34KBC+Lx5AihXOgwjGOhmxjTdbgwfV4F9S1NAZ5Poc6zn/gV6wMD4zevvu9uaCGFkEatDHdbsXF6pf/jjztiogIQIEXolX6YQ73ueqcHyJzygg1BzcMatIVyJsG+pcR/s0BR+ra9Z4qj/NHcgoOm2gYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760651525; c=relaxed/simple;
	bh=SM1tGdr9YFgV24cF9B04nPtp/Bl3BFuYggh2OnnTlS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E44WS/4lwZWXxFvRdKBtDPtpyhinlzZzhYDjkXOFzR5uIyq/or3mizvnHaP+XlOfLuFh8uRHmpBjZJ1xO6wi3ohW71s1brVeQ9//uQQFSLBym4vs1NkHlzeSgsiVK7rAHu5kZffEBJ1XAqZn1E5qb66zp18TSBW1SiUzLDfh9xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=EuwJalI/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YCfcWXvV; arc=none smtp.client-ip=103.168.172.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailflow.phl.internal (Postfix) with ESMTP id 5D91B13800C7;
	Thu, 16 Oct 2025 17:52:02 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Thu, 16 Oct 2025 17:52:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1760651522; x=1760658722; bh=Nt3YEEApJ1
	YAWi/TYOaj58tpROydGXT1aPp+ivaqfm4=; b=EuwJalI/9CGHoU4az5RKS4oWEc
	MDg6YtiTnVsLOsjVChto4eqf9EtwTbB/rrU441OVGqqeiDUItb78+cAc00sgHUgh
	TDLrah7RfBUSSw0yH7TGFSNuDzZc/umF+4qGR9FCtEYvUce5LGUn5Yp+MVY5B2Vt
	FRq0exhxg5qxdv4iHIsxHqCbeYJxoGCPiepL+ebI9G9uItqM84JoUH6Tp0mTxK0q
	fVti6T9iOzF5MjcVS2TB1KZN9U875LAaPCmWowuJswA6T7jU7ytGeHkMexHkfJJC
	aEncznpdwtoGprcHomNd1hu5L6CFHK1ClyaxB0dY2bKATBG3q+cYLhiUl54g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1760651522; x=1760658722; bh=Nt3YEEApJ1YAWi/TYOaj58tpROydGXT1aPp
	+ivaqfm4=; b=YCfcWXvVXqhWL5Ry8Hfvf6hwsdJvwTOVbeW7WSc4GJj9lxJ4JZc
	fiVVymEjKgLglHqOu+jcz/K3v+9qO/VjY2iVKW3ROas8Tap6AvkIuhj0LzZRpern
	Cq0hKAk5DijdRXrhFfIsW7Tfmf1aq5kSfdXu+1saWChCzHKPiYPSLg/rCn2ZAAlR
	KjPM8H6pEbtuLgDZw75IR5TH0PJMHDAPQJfWnDNxmeVmW4kvkFqvw6I00QqkPXMX
	YLkKr5IlbXiPkTJPuL86xN5WaW8c+CjpF42+8h5hS2Orh27i5/e5A2UwTcI5ucfo
	WeLYhaUmcrJa/EBFp4oxQL3anWqlYYnykVw==
X-ME-Sender: <xms:AWnxaOPz4G6iL0oFZIKQEOUfUDXQJJomnUHw6pfw9vDNBWMMVmzBmg>
    <xme:AWnxaKIgYhYFkNt23ch7NUS_57m4bYSnQVJwfirkHF8Sb9KZ5rO4_VPj2nvp4NOuk
    czy5OLtdBCG-fQ_NfpnMk6hHYHN4Id_2v_GZE6KiiBS05RW9Cf-ckI>
X-ME-Received: <xmr:AWnxaJzpKDrSHWCywCCehIWDVu-oVnn-ZKXFzNfrxumZFd6jPR5r3oS4418jq-l26lzTptaDe3yln5BvqTa1859P6ixumlmYudw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduvdejgedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomheplfgrnhhnvgcu
    ifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpefgvd
    ffveelgedujeeffeehheekheelheefgfejffeftedugeethfeuudefheefteenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruh
    drnhgvthdpnhgspghrtghpthhtohepvddupdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehjtggrlhhlihhgvghrohhsleelsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsh
    hvvghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhihshhsrgesrhhoshgvnhii
    figvihhgrdhiohdprhgtphhtthhopehnvggrlhesghhomhhprgdruggvvhdprhgtphhtth
    hopehlvggvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpth
    htoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgigr
    nhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhm
X-ME-Proxy: <xmx:AWnxaK6m5j4PHrZdcnKqTZqsL7756vJiZbJfCyjj4WJ7Od6NUhk3Vg>
    <xmx:AWnxaHYxH_WfTVfCzVVZqjGihm9dXCcYO9tZJNNIgHuJq0OInS8SlA>
    <xmx:AWnxaB-6kRfvnVbL1IEsV773eOl9yDltL0HIGH7MFsiQMOLqLMjilA>
    <xmx:AWnxaJ-10jqp_YayI3Q_4aFBVQFyrX0KzkLZSdCg8hrSp4dvC2H7GA>
    <xmx:AmnxaJWP145z-ohkuKqxTbleEhNDXJbxI8yGT6HsUPE4j8BXCWXRv0DP>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Oct 2025 17:52:00 -0400 (EDT)
Date: Thu, 16 Oct 2025 23:51:59 +0200
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
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 06/13] hwmon: Add Apple Silicon SMC hwmon driver
Message-ID: <20251016215159.GB897177@robin.jannau.net>
References: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
 <20251007-macsmc-subdevs-v3-6-d7d3bfd7ae02@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251007-macsmc-subdevs-v3-6-d7d3bfd7ae02@gmail.com>

On Tue, Oct 07, 2025 at 09:16:47PM +1000, James Calligeros wrote:
> The System Management Controller on Apple Silicon devices is responsible
> for integrating and exposing the data reported by the vast array of
> hardware monitoring sensors present on these devices. It is also
> responsible for fan control, and allows users to manually set fan
> speeds if they so desire. Add a hwmon driver to expose current,
> power, temperature, and voltage monitoring sensors, as well as
> fan speed monitoring and control via the SMC on Apple Silicon devices.
> 
> The SMC firmware has no consistency between devices, even when they
> share an SoC. The FourCC keys used to access sensors are almost
> random. An M1 Mac mini will have different FourCCs for its CPU core
> temperature sensors to an M1 MacBook Pro, for example. For this
> reason, the valid sensors for a given device are specified in a
> child of the SMC Devicetree node. The driver uses this information
> to determine which sensors to make available at runtime.
> 
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Co-developed-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Janne Grunau <j@jannau.net>
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  Documentation/hwmon/macsmc-hwmon.rst |  71 +++
>  MAINTAINERS                          |   2 +
>  drivers/hwmon/Kconfig                |  12 +
>  drivers/hwmon/Makefile               |   1 +
>  drivers/hwmon/macsmc-hwmon.c         | 850 +++++++++++++++++++++++++
>  5 files changed, 936 insertions(+)

...

> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -148,6 +148,7 @@ obj-$(CONFIG_SENSORS_LTC4260)	+= ltc4260.o
>  obj-$(CONFIG_SENSORS_LTC4261)	+= ltc4261.o
>  obj-$(CONFIG_SENSORS_LTC4282)	+= ltc4282.o
>  obj-$(CONFIG_SENSORS_LTQ_CPUTEMP) += ltq-cputemp.o
> +obj-$(CONFIG_SENSORS_MACSMC_HWMON)	+= macsmc-hwmon.o
>  obj-$(CONFIG_SENSORS_MAX1111)	+= max1111.o
>  obj-$(CONFIG_SENSORS_MAX127)	+= max127.o
>  obj-$(CONFIG_SENSORS_MAX16065)	+= max16065.o
> diff --git a/drivers/hwmon/macsmc-hwmon.c b/drivers/hwmon/macsmc-hwmon.c
> new file mode 100644
> index 000000000000..342fe3a5ff62
> --- /dev/null
> +++ b/drivers/hwmon/macsmc-hwmon.c
> @@ -0,0 +1,850 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Apple SMC hwmon driver for Apple Silicon platforms
> + *
> + * The System Management Controller on Apple Silicon devices is responsible for
> + * measuring data from sensors across the SoC and machine. These include power,
> + * temperature, voltage and current sensors. Some "sensors" actually expose
> + * derived values. An example of this is the key PHPC, which is an estimate
> + * of the heat energy being dissipated by the SoC.
> + *
> + * While each SoC only has one SMC variant, each platform exposes a different
> + * set of sensors. For example, M1 MacBooks expose battery telemetry sensors
> + * which are not present on the M1 Mac mini. For this reason, the available
> + * sensors for a given platform are described in the device tree in a child
> + * node of the SMC device. We must walk this list of available sensors and
> + * populate the required hwmon data structures at runtime.
> + *
> + * Originally based on a concept by Jean-Francois Bortolotti <jeff@borto.fr>
> + *
> + * Copyright The Asahi Linux Contributors
> + */
> +

missing linux/bitfield.h include as noted by kernel robot

> +#include <linux/hwmon.h>
> +#include <linux/mfd/macsmc.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>

...

> +static int macsmc_hwmon_probe(struct platform_device *pdev)
> +{
> +	struct apple_smc *smc = dev_get_drvdata(pdev->dev.parent);
> +	struct macsmc_hwmon *hwmon;
> +	int ret;
> +
> +	/*
> +	 * The MFD driver will try to probe us unconditionally. Some devices
> +	 * with the SMC do not have hwmon capabilities. Only probe if we have
> +	 * a hwmon node.
> +	 */
> +	if (!pdev->dev.of_node)
> +		return -ENODEV;
> +
> +	hwmon = devm_kzalloc(&pdev->dev, sizeof(*hwmon),
> +			     GFP_KERNEL);
> +	if (!hwmon)
> +		return -ENOMEM;
> +
> +	hwmon->dev = &pdev->dev;
> +	hwmon->smc = smc;
> +
> +	ret = macsmc_hwmon_populate_sensors(hwmon, hwmon->dev->of_node);
> +	if (ret) {
> +		dev_err(hwmon->dev, "Could not parse sensors\n");
> +		return ret;
> +	}
> +
> +	if (!hwmon->curr.count && !hwmon->fan.count &&
> +	    !hwmon->power.count && !hwmon->temp.count &&
> +	    !hwmon->volt.count) {
> +		dev_err(hwmon->dev,
> +			"No valid sensors found of any supported type\n");
> +		return -ENODEV;
> +	}
> +
> +	ret = macsmc_hwmon_create_infos(hwmon);
> +	if (ret)
> +		return ret;
> +
> +	hwmon->chip_info.ops = &macsmc_hwmon_ops;
> +	hwmon->chip_info.info =
> +		(const struct hwmon_channel_info *const *)&hwmon->channel_infos;
> +
> +	hwmon->hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev,
> +								"macsmc_hwmon", hwmon,
> +								&hwmon->chip_info, NULL);
> +	if (IS_ERR(hwmon->hwmon_dev))
> +		return dev_err_probe(hwmon->dev, PTR_ERR(hwmon->hwmon_dev),
> +				     "Probing SMC hwmon device failed\n");
> +
> +	dev_info(hwmon->dev, "Registered SMC hwmon device. Sensors:");
> +	dev_info(hwmon->dev,

printing non-errors during probe is strongly discouraged. I also do not
see much value in this message outside of development so please change
to dev_dbg().

Janne

