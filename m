Return-Path: <linux-rtc+bounces-4567-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EE8B10539
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Jul 2025 11:07:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D344C7BF7A0
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Jul 2025 09:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21C7B153BE9;
	Thu, 24 Jul 2025 09:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WE/r3QLd"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8ED12CD88;
	Thu, 24 Jul 2025 09:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753347870; cv=none; b=p1HTizuzyW4EqZmyi8nH1n2TW1kdpWR/ziWHaaB2apEz/Gwj1E1UuPkldGY6uLztOt3OF56XfvZ0TYyuxZAdJHGftqsAxn+NIlVY+MNgwQ5ROYUERP0y5/MRXtGSG1TKDSnM/+JbfiggIhv7Qj5W85tR7yxARAw1V/oQsCdStHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753347870; c=relaxed/simple;
	bh=b1H6V4I5C65sGeDa6VdyPv44eqGIvJEavaXNwRuYWgY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gP0W/gNu2djBsd3lAR7xkvqQ0izvB+5NBHLWyESd46wHk3aixJSLdMlGuHSTnxgJe5yJTUQ2f4FO4qL325m5pGn6fXXIXG20wzTF5aA67g3fZo6Jpdj/oJV2qI15L2uDxzPRYC5scD1Whrv4UErbqxZrzi53qeWpydDT+wOXy18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WE/r3QLd; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B956243202;
	Thu, 24 Jul 2025 09:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753347865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ljPavOCv9leGeucowkE7pUHl9BhqyYjecFGlLvah4No=;
	b=WE/r3QLdRYTomMsbIpsnbsFMZDBSxpDyz9MxkoBnetJQIUxuPkK++LhbUiMohPZXDOyh3i
	mjtbvGUtzgxvPKZkfPziQqGD/tsL/Ym5V71QIi8xwLNijvZTC21i1cgYc/XS/idTgFapCK
	ZrqRsDR5qd6I8fOa6UH3AHSOrkfNGNPEeV5654nc/+yD+xSVp34P98F7Okuv9ZQHJHg8CO
	ali0b6O+pbKPrqX0v7qwj1ekPaneJapK/YgRbIxeLWH45WVyDRNxV6dYNK128HOH5e3PAR
	rxKX4rPNMxqXhDMDH5ALGicL+QxJ2g/K0Y+H7y/jDHFRx5rzmgKsg2f1KkXFGg==
From: alexandre.belloni@bootlin.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: kernel test robot <lkp@intel.com>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] rtc: pcf85063: scope pcf85063_config structures
Date: Thu, 24 Jul 2025 11:04:19 +0200
Message-ID: <20250724090420.917705-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -85
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdektddvgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnegoteeftdduqddtudculdduhedmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhenucggtffrrghtthgvrhhnpeejgeehtddtvdekudfglefftdfgffehtdekueegteeutedvvddtgedvveeujeejudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtudemvgdtrgemsgeiheemsgdvfhdtmeeksgelkeemjeeltdehmegrsggvleemudehvddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmegsieehmegsvdhftdemkegsleekmeejledtheemrggsvgelmeduhedvvddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhkphesihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhigqdhrthgtsehvghgvrhdrk
 hgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

Fix possible warning:
>> drivers/rtc/rtc-pcf85063.c:566:37: warning: unused variable 'config_rv8063' [-Wunused-const-variable]
     566 | static const struct pcf85063_config config_rv8063 = {
         |                                     ^~~~~~~~~~~~~

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202507241607.dmz2qrO5-lkp@intel.com/
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pcf85063.c | 94 +++++++++++++++++++-------------------
 1 file changed, 47 insertions(+), 47 deletions(-)

diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
index d9b67b959d18..e3b58cdb1eda 100644
--- a/drivers/rtc/rtc-pcf85063.c
+++ b/drivers/rtc/rtc-pcf85063.c
@@ -528,53 +528,6 @@ static struct clk *pcf85063_clkout_register_clk(struct pcf85063 *pcf85063)
 }
 #endif
 
-static const struct pcf85063_config config_pcf85063 = {
-	.regmap = {
-		.reg_bits = 8,
-		.val_bits = 8,
-		.max_register = 0x0a,
-	},
-};
-
-static const struct pcf85063_config config_pcf85063tp = {
-	.regmap = {
-		.reg_bits = 8,
-		.val_bits = 8,
-		.max_register = 0x0a,
-	},
-};
-
-static const struct pcf85063_config config_pcf85063a = {
-	.regmap = {
-		.reg_bits = 8,
-		.val_bits = 8,
-		.max_register = 0x11,
-	},
-	.has_alarms = 1,
-};
-
-static const struct pcf85063_config config_rv8263 = {
-	.regmap = {
-		.reg_bits = 8,
-		.val_bits = 8,
-		.max_register = 0x11,
-	},
-	.has_alarms = 1,
-	.force_cap_7000 = 1,
-};
-
-static const struct pcf85063_config config_rv8063 = {
-	.regmap = {
-		.reg_bits = 8,
-		.val_bits = 8,
-		.max_register = 0x11,
-		.read_flag_mask = BIT(7) | BIT(5),
-		.write_flag_mask = BIT(5),
-	},
-	.has_alarms = 1,
-	.force_cap_7000 = 1,
-};
-
 static int pcf85063_probe(struct device *dev, struct regmap *regmap, int irq,
 			  const struct pcf85063_config *config)
 {
@@ -671,6 +624,41 @@ static int pcf85063_probe(struct device *dev, struct regmap *regmap, int irq,
 
 #if IS_ENABLED(CONFIG_I2C)
 
+static const struct pcf85063_config config_pcf85063 = {
+	.regmap = {
+		.reg_bits = 8,
+		.val_bits = 8,
+		.max_register = 0x0a,
+	},
+};
+
+static const struct pcf85063_config config_pcf85063tp = {
+	.regmap = {
+		.reg_bits = 8,
+		.val_bits = 8,
+		.max_register = 0x0a,
+	},
+};
+
+static const struct pcf85063_config config_pcf85063a = {
+	.regmap = {
+		.reg_bits = 8,
+		.val_bits = 8,
+		.max_register = 0x11,
+	},
+	.has_alarms = 1,
+};
+
+static const struct pcf85063_config config_rv8263 = {
+	.regmap = {
+		.reg_bits = 8,
+		.val_bits = 8,
+		.max_register = 0x11,
+	},
+	.has_alarms = 1,
+	.force_cap_7000 = 1,
+};
+
 static const struct i2c_device_id pcf85063_ids[] = {
 	{ "pca85073a", .driver_data = (kernel_ulong_t)&config_pcf85063a },
 	{ "pcf85063", .driver_data = (kernel_ulong_t)&config_pcf85063 },
@@ -743,6 +731,18 @@ static void pcf85063_unregister_driver(void)
 
 #if IS_ENABLED(CONFIG_SPI_MASTER)
 
+static const struct pcf85063_config config_rv8063 = {
+	.regmap = {
+		.reg_bits = 8,
+		.val_bits = 8,
+		.max_register = 0x11,
+		.read_flag_mask = BIT(7) | BIT(5),
+		.write_flag_mask = BIT(5),
+	},
+	.has_alarms = 1,
+	.force_cap_7000 = 1,
+};
+
 static const struct spi_device_id rv8063_id[] = {
 	{ "rv8063" },
 	{}
-- 
2.50.1


