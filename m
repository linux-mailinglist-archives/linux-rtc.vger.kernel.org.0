Return-Path: <linux-rtc+bounces-1977-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB04977D6E
	for <lists+linux-rtc@lfdr.de>; Fri, 13 Sep 2024 12:30:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0609C282BB1
	for <lists+linux-rtc@lfdr.de>; Fri, 13 Sep 2024 10:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16E671DA107;
	Fri, 13 Sep 2024 10:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="pOjRjJBa"
X-Original-To: linux-rtc@vger.kernel.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A5F1DA106;
	Fri, 13 Sep 2024 10:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.30.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726223363; cv=none; b=irv2WEkok/4w+wgFLeuo5b294IwDiTIQrHksjvpoSW2vFTptdN+v0fBnvrsFhQvcELmCpTxslJ0Z6UTnINesWPaz5KL/zwIlk+E0CqOM8dAlhobB+lpOjxhSaJnofltfnril5cRyGkW9ZWAwNl9DGGWiwZt8qxLKJ/fXSoAk0vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726223363; c=relaxed/simple;
	bh=Zb7aSV0oW+yKb5Asy8n0NTRp21E2eZbalbz24dawAt8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gWs9RAASJozwVunLs3Hkb78u4gsrrs05/KZAr82uy5ps3YADpFUZa+0GKrWWBt8bZ8/mtqWZsZRLjrnSRJ7Ri0QgnwyL/6rLSKBZBjnCPxRY/9dBkMqAaT7eJL1QKcmJl00L0WZR99p/IJ+ZsX5OKN9kEBZgM+7RWAZiDxGO+T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=pOjRjJBa; arc=none smtp.client-ip=188.40.30.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=InZ2QQ+90ucsM+b3r4LrCMsMJEs63QT2lHFJ93Q9NzI=; b=pOjRjJBaXSNylMqk2fCd9RGBrs
	iwWX2/z32DXXy0jZeM0enrxBeST2r0qOOE43uWOd0QqCa/W2upGunGmgSuoHc0465uoFWHE4gU94t
	p3y9ASE86dbum0yQa2OshhvZpy4AqJlj8VLvMqQ9ZsWy9nUlkKh/S788bMaWEqv02mlXYmVaX7KML
	8tN9bjGpUNbDHre4YrNl3yV7cGA8FG1LuKOpBPggqrjoC7VFl9h0+xwaE8YSlcih2IHE2e8DcKuYz
	1lHMBuuVQM3K/DGFVYpFbJ89spJKkbETXDMQiYrnW1JpkXZDDSvCQ2+TgX3zi0XfqoQRV/GaKL0+/
	BYouRLLQ==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sp3YE-0006OS-HU; Fri, 13 Sep 2024 12:29:18 +0200
Received: from [80.62.117.18] (helo=localhost)
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sp3YD-0006tP-2W;
	Fri, 13 Sep 2024 12:29:18 +0200
From: Esben Haabendal <esben@geanix.com>
Date: Fri, 13 Sep 2024 12:29:12 +0200
Subject: [PATCH v2 1/3] rtc: isl12022: Prepare for extending rtc device
 drvdata
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240913-rtc-isl12022-alarm-irq-v2-1-37309d939723@geanix.com>
References: <20240913-rtc-isl12022-alarm-irq-v2-0-37309d939723@geanix.com>
In-Reply-To: <20240913-rtc-isl12022-alarm-irq-v2-0-37309d939723@geanix.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726223356; l=3876;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=Zb7aSV0oW+yKb5Asy8n0NTRp21E2eZbalbz24dawAt8=;
 b=j+sUN1PRgCc5qCFiik84clkclZ6dayhc3rz6vgOC9mXBWmQFzlYwWrQVql8Aqq8dNKVCa9Sq+
 sgAsXaYA4yUAD5obCCtkEKhwPVgWqV2fELUtS1dl1yl0vADlwECDgvI
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27397/Fri Sep 13 10:48:01 2024)

Add a struct to hold the regmap pointer, so more information can be added.

This is morally a revert of commit f525b210e9d4 ("rtc: isl12022: Get rid of
unneeded private struct isl12022").

Acked-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/rtc/rtc-isl12022.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-isl12022.c b/drivers/rtc/rtc-isl12022.c
index 6fa9a68af9d9..d82278fdc29b 100644
--- a/drivers/rtc/rtc-isl12022.c
+++ b/drivers/rtc/rtc-isl12022.c
@@ -54,6 +54,10 @@
 
 #define ISL12022_BETA_TSE	(1 << 7)
 
+struct isl12022 {
+	struct regmap *regmap;
+};
+
 static umode_t isl12022_hwmon_is_visible(const void *data,
 					 enum hwmon_sensor_types type,
 					 u32 attr, int channel)
@@ -116,7 +120,8 @@ static const struct hwmon_chip_info isl12022_hwmon_chip_info = {
 
 static void isl12022_hwmon_register(struct device *dev)
 {
-	struct regmap *regmap = dev_get_drvdata(dev);
+	struct isl12022 *isl12022 = dev_get_drvdata(dev);
+	struct regmap *regmap = isl12022->regmap;
 	struct device *hwmon;
 	int ret;
 
@@ -143,7 +148,8 @@ static void isl12022_hwmon_register(struct device *dev)
  */
 static int isl12022_rtc_read_time(struct device *dev, struct rtc_time *tm)
 {
-	struct regmap *regmap = dev_get_drvdata(dev);
+	struct isl12022 *isl12022 = dev_get_drvdata(dev);
+	struct regmap *regmap = isl12022->regmap;
 	uint8_t buf[ISL12022_REG_INT + 1];
 	int ret;
 
@@ -178,7 +184,8 @@ static int isl12022_rtc_read_time(struct device *dev, struct rtc_time *tm)
 
 static int isl12022_rtc_set_time(struct device *dev, struct rtc_time *tm)
 {
-	struct regmap *regmap = dev_get_drvdata(dev);
+	struct isl12022 *isl12022 = dev_get_drvdata(dev);
+	struct regmap *regmap = isl12022->regmap;
 	int ret;
 	uint8_t buf[ISL12022_REG_DW + 1];
 
@@ -210,7 +217,8 @@ static int isl12022_rtc_set_time(struct device *dev, struct rtc_time *tm)
 
 static int isl12022_rtc_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
 {
-	struct regmap *regmap = dev_get_drvdata(dev);
+	struct isl12022 *isl12022 = dev_get_drvdata(dev);
+	struct regmap *regmap = isl12022->regmap;
 	u32 user, val;
 	int ret;
 
@@ -248,7 +256,8 @@ static const struct regmap_config regmap_config = {
 
 static int isl12022_register_clock(struct device *dev)
 {
-	struct regmap *regmap = dev_get_drvdata(dev);
+	struct isl12022 *isl12022 = dev_get_drvdata(dev);
+	struct regmap *regmap = isl12022->regmap;
 	struct clk_hw *hw;
 	int ret;
 
@@ -288,7 +297,8 @@ static const u32 trip_levels[2][7] = {
 
 static void isl12022_set_trip_levels(struct device *dev)
 {
-	struct regmap *regmap = dev_get_drvdata(dev);
+	struct isl12022 *isl12022 = dev_get_drvdata(dev);
+	struct regmap *regmap = isl12022->regmap;
 	u32 levels[2] = {0, 0};
 	int ret, i, j, x[2];
 	u8 val, mask;
@@ -325,6 +335,7 @@ static void isl12022_set_trip_levels(struct device *dev)
 
 static int isl12022_probe(struct i2c_client *client)
 {
+	struct isl12022 *isl12022;
 	struct rtc_device *rtc;
 	struct regmap *regmap;
 	int ret;
@@ -332,13 +343,19 @@ static int isl12022_probe(struct i2c_client *client)
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
 		return -ENODEV;
 
+	/* Allocate driver state */
+	isl12022 = devm_kzalloc(&client->dev, sizeof(*isl12022), GFP_KERNEL);
+	if (!isl12022)
+		return -ENOMEM;
+
 	regmap = devm_regmap_init_i2c(client, &regmap_config);
 	if (IS_ERR(regmap)) {
 		dev_err(&client->dev, "regmap allocation failed\n");
 		return PTR_ERR(regmap);
 	}
+	isl12022->regmap = regmap;
 
-	dev_set_drvdata(&client->dev, regmap);
+	dev_set_drvdata(&client->dev, isl12022);
 
 	ret = isl12022_register_clock(&client->dev);
 	if (ret)

-- 
2.46.0


