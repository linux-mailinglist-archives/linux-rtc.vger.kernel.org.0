Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 291A6BA1FE
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Sep 2019 13:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725850AbfIVLUz (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 22 Sep 2019 07:20:55 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:53559 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbfIVLUz (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 22 Sep 2019 07:20:55 -0400
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 5D2AD240008;
        Sun, 22 Sep 2019 11:20:52 +0000 (UTC)
Date:   Sun, 22 Sep 2019 13:20:52 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RTC for 5.4
Message-ID: <20190922112052.GA22547@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello Linus,

Here is the pull-request for the RTC subsystem for 5.4.

Two new drivers and the new pcf2127 feature make the bulk of the
additions. The rest are the usual fixes and new features.

The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-5.4

for you to fetch changes up to b99a3120f9a30e1429d8d634e18da8dff93340c6:

  rtc: meson: mark PM functions as __maybe_unused (2019-09-10 16:14:15 +0200)

----------------------------------------------------------------
RTC for 5.4

Subsystem:
 - add debug message when registration fails

New drivers:
 - Amlogic Virtual Wake
 - Freescale FlexTimer Module alarm

Drivers:
 - remove superfluous error messages
 - convert to i2c_new_dummy_device and devm_i2c_new_dummy_device
 - Remove dev_err() usage after platform_get_irq()
 - Set RTC range for: pcf2123, pcf8563, snvs.
 - pcf2127: tamper detection and watchdog support
 - pcf85363: fix regmap issue
 - sun6i: H6 support
 - remove w90x900/nuc900 driver

----------------------------------------------------------------
Alejandro González (1):
      rtc: sun6i: Allow using as wakeup source from suspend

Alexandre Belloni (19):
      rtc: pcf2123: don't use weekday alarm
      rtc; pcf2123: fix possible alarm race condition
      rtc: pcf2123: implement .alarm_irq_enable
      rtc: pcf2123: stop using dev.platform_data
      rtc: pcf2123: rename struct and variables
      rtc: pcf2123: remove useless error path goto
      rtc: pcf2123: convert to devm_rtc_allocate_device
      rtc: pcf2123: let the core handle range offsetting
      rtc: pcf2123: add proper compatible string
      rtc: class: add debug message when registration fails
      rtc: remove superfluous error message
      rtc: ds1672: remove unnecessary check
      rtc: snvs: set range
      rtc: snvs: switch to rtc_time64_to_tm/rtc_tm_to_time64
      rtc: pcf8563: add Epson RTC8564 compatible
      rtc: pcf8563: add Microcrystal RV8564 compatible
      rtc: pcf8563: convert to devm_rtc_allocate_device
      rtc: pcf8563: remove useless indirection
      rtc: pcf8563: let the core handle range offsetting

Anson Huang (3):
      rtc: mxc_v2: use devm_platform_ioremap_resource() to simplify code
      rtc: imxdi: use devm_platform_ioremap_resource() to simplify code
      rtc: snvs: fix possible race condition

Arnd Bergmann (2):
      rtc: remove w90x900/nuc900 driver
      rtc: meson: mark PM functions as __maybe_unused

Baolin Wang (1):
      rtc: sc27xx: Remove clearing SPRD_RTC_POWEROFF_ALM_FLAG flag

Bastian Krause (1):
      dt-bindings: rtc: ds1307: add rx8130 compatible

Biwen Li (3):
      dt-bindings: rtc: add bindings for FlexTimer Module
      rtc: fsl-ftm-alarm: add FTM alarm driver
      rtc: pcf85363/pcf85263: fix regmap error in set_time

Bruno Thomsen (6):
      rtc: pcf2127: convert to devm_rtc_allocate_device
      rtc: pcf2127: cleanup register and bit defines
      rtc: pcf2127: bugfix: read rtc disables watchdog
      rtc: pcf2127: add watchdog feature support
      rtc: pcf2127: add tamper detection support
      rtc: pcf2127: bugfix: watchdog build dependency

Dan Carpenter (1):
      rtc: rv3029: revert error handling patch to rv3029_eeprom_write()

Fuqian Huang (1):
      rtc: mxc: use spin_lock_irqsave instead of spin_lock_irq in IRQ context

Kevin Hilman (1):
      dt-bindings: rtc: new binding for Amlogic VRTC

Matti Vaittinen (1):
      rtc: bd70528: fix driver dependencies

Maxime Ripard (1):
      dt-bindings: rtc: Remove the PCF8563 from the trivial RTCs

Neil Armstrong (1):
      rtc: Add Amlogic Virtual Wake RTC

Ondrej Jirman (2):
      dt-bindings: rtc: sun6i: Add compatible for H6 RTC
      rtc: sun6i: Add support for H6 RTC

Stephen Boyd (1):
      rtc: Remove dev_err() usage after platform_get_irq()

Wolfram Sang (6):
      rtc: isl12026: convert to i2c_new_dummy_device
      rtc: max77686: convert to i2c_new_dummy_device
      rtc: s35390a: convert to i2c_new_dummy_device
      rtc: s5m: convert to i2c_new_dummy_device
      rtc: max77686: convert to devm_i2c_new_dummy_device()
      rtc: s35390a: convert to devm_i2c_new_dummy_device()

 .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml      |  13 +
 .../devicetree/bindings/rtc/nxp,rtc-2123.txt       |   4 +-
 Documentation/devicetree/bindings/rtc/pcf8563.txt  |   4 +-
 .../devicetree/bindings/rtc/rtc-ds1307.txt         |   1 +
 .../devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt  |  36 ++
 .../devicetree/bindings/rtc/rtc-meson-vrtc.txt     |  22 ++
 .../devicetree/bindings/rtc/trivial-rtc.yaml       |   2 -
 MAINTAINERS                                        |   1 +
 drivers/rtc/Kconfig                                |  42 ++-
 drivers/rtc/Makefile                               |   3 +-
 drivers/rtc/class.c                                |   4 +-
 drivers/rtc/rtc-88pm80x.c                          |   6 +-
 drivers/rtc/rtc-88pm860x.c                         |   4 +-
 drivers/rtc/rtc-ab-eoz9.c                          |  24 +-
 drivers/rtc/rtc-ac100.c                            |  14 +-
 drivers/rtc/rtc-armada38x.c                        |  12 +-
 drivers/rtc/rtc-asm9260.c                          |   4 +-
 drivers/rtc/rtc-aspeed.c                           |   7 +-
 drivers/rtc/rtc-at91rm9200.c                       |   4 +-
 drivers/rtc/rtc-at91sam9.c                         |   4 +-
 drivers/rtc/rtc-bd70528.c                          |  11 +-
 drivers/rtc/rtc-brcmstb-waketimer.c                |   4 +-
 drivers/rtc/rtc-cadence.c                          |  13 +-
 drivers/rtc/rtc-davinci.c                          |   4 +-
 drivers/rtc/rtc-ds1305.c                           |   7 +-
 drivers/rtc/rtc-ds1672.c                           |   3 -
 drivers/rtc/rtc-fsl-ftm-alarm.c                    | 337 ++++++++++++++++++
 drivers/rtc/rtc-imx-sc.c                           |   4 +-
 drivers/rtc/rtc-imxdi.c                            |   4 +-
 drivers/rtc/rtc-isl12026.c                         |   6 +-
 drivers/rtc/rtc-jz4740.c                           |   8 +-
 drivers/rtc/rtc-max77686.c                         |  26 +-
 drivers/rtc/rtc-meson-vrtc.c                       | 155 +++++++++
 drivers/rtc/rtc-mt6397.c                           |   4 +-
 drivers/rtc/rtc-mt7622.c                           |   1 -
 drivers/rtc/rtc-mxc.c                              |   5 +-
 drivers/rtc/rtc-mxc_v2.c                           |   4 +-
 drivers/rtc/rtc-nuc900.c                           | 271 ---------------
 drivers/rtc/rtc-pcf2123.c                          | 136 ++++----
 drivers/rtc/rtc-pcf2127.c                          | 380 ++++++++++++++++++---
 drivers/rtc/rtc-pcf85363.c                         |   7 +-
 drivers/rtc/rtc-pcf8563.c                          |  48 ++-
 drivers/rtc/rtc-pic32.c                            |   4 +-
 drivers/rtc/rtc-pm8xxx.c                           |   4 +-
 drivers/rtc/rtc-puv3.c                             |  12 +-
 drivers/rtc/rtc-pxa.c                              |   8 +-
 drivers/rtc/rtc-rk808.c                            |   6 +-
 drivers/rtc/rtc-rv3028.c                           |   3 +-
 drivers/rtc/rtc-rv3029c2.c                         |  16 +-
 drivers/rtc/rtc-rv8803.c                           |   3 +-
 drivers/rtc/rtc-s35390a.c                          |  56 +--
 drivers/rtc/rtc-s3c.c                              |   8 +-
 drivers/rtc/rtc-s5m.c                              |   6 +-
 drivers/rtc/rtc-sc27xx.c                           |   7 +-
 drivers/rtc/rtc-sd3078.c                           |   4 +-
 drivers/rtc/rtc-snvs.c                             |  25 +-
 drivers/rtc/rtc-spear.c                            |   4 +-
 drivers/rtc/rtc-stm32.c                            |   1 -
 drivers/rtc/rtc-sun6i.c                            |  74 +++-
 drivers/rtc/rtc-sunxi.c                            |  14 +-
 drivers/rtc/rtc-tegra.c                            |   8 +-
 drivers/rtc/rtc-tps6586x.c                         |   5 +-
 drivers/rtc/rtc-tps65910.c                         |   8 +-
 drivers/rtc/rtc-vt8500.c                           |   4 +-
 drivers/rtc/rtc-xgene.c                            |   4 +-
 drivers/rtc/rtc-zynqmp.c                           |   8 +-
 66 files changed, 1214 insertions(+), 727 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-meson-vrtc.txt
 create mode 100644 drivers/rtc/rtc-fsl-ftm-alarm.c
 create mode 100644 drivers/rtc/rtc-meson-vrtc.c
 delete mode 100644 drivers/rtc/rtc-nuc900.c

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
