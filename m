Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D66106A5F3
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Jul 2019 11:55:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733114AbfGPJzT (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 16 Jul 2019 05:55:19 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:34307 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732923AbfGPJzT (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 16 Jul 2019 05:55:19 -0400
X-Originating-IP: 92.137.69.152
Received: from localhost (alyon-656-1-672-152.w92-137.abo.wanadoo.fr [92.137.69.152])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 13B4224001C;
        Tue, 16 Jul 2019 09:54:06 +0000 (UTC)
Date:   Tue, 16 Jul 2019 11:54:05 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RTC for 5.3
Message-ID: <20190716095405.GA2449@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello Linus,

A quiet cycle this time. I'm a bit late for this PR but I threw in a few
fixes instead of waiting for -rc1.

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-5.3

for you to fetch changes up to f0162d21cc8025c828fafe56ee25801f770f41da:

  rtc: wm831x: Add IRQF_ONESHOT flag (2019-07-13 21:39:51 +0200)

----------------------------------------------------------------
RTC for 5.3

Drivers:
 - ds1307: properly handle oscillator failure flags
 - imx-sc: alarm support
 - pcf2123: alarm support, correct offset handling
 - sun6i: add R40 support
 - simplify getting the adapter of an i2c client

----------------------------------------------------------------
Alexandre Belloni (3):
      rtc: ds1307: properly handle oscillator failure flags
      rtc: st-lpc: remove unnecessary check
      rtc: pcf2123: fix negative offset rounding

Anson Huang (1):
      rtc: imx-sc: add rtc alarm support

Chen-Yu Tsai (2):
      rtc: pcf8563: Fix interrupt trigger method
      rtc: pcf8563: Clear event flags and disable interrupts before requesting irq

Dmitry Osipenko (1):
      rtc: tegra: Drop MODULE_ALIAS

Dylan Howey (4):
      rtc: pcf2123: remove sysfs register view
      rtc: pcf2123: port to regmap
      rtc: pcf2123: use %ptR
      rtc: pcf2123: add alarm support

Hariprasad Kelam (1):
      rtc: wm831x: Add IRQF_ONESHOT flag

Markus Elfring (1):
      rtc: stm32: remove one condition check in stm32_rtc_set_alarm()

Maxime Ripard (6):
      dt-bindings: rtc: Add YAML schemas for the generic RTC bindings
      dt-bindings: rtc: Move trivial RTC over to a schemas of their own
      dt-bindings: rtc: Convert Allwinner A10 RTC to a schema
      dt-bindings: rtc: Convert Allwinner A31 RTC to a schema
      dt-bindings: rtc: sun6i: Add the R40 RTC compatible
      rtc: sun6i: Add R40 compatible

Michał Mirosław (2):
      rtc: tps65910: remove superfluous Kconfig dependency
      rtc: tps65910: fix typo in register name in read_alarm()

Nicholas Mc Guire (1):
      rtc: ds2404: use hw endiannes variable

Puranjay Mohan (1):
      rtc: interface: Change type of 'count' from int to u64

Richard Leitner (4):
      rtc: s35390a: clarify INT2 pin output modes
      rtc: s35390a: set uie_unsupported
      rtc: s35390a: introduce struct device in probe
      rtc: s35390a: change FLAG defines to use BIT macro

Roman Stratiienko (1):
      rtc: test: enable wakeup flags

Thierry Reding (3):
      rtc: tegra: checkpatch and miscellaneous cleanups
      rtc: tegra: Use consistent variable names and types
      rtc: tegra: Turn into regular driver

Wolfram Sang (5):
      rtc: fm3130: simplify getting the adapter of a client
      rtc: m41t80: simplify getting the adapter of a client
      rtc: rv8803: simplify getting the adapter of a client
      rtc: rx8010: simplify getting the adapter of a client
      rtc: rx8025: simplify getting the adapter of a client

YueHaibing (1):
      rtc: pcf2123: Fix build error

 .../bindings/rtc/allwinner,sun4i-a10-rtc.yaml      |  43 +++
 .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml      | 134 ++++++++
 Documentation/devicetree/bindings/rtc/rtc.txt      |  73 +----
 Documentation/devicetree/bindings/rtc/rtc.yaml     |  50 +++
 .../devicetree/bindings/rtc/sun6i-rtc.txt          |  46 ---
 .../devicetree/bindings/rtc/sunxi-rtc.txt          |  17 -
 .../devicetree/bindings/rtc/trivial-rtc.yaml       |  92 ++++++
 drivers/rtc/Kconfig                                |   3 +-
 drivers/rtc/interface.c                            |   2 +-
 drivers/rtc/rtc-ds1307.c                           | 129 ++++----
 drivers/rtc/rtc-ds2404.c                           |   5 +-
 drivers/rtc/rtc-fm3130.c                           |   8 +-
 drivers/rtc/rtc-imx-sc.c                           |  87 +++++
 drivers/rtc/rtc-m41t80.c                           |   2 +-
 drivers/rtc/rtc-pcf2123.c                          | 354 ++++++++++-----------
 drivers/rtc/rtc-pcf8563.c                          |  13 +-
 drivers/rtc/rtc-rv8803.c                           |   2 +-
 drivers/rtc/rtc-rx8010.c                           |   2 +-
 drivers/rtc/rtc-rx8025.c                           |   2 +-
 drivers/rtc/rtc-s35390a.c                          |  55 ++--
 drivers/rtc/rtc-st-lpc.c                           |   4 -
 drivers/rtc/rtc-stm32.c                            |   6 +-
 drivers/rtc/rtc-sun6i.c                            |   1 +
 drivers/rtc/rtc-tegra.c                            | 253 +++++++--------
 drivers/rtc/rtc-test.c                             |   1 +
 drivers/rtc/rtc-tps65910.c                         |   2 +-
 drivers/rtc/rtc-wm831x.c                           |   3 +-
 27 files changed, 821 insertions(+), 568 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/allwinner,sun4i-a10-rtc.yaml
 create mode 100644 Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc.yaml
 delete mode 100644 Documentation/devicetree/bindings/rtc/sun6i-rtc.txt
 delete mode 100644 Documentation/devicetree/bindings/rtc/sunxi-rtc.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/trivial-rtc.yaml

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
