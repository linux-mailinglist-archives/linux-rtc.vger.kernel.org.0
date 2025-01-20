Return-Path: <linux-rtc+bounces-2950-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D9EA169B0
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jan 2025 10:36:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 229221885C2B
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jan 2025 09:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B78B819DF60;
	Mon, 20 Jan 2025 09:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="ZUZjzwGO"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DD918FDC8
	for <linux-rtc@vger.kernel.org>; Mon, 20 Jan 2025 09:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.65.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737365767; cv=none; b=QjX7N1zRBsGl6Hebo9x30lEibUSrNPHlcZfYXkJ/FBxF0tmrqAxQC0fFNP6BjJWJRKrpmxkz1/F5qM5knluNOYROAUFk1IqZZOb866HMsKPo4/bdKXp3+B3QZVlkqR4o2HR0ZC5GIpZljHW37I/tA49N/ci4p87uMA/aJNIk/CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737365767; c=relaxed/simple;
	bh=Dunw9sx2J1XWClt+FzU+YMYNH4RtHDDQDIZ7XZZDwvU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WLQcSYz7rbKT9JnjezJMVBLymna1dReZnfLhYMY9lFsu2dJVW9pQcdi0GQGQ3PkEwWj/2F0nDtA19RoBWWVt71FNnjKzK+fos7vbtNAEyzd/RnSpn39mSVhZABfuu2njGR4uYoVQEL5NaegVkqT88apvyrBMkxd7eUkgRIctpfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b=ZUZjzwGO; arc=none smtp.client-ip=185.136.65.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202501200935528f0a7fa93eb037b459
        for <linux-rtc@vger.kernel.org>;
        Mon, 20 Jan 2025 10:35:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=m9xoW+hKzIxGJalU2/k33M2o3qTUJHxMRN22Fki65ZI=;
 b=ZUZjzwGO+DxCotEl8iyJZ8aDPO4dOic4gjZZZyWW3GgLDQOSufSObqLMd/5tDauuRO8kBL
 Az5ALduX9YcCFfNIGLA8iNcr0kGX2QWfYdXRfqqF2mnC9+RoflIk3/N4nTeDuYFvqDAgj80e
 O+Q/0DVTVgKmugc6nBL4vmhl0JRC1wTWbkYSKjX8nM5YowzPE1YZR9BvT+8aK0uSKxi08vUR
 8xYutHIzDL0HQlmDxFbu4JQimpErzU+PTIEijdRH6sabH3ejwJ9aVagd3jOVJeklTNd1I/jH
 Zes+VT47b4qyYxHQoTTrTgvBvfCrGIGfrSRp3EFP36/Agmrk1jZHq7IA==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-rtc@vger.kernel.org
Cc: Lukas Stockmann <lukas.stockmann@siemens.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-kernel@vger.kernel.org,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>
Subject: [PATCH v2] rtc: pcf85063: do a SW reset if POR failed
Date: Mon, 20 Jan 2025 10:34:49 +0100
Message-ID: <20250120093451.30778-1-alexander.sverdlin@siemens.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer

From: Lukas Stockmann <lukas.stockmann@siemens.com>

Power-on Reset has a documented issue in PCF85063, refer to its datasheet,
section "Software reset":

"There is a low probability that some devices will have corruption of the
registers after the automatic power-on reset if the device is powered up
with a residual VDD level. It is required that the VDD starts at zero volts
at power up or upon power cycling to ensure that there is no corruption of
the registers. If this is not possible, a reset must be initiated after
power-up (i.e. when power is stable) with the software reset command"

Trigger SW reset if there is an indication that POR has failed.

Link: https://www.nxp.com/docs/en/data-sheet/PCF85063A.pdf
Signed-off-by: Lukas Stockmann <lukas.stockmann@siemens.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
v2:
- clarify commit message and the runtime warning, that it's Power-on Reset
  issue and not power loss handling during run time
v1:
https://patchwork.ozlabs.org/project/rtc-linux/patch/20240227131436.3342807-1-alexander.sverdlin@siemens.com/

 drivers/rtc/rtc-pcf85063.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
index fdbc07f14036..edfd75d18e19 100644
--- a/drivers/rtc/rtc-pcf85063.c
+++ b/drivers/rtc/rtc-pcf85063.c
@@ -35,6 +35,7 @@
 #define PCF85063_REG_CTRL1_CAP_SEL	BIT(0)
 #define PCF85063_REG_CTRL1_STOP		BIT(5)
 #define PCF85063_REG_CTRL1_EXT_TEST	BIT(7)
+#define PCF85063_REG_CTRL1_SWR		0x58
 
 #define PCF85063_REG_CTRL2		0x01
 #define PCF85063_CTRL2_AF		BIT(6)
@@ -580,7 +581,7 @@ static int pcf85063_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, pcf85063);
 
-	err = regmap_read(pcf85063->regmap, PCF85063_REG_CTRL1, &tmp);
+	err = regmap_read(pcf85063->regmap, PCF85063_REG_SC, &tmp);
 	if (err) {
 		dev_err(&client->dev, "RTC chip is not present\n");
 		return err;
@@ -590,6 +591,22 @@ static int pcf85063_probe(struct i2c_client *client)
 	if (IS_ERR(pcf85063->rtc))
 		return PTR_ERR(pcf85063->rtc);
 
+	/*
+	 * If a Power loss is detected, SW reset the device.
+	 * From PCF85063A datasheet:
+	 * There is a low probability that some devices will have corruption
+	 * of the registers after the automatic power-on reset...
+	 */
+	if (tmp & PCF85063_REG_SC_OS) {
+		dev_warn(&client->dev,
+			 "POR issue detected, sending a SW reset\n");
+		err = regmap_write(pcf85063->regmap, PCF85063_REG_CTRL1,
+				   PCF85063_REG_CTRL1_SWR);
+		if (err < 0)
+			dev_warn(&client->dev,
+				 "SW reset failed, trying to continue\n");
+	}
+
 	err = pcf85063_load_capacitance(pcf85063, client->dev.of_node,
 					config->force_cap_7000 ? 7000 : 0);
 	if (err < 0)
-- 
2.43.2


