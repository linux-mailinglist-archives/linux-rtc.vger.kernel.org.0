Return-Path: <linux-rtc+bounces-4138-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC876AC25F1
	for <lists+linux-rtc@lfdr.de>; Fri, 23 May 2025 17:06:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BFC397BCDFB
	for <lists+linux-rtc@lfdr.de>; Fri, 23 May 2025 15:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE04A2957A1;
	Fri, 23 May 2025 15:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="eRvN1wXa"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E3C2957CD
	for <linux-rtc@vger.kernel.org>; Fri, 23 May 2025 15:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748012764; cv=none; b=I3l1jqt/lqSVYNmxnZe/pnfE/Q+uCEgxVoI8/FSgiFl96JsaoZQjozds5ICSRCZalbN2R3ER8/afanX4dz7HUO2tPU6mA0VnzKygBp77AkNZnMUh05JvAMzimSdh0e70Ig6VPhyhTyP2aACKwD/W4KAiaWuqRylQ1yGIYVh/Gko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748012764; c=relaxed/simple;
	bh=SLnohmIUfW8m2aMD83EgpwPGGc3qtsP4KoHhsCPewb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DXn9tiUarJq9PKQSQDxozTp0ETcHRUZ2Cl0tCBHogrpt1o16f4+7ynMTVO5RxOr/wH9YygENkBJpV5BmUQJumA/g7VDVgdDX4rwLlGUUm0CytQFxIo53LbxucaIkOG6g32oxzSCQ4b1mBa7GCZQYAdgPoCM5PQn0LC4xeFjTn9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=eRvN1wXa; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=ffYBTA6OEd7qi4BoEMBhM7U3VJGXanMZigO/kCkMaz4=; b=eRvN1w
	Xa+bjr3LE/FbEveKFIF61l2KYNmtdmPYRPPOHWg63GyFam2bZn952FHExB8tc05G
	UHf/7ch5vK4eR0GtyPOhLAJwXvpPYOEYcn6k138WGNgQxEQyaKNG1UiIflIZ+MbR
	LsTny6xD93M27GIK5Ah5028sB8anQsgi47ykMtaSmaHhX+F+/zhM2kXnxtjVUDWn
	IAdsaP0ApJzNUl5OXyeHQbLt96sMXZvhOmDB4r2l3COY3jLBa81NSixSSzxD256L
	SNUyq8ZOR4gY3/N571bbH/0lzg50mUm2IOpKlSOvFIZESRyR4egKUJwGUcHFXYnK
	IY9qT2ylsAm8+gmQ==
Received: (qmail 4083042 invoked from network); 23 May 2025 17:05:59 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 May 2025 17:05:59 +0200
X-UD-Smtp-Session: l3s3148p1@8PCT7841vWFtKPAL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: [PATCH v2 3/3] rtc: rzn1: support input frequencies other than 32768Hz
Date: Fri, 23 May 2025 17:05:40 +0200
Message-ID: <20250523150541.8390-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250523150541.8390-1-wsa+renesas@sang-engineering.com>
References: <20250523150541.8390-1-wsa+renesas@sang-engineering.com>
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/rtc/rtc-rzn1.c | 51 +++++++++++++++++++++++++++++++-----------
 1 file changed, 38 insertions(+), 13 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 7777df1e3426..33fd20f37588 100644
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
+	u32 val, scmp_val = 0;
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
+			scmp_val = RZN1_RTC_CTL0_SLSB_SCMP;
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
+	/* Set desired modes while leaving the controller disabled */
+	writel(RZN1_RTC_CTL0_AMPM | scmp_val, rtc->base + RZN1_RTC_CTL0);
+
+	if (scmp_val) {
+		writel(rate - 1, rtc->base + RZN1_RTC_SCMP);
+	} else {
+		rzn1_rtc_ops.read_offset = rzn1_rtc_read_offset;
+		rzn1_rtc_ops.set_offset = rzn1_rtc_set_offset;
+	}
+
+	/* Enable controller finally */
+	writel(RZN1_RTC_CTL0_CE | RZN1_RTC_CTL0_AMPM | scmp_val, rtc->base + RZN1_RTC_CTL0);
 
 	/* Disable all interrupts */
 	writel(0, rtc->base + RZN1_RTC_CTL1);
-- 
2.47.2


