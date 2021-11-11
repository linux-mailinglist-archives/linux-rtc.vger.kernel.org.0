Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B48544DDFB
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Nov 2021 23:54:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230348AbhKKW5A (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 11 Nov 2021 17:57:00 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:43409 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229839AbhKKW47 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 11 Nov 2021 17:56:59 -0500
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 426CAFF807;
        Thu, 11 Nov 2021 22:54:07 +0000 (UTC)
Date:   Thu, 11 Nov 2021 23:54:06 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RTC for 5.16
Message-ID: <YY2fDo+B4GfFWjn5@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello Linus,

Here is the RTC subsystem pull request for v5.16. This includes new
ioctls to get and set parameters and in particular the backup switch
mode that is needed for some RTCs to actually enable the backup voltage
(and have a useful RTC).
The same interface can also be used to get the actual features supported
by the RTC so userspace has a better way than trying and failing.

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-5.16

for you to fetch changes up to b476266f063e680039be1541cfde5f5cee400da3:

  rtc: rx8025: use .set_offset/.read_offset (2021-11-10 00:45:57 +0100)

----------------------------------------------------------------
RTC for 5.16

Subsystem:
 - Add new ioctl to get and set extra RTC parameters, this includes backup
   switch mode
 - Expose available features to userspace, in particular, when alarmas have a
   resolution of one minute instead of a second.
 - Let the core handle those alarms with a minute resolution

New driver:
 - MSTAR MSC313 RTC

Drivers:
 - Add SPI ID table where necessary
 - Add BSM support for rv3028, rv3032 and pcf8523
 - s3c: set RTC range
 - rx8025: set range, implement .set_offset and .read_offset

----------------------------------------------------------------
Alexander Stein (1):
      rtc: pcf85063: add support for fixed clock

Alexandre Belloni (28):
      rtc: msc313: fix missing include
      rtc: add alarm related features
      rtc: add parameter ioctl
      rtc: expose correction feature
      rtc: add correction parameter
      rtc: add BSM parameter
      rtc: rv3028: add BSM support
      rtc: rv3032: allow setting BSM
      rtc: pcf8523: avoid reading BLF in pcf8523_rtc_read_time
      rtc: expose RTC_FEATURE_UPDATE_INTERRUPT
      rtc: pcf8523: switch to regmap
      rtc: pcf8523: always compile pcf8523_rtc_ioctl
      rtc: pcf8523: remove unecessary ifdefery
      rtc: pcf8523: allow usage on ACPI platforms
      rtc: pcf8523: add BSM support
      rtc: pcf85063: silence cppcheck warning
      rtc: handle alarms with a minute resolution
      rtc: s35390a: let the core handle the alarm resolution
      rtc: rv3032: let the core handle the alarm resolution
      rtc: ab-eoz9: use RTC_FEATURE_UPDATE_INTERRUPT
      rtc: ab-eoz9: support UIE when available
      rtc: ab8500: let the core handle the alarm resolution
      rtc: rx8025: switch to devm_rtc_allocate_device
      rtc: rx8025: let the core handle the alarm resolution
      rtc: rx8025: set range
      rtc: rx8025: clear RTC_FEATURE_ALARM when alarm are not supported
      rtc: rx8025: use rtc_add_group
      rtc: rx8025: use .set_offset/.read_offset

Colin Ian King (2):
      rtc: msc313: Fix unintentional sign extension issues with left shift of a u16
      rtc: m41t80: return NULL rather than a plain 0 integer

Dan Carpenter (1):
      rtc: rv3032: fix error handling in rv3032_clkout_set_rate()

Daniel Palmer (1):
      rtc: Add support for the MSTAR MSC313 RTC

Dmitry Osipenko (1):
      rtc: tps80031: Remove driver

Dominique Martinet (1):
      rtc: rv8803: fix writing back ctrl in flag register

Krzysztof Kozlowski (2):
      rtc: omap: drop unneeded MODULE_ALIAS
      rtc: s5m: drop unneeded MODULE_ALIAS

Mark Brown (4):
      rtc: ds1302: Add SPI ID table
      rtc: ds1390: Add SPI ID table
      rtc: pcf2123: Add SPI ID table
      rtc: mcp795: Add SPI ID table

Phil Elwell (1):
      rtc: pcf85063: Always clear EXT_TEST from set_time

Romain Perier (1):
      dt-bindings: rtc: Add Mstar MSC313e RTC devicetree bindings documentation

Sam Protsenko (3):
      rtc: s3c: Remove usage of devm_rtc_device_register()
      rtc: s3c: Extract read/write IO into separate functions
      rtc: s3c: Add time range

Samuel Holland (1):
      rtc: sun6i: Allow probing without an early clock provider

Wolfram Sang (1):
      rtc: rx6110: simplify getting the adapter of a client

Yang Yingliang (2):
      rtc: class: don't call cdev_device_del() when cdev_device_add() failed
      rtc: class: check return value when calling dev_set_name()

 .../devicetree/bindings/rtc/mstar,msc313-rtc.yaml  |  49 +++
 .../devicetree/bindings/rtc/nxp,pcf85063.txt       |   9 +
 MAINTAINERS                                        |   1 +
 drivers/rtc/Kconfig                                |  19 +-
 drivers/rtc/Makefile                               |   2 +-
 drivers/rtc/class.c                                |  20 +-
 drivers/rtc/dev.c                                  |  65 +++
 drivers/rtc/interface.c                            |  15 +-
 drivers/rtc/rtc-ab-eoz9.c                          |   3 +-
 drivers/rtc/rtc-ab8500.c                           |  23 +-
 drivers/rtc/rtc-ds1302.c                           |   7 +
 drivers/rtc/rtc-ds1390.c                           |   7 +
 drivers/rtc/rtc-m41t80.c                           |   2 +-
 drivers/rtc/rtc-mcp795.c                           |   7 +
 drivers/rtc/rtc-msc313.c                           | 259 ++++++++++++
 drivers/rtc/rtc-omap.c                             |   1 -
 drivers/rtc/rtc-pcf2123.c                          |   9 +
 drivers/rtc/rtc-pcf85063.c                         |  16 +-
 drivers/rtc/rtc-pcf8523.c                          | 434 +++++++++------------
 drivers/rtc/rtc-rv3028.c                           |  74 ++++
 drivers/rtc/rtc-rv3032.c                           |  89 ++++-
 drivers/rtc/rtc-rv8803.c                           |   4 +-
 drivers/rtc/rtc-rx6110.c                           |   2 +-
 drivers/rtc/rtc-rx8025.c                           | 141 +++----
 drivers/rtc/rtc-s35390a.c                          |   7 +-
 drivers/rtc/rtc-s3c.c                              | 106 +++--
 drivers/rtc/rtc-s5m.c                              |   1 -
 drivers/rtc/rtc-sun6i.c                            |  13 +-
 drivers/rtc/rtc-tps80031.c                         | 324 ---------------
 include/linux/rtc.h                                |   3 +
 include/uapi/linux/rtc.h                           |  31 +-
 31 files changed, 982 insertions(+), 761 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/mstar,msc313-rtc.yaml
 create mode 100644 drivers/rtc/rtc-msc313.c
 delete mode 100644 drivers/rtc/rtc-tps80031.c

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
