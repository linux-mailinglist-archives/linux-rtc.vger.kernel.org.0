Return-Path: <linux-rtc+bounces-3814-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8EDA7EB31
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Apr 2025 20:47:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C6567A1B61
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Apr 2025 18:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB10426E174;
	Mon,  7 Apr 2025 18:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EedCKF6t"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8101C26E170;
	Mon,  7 Apr 2025 18:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744049812; cv=none; b=b6g6N+/1COCZqziiTt+1QcT9nx1iNyCL5ObP0kX39XyX/p4uJOhM5FaM5SQ5Dc8HYEZib0i89Dbbs1d4Np2A8NMZDTJ+Hy2i4Uszq6EUll44waXCD3VCTdvWn32evyhY71QdN4/Zms7w4o9J6q533YTvZfE4cbvdmkyAyAi8otc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744049812; c=relaxed/simple;
	bh=iGSyNrTHBXw3xZ+wJn3dD9eaK14Mh27PcDfdGv/T/dU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BLVfZeG61XYddf8oKc5k/ER/vKQJvd2b2KyGE3DV0hu7gRO2nglQM89QIlvjjbuOLI5X1C4qI8unS94/kb7/mq0UUGZcEj83qiiqoummrlfV2U+MMRMPNFVQb+1md50dARJE+mdipvbOI3d4BxZAOgLNR5eDog1iem8t1R8cioo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EedCKF6t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 309B2C4CEEC;
	Mon,  7 Apr 2025 18:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744049812;
	bh=iGSyNrTHBXw3xZ+wJn3dD9eaK14Mh27PcDfdGv/T/dU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EedCKF6tHEGJE/xr/66SKmhkM6aNx20ufRZEDrsuMFoEALjnyw2rGvwUYIiVK7gzr
	 Jki3NhU9RC/1qz9LJFVugXq8+MwlUt47m9dumyfy6C0UN2JEyRy4MFYqhNUCwkCqWS
	 V6ntmsAqaGpl/JgTx9rdfKlhySIuwQEo/OkaLNzUjY7Sno9+6nYjMSfbtFU8wUJRQG
	 h3GDaKhbzN/cCuOw5zFdYzcjHOdGnaRey0rUzLe1IcB9zc0J2hl2iiTJyoNKeZ1owl
	 hi6+VPhhM+wiMO4Z+gHNydxeYMXR22PkqGjiVF9Wdb8mMolKUucpDRwTkxLGRGuZ5d
	 XlkB+dGwHuuSQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Lukas Stockmann <lukas.stockmann@siemens.com>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-rtc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 7/9] rtc: pcf85063: do a SW reset if POR failed
Date: Mon,  7 Apr 2025 14:16:33 -0400
Message-Id: <20250407181635.3184105-7-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250407181635.3184105-1-sashal@kernel.org>
References: <20250407181635.3184105-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.1
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


