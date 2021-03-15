Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 316E633C47F
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Mar 2021 18:38:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236872AbhCORhQ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 15 Mar 2021 13:37:16 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:55662 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S236592AbhCORgv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 15 Mar 2021 13:36:51 -0400
X-UUID: 0ed98affa11d46a2966fa5275e872677-20210316
X-UUID: 0ed98affa11d46a2966fa5275e872677-20210316
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1902592022; Tue, 16 Mar 2021 01:36:46 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Mar 2021 01:36:45 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 16 Mar 2021 01:36:45 +0800
From:   Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Nicolas Boichat <drinkcat@chromium.org>
CC:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Fei Shao <fshao@chromium.org>, Ran Bi <ran.bi@mediatek.com>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <srv_heupstream@mediatek.com>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v6 0/8] Add Support for MediaTek PMIC MT6359
Date:   Tue, 16 Mar 2021 01:35:49 +0800
Message-ID: <1615829757-3223-1-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This patchset includes refactoring interrupt and adding support to MT6359 PMIC.
MT6359 is the primary PMIC for MT6779 and probably other SOCs.
The series[1] sent by Wen will continue to upstream in this patchset afterwards.

[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=306579

changes since v5:
- rebase to Linux 5.12.
- refine the code structure.
- update the file date.

Hsin-Hsiung Wang (6):
  mfd: mt6358: refine interrupt code
  rtc: mt6397: refine RTC_TC_MTH
  dt-bindings: mfd: Add compatible for the MediaTek MT6359 PMIC
  dt-bindings: regulator: Add document for MT6359 regulator
  mfd: Add support for the MediaTek MT6359 PMIC
  regulator: mt6359: Add support for MT6359P regulator

Wen Su (2):
  regulator: mt6359: Add support for MT6359 regulator
  arm64: dts: mt6359: add PMIC MT6359 related nodes

 .../devicetree/bindings/mfd/mt6397.txt        |    1 +
 .../bindings/regulator/mt6359-regulator.yaml  |  169 +++
 arch/arm64/boot/dts/mediatek/mt6359.dtsi      |  298 +++++
 arch/arm64/boot/dts/mediatek/mt8192-evb.dts   |    1 +
 drivers/mfd/mt6358-irq.c                      |   89 +-
 drivers/mfd/mt6397-core.c                     |   24 +
 drivers/regulator/Kconfig                     |    9 +
 drivers/regulator/Makefile                    |    1 +
 drivers/regulator/mt6359-regulator.c          | 1036 +++++++++++++++++
 drivers/rtc/rtc-mt6397.c                      |    2 +-
 include/linux/mfd/mt6358/core.h               |    8 +-
 include/linux/mfd/mt6359/core.h               |  133 +++
 include/linux/mfd/mt6359/registers.h          |  529 +++++++++
 include/linux/mfd/mt6359p/registers.h         |  249 ++++
 include/linux/mfd/mt6397/core.h               |    1 +
 include/linux/mfd/mt6397/rtc.h                |    1 +
 include/linux/regulator/mt6359-regulator.h    |   59 +
 17 files changed, 2577 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6359.dtsi
 create mode 100644 drivers/regulator/mt6359-regulator.c
 create mode 100644 include/linux/mfd/mt6359/core.h
 create mode 100644 include/linux/mfd/mt6359/registers.h
 create mode 100644 include/linux/mfd/mt6359p/registers.h
 create mode 100644 include/linux/regulator/mt6359-regulator.h

-- 
2.18.0

