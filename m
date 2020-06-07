Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B63671F1003
	for <lists+linux-rtc@lfdr.de>; Sun,  7 Jun 2020 23:29:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726982AbgFGV3r (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 7 Jun 2020 17:29:47 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:41637 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726093AbgFGV3q (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 7 Jun 2020 17:29:46 -0400
X-Originating-IP: 86.202.110.81
Received: from localhost (lfbn-lyo-1-15-81.w86-202.abo.wanadoo.fr [86.202.110.81])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 35D35240004;
        Sun,  7 Jun 2020 21:29:43 +0000 (UTC)
Date:   Sun, 7 Jun 2020 23:29:43 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RTC for 5.8
Message-ID: <20200607212943.GA1821798@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello Linus,

Not much this cycle apart from the ingenic rtc driver rework. The fixes
are mainly minor issues reported by coccinelle rather than real world
issues.

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-5.8

for you to fetch changes up to 4601e24a6fb819d38d1156d0f690cbe6a42c6d76:

  rtc: pcf2127: watchdog: handle nowayout feature (2020-06-06 00:34:16 +0200)

----------------------------------------------------------------
RTC for 5.8

Subsystem:
 - new VL flag for backup switch over

Drivers:
 - ingenic: only support device tree
 - pcf2127: report battery switch over, handle nowayout

----------------------------------------------------------------
Alexandre Belloni (8):
      rtc: mt2712: remove unnecessary error string
      rtc: mt2712: switch to devm_platform_ioremap_resource
      rtc: 88pm860x: remove useless range check
      rtc: add new VL flag for backup switchover
      rtc: pcf2127: let the core handle rtc range
      rtc: pcf2127: remove unnecessary #ifdef
      rtc: pcf2127: set regmap max_register
      rtc: pcf2127: report battery switch over

Anson Huang (2):
      rtc: snvs: Make SNVS clock always prepared
      rtc: snvs: Add necessary clock operations for RTC APIs

Bruno Thomsen (1):
      rtc: pcf2127: watchdog: handle nowayout feature

Chuhong Yuan (1):
      rtc: rv3028: Add missed check for devm_regmap_init_i2c()

Dan Carpenter (1):
      rtc: rc5t619: Fix an ERR_PTR vs NULL check

Kevin P. Fleming (2):
      rtc: abx80x: Add Device Tree matching table
      rtc: abx80x: Provide debug feedback for invalid dt properties

Markus Elfring (1):
      rtc: remove unnecessary error message after platform_get_irq

Paul Cercueil (7):
      rtc: ingenic: Only support probing from devicetree
      rtc: ingenic: Use local 'dev' variable in probe
      rtc: ingenic: Enable clock in probe
      rtc: ingenic: Set wakeup params in probe
      rtc: ingenic: Remove unused fields from private structure
      rtc: ingenic: Fix masking of error code
      rtc: ingenic: Reset regulator register in probe

Qiushi Wu (1):
      rtc: mc13xxx: fix a double-unlock issue

Ran Wang (1):
      rtc: fsl-ftm-alarm: fix freeze(s2idle) failed to wake

Thierry Reding (1):
      rtc: max77686: Use single-byte writes on MAX77620

Tiezhu Yang (2):
      rtc: goldfish: Use correct return value for goldfish_rtc_probe()
      rtc: mpc5121: Use correct return value for mpc5121_rtc_probe()

Wolfram Sang (1):
      rtc: stmp3xxx: update contact email

 drivers/rtc/Kconfig             |   1 +
 drivers/rtc/rtc-88pm860x.c      |   6 --
 drivers/rtc/rtc-abx80x.c        |  66 +++++++++++++--
 drivers/rtc/rtc-fsl-ftm-alarm.c |  10 ++-
 drivers/rtc/rtc-goldfish.c      |   2 +-
 drivers/rtc/rtc-jz4740.c        | 173 +++++++++++++++++++---------------------
 drivers/rtc/rtc-lpc24xx.c       |   4 +-
 drivers/rtc/rtc-max77686.c      |  22 +++--
 drivers/rtc/rtc-mc13xxx.c       |   4 +-
 drivers/rtc/rtc-mpc5121.c       |   2 +-
 drivers/rtc/rtc-mt2712.c        |  16 +---
 drivers/rtc/rtc-pcf2127.c       |  31 ++++---
 drivers/rtc/rtc-rc5t619.c       |   4 +-
 drivers/rtc/rtc-rv3028.c        |   2 +
 drivers/rtc/rtc-snvs.c          |  59 +++++++++++++-
 drivers/rtc/rtc-stmp3xxx.c      |   2 +-
 include/uapi/linux/rtc.h        |   1 +
 17 files changed, 256 insertions(+), 149 deletions(-)

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
