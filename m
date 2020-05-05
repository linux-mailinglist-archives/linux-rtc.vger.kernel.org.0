Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 913AE1C63BE
	for <lists+linux-rtc@lfdr.de>; Wed,  6 May 2020 00:14:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729229AbgEEWOH (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 5 May 2020 18:14:07 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:33302 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727089AbgEEWOH (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 5 May 2020 18:14:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1588716824; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cx37zR6d79/xf/0QpHzn//d4vrV1UcUeHuvyPmoNpCE=;
        b=jH4C3OJ7wkAS+/vYNBRYMnPtf4Fp2dzFcVIXXgA8z/zMs8tIQ1WzTa1JnUCZc+E3DZNaNs
        Q6gERTrdnitXibkRjHIPjLrrIaOBzQ4asfelfeMYHfvZyYk28UHCSn7RSKkFs5TwzVlM99
        vXDKlhqOwxsv0yoiGx2ALzJpmOUA8WI=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     od@zcrc.me, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 4/7] rtc: ingenic: Set wakeup params in probe
Date:   Wed,  6 May 2020 00:13:33 +0200
Message-Id: <20200505221336.222313-4-paul@crapouillou.net>
In-Reply-To: <20200505221336.222313-1-paul@crapouillou.net>
References: <20200505221336.222313-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

We can write the wakeup timing parameters as soon as the driver probes,
there's no need to wait the very last moment.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/rtc/rtc-jz4740.c | 95 +++++++++++++++++++---------------------
 1 file changed, 44 insertions(+), 51 deletions(-)

diff --git a/drivers/rtc/rtc-jz4740.c b/drivers/rtc/rtc-jz4740.c
index 129c68cebb92..8927fd0fb086 100644
--- a/drivers/rtc/rtc-jz4740.c
+++ b/drivers/rtc/rtc-jz4740.c
@@ -60,9 +60,6 @@ struct jz4740_rtc {
 	int irq;
 
 	spinlock_t lock;
-
-	unsigned int min_wakeup_pin_assert_time;
-	unsigned int reset_pin_assert_time;
 };
 
 static struct device *dev_for_power_off;
@@ -259,38 +256,6 @@ static void jz4740_rtc_poweroff(struct device *dev)
 
 static void jz4740_rtc_power_off(void)
 {
-	struct jz4740_rtc *rtc = dev_get_drvdata(dev_for_power_off);
-	unsigned long rtc_rate;
-	unsigned long wakeup_filter_ticks;
-	unsigned long reset_counter_ticks;
-
-	rtc_rate = clk_get_rate(rtc->clk);
-
-	/*
-	 * Set minimum wakeup pin assertion time: 100 ms.
-	 * Range is 0 to 2 sec if RTC is clocked at 32 kHz.
-	 */
-	wakeup_filter_ticks =
-		(rtc->min_wakeup_pin_assert_time * rtc_rate) / 1000;
-	if (wakeup_filter_ticks < JZ_RTC_WAKEUP_FILTER_MASK)
-		wakeup_filter_ticks &= JZ_RTC_WAKEUP_FILTER_MASK;
-	else
-		wakeup_filter_ticks = JZ_RTC_WAKEUP_FILTER_MASK;
-	jz4740_rtc_reg_write(rtc,
-			     JZ_REG_RTC_WAKEUP_FILTER, wakeup_filter_ticks);
-
-	/*
-	 * Set reset pin low-level assertion time after wakeup: 60 ms.
-	 * Range is 0 to 125 ms if RTC is clocked at 32 kHz.
-	 */
-	reset_counter_ticks = (rtc->reset_pin_assert_time * rtc_rate) / 1000;
-	if (reset_counter_ticks < JZ_RTC_RESET_COUNTER_MASK)
-		reset_counter_ticks &= JZ_RTC_RESET_COUNTER_MASK;
-	else
-		reset_counter_ticks = JZ_RTC_RESET_COUNTER_MASK;
-	jz4740_rtc_reg_write(rtc,
-			     JZ_REG_RTC_RESET_COUNTER, reset_counter_ticks);
-
 	jz4740_rtc_poweroff(dev_for_power_off);
 	kernel_halt();
 }
@@ -308,12 +273,49 @@ static const struct of_device_id jz4740_rtc_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, jz4740_rtc_of_match);
 
+static void jz4740_rtc_set_wakeup_params(struct jz4740_rtc *rtc,
+					 struct device_node *np,
+					 unsigned long rate)
+{
+	unsigned long wakeup_ticks, reset_ticks;
+	unsigned int min_wakeup_pin_assert_time = 60; /* Default: 60ms */
+	unsigned int reset_pin_assert_time = 100; /* Default: 100ms */
+
+	of_property_read_u32(np, "ingenic,reset-pin-assert-time-ms",
+			     &reset_pin_assert_time);
+	of_property_read_u32(np, "ingenic,min-wakeup-pin-assert-time-ms",
+			     &min_wakeup_pin_assert_time);
+
+	/*
+	 * Set minimum wakeup pin assertion time: 100 ms.
+	 * Range is 0 to 2 sec if RTC is clocked at 32 kHz.
+	 */
+	wakeup_ticks = (min_wakeup_pin_assert_time * rate) / 1000;
+	if (wakeup_ticks < JZ_RTC_WAKEUP_FILTER_MASK)
+		wakeup_ticks &= JZ_RTC_WAKEUP_FILTER_MASK;
+	else
+		wakeup_ticks = JZ_RTC_WAKEUP_FILTER_MASK;
+	jz4740_rtc_reg_write(rtc, JZ_REG_RTC_WAKEUP_FILTER, wakeup_ticks);
+
+	/*
+	 * Set reset pin low-level assertion time after wakeup: 60 ms.
+	 * Range is 0 to 125 ms if RTC is clocked at 32 kHz.
+	 */
+	reset_ticks = (reset_pin_assert_time * rate) / 1000;
+	if (reset_ticks < JZ_RTC_RESET_COUNTER_MASK)
+		reset_ticks &= JZ_RTC_RESET_COUNTER_MASK;
+	else
+		reset_ticks = JZ_RTC_RESET_COUNTER_MASK;
+	jz4740_rtc_reg_write(rtc, JZ_REG_RTC_RESET_COUNTER, reset_ticks);
+}
+
 static int jz4740_rtc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	int ret;
 	struct jz4740_rtc *rtc;
+	unsigned long rate;
 
 	rtc = devm_kzalloc(dev, sizeof(*rtc), GFP_KERNEL);
 	if (!rtc)
@@ -369,6 +371,9 @@ static int jz4740_rtc_probe(struct platform_device *pdev)
 	rtc->rtc->ops = &jz4740_rtc_ops;
 	rtc->rtc->range_max = U32_MAX;
 
+	rate = clk_get_rate(rtc->clk);
+	jz4740_rtc_set_wakeup_params(rtc, np, rate);
+
 	ret = rtc_register_device(rtc->rtc);
 	if (ret)
 		return ret;
@@ -381,24 +386,12 @@ static int jz4740_rtc_probe(struct platform_device *pdev)
 	}
 
 	if (of_device_is_system_power_controller(np)) {
-		if (!pm_power_off) {
-			/* Default: 60ms */
-			rtc->reset_pin_assert_time = 60;
-			of_property_read_u32(np,
-					     "ingenic,reset-pin-assert-time-ms",
-					     &rtc->reset_pin_assert_time);
-
-			/* Default: 100ms */
-			rtc->min_wakeup_pin_assert_time = 100;
-			of_property_read_u32(np,
-					     "ingenic,min-wakeup-pin-assert-time-ms",
-					     &rtc->min_wakeup_pin_assert_time);
-
-			dev_for_power_off = dev;
+		dev_for_power_off = dev;
+
+		if (!pm_power_off)
 			pm_power_off = jz4740_rtc_power_off;
-		} else {
+		else
 			dev_warn(dev, "Poweroff handler already present!\n");
-		}
 	}
 
 	return 0;
-- 
2.26.2

