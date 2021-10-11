Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50FE9429541
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Oct 2021 19:07:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233568AbhJKRJE (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 11 Oct 2021 13:09:04 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:58126 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233520AbhJKRJD (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 11 Oct 2021 13:09:03 -0400
Received: from [77.244.183.192] (port=63592 helo=melee.dev.aim)
        by hostingweb31.netsons.net with esmtpa (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1mZxfB-00DXft-T2; Mon, 11 Oct 2021 17:56:29 +0200
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
        Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 0/8] Add MAX77714 PMIC minimal driver (RTC and watchdog only)
Date:   Mon, 11 Oct 2021 17:56:07 +0200
Message-Id: <20211011155615.257529-1-luca@lucaceresoli.net>
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

Note! Something seems wrong in the interrupt management code. Due to the
fact that I'm not using interrupts on my hardware and since this is my
first addition of an MFD driver, I was unable to understand what is wrong
after studying the code for other MFD drivers. More details in reply to
patch 8. Advice would be greatly appreciated on this topic.

Except for that, all implemented functionality is tested and working: RTC
read/write, watchdog start/stop/ping/set_timeout.

The first 4 patches are trivial cleanups to the max77686 drivers and can
probably be applied easily.

Patches 5-8 add: dt bindings, mfd driver, watchdog driver and rtc driver.

Luca

Luca Ceresoli (8):
  mfd: max77686: Correct tab-based alignment of register addresses
  rtc: max77686: convert comments to kernel-doc format
  rtc: max77686: rename day-of-month defines
  rtc: max77686: remove useless variable
  dt-bindings: mfd: add Maxim MAX77714 PMIC
  mfd: max77714: Add driver for Maxim MAX77714 PMIC
  watchdog: max77714: add driver for the watchdog in the MAX77714 PMIC
  rtc: max77686: add MAX77714 support

 .../bindings/mfd/maxim,max77714.yaml          |  58 ++++++
 MAINTAINERS                                   |   8 +
 drivers/mfd/Kconfig                           |  14 ++
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/max77714.c                        | 151 ++++++++++++++++
 drivers/rtc/Kconfig                           |   2 +-
 drivers/rtc/rtc-max77686.c                    |  72 +++++---
 drivers/watchdog/Kconfig                      |   9 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/max77714_wdt.c               | 171 ++++++++++++++++++
 include/linux/mfd/max77686-private.h          |  28 +--
 include/linux/mfd/max77714.h                  |  68 +++++++
 12 files changed, 541 insertions(+), 42 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/maxim,max77714.yaml
 create mode 100644 drivers/mfd/max77714.c
 create mode 100644 drivers/watchdog/max77714_wdt.c
 create mode 100644 include/linux/mfd/max77714.h

-- 
2.25.1

