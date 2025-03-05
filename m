Return-Path: <linux-rtc+bounces-3406-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2444A4F931
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Mar 2025 09:52:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7640F3AB66F
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Mar 2025 08:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE3D61FDA73;
	Wed,  5 Mar 2025 08:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="V4ROWFPN"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8311FDA6A
	for <linux-rtc@vger.kernel.org>; Wed,  5 Mar 2025 08:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741164732; cv=none; b=dE6jmDO9PlG9X5n+qx9tr+7OqTLUce3Fuglwd9va0bj9q2ZWaPlx7GenCOiAuIBXQtqchdBxRUqRmNkNct5CyG9OjWrH6WAeI+DiCpZlV88RIncIe7KxAnGoxdNusJG9R/SgpImxzpimeInMghReJfqyOs8SE59oHFuo5wDB2+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741164732; c=relaxed/simple;
	bh=8Qo2SQfdNxOhDAXKgSBcQjW1hFzqY35m9S/flozymjY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P17YUVCfBYorwopau50P28szBATD/6lAF+viWgiulpKnK59hShMc7BozduzkLTdmNqWVHAhNgjwX1rjyFYaev+HZpqpoCrhkipJZQEWZTAlHLdnflmkac3JYC661ajDFrg+nLs3g6HlQxWGMmc+dpZVcDaXxvjPCHSr+gF6n8sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=V4ROWFPN; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=EHkb/8HWXUe3Fu
	vAzqLqjC7LTgd//jEOcrDgyrW2Stc=; b=V4ROWFPNdmsHVA5BcDbGKoGWOsp6VF
	tRCjj/kcRsQgVU3G3c5mCk0eBZJCmvVFadN0QoxgZnfqgurgdUG6Uc/N3ENm8j7W
	m5dMHPTH3vD+fGuNwivZNHZH69YRNhprWqhB/6xuPaYTipLQTMJdvN7nlMNwdRRU
	k64MKVgycGzNGVcRyn41jJF0mB/d3Y3ZU0V1sUbwOt3klmC3ZTirGQ9aQGxeNmu7
	L3hGDPtOOkAl4fZeS7ZqIitKxW2VlI6o+Y8sFNBZ+VPn5AQdCDBqp3tz0RsJMS96
	S+3ZxFzn1F7RgzbqxG0xRuw5AyNwCo55OcCltTGnJSXC66biPrKaWXVg==
Received: (qmail 2863125 invoked from network); 5 Mar 2025 09:51:59 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Mar 2025 09:51:59 +0100
X-UD-Smtp-Session: l3s3148p1@xQKTgJQvdNYgAwDPXylhAB+mKiir6bOV
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: [PATCH] rtc: rzn1: implement one-second accuracy for alarms
Date: Wed,  5 Mar 2025 09:47:37 +0100
Message-ID: <20250305085155.6520-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hardware alarm only supports one-minute accuracy which is coarse and
disables UIE usage. Use the 1-second interrupt to achieve per-second
accuracy. It is activated once we hit the per-minute alarm. The new
feature is optional. When there is no 1-second interrupt, old behaviour
with per-minute accuracy is used as before. With this feature, all tests
of 'rtctest' are successfully passed.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Tested with the Renesas RZ/N1D board. Besides 'rtctest', I did some
manual testing with 'rtc' on top trying to stresstest corner cases.

Looking forward to comments. AFAICS, this is the first driver trying to
overcome the per-minute limitation using 1-second interrupts.

 drivers/rtc/rtc-rzn1.c | 106 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 90 insertions(+), 16 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index cb220807d925..bc3c948c3d2f 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -19,6 +19,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/rtc.h>
+#include <linux/spinlock.h>
 
 #define RZN1_RTC_CTL0 0x00
 #define   RZN1_RTC_CTL0_SLSB_SUBU 0
@@ -27,6 +28,7 @@
 #define   RZN1_RTC_CTL0_CE BIT(7)
 
 #define RZN1_RTC_CTL1 0x04
+#define   RZN1_RTC_CTL1_1SE BIT(3)
 #define   RZN1_RTC_CTL1_ALME BIT(4)
 
 #define RZN1_RTC_CTL2 0x08
@@ -58,6 +60,13 @@
 struct rzn1_rtc {
 	struct rtc_device *rtcdev;
 	void __iomem *base;
+	/*
+	 * Protects access to RZN1_RTC_CTL1 reg. rtc_lock with threaded_irqs
+	 * would introduce race conditions when switching interrupts because
+	 * of potential sleeps
+	 */
+	spinlock_t ctl1_access_lock;
+	struct rtc_time tm_alarm;
 };
 
 static void rzn1_rtc_get_time_snapshot(struct rzn1_rtc *rtc, struct rtc_time *tm)
@@ -135,8 +144,38 @@ static int rzn1_rtc_set_time(struct device *dev, struct rtc_time *tm)
 static irqreturn_t rzn1_rtc_alarm_irq(int irq, void *dev_id)
 {
 	struct rzn1_rtc *rtc = dev_id;
+	u32 ctl1, set_irq_bits = 0;
+
+	if (rtc->tm_alarm.tm_sec == 0)
+		rtc_update_irq(rtc->rtcdev, 1, RTC_AF | RTC_IRQF);
+	else
+		/* Switch to 1s interrupts */
+		set_irq_bits = RZN1_RTC_CTL1_1SE;
 
-	rtc_update_irq(rtc->rtcdev, 1, RTC_AF | RTC_IRQF);
+	guard(spinlock)(&rtc->ctl1_access_lock);
+
+	ctl1 = readl(rtc->base + RZN1_RTC_CTL1);
+	ctl1 &= ~RZN1_RTC_CTL1_ALME;
+	ctl1 |= set_irq_bits;
+	writel(ctl1, rtc->base + RZN1_RTC_CTL1);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t rzn1_rtc_1s_irq(int irq, void *dev_id)
+{
+	struct rzn1_rtc *rtc = dev_id;
+	u32 ctl1;
+
+	if (readl(rtc->base + RZN1_RTC_SECC) == bin2bcd(rtc->tm_alarm.tm_sec)) {
+		guard(spinlock)(&rtc->ctl1_access_lock);
+
+		ctl1 = readl(rtc->base + RZN1_RTC_CTL1);
+		ctl1 &= ~RZN1_RTC_CTL1_1SE;
+		writel(ctl1, rtc->base + RZN1_RTC_CTL1);
+
+		rtc_update_irq(rtc->rtcdev, 1, RTC_AF | RTC_IRQF);
+	}
 
 	return IRQ_HANDLED;
 }
@@ -144,14 +183,38 @@ static irqreturn_t rzn1_rtc_alarm_irq(int irq, void *dev_id)
 static int rzn1_rtc_alarm_irq_enable(struct device *dev, unsigned int enable)
 {
 	struct rzn1_rtc *rtc = dev_get_drvdata(dev);
-	u32 ctl1 = readl(rtc->base + RZN1_RTC_CTL1);
+	struct rtc_time *tm = &rtc->tm_alarm, tm_now;
+	u32 ctl1;
+	int ret;
 
-	if (enable)
-		ctl1 |= RZN1_RTC_CTL1_ALME;
-	else
-		ctl1 &= ~RZN1_RTC_CTL1_ALME;
+	guard(spinlock_irqsave)(&rtc->ctl1_access_lock);
 
-	writel(ctl1, rtc->base + RZN1_RTC_CTL1);
+	ctl1 = readl(rtc->base + RZN1_RTC_CTL1);
+
+	if (enable) {
+		/*
+		 * Use alarm interrupt if alarm time is at least a minute away
+		 * or less than a minute but in the next minute. Otherwise use
+		 * 1 second interrupt to wait for the proper second
+		 */
+		do {
+			ctl1 &= ~(RZN1_RTC_CTL1_ALME | RZN1_RTC_CTL1_1SE);
+
+			ret = rzn1_rtc_read_time(dev, &tm_now);
+			if (ret)
+				return ret;
+
+			if (rtc_tm_sub(tm, &tm_now) > 59 || tm->tm_min != tm_now.tm_min)
+				ctl1 |= RZN1_RTC_CTL1_ALME;
+			else
+				ctl1 |= RZN1_RTC_CTL1_1SE;
+
+			writel(ctl1, rtc->base + RZN1_RTC_CTL1);
+		} while (readl(rtc->base + RZN1_RTC_SECC) != bin2bcd(tm_now.tm_sec));
+	} else {
+		ctl1 &= ~(RZN1_RTC_CTL1_ALME | RZN1_RTC_CTL1_1SE);
+		writel(ctl1, rtc->base + RZN1_RTC_CTL1);
+	}
 
 	return 0;
 }
@@ -216,6 +279,8 @@ static int rzn1_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	writel(bin2bcd(tm->tm_hour), rtc->base + RZN1_RTC_ALH);
 	writel(BIT(wday), rtc->base + RZN1_RTC_ALW);
 
+	rtc->tm_alarm = alrm->time;
+
 	rzn1_rtc_alarm_irq_enable(dev, alrm->enabled);
 
 	return 0;
@@ -304,7 +369,7 @@ static const struct rtc_class_ops rzn1_rtc_ops = {
 static int rzn1_rtc_probe(struct platform_device *pdev)
 {
 	struct rzn1_rtc *rtc;
-	int alarm_irq;
+	int irq;
 	int ret;
 
 	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
@@ -317,9 +382,9 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	if (IS_ERR(rtc->base))
 		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->base), "Missing reg\n");
 
-	alarm_irq = platform_get_irq(pdev, 0);
-	if (alarm_irq < 0)
-		return alarm_irq;
+	irq = platform_get_irq_byname(pdev, "alarm");
+	if (irq < 0)
+		return irq;
 
 	rtc->rtcdev = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(rtc->rtcdev))
@@ -329,8 +394,6 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	rtc->rtcdev->range_max = RTC_TIMESTAMP_END_2099;
 	rtc->rtcdev->alarm_offset_max = 7 * 86400;
 	rtc->rtcdev->ops = &rzn1_rtc_ops;
-	set_bit(RTC_FEATURE_ALARM_RES_MINUTE, rtc->rtcdev->features);
-	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->rtcdev->features);
 
 	ret = devm_pm_runtime_enable(&pdev->dev);
 	if (ret < 0)
@@ -349,13 +412,24 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	/* Disable all interrupts */
 	writel(0, rtc->base + RZN1_RTC_CTL1);
 
-	ret = devm_request_irq(&pdev->dev, alarm_irq, rzn1_rtc_alarm_irq, 0,
-			       dev_name(&pdev->dev), rtc);
+	spin_lock_init(&rtc->ctl1_access_lock);
+
+	ret = devm_request_irq(&pdev->dev, irq, rzn1_rtc_alarm_irq, 0, "RZN1 RTC Alarm", rtc);
 	if (ret) {
-		dev_err(&pdev->dev, "RTC timer interrupt not available\n");
+		dev_err(&pdev->dev, "RTC alarm interrupt not available\n");
 		goto dis_runtime_pm;
 	}
 
+	irq = platform_get_irq_byname_optional(pdev, "pps");
+	if (irq >= 0)
+		ret = devm_request_irq(&pdev->dev, irq, rzn1_rtc_1s_irq, 0, "RZN1 RTC 1s", rtc);
+
+	if (irq < 0 || ret) {
+		set_bit(RTC_FEATURE_ALARM_RES_MINUTE, rtc->rtcdev->features);
+		clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->rtcdev->features);
+		dev_warn(&pdev->dev, "RTC pps interrupt not available. Alarm has only minute accuracy\n");
+	}
+
 	ret = devm_rtc_register_device(rtc->rtcdev);
 	if (ret)
 		goto dis_runtime_pm;
-- 
2.45.2


