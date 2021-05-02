Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B1CA370F6A
	for <lists+linux-rtc@lfdr.de>; Mon,  3 May 2021 00:02:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230206AbhEBWDo (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 2 May 2021 18:03:44 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:59509 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbhEBWDn (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 2 May 2021 18:03:43 -0400
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 01A8A240002;
        Sun,  2 May 2021 22:02:49 +0000 (UTC)
Date:   Mon, 3 May 2021 00:02:49 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RTC for 5.13
Message-ID: <YI8hiepfYO8Pwhlu@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello Linus,

Here is the RTC subsystem pull request for v5.13. Mostly small fixes and
two drivers gaining alarm support.

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-5.13

for you to fetch changes up to 4d0185e67806a233c423c1668e87e137fbda192c:

  rtc: sysfs: check features instead of ops (2021-04-29 23:51:18 +0200)

----------------------------------------------------------------
RTC for 5.13

Subsystem:
 - UIE emulation has been reworked to avoid calling drivers callbacks when it is
   known it will not work

Drivers:
 - ab-eoz9: add alarm support
 - pcf8523: add alarm support

----------------------------------------------------------------
Alexandre Belloni (9):
      rtc: m48t59: use platform_get_irq_optional
      rtc: imx-sc: remove .read_alarm
      rtc: ds1307: replace HAS_ALARM by RTC_FEATURE_ALARM
      rtc: ds1307: remove flags
      rtc: rtc_update_irq_enable: rework UIE emulation
      rtc: pcf8523: remove useless define
      rtc: pcf8523: add alarm support
      rtc: pcf8523: report oscillator failures
      rtc: sysfs: check features instead of ops

Arnd Bergmann (1):
      rtc: tps65910: include linux/property.h

Dario Binacchi (1):
      rtc: omap: use rtc_write to access OMAP_RTC_OSC_REG

Fabio Estevam (2):
      rtc: imxdi: Convert to a DT-only driver
      rtc: mxc: Remove unneeded of_match_ptr()

Francois Gervais (1):
      rtc: pcf85063: fallback to parent of_node

Heiko Schocher (1):
      rtc: rv3028: correct weekday register usage

Jiapeng Chong (1):
      rtc: ds1511: remove unused function

Johannes Hahn (1):
      rtc: rx6110: add ACPI bindings to I2C

Krzysztof Kozlowski (1):
      rtc: s5m: Remove reference to parent's device pdata

Laurent Vivier (1):
      rtc: goldfish: remove dependency to OF

Liam Beguin (3):
      rtc: ab-eoz9: set regmap max_register
      rtc: ab-eoz9: add alarm support
      rtc: ab-eoz9: make use of RTC_FEATURE_ALARM

Michael Walle (1):
      rtc: fsl-ftm-alarm: add MODULE_TABLE()

Nobuhiro Iwamatsu (1):
      rtc: ds1307: Fix wday settings for rx8130

Tian Tao (1):
      rtc: rtc-spear: replace spin_lock_irqsave by spin_lock in hard IRQ

satya priya (2):
      rtc: pm8xxx: Add RTC support for PMIC PMK8350
      dt-bindings: rtc: qcom-pm8xxx-rtc: Add qcom pm8xxx rtc bindings

 .../devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml   |  62 +++++++
 drivers/rtc/Kconfig                                |   3 +-
 drivers/rtc/interface.c                            |  34 ++--
 drivers/rtc/rtc-ab-eoz9.c                          | 135 +++++++++++++-
 drivers/rtc/rtc-ds1307.c                           |  56 ++----
 drivers/rtc/rtc-ds1511.c                           |   6 -
 drivers/rtc/rtc-fsl-ftm-alarm.c                    |   1 +
 drivers/rtc/rtc-imx-sc.c                           |  11 --
 drivers/rtc/rtc-imxdi.c                            |   4 +-
 drivers/rtc/rtc-m48t59.c                           |   2 +-
 drivers/rtc/rtc-mxc.c                              |   2 +-
 drivers/rtc/rtc-omap.c                             |   5 +-
 drivers/rtc/rtc-pcf85063.c                         |   7 +-
 drivers/rtc/rtc-pcf8523.c                          | 196 ++++++++++++++++++++-
 drivers/rtc/rtc-pm8xxx.c                           |  11 ++
 drivers/rtc/rtc-rv3028.c                           |   4 +-
 drivers/rtc/rtc-rx6110.c                           |   7 +
 drivers/rtc/rtc-s5m.c                              |   6 -
 drivers/rtc/rtc-spear.c                            |   6 +-
 drivers/rtc/rtc-tps65910.c                         |   1 +
 drivers/rtc/sysfs.c                                |   2 +-
 21 files changed, 450 insertions(+), 111 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
