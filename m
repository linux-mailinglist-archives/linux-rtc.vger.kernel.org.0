Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D4742DF1EF
	for <lists+linux-rtc@lfdr.de>; Sat, 19 Dec 2020 23:13:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726357AbgLSWNh (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 19 Dec 2020 17:13:37 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:51503 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726332AbgLSWNh (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 19 Dec 2020 17:13:37 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 97F331BF204;
        Sat, 19 Dec 2020 22:12:54 +0000 (UTC)
Date:   Sat, 19 Dec 2020 23:12:54 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RTC for 5.11
Message-ID: <20201219221254.GA3604939@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello Linus,

Here is the RTC pull request for 5.11. There is a non trivial conflict 
with the tip tree in include/linux/rtc.h. This is properly solved in
linux-next, see:
https://lore.kernel.org/linux-next/20201214190704.78b44f5d@canb.auug.org.au/

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-5.11

for you to fetch changes up to 71ac13457d9d1007effde65b54818106b2c2b525:

  rtc: pcf2127: only use watchdog when explicitly available (2020-12-19 01:57:44 +0100)

----------------------------------------------------------------
RTC for 5.11

Subsystem:
 - Remove nvram ABI. There was no complaints about the deprecation for the last
   3 years.
 - Improve RTC device allocation and registration
 - Now available for ARCH=um

Drivers:
 - at91rm9200: correction and sam9x60 support
 - ds1307: improve ACPI support
 - mxc: now DT only
 - pcf2127: watchdog support now needs the reset-source property
 - pcf8523: set range
 - rx6110: i2c support

----------------------------------------------------------------
Alexandre Belloni (12):
      rtc: rv3032: fix nvram nvmem priv pointer
      rtc: at91rm9200: add correction support
      rtc: at91rm9200: Add sam9x60 compatible
      rtc: mxc: use of_device_get_match_data
      rtc: sc27xx: Always read normal alarm
      rtc: nvmem: remove nvram ABI
      rtc: pcf8523: switch to devm_rtc_allocate_device
      rtc: pcf8523: set range
      rtc: pcf8523: use BIT
      rtc: mxc{,_v2}: enable COMPILE_TEST
      rtc: test: remove debug message
      rtc: fix RTC removal

Andy Shevchenko (3):
      rtc: ds1307: Remove non-valid ACPI IDs
      rtc: ds1307: Make use of device properties
      rtc: ds1307: Drop of_match_ptr and CONFIG_OF protections

Bartosz Golaszewski (7):
      rtc: omap: use devm_pinctrl_register()
      Documentation: list RTC devres helpers in devres.rst
      rtc: add devm_ prefix to rtc_nvmem_register()
      rtc: nvmem: emit an error message when nvmem registration fails
      rtc: rework rtc_register_device() resource management
      rtc: shrink devm_rtc_allocate_device()
      rtc: destroy mutex when releasing the device

Claudius Heine (2):
      rtc: Kconfig: Fix typo in help message of rx 6110
      rtc: rx6110: add i2c support

Dan Carpenter (1):
      rtc: pcf2127: fix pcf2127_nvmem_read/write() returns

Dinghao Liu (1):
      rtc: sun6i: Fix memleak in sun6i_rtc_clk_init

Fabio Estevam (1):
      rtc: mxc: Convert the driver to DT-only

Guillaume Tucker (1):
      rtc: hym8563: enable wakeup when applicable

Jiaxun Yang (2):
      rtc: goldfish: Remove GOLDFISH dependency
      MAINTAINERS: Set myself as Goldfish RTC maintainer

Johannes Berg (1):
      rtc: enable RTC framework on ARCH=um

Kaixu Xia (2):
      rtc: sc27xx: Remove unnecessary conversion to bool
      rtc: da9063: Simplify bool comparison

Marek Szyprowski (2):
      rtc: s3c: Disable all enable (RTC, tick) bits in the probe
      rtc: s3c: Remove dead code related to periodic tick handling

Nikita Shubin (1):
      rtc: ep93xx: Fix NULL pointer dereference in ep93xx_rtc_read_time

Rasmus Villemoes (1):
      dt-bindings: rtc: add reset-source property

Tian Tao (1):
      rtc: cpcap: Fix missing IRQF_ONESHOT as only threaded handler

Uwe Kleine-König (2):
      rtc: pcf2127: move watchdog initialisation to a separate function
      rtc: pcf2127: only use watchdog when explicitly available

Xu Wang (2):
      rtc: brcmstb-waketimer: Remove redundant null check before clk_disable_unprepare
      rtc: snvs: Remove NULL pointer check before clk_*

Zheng Liang (1):
      rtc: pl031: fix resource leak in pl031_probe

 Documentation/devicetree/bindings/rtc/rtc.yaml   |   5 +
 Documentation/driver-api/driver-model/devres.rst |   6 +
 MAINTAINERS                                      |   2 +-
 arch/alpha/kernel/rtc.c                          |   2 +-
 drivers/mfd/menelaus.c                           |   2 +-
 drivers/rtc/Kconfig                              |  33 ++--
 drivers/rtc/class.c                              |  52 ++---
 drivers/rtc/nvmem.c                              |  91 +--------
 drivers/rtc/rtc-88pm80x.c                        |   2 +-
 drivers/rtc/rtc-88pm860x.c                       |   2 +-
 drivers/rtc/rtc-ab-b5ze-s3.c                     |   2 +-
 drivers/rtc/rtc-ab-eoz9.c                        |   2 +-
 drivers/rtc/rtc-ab3100.c                         |   2 +-
 drivers/rtc/rtc-ab8500.c                         |   2 +-
 drivers/rtc/rtc-abx80x.c                         |   2 +-
 drivers/rtc/rtc-ac100.c                          |   2 +-
 drivers/rtc/rtc-armada38x.c                      |   2 +-
 drivers/rtc/rtc-aspeed.c                         |   2 +-
 drivers/rtc/rtc-at91rm9200.c                     | 108 ++++++++++-
 drivers/rtc/rtc-at91sam9.c                       |   2 +-
 drivers/rtc/rtc-au1xxx.c                         |   2 +-
 drivers/rtc/rtc-bd70528.c                        |   2 +-
 drivers/rtc/rtc-brcmstb-waketimer.c              |   5 +-
 drivers/rtc/rtc-cadence.c                        |   2 +-
 drivers/rtc/rtc-cmos.c                           |   6 +-
 drivers/rtc/rtc-coh901331.c                      |   2 +-
 drivers/rtc/rtc-cpcap.c                          |   8 +-
 drivers/rtc/rtc-cros-ec.c                        |   2 +-
 drivers/rtc/rtc-da9052.c                         |   2 +-
 drivers/rtc/rtc-da9063.c                         |   4 +-
 drivers/rtc/rtc-davinci.c                        |   2 +-
 drivers/rtc/rtc-digicolor.c                      |   2 +-
 drivers/rtc/rtc-dm355evm.c                       |   2 +-
 drivers/rtc/rtc-ds1305.c                         |   5 +-
 drivers/rtc/rtc-ds1307.c                         |  83 +++-----
 drivers/rtc/rtc-ds1343.c                         |   5 +-
 drivers/rtc/rtc-ds1347.c                         |   2 +-
 drivers/rtc/rtc-ds1374.c                         |   2 +-
 drivers/rtc/rtc-ds1511.c                         |   6 +-
 drivers/rtc/rtc-ds1553.c                         |   6 +-
 drivers/rtc/rtc-ds1672.c                         |   2 +-
 drivers/rtc/rtc-ds1685.c                         |   5 +-
 drivers/rtc/rtc-ds1742.c                         |   6 +-
 drivers/rtc/rtc-ds2404.c                         |   2 +-
 drivers/rtc/rtc-ds3232.c                         |   2 +-
 drivers/rtc/rtc-ep93xx.c                         |   8 +-
 drivers/rtc/rtc-fsl-ftm-alarm.c                  |   2 +-
 drivers/rtc/rtc-ftrtc010.c                       |   2 +-
 drivers/rtc/rtc-goldfish.c                       |   2 +-
 drivers/rtc/rtc-hym8563.c                        |   7 +-
 drivers/rtc/rtc-imx-sc.c                         |   2 +-
 drivers/rtc/rtc-imxdi.c                          |   2 +-
 drivers/rtc/rtc-isl12026.c                       |   4 +-
 drivers/rtc/rtc-isl1208.c                        |   4 +-
 drivers/rtc/rtc-jz4740.c                         |   2 +-
 drivers/rtc/rtc-lpc32xx.c                        |   2 +-
 drivers/rtc/rtc-ls1x.c                           |   2 +-
 drivers/rtc/rtc-m41t80.c                         |   2 +-
 drivers/rtc/rtc-m48t59.c                         |   5 +-
 drivers/rtc/rtc-m48t86.c                         |   5 +-
 drivers/rtc/rtc-mc13xxx.c                        |   2 +-
 drivers/rtc/rtc-meson-vrtc.c                     |   2 +-
 drivers/rtc/rtc-meson.c                          |   4 +-
 drivers/rtc/rtc-mpc5121.c                        |   2 +-
 drivers/rtc/rtc-mrst.c                           |   2 +-
 drivers/rtc/rtc-mt2712.c                         |   2 +-
 drivers/rtc/rtc-mt6397.c                         |   2 +-
 drivers/rtc/rtc-mv.c                             |   2 +-
 drivers/rtc/rtc-mxc.c                            |  25 +--
 drivers/rtc/rtc-mxc_v2.c                         |   2 +-
 drivers/rtc/rtc-omap.c                           |  13 +-
 drivers/rtc/rtc-pcap.c                           |   2 +-
 drivers/rtc/rtc-pcf2123.c                        |   2 +-
 drivers/rtc/rtc-pcf2127.c                        |  73 +++----
 drivers/rtc/rtc-pcf85063.c                       |   4 +-
 drivers/rtc/rtc-pcf8523.c                        |  34 ++--
 drivers/rtc/rtc-pcf85363.c                       |   4 +-
 drivers/rtc/rtc-pcf8563.c                        |   2 +-
 drivers/rtc/rtc-pic32.c                          |   2 +-
 drivers/rtc/rtc-pl030.c                          |   2 +-
 drivers/rtc/rtc-pl031.c                          |   8 +-
 drivers/rtc/rtc-pm8xxx.c                         |   2 +-
 drivers/rtc/rtc-ps3.c                            |   2 +-
 drivers/rtc/rtc-r9701.c                          |   2 +-
 drivers/rtc/rtc-rc5t619.c                        |   2 +-
 drivers/rtc/rtc-rk808.c                          |   2 +-
 drivers/rtc/rtc-rp5c01.c                         |   5 +-
 drivers/rtc/rtc-rs5c348.c                        |   2 +-
 drivers/rtc/rtc-rv3028.c                         |   6 +-
 drivers/rtc/rtc-rv3029c2.c                       |   4 +-
 drivers/rtc/rtc-rv3032.c                         |   8 +-
 drivers/rtc/rtc-rv8803.c                         |   5 +-
 drivers/rtc/rtc-rx6110.c                         | 165 +++++++++++++---
 drivers/rtc/rtc-rx8010.c                         |   2 +-
 drivers/rtc/rtc-rx8581.c                         |   4 +-
 drivers/rtc/rtc-s35390a.c                        |   2 +-
 drivers/rtc/rtc-s3c.c                            | 230 +----------------------
 drivers/rtc/rtc-sa1100.c                         |   2 +-
 drivers/rtc/rtc-sc27xx.c                         |  42 +----
 drivers/rtc/rtc-sd3078.c                         |   2 +-
 drivers/rtc/rtc-sh.c                             |   2 +-
 drivers/rtc/rtc-sirfsoc.c                        |   2 +-
 drivers/rtc/rtc-snvs.c                           |  69 +++----
 drivers/rtc/rtc-st-lpc.c                         |   2 +-
 drivers/rtc/rtc-starfire.c                       |   2 +-
 drivers/rtc/rtc-stk17ta8.c                       |   5 +-
 drivers/rtc/rtc-stmp3xxx.c                       |   2 +-
 drivers/rtc/rtc-sun4v.c                          |   2 +-
 drivers/rtc/rtc-sun6i.c                          |  10 +-
 drivers/rtc/rtc-sunxi.c                          |   2 +-
 drivers/rtc/rtc-tegra.c                          |   2 +-
 drivers/rtc/rtc-test.c                           |   3 +-
 drivers/rtc/rtc-tps6586x.c                       |   2 +-
 drivers/rtc/rtc-tps65910.c                       |   2 +-
 drivers/rtc/rtc-tx4939.c                         |   5 +-
 drivers/rtc/rtc-vr41xx.c                         |   2 +-
 drivers/rtc/rtc-vt8500.c                         |   2 +-
 drivers/rtc/rtc-wilco-ec.c                       |   2 +-
 drivers/rtc/rtc-wm831x.c                         |   2 +-
 drivers/rtc/rtc-xgene.c                          |   2 +-
 drivers/rtc/rtc-zynqmp.c                         |   2 +-
 drivers/rtc/sysfs.c                              |   2 -
 include/linux/rtc.h                              |  22 +--
 123 files changed, 579 insertions(+), 790 deletions(-)

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
