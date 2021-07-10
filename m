Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53CCF3C3700
	for <lists+linux-rtc@lfdr.de>; Sun, 11 Jul 2021 00:08:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbhGJWKs (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 10 Jul 2021 18:10:48 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:49959 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbhGJWKs (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 10 Jul 2021 18:10:48 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 3B0CE20005;
        Sat, 10 Jul 2021 22:08:01 +0000 (UTC)
Date:   Sun, 11 Jul 2021 00:08:00 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RTC changes for 5.14
Message-ID: <YOoaQCvHNsCsUZnv@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello Linus,

Here is the RTC subsystem pull request for v5.14. I know it is very late
but there is nothing too scary:
Mostly documentation/comment changes and non urgent fixes.

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-5.14

for you to fetch changes up to 4aa90c036df670b8757140e0dae2a94e7b0d42b4:

  rtc: pcf8523: rename register and bit defines (2021-07-10 23:18:30 +0200)

----------------------------------------------------------------
RTC for 5.14

Drivers:
 - add or fix SPDX identifiers
 - NXP pcf*: fix datasheet URLs
 - imxdi: add wakeup support
 - pcf2127: handle timestamp interrupts, this fixes a possible interrupt storm
 - bd70528: Drop BD70528 support

----------------------------------------------------------------
Alexandre Belloni (2):
      dt-bindings: rtc: ti,bq32k: take maintainership
      rtc: pcf8523: rename register and bit defines

Arnd Bergmann (1):
      rtc: bd70528: fix BD71815 watchdog dependency

Bixuan Cui (1):
      rtc: mxc_v2: add missing MODULE_DEVICE_TABLE

Colin Ian King (1):
      rtc: v3020: remove redundant initialization of variable retval

Corentin Labbe (1):
      dt-bindings: convert rtc/faraday,ftrtc01 to yaml

Dan Carpenter (1):
      rtc: fix snprintf() checking in is_rtc_hctosys()

Fabio Estevam (4):
      rtc: pcf2127: Fix the datasheet URL
      rtc: pcf85063: Fix the datasheet URL
      rtc: pcf8563: Fix the datasheet URL
      rtc: pcf85063: Update the PCF85063A datasheet revision

Geert Uytterhoeven (1):
      dt-bindings: rtc: ti,bq32k: Convert to json-schema

Krzysztof Kozlowski (1):
      rtc: max77686: Do not enforce (incorrect) interrupt trigger type

Marek Vasut (1):
      dt-bindings: rtc: rx8900: Convert to YAML schema

Martin Fuzzey (1):
      rtc: stm32: Fix unbalanced clk_disable_unprepare() on probe error path

Martin Kaiser (1):
      rtc: imxdi: add wakeup support

Matti Vaittinen (1):
      rtc: bd70528: Drop BD70528 support

Mian Yousaf Kaukab (1):
      rtc: pcf2127: handle timestamp interrupts

Nobuhiro Iwamatsu (11):
      rtc: au1xxx: convert to SPDX identifier
      rtc: ds1374: convert to SPDX identifier
      rtc: max6900: convert to SPDX identifier
      rtc: palmas: convert to SPDX identifier
      rtc: sc27xx: Fix format of SPDX identifier
      rtc: rtd119x: Fix format of SPDX identifier
      rtc: tps80031: convert to SPDX identifier
      rtc: tps6586x: convert to SPDX identifier
      rtc: spear: convert to SPDX identifier
      rtc: s5m: Check return value of s5m_check_peding_alarm_interrupt()
      rtc: at91sam9: Remove unnecessary offset variable checks

Sebastian Reichel (1):
      rtc: m41t80: add support for fixed clock

Shaokun Zhang (1):
      rtc: efi: Remove the repeated module alias

Yang Yingliang (2):
      rtc: sysfs: Correct kerneldoc function name hctosys_show()
      rtc: m41t80: correct kerneldoc function names

 .../devicetree/bindings/rtc/epson,rx8900.txt       |  22 --
 .../devicetree/bindings/rtc/epson,rx8900.yaml      |  49 ++++
 .../devicetree/bindings/rtc/faraday,ftrtc010.txt   |  28 --
 .../devicetree/bindings/rtc/faraday,ftrtc010.yaml  |  59 ++++
 .../devicetree/bindings/rtc/rtc-m41t80.txt         |   9 +
 .../devicetree/bindings/rtc/ti,bq32000.yaml        |  49 ++++
 Documentation/devicetree/bindings/rtc/ti,bq32k.txt |  18 --
 drivers/rtc/Kconfig                                |   6 +-
 drivers/rtc/proc.c                                 |   4 +-
 drivers/rtc/rtc-at91sam9.c                         |   2 +-
 drivers/rtc/rtc-au1xxx.c                           |   5 +-
 drivers/rtc/rtc-bd70528.c                          | 316 +--------------------
 drivers/rtc/rtc-ds1374.c                           |   7 +-
 drivers/rtc/rtc-efi.c                              |   1 -
 drivers/rtc/rtc-imxdi.c                            |   4 +
 drivers/rtc/rtc-m41t80.c                           |  32 ++-
 drivers/rtc/rtc-max6900.c                          |   8 +-
 drivers/rtc/rtc-max77686.c                         |   4 +-
 drivers/rtc/rtc-mxc_v2.c                           |   1 +
 drivers/rtc/rtc-palmas.c                           |  15 +-
 drivers/rtc/rtc-pcf2127.c                          | 194 +++++++++----
 drivers/rtc/rtc-pcf85063.c                         |   6 +-
 drivers/rtc/rtc-pcf8523.c                          | 146 +++++-----
 drivers/rtc/rtc-pcf8563.c                          |   2 +-
 drivers/rtc/rtc-rtd119x.c                          |   3 +-
 drivers/rtc/rtc-s5m.c                              |   4 +-
 drivers/rtc/rtc-sc27xx.c                           |   2 +-
 drivers/rtc/rtc-spear.c                            |   5 +-
 drivers/rtc/rtc-stm32.c                            |   6 +-
 drivers/rtc/rtc-tps6586x.c                         |  15 +-
 drivers/rtc/rtc-tps80031.c                         |  15 +-
 drivers/rtc/rtc-v3020.c                            |   2 +-
 drivers/rtc/sysfs.c                                |   2 +-
 33 files changed, 440 insertions(+), 601 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/epson,rx8900.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/epson,rx8900.yaml
 delete mode 100644 Documentation/devicetree/bindings/rtc/faraday,ftrtc010.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/faraday,ftrtc010.yaml
 create mode 100644 Documentation/devicetree/bindings/rtc/ti,bq32000.yaml
 delete mode 100644 Documentation/devicetree/bindings/rtc/ti,bq32k.txt

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
