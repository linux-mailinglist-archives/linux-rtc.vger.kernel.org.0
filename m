Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EBEA9A628
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2019 05:45:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388636AbfHWDpr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 22 Aug 2019 23:45:47 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:47706 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729659AbfHWDpr (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 22 Aug 2019 23:45:47 -0400
X-UUID: 8113fb132fd943e38ce1561fa061410c-20190823
X-UUID: 8113fb132fd943e38ce1561fa061410c-20190823
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0707 with TLS)
        with ESMTP id 1501840037; Fri, 23 Aug 2019 11:45:41 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 23 Aug 2019 11:45:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 23 Aug 2019 11:45:34 +0800
From:   Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Richard Fontana <rfontana@redhat.com>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <srv_heupstream@mediatek.com>
Subject: [PATCH v5 00/10] Add Support for MediaTek PMIC MT6358
Date:   Fri, 23 Aug 2019 11:45:21 +0800
Message-ID: <1566531931-9772-1-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 724ACC656101C80D0D4B68F2D13233D42BCF3B5D896D6C75D5318436924E44E62000:8
X-MTK:  N
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This patchset including refactoring interrupt add support to MT6358 PMIC.
MT6358 is the primary PMIC for MT8183 platform.

changes since v4:
- fix some comments for mfd driver.
- fix some coding style issues for regulator driver.
- merge the same voltage tables and index tables for regulator driver.
- remove regulator-always-on for vemc.
- change mtk rtc struct and variable naming.
- use of_device_get_match_data() to replace of_match_device() for rtc
  driver.

Hsin-Hsiung Wang (8):
  mfd: mt6397: clean up code
  mfd: mt6397: extract irq related code from core driver
  mfd: mt6397: modify suspend/resume behavior
  dt-bindings: mfd: Add compatible for the MediaTek MT6358 PMIC
  regulator: Add document for MT6358 regulator
  mfd: Add support for the MediaTek MT6358 PMIC
  regulator: mt6358: Add support for MT6358 regulator
  arm64: dts: mt6358: add PMIC MT6358 related nodes

Ran Bi (2):
  rtc: mt6397: fix alarm register overwrite
  rtc: mt6397: Add support for the MediaTek MT6358 RTC

 Documentation/devicetree/bindings/mfd/mt6397.txt   |  11 +-
 .../bindings/regulator/mt6358-regulator.txt        | 358 ++++++++++++++
 arch/arm64/boot/dts/mediatek/mt6358.dtsi           | 361 ++++++++++++++
 drivers/mfd/Makefile                               |   4 +-
 drivers/mfd/mt6358-irq.c                           | 231 +++++++++
 drivers/mfd/mt6397-core.c                          | 281 ++++-------
 drivers/mfd/mt6397-irq.c                           | 214 ++++++++
 drivers/regulator/Kconfig                          |   9 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/mt6358-regulator.c               | 549 +++++++++++++++++++++
 drivers/rtc/rtc-mt6397.c                           |  85 +++-
 include/linux/mfd/mt6358/core.h                    | 158 ++++++
 include/linux/mfd/mt6358/registers.h               | 282 +++++++++++
 include/linux/mfd/mt6397/core.h                    |  15 +
 include/linux/regulator/mt6358-regulator.h         |  56 +++
 15 files changed, 2393 insertions(+), 222 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/mt6358-regulator.txt
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6358.dtsi
 create mode 100644 drivers/mfd/mt6358-irq.c
 create mode 100644 drivers/mfd/mt6397-irq.c
 create mode 100644 drivers/regulator/mt6358-regulator.c
 create mode 100644 include/linux/mfd/mt6358/core.h
 create mode 100644 include/linux/mfd/mt6358/registers.h
 create mode 100644 include/linux/regulator/mt6358-regulator.h

-- 
1.9.1

