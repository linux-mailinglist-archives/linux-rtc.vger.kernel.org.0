Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23E6B2B16E9
	for <lists+linux-rtc@lfdr.de>; Fri, 13 Nov 2020 09:03:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726136AbgKMIDY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 13 Nov 2020 03:03:24 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25]:42510 "EHLO cstnet.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726147AbgKMIDX (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 13 Nov 2020 03:03:23 -0500
Received: from localhost.localdomain (unknown [124.16.141.242])
        by APP-05 (Coremail) with SMTP id zQCowABnepy8Pa5f+OfMAA--.56342S2;
        Fri, 13 Nov 2020 16:03:08 +0800 (CST)
From:   Xu Wang <vulab@iscas.ac.cn>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: snvs: Remove NULL pointer check before clk_*
Date:   Fri, 13 Nov 2020 08:03:05 +0000
Message-Id: <20201113080305.65961-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: zQCowABnepy8Pa5f+OfMAA--.56342S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZr18XFW7KryrJFWxGFWkCrg_yoWrtrW3pa
        yfGFZYyrW2qF1kKF45Ar4Dur13JrWxKas7Xa4UC34I9343tryDtF4rCa40qayYyrWkAF42
        gr45JFyaya15KFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkab7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
        8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
        0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
        1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxEwVAFwVW8ZwCF04k2
        0xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI
        8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41l
        IxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIx
        AIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvE
        x4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07bFHqxUUUUU=
X-Originating-IP: [124.16.141.242]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCwUTA1z4jkvYdgAAsR
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Because clk_* already checked NULL clock parameter,
so the additional checks are unnecessary, just remove them.

Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
---
 drivers/rtc/rtc-snvs.c | 67 +++++++++++++++---------------------------
 1 file changed, 24 insertions(+), 43 deletions(-)

diff --git a/drivers/rtc/rtc-snvs.c b/drivers/rtc/rtc-snvs.c
index 0263d996b8a8..a7d39a49b748 100644
--- a/drivers/rtc/rtc-snvs.c
+++ b/drivers/rtc/rtc-snvs.c
@@ -151,17 +151,14 @@ static int snvs_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	unsigned long time;
 	int ret;
 
-	if (data->clk) {
-		ret = clk_enable(data->clk);
-		if (ret)
-			return ret;
-	}
+	ret = clk_enable(data->clk);
+	if (ret)
+		return ret;
 
 	time = rtc_read_lp_counter(data);
 	rtc_time64_to_tm(time, tm);
 
-	if (data->clk)
-		clk_disable(data->clk);
+	clk_disable(data->clk);
 
 	return 0;
 }
@@ -172,11 +169,9 @@ static int snvs_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	unsigned long time = rtc_tm_to_time64(tm);
 	int ret;
 
-	if (data->clk) {
-		ret = clk_enable(data->clk);
-		if (ret)
-			return ret;
-	}
+	ret = clk_enable(data->clk);
+	if (ret)
+		return ret;
 
 	/* Disable RTC first */
 	ret = snvs_rtc_enable(data, false);
@@ -190,8 +185,7 @@ static int snvs_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	/* Enable RTC again */
 	ret = snvs_rtc_enable(data, true);
 
-	if (data->clk)
-		clk_disable(data->clk);
+	clk_disable(data->clk);
 
 	return ret;
 }
@@ -202,11 +196,9 @@ static int snvs_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	u32 lptar, lpsr;
 	int ret;
 
-	if (data->clk) {
-		ret = clk_enable(data->clk);
-		if (ret)
-			return ret;
-	}
+	ret = clk_enable(data->clk);
+	if (ret)
+		return ret;
 
 	regmap_read(data->regmap, data->offset + SNVS_LPTAR, &lptar);
 	rtc_time64_to_tm(lptar, &alrm->time);
@@ -214,8 +206,7 @@ static int snvs_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	regmap_read(data->regmap, data->offset + SNVS_LPSR, &lpsr);
 	alrm->pending = (lpsr & SNVS_LPSR_LPTA) ? 1 : 0;
 
-	if (data->clk)
-		clk_disable(data->clk);
+	clk_disable(data->clk);
 
 	return 0;
 }
@@ -225,11 +216,9 @@ static int snvs_rtc_alarm_irq_enable(struct device *dev, unsigned int enable)
 	struct snvs_rtc_data *data = dev_get_drvdata(dev);
 	int ret;
 
-	if (data->clk) {
-		ret = clk_enable(data->clk);
-		if (ret)
-			return ret;
-	}
+	ret = clk_enable(data->clk);
+	if (ret)
+		return ret;
 
 	regmap_update_bits(data->regmap, data->offset + SNVS_LPCR,
 			   (SNVS_LPCR_LPTA_EN | SNVS_LPCR_LPWUI_EN),
@@ -237,8 +226,7 @@ static int snvs_rtc_alarm_irq_enable(struct device *dev, unsigned int enable)
 
 	ret = rtc_write_sync_lp(data);
 
-	if (data->clk)
-		clk_disable(data->clk);
+	clk_disable(data->clk);
 
 	return ret;
 }
@@ -249,11 +237,9 @@ static int snvs_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	unsigned long time = rtc_tm_to_time64(&alrm->time);
 	int ret;
 
-	if (data->clk) {
-		ret = clk_enable(data->clk);
-		if (ret)
-			return ret;
-	}
+	ret = clk_enable(data->clk);
+	if (ret)
+		return ret;
 
 	regmap_update_bits(data->regmap, data->offset + SNVS_LPCR, SNVS_LPCR_LPTA_EN, 0);
 	ret = rtc_write_sync_lp(data);
@@ -264,8 +250,7 @@ static int snvs_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	/* Clear alarm interrupt status bit */
 	regmap_write(data->regmap, data->offset + SNVS_LPSR, SNVS_LPSR_LPTA);
 
-	if (data->clk)
-		clk_disable(data->clk);
+	clk_disable(data->clk);
 
 	return snvs_rtc_alarm_irq_enable(dev, alrm->enabled);
 }
@@ -285,8 +270,7 @@ static irqreturn_t snvs_rtc_irq_handler(int irq, void *dev_id)
 	u32 lpsr;
 	u32 events = 0;
 
-	if (data->clk)
-		clk_enable(data->clk);
+	clk_enable(data->clk);
 
 	regmap_read(data->regmap, data->offset + SNVS_LPSR, &lpsr);
 
@@ -302,8 +286,7 @@ static irqreturn_t snvs_rtc_irq_handler(int irq, void *dev_id)
 	/* clear interrupt status */
 	regmap_write(data->regmap, data->offset + SNVS_LPSR, lpsr);
 
-	if (data->clk)
-		clk_disable(data->clk);
+	clk_disable(data->clk);
 
 	return events ? IRQ_HANDLED : IRQ_NONE;
 }
@@ -316,8 +299,7 @@ static const struct regmap_config snvs_rtc_config = {
 
 static void snvs_rtc_action(void *data)
 {
-	if (data)
-		clk_disable_unprepare(data);
+	clk_disable_unprepare(data);
 }
 
 static int snvs_rtc_probe(struct platform_device *pdev)
@@ -412,8 +394,7 @@ static int __maybe_unused snvs_rtc_suspend_noirq(struct device *dev)
 {
 	struct snvs_rtc_data *data = dev_get_drvdata(dev);
 
-	if (data->clk)
-		clk_disable(data->clk);
+	clk_disable(data->clk);
 
 	return 0;
 }
-- 
2.17.1

