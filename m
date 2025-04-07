Return-Path: <linux-rtc+bounces-3815-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D3EA7EB58
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Apr 2025 20:52:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41FF4422045
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Apr 2025 18:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3C56256C9A;
	Mon,  7 Apr 2025 18:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MgU0ANpy"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9921D26FDAF;
	Mon,  7 Apr 2025 18:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744049832; cv=none; b=UUheXA8gCgO1YbFRHDamaACtMhSDHDw62mCVq5h+ap3esZK0NzSsW5c2HoATaSvWrDDVhfBMX8Nl303KnfFCm7UDUMWfxlDR4PcFaXpAziotln6TN/Fa6vytvNA5HdR0FifJ+t10zIxf0EgIG+SnH2FfHofLZA8GtyeJKmnJ5oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744049832; c=relaxed/simple;
	bh=iGSyNrTHBXw3xZ+wJn3dD9eaK14Mh27PcDfdGv/T/dU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DDAr5mP4Bg8DWmM4UD/TNbGPrHpNwlFAtHg4KELGyXWTEKygs0D7XsBVFXbBiRQhKvckLsBoGxqFeDxCvk/4DU+2FoERQCAakP05asm9MbGESuNd2efwNywLOOWunnDL2BYUls0adQXP6biLvJg6LSM0aDv68PLho4kQaggc34I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MgU0ANpy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A95C8C4CEE7;
	Mon,  7 Apr 2025 18:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744049832;
	bh=iGSyNrTHBXw3xZ+wJn3dD9eaK14Mh27PcDfdGv/T/dU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MgU0ANpyF5zbJbeLUkN/zigednrufjvVbP0i47hGQfY3e6Vv36SZEjfVOlyQJ/D8+
	 njK9w2lIXrJIj7JJepo4NH28yyAyf61IQ50s8IlZ8wbqCXfsceJxvaIBDBgiSD/31T
	 zyFC8ZcJBi19ne954hVhaJVbRV4Lt8RZWLN89DvsbMyhnVbjez56a3BfvBqFWmOz/8
	 sUvuu586LCLBGEbhcVJO8l3r6i/woiOQ3Sj4+LvBX4CjyFl6WyNzMt4dFZsJd/DFwh
	 VwLWnWB0C9S0Ts51oc806Lbj5fR2wni9n+PP9Zk8V0LKhqWR96CA45k7LCO7yKcURn
	 +RyJvyV+/1zoA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Lukas Stockmann <lukas.stockmann@siemens.com>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-rtc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.13 6/8] rtc: pcf85063: do a SW reset if POR failed
Date: Mon,  7 Apr 2025 14:16:56 -0400
Message-Id: <20250407181658.3184231-6-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250407181658.3184231-1-sashal@kernel.org>
References: <20250407181658.3184231-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13.10
Content-Transfer-Encoding: 8bit

From: Lukas Stockmann <lukas.stockmann@siemens.com>

[ Upstream commit 2b7cbd98495f6ee4cd6422fe77828a19e9edf87f ]

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
Link: https://lore.kernel.org/r/20250120093451.30778-1-alexander.sverdlin@siemens.com
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/rtc/rtc-pcf85063.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
index 905986c616559..73848f764559b 100644
--- a/drivers/rtc/rtc-pcf85063.c
+++ b/drivers/rtc/rtc-pcf85063.c
@@ -35,6 +35,7 @@
 #define PCF85063_REG_CTRL1_CAP_SEL	BIT(0)
 #define PCF85063_REG_CTRL1_STOP		BIT(5)
 #define PCF85063_REG_CTRL1_EXT_TEST	BIT(7)
+#define PCF85063_REG_CTRL1_SWR		0x58
 
 #define PCF85063_REG_CTRL2		0x01
 #define PCF85063_CTRL2_AF		BIT(6)
@@ -589,7 +590,7 @@ static int pcf85063_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, pcf85063);
 
-	err = regmap_read(pcf85063->regmap, PCF85063_REG_CTRL1, &tmp);
+	err = regmap_read(pcf85063->regmap, PCF85063_REG_SC, &tmp);
 	if (err) {
 		dev_err(&client->dev, "RTC chip is not present\n");
 		return err;
@@ -599,6 +600,22 @@ static int pcf85063_probe(struct i2c_client *client)
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
2.39.5


