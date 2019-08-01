Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C91667D9D6
	for <lists+linux-rtc@lfdr.de>; Thu,  1 Aug 2019 13:02:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728065AbfHALBl (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 1 Aug 2019 07:01:41 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:4016 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726227AbfHALBl (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 1 Aug 2019 07:01:41 -0400
X-UUID: e74bd83137a940449891aed9a2be2cc6-20190801
X-UUID: e74bd83137a940449891aed9a2be2cc6-20190801
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <ran.bi@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0707 with TLS)
        with ESMTP id 1701189342; Thu, 01 Aug 2019 19:01:32 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 1 Aug 2019 19:01:34 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 1 Aug 2019 19:01:33 +0800
From:   Ran Bi <ran.bi@mediatek.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
CC:     Alessandro Zummo <a.zummo@towertech.it>,
        Mark Rutland <mark.rutland@arm.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, YT Shen <yt.shen@mediatek.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Flora Fu <flora.fu@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Ran Bi <ran.bi@mediatek.com>
Subject: [PATCH v2 0/4] Add Support for MediaTek MT2712 RTC
Date:   Thu, 1 Aug 2019 19:01:18 +0800
Message-ID: <20190801110122.26834-1-ran.bi@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This patchset add support to MT2712 RTC. MT2712 RTC is a SoC based RTC
with different architecture compared to MT7622 RTC.

Changes in V2:
1. change minimum year from 1968 to 2000
2. fix lock usage
3. stop to calculate useless day of week
4. stop to set default date after init
5. change the prefix of functions
6. use devm_request_threaded_irq() to replace request_threaded_irq()
7. add mt2712 rtc related files into MAINTAINERS

Ran Bi (4):
  bindings: rtc: add bindings for MT2712 RTC
  rtc: Add support for the MediaTek MT2712 RTC
  arm64: dts: add RTC nodes for MT2712
  MAINTAINERS: add MT2712 RTC files

 .../devicetree/bindings/rtc/rtc-mt2712.txt    |  14 +
 MAINTAINERS                                   |   2 +
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi     |   6 +
 drivers/rtc/Kconfig                           |  10 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-mt2712.c                      | 444 ++++++++++++++++++
 6 files changed, 477 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-mt2712.txt
 create mode 100644 drivers/rtc/rtc-mt2712.c

-- 
2.21.0

