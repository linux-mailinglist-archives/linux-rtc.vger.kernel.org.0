Return-Path: <linux-rtc+bounces-5814-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8O1REcO0cGndZAAAu9opvQ
	(envelope-from <linux-rtc+bounces-5814-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Jan 2026 12:13:07 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A90DB55C7E
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Jan 2026 12:13:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B7A478CD1EA
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Jan 2026 11:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 181663ED12C;
	Wed, 21 Jan 2026 11:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="Oh4tjiMt"
X-Original-To: linux-rtc@vger.kernel.org
Received: from sender4-op-o16.zoho.com (sender4-op-o16.zoho.com [136.143.188.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5F33C00B4;
	Wed, 21 Jan 2026 11:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768993447; cv=pass; b=rOEBJTsCE2xBUb/30oZsR2EkgX5p/j7V0u5Ma7UI/1nx2y2W27c1p3RFi7NF/FiMSBkrJs4Q7opt5DTyw7iPcbpan2zMpcwH9lPwyC4B5kVGcXcVZGKHR4nbGZ5t+BrxIzJTBRjMYziqgpR0KnEWY0mIHiRHQCfrKLwTOfe93mQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768993447; c=relaxed/simple;
	bh=XrhXYqswxIwIvROOe902KdWGRTTB1HlGHLw5IfuBL9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OTIp4/irsHnnJiTyG3ihZi2VVG9vT2MgBWcNDMJ1qr8bhoxt5EVjoqwidqMPdJ2cXNakjcs7bY+NAE7uKZ8ysN+ayCE7pCA5GjrefBgQmDlVQpirHQIKAv4Rc1zdfNN8G5ompxOXKwZUXH2jDLmkFynj8I/3huB8nPHk8ydlnM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=Oh4tjiMt; arc=pass smtp.client-ip=136.143.188.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
ARC-Seal: i=1; a=rsa-sha256; t=1768993427; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=X8xcatVEFgI3WgDr7sY8+YugmN0FU4LiK2KvwBNEVyG2OAi4OrVm0tE0EHoyaRPvVgwiw/m/p2sM+DVnwIslpO5nkODrPlPP92zQRaxRLIwoEY+iK1Ixsh5X7ss7ZlDyuoG4QE9MeGKDFdhzouHN14MdTBE8Wgg9Nc2mTDzRSug=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768993427; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PvHOvd99B0k7tzuarHMyRWVeaES9UJpKYnUM8t+KeLA=; 
	b=Y7ob6IWjXSLFUCkPGic3DXfrinTPsDGtrNc5AmT6MYtJfBzn4qIcfE/CTAyY6p1I724lASU8hjDYStPwF2vHssa3CSJ+m+aJZcJZtTJ5Z3zvKjngJP8WWg/vnSE4YQBmSATSvYoooCJlJpUvo5bIQTLK0oUsTpU96UaQRkntn+Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768993427;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=PvHOvd99B0k7tzuarHMyRWVeaES9UJpKYnUM8t+KeLA=;
	b=Oh4tjiMt3dNTcDzTwbnYI9QL1WdjCyMlXmKtB638z1RwwNpCimLkDP4OgSPEw5BT
	ABdLLK9PdSraqyZPg91BMyrQ9ebhXYfk6odUcLmqS7f9gpRyeddwi789yL2ZScIBs0o
	JXXBC2xFP5EA1WijPVL5B13HiezrI1dWu7fy9+3U=
Received: by mx.zohomail.com with SMTPS id 1768993424817370.07718841329984;
	Wed, 21 Jan 2026 03:03:44 -0800 (PST)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Wed, 21 Jan 2026 18:59:08 +0800
Subject: [PATCH 2/7] rtc: sun6i: Bind internal CCU via auxiliary bus
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-a733-rtc-v1-2-d359437f23a7@pigmoral.tech>
References: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech>
In-Reply-To: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768993386; l=6782;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=XrhXYqswxIwIvROOe902KdWGRTTB1HlGHLw5IfuBL9M=;
 b=79FxhVb8WHnaGsdnfzjPoMgq5oPS7LsgpMPXplBqQ4erQG4lEvglmFrRtYZqZMkgcMopkxuj9
 6hXDNVB3STDDGA/6p1WI5oyKVyQhQxGuNx+p1lMrafR6s3V8TR6GSs/
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=3vU0qIPJAH8blXmLyqBhKx+nLOjcLwwYhZXelEpw7h4=
X-ZohoMailClient: External
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[pigmoral.tech:s=zmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[baylibre.com,kernel.org,gmail.com,sholland.org,bootlin.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[pigmoral.tech];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-5814-lists,linux-rtc=lfdr.de];
	DKIM_TRACE(0.00)[pigmoral.tech:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[junhui.liu@pigmoral.tech,linux-rtc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pigmoral.tech:email,pigmoral.tech:dkim,pigmoral.tech:mid,sholland.org:email,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: A90DB55C7E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The sun6i RTC block contains an internal clock control unit (CCU).
Currently, the RTC driver binds this CCU part by directly calling a
probe function exported by the clock framework. This creates a tight
coupling between the RTC and clock drivers and makes it difficult to
add internal CCU support for new SoCs.

Switch to use the auxiliary bus for binding the internal CCU to
decouple the drivers.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 29 +++++++++++++++++++++++------
 drivers/rtc/rtc-sun6i.c              | 31 +++++++++++++++++++++++--------
 include/linux/clk/sunxi-ng.h         |  2 --
 3 files changed, 46 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
index f6bfeba009e8..3088f247d927 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
@@ -3,6 +3,7 @@
 // Copyright (c) 2021 Samuel Holland <samuel@sholland.org>
 //
 
+#include <linux/auxiliary_bus.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/device.h>
@@ -11,8 +12,6 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 
-#include <linux/clk/sunxi-ng.h>
-
 #include "ccu_common.h"
 
 #include "ccu_div.h"
@@ -44,6 +43,8 @@
 #define DCXO_CTRL_REG			0x160
 #define DCXO_CTRL_CLK16M_RC_EN		BIT(0)
 
+#define SUN6I_RTC_AUX_ID(_name)		"rtc_sun6i." #_name
+
 struct sun6i_rtc_match_data {
 	bool				have_ext_osc32k		: 1;
 	bool				have_iosc_calibration	: 1;
@@ -349,14 +350,18 @@ static const struct of_device_id sun6i_rtc_ccu_match[] = {
 };
 MODULE_DEVICE_TABLE(of, sun6i_rtc_ccu_match);
 
-int sun6i_rtc_ccu_probe(struct device *dev, void __iomem *reg)
+static int sun6i_rtc_ccu_probe(struct auxiliary_device *adev,
+			       const struct auxiliary_device_id *id)
 {
 	const struct sun6i_rtc_match_data *data;
 	struct clk *ext_osc32k_clk = NULL;
 	const struct of_device_id *match;
+	struct device *dev = &adev->dev;
+	void __iomem *reg = dev->platform_data;
+	struct device *parent = dev->parent;
 
 	/* This driver is only used for newer variants of the hardware. */
-	match = of_match_device(sun6i_rtc_ccu_match, dev);
+	match = of_match_device(sun6i_rtc_ccu_match, parent);
 	if (!match)
 		return 0;
 
@@ -367,9 +372,9 @@ int sun6i_rtc_ccu_probe(struct device *dev, void __iomem *reg)
 		const char *fw_name;
 
 		/* ext-osc32k was the only input clock in the old binding. */
-		fw_name = of_property_present(dev->of_node, "clock-names")
+		fw_name = of_property_present(parent->of_node, "clock-names")
 			? "ext-osc32k" : NULL;
-		ext_osc32k_clk = devm_clk_get_optional(dev, fw_name);
+		ext_osc32k_clk = devm_clk_get_optional(parent, fw_name);
 		if (IS_ERR(ext_osc32k_clk))
 			return PTR_ERR(ext_osc32k_clk);
 	}
@@ -392,6 +397,18 @@ int sun6i_rtc_ccu_probe(struct device *dev, void __iomem *reg)
 	return devm_sunxi_ccu_probe(dev, reg, &sun6i_rtc_ccu_desc);
 }
 
+static const struct auxiliary_device_id sun6i_ccu_rtc_ids[] = {
+	{ .name = SUN6I_RTC_AUX_ID(sun6i) },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(auxiliary, sun6i_ccu_rtc_ids);
+
+static struct auxiliary_driver sun6i_ccu_rtc_driver = {
+	.probe = sun6i_rtc_ccu_probe,
+	.id_table = sun6i_ccu_rtc_ids,
+};
+module_auxiliary_driver(sun6i_ccu_rtc_driver);
+
 MODULE_IMPORT_NS("SUNXI_CCU");
 MODULE_DESCRIPTION("Support for the Allwinner H616/R329 RTC CCU");
 MODULE_LICENSE("GPL");
diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index e5e6013d080e..b4489e0a09ce 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -11,9 +11,9 @@
  * Copyright (c) 2013, Carlo Caione <carlo.caione@gmail.com>
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
-#include <linux/clk/sunxi-ng.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/fs.h>
@@ -141,6 +141,11 @@ struct sun6i_rtc_clk_data {
 
 #define RTC_LINEAR_DAY	BIT(0)
 
+struct sun6i_rtc_match_data {
+	const char *adev_name;
+	unsigned long flags;
+};
+
 struct sun6i_rtc_dev {
 	struct rtc_device *rtc;
 	const struct sun6i_rtc_clk_data *data;
@@ -745,8 +750,10 @@ static void sun6i_rtc_bus_clk_cleanup(void *data)
 
 static int sun6i_rtc_probe(struct platform_device *pdev)
 {
+	const struct sun6i_rtc_match_data *data;
 	struct sun6i_rtc_dev *chip = sun6i_rtc;
 	struct device *dev = &pdev->dev;
+	struct auxiliary_device *adev;
 	struct clk *bus_clk;
 	int ret;
 
@@ -765,6 +772,8 @@ static int sun6i_rtc_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	data = of_device_get_match_data(&pdev->dev);
+
 	if (!chip) {
 		chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
 		if (!chip)
@@ -776,16 +785,17 @@ static int sun6i_rtc_probe(struct platform_device *pdev)
 		if (IS_ERR(chip->base))
 			return PTR_ERR(chip->base);
 
-		if (IS_REACHABLE(CONFIG_SUN6I_RTC_CCU)) {
-			ret = sun6i_rtc_ccu_probe(dev, chip->base);
-			if (ret)
-				return ret;
+		if (data && data->adev_name) {
+			adev = devm_auxiliary_device_create(dev, data->adev_name, chip->base);
+			if (!adev)
+				return -ENODEV;
 		}
 	}
 
 	platform_set_drvdata(pdev, chip);
 
-	chip->flags = (unsigned long)of_device_get_match_data(&pdev->dev);
+	if (data)
+		chip->flags = data->flags;
 
 	chip->irq = platform_get_irq(pdev, 0);
 	if (chip->irq < 0)
@@ -850,6 +860,11 @@ static int sun6i_rtc_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct sun6i_rtc_match_data sun6i_rtc_match_data = {
+	.adev_name = "sun6i",
+	.flags = RTC_LINEAR_DAY,
+};
+
 /*
  * As far as RTC functionality goes, all models are the same. The
  * datasheets claim that different models have different number of
@@ -865,9 +880,9 @@ static const struct of_device_id sun6i_rtc_dt_ids[] = {
 	{ .compatible = "allwinner,sun50i-h5-rtc" },
 	{ .compatible = "allwinner,sun50i-h6-rtc" },
 	{ .compatible = "allwinner,sun50i-h616-rtc",
-		.data = (void *)RTC_LINEAR_DAY },
+		.data = &sun6i_rtc_match_data },
 	{ .compatible = "allwinner,sun50i-r329-rtc",
-		.data = (void *)RTC_LINEAR_DAY },
+		.data = &sun6i_rtc_match_data },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, sun6i_rtc_dt_ids);
diff --git a/include/linux/clk/sunxi-ng.h b/include/linux/clk/sunxi-ng.h
index 57c8ec44ab4e..cf32123b39f5 100644
--- a/include/linux/clk/sunxi-ng.h
+++ b/include/linux/clk/sunxi-ng.h
@@ -9,6 +9,4 @@
 int sunxi_ccu_set_mmc_timing_mode(struct clk *clk, bool new_mode);
 int sunxi_ccu_get_mmc_timing_mode(struct clk *clk);
 
-int sun6i_rtc_ccu_probe(struct device *dev, void __iomem *reg);
-
 #endif

-- 
2.52.0


