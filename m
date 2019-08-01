Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F81E7D9DD
	for <lists+linux-rtc@lfdr.de>; Thu,  1 Aug 2019 13:02:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731357AbfHALBs (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 1 Aug 2019 07:01:48 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:12106 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1731330AbfHALBq (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 1 Aug 2019 07:01:46 -0400
X-UUID: 891da93d988149bd8c9b89c86d615c76-20190801
X-UUID: 891da93d988149bd8c9b89c86d615c76-20190801
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <ran.bi@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0707 with TLS)
        with ESMTP id 1869350164; Thu, 01 Aug 2019 19:01:39 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 1 Aug 2019 19:01:40 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 1 Aug 2019 19:01:39 +0800
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
Subject: [PATCH v2 4/4] MAINTAINERS: add MT2712 RTC files
Date:   Thu, 1 Aug 2019 19:01:22 +0800
Message-ID: <20190801110122.26834-5-ran.bi@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190801110122.26834-1-ran.bi@mediatek.com>
References: <20190801110122.26834-1-ran.bi@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This patch add MT2712 RTC related files to MAINTAINERS.

Signed-off-by: Ran Bi <ran.bi@mediatek.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 783569e3c4b4..11f73a4c75eb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1892,7 +1892,9 @@ M:	Sean Wang <sean.wang@mediatek.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/rtc/rtc-mt2712.txt
 F:	Documentation/devicetree/bindings/rtc/rtc-mt7622.txt
+F:	drivers/rtc/rtc-mt2712.c
 F:	drivers/rtc/rtc-mt6397.c
 F:	drivers/rtc/rtc-mt7622.c
 
-- 
2.21.0

