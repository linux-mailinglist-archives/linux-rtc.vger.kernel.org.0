Return-Path: <linux-rtc+bounces-3476-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 100BEA5F0C6
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Mar 2025 11:26:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 06E117A8A1D
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Mar 2025 10:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7273266184;
	Thu, 13 Mar 2025 10:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Y/9Eob90"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C885224EF69
	for <linux-rtc@vger.kernel.org>; Thu, 13 Mar 2025 10:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741861558; cv=none; b=L+Jf0aM23lykmsnxvd8QqAch/Ida/7Gh8x28FUnKuB/AtKNeL0mNjkZ9+//ruRXbxDb4zO0uCsrEbDZ/KLF9+G3bO8zEO4LWDnPFqP43FBBrGu8LlzTW4J/r6Srgh2hjjhPvFHICoVTkzifZlscteYSTSrqHhY9+F/tAvB6KjrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741861558; c=relaxed/simple;
	bh=BcuejLNefAxncuo6S8vSmQ9BBKT6ZKvurpXfyud+PnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HsDg2Rr9sFQZ1EU6LImBhOpY5XMOruK2Uf2MgGdUDbwJYqz8tJjCiEzPgePr7lJyFXOtOsYgAJZW/gofZ6j/ieY+KnPWOQIaTpUXwidggEZrSk4bKqEoyK1SCb9hOUUexVdqb/bEDxSCROc7Tk3CWfqsqfps6mX54iTR8do2pbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Y/9Eob90; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=xKR4pR20ZB/9h07gFzI4J+aXKVLxDR3NCiKjedWj45w=; b=Y/9Eob
	90c3U12GljrlZ64Xgic/faFuI5YuY8DJ39+C42INtg7NeQr7nWhBle8p3EsnniD+
	P+2WdFaEujkwokQfrulE8FBBC9wTTiBtzjav/U9AUtg9jzoLAwoxYXELZoH3tAW6
	k6qBEeN4TGziHDmPeQOcTb1Ii3xdNa17JAIE/o8QtEY178NRidJqXjS6NIuPV9t+
	hbxVapvUSFdLhBe9bcdYl8fENR0c4LHT6DKvaJE8eFWC2krKbPj/pUeju2fjWA+A
	JaJcuV9t1dJ093S98s5VKTefmHfbp2a9Oh5QxfV/qeINbKBilcKU28MW26+4BaC0
	KdY8dmDXC67/1ByQ==
Received: (qmail 1574789 invoked from network); 13 Mar 2025 11:25:54 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Mar 2025 11:25:54 +0100
X-UD-Smtp-Session: l3s3148p1@4jgrvzYwOr0gAwDPXyTHAJp038nK7dx+
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: [RFC PATCH 3/4] rtc: rzn1: support input frequencies other than 32768Hz
Date: Thu, 13 Mar 2025 11:25:44 +0100
Message-ID: <20250313102546.27335-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250313102546.27335-1-wsa+renesas@sang-engineering.com>
References: <20250313102546.27335-1-wsa+renesas@sang-engineering.com>
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
 drivers/rtc/rtc-rzn1.c | 43 ++++++++++++++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 10 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index e3733534d409..f8c9308817ae 100644
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
 #define   RZN1_RTC_CTL0_CE BIT(7)
@@ -49,6 +49,8 @@
 #define   RZN1_RTC_SUBU_DEV BIT(7)
 #define   RZN1_RTC_SUBU_DECR BIT(6)
 
+#define RZN1_RTC_SCMP 0x3c
+
 #define RZN1_RTC_ALM 0x40
 #define RZN1_RTC_ALH 0x44
 #define RZN1_RTC_ALW 0x48
@@ -356,19 +358,20 @@ static int rzn1_rtc_set_offset(struct device *dev, long offset)
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
+	struct clk *xtal;
+	unsigned long rate;
+	u32 use_scmp = 0;
 	int irq;
 	int ret;
 
@@ -402,12 +405,32 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	/*
-	 * Ensure the clock counter is enabled.
-	 * Set 24-hour mode and possible oscillator offset compensation in SUBU mode.
-	 */
-	writel(RZN1_RTC_CTL0_CE | RZN1_RTC_CTL0_AMPM | RZN1_RTC_CTL0_SLSB_SUBU,
-	       rtc->base + RZN1_RTC_CTL0);
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
+	if (use_scmp) {
+		writel(rate - 1, rtc->base + RZN1_RTC_SCMP);
+	} else {
+		rzn1_rtc_ops.read_offset = rzn1_rtc_read_offset;
+		rzn1_rtc_ops.set_offset = rzn1_rtc_set_offset;
+	}
+
+	/* Ensure clock counter is enabled. Set 24-hour mode and SUBU or SCMP mode */
+	writel(RZN1_RTC_CTL0_CE | RZN1_RTC_CTL0_AMPM | use_scmp, rtc->base + RZN1_RTC_CTL0);
 
 	/* Disable all interrupts */
 	writel(0, rtc->base + RZN1_RTC_CTL1);
-- 
2.47.2


