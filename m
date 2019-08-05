Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F41A68115D
	for <lists+linux-rtc@lfdr.de>; Mon,  5 Aug 2019 07:22:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727298AbfHEFWv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 5 Aug 2019 01:22:51 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:20375 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726559AbfHEFWu (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 5 Aug 2019 01:22:50 -0400
X-UUID: 38c73d5d2c0b42a981506abb98e89495-20190805
X-UUID: 38c73d5d2c0b42a981506abb98e89495-20190805
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0707 with TLS)
        with ESMTP id 255577387; Mon, 05 Aug 2019 13:22:43 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 5 Aug 2019 13:22:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 5 Aug 2019 13:22:43 +0800
From:   Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Brown <broonie@kernel.org>
CC:     Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Richard Fontana <rfontana@redhat.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, Ran Bi <ran.bi@mediatek.com>
Subject: [PATCH v4 09/10] rtc: mt6397: fix alarm register overwrite
Date:   Mon, 5 Aug 2019 13:21:57 +0800
Message-ID: <1564982518-32163-10-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1564982518-32163-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1564982518-32163-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Ran Bi <ran.bi@mediatek.com>

Alarm registers high byte was reserved for other functions.
This add mask in alarm registers operation functions.
This also fix error condition in interrupt handler.

Fixes: fc2979118f3f ("rtc: mediatek: Add MT6397 RTC driver")

Signed-off-by: Ran Bi <ran.bi@mediatek.com>
---
 drivers/rtc/rtc-mt6397.c | 47 +++++++++++++++++++++++++++++++++--------------
 1 file changed, 33 insertions(+), 14 deletions(-)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index b46ed4d..828def7 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -47,6 +47,14 @@
 
 #define RTC_AL_SEC		0x0018
 
+#define RTC_AL_SEC_MASK		0x003f
+#define RTC_AL_MIN_MASK		0x003f
+#define RTC_AL_HOU_MASK		0x001f
+#define RTC_AL_DOM_MASK		0x001f
+#define RTC_AL_DOW_MASK		0x0007
+#define RTC_AL_MTH_MASK		0x000f
+#define RTC_AL_YEA_MASK		0x007f
+
 #define RTC_PDN2		0x002e
 #define RTC_PDN2_PWRON_ALARM	BIT(4)
 
@@ -103,7 +111,7 @@ static irqreturn_t mtk_rtc_irq_handler_thread(int irq, void *data)
 		irqen = irqsta & ~RTC_IRQ_EN_AL;
 		mutex_lock(&rtc->lock);
 		if (regmap_write(rtc->regmap, rtc->addr_base + RTC_IRQ_EN,
-				 irqen) < 0)
+				 irqen) == 0)
 			mtk_rtc_write_trigger(rtc);
 		mutex_unlock(&rtc->lock);
 
@@ -225,12 +233,12 @@ static int mtk_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
 	alm->pending = !!(pdn2 & RTC_PDN2_PWRON_ALARM);
 	mutex_unlock(&rtc->lock);
 
-	tm->tm_sec = data[RTC_OFFSET_SEC];
-	tm->tm_min = data[RTC_OFFSET_MIN];
-	tm->tm_hour = data[RTC_OFFSET_HOUR];
-	tm->tm_mday = data[RTC_OFFSET_DOM];
-	tm->tm_mon = data[RTC_OFFSET_MTH];
-	tm->tm_year = data[RTC_OFFSET_YEAR];
+	tm->tm_sec = data[RTC_OFFSET_SEC] & RTC_AL_SEC_MASK;
+	tm->tm_min = data[RTC_OFFSET_MIN] & RTC_AL_MIN_MASK;
+	tm->tm_hour = data[RTC_OFFSET_HOUR] & RTC_AL_HOU_MASK;
+	tm->tm_mday = data[RTC_OFFSET_DOM] & RTC_AL_DOM_MASK;
+	tm->tm_mon = data[RTC_OFFSET_MTH] & RTC_AL_MTH_MASK;
+	tm->tm_year = data[RTC_OFFSET_YEAR] & RTC_AL_YEA_MASK;
 
 	tm->tm_year += RTC_MIN_YEAR_OFFSET;
 	tm->tm_mon--;
@@ -251,14 +259,25 @@ static int mtk_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
 	tm->tm_year -= RTC_MIN_YEAR_OFFSET;
 	tm->tm_mon++;
 
-	data[RTC_OFFSET_SEC] = tm->tm_sec;
-	data[RTC_OFFSET_MIN] = tm->tm_min;
-	data[RTC_OFFSET_HOUR] = tm->tm_hour;
-	data[RTC_OFFSET_DOM] = tm->tm_mday;
-	data[RTC_OFFSET_MTH] = tm->tm_mon;
-	data[RTC_OFFSET_YEAR] = tm->tm_year;
-
 	mutex_lock(&rtc->lock);
+	ret = regmap_bulk_read(rtc->regmap, rtc->addr_base + RTC_AL_SEC,
+			       data, RTC_OFFSET_COUNT);
+	if (ret < 0)
+		goto exit;
+
+	data[RTC_OFFSET_SEC] = ((data[RTC_OFFSET_SEC] & ~(RTC_AL_SEC_MASK)) |
+				(tm->tm_sec & RTC_AL_SEC_MASK));
+	data[RTC_OFFSET_MIN] = ((data[RTC_OFFSET_MIN] & ~(RTC_AL_MIN_MASK)) |
+				(tm->tm_min & RTC_AL_MIN_MASK));
+	data[RTC_OFFSET_HOUR] = ((data[RTC_OFFSET_HOUR] & ~(RTC_AL_HOU_MASK)) |
+				(tm->tm_hour & RTC_AL_HOU_MASK));
+	data[RTC_OFFSET_DOM] = ((data[RTC_OFFSET_DOM] & ~(RTC_AL_DOM_MASK)) |
+				(tm->tm_mday & RTC_AL_DOM_MASK));
+	data[RTC_OFFSET_MTH] = ((data[RTC_OFFSET_MTH] & ~(RTC_AL_MTH_MASK)) |
+				(tm->tm_mon & RTC_AL_MTH_MASK));
+	data[RTC_OFFSET_YEAR] = ((data[RTC_OFFSET_YEAR] & ~(RTC_AL_YEA_MASK)) |
+				(tm->tm_year & RTC_AL_YEA_MASK));
+
 	if (alm->enabled) {
 		ret = regmap_bulk_write(rtc->regmap,
 					rtc->addr_base + RTC_AL_SEC,
-- 
2.6.4

