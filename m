Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53DFB29494E
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Oct 2020 10:23:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731198AbgJUIXY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 21 Oct 2020 04:23:24 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:50319 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730685AbgJUIXX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 21 Oct 2020 04:23:23 -0400
X-Originating-IP: 90.65.88.165
Received: from localhost (lfbn-lyo-1-1908-165.w90-65.abo.wanadoo.fr [90.65.88.165])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 6125D1C000C;
        Wed, 21 Oct 2020 08:23:21 +0000 (UTC)
Date:   Wed, 21 Oct 2020 10:23:20 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RTC for 5.10
Message-ID: <20201021082320.GA1457765@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello Linus,

Here is the RTC pull request for 5.10. A new driver this cycle is making
the bulk of the changes and the rx8010 driver has been rework to use the
modern APIs.

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-5.10

for you to fetch changes up to 35331b506f6c67a0b4042fac1ae2785cef9ac8c3:

  rtc: r9701: set range (2020-10-19 22:48:55 +0200)

----------------------------------------------------------------
RTC for 5.10

Subsystem:
 - new generic DT properties: aux-voltage-chargeable, trickle-voltage-millivolt

New driver:
 - Microcrystal RV-3032

Drivers:
 - ds1307: use aux-voltage-chargeable
 - r9701, rx8010: modernization of the driver
 - rv3028: fix clock output, trickle resistor values, RAM configuration
   registers

----------------------------------------------------------------
Alexandre Belloni (13):
      rtc: rv3028: fix clock output support
      rtc: rv3028: fix trickle resistor values
      rtc: rv3028: factorize EERD bit handling
      rtc: rv3028: ensure ram configuration registers are saved
      dt-bindings: rtc: add trickle-voltage-millivolt
      dt-bindings: rtc: rv3032: add RV-3032 bindings
      rtc: rv3032: Add a driver for Microcrystal RV-3032
      rtc: r9701: remove leftover comment
      rtc: r9701: stop setting a default time
      rtc: r9701: remove useless memset
      rtc: r9701: stop setting RWKCNT
      rtc: r9701: convert to devm_rtc_allocate_device
      rtc: r9701: set range

Bartosz Golaszewski (15):
      rtc: rx8010: don't modify the global rtc ops
      rtc: rx8010: remove a stray newline
      rtc: rx8010: remove unnecessary brackets
      rtc: rx8010: consolidate local variables of the same type
      rtc: rx8010: use tabs instead of spaces for code formatting
      rtc: rx8010: rename ret to err in rx8010_set_time()
      rtc: rx8010: don't use magic values for time buffer length
      rtc: rx8010: drop unnecessary initialization
      rtc: rx8010: use a helper variable for client->dev in probe()
      rtc: rx8010: prefer sizeof(*val) over sizeof(struct type_of_val)
      rtc: rx8010: switch to using the preferred RTC API
      rtc: rx8010: switch to using the preferred i2c API
      rtc: rx8010: convert to using regmap
      rtc: rx8010: use range checking provided by core RTC code
      rtc: rx8010: rename rx8010_init_client() to rx8010_init()

Bastian Krause (8):
      dt-bindings: rtc: let aux-voltage-chargeable supersede trickle-diode-disable
      dt-bindings: rtc: ds1307: let aux-voltage-chargeable supersede trickle-diode-disable
      dt-bindings: rtc: ds1307: add rx8130 aux-voltage-chargeable support
      rtc: ds1307: apply DS13XX_TRICKLE_CHARGER_MAGIC only conditionally
      rtc: ds1307: introduce requires_trickle_resistor per chip
      rtc: ds1307: store previous charge default per chip
      rtc: ds1307: consider aux-voltage-chargeable
      rtc: ds1307: enable rx8130's backup battery, make it chargeable optionally

Biwen Li (1):
      rtc: pcf2127: fix a bug when not specify interrupts property

Chris Packham (2):
      rtc: ds1307: Ensure oscillator is enabled for DS1388
      rtc: ds1307: Clear OSF flag on DS1388 when setting time

Fei Shao (1):
      rtc: mt6397: Remove unused member dev

Geert Uytterhoeven (3):
      rtc: rtc-rs5c313: Drop obsolete platform_set_drvdata() call
      rtc: rtc-rs5c313: Fix late hardware init
      rtc: rtc-rs5c313: Convert to module_platform_driver()

Krzysztof Kozlowski (1):
      rtc: s3c: Simplify with dev_err_probe()

Liu Shixin (2):
      rtc: meson: simplify the return expression of meson_vrtc_probe
      rtc: rv8803: simplify the return expression of rv8803_nvram_write

Peng Ma (1):
      rtc: fsl-ftm-alarm: update acpi device id

Rikard Falkeborn (1):
      rtc: st-lpc: Constify st_rtc_ops

Thomas Bogendoerfer (1):
      rtc: ds1685: Fix bank switching to avoid endless loop

Victor Ding (1):
      rtc: cmos: zero-init wkalrm when reading from CMOS

 .../bindings/rtc/microcrystal,rv3032.yaml          |  64 ++
 .../devicetree/bindings/rtc/rtc-ds1307.txt         |   9 +-
 Documentation/devicetree/bindings/rtc/rtc.yaml     |  16 +
 drivers/rtc/Kconfig                                |  10 +
 drivers/rtc/Makefile                               |   1 +
 drivers/rtc/rtc-cmos.c                             |   2 +
 drivers/rtc/rtc-ds1307.c                           |  76 +-
 drivers/rtc/rtc-ds1685.c                           |   8 +-
 drivers/rtc/rtc-fsl-ftm-alarm.c                    |   4 +-
 drivers/rtc/rtc-meson-vrtc.c                       |   7 +-
 drivers/rtc/rtc-mt6397.c                           |   3 +-
 drivers/rtc/rtc-pcf2127.c                          |   4 +-
 drivers/rtc/rtc-r9701.c                            |  43 +-
 drivers/rtc/rtc-rs5c313.c                          |  34 +-
 drivers/rtc/rtc-rv3028.c                           | 213 +++--
 drivers/rtc/rtc-rv3032.c                           | 925 +++++++++++++++++++++
 drivers/rtc/rtc-rv8803.c                           |   8 +-
 drivers/rtc/rtc-rx8010.c                           | 332 ++++----
 drivers/rtc/rtc-s3c.c                              |   9 +-
 drivers/rtc/rtc-st-lpc.c                           |   2 +-
 include/linux/mfd/mt6397/rtc.h                     |   1 -
 21 files changed, 1403 insertions(+), 368 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/microcrystal,rv3032.yaml
 create mode 100644 drivers/rtc/rtc-rv3032.c

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
