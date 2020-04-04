Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9138D19E508
	for <lists+linux-rtc@lfdr.de>; Sat,  4 Apr 2020 14:51:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726148AbgDDMvJ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 4 Apr 2020 08:51:09 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:52089 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725957AbgDDMvJ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 4 Apr 2020 08:51:09 -0400
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id A7EF124000A;
        Sat,  4 Apr 2020 12:51:06 +0000 (UTC)
Date:   Sat, 4 Apr 2020 14:51:06 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RTC for 5.7
Message-ID: <20200404125106.GA12183@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello Linus,

Here is the pull-request for the RTC subsystem for 5.7.

More cleanup this cycle, with the final goal of removing the
rtc_time_to_tm and rtc_tm_to_time wrappers. All the drivers that have 
been modified for this now are ready for the end of times (whether it 
happens in 2033, 2038, 2106, 2127 or even 4052). There is also a single
new driver and the usual fixes and features.

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-5.7

for you to fetch changes up to 1821b79d6a7d6973d1630e71380da8bb5e95f3a5:

  rtc: ds1307: check for failed memory allocation on wdt (2020-04-03 13:38:24 +0200)

----------------------------------------------------------------
RTC for 5.7

Subsystem:
 - The rtc_time_to_tm and rtc_tm_to_time wrappers have finally been removed and
   only the 64bit version remain.
 - hctosys now works with drivers compiled as modules

New driver:
 - MediaTek MT2712 SoC based RTC

Drivers:
 - set range for 88pm860x, au1xxx, cpcap, da9052, davinci, ds1305, ds1374,
   mcp5121, pl030, pl031, pm8xxx, puv3, sa1100, sirfsoc, starfire, sun6i
 - ds1307: DS1388 oscillator failure detection and watchdog support
 - jz4740: JZ4760 support
 - pcf85063: clock out pin support
 - sun6i: external 32k oscillator is now optional, the range is now handled by
   the core, providing a solution for 2034.

----------------------------------------------------------------
Alexandre Belloni (57):
      rtc: sirfsoc: convert to devm_rtc_allocate_device
      rtc: sirfsoc: set range
      rtc: sirfsoc: switch to rtc_time64_to_tm/rtc_tm_to_time64
      rtc: davinci: convert to devm_rtc_allocate_device
      rtc: davinci: remove useless 24h alarm handling
      rtc: davinci: let the core handle rtc range
      rtc: davinci: remove useless error handling
      rtc: pl030: set range
      rtc: pl030: remove useless invalid alarm handling
      rtc: pl030: switch to rtc_time64_to_tm/rtc_tm_to_time64
      rtc: starfire: set range
      rtc: starfire: switch to rtc_time64_to_tm
      rtc: au1xxx: convert to devm_rtc_allocate_device
      rtc: au1xxx: remove goto label
      rtc: au1xxx: set range
      rtc: au1xxx: switch to rtc_time64_to_tm/rtc_tm_to_time64
      rtc: sa1100: fix possible race condition
      rtc: sa1100: set range
      rtc: sa1100: switch to rtc_time64_to_tm/rtc_tm_to_time64
      rtc: cpcap: convert to devm_rtc_allocate_device
      rtc: cpcap: set range
      rtc: cpcap: switch to rtc_time64_to_tm/rtc_tm_to_time64
      rtc: ds1374: fix possible race condition
      rtc: ds1374: set range
      rtc: ds1374: switch to rtc_time64_to_tm/rtc_tm_to_time64
      rtc: ds1305: set range
      rtc: ds1305: switch to rtc_tm_to_time64
      rtc: pm8xxx: convert to devm_rtc_allocate_device
      rtc: pm8xxx: set range
      rtc: pm8xxx: : switch to rtc_time64_to_tm/rtc_tm_to_time64
      rtc: pm8xxx: stop validating valid alarm time
      rtc: mpc5121: simplify probe
      rtc: mpc5121: convert to devm_rtc_allocate_device
      rtc: mpc5121: set range
      rtc: mpc5121: switch to rtc_time64_to_tm/rtc_tm_to_time64
      rtc: fsl-ftm-alarm: allow COMPILE_TEST
      rtc: pl031: remove useless invalid alarm handling
      rtc: pl031: set range
      rtc: pl031: switch to rtc_time64_to_tm/rtc_tm_to_time64
      rtc: ab8500: switch to rtc_time64_to_tm/rtc_tm_to_time64
      rtc: puv3: set range
      rtc: puv3: switch to rtc_time64_to_tm/rtc_tm_to_time64
      rtc: 88pm860x: fix possible race condition
      rtc: 88pm860x: stop setting a default time
      rtc: 88pm860x: stop calling unused callback
      rtc: 88pm860x: set range
      rtc: 88pm860x: stop mangling alarm time
      rtc: 88pm860x: switch to rtc_time64_to_tm/rtc_tm_to_time64
      rtc: 88pm860x: remove platform data support
      rtc: mt2712: fix build without PM_SLEEP
      rtc: class: avoid unnecessary lookup in hctosys
      rtc: da9052: convert to devm_rtc_allocate_device
      rtc: da9052: set range
      rtc: da9052: switch to rtc_time64_to_tm/rtc_tm_to_time64
      rtc: sun6i: switch to rtc_time64_to_tm/rtc_tm_to_time64
      rtc: sun6i: let the core handle rtc range
      rtc: remove rtc_time_to_tm and rtc_tm_to_time

Anson Huang (4):
      rtc: snvs: Remove unused include of of_device.h
      rtc: snvs: Improve Kconfig dependency
      rtc: snvs: Use devm_add_action_or_reset() for calls to clk_disable_unprepare()
      rtc: mxc: Use devm_add_action_or_reset() for calls to clk_disable_unprepare()

Biwen Li (1):
      rtc: fsl-ftm-alarm: report alarm to core

Chris Packham (2):
      rtc: ds1307: handle oscillator failure flags for ds1388 variant
      rtc: ds1307: add support for watchdog timer on ds1388

Colin Ian King (2):
      rtc: class: remove redundant assignment to variable err
      rtc: ds1307: check for failed memory allocation on wdt

Corentin Labbe (1):
      rtc: max8907: add missing select REGMAP_IRQ

Eugene Syromiatnikov (1):
      rtc: make definitions in include/uapi/linux/rtc.h actually useful for user space

Geert Uytterhoeven (1):
      rtc: sh: Restore devm_ioremap() alignment

Jernej Skrabec (1):
      rtc: sun6i: Make external 32k oscillator optional

Keyur Patel (1):
      rtc: bd70528: Avoid double error messaging when IRQ absent

Leonard Crestez (1):
      rtc: imx-sc: Align imx sc msg structs to 4

Michael McCormick (1):
      rtc: pcf85063: Add pcf85063 clkout control to common clock framework

Paul Cercueil (3):
      rtc: jz4740: Add support for JZ4760 SoC
      rtc: jz4740: Rename vendor-specific DT properties
      dt-bindings: rtc: Convert and update jz4740-rtc doc to YAML

Peng Ma (1):
      rtc: fsl-ftm-alarm: enable acpi support

Ran Bi (3):
      dt-bindings: rtc: add bindings for MT2712 RTC
      rtc: add support for the MediaTek MT2712 RTC
      MAINTAINERS: add MT2712 RTC files

Srinivas Neeli (1):
      rtc: zynqmp: Clear alarm interrupt status before interrupt enable

Steve Muckle (1):
      rtc: class: support hctosys from modular RTC drivers

Thomas Bogendoerfer (1):
      rtc: m48t35: remove SGI-IP27 kludge

Uwe Kleine-König (1):
      rtc: omap: drop unused dt-bindings header

Ville Syrjälä (1):
      rtc: cmos: Use spin_lock_irqsave() in cmos_interrupt()

suguosong (1):
      rtc: sysfs: use kobj_to_dev

韩科才 (1):
      rtc: pm8xxx: clear alarm register when alarm is not enabled

 .../devicetree/bindings/rtc/ingenic,jz4740-rtc.txt |  37 --
 .../devicetree/bindings/rtc/ingenic,rtc.yaml       |  83 ++++
 .../devicetree/bindings/rtc/rtc-mt2712.txt         |  14 +
 MAINTAINERS                                        |   2 +
 drivers/rtc/Kconfig                                |  18 +-
 drivers/rtc/Makefile                               |   2 +-
 drivers/rtc/class.c                                |  49 +++
 drivers/rtc/hctosys.c                              |  69 ----
 drivers/rtc/rtc-88pm860x.c                         | 104 +----
 drivers/rtc/rtc-ab8500.c                           |  10 +-
 drivers/rtc/rtc-au1xxx.c                           |  29 +-
 drivers/rtc/rtc-bd70528.c                          |   4 +-
 drivers/rtc/rtc-cmos.c                             |   5 +-
 drivers/rtc/rtc-cpcap.c                            |  13 +-
 drivers/rtc/rtc-da9052.c                           |  18 +-
 drivers/rtc/rtc-davinci.c                          |  58 +--
 drivers/rtc/rtc-ds1305.c                           |  10 +-
 drivers/rtc/rtc-ds1307.c                           | 126 ++++++
 drivers/rtc/rtc-ds1374.c                           |  27 +-
 drivers/rtc/rtc-fsl-ftm-alarm.c                    |  23 +-
 drivers/rtc/rtc-imx-sc.c                           |   2 +-
 drivers/rtc/rtc-jz4740.c                           |   9 +-
 drivers/rtc/rtc-m48t35.c                           |   7 +-
 drivers/rtc/rtc-mpc5121.c                          |  61 +--
 drivers/rtc/rtc-mt2712.c                           | 423 +++++++++++++++++++++
 drivers/rtc/rtc-mxc.c                              |  46 +--
 drivers/rtc/rtc-omap.c                             |   1 -
 drivers/rtc/rtc-pcf85063.c                         | 157 ++++++++
 drivers/rtc/rtc-pl030.c                            |  27 +-
 drivers/rtc/rtc-pl031.c                            |  53 +--
 drivers/rtc/rtc-pm8xxx.c                           |  40 +-
 drivers/rtc/rtc-puv3.c                             |  14 +-
 drivers/rtc/rtc-sa1100.c                           |  40 +-
 drivers/rtc/rtc-sh.c                               |   3 +-
 drivers/rtc/rtc-sirfsoc.c                          |  44 +--
 drivers/rtc/rtc-snvs.c                             |  28 +-
 drivers/rtc/rtc-starfire.c                         |  10 +-
 drivers/rtc/rtc-sun6i.c                            |  47 +--
 drivers/rtc/rtc-zynqmp.c                           |  27 +-
 drivers/rtc/sysfs.c                                |   2 +-
 include/linux/rtc.h                                |  12 -
 include/uapi/linux/rtc.h                           |  11 +-
 42 files changed, 1192 insertions(+), 573 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/ingenic,jz4740-rtc.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/ingenic,rtc.yaml
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-mt2712.txt
 delete mode 100644 drivers/rtc/hctosys.c
 create mode 100644 drivers/rtc/rtc-mt2712.c

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
