Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5111B44DE0D
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Nov 2021 23:59:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbhKKXCA (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 11 Nov 2021 18:02:00 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:55082 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230131AbhKKXB7 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 11 Nov 2021 18:01:59 -0500
Received: from [77.244.183.192] (port=63166 helo=melee.fritz.box)
        by hostingweb31.netsons.net with esmtpa (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1mlJ2C-0007N5-1p; Thu, 11 Nov 2021 23:59:08 +0100
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     linux-kernel@vger.kernel.org
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Chiwoong Byun <woong.byun@samsung.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v3 0/8] Add MAX77714 PMIC minimal driver (RTC and watchdog only)
Date:   Thu, 11 Nov 2021 23:58:44 +0100
Message-Id: <20211111225852.3128201-1-luca@lucaceresoli.net>
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

Patches 1-3 + 6 are trivial cleanups to the max77686 drivers and Kconfig
indentation and can probably be applied easily.

Patches 4, 5, 7 and 8 add: dt bindings, mfd driver, watchdog driver and rtc
driver.

Changes in v3:
 - fixed all issues reported on v1 patches
 - removed patch 1 of v2, already applied
   ("mfd: max77686: Correct tab-based alignment of register addresses")

Changes in v2:
 - fixed all issues reported on v1 patches
 - added patch 7 ("watchdog: Kconfig: fix help text indentation")
 - additional minor improvements

Luca

Luca Ceresoli (8):
  rtc: max77686: convert comments to kernel-doc format
  rtc: max77686: rename day-of-month defines
  rtc: max77686: remove unused code to read in 12-hour mode
  dt-bindings: mfd: add Maxim MAX77714 PMIC
  mfd: max77714: Add driver for Maxim MAX77714 PMIC
  watchdog: Kconfig: fix help text indentation
  watchdog: max77714: add driver for the watchdog in the MAX77714 PMIC
  rtc: max77686: add MAX77714 support

 .../bindings/mfd/maxim,max77714.yaml          |  68 +++++++
 MAINTAINERS                                   |   8 +
 drivers/mfd/Kconfig                           |  14 ++
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/max77686.c                        |   2 +-
 drivers/mfd/max77714.c                        | 152 +++++++++++++++
 drivers/rtc/Kconfig                           |   2 +-
 drivers/rtc/rtc-max77686.c                    |  75 +++++---
 drivers/watchdog/Kconfig                      |  57 +++---
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/max77714_wdt.c               | 179 ++++++++++++++++++
 include/linux/mfd/max77686-private.h          |   4 +-
 include/linux/mfd/max77714.h                  |  60 ++++++
 13 files changed, 565 insertions(+), 58 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/maxim,max77714.yaml
 create mode 100644 drivers/mfd/max77714.c
 create mode 100644 drivers/watchdog/max77714_wdt.c
 create mode 100644 include/linux/mfd/max77714.h

-- 
2.25.1

