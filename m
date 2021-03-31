Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1A7034FF26
	for <lists+linux-rtc@lfdr.de>; Wed, 31 Mar 2021 13:03:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235412AbhCaLCv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 31 Mar 2021 07:02:51 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:52114 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S235508AbhCaLC1 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 31 Mar 2021 07:02:27 -0400
X-UUID: ce3f8740195649128628a158d18460c5-20210331
X-UUID: ce3f8740195649128628a158d18460c5-20210331
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by mailgw02.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1579024228; Wed, 31 Mar 2021 19:02:21 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 31 Mar 2021 19:02:18 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 31 Mar 2021 19:02:18 +0800
From:   Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Sebastian Reichel <sre@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Fei Shao <fshao@chromium.org>
CC:     Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Ran Bi <ran.bi@mediatek.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <srv_heupstream@mediatek.com>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v7 0/8] Add Support for MediaTek PMIC MT6359
Date:   Wed, 31 Mar 2021 19:01:59 +0800
Message-ID: <1617188527-3392-1-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 63A0CDBCB393E619655A56490683616F326E31817C2EB8EE35491081AD9163292000:8
X-MTK:  N
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This patchset includes refactoring interrupt and adding support to MT6359 PMIC.
MT6359 is the primary PMIC for MT6779 and probably other SOCs.
The series[1] sent by Wen will continue to upstream in this patchset afterwards.
This patchset is based on the pmic wrapper patchset[2].

[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=306579
[2] https://patchwork.kernel.org/project/linux-mediatek/list/?series=447127

changes since v6:
- fix yaml error.
- update dts node.

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
 .../bindings/regulator/mt6359-regulator.yaml  |  385 ++++++
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
 17 files changed, 2793 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6359.dtsi
 create mode 100644 drivers/regulator/mt6359-regulator.c
 create mode 100644 include/linux/mfd/mt6359/core.h
 create mode 100644 include/linux/mfd/mt6359/registers.h
 create mode 100644 include/linux/mfd/mt6359p/registers.h
 create mode 100644 include/linux/regulator/mt6359-regulator.h

-- 
2.18.0

