Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FB9D5C7B1
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Jul 2019 05:21:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726434AbfGBDVm (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 1 Jul 2019 23:21:42 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:6955 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726781AbfGBDVm (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 1 Jul 2019 23:21:42 -0400
X-UUID: 8e85d6d4f8c24f199f1a9091baa395dd-20190702
X-UUID: 8e85d6d4f8c24f199f1a9091baa395dd-20190702
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by mailgw02.mediatek.com
        (envelope-from <ran.bi@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 1168820601; Tue, 02 Jul 2019 11:21:36 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 2 Jul 2019 11:21:35 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 2 Jul 2019 11:21:34 +0800
From:   Ran Bi <ran.bi@mediatek.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
CC:     Alessandro Zummo <a.zummo@towertech.it>,
        Mark Rutland <mark.rutland@arm.com>,
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
Subject: [PATCH 0/3] Add Support for MediaTek MT2712 RTC
Date:   Tue, 2 Jul 2019 11:21:17 +0800
Message-ID: <20190702032120.16539-1-ran.bi@mediatek.com>
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

Ran Bi (3):
  bindings: rtc: add bindings for MT2712 RTC
  rtc: Add support for the MediaTek MT2712 RTC
  arm64: dts: add rtc nodes for MT2712

 .../devicetree/bindings/rtc/rtc-mt2712.txt    |  14 +
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi     |   6 +
 drivers/rtc/Kconfig                           |  10 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-mt2712.c                      | 495 ++++++++++++++++++
 5 files changed, 526 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-mt2712.txt
 create mode 100644 drivers/rtc/rtc-mt2712.c

-- 
2.18.0

