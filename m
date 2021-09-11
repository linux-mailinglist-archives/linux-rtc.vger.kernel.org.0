Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2580340793B
	for <lists+linux-rtc@lfdr.de>; Sat, 11 Sep 2021 17:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232788AbhIKQAd (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 11 Sep 2021 12:00:33 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:42275 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232333AbhIKQAd (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 11 Sep 2021 12:00:33 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 3C1F31BF208;
        Sat, 11 Sep 2021 15:59:19 +0000 (UTC)
Date:   Sat, 11 Sep 2021 17:59:18 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RTC changes for 5.15
Message-ID: <YTzSVk5Scx/nRP7K@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello Linus,

Here is the RTC subsystem pull request for v5.15 which is very late.
I'll try to not make that a habit. The broken down time conversion is
similar to what is done in the time subsystem since v5.14. The rest is
fairly straightforward.

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-5.15

for you to fetch changes up to 0c45d3e24ef3d3d87c5e0077b8f38d1372af7176:

  rtc: rx8010: select REGMAP_I2C (2021-09-09 10:18:40 +0200)

----------------------------------------------------------------
RTC for 5.15

Subsystem:
 - Switch to Neri and Schneider time conversion algorithm

Drivers:
 - rx8025: add rx8035 support
 - s5m: modernize driver and set range

----------------------------------------------------------------
Alexandre Belloni (6):
      rtc: s5m: switch to devm_rtc_allocate_device
      rtc: s5m: signal the core when alarm are not available
      rtc: s5m: enable wakeup only when available
      rtc: s5m: set range
      rtc: lib_test: add MODULE_LICENSE
      rtc: move RTC_LIB_KUNIT_TEST to proper location

Cassio Neri (1):
      rtc: Improve performance of rtc_time64_to_tm(). Add tests.

Dmitry Osipenko (1):
      rtc: tps65910: Correct driver module alias

Mateusz Jończyk (1):
      rtc: cmos: remove stale REVISIT comments

Mathew McBride (2):
      rtc: rx8025: implement RX-8035 support
      dt-bindings: rtc: add Epson RX-8025 and RX-8035

Yu-Tung Chang (1):
      rtc: rx8010: select REGMAP_I2C

 .../devicetree/bindings/rtc/trivial-rtc.yaml       |   3 +
 drivers/rtc/Kconfig                                |  10 ++
 drivers/rtc/Makefile                               |   2 +
 drivers/rtc/lib.c                                  | 107 +++++++++++++++------
 drivers/rtc/lib_test.c                             |  81 ++++++++++++++++
 drivers/rtc/rtc-cmos.c                             |   8 +-
 drivers/rtc/rtc-rx8025.c                           |  46 ++++++++-
 drivers/rtc/rtc-s5m.c                              |  48 ++++-----
 drivers/rtc/rtc-tps65910.c                         |   2 +-
 9 files changed, 243 insertions(+), 64 deletions(-)
 create mode 100644 drivers/rtc/lib_test.c

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
