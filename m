Return-Path: <linux-rtc+bounces-1919-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5754B973361
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Sep 2024 12:32:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14ADD2883AE
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Sep 2024 10:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E12F41917F6;
	Tue, 10 Sep 2024 10:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="MD9Q0NwC"
X-Original-To: linux-rtc@vger.kernel.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D5818FDBD;
	Tue, 10 Sep 2024 10:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.30.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725964045; cv=none; b=bUAhutaEGz5l4/W9mtU+7G7yzrH+6Dnq1hGEepP0R1edFix4NHx3wP/tEXMo90WbJjtfAkiIiwDXGDbslmR6vWIGnoE+ZwLMVCqVh0iZZSf3k/ss/i7wQ2/X8gEAG8sTRW95VGJ1WNlei+5ZxQIAe1sn8HSShoPxeEKaazh3hec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725964045; c=relaxed/simple;
	bh=oBVz0IArP8ALcpSqlwLekzvKT82F1d0jKCBlQVbqHz8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G3u8qwne8EHk+VtydM4tKxt927n+jIFTj00509XuTkZqt5HHMBKod/lHYsvvWYUv90lBK8+nevv7fEvJ2XbSAW8h23AAKboPkip9CsZ9YhcHbv/XMhOULl25OlHltMcAEOVFyjHO8q9j5DM1v9DBSlEqMC4oGIdqyDc3SZL5YJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=MD9Q0NwC; arc=none smtp.client-ip=188.40.30.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=huI7wvdyTsXMt7RyFfh6G9uaE+5uPlknGlWkB/KVofc=; b=MD9Q0NwCjhfTMzAQH0dG4rqBQI
	PFCgyHYIv++WtzPO5Z0soKsG+ZBddhcwn74zcBuA+IQUK0aC4/5Fdwz/9XOl58XePbekx9yQ4CwU7
	SuyGoqOHQekHD3wJeYEjXpT+V3GocOVZ4TvKFkJ4jpPvPxi20Fsg41F9ACxF8LhpqlMGP0O6l/S+W
	yk+EafQIk346SN8mtQYjC/ki3f6DLH29rF+3fCl+nhJ0slGS94Myp8tDgL8nyd/MDJtEfJUWpDKDL
	rl+4sXL8i72FtweC8Jq2K8j+h3CVCBGp5HzGCVFhHkl50NrXnjRpTFLO27HdY1Bn+yNC5yTKz5Xk4
	SNRwDXMw==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sny5g-000Gs8-U4; Tue, 10 Sep 2024 12:27:20 +0200
Received: from [80.62.117.18] (helo=localhost)
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sny5h-000MiA-0i;
	Tue, 10 Sep 2024 12:27:20 +0200
From: Esben Haabendal <esben@geanix.com>
Date: Tue, 10 Sep 2024 12:27:10 +0200
Subject: [PATCH 1/2] rtc: isl12022: Prepare for extending rtc device
 drvdata
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240910-rtc-isl12022-alarm-irq-v1-1-d875cedc997f@geanix.com>
References: <20240910-rtc-isl12022-alarm-irq-v1-0-d875cedc997f@geanix.com>
In-Reply-To: <20240910-rtc-isl12022-alarm-irq-v1-0-d875cedc997f@geanix.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725964039; l=3705;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=oBVz0IArP8ALcpSqlwLekzvKT82F1d0jKCBlQVbqHz8=;
 b=UOP0NnpX6XnglXXjweK4KwBDCurZUcnq9AbFwQv9DmgZpc02P/ylwPf6Zdg1B6b7igmpvRQWg
 9V+W///WiahB0h4Dnf18f1h3yUScWrBLjf/i3qejnaxArSVfIE8Nkf6
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27394/Tue Sep 10 10:30:36 2024)

Add a struct to hold the regmap pointer, so more information can be added.

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


