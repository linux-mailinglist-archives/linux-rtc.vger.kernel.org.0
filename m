Return-Path: <linux-rtc+bounces-3725-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F2BA79882
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 01:05:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16AEB3AF54D
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Apr 2025 23:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBAE71F4C8D;
	Wed,  2 Apr 2025 23:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fS0USlJl"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B53BA42;
	Wed,  2 Apr 2025 23:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743635105; cv=none; b=VSrlx2xX7ApLfkT4joYDdJ4ZxoBmB3c2IRjAM5AVexFm1mFXn6mE7ke5K/xAcKvuGo5EY+dIRXGFV0DeYikHCHCiDF572fBfuUF+gXXfwxPMqf17pR35N3ca3vt0YOnwC5jAG6jTYG9tpvIP2sJ2Bo5Uylxcv/0JhwGMoubbTUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743635105; c=relaxed/simple;
	bh=565oyYOagBGy7tOyhZNSpQpUwsiXiMdl8vxRo3pf760=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JvGHn8wekWBfP3cHMJGj7O1BOtvXtlL7FMCD/VKY5am2DLDbtgRk/jO0xEcQPBXC3QbN0WHMsVPWLW9Rd/VCc4ykRVRcYrAC7nqe2CvjOtg8dq/LxbUSQI0NEOqE1kbnAKnekiMArfGfO52ZpHvvipNQ8SnFDY43zVerAQAGh4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fS0USlJl; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 802842047C;
	Wed,  2 Apr 2025 23:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743635095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7GKTH8Cjw2O36ifCSsbC+awokdr6cOPQ4KSTwHivugk=;
	b=fS0USlJlnY+nd+7BGxOiW1f8VngelpioRCS37ZIERG09hnsbfYn5D5FlTC2BO+mpD2eLcW
	nE4ooUnI5sPy6WaI8Zt+ic7+XM1fG2C/t3gosC+obxE4kc4S601zweuoIf46lSfCo2MplY
	LpEd/RdIAliPNwBfYqAvSmrBS04/bEA5LvCq0EPxdh53qOh8BRcERni/QwQBpS6u0P9mOB
	ts7F8DUgBl4cE3dPJOm2R1eIG4YQoRrlbJDDbDEAF5nQQDvwkDqEDMMEPmcjgG+YwAXu/R
	vJrcOX4npoi+4ziV9+RRisONtg/q4h3o6ThrxXHM9LGnESZ0mdTQ09i17ub3xQ==
Date: Thu, 3 Apr 2025 01:04:55 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RTC for 6.15
Message-ID: <2025040223045505660f22@mail.local>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeeileefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfggtggugfesthekredttddtudenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegueffgfdvhefggefgieehffeikefhfeffudelvdetheffheefffelhfelgefhkeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehtohhrvhgrlhgusheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhttgesvhhgvghrrdhkvghrn
 hgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com

Hello Linus,

Here is the RTC subsystem pull request for 6.15. We see a net reduction
of the number of lines of code thanks to the removal of a now unused
driver and a testing tool that is not used anymore. Apart from this,
the max31335 driver gets support for a new part number and pm8xxx gets
UEFI support.

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-6.15

for you to fetch changes up to 424dfcd441f035769890e6d1faec2081458627b9:

  rtc: remove 'setdate' test program (2025-04-01 15:25:15 +0200)

----------------------------------------------------------------
RTC for 6.15

Core:
 - setdate is removed as it has better replacements
 - skip alarms with a second resolution when we know the RTC doesn't support
   those.

Subsystem:
 - remove unnecessary private struct members
 - use devm_pm_set_wake_irq were relevant

Drivers:
 - ds1307: stop disabling alarms on probe for DS1337, DS1339, DS1341 and DS3231
 - max31335: add max31331 support
 - pcf50633 is removed as support for the related SoC has been removed
 - pcf85063: properly handle POR failures

----------------------------------------------------------------
Alexandre Belloni (8):
      rtc: ds1307: stop disabling alarms on probe
      rtc: pl031: document struct pl031_vendor_data members
      rtc: mpfs: switch to devm_device_init_wakeup
      rtc: pm8xxx: fix possible race condition
      rtc: pm8xxx: switch to devm_device_init_wakeup
      rtc: rv3032: fix EERD location
      rtc: rv3032: drop WADA
      rtc: mt6397: drop unused defines

André Draszik (16):
      rtc: max77686: drop needless struct max77686_rtc_info::rtc member
      rtc: s5m: drop needless struct s5m_rtc_info::i2c member
      rtc: aspeed: drop needless struct aspeed_rtc::rtc_dev member
      rtc: ds2404: drop needless struct ds2404::rtc member
      rtc: ep93xx: drop needless struct ep93xx_rtc::rtc member
      rtc: ftrtc010: drop needless struct ftrtc010_rtc::rtc_dev member
      rtc: m48t86: drop needless struct m48t86_rtc_info::rtc member
      rtc: meson: drop needless struct meson_rtc::rtc member
      rtc: meson-vrtc: drop needless struct meson_vrtc_data::rtc member
      rtc: pl030: drop needless struct pl030_rtc::rtc member
      rtc: rx8581: drop needless struct rx8581
      rtc: s35390a: drop needless struct s35390a::rtc member
      rtc: sd2405al: drop needless struct sd2405al::rtc member
      rtc: sd3078: drop needless struct sd3078
      rtc: max77686: use dev_err_probe() where appropriate
      rtc: s5m: convert to dev_err_probe() where appropriate

Claudiu Beznea (1):
      rtc: renesas-rtca3: Disable interrupts only if the RTC is enabled

Dr. David Alan Gilbert (1):
      rtc: pcf50633: Remove

Fabio Estevam (1):
      dt-bindings: rtc: pcf2127: Reference spi-peripheral-props.yaml

Gustavo A. R. Silva (1):
      rtc: cros-ec: Avoid a couple of -Wflex-array-member-not-at-end warnings

Huisong Li (2):
      rtc: ab-eoz9: Use HWMON_CHANNEL_INFO macro to simplify code
      rtc: ds3232: Use HWMON_CHANNEL_INFO macro to simplify code

Johan Hovold (2):
      rtc: pm8xxx: add support for uefi offset
      rtc: pm8xxx: mitigate flash wear

Jonathan Marek (2):
      dt-bindings: rtc: qcom-pm8xxx: document qcom,no-alarm flag
      rtc: pm8xxx: implement qcom,no-alarm flag for non-HLOS owned alarm

Krzysztof Kozlowski (2):
      rtc: fsl-ftm-alarm: Mark acpi_id table as maybe unused
      rtc: pl030: Constify amba_id table

Lukas Stockmann (1):
      rtc: pcf85063: do a SW reset if POR failed

Maud Spierings (1):
      rtc: pcf85063: replace dev_err+return with return dev_err_probe

PavithraUdayakumar-adi (2):
      dt-bindings: rtc: max31335: Add max31331 support
      rtc: max31335: Add driver support for max31331

Peng Fan (7):
      rtc: stm32: Use resource managed API to simplify code
      rtc: nxp-bbnsm: Use resource managed API to simplify code
      rtc: ds1343: Use devm_pm_set_wake_irq
      rtc: pm8xxx: Use devm_pm_set_wake_irq
      rtc: ab8500: Use resource managed API to simplify code
      rtc: mpfs: Use devm_pm_set_wake_irq
      rtc: pl031: Use resource managed API to simplify code

Wolfram Sang (3):
      rtc: rzn1: implement one-second accuracy for alarms
      selftest: rtc: skip some tests if the alarm only supports minutes
      rtc: remove 'setdate' test program

 .../devicetree/bindings/rtc/adi,max31335.yaml      |   4 +-
 .../devicetree/bindings/rtc/nxp,pcf2127.yaml       |   3 +-
 .../devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml   |   5 +
 drivers/rtc/Kconfig                                |   7 -
 drivers/rtc/Makefile                               |   1 -
 drivers/rtc/rtc-ab-eoz9.c                          |  24 +-
 drivers/rtc/rtc-ab8500.c                           |  11 +-
 drivers/rtc/rtc-aspeed.c                           |  16 +-
 drivers/rtc/rtc-cros-ec.c                          |  30 +--
 drivers/rtc/rtc-ds1307.c                           |   4 +-
 drivers/rtc/rtc-ds1343.c                           |   8 +-
 drivers/rtc/rtc-ds2404.c                           |  14 +-
 drivers/rtc/rtc-ds3232.c                           |  24 +-
 drivers/rtc/rtc-ep93xx.c                           |  16 +-
 drivers/rtc/rtc-fsl-ftm-alarm.c                    |   2 +-
 drivers/rtc/rtc-ftrtc010.c                         |  17 +-
 drivers/rtc/rtc-m48t86.c                           |  14 +-
 drivers/rtc/rtc-max31335.c                         | 165 ++++++++----
 drivers/rtc/rtc-max77686.c                         |  37 ++-
 drivers/rtc/rtc-meson-vrtc.c                       |  12 +-
 drivers/rtc/rtc-meson.c                            |  16 +-
 drivers/rtc/rtc-mpfs.c                             |  10 +-
 drivers/rtc/rtc-nxp-bbnsm.c                        |  29 +--
 drivers/rtc/rtc-pcf50633.c                         | 284 ---------------------
 drivers/rtc/rtc-pcf85063.c                         |  25 +-
 drivers/rtc/rtc-pl030.c                            |  16 +-
 drivers/rtc/rtc-pl031.c                            |   8 +-
 drivers/rtc/rtc-pm8xxx.c                           | 220 ++++++++++++----
 drivers/rtc/rtc-renesas-rtca3.c                    |  15 +-
 drivers/rtc/rtc-rv3032.c                           |   8 +-
 drivers/rtc/rtc-rx8581.c                           |  85 +++---
 drivers/rtc/rtc-rzn1.c                             | 108 ++++++--
 drivers/rtc/rtc-s35390a.c                          |  22 +-
 drivers/rtc/rtc-s5m.c                              |  58 ++---
 drivers/rtc/rtc-sd2405al.c                         |  16 +-
 drivers/rtc/rtc-sd3078.c                           |  71 ++----
 drivers/rtc/rtc-stm32.c                            |  10 +-
 include/linux/mfd/mt6397/rtc.h                     |   5 -
 include/linux/rtc.h                                |   1 +
 tools/testing/selftests/rtc/.gitignore             |   1 -
 tools/testing/selftests/rtc/Makefile               |   2 -
 tools/testing/selftests/rtc/rtctest.c              |  19 +-
 tools/testing/selftests/rtc/setdate.c              |  77 ------
 43 files changed, 662 insertions(+), 858 deletions(-)
 delete mode 100644 drivers/rtc/rtc-pcf50633.c
 delete mode 100644 tools/testing/selftests/rtc/setdate.c

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

