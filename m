Return-Path: <linux-rtc+bounces-4658-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 203F6B1FF7F
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Aug 2025 08:46:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F65D165FD2
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Aug 2025 06:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CB3F26B2D5;
	Mon, 11 Aug 2025 06:46:00 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from vs81.iboxed.net (vs10.datenmanufaktur-hosting.net [213.160.73.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B91E29CEB;
	Mon, 11 Aug 2025 06:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754894760; cv=none; b=AoWw31alqXohqoDRqaH4EX+7sbdUzH20CsXxTGPnyI+ZWaVvYjYdZdGdx0GkhmwKBbtVx7mOyYSV3hoUeoj+k52zW4tDq/deD8SaNXhxSh2BpVNtC21eqmmkYjUTgsLfFe4QtDANIkhwoeuFkEMjBU8mLH0lfr7l+zznzap8Sck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754894760; c=relaxed/simple;
	bh=+fzJxtFZICNlOTaShUCCSdZQ98cKC6NPiRTRpgHgNb0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OLfoDRSNg1hA9jvMCyAu3+INEAEsmFHAYvvhgG/ZCbTltVTKmqJCcuea6pevKnZJ6uZxKoZ2ycCPxFRK3PaVqf/TsNttjACY1c+4Vrnqmif18ZXerdimucdQZg1VSkQF0v1sBzGiFknbM3vUY7wqqrnj91Yf0/shw38sh1UhnyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de; spf=pass smtp.mailfrom=blala.de; arc=none smtp.client-ip=213.160.73.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blala.de
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id 57B6iF0X001704;
	Mon, 11 Aug 2025 06:44:15 GMT
Received: (from akurz@localhost)
	by blala.de (8.15.2/8.15.2/Submit) id 57B6iFQD001703;
	Mon, 11 Aug 2025 06:44:15 GMT
From: Alexander Kurz <akurz@blala.de>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee@kernel.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        linux-input@vger.kernel.or, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, Alexander Kurz <akurz@blala.de>
Subject: [PATCH] Drivers: mc13783: remove deprecated mc13xxx_irq_ack()
Date: Mon, 11 Aug 2025 06:43:58 +0000
Message-Id: <20250811064358.1659-1-akurz@blala.de>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mc13xxx_irq_ack() got deprecated and became dead code with commit
10f9edaeaa30 ("mfd: mc13xxx: Use regmap irq framework for interrupts").
It should be safe to remove it now.

Signed-off-by: Alexander Kurz <akurz@blala.de>
---
 drivers/input/misc/mc13783-pwrbutton.c |  1 -
 drivers/input/touchscreen/mc13783_ts.c |  4 ----
 drivers/rtc/rtc-mc13xxx.c              | 13 -------------
 include/linux/mfd/mc13xxx.h            |  6 ------
 4 files changed, 24 deletions(-)

diff --git a/drivers/input/misc/mc13783-pwrbutton.c b/drivers/input/misc/mc13783-pwrbutton.c
index 1c7faa9b7afe..b83d762ae2e9 100644
--- a/drivers/input/misc/mc13783-pwrbutton.c
+++ b/drivers/input/misc/mc13783-pwrbutton.c
@@ -57,7 +57,6 @@ static irqreturn_t button_irq(int irq, void *_priv)
 	struct mc13783_pwrb *priv = _priv;
 	int val;
 
-	mc13xxx_irq_ack(priv->mc13783, irq);
 	mc13xxx_reg_read(priv->mc13783, MC13783_REG_INTERRUPT_SENSE_1, &val);
 
 	switch (irq) {
diff --git a/drivers/input/touchscreen/mc13783_ts.c b/drivers/input/touchscreen/mc13783_ts.c
index 33635da85079..47b8da00027f 100644
--- a/drivers/input/touchscreen/mc13783_ts.c
+++ b/drivers/input/touchscreen/mc13783_ts.c
@@ -42,8 +42,6 @@ static irqreturn_t mc13783_ts_handler(int irq, void *data)
 {
 	struct mc13783_ts_priv *priv = data;
 
-	mc13xxx_irq_ack(priv->mc13xxx, irq);
-
 	/*
 	 * Kick off reading coordinates. Note that if work happens already
 	 * be queued for future execution (it rearms itself) it will not
@@ -137,8 +135,6 @@ static int mc13783_ts_open(struct input_dev *dev)
 
 	mc13xxx_lock(priv->mc13xxx);
 
-	mc13xxx_irq_ack(priv->mc13xxx, MC13XXX_IRQ_TS);
-
 	ret = mc13xxx_irq_request(priv->mc13xxx, MC13XXX_IRQ_TS,
 		mc13783_ts_handler, MC13783_TS_NAME, priv);
 	if (ret)
diff --git a/drivers/rtc/rtc-mc13xxx.c b/drivers/rtc/rtc-mc13xxx.c
index e7b87130e624..2494d13fd767 100644
--- a/drivers/rtc/rtc-mc13xxx.c
+++ b/drivers/rtc/rtc-mc13xxx.c
@@ -137,10 +137,6 @@ static int mc13xxx_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	}
 
 	if (!priv->valid) {
-		ret = mc13xxx_irq_ack(priv->mc13xxx, MC13XXX_IRQ_RTCRST);
-		if (unlikely(ret))
-			goto out;
-
 		ret = mc13xxx_irq_unmask(priv->mc13xxx, MC13XXX_IRQ_RTCRST);
 	}
 
@@ -208,10 +204,6 @@ static int mc13xxx_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 	if (unlikely(ret))
 		goto out;
 
-	ret = mc13xxx_irq_ack(priv->mc13xxx, MC13XXX_IRQ_TODA);
-	if (unlikely(ret))
-		goto out;
-
 	s1970 = rtc_tm_to_time64(&alarm->time);
 
 	dev_dbg(dev, "%s: %s %lld\n", __func__, alarm->enabled ? "on" : "off",
@@ -239,12 +231,9 @@ static int mc13xxx_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 static irqreturn_t mc13xxx_rtc_alarm_handler(int irq, void *dev)
 {
 	struct mc13xxx_rtc *priv = dev;
-	struct mc13xxx *mc13xxx = priv->mc13xxx;
 
 	rtc_update_irq(priv->rtc, 1, RTC_IRQF | RTC_AF);
 
-	mc13xxx_irq_ack(mc13xxx, irq);
-
 	return IRQ_HANDLED;
 }
 
@@ -293,8 +282,6 @@ static int __init mc13xxx_rtc_probe(struct platform_device *pdev)
 
 	mc13xxx_lock(mc13xxx);
 
-	mc13xxx_irq_ack(mc13xxx, MC13XXX_IRQ_RTCRST);
-
 	ret = mc13xxx_irq_request(mc13xxx, MC13XXX_IRQ_RTCRST,
 			mc13xxx_rtc_reset_handler, DRIVER_NAME, priv);
 	if (ret)
diff --git a/include/linux/mfd/mc13xxx.h b/include/linux/mfd/mc13xxx.h
index f372926d5894..dd46fe424a80 100644
--- a/include/linux/mfd/mc13xxx.h
+++ b/include/linux/mfd/mc13xxx.h
@@ -31,12 +31,6 @@ int mc13xxx_adc_do_conversion(struct mc13xxx *mc13xxx,
 		unsigned int mode, unsigned int channel,
 		u8 ato, bool atox, unsigned int *sample);
 
-/* Deprecated calls */
-static inline int mc13xxx_irq_ack(struct mc13xxx *mc13xxx, int irq)
-{
-	return 0;
-}
-
 static inline int mc13xxx_irq_request_nounmask(struct mc13xxx *mc13xxx, int irq,
 					       irq_handler_t handler,
 					       const char *name, void *dev)
-- 
2.39.5


