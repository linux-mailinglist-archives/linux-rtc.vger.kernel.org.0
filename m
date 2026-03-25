Return-Path: <linux-rtc+bounces-6250-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBfrM1Trw2kAvAQAu9opvQ
	(envelope-from <linux-rtc+bounces-6250-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Mar 2026 15:04:04 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9373C3265E9
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Mar 2026 15:04:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4F7A130AE51F
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Mar 2026 13:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83C573DC4CD;
	Wed, 25 Mar 2026 13:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=abscue.de header.i=@abscue.de header.b="p0PwCT/n"
X-Original-To: linux-rtc@vger.kernel.org
Received: from srv01.abscue.de (abscue.de [89.58.28.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F443D9DB0;
	Wed, 25 Mar 2026 13:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.28.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774446903; cv=none; b=d/p8KKvDmS6FiwIy6nZs8MHjJJThG4Raw10rDK0CgKWpEPzNtnauvQCQcJcmbFMOwdOQ3Vhv5TsD6iKiGlO96vCRfNRKZflVkh97cPPbOZea26yJA8wo17XUkbWVMwkSNJGAzacs7ncxdyGTKTKn4Qu6HkA+4IN1fwVuhNJjBY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774446903; c=relaxed/simple;
	bh=pmjaHkkd1GTe7qUmzoQfztH+XwQtCIWX0+AnfIZurJg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mt/kEG4IV0YwYZCnKegA/azfc94BlOmhkxZ+yPjXfWb8XOmKZSiaCSNRIMTa8bmuUQ9KxLVQJdpOVFK+ZyYUh/uNx1qeTFvVVXW18FphfbuTAs2ZhLQadE5AAEX36WThclrgLuVt5gjDpA69YhCgRV3R/V4sDx5T7CI197rvB7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=abscue.de; spf=pass smtp.mailfrom=abscue.de; dkim=pass (2048-bit key) header.d=abscue.de header.i=@abscue.de header.b=p0PwCT/n; arc=none smtp.client-ip=89.58.28.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=abscue.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=abscue.de
Received: from fluffy-mammal.metal.fwg-cag.de (unknown [IPv6:2001:9e8:cde0:9600:8d27:ae39:1dce:2212])
	by srv01.abscue.de (Postfix) with ESMTPSA id E67781C00A8;
	Wed, 25 Mar 2026 14:54:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=abscue.de; s=dkim;
	t=1774446894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oAeadNDLY6QXY+Bf5+OCfab+TpNiEHvWt9WUf5IakbE=;
	b=p0PwCT/nEYdkk1yT7UIDSrAIOhA46+Anm+Xkp6uAmG0bf9ZaPI/WGqBOKRtGC4Er/1xQ6B
	u+QYMSUPb6Oi6nnmpN4cvs535xW9pEqB+Dd34CdVWJZ3vyFlHLgIsxLUJu2RQ4uOVEJt4H
	+ZrjeSMpJJ53TtQBa5Zc4OFKjEj58SudGXrz3Fzw6h3KhnHJMwU0kL7bT3dYD968FxfNkQ
	qo7xY0IARb6nk2ZWN17YS12JnwPGoCI+9tJ+Q3QoM0vcbg74djGpr1HFGk6WgPfbWdip/g
	PKm2euM6dmoivbAADLdv/p0sQU74xVlhbXWvMvu6R6AM0d42IyBDiBv6C/JijQ==
From: =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Date: Wed, 25 Mar 2026 14:53:45 +0100
Subject: [PATCH v2 3/5] mfd: sprd-sc27xx: Switch to devm_mfd_add_devices()
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260325-sc27xx-mfd-cells-v2-3-d0ebb60aa4a7@abscue.de>
References: <20260325-sc27xx-mfd-cells-v2-0-d0ebb60aa4a7@abscue.de>
In-Reply-To: <20260325-sc27xx-mfd-cells-v2-0-d0ebb60aa4a7@abscue.de>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Sebastian Reichel <sre@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[abscue.de:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,gmail.com,linux.alibaba.com];
	TAGGED_FROM(0.00)[bounces-6250-lists,linux-rtc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	DMARC_NA(0.00)[abscue.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[otto.pflueger@abscue.de,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[abscue.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[abscue.de:dkim,abscue.de:email,abscue.de:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9373C3265E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

To allow instantiating subdevices such as the regulator and poweroff
devices that do not have corresponding device tree nodes with a
"compatible" property, use devm_mfd_add_devices() with MFD cells instead
of devm_of_platform_populate(). Since different PMICs in the SC27xx
series contain different components, use separate MFD cell tables for
each PMIC model. Define cells for all components that have upstream
drivers at this point.

Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
---
 drivers/mfd/sprd-sc27xx-spi.c | 62 ++++++++++++++++++++++++++++++++++++-------
 1 file changed, 53 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/sprd-sc27xx-spi.c b/drivers/mfd/sprd-sc27xx-spi.c
index d6b4350779e6..eb57023fdc3c 100644
--- a/drivers/mfd/sprd-sc27xx-spi.c
+++ b/drivers/mfd/sprd-sc27xx-spi.c
@@ -14,6 +14,11 @@
 #include <linux/spi/spi.h>
 #include <uapi/linux/usb/charger.h>
 
+enum sprd_pmic_type {
+	PMIC_TYPE_SC2730,
+	PMIC_TYPE_SC2731,
+};
+
 #define SPRD_PMIC_INT_MASK_STATUS	0x0
 #define SPRD_PMIC_INT_RAW_STATUS	0x4
 #define SPRD_PMIC_INT_EN		0x8
@@ -50,6 +55,29 @@ struct sprd_pmic_data {
 	u32 charger_det;
 };
 
+static const struct mfd_cell sc2730_devices[] = {
+	MFD_CELL_OF("sc2730-adc", NULL, NULL, 0, 0, "sprd,sc2730-adc"),
+	MFD_CELL_OF("sc2730-bltc", NULL, NULL, 0, 0, "sprd,sc2730-bltc"),
+	MFD_CELL_OF("sc2730-efuse", NULL, NULL, 0, 0, "sprd,sc2730-efuse"),
+	MFD_CELL_OF("sc2730-eic", NULL, NULL, 0, 0, "sprd,sc2730-eic"),
+	MFD_CELL_OF("sc2730-fgu", NULL, NULL, 0, 0, "sprd,sc2730-fgu"),
+	MFD_CELL_OF("sc2730-rtc", NULL, NULL, 0, 0, "sprd,sc2730-rtc"),
+	MFD_CELL_OF("sc2730-vibrator", NULL, NULL, 0, 0, "sprd,sc2730-vibrator"),
+};
+
+static const struct mfd_cell sc2731_devices[] = {
+	MFD_CELL_OF("sc2731-adc", NULL, NULL, 0, 0, "sprd,sc2731-adc"),
+	MFD_CELL_OF("sc2731-bltc", NULL, NULL, 0, 0, "sprd,sc2731-bltc"),
+	MFD_CELL_OF("sc2731-charger", NULL, NULL, 0, 0, "sprd,sc2731-charger"),
+	MFD_CELL_OF("sc2731-efuse", NULL, NULL, 0, 0, "sprd,sc2731-efuse"),
+	MFD_CELL_OF("sc2731-eic", NULL, NULL, 0, 0, "sprd,sc2731-eic"),
+	MFD_CELL_OF("sc2731-fgu", NULL, NULL, 0, 0, "sprd,sc2731-fgu"),
+	MFD_CELL_NAME("sc2731-poweroff"),
+	MFD_CELL_NAME("sc2731-regulator"),
+	MFD_CELL_OF("sc2731-rtc", NULL, NULL, 0, 0, "sprd,sc2731-rtc"),
+	MFD_CELL_OF("sc2731-vibrator", NULL, NULL, 0, 0, "sprd,sc2731-vibrator"),
+};
+
 /*
  * Since different PMICs of SC27xx series can have different interrupt
  * base address and irq number, we should save irq number and irq base
@@ -152,12 +180,26 @@ static const struct regmap_config sprd_pmic_config = {
 static int sprd_pmic_probe(struct spi_device *spi)
 {
 	struct sprd_pmic *ddata;
+	enum sprd_pmic_type pmic_type;
 	const struct sprd_pmic_data *pdata;
-	int ret, i;
+	const struct mfd_cell *cells;
+	int ret, i, num_cells;
+
+	pmic_type = (enum sprd_pmic_type)of_device_get_match_data(&spi->dev);
 
-	pdata = of_device_get_match_data(&spi->dev);
-	if (!pdata) {
-		dev_err(&spi->dev, "No matching driver data found\n");
+	switch (pmic_type) {
+	case PMIC_TYPE_SC2730:
+		pdata = &sc2730_data;
+		cells = sc2730_devices;
+		num_cells = ARRAY_SIZE(sc2730_devices);
+		break;
+	case PMIC_TYPE_SC2731:
+		pdata = &sc2731_data;
+		cells = sc2731_devices;
+		num_cells = ARRAY_SIZE(sc2731_devices);
+		break;
+	default:
+		dev_err(&spi->dev, "Invalid device ID\n");
 		return -EINVAL;
 	}
 
@@ -204,7 +246,9 @@ static int sprd_pmic_probe(struct spi_device *spi)
 		return ret;
 	}
 
-	ret = devm_of_platform_populate(&spi->dev);
+	ret = devm_mfd_add_devices(&spi->dev, PLATFORM_DEVID_AUTO,
+				   cells, num_cells, NULL, 0,
+				   regmap_irq_get_domain(ddata->irq_data));
 	if (ret) {
 		dev_err(&spi->dev, "Failed to populate sub-devices %d\n", ret);
 		return ret;
@@ -241,15 +285,15 @@ static DEFINE_SIMPLE_DEV_PM_OPS(sprd_pmic_pm_ops,
 				sprd_pmic_suspend, sprd_pmic_resume);
 
 static const struct of_device_id sprd_pmic_match[] = {
-	{ .compatible = "sprd,sc2730", .data = &sc2730_data },
-	{ .compatible = "sprd,sc2731", .data = &sc2731_data },
+	{ .compatible = "sprd,sc2730", .data = (void *)PMIC_TYPE_SC2730 },
+	{ .compatible = "sprd,sc2731", .data = (void *)PMIC_TYPE_SC2731 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, sprd_pmic_match);
 
 static const struct spi_device_id sprd_pmic_spi_ids[] = {
-	{ .name = "sc2730", .driver_data = (unsigned long)&sc2730_data },
-	{ .name = "sc2731", .driver_data = (unsigned long)&sc2731_data },
+	{ .name = "sc2730", .driver_data = PMIC_TYPE_SC2730 },
+	{ .name = "sc2731", .driver_data = PMIC_TYPE_SC2731 },
 	{},
 };
 MODULE_DEVICE_TABLE(spi, sprd_pmic_spi_ids);

-- 
2.51.0


