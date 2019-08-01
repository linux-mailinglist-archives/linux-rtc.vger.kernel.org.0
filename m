Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C52467D9D8
	for <lists+linux-rtc@lfdr.de>; Thu,  1 Aug 2019 13:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731334AbfHALBo (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 1 Aug 2019 07:01:44 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:2534 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728884AbfHALBo (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 1 Aug 2019 07:01:44 -0400
X-UUID: c6d8adce30634400938f08c80ac5fe95-20190801
X-UUID: c6d8adce30634400938f08c80ac5fe95-20190801
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <ran.bi@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0707 with TLS)
        with ESMTP id 1792032667; Thu, 01 Aug 2019 19:01:36 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 1 Aug 2019 19:01:35 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 1 Aug 2019 19:01:34 +0800
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
Subject: [PATCH v2 1/4] bindings: rtc: add bindings for MT2712 RTC
Date:   Thu, 1 Aug 2019 19:01:19 +0800
Message-ID: <20190801110122.26834-2-ran.bi@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190801110122.26834-1-ran.bi@mediatek.com>
References: <20190801110122.26834-1-ran.bi@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 45D06EDA4E97A365DDB8FC8411C231299BF4772F0DC4E18D4349508AB0B90A912000:8
X-MTK:  N
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Document the binding for MT2712 RTC implemented by rtc-mt2712.

Signed-off-by: Ran Bi <ran.bi@mediatek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/rtc/rtc-mt2712.txt         | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-mt2712.txt

diff --git a/Documentation/devicetree/bindings/rtc/rtc-mt2712.txt b/Documentation/devicetree/bindings/rtc/rtc-mt2712.txt
new file mode 100644
index 000000000000..c33d87e5e753
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/rtc-mt2712.txt
@@ -0,0 +1,14 @@
+Device-Tree bindings for MediaTek SoC based RTC
+
+Required properties:
+- compatible	    : Should be "mediatek,mt2712-rtc" : for MT2712 SoC
+- reg 		    : Specifies base physical address and size of the registers;
+- interrupts	    : Should contain the interrupt for RTC alarm;
+
+Example:
+
+rtc: rtc@10011000 {
+	compatible = "mediatek,mt2712-rtc";
+	reg = <0 0x10011000 0 0x1000>;
+	interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_LOW>;
+};
-- 
2.21.0

