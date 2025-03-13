Return-Path: <linux-rtc+bounces-3478-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E9CA5F0CF
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Mar 2025 11:26:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 35E0F7A8E7D
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Mar 2025 10:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DD79264630;
	Thu, 13 Mar 2025 10:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="PhAJrBRf"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEBD265610
	for <linux-rtc@vger.kernel.org>; Thu, 13 Mar 2025 10:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741861562; cv=none; b=Wg71HgobpKLaGUh0q6grqnW6BhM2gVc7SgRCQoTQs9Md+io2ODWBdtb8adJeIbDqtfXizfI9czFhLlh+gHo8NEBQkFB0eQ1oa3I01eyZd+dpN2vLMNb++WFTNzP9wFXAV8eaFB0Mx1ovx2NNN6NTg+Vxowd8JsacS8LDqwKwJQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741861562; c=relaxed/simple;
	bh=McZ+EMZ3bjWtIgMnSUyKoo8I/VqksNlhlxbwxYA3n8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M1vQBKfjUh0PbA6WhK8qo5ksY/ofXdvvqMYavC5xkqMqZI9axjD6wfAzlTOEfOldKRcwEkMGI6LRRxTmbZCxsd9gyj7bajNbLrUT+Ke4Fxa1M6SGLORswyf3oY3OLW1rVV5soD0UStr4vaD3s1QOo4493fQD6kGh11L46njAr3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=PhAJrBRf; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=ocs7d9nu5dnZ3q1oxJblUpnhIWUAcaYe5A9CXraTIG0=; b=PhAJrB
	RfMB0yNpCD4F7cR34KsOKv4vVfV8Egc1R/w3WEIcx1mCvjtLIF+QBCkfTFpMWQSS
	NtGXmAf2AvV6RcAHtncZxXHOXcSNRZz97zioecNfMEIC1/cgrQ2HVB0/M4Bw8Q+k
	3CksI6+ATaHYXv5Sx4Zx3dhqA3blAwe4jvqfagcoyyAVFNdpxISgPhD2ofsKElhw
	/LS2WEmAjcRFOW1hywqJ2LTuLaGF6ajWFVnMH93vKtOoXfcwMICXJFYekTXHarpE
	jN9iuj//ap5FoUY69OB+ukEuLnezjrI4BlSyCiSSZ+nlEU1Uf/8vPYPr2K1YBtsc
	bUVp1uVjSS7W0CrQ==
Received: (qmail 1574818 invoked from network); 13 Mar 2025 11:25:54 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Mar 2025 11:25:54 +0100
X-UD-Smtp-Session: l3s3148p1@LhY3vzYwMqQgAwDPXyTHAJp038nK7dx+
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-rtc@vger.kernel.org
Subject: [RFC PATCH 4/4] WIP rtc: rzn1: add driver support for R-Car Gen5
Date: Thu, 13 Mar 2025 11:25:45 +0100
Message-ID: <20250313102546.27335-5-wsa+renesas@sang-engineering.com>
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

This is not for upstream yet. This is a prototype how R-Car Gen5 can be
integrated into this driver. Bindings need to be updated so that they
enforce two input clocks. This patch is only for discussion.

Not-yet-signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/rtc/rtc-rzn1.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index f8c9308817ae..313e70070904 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -17,6 +17,7 @@
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/rtc.h>
@@ -71,6 +72,10 @@ struct rzn1_rtc {
 	struct rtc_time tm_alarm;
 };
 
+struct rzn1_rtc_conf {
+	unsigned int force_scmp:1;
+};
+
 static void rzn1_rtc_get_time_snapshot(struct rzn1_rtc *rtc, struct rtc_time *tm)
 {
 	u32 val;
@@ -369,6 +374,7 @@ static struct rtc_class_ops rzn1_rtc_ops = {
 static int rzn1_rtc_probe(struct platform_device *pdev)
 {
 	struct rzn1_rtc *rtc;
+	const struct rzn1_rtc_conf *config;
 	struct clk *xtal;
 	unsigned long rate;
 	u32 use_scmp = 0;
@@ -405,7 +411,12 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	/* Only switch to scmp if we have an xtal clock with a valid rate and != 32768 */
+	config = of_device_get_match_data(&pdev->dev);
+
+	/*
+	 * Only switch to scmp if we have an xtal clock with a valid rate plus
+	 * either not equal to 32768 or if it is forced in the config
+	 */
 	xtal = devm_clk_get_optional(&pdev->dev, "xtal");
 	if (IS_ERR(xtal)) {
 		ret = PTR_ERR(xtal);
@@ -418,8 +429,14 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 			goto dis_runtime_pm;
 		}
 
-		if (rate != 32768)
+		if (rate != 32768 || config->force_scmp)
 			use_scmp = RZN1_RTC_CTL0_SLSB_SCMP;
+	} else {
+		/* We need xtal if force_scmp is set */
+		if (config->force_scmp) {
+			ret = -ENOENT;
+			goto dis_runtime_pm;
+		}
 	}
 
 	if (use_scmp) {
@@ -474,8 +491,17 @@ static void rzn1_rtc_remove(struct platform_device *pdev)
 	pm_runtime_put(&pdev->dev);
 }
 
+static const struct rzn1_rtc_conf rzn1_rtc_conf = {
+	.force_scmp = 0,
+};
+
+static const struct rzn1_rtc_conf rzn1_rtc_conf_gen5 = {
+	.force_scmp = 1,
+};
+
 static const struct of_device_id rzn1_rtc_of_match[] = {
-	{ .compatible	= "renesas,rzn1-rtc" },
+	{ .compatible = "renesas,rzn1-rtc", .data = &rzn1_rtc_conf },
+	{ .compatible = "renesas,rcar-gen5-rtc", .data = &rzn1_rtc_conf_gen5 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, rzn1_rtc_of_match);
-- 
2.47.2


