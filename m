Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3D76433966
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Oct 2021 16:59:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230365AbhJSPBt (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 19 Oct 2021 11:01:49 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:59832 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229641AbhJSPBs (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 19 Oct 2021 11:01:48 -0400
Received: from [77.244.183.192] (port=62116 helo=melee.fritz.box)
        by hostingweb31.netsons.net with esmtpa (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1mcqaT-00D5qd-Mz; Tue, 19 Oct 2021 16:59:33 +0200
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     linux-kernel@vger.kernel.org
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Chiwoong Byun <woong.byun@samsung.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2 0/9] Add MAX77714 PMIC minimal driver (RTC and watchdog only)
Date:   Tue, 19 Oct 2021 16:59:10 +0200
Message-Id: <20211019145919.7327-1-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

this series adds minimal drivers for the Maxim Semiconductor MAX77714
(https://www.maximintegrated.com/en/products/power/power-management-ics/MAX77714.html).
Only RTC and watchdog are implemented by these patches.

All implemented functionality is tested and working: RTC read/write,
watchdog start/stop/ping/set_timeout.

Patches 1-4 + 7 are trivial cleanups to the max77686 drivers and can
probably be applied easily.

Patches 5, 6, 8 and 9 add: dt bindings, mfd driver, watchdog driver and rtc
driver.

Changes in v2:
 - fixed all issues reported on v1 patches
 - added patch 7 ("watchdog: Kconfig: fix help text indentation")
 - additional minor improvements

Luca

Luca Ceresoli (9):
  mfd: max77686: Correct tab-based alignment of register addresses
  rtc: max77686: convert comments to kernel-doc format
  rtc: max77686: rename day-of-month defines
  rtc: max77686: remove unused code to read in 12-hour mode
  dt-bindings: mfd: add Maxim MAX77714 PMIC
  mfd: max77714: Add driver for Maxim MAX77714 PMIC
  watchdog: Kconfig: fix help text indentation
  watchdog: max77714: add driver for the watchdog in the MAX77714 PMIC
  rtc: max77686: add MAX77714 support

 .../bindings/mfd/maxim,max77714.yaml          |  58 ++++++
 MAINTAINERS                                   |   8 +
 drivers/mfd/Kconfig                           |  14 ++
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/max77686.c                        |   2 +-
 drivers/mfd/max77714.c                        | 165 ++++++++++++++++
 drivers/rtc/Kconfig                           |   2 +-
 drivers/rtc/rtc-max77686.c                    |  75 +++++---
 drivers/watchdog/Kconfig                      |  57 +++---
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/max77714_wdt.c               | 179 ++++++++++++++++++
 include/linux/mfd/max77686-private.h          |  28 +--
 include/linux/mfd/max77714.h                  |  60 ++++++
 13 files changed, 580 insertions(+), 70 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/maxim,max77714.yaml
 create mode 100644 drivers/mfd/max77714.c
 create mode 100644 drivers/watchdog/max77714_wdt.c
 create mode 100644 include/linux/mfd/max77714.h

-- 
2.25.1

