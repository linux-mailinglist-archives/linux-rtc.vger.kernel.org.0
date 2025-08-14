Return-Path: <linux-rtc+bounces-4696-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEBFB26DCC
	for <lists+linux-rtc@lfdr.de>; Thu, 14 Aug 2025 19:37:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03C34587478
	for <lists+linux-rtc@lfdr.de>; Thu, 14 Aug 2025 17:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43F9E30BF56;
	Thu, 14 Aug 2025 17:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="NL7bZq5o"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433E3301484;
	Thu, 14 Aug 2025 17:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755193016; cv=none; b=ptcgRjfoy0/o60LvuajpbJTlQoF/pD8fZ1nLktc8sxbm+YXWQbWIN/cW/2ErAK3pZyQK94eKyNFb5vYQx3w/bwlZIqpnjLN+MlS9id6ETBIeiVzQjKNQzWUHHky7zuibBpw+AauvBRwEk+G4YgKdEO5VNK8KH/7wXr3UQkHRZ5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755193016; c=relaxed/simple;
	bh=YEBgWRvSy0LbhbOFTljc6gI9G89uEaL/dfXlK+/kdBk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AEVCxnBaxvr+52oZ22vfFMnE3HzRtK7h3VRTtoD6jPeaS9K8SFX31S+xyY0evjbSIytccIOyo6f1WFuqZz6yRgTXrhDQ1Aoxm3rNmIOwYD0DrpwZNBlzCoGVJImRFPy8SWE7+v2Gae5A7GGP0kjrCzJmqdp67T6nqA/FLOYlctA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=NL7bZq5o; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57EHan9T1982189;
	Thu, 14 Aug 2025 12:36:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755193009;
	bh=aAvGxz2X6v+ndhtn+DL2mHpjrKIETmYXz7PZm9rr7O8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=NL7bZq5oaGHJOCko4Q6wFYakWg9+6C00QmbC44l5oc7Ni4ujm8JWFSfEV0wIcdlMo
	 aB8wcL/rOzobCcq2Xb/9zS1bBwxIzTT4N5hz15xSm6WyhWN7BN150cCPS03aIureud
	 wNsOiVqZZCM0XnYQn6kzh31hezFsaRHN1+mzSbTo=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57EHanHo1867978
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 14 Aug 2025 12:36:49 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 14
 Aug 2025 12:36:49 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 14 Aug 2025 12:36:49 -0500
Received: from lelvem-mr05.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57EHamWc075711;
	Thu, 14 Aug 2025 12:36:48 -0500
From: Andrew Davis <afd@ti.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew Davis
	<afd@ti.com>
Subject: [PATCH 3/6] rtc: pcf2127: Remove use of i2c_match_id()
Date: Thu, 14 Aug 2025 12:36:44 -0500
Message-ID: <20250814173647.712768-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250814173647.712768-1-afd@ti.com>
References: <20250814173647.712768-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The function i2c_match_id() is used to fetch the matching ID from
the i2c_device_id table. This is often used to then retrieve the
matching driver_data. This can be done in one step with the helper
i2c_get_match_data().

This helper has a couple other benefits:
 * It doesn't need the i2c_device_id passed in so we do not need
   to have that forward declared, allowing us to remove those or
   move the i2c_device_id table down to its more natural spot
   with the other module info.
 * It also checks for device match data, which allows for OF and
   ACPI based probing. That means we do not have to manually check
   those first and can remove those checks.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/rtc/rtc-pcf2127.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 2e1ac0c42e932..22735a996e771 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -1432,10 +1432,10 @@ static const struct regmap_bus pcf2127_i2c_regmap = {
 static struct i2c_driver pcf2127_i2c_driver;
 
 static const struct i2c_device_id pcf2127_i2c_id[] = {
-	{ "pcf2127", PCF2127 },
-	{ "pcf2129", PCF2129 },
-	{ "pca2129", PCF2129 },
-	{ "pcf2131", PCF2131 },
+	{ "pcf2127", (kernel_ulong_t)&pcf21xx_cfg[PCF2127] },
+	{ "pcf2129", (kernel_ulong_t)&pcf21xx_cfg[PCF2129] },
+	{ "pca2129", (kernel_ulong_t)&pcf21xx_cfg[PCF2129] },
+	{ "pcf2131", (kernel_ulong_t)&pcf21xx_cfg[PCF2131] },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pcf2127_i2c_id);
@@ -1452,18 +1452,9 @@ static int pcf2127_i2c_probe(struct i2c_client *client)
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
 		return -ENODEV;
 
-	if (client->dev.of_node) {
-		variant = of_device_get_match_data(&client->dev);
-		if (!variant)
-			return -ENODEV;
-	} else {
-		enum pcf21xx_type type =
-			i2c_match_id(pcf2127_i2c_id, client)->driver_data;
-
-		if (type >= PCF21XX_LAST_ID)
-			return -ENODEV;
-		variant = &pcf21xx_cfg[type];
-	}
+	variant = i2c_get_match_data(client);
+	if (!variant)
+		return -ENODEV;
 
 	config.max_register = variant->max_register,
 
-- 
2.39.2


