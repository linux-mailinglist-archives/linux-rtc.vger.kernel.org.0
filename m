Return-Path: <linux-rtc+bounces-3556-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA62A68A8E
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Mar 2025 12:05:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC0613BF9D0
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Mar 2025 11:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F818253F17;
	Wed, 19 Mar 2025 11:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Xwz3EoJd"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EED251797
	for <linux-rtc@vger.kernel.org>; Wed, 19 Mar 2025 11:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742382198; cv=none; b=f4iw2fYExqcLjZmdjSLU0nFWYQafSeLHUVGPRhJDjlLth0iyYrUD4svlGtLu6dygoC4p48K7kMfC+JCdI/mh8I2ojCEti+6sxA743i58BABfatG4DFcIQwhaRKRYNPrv5N4tibSMFqwfbNsPQe4LZNtMeorj5GV+av8vlYhGmI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742382198; c=relaxed/simple;
	bh=EGM2FZP7Zhcbi4zhfO5tysAJCQT95PnyWXQiDUAksIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=seLevxYwXKSyyJ8JkggNO61kZ8Tc1BSEgrVQwO72M2C0r+1ZeyIrwtPx6V7cLpt+3pU45ilJu75Avf496ZK43mLu1N7wyY0Zl4+hjQOzBCn9kk+O71zczyajoiwIM4IA5YNAar12ptA789Y1yvDienghShSl7EhLV3wxW7rVQ6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Xwz3EoJd; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=756xis8oO3h/yTcbaLuD6IPizh01Kfz9ozXiWofJ6TE=; b=Xwz3Eo
	Jdt8PrjfzO/ErFbHpGeNG8xrSPTDfs9J1h0EFLZ0rj/Q34gzbGa06yOAQ2e9V6AW
	Ioiyx/gMjTMslCueFtaX7/FNsAFEf19S5e/FsjJB0ervXyRPM+7FI7GS5cPiU253
	jZrAXJnRS2O6RURNe95rzVsAM3Cwy0AOPD8YBXXLR1LF+9ZDf+xzGxeEeJOqyG0M
	IeZdlYQn/ZcPZYGqmCOCIuZO0ViPoIoYZL+NOkNWTnQRY7lVB9oFVJoPZyJj3jfA
	UxHBGllTRSKGTJ0Zusw8vqEFb4wYL1fn/zFoFmXP/I8gLiOZLMvfAIow7Q6NZyVl
	2mP0HWZxlC2i1U+w==
Received: (qmail 81885 invoked from network); 19 Mar 2025 12:03:14 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Mar 2025 12:03:14 +0100
X-UD-Smtp-Session: l3s3148p1@8Ry4968wBL0gAwDPXyTHAJp038nK7dx+
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: [PATCH 3/3] rtc: rzn1: support input frequencies other than 32768Hz
Date: Wed, 19 Mar 2025 12:03:04 +0100
Message-ID: <20250319110305.19687-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250319110305.19687-1-wsa+renesas@sang-engineering.com>
References: <20250319110305.19687-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When using the SCMP mode instead of SUBU, this RTC can also support
other input frequencies than 32768Hz. Also, upcoming SoCs will only
support SCMP.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/rtc/rtc-rzn1.c | 51 +++++++++++++++++++++++++++++++-----------
 1 file changed, 38 insertions(+), 13 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 7777df1e3426..47ab62d5380e 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -12,6 +12,7 @@
  */
 
 #include <linux/bcd.h>
+#include <linux/clk.h>
 #include <linux/init.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
@@ -22,7 +23,6 @@
 #include <linux/spinlock.h>
 
 #define RZN1_RTC_CTL0 0x00
-#define   RZN1_RTC_CTL0_SLSB_SUBU 0
 #define   RZN1_RTC_CTL0_SLSB_SCMP BIT(4)
 #define   RZN1_RTC_CTL0_AMPM BIT(5)
 #define   RZN1_RTC_CTL0_CEST BIT(6)
@@ -50,6 +50,8 @@
 #define   RZN1_RTC_SUBU_DEV BIT(7)
 #define   RZN1_RTC_SUBU_DECR BIT(6)
 
+#define RZN1_RTC_SCMP 0x3c
+
 #define RZN1_RTC_ALM 0x40
 #define RZN1_RTC_ALH 0x44
 #define RZN1_RTC_ALW 0x48
@@ -357,22 +359,21 @@ static int rzn1_rtc_set_offset(struct device *dev, long offset)
 	return 0;
 }
 
-static const struct rtc_class_ops rzn1_rtc_ops = {
+static struct rtc_class_ops rzn1_rtc_ops = {
 	.read_time = rzn1_rtc_read_time,
 	.set_time = rzn1_rtc_set_time,
 	.read_alarm = rzn1_rtc_read_alarm,
 	.set_alarm = rzn1_rtc_set_alarm,
 	.alarm_irq_enable = rzn1_rtc_alarm_irq_enable,
-	.read_offset = rzn1_rtc_read_offset,
-	.set_offset = rzn1_rtc_set_offset,
 };
 
 static int rzn1_rtc_probe(struct platform_device *pdev)
 {
 	struct rzn1_rtc *rtc;
-	u32 val;
-	int irq;
-	int ret;
+	u32 val, use_scmp = 0;
+	struct clk *xtal;
+	unsigned long rate;
+	int irq, ret;
 
 	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
 	if (!rtc)
@@ -404,10 +405,24 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	/*
-	 * Ensure the clock counter is enabled.
-	 * Set 24-hour mode and possible oscillator offset compensation in SUBU mode.
-	 */
+	/* Only switch to scmp if we have an xtal clock with a valid rate and != 32768 */
+	xtal = devm_clk_get_optional(&pdev->dev, "xtal");
+	if (IS_ERR(xtal)) {
+		ret = PTR_ERR(xtal);
+		goto dis_runtime_pm;
+	} else if (xtal) {
+		rate = clk_get_rate(xtal);
+
+		if (rate < 32000 || rate > BIT(22)) {
+			ret = -EOPNOTSUPP;
+			goto dis_runtime_pm;
+		}
+
+		if (rate != 32768)
+			use_scmp = RZN1_RTC_CTL0_SLSB_SCMP;
+	}
+
+	/* Disable controller during SUBU/SCMP setup */
 	val = readl(rtc->base + RZN1_RTC_CTL0) & ~RZN1_RTC_CTL0_CE;
 	writel(val, rtc->base + RZN1_RTC_CTL0);
 	/* Wait 2-4 32k clock cycles for the disabled controller */
@@ -416,8 +431,18 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	if (ret)
 		goto dis_runtime_pm;
 
-	writel(RZN1_RTC_CTL0_CE | RZN1_RTC_CTL0_AMPM | RZN1_RTC_CTL0_SLSB_SUBU,
-	       rtc->base + RZN1_RTC_CTL0);
+	/* Set desired modes leaving the controller disabled */
+	writel(RZN1_RTC_CTL0_AMPM | use_scmp, rtc->base + RZN1_RTC_CTL0);
+
+	if (use_scmp) {
+		writel(rate - 1, rtc->base + RZN1_RTC_SCMP);
+	} else {
+		rzn1_rtc_ops.read_offset = rzn1_rtc_read_offset;
+		rzn1_rtc_ops.set_offset = rzn1_rtc_set_offset;
+	}
+
+	/* Enable controller finally */
+	writel(RZN1_RTC_CTL0_CE | RZN1_RTC_CTL0_AMPM | use_scmp, rtc->base + RZN1_RTC_CTL0);
 
 	/* Disable all interrupts */
 	writel(0, rtc->base + RZN1_RTC_CTL1);
-- 
2.47.2


