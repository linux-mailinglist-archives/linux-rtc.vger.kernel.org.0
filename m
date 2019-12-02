Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83FF310EE2D
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Dec 2019 18:29:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727556AbfLBR3J (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 2 Dec 2019 12:29:09 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:52323 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727542AbfLBR3J (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 2 Dec 2019 12:29:09 -0500
X-Originating-IP: 90.65.102.129
Received: from localhost (lfbn-1-1480-129.w90-65.abo.wanadoo.fr [90.65.102.129])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id E1FEBC000A;
        Mon,  2 Dec 2019 17:29:06 +0000 (UTC)
Date:   Mon, 2 Dec 2019 18:29:06 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RTC for 5.5
Message-ID: <20191202172906.GA1034578@piout.net>
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

Here is the pull-request for the RTC subsystem for 5.5.

A lot of unnecessary code removal in this pull request that ends up
decreasing the number of lines in the subsystem. The ds1343 and ds1347
drivers got cleaned up. The rest are the usual fixes and new features.

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-5.5

for you to fetch changes up to f830f7cf4752f6f0db48777b7e16c010bdc95083:

  rtc: Fix Kconfig indentation (2019-11-27 09:31:14 +0100)

----------------------------------------------------------------
RTC for 5.5

Subsystem:
 - fix warnings and errors with make W=1
 - UIE are now disabled while setting the RTC time
 - UIE are now disallowed when the RTC time is not set.

Drivers:
 - remove unecessary .remove callbacks
 - Set RTC range for cros-ec, ds1343, ds1347, m41t80, s35390a, vt8500
 - Use devm_platform_ioremap_resource where applicable
 - rv3028: add clock out support

----------------------------------------------------------------
Alexandre Belloni (49):
      rtc: m41t80: set range
      rtc: add a timestamp for year 0
      rtc: ds1347: remove verbose messages
      rtc: ds1347: remove useless read
      rtc: ds1347: simplify getting .driver_data
      rtc: ds1347: mask ALM OUT when reading time
      rtc: ds1347: convert to devm_rtc_allocate_device
      rtc: ds1347: set range
      rtc: ds1347: properly handle oscillator failures
      rtc: ds1347: use regmap_update_bits
      rtc: ds1347: handle century register
      rtc: meson-vrtc: move config option to proper location
      rtc: s35390a: convert to devm_rtc_allocate_device
      rtc: s35390a: set range
      rtc: add timestamp for end of 2199
      rtc: vt8500: remove useless label
      rtc: vt8500: remove superfluous error message
      rtc: vt8500: convert to devm_rtc_allocate_device
      rtc: vt8500: let the core handle rtc range
      rtc: introduce lock helpers
      rtc: ds1343: set range
      rtc: ds1343: remove dead code
      rtc: ds1343: use burst write to set time
      rtc: ds1343: use rtc_add_group
      rtc: ds1343: use regmap_update_bits for glitch filter
      rtc: ds1343: check regmap_read return value
      rtc: ds1343: remove unnecessary mutex
      rtc: ds1343: rework interrupt handling
      rtc: ds1343: cleanup .remove
      rtc: fsl-ftm-alarm: switch to ktime_get_real_seconds
      rtc: fsl-ftm-alarm: switch to rtc_time64_to_tm/rtc_tm_to_time64
      rtc: fsl-ftm-alarm: avoid struct rtc_time conversions
      rtc: disable uie before setting time and enable after
      rtc: disallow update interrupts when time is invalid
      rtc: ab-b5ze-s3: remove .remove
      rtc: lpc32xx: remove .remove
      rtc: sc27xx: remove .remove
      rtc: sirfsoc: remove .remove
      rtc: cros-ec: remove superfluous error message
      rtc: cros-ec: let the core handle rtc range
      rtc: interface: fix kerneldoc comments
      rtc: sysfs: fix hctosys_show kerneldoc
      rtc: ds1374: remove unused variable
      rtc: ds1685: remove set but unused variables
      rtc: ds1685: fix build error with make W=1
      rtc: m41t80: remove excess kerneldoc
      rtc: pm8xxx: update kerneldoc for struct pm8xxx_rtc
      rtc: tegra: remove set but unused variable
      rtc: v3020: remove set but unused variable

Andrey Skvortsov (1):
      rtc: tps65910: allow using RTC without alarm interrupt

Chuhong Yuan (1):
      rtc: brcmstb-waketimer: add missed clk_disable_unprepare

Claudiu Beznea (1):
      rtc: at91rm9200: use of_device_get_match_data()

Colin Ian King (2):
      rtc: bd70528: fix module alias to autoload module
      rtc: meson: remove redundant assignment to variable retries

Emmanuel Nicolet (1):
      rtc: interface: use timeu64_t for range_max

Ilya Ledvich (1):
      rtc: em3027: correct month value

Jinke Fan (1):
      rtc: Fix the AltCentury value on AMD/Hygon platform

Kars de Jong (2):
      rtc: msm6242: Fix reading of 10-hour digit
      rtc: msm6242: Remove unneeded msm6242_set()/msm6242_clear() functions

Krzysztof Kozlowski (2):
      rtc: da9063: Handle invalid IRQ from platform_get_irq_byname()
      rtc: Fix Kconfig indentation

Li Yang (1):
      rtc: fsl-ftm-alarm: remove select FSL_RCPM and default y from Kconfig

Markus Elfring (1):
      rtc: Use devm_platform_ioremap_resource()

Martin Hundebøll (1):
      rtc: pcf2127: handle boot-enabled watchdog feature

Matti Vaittinen (1):
      rtc: bd70528: Add MODULE ALIAS to autoload module

Nick Crews (1):
      rtc: wilco-ec: Handle reading invalid times

Nobuhiro Iwamatsu (8):
      rtc: rx6110: Remove useless rx6110_remove
      rtc: rx6110: Convert to SPDX identifier
      rtc: ds1302: Remove unused DRV_NAME
      rtc: pcf8563: Constify clkout_rates
      rtc: pcf8523: Remove struct pcf8523
      rtc: st-lpc: Remove struct resource from struct st_rtc
      rtc: sun6i: Remove struct device from sun6i_rtc_dev
      rtc: xgene: Remove unused struct device in struct xgene_rtc_dev

Parthiban Nallathambi (1):
      rtc: rv3028: add clkout support

Srinivas Goud (1):
      rtc: xilinx: Fix calibval variable type

Stephen Boyd (1):
      rtc: armada38x: Use of_device_get_match_data()

Thomas Bogendoerfer (3):
      rts: ds1685: remove not needed fields from private struct
      rtc: ds1685: use devm_platform_ioremap_resource helper
      rtc: ds1685: add indirect access method and remove plat_read/plat_write

YueHaibing (1):
      rtc: use devm_platform_ioremap_resource() to simplify code

 arch/mips/sgi-ip32/ip32-platform.c  |   2 +-
 drivers/rtc/Kconfig                 |  31 ++--
 drivers/rtc/interface.c             |  58 +++++--
 drivers/rtc/rtc-ab-b5ze-s3.c        |  11 --
 drivers/rtc/rtc-armada38x.c         |  10 +-
 drivers/rtc/rtc-asm9260.c           |   4 +-
 drivers/rtc/rtc-aspeed.c            |   4 +-
 drivers/rtc/rtc-at91rm9200.c        |  19 +--
 drivers/rtc/rtc-at91sam9.c          |   4 +-
 drivers/rtc/rtc-bd70528.c           |   1 +
 drivers/rtc/rtc-brcmstb-waketimer.c |   5 +-
 drivers/rtc/rtc-cadence.c           |   4 +-
 drivers/rtc/rtc-coh901331.c         |   4 +-
 drivers/rtc/rtc-cros-ec.c           |  22 ++-
 drivers/rtc/rtc-da9063.c            |   3 +
 drivers/rtc/rtc-davinci.c           |   4 +-
 drivers/rtc/rtc-digicolor.c         |   4 +-
 drivers/rtc/rtc-ds1216.c            |   4 +-
 drivers/rtc/rtc-ds1286.c            |   4 +-
 drivers/rtc/rtc-ds1302.c            |   2 -
 drivers/rtc/rtc-ds1343.c            | 297 ++++++++++--------------------------
 drivers/rtc/rtc-ds1347.c            | 102 +++++++------
 drivers/rtc/rtc-ds1374.c            |   3 +-
 drivers/rtc/rtc-ds1511.c            |   4 +-
 drivers/rtc/rtc-ds1553.c            |   4 +-
 drivers/rtc/rtc-ds1685.c            | 116 +++++++-------
 drivers/rtc/rtc-em3027.c            |   4 +-
 drivers/rtc/rtc-ep93xx.c            |   4 +-
 drivers/rtc/rtc-fsl-ftm-alarm.c     |  24 +--
 drivers/rtc/rtc-goldfish.c          |   8 +-
 drivers/rtc/rtc-jz4740.c            |   4 +-
 drivers/rtc/rtc-lpc24xx.c           |   4 +-
 drivers/rtc/rtc-lpc32xx.c           |  15 +-
 drivers/rtc/rtc-m41t80.c            |   6 +-
 drivers/rtc/rtc-m48t86.c            |  11 +-
 drivers/rtc/rtc-mc146818-lib.c      |  15 +-
 drivers/rtc/rtc-meson.c             |   6 +-
 drivers/rtc/rtc-msm6242.c           |  23 +--
 drivers/rtc/rtc-mt7622.c            |   4 +-
 drivers/rtc/rtc-mv.c                |   4 +-
 drivers/rtc/rtc-omap.c              |   4 +-
 drivers/rtc/rtc-pcf2127.c           |  10 +-
 drivers/rtc/rtc-pcf8523.c           |  18 +--
 drivers/rtc/rtc-pcf8563.c           |   2 +-
 drivers/rtc/rtc-pic32.c             |   4 +-
 drivers/rtc/rtc-pm8xxx.c            |   2 +-
 drivers/rtc/rtc-r7301.c             |   7 +-
 drivers/rtc/rtc-rtd119x.c           |   4 +-
 drivers/rtc/rtc-rv3028.c            | 146 ++++++++++++++++++
 drivers/rtc/rtc-rx6110.c            |  16 +-
 drivers/rtc/rtc-s35390a.c           |  16 +-
 drivers/rtc/rtc-s3c.c               |   4 +-
 drivers/rtc/rtc-sa1100.c            |   4 +-
 drivers/rtc/rtc-sc27xx.c            |   7 -
 drivers/rtc/rtc-sirfsoc.c           |   8 -
 drivers/rtc/rtc-spear.c             |   4 +-
 drivers/rtc/rtc-st-lpc.c            |   5 +-
 drivers/rtc/rtc-stk17ta8.c          |   4 +-
 drivers/rtc/rtc-stm32.c             |   4 +-
 drivers/rtc/rtc-sun6i.c             |   2 -
 drivers/rtc/rtc-sunxi.c             |   4 +-
 drivers/rtc/rtc-tegra.c             |   8 +-
 drivers/rtc/rtc-tps65910.c          |  21 ++-
 drivers/rtc/rtc-tx4939.c            |   4 +-
 drivers/rtc/rtc-v3020.c             |   3 +-
 drivers/rtc/rtc-vt8500.c            |  32 ++--
 drivers/rtc/rtc-wilco-ec.c          |   8 +-
 drivers/rtc/rtc-xgene.c             |   6 +-
 drivers/rtc/rtc-zynqmp.c            |   7 +-
 drivers/rtc/sysfs.c                 |   5 +-
 include/linux/rtc.h                 |   5 +
 include/linux/rtc/ds1685.h          |  12 +-
 72 files changed, 566 insertions(+), 678 deletions(-)

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
