Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1542D320ECA
	for <lists+linux-rtc@lfdr.de>; Mon, 22 Feb 2021 02:00:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230000AbhBVA5q (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 21 Feb 2021 19:57:46 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:56151 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229876AbhBVA5o (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 21 Feb 2021 19:57:44 -0500
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id E5FBE240002;
        Mon, 22 Feb 2021 00:56:52 +0000 (UTC)
Date:   Mon, 22 Feb 2021 01:56:52 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RTC for 5.12
Message-ID: <YDMBVCTgavxdqkj6@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello Linus,

Here is the RTC subsystem pull request for v5.12. Many cleanups and a
few drivers removal this cycle.

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-5.12

for you to fetch changes up to 49dfc1f16b03a6abc17721d4600f7a0bf3d3e4ed:

  rtc: abx80x: Add utility function for writing configuration key (2021-02-13 23:03:26 +0100)

----------------------------------------------------------------
RTC for 5.12

Subsystem:
 - Introduce features bitfield and the first feature: RTC_FEATURE_ALARM

Removed drivers:
 - ab3100
 - coh901331
 - tx4939
 - sirfsoc

Drivers:
 - use rtc_lock and rtc_unlock instead of opencoding
 - constify all struct rtc_class_ops
 - quiet maybe-unused variable warning
 - replace spin_lock_irqsave with spin_lock in hard IRQ
 - pcf2127: disable Power-On Reset Override and run OTP refresh

----------------------------------------------------------------
Alexandre Belloni (58):
      rtc: opal: set range
      rtc: introduce features bitfield
      rtc: pl031: use RTC_FEATURE_ALARM
      rtc: armada38x: remove armada38x_rtc_ops_noirq
      rtc: cmos: remove cmos_rtc_ops_no_alarm
      rtc: mv: remove mv_rtc_alarm_ops
      rtc: m48t59: remove m48t02_rtc_ops
      rtc: pcf2127: remove pcf2127_rtc_alrm_ops
      rtc: pcf85063: remove pcf85063_rtc_ops_alarm
      rtc: rx8010: drop a struct rtc_class_ops
      rtc: pcf85363: drop a struct rtc_class_ops
      rtc: m41t80: constify m41t80_rtc_ops
      rtc: opal: constify opal_rtc_ops
      rtc: rv3028: constify rv3028_rtc_ops
      rtc: rv3029: constify rv3029_rtc_ops
      rtc: rv3032: constify rv3032_rtc_ops
      rtc: rv8803: constify rv8803_rtc_ops
      rtc: tps65910: remove tps65910_rtc_ops_noirq
      rtc: ac100: use rtc_lock/rtc_unlock
      rtc: asm9260: use rtc_lock/rtc_unlock
      rtc: ds1305: use rtc_lock/rtc_unlock
      rtc: ds1307: use rtc_lock/rtc_unlock
      rtc: ds1685: use rtc_lock/rtc_unlock
      rtc: ds3232: use rtc_lock/rtc_unlock
      rtc: hym8563: use rtc_lock/rtc_unlock
      rtc: m41t80: use rtc_lock/rtc_unlock
      rtc: mcp795: use rtc_lock/rtc_unlock
      rtc: pcf2123: use rtc_lock/rtc_unlock
      rtc: rv3029: use rtc_lock/rtc_unlock
      rtc: rx8010: use rtc_lock/rtc_unlock
      rtc: rx8025: use rtc_lock/rtc_unlock
      rtc: stm32: use rtc_lock/rtc_unlock
      rtc: rv3028: fix PORF handling
      rtc: rv3028: remove useless warning messages
      dt-bindings: rtc: pcf2127: update bindings
      rtc: class: remove bogus documentation
      rtc: armada38x: depend on OF
      rtc: bq32k: quiet maybe-unused variable warning
      rtc: brcmstb-waketimer: quiet maybe-unused variable warning
      rtc: digicolor: quiet maybe-unused variable warning
      rtc: ds1672: quiet maybe-unused variable warning
      rtc: ds3232: quiet maybe-unused variable warning
      rtc: isl1208: quiet maybe-unused variable warning
      rtc: m41t80: quiet maybe-unused variable warning
      rtc: meson: quiet maybe-unused variable warning
      rtc: pcf85063: quiet maybe-unused variable warnings
      rtc: pcf85363: quiet maybe-unused variable warning
      rtc: rs5c372: quiet maybe-unused variable warning
      rtc: rv3028: quiet maybe-unused variable warning
      rtc: rv3029: quiet maybe-unused variable warning
      rtc: rv3032: quiet maybe-unused variable warning
      rtc: rv8803: quiet maybe-unused variable warning
      rtc: rx8010: quiet maybe-unused variable warning
      rtc: rx8581: quiet maybe-unused variable warning
      rtc: s35390a: quiet maybe-unused variable warning
      rtc: sd3078: quiet maybe-unused variable warning
      rtc: s3c: stop setting bogus time
      rtc: s3c: quiet maybe-unused variable warning

Arnd Bergmann (4):
      rtc: rx6110: fix build against modular I2C
      rtc: remove sirfsoc driver
      rtc: remove ste coh901 driver
      rtc: remove ste ab3100 driver

Bartosz Golaszewski (3):
      rtc: s5m: select REGMAP_I2C
      rtc: s5m: use devm_i2c_new_dummy_device()
      rtc: s5m: check the return value of s5m8767_rtc_init_reg()

Biwen Li (1):
      rtc: pcf2127: properly set flag WD_CD for rtc chips(pcf2129, pca2129)

Claudiu Beznea (1):
      dt-bindings: rtc: at91rm9200: add sama7g5 compatible

David Gow (1):
      rtc: zynqmp: depend on HAS_IOMEM

Dmitry Osipenko (1):
      rtc: tps65910: Support wakeup-source property

Guixiong Wei (1):
      rtc: pm8xxx: Read ALARM_EN and update to alarm enabled status

Kevin P. Fleming (1):
      rtc: abx80x: Add utility function for writing configuration key

Marek Vasut (1):
      rtc: pcf8563: Add NXP PCA8565 compatible

Philipp Rosenberger (2):
      rtc: pcf2127: Disable Power-On Reset Override
      rtc: pcf2127: Run a OTP refresh if not done before

Thomas Bogendoerfer (1):
      rtc: tx4939: Remove driver

Xiaofei Tan (6):
      rtc: cmos: Replace spin_lock_irqsave with spin_lock in hard IRQ
      rtc: pm8xxx: Replace spin_lock_irqsave with spin_lock in hard IRQ
      rtc: r7301: Replace spin_lock_irqsave with spin_lock in hard IRQ
      rtc: tegra: Replace spin_lock_irqsave with spin_lock in hard IRQ
      rtc: mxc: Replace spin_lock_irqsave with spin_lock in hard IRQ
      rtc: mxc_v2: Replace spin_lock_irqsave with spin_lock in hard IRQ

 .../bindings/rtc/atmel,at91rm9200-rtc.yaml         |   1 +
 .../devicetree/bindings/rtc/nxp,pcf2127.yaml       |  51 +++
 Documentation/devicetree/bindings/rtc/pcf8563.txt  |   3 +-
 .../devicetree/bindings/rtc/sirf,prima2-sysrtc.txt |  13 -
 .../bindings/rtc/stericsson,coh901331.txt          |  16 -
 .../devicetree/bindings/rtc/trivial-rtc.yaml       |   6 +-
 drivers/rtc/Kconfig                                |  38 +-
 drivers/rtc/Makefile                               |   4 -
 drivers/rtc/class.c                                |  10 +-
 drivers/rtc/interface.c                            |  12 +-
 drivers/rtc/rtc-ab3100.c                           | 254 ------------
 drivers/rtc/rtc-abx80x.c                           |  39 +-
 drivers/rtc/rtc-ac100.c                            |   4 +-
 drivers/rtc/rtc-armada38x.c                        |  21 +-
 drivers/rtc/rtc-asm9260.c                          |   6 +-
 drivers/rtc/rtc-bq32k.c                            |   2 +-
 drivers/rtc/rtc-brcmstb-waketimer.c                |   2 +-
 drivers/rtc/rtc-cmos.c                             |  17 +-
 drivers/rtc/rtc-coh901331.c                        | 290 --------------
 drivers/rtc/rtc-digicolor.c                        |   2 +-
 drivers/rtc/rtc-ds1305.c                           |   5 +-
 drivers/rtc/rtc-ds1307.c                           |   5 +-
 drivers/rtc/rtc-ds1672.c                           |   2 +-
 drivers/rtc/rtc-ds1685.c                           |   6 +-
 drivers/rtc/rtc-ds3232.c                           |   7 +-
 drivers/rtc/rtc-hym8563.c                          |   5 +-
 drivers/rtc/rtc-isl1208.c                          |   2 +-
 drivers/rtc/rtc-m41t80.c                           |  25 +-
 drivers/rtc/rtc-m48t59.c                           |  22 +-
 drivers/rtc/rtc-mcp795.c                           |   5 +-
 drivers/rtc/rtc-meson.c                            |   2 +-
 drivers/rtc/rtc-mv.c                               |  14 +-
 drivers/rtc/rtc-mxc.c                              |   5 +-
 drivers/rtc/rtc-mxc_v2.c                           |   7 +-
 drivers/rtc/rtc-opal.c                             |  27 +-
 drivers/rtc/rtc-pcf2123.c                          |   5 +-
 drivers/rtc/rtc-pcf2127.c                          |  46 ++-
 drivers/rtc/rtc-pcf85063.c                         |  49 +--
 drivers/rtc/rtc-pcf85363.c                         |  10 +-
 drivers/rtc/rtc-pcf8563.c                          |   2 +
 drivers/rtc/rtc-pl031.c                            |   8 +-
 drivers/rtc/rtc-pm8xxx.c                           |  18 +-
 drivers/rtc/rtc-r7301.c                            |   5 +-
 drivers/rtc/rtc-rs5c372.c                          |   2 +-
 drivers/rtc/rtc-rv3028.c                           |  23 +-
 drivers/rtc/rtc-rv3029c2.c                         |  22 +-
 drivers/rtc/rtc-rv3032.c                           |  13 +-
 drivers/rtc/rtc-rv8803.c                           |  13 +-
 drivers/rtc/rtc-rx6110.c                           |   4 +-
 drivers/rtc/rtc-rx8010.c                           |  21 +-
 drivers/rtc/rtc-rx8025.c                           |   5 +-
 drivers/rtc/rtc-rx8581.c                           |   2 +-
 drivers/rtc/rtc-s35390a.c                          |   2 +-
 drivers/rtc/rtc-s3c.c                              |  17 +-
 drivers/rtc/rtc-s5m.c                              |  33 +-
 drivers/rtc/rtc-sd3078.c                           |   2 +-
 drivers/rtc/rtc-sirfsoc.c                          | 446 ---------------------
 drivers/rtc/rtc-stm32.c                            |   4 +-
 drivers/rtc/rtc-tegra.c                            |   6 +-
 drivers/rtc/rtc-tps65910.c                         |  19 +-
 drivers/rtc/rtc-tx4939.c                           | 303 --------------
 include/linux/rtc.h                                |   2 +
 include/linux/rtc/sirfsoc_rtciobrg.h               |  21 -
 include/uapi/linux/rtc.h                           |   5 +
 64 files changed, 321 insertions(+), 1717 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
 delete mode 100644 Documentation/devicetree/bindings/rtc/sirf,prima2-sysrtc.txt
 delete mode 100644 Documentation/devicetree/bindings/rtc/stericsson,coh901331.txt
 delete mode 100644 drivers/rtc/rtc-ab3100.c
 delete mode 100644 drivers/rtc/rtc-coh901331.c
 delete mode 100644 drivers/rtc/rtc-sirfsoc.c
 delete mode 100644 drivers/rtc/rtc-tx4939.c
 delete mode 100644 include/linux/rtc/sirfsoc_rtciobrg.h

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
