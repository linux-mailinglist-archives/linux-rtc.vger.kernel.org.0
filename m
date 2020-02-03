Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D30D15125C
	for <lists+linux-rtc@lfdr.de>; Mon,  3 Feb 2020 23:32:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726331AbgBCWcn (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 3 Feb 2020 17:32:43 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:42053 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726369AbgBCWcn (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 3 Feb 2020 17:32:43 -0500
X-Originating-IP: 90.65.92.102
Received: from localhost (lfbn-lyo-1-1913-102.w90-65.abo.wanadoo.fr [90.65.92.102])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id B1EACFF802;
        Mon,  3 Feb 2020 22:32:40 +0000 (UTC)
Date:   Mon, 3 Feb 2020 23:32:40 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RTC for 5.6
Message-ID: <20200203223240.GA63964@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello Linus,

Here is the pull-request for the RTC subsystem for 5.6.

The VL_READ and VL_CLR ioctls have been reworked to be more useful. This
will not break userspace as there are very few users and they are using
the integer value as a boolean.
Apart from that, two drivers were reworked and a few fixes here and
there for a net reduction of number of lines.

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-5.6

for you to fetch changes up to f45719240700398b63a165f6b7f3fbab04f0b052:

  dt-bindings: rtc: at91rm9200: document clocks property (2020-01-28 22:48:34 +0100)

----------------------------------------------------------------
RTC for 5.6

Subsystem:
 - the VL_READ and VL_CLR ioctls are now documented and their behavior is
   unified across all the drivers.
 - RTC_I2C_AND_SPI Kconfig option rework to avoid selecting both REGMAP_I2C and
   REGMAP_SPI unecessarily.

Drivers:
 - at91rm9200: remove deprecated procfs, add sam9x60, sama5d4 and sama5d2
   compatibles.
 - cmos: solve lost interrupts issue on MS Surface 3
 - hym8563: return proper errno when time is invalid
 - rv3029: many fixes, nvram support

----------------------------------------------------------------
Alexandre Belloni (44):
      mailmap: Update email address for Alexandre Belloni
      rtc: define RTC_VL_READ values
      rtc: Document RTC_VL_READ and RTC_VL_CLR ioctls
      rtc: abx80x: return meaningful value for RTC_VL_READ
      rtc: pcf2127: return meaningful value for RTC_VL_READ
      rtc: pcf8523: return meaningful value for RTC_VL_READ
      rtc: pcf8563: remove RTC_VL_CLR handling
      rtc: pcf8563: remove conditional compilation
      rtc: pcf8563: stop caching voltage_low
      rtc: pcf8563: return meaningful value for RTC_VL_READ
      rtc: pcf85063: remove RTC_VL_CLR handling
      rtc: pcf85063: return meaningful value for RTC_VL_READ
      rtc: rv3028: remove RTC_VL_CLR handling
      rtc: rv3028: return meaningful value for RTC_VL_READ
      rtc: rv8803: avoid clearing RV8803_FLAG_V2F in RTC_VL_CLR
      rtc: rv8803: return meaningful value for RTC_VL_READ
      rtc: rx8010: remove RTC_VL_CLR handling
      rtc: rx8010: return meaningful value for RTC_VL_READ
      rtc: rv3029: use proper name for the driver
      rtc: rv3029: let regmap validate the register ranges
      rtc: rv3029: remove open coded regmap_update_bits
      rtc: rv3029: remove race condition when update STATUS
      rtc: rv3029: avoid reading the status register uselessly
      rtc: rv3029: get rid of rv3029_get_sr
      rtc: rv3029: simplify rv3029_alarm_irq_enable
      rtc: rv3029: simplify rv3029_set_alarm
      rtc: rv3029: drop rv3029_read_regs and rv3029_write_regs
      rtc: rv3029: add RTC_VL_READ and RTC_VL_CLEAR support
      rtc: rv3029: correctly handle PON and VLOW2
      rtc: rv3029: convert to devm_rtc_allocate_device
      rtc: rv3029: let the core handle rtc range
      rtc: rv3029: add nvram support
      rtc: rv3029: drop deprecated compatbiles
      rtc: rv3029: annotate init and exit functions
      rtc: rv3029: remove useless error messages
      rtc: at91rm9200: remove procfs information
      dt-bindings: rtc: at91rm9200: convert bindings to json-schema
      rtc: at91rm9200: add sama5d4 and sama5d2 compatibles
      rtc: at91rm9200: move register definitions to C file
      rtc: at91rm9200: avoid time readout in at91_rtc_setalarm
      rtc: at91rm9200: use FIELD_PREP/FIELD_GET
      rtc: Kconfig: properly indent sd3078 entry
      rtc: Kconfig: select REGMAP_I2C when necessary
      dt-bindings: rtc: at91rm9200: document clocks property

Andy Shevchenko (3):
      rtc: cmos: Stop using shared IRQ
      rtc: cmos: Use predefined value for RTC IRQ on legacy x86
      rtc: cmos: Refactor code by using the new dmi_get_bios_year() helper

Chuhong Yuan (2):
      rtc: stm32: add missed clk_disable_unprepare in error path of resume
      rtc: asm9260: add the missed check for devm_clk_get

Claudiu Beznea (1):
      dt-bindings: atmel, at91rm9200-rtc: add microchip, sam9x60-rtc

Dmitry Osipenko (1):
      rtc: tps6586x: Use IRQ_NOAUTOEN flag

Geert Uytterhoeven (1):
      rtc: i2c/spi: Avoid inclusion of REGMAP support when not needed

Jean-Francois Dagenais (1):
      rtc: zynqmp: re-use rtc_time64_to_tm operation

Linus Walleij (1):
      rtc: ds1343: Do not hardcode SPI mode flags

Nobuhiro Iwamatsu (5):
      rtc: rx8010: Fix return code for rx8010_probe
      rtc: rx8025: Remove struct i2c_client from struct rx8025_data
      rtc: ds1343: Remove unused struct spi_device in struct ds1343_priv
      rtc: moxart: Convert to SPDX identifier
      rtc: pcf8563: Use BIT

Paul Kocialkowski (2):
      rtc: hym8563: Return -EINVAL if the time is known to be invalid
      rtc: hym8563: Read the valid flag directly instead of caching it

Wei Yongjun (1):
      rtc: mt6397: drop free_irq of devm_ allocated irq

zhengbin (1):
      rtc: omap: Remove unneeded semicolon

 .mailmap                                           |   1 +
 Documentation/ABI/testing/rtc-cdev                 |   8 +
 .../bindings/rtc/atmel,at91rm9200-rtc.txt          |  17 -
 .../bindings/rtc/atmel,at91rm9200-rtc.yaml         |  49 +++
 drivers/rtc/Kconfig                                |  24 +-
 drivers/rtc/rtc-abx80x.c                           |   7 +-
 drivers/rtc/rtc-asm9260.c                          |   3 +
 drivers/rtc/rtc-at91rm9200.c                       | 119 +++---
 drivers/rtc/rtc-at91rm9200.h                       |  71 ----
 drivers/rtc/rtc-cmos.c                             |  12 +-
 drivers/rtc/rtc-ds1343.c                           |  10 +-
 drivers/rtc/rtc-hym8563.c                          |  19 +-
 drivers/rtc/rtc-moxart.c                           |   5 +-
 drivers/rtc/rtc-mt6397.c                           |  10 +-
 drivers/rtc/rtc-omap.c                             |   2 +-
 drivers/rtc/rtc-pcf2127.c                          |   6 +-
 drivers/rtc/rtc-pcf85063.c                         |  16 +-
 drivers/rtc/rtc-pcf8523.c                          |   6 +-
 drivers/rtc/rtc-pcf8563.c                          |  40 +-
 drivers/rtc/rtc-rv3028.c                           |  17 +-
 drivers/rtc/rtc-rv3029c2.c                         | 442 +++++++++------------
 drivers/rtc/rtc-rv8803.c                           |  16 +-
 drivers/rtc/rtc-rx8010.c                           |  25 +-
 drivers/rtc/rtc-rx8025.c                           |  27 +-
 drivers/rtc/rtc-stm32.c                            |   5 +-
 drivers/rtc/rtc-tps6586x.c                         |   4 +-
 drivers/rtc/rtc-zynqmp.c                           |   4 +-
 include/linux/rtc.h                                |   1 +
 include/uapi/linux/rtc.h                           |   7 +-
 29 files changed, 415 insertions(+), 558 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml
 delete mode 100644 drivers/rtc/rtc-at91rm9200.h

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
