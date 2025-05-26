Return-Path: <linux-rtc+bounces-4161-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 396B7AC420B
	for <lists+linux-rtc@lfdr.de>; Mon, 26 May 2025 17:05:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE7963AF439
	for <lists+linux-rtc@lfdr.de>; Mon, 26 May 2025 15:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9669D20459A;
	Mon, 26 May 2025 15:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="px3wU1eR"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EB01FCF41;
	Mon, 26 May 2025 15:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748271896; cv=none; b=k7eFDn4Z+XFRqk/sE3JpxZSktpRRHvNgS046YdwwjhBY5SXGL+aQ5UrHtoQb4mQ/ekQMbl8D46tn2xj9K4Qp8eVvOkNrZExN8rr0qLJ/K7hWA7aGl2nYw3hdbKFC0HWe7iLkrUDQPUl01Vj++T4z4pO06cyYb70qlAWIi6RTjHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748271896; c=relaxed/simple;
	bh=tCbLRnD850Fw84D6O+/v5XHafNaaAGbfyOsK8To1nVE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gzquH82IuRecDcV7Kk2xD2bCI+kvyLYebmnXDJVDzZi0+Jjb7ncOKZxCaEbJJ2fMpP1gVStoAJtYnYpBM4p8XscEn2kdY4j1yYQzbKBTobrhKk6VKei8YxMKBcd6JpN7L5wTEvEHOKifHSOvB144lAxfh7wjq2GQN2jWuikzosE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=px3wU1eR; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id AFB2444225;
	Mon, 26 May 2025 15:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748271892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tCbLRnD850Fw84D6O+/v5XHafNaaAGbfyOsK8To1nVE=;
	b=px3wU1eRkJ/axr/5DuhnZySKrn823eNaAIJXbZcAmaqq4qeYcle/G8QC7ZsPXuBfqgUfA5
	j9UtCvuxzUT5A1xXY1Po4PCIRoRj/UYUvff9JIXuTSFDpA7KBjR1wfOWeVD/7/YChB4k6k
	OccO5Dc6ZOmBH1W60DJj3fdi7jALdeVeqR+U/9rbTTM1YBDMzgagRRa7zs6wL9Q2HF+Ggl
	lZR8EQV0hFy/i3wUKXQGcb6+9G9tfBRSFOtl6/n8GoMSf0r2Iy6B5ejdMC9jPJn6kFCLCK
	x5mkCnLV2MqtCm+ayiflRELaT0mOKkuuwcU+khwFj5kXsikeBoHem+BuFAnX/A==
Date: Mon, 26 May 2025 17:04:46 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Hector Martin <marcan@marcan.st>, Sven Peter
 <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno        
 <angelogioacchino.delregno@collabora.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Orson Zhai
 <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan
 Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Vincent Shih
 <vincent.sunplus@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Kunihiko
 Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Michal Simek <michal.simek@xilinx.com>, Alessandro
 Zummo <a.zummo@towertech.it>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Evgeniy Polyakov <zbr@ioremap.net>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-rtc@vger.kernel.org, Michael Walle <michael@walle.cc>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Romain Gantois
 <romain.gantois@bootlin.com>
Subject: Re: [PATCH V5] nvmem: add explicit config option to read old syntax
 fixed OF cells
Message-ID: <20250526170446.1190e046@kmaincent-XPS-13-7390>
In-Reply-To: <20230927204446.4231-1-zajec5@gmail.com>
References: <20230927204446.4231-1-zajec5@gmail.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddujeekfeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefguddtfeevtddugeevgfevtdfgvdfhtdeuleetffefffffhffgteekvdefudeiieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghlohepkhhmrghinhgtvghnthdqigfrufdqudefqdejfeeltddpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehgedprhgtphhtthhopeiirghjvggtheesghhmrghilhdrtghomhdprhgtphhtthhopehsrhhinhhivhgrshdrkhgrnhgurghgrghtlhgrsehlihhnrghrohdrohhrghdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprhhit
 ghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehmrghrtggrnhesmhgrrhgtrghnrdhsthdprhgtphhtthhopehsvhgvnhesshhvvghnphgvthgvrhdruggvvhdprhgtphhtthhopegrlhihshhsrgesrhhoshgvnhiifigvihhgrdhioh
X-GND-Sasl: kory.maincent@bootlin.com

Le Wed, 27 Sep 2023 22:44:46 +0200,
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> a =C3=A9crit :

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> Binding for fixed NVMEM cells defined directly as NVMEM device subnodes
> has been deprecated. It has been replaced by the "fixed-layout" NVMEM
> layout binding.
>=20
> New syntax is meant to be clearer and should help avoiding imprecise
> bindings.
>=20
> NVMEM subsystem already supports the new binding. It should be a good
> idea to limit support for old syntax to existing drivers that actually
> support & use it (we can't break backward compatibility!). That way we
> additionally encourage new bindings & drivers to ignore deprecated
> binding.
>=20
> It wasn't clear (to me) if rtc and w1 code actually uses old syntax
> fixed cells. I enabled them to don't risk any breakage.

Hello,

Was there a reason to not add the legacy flag to all the drivers that was
supporting nvmem at the time nvmem fixed layout was supported?

I just faced a nvmem layout regression on board with an at24 eeprom.

Commit: 27f699e578b1 nvmem: core: add support for fixed cells *layout*
$ git grep nvmem_config drivers/ | cut -d ':' -f 1 | sort -u
drivers/hwmon/pmbus/adm1266.c
drivers/iio/pressure/bmp280-core.c
drivers/media/i2c/ov2740.c
drivers/media/i2c/video-i2c.c
drivers/misc/eeprom/at24.c
drivers/misc/eeprom/at25.c
drivers/misc/eeprom/eeprom_93xx46.c
drivers/mtd/mtdcore.c
drivers/nvmem/apple-efuses.c
drivers/nvmem/bcm-ocotp.c
drivers/nvmem/brcm_nvram.c
drivers/nvmem/core.c
drivers/nvmem/imx-iim.c
drivers/nvmem/imx-ocotp.c
drivers/nvmem/imx-ocotp-ele.c
drivers/nvmem/imx-ocotp-scu.c
drivers/nvmem/jz4780-efuse.c
drivers/nvmem/lan9662-otpc.c
drivers/nvmem/layerscape-sfp.c
drivers/nvmem/lpc18xx_eeprom.c
drivers/nvmem/lpc18xx_otp.c
drivers/nvmem/meson-efuse.c
drivers/nvmem/meson-mx-efuse.c
drivers/nvmem/microchip-otpc.c
drivers/nvmem/mtk-efuse.c
drivers/nvmem/mxs-ocotp.c
drivers/nvmem/nintendo-otp.c
drivers/nvmem/qcom-spmi-sdam.c
drivers/nvmem/qfprom.c
drivers/nvmem/rave-sp-eeprom.c
drivers/nvmem/rmem.c
drivers/nvmem/rockchip-efuse.c
drivers/nvmem/rockchip-otp.c
drivers/nvmem/sc27xx-efuse.c
drivers/nvmem/snvs_lpgpr.c
drivers/nvmem/sprd-efuse.c
drivers/nvmem/stm32-romem.c
drivers/nvmem/sunplus-ocotp.c
drivers/nvmem/sunxi_sid.c
drivers/nvmem/u-boot-env.c
drivers/nvmem/uniphier-efuse.c
drivers/nvmem/vf610-ocotp.c
drivers/nvmem/zynqmp_nvmem.c
drivers/rtc/nvmem.c
drivers/rtc/rtc-abx80x.c
drivers/rtc/rtc-cmos.c
drivers/rtc/rtc-ds1305.c
drivers/rtc/rtc-ds1307.c
drivers/rtc/rtc-ds1343.c
drivers/rtc/rtc-ds1511.c
drivers/rtc/rtc-ds1553.c
drivers/rtc/rtc-ds1685.c
drivers/rtc/rtc-ds1742.c
drivers/rtc/rtc-ds3232.c
drivers/rtc/rtc-isl12026.c
drivers/rtc/rtc-isl1208.c
drivers/rtc/rtc-m48t59.c
drivers/rtc/rtc-m48t86.c
drivers/rtc/rtc-meson.c
drivers/rtc/rtc-omap.c
drivers/rtc/rtc-pcf2127.c
drivers/rtc/rtc-pcf85063.c
drivers/rtc/rtc-pcf85363.c
drivers/rtc/rtc-rp5c01.c
drivers/rtc/rtc-rv3028.c
drivers/rtc/rtc-rv3029c2.c
drivers/rtc/rtc-rv3032.c
drivers/rtc/rtc-rv8803.c
drivers/rtc/rtc-rx8581.c
drivers/rtc/rtc-stk17ta8.c
drivers/rtc/rtc-sun6i.c
drivers/rtc/rtc-ti-k3.c
drivers/soc/atmel/sfr.c
drivers/soc/tegra/fuse/fuse-tegra.c
drivers/thunderbolt/nvm.c
drivers/w1/slaves/w1_ds250x.c

--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

