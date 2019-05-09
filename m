Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1BE2193F6
	for <lists+linux-rtc@lfdr.de>; Thu,  9 May 2019 23:03:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726780AbfEIVDn (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 9 May 2019 17:03:43 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:38751 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726773AbfEIVDn (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 9 May 2019 17:03:43 -0400
X-Originating-IP: 90.66.53.80
Received: from localhost (lfbn-1-3034-80.w90-66.abo.wanadoo.fr [90.66.53.80])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 8F98B40003;
        Thu,  9 May 2019 21:03:40 +0000 (UTC)
Date:   Thu, 9 May 2019 23:03:40 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RTC for 5.2
Message-ID: <20190509210340.GA23061@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello Linus,

A huge series from me this cycle. I went through many drivers to set the
date and time range supported by the RTC which helps solving HW
limitation when the time comes (as early as next year for some). This
time, I focused on drivers using .set_mms and .set_mmss64, allowing me
to remove those callbacks. About a third of the patches got reviews, I
actually own the RTCs and I tested another third and the remaining one
are unlikely to cause any issues.

Other than that, a single new driver and the usual fixes here and there.

The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:

  Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-5.2

for you to fetch changes up to dacb6a4035a010e41abaf81c1cfe2beadfb05ec8:

  rtc: snvs: Use __maybe_unused instead of #if CONFIG_PM_SLEEP (2019-05-08 22:14:36 +0200)

----------------------------------------------------------------
RTC for 5.2

Subsystem:
 - set_mmss and set_mmss64 rtc_ops removal
 - Fix timestamp value for RTC_TIMESTAMP_BEGIN_1900
 - Use SPDX identifier for the core
 - validate upper bound of tm->tm_year

New driver:
 - Aspeed BMC SoC RTC

Drivers:
 - abx80x: use rtc_add_group
 - ds3232: nvram support
 - pcf85063: add alarm, nvram, offset correction and microcrystal rv8263 support
 - x1205: add of_match_table
 - Use set_time instead of set_mms/set_mmss64 for: ab3100, coh901331, digicolor,
   ds1672, ds2404, ep93xx, imxdi, jz4740, lpc32xx, mc13xxx, mxc, pcap, stmp3xxx,
   test, wm831x, xgene.
 - Set RTC range for: ab3100, at91sam9, coh901331, da9063, digicolor, dm355evm,
   ds1672, ds2404, ep39xx, goldfish, imxdi, jz4740, lpc32xx, mc13xxx, mv, mxc,
   omap, pcap, pcf85063, pcf85363, ps3, sh, stmp3xxx, sun4v, tegra, wm831x,
   xgene.
 - Switch to rtc_time64_to_tm/rtc_tm_to_time64 for the driver that properly set
   the RTC range.
 - Use dev_get_drvdata instead of multiple indirections.

----------------------------------------------------------------
Alexandre Belloni (150):
      rtc: abx80x: convert to SPDX identifier
      rtc: abx80x: use rtc_add_group
      rtc: abx80x: remove useless .remove
      rtc: zynqmp: convert to SPDX identifier
      rtc: ab-b5ze-s3: remove mutex
      rtc: ab-b5ze-s3: remove unnecessary gotos
      rtc: ab-b5ze-s3: switch to rtc_time64_to_tm/rtc_tm_to_time64
      rtc: ab-b5ze-s3: convert to SPDX identifier
      rtc: ab-b5ze-s3: remove unnecessary check
      rtc: convert core to SPDX identifier
      rtc: mv: convert to SPDX identifier
      rtc: mv: convert to devm_rtc_allocate_device
      rtc: mv: add range
      rtc: omap: let the core handle range
      rtc: core: correct trivial checkpatch warnings
      rtc: ab-b5ze-s3: correct checkpatch issues
      rtc: 88pm80x: convert to SPDX identifier
      rtc: test: do not use assignment in if condition
      rtc: xgene: fix possible race condition
      rtc: xgene: set range
      rtc: xgene: convert to SPDX identifier
      rtc: xgene: correct checkpatch issues
      rtc: xgene: stop caching alarm_time
      rtc: xgene: switch to rtc_time64_to_tm/rtc_tm_to_time64
      rtc: xgene: use .set_time
      rtc: goldfish: convert to devm_rtc_allocate_device
      rtc: goldfish: add range
      rtc: goldfish: sort headers
      rtc: goldfish: allow building on more than MIPS
      rtc: goldfish: switch to rtc_time64_to_tm/rtc_tm_to_time64
      rtc: goldfish: convert to SPDX identifier
      rtc: dm355evm: convert to devm_rtc_allocate_device
      rtc: dm355evm: set range
      rtc: dm355evm: switch to rtc_time64_to_tm/rtc_tm_to_time64
      rtc: dm355evm: convert to SPDX identifier
      rtc: sh: stop resetting time to epoch
      rtc: sh: fix possible race condition
      rtc: sh: set range
      rtc: at91sam9: drop platform_data support
      rtc: at91sam9: convert to devm_rtc_allocate_device
      rtc: at91sam9: set range
      rtc: at91sam9: switch to rtc_time64_to_tm/rtc_tm_to_time64
      rtc: at91sam9: convert to SPDX identifier
      rtc: at91sam9: correct trivial checkpatch warnings
      rtc: ps3: switch to rtc_time64_to_tm/rtc_tm_to_time64
      rtc: ps3: convert to SPDX identifier
      rtc: ps3: convert to devm_rtc_allocate_device
      rtc: ps3: set range
      rtc: omap: switch to rtc_time64_to_tm/rtc_tm_to_time64
      rtc: omap: convert to SPDX identifier
      rtc: sun4v: switch to rtc_time64_to_tm/rtc_tm_to_time64
      rtc: sun4v: set range
      rtc: sun4v: switch to SPDX identifier
      rtc: da9063: set range
      rtc: da9063: switch to rtc_time64_to_tm/rtc_tm_to_time64
      rtc: wm831x: set range
      rtc: wm831x: remove unnecessary goto
      rtc: wm831x: switch to rtc_time64_to_tm/rtc_tm_to_time64
      rtc: wm831x: convert to SPDX identifier
      rtc: brcmstb-waketimer: switch to rtc_time64_to_tm
      rtc: pcf85063: switch to probe_new
      rtc: pcf85063: convert to SPDX identifier
      rtc: pcf85063: remove bogus i2c functionality check
      rtc: pcf85063: convert to devm_rtc_allocate_device
      rtc: pcf85063: set range
      rtc: pcf85063: switch to regmap
      rtc: pcf85063: differentiate pcf85063a and pcf85063tp
      rtc: pcf85063: add alarm support
      rtc: pcf85063: add Micro Crystal RV8263 support
      rtc: pcf85063: add nvram support
      rtc: pcf85063: add offset correction support
      rtc: pcf85063: add RTC_VL_READ/RTC_VL_CLR support
      rtc: remove unnecessary Kconfig dependencies
      rtc: test: use .set_time
      rtc: ds1672: set range
      rtc: ds1672: move oscillator handling to .read_time
      rtc: ds1672: remove sysfs debug interface
      rtc: ds1672: remove useless indirection
      rtc: ds1672: use rtc_time64_to_tm
      rtc: ds1672: use .set_time
      rtc: ds1672: convert to SPDX identifier
      rtc: ds1672: switch debug message to %ptR
      rtc: coh901331: set range
      rtc: coh901331: switch to rtc_time64_to_tm/rtc_tm_to_time64
      rtc: coh901331: use .set_time
      rtc: coh901331: convert to SPDX identifier
      rtc: tegra: set range
      rtc: tegra: switch to rtc_time64_to_tm/rtc_tm_to_time64
      rtc: tegra: convert to SPDX identifier
      rtc: stmp3xxx: set range
      rtc: stmp3xxx: switch to rtc_time64_to_tm/rtc_tm_to_time64
      rtc: stmp3xxx: use .set_time
      rtc: stmp3xxx: convert to SPDX identifier
      rtc: pcf85363: remove unused struct pcf85363 member
      rtc: pcf85363: set range
      rtc: pcf85363: remove bogus i2c functionality check
      rtc: pcf85363: remove useless forward declaration
      rtc: pcf85363: convert to SPDX identifier
      rtc: ab3100: set range
      rtc: ab3100: use .set_time
      rtc: ab3100: convert to SPDX identifier
      rtc: lpc32xx: convert to devm_rtc_allocate_device
      rtc: lpc32xx: set range
      rtc: lpc32xx: simplify IRQ setup
      rtc: lpc32xx: switch to rtc_time64_to_tm/rtc_tm_to_time64
      rtc: lpc32xx: use .set_time
      rtc: lpc32xx: convert to SPDX identifier
      rtc: mc13xxx: set range
      rtc: mc13xxx: use .set_time
      rtc: mc13xxx: convert to SPDX identifier
      rtc: mc13xxx: fix style issue
      rtc: ep93xx: stop setting platform_data
      rtc: ep93xx: convert to devm_rtc_allocate_device
      rtc: ep93xx: use rtc_add_group
      rtc: ep93xx: set range
      rtc: ep93xx: switch to rtc_time64_to_tm
      rtc: ep93xx: use .set_time
      rtc: ep93xx: convert to SPDX identifier
      rtc: ep93xx: fix checkpatch issues
      rtc: ds2404: set range
      rtc: ds2404: switch to rtc_time64_to_tm
      rtc: ds2404: use .set_time
      rtc: ds2404: convert to SPDX identifier
      rtc: ds2404: remove ds2404_chip_ops
      rtc: ds2404: simplify .probe and remove .remove
      rtc: wm831x: use .set_time
      rtc: mxc: fix possible race condition
      rtc: mxc: set range
      rtc: mxc: use .set_time
      rtc: imxdi: set range
      rtc: imxdi: switch to rtc_time64_to_tm/rtc_tm_to_time64
      rtc: imxdi: use .set_time
      rtc: imxdi: remove unnecessary check
      rtc: imxdi: convert to SPDX identifier
      rtc: jz4740: set range
      rtc: jz4740: switch to rtc_time64_to_tm/rtc_tm_to_time64
      rtc: jz4740: remove useless check
      rtc: jz4740: use .set_time
      rtc: jz4740: use dev_pm_set_wake_irq() to simplify code
      rtc: jz4740: rework invalid time detection
      rtc: jz4740: convert to SPDX identifier
      rtc: digicolor: fix possible race condition
      rtc: digicolor: set range
      rtc: digicolor: use .set_time
      rtc: digicolor: convert to SPDX identifier
      rtc: pcap: set range
      rtc: pcap: switch to rtc_time64_to_tm/rtc_tm_to_time64
      rtc: pcap: use .set_time
      rtc: pcap: convert to SPDX identifier
      rtc: drop set_mms and set_mmss64

Anders Roxell (1):
      rtc: imxdi: remove unused variable

Andy Shevchenko (1):
      rtc: rx8025: Fix a parameter to %ptR in rx8025_read_alarm()

Anson Huang (6):
      rtc: snvs: use dev_pm_set_wake_irq() to simplify code
      rtc: mxc: use devm_platform_ioremap_resource() to simplify code
      rtc: snvs: use devm_platform_ioremap_resource() to simplify code
      rtc: mxc: use dev_pm_set_wake_irq() to simplify code
      rtc: mxc_v2: use dev_pm_set_wake_irq() to simplify code
      rtc: snvs: Use __maybe_unused instead of #if CONFIG_PM_SLEEP

Daniel Gomez (1):
      rtc: rx6110: declare missing of table

Fabien Dessenne (1):
      rtc: stm32: manage the get_irq probe defer case

Geert Uytterhoeven (1):
      rtc: Fix timestamp value for RTC_TIMESTAMP_BEGIN_1900

Han Nandor (1):
      rtc: ds3232: get SRAM access using NVMEM Framework

Joel Stanley (2):
      dt-bindings: rtc: Add on-chip ASPEED RTC documentation
      rtc: Add ASPEED RTC driver

Kefeng Wang (1):
      rtc: Use dev_get_drvdata()

Linus Walleij (2):
      rtc: x1205: Add DT bindings
      rtc: x1205: Add DT probing support

Pi-Hsun Shih (1):
      rtc: mt6397: Don't call irq_dispose_mapping.

Sven Van Asbroeck (1):
      rtc: 88pm860x: prevent use-after-free on device remove

Thomas Bogendoerfer (3):
      rtc: ds1685: fix crash caused by referencing wrong device struct
      rtc: ds1685: remove dead code
      rtc: ds1685: use threaded interrupt

Wolfram Sang (2):
      rtc: da9063: convert header to SPDX
      rtc: don't reference bogus function pointer in kdoc

Xuefeng Wang (1):
      rtc: lib: check whether tm->tm_year in int32 range

YueHaibing (2):
      rtc: opal: Make opal_tpo_alarm_irq_enable static
      rtc: sirfsoc: Make sysrtc_regmap_config static

 .../devicetree/bindings/rtc/nxp,pcf85063.txt       |   6 +-
 .../devicetree/bindings/rtc/rtc-aspeed.txt         |  22 +
 Documentation/devicetree/bindings/rtc/rtc.txt      |   1 +
 drivers/rtc/Kconfig                                |  19 +-
 drivers/rtc/Makefile                               |   1 +
 drivers/rtc/class.c                                |  21 +-
 drivers/rtc/dev.c                                  |  20 +-
 drivers/rtc/hctosys.c                              |  10 +-
 drivers/rtc/interface.c                            | 107 +++--
 drivers/rtc/lib.c                                  |  30 +-
 drivers/rtc/nvmem.c                                |   7 +-
 drivers/rtc/proc.c                                 |  21 +-
 drivers/rtc/rtc-88pm80x.c                          |  14 +-
 drivers/rtc/rtc-88pm860x.c                         |   2 +-
 drivers/rtc/rtc-ab-b5ze-s3.c                       | 189 +++------
 drivers/rtc/rtc-ab3100.c                           |  24 +-
 drivers/rtc/rtc-abx80x.c                           |  43 +-
 drivers/rtc/rtc-aspeed.c                           | 136 +++++++
 drivers/rtc/rtc-at91sam9.c                         | 108 ++---
 drivers/rtc/rtc-brcmstb-waketimer.c                |   2 +-
 drivers/rtc/rtc-coh901331.c                        |  37 +-
 drivers/rtc/rtc-da9063.c                           |  27 +-
 drivers/rtc/rtc-digicolor.c                        |  25 +-
 drivers/rtc/rtc-dm355evm.c                         |  24 +-
 drivers/rtc/rtc-ds1672.c                           | 127 ++----
 drivers/rtc/rtc-ds1685.c                           | 262 +++++-------
 drivers/rtc/rtc-ds2404.c                           |  73 +---
 drivers/rtc/rtc-ds3232.c                           |  40 +-
 drivers/rtc/rtc-ep93xx.c                           |  70 ++--
 drivers/rtc/rtc-goldfish.c                         |  50 +--
 drivers/rtc/rtc-hid-sensor-time.c                  |   3 +-
 drivers/rtc/rtc-imxdi.c                            |  50 +--
 drivers/rtc/rtc-jz4740.c                           |  95 ++---
 drivers/rtc/rtc-lpc32xx.c                          |  59 +--
 drivers/rtc/rtc-mc13xxx.c                          |  25 +-
 drivers/rtc/rtc-mt6397.c                           |   9 +-
 drivers/rtc/rtc-mv.c                               |  33 +-
 drivers/rtc/rtc-mxc.c                              |  86 ++--
 drivers/rtc/rtc-mxc_v2.c                           |  29 +-
 drivers/rtc/rtc-omap.c                             |  32 +-
 drivers/rtc/rtc-opal.c                             |   2 +-
 drivers/rtc/rtc-pcap.c                             |  28 +-
 drivers/rtc/rtc-pcf85063.c                         | 446 ++++++++++++++++-----
 drivers/rtc/rtc-pcf85363.c                         |  20 +-
 drivers/rtc/rtc-ps3.c                              |  30 +-
 drivers/rtc/rtc-pxa.c                              |   3 +-
 drivers/rtc/rtc-rk808.c                            |   6 +-
 drivers/rtc/rtc-rx6110.c                           |   9 +
 drivers/rtc/rtc-rx8025.c                           |   2 +-
 drivers/rtc/rtc-sh.c                               |  30 +-
 drivers/rtc/rtc-sirfsoc.c                          |   2 +-
 drivers/rtc/rtc-snvs.c                             |  48 +--
 drivers/rtc/rtc-stm32.c                            |   9 +-
 drivers/rtc/rtc-stmp3xxx.c                         |  34 +-
 drivers/rtc/rtc-sun4v.c                            |  21 +-
 drivers/rtc/rtc-tegra.c                            |  47 +--
 drivers/rtc/rtc-test.c                             |  11 +-
 drivers/rtc/rtc-tx4939.c                           |  17 +-
 drivers/rtc/rtc-wm831x.c                           |  69 ++--
 drivers/rtc/rtc-wm8350.c                           |  12 +-
 drivers/rtc/rtc-x1205.c                            |   7 +
 drivers/rtc/rtc-xgene.c                            |  61 ++-
 drivers/rtc/rtc-zynqmp.c                           |  13 +-
 drivers/rtc/sysfs.c                                |  23 +-
 drivers/rtc/systohc.c                              |  13 +-
 include/linux/rtc.h                                |   6 +-
 include/linux/rtc/ds1685.h                         |   2 -
 67 files changed, 1400 insertions(+), 1510 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-aspeed.txt
 create mode 100644 drivers/rtc/rtc-aspeed.c

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
