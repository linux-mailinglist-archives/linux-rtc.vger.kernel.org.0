Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D95133C47B
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Mar 2021 18:38:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236285AbhCORhP (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 15 Mar 2021 13:37:15 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:47730 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S236562AbhCORgu (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 15 Mar 2021 13:36:50 -0400
X-UUID: 8a549619aca244bcae45afd3c2116b21-20210316
X-UUID: 8a549619aca244bcae45afd3c2116b21-20210316
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 81898855; Tue, 16 Mar 2021 01:36:47 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
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
        <Project_Global_Chrome_Upstream_Group@mediatek.com>,
        Yuchen Huang <yuchen.huang@mediatek.com>
Subject: [PATCH v6 2/8] rtc: mt6397: refine RTC_TC_MTH
Date:   Tue, 16 Mar 2021 01:35:51 +0800
Message-ID: <1615829757-3223-3-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1615829757-3223-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1615829757-3223-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This patch adds RTC_TC_MTH_MASK to support new chips.

Signed-off-by: Yuchen Huang <yuchen.huang@mediatek.com>
Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
changes since v5:
- no change.
---
 drivers/rtc/rtc-mt6397.c       | 2 +-
 include/linux/mfd/mt6397/rtc.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 6655035e5164..80dc479a6ff0 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -75,7 +75,7 @@ static int __mtk_rtc_read_time(struct mt6397_rtc *rtc,
 	tm->tm_min = data[RTC_OFFSET_MIN];
 	tm->tm_hour = data[RTC_OFFSET_HOUR];
 	tm->tm_mday = data[RTC_OFFSET_DOM];
-	tm->tm_mon = data[RTC_OFFSET_MTH];
+	tm->tm_mon = data[RTC_OFFSET_MTH] & RTC_TC_MTH_MASK;
 	tm->tm_year = data[RTC_OFFSET_YEAR];
 
 	ret = regmap_read(rtc->regmap, rtc->addr_base + RTC_TC_SEC, sec);
diff --git a/include/linux/mfd/mt6397/rtc.h b/include/linux/mfd/mt6397/rtc.h
index c3748b53bf7d..068ae1c0f0e8 100644
--- a/include/linux/mfd/mt6397/rtc.h
+++ b/include/linux/mfd/mt6397/rtc.h
@@ -36,6 +36,7 @@
 #define RTC_AL_MASK_DOW                BIT(4)
 
 #define RTC_TC_SEC             0x000a
+#define RTC_TC_MTH_MASK        0x000f
 /* Min, Hour, Dom... register offset to RTC_TC_SEC */
 #define RTC_OFFSET_SEC         0
 #define RTC_OFFSET_MIN         1
-- 
2.18.0

