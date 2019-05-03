Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 813C812AA0
	for <lists+linux-rtc@lfdr.de>; Fri,  3 May 2019 11:33:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727445AbfECJc4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 3 May 2019 05:32:56 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:3695 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727065AbfECJcx (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 3 May 2019 05:32:53 -0400
X-UUID: 83e55071fc694c3791f0629c516cc74e-20190503
X-UUID: 83e55071fc694c3791f0629c516cc74e-20190503
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 1258667011; Fri, 03 May 2019 17:32:41 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 3 May 2019 17:32:39 +0800
Received: from mtkslt302.mediatek.inc (10.21.14.115) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 3 May 2019 17:32:39 +0800
From:   Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
CC:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <srv_heupstream@mediatek.com>
Subject: [PATCH v3 00/10] Add Support for MediaTek PMIC MT6358
Date:   Fri, 3 May 2019 17:31:07 +0800
Message-ID: <20190503093117.54830-1-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 7D00067F9E396F22E551B149909C1757BD011A8E6CD7F1F19677A6571AAF39D12000:8
X-MTK:  N
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This patchset including refactoring interrupt add support to MT6358 PMIC.
MT6358 is the primary PMIC for MT8183 platform.

changes since v2:
- rewrite the description of MT6358 regulators.
- refine some coding style in the dts for better code quality.
- refine the suspend behavior of mfd driver.
- some minor bug fix of mfd driver, like adding IRQCHIP_SKIP_SET_WAKE
  flag.
- remove unused MT6358 register.
- merge the same voltage table and remove unused chip id in the MT6358
  regulator driver.

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
  rtc: Add support for the MediaTek MT6358 RTC

 .../devicetree/bindings/mfd/mt6397.txt        |  11 +-
 .../bindings/regulator/mt6358-regulator.txt   | 358 +++++++++++
 arch/arm64/boot/dts/mediatek/mt6358.dtsi      | 358 +++++++++++
 drivers/mfd/Makefile                          |   4 +-
 drivers/mfd/mt6358-irq.c                      | 229 +++++++
 drivers/mfd/mt6397-core.c                     | 293 +++------
 drivers/mfd/mt6397-irq.c                      | 214 +++++++
 drivers/regulator/Kconfig                     |   9 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/mt6358-regulator.c          | 586 ++++++++++++++++++
 drivers/rtc/rtc-mt6397.c                      |  90 ++-
 include/linux/mfd/mt6358/core.h               | 158 +++++
 include/linux/mfd/mt6358/registers.h          | 282 +++++++++
 include/linux/mfd/mt6397/core.h               |  15 +
 include/linux/regulator/mt6358-regulator.h    |  56 ++
 15 files changed, 2442 insertions(+), 222 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/mt6358-regulator.txt
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6358.dtsi
 create mode 100644 drivers/mfd/mt6358-irq.c
 create mode 100644 drivers/mfd/mt6397-irq.c
 create mode 100644 drivers/regulator/mt6358-regulator.c
 create mode 100644 include/linux/mfd/mt6358/core.h
 create mode 100644 include/linux/mfd/mt6358/registers.h
 create mode 100644 include/linux/regulator/mt6358-regulator.h

-- 
2.18.0

