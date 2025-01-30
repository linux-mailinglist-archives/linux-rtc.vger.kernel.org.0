Return-Path: <linux-rtc+bounces-3070-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 216FDA23762
	for <lists+linux-rtc@lfdr.de>; Thu, 30 Jan 2025 23:49:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 70D987A3615
	for <lists+linux-rtc@lfdr.de>; Thu, 30 Jan 2025 22:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B12851B85F6;
	Thu, 30 Jan 2025 22:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KtLlEttG"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7886B1B4156;
	Thu, 30 Jan 2025 22:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738277344; cv=none; b=M6LwKS6FP4HewD2LSQZPu8LFxaenqtLSejj0L5Qlz9u4IXDWToHZ9+fknsKBb3N06AlV8Cb4xmZKEDbeu5c+NFVUPoH9zf8fXFyGX4YELWcyOJJFJOB3pfiZILC0dM3pE/iGZvY8OZGydVZIT2vyRWywpPxNUaA2iyFBOvVhI4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738277344; c=relaxed/simple;
	bh=y3DtLDw7Fov4fOJ6ND5PD8PeXk2JLeqOrsUzrcl0dcE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qltWg2lgXqfIfnNK5B/AGVdaQ1VJAcrMM1Jt0UgMgFHW4sdlGVCURl7gOiHXM9zFHWC6onbZiKEzlGQuGxR/SxmfOrWDZyEKcBS6qJtUkJF5fU/Trxq8A6h3ivl31jK0zkNh4GyHl04X9FxEwwptIaldePJv1kFLHXyDTsZpMlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KtLlEttG; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6291A431ED;
	Thu, 30 Jan 2025 22:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738277337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=+650bWZwiHQei056z9vqCqJNFXx6z6AXBlkRR/M/OeE=;
	b=KtLlEttGXxCwoIQq7vM+Dk7kluJqMVQzMjn780Zc5zms6Jax94tH6ngWb1IpHJMMT0UH7p
	RPf95lYurcIgQYv0K2iqrcl7fe/zPUOcT57hG+4NlZZaIwGZzb+YGnGzW3PeVHzhtpj8iZ
	cqvUDUXjl+kgTE8nuoJwMyglW1uAmvkV6Vl2hgf6gyz81HL9ny6MA0oaJVg7RBigQh3EZj
	QGPHDSEhxYA1KkP5JWKqUg84EWF7BwFs6szxhpZQ/oVezlOzFBKeNu+6cUIBfvZXbuAnYI
	FwZo7jDMpw/7W3payHFHg0/N3g7KB/LepwmJcNjA3ObXcXX9j9prH8FwZEvOSA==
Date: Thu, 30 Jan 2025 23:48:56 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RTC for 6.14
Message-ID: <2025013022485633b00737@mail.local>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejtdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfggtggusehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfegfefhtdehgffgkedtfeelkedugefgtdeugeegffdvkeefjefhkefhffetvdeknecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepthhorhhvrghlughssehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrthgtsehvghgvrhdrkhgvrhhnvghlr
 dhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com

Hello Linus,

Here is the RTC subsystem pull request for 6.14. Not much this cycle,
there are multiple small fixes. I took the last patch a bit late but
this has been tested independently by two other developers.

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-6.14

for you to fetch changes up to 97274527e8dc709bbb4c7cb44279a12d085da9ef:

  rtc: pcf2127: add BSM support (2025-01-29 00:42:29 +0100)

----------------------------------------------------------------
RTC for 6.13

Subsystem:
 - use boolean values with device_init_wakeup()

Drivers:
 - pcf2127: add BSM support
 - pcf85063: fix possible out of bound write

----------------------------------------------------------------
Alexandre Belloni (1):
      rtc: pcf2127: add BSM support

Dan Carpenter (1):
      rtc: tps6594: Fix integer overflow on 32bit systems

Dr. David Alan Gilbert (1):
      rtc: Remove hpet_rtc_dropped_irq()

Fabio Estevam (1):
      dt-bindings: rtc: mxc: Document fsl,imx31-rtc

Geert Uytterhoeven (1):
      rtc: RTC_DRV_SPEAR should not default to y when compile-testing

Krzysztof Kozlowski (1):
      rtc: stm32: Use syscon_regmap_lookup_by_phandle_args

Michal Simek (1):
      rtc: zynqmp: Fix optional clock name property

Ming Wang (1):
      rtc: loongson: clear TOY_MATCH0_REG in loongson_rtc_isr()

Oleksij Rempel (1):
      rtc: pcf85063: fix potential OOB write in PCF85063 NVMEM read

Wolfram Sang (1):
      rtc: use boolean values with device_init_wakeup()

 Documentation/devicetree/bindings/rtc/rtc-mxc.yaml | 10 ++-
 arch/x86/include/asm/hpet.h                        |  1 -
 arch/x86/kernel/hpet.c                             |  6 --
 drivers/rtc/Kconfig                                |  2 +-
 drivers/rtc/rtc-88pm80x.c                          |  2 +-
 drivers/rtc/rtc-88pm860x.c                         |  2 +-
 drivers/rtc/rtc-amlogic-a4.c                       |  6 +-
 drivers/rtc/rtc-armada38x.c                        |  2 +-
 drivers/rtc/rtc-as3722.c                           |  2 +-
 drivers/rtc/rtc-at91rm9200.c                       |  2 +-
 drivers/rtc/rtc-at91sam9.c                         |  2 +-
 drivers/rtc/rtc-cadence.c                          |  2 +-
 drivers/rtc/rtc-cmos.c                             |  7 +-
 drivers/rtc/rtc-cpcap.c                            |  2 +-
 drivers/rtc/rtc-cros-ec.c                          |  2 +-
 drivers/rtc/rtc-da9055.c                           |  2 +-
 drivers/rtc/rtc-ds3232.c                           |  2 +-
 drivers/rtc/rtc-isl1208.c                          |  2 +-
 drivers/rtc/rtc-jz4740.c                           |  2 +-
 drivers/rtc/rtc-loongson.c                         | 17 +++--
 drivers/rtc/rtc-lp8788.c                           |  2 +-
 drivers/rtc/rtc-lpc32xx.c                          |  2 +-
 drivers/rtc/rtc-max77686.c                         |  2 +-
 drivers/rtc/rtc-max8925.c                          |  2 +-
 drivers/rtc/rtc-max8997.c                          |  2 +-
 drivers/rtc/rtc-meson-vrtc.c                       |  2 +-
 drivers/rtc/rtc-mpc5121.c                          |  2 +-
 drivers/rtc/rtc-mt6397.c                           |  2 +-
 drivers/rtc/rtc-mv.c                               |  4 +-
 drivers/rtc/rtc-mxc.c                              |  2 +-
 drivers/rtc/rtc-mxc_v2.c                           |  2 +-
 drivers/rtc/rtc-omap.c                             |  2 +-
 drivers/rtc/rtc-palmas.c                           |  2 +-
 drivers/rtc/rtc-pcf2127.c                          | 82 ++++++++++++++++++++++
 drivers/rtc/rtc-pcf85063.c                         | 11 ++-
 drivers/rtc/rtc-pic32.c                            |  2 +-
 drivers/rtc/rtc-pm8xxx.c                           |  2 +-
 drivers/rtc/rtc-pxa.c                              |  2 +-
 drivers/rtc/rtc-rc5t583.c                          |  2 +-
 drivers/rtc/rtc-rc5t619.c                          |  2 +-
 drivers/rtc/rtc-renesas-rtca3.c                    |  2 +-
 drivers/rtc/rtc-rk808.c                            |  2 +-
 drivers/rtc/rtc-s3c.c                              |  2 +-
 drivers/rtc/rtc-s5m.c                              |  2 +-
 drivers/rtc/rtc-sa1100.c                           |  2 +-
 drivers/rtc/rtc-sc27xx.c                           |  4 +-
 drivers/rtc/rtc-sh.c                               |  2 +-
 drivers/rtc/rtc-spear.c                            |  4 +-
 drivers/rtc/rtc-stm32.c                            | 22 ++----
 drivers/rtc/rtc-sun6i.c                            |  2 +-
 drivers/rtc/rtc-sunplus.c                          |  4 +-
 drivers/rtc/rtc-tegra.c                            |  2 +-
 drivers/rtc/rtc-test.c                             |  2 +-
 drivers/rtc/rtc-tps6586x.c                         |  2 +-
 drivers/rtc/rtc-tps65910.c                         |  2 +-
 drivers/rtc/rtc-tps6594.c                          |  2 +-
 drivers/rtc/rtc-twl.c                              |  2 +-
 drivers/rtc/rtc-wm831x.c                           |  2 +-
 drivers/rtc/rtc-wm8350.c                           |  2 +-
 drivers/rtc/rtc-xgene.c                            |  4 +-
 drivers/rtc/rtc-zynqmp.c                           |  8 +--
 61 files changed, 180 insertions(+), 102 deletions(-)

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

