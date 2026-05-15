Return-Path: <linux-rtc+bounces-6514-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIhGKKT/BmpiqgIAu9opvQ
	(envelope-from <linux-rtc+bounces-6514-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 15 May 2026 13:12:36 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E2754E2D0
	for <lists+linux-rtc@lfdr.de>; Fri, 15 May 2026 13:12:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 73A3D30E35AD
	for <lists+linux-rtc@lfdr.de>; Fri, 15 May 2026 10:42:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAA204657CC;
	Fri, 15 May 2026 10:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="OF8cGRNg"
X-Original-To: linux-rtc@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF55A44DB64;
	Fri, 15 May 2026 10:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778841726; cv=none; b=YqHE2F7X1dBJ/lujNdgbIso6BrCL3dbvvzcnXiRDbVxsq1WtmKsdjqtKOhoyv8br7UedLptYWHdqO1k6hCXNRfo4VW26um8gDw828SRkt+2AsqyzL9k2yJm9yM1FOOpyIIPtfSfKEFmz4b3gCQ71v8IxNEdCAi4r/t5O0ZqXg/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778841726; c=relaxed/simple;
	bh=5N/CTSyzp4i9loObyhppJLQYxvuPtFpz0fmq5A2XMkA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hKc3Sl2uEvrYW47qBb9VIBWbL5us5BtnE7MEvgGFp9iVUGoJtt+kZjBDdW4+ovP5kAiMkL0QnaXQll9LdVfUixR+eAHtPW3CShSsueReOwPEG5TfPhodYEvm4jjn0Wpzhrg46l4OCfKSS5Im+o94ozmG51HFiJfQvhYrussGHVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=OF8cGRNg; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id BB3FF27239;
	Fri, 15 May 2026 12:42:03 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gq-t4ckZFtkK; Fri, 15 May 2026 12:42:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1778841723; bh=5N/CTSyzp4i9loObyhppJLQYxvuPtFpz0fmq5A2XMkA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OF8cGRNgMvTdfSw7GbghE+LigT0uA8Kuc29jNQ+2L6/OtN3f0dqrctC4YsN67VtEc
	 lTg4EVc+Ilv58cfcidS0LDx8QHCveZC+LKU+vSnEWD1Oi2ooYDaEO7UqZGK9Z52eMQ
	 eM8Cq2VpqvGwS0uSgtYCqy5/4yY2D5DFpwwMbxZsrBjfmujWbqAGtajgmPVJfNoAG7
	 ZPoSy7yl+eWRkfCk2mUxj26uhN0TDHxcvgNCU2zsDDM/jxd3Qzmrcy6UrttbE6aBW0
	 GACUTD66GBlvKp1Zs5SYwBcqAnah4gP89MM4qn8pQrLpMe+X+6I2MFen31vnV5/10O
	 KeBC1cpVs2a2A==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 15 May 2026 16:09:07 +0530
Subject: [PATCH v6 11/11] power: supply: add support for Samsung S2M series
 PMIC charger device
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260515-s2mu005-pmic-v6-11-1979106992d4@disroot.org>
References: <20260515-s2mu005-pmic-v6-0-1979106992d4@disroot.org>
In-Reply-To: <20260515-s2mu005-pmic-v6-0-1979106992d4@disroot.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Sebastian Reichel <sre@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Nam Tran <trannamatk@gmail.com>, 
 =?utf-8?q?=C5=81ukasz_Lebiedzi=C5=84ski?= <kernel@lvkasz.us>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-doc@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Rspamd-Queue-Id: 11E2754E2D0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6514-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,samsung.com,linaro.org,bootlin.com,lwn.net,linuxfoundation.org,gmail.com,lvkasz.us];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[disroot.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kauschluss@disroot.org,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[disroot.org:email,disroot.org:mid,disroot.org:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,lvkasz.us:email]
X-Rspamd-Action: no action

Add a driver for charger controllers found in certain Samsung S2M series
PMICs. The driver has very basic support for the device, with only
charger online reporting working, and USB 2.0 device negotiations
working.

The driver includes initial support for the S2MU005 PMIC charger.

Co-developed-by: Łukasz Lebiedziński <kernel@lvkasz.us>
Signed-off-by: Łukasz Lebiedziński <kernel@lvkasz.us>
Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/power/supply/Kconfig       |  11 ++
 drivers/power/supply/Makefile      |   1 +
 drivers/power/supply/s2m-charger.c | 299 +++++++++++++++++++++++++++++++++++++
 3 files changed, 311 insertions(+)

diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfig
index 83392ed6a8da9..6270e6d16fbbb 100644
--- a/drivers/power/supply/Kconfig
+++ b/drivers/power/supply/Kconfig
@@ -856,6 +856,17 @@ config CHARGER_RK817
 	help
 	  Say Y to include support for Rockchip RK817 Battery Charger.
 
+config CHARGER_S2M
+	tristate "Samsung S2M series PMIC battery charger support"
+	depends on EXTCON_S2M
+	depends on MFD_SEC_CORE
+	select REGMAP_IRQ
+	help
+	  This option enables support for charger devices found in
+	  certain Samsung S2M series PMICs, such as the S2MU005. These
+	  devices provide USB power supply information and also required
+	  for USB OTG role switching.
+
 config CHARGER_SMB347
 	tristate "Summit Microelectronics SMB3XX Battery Charger"
 	depends on I2C
diff --git a/drivers/power/supply/Makefile b/drivers/power/supply/Makefile
index 7ee839dca7f33..738814650ea0f 100644
--- a/drivers/power/supply/Makefile
+++ b/drivers/power/supply/Makefile
@@ -107,6 +107,7 @@ obj-$(CONFIG_CHARGER_BQ25890)	+= bq25890_charger.o
 obj-$(CONFIG_CHARGER_BQ25980)	+= bq25980_charger.o
 obj-$(CONFIG_CHARGER_BQ256XX)	+= bq256xx_charger.o
 obj-$(CONFIG_CHARGER_RK817)	+= rk817_charger.o
+obj-$(CONFIG_CHARGER_S2M)	+= s2m-charger.o
 obj-$(CONFIG_CHARGER_SMB347)	+= smb347-charger.o
 obj-$(CONFIG_CHARGER_TPS65090)	+= tps65090-charger.o
 obj-$(CONFIG_CHARGER_TPS65217)	+= tps65217_charger.o
diff --git a/drivers/power/supply/s2m-charger.c b/drivers/power/supply/s2m-charger.c
new file mode 100644
index 0000000000000..b32cea55b8b04
--- /dev/null
+++ b/drivers/power/supply/s2m-charger.c
@@ -0,0 +1,299 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Battery Charger Driver for Samsung S2M series PMICs.
+ *
+ * Copyright (c) 2015 Samsung Electronics Co., Ltd
+ * Copyright (c) 2026 Kaustabh Chakraborty <kauschluss@disroot.org>
+ * Copyright (c) 2026 Łukasz Lebiedziński <kernel@lvkasz.us>
+ */
+
+#include <linux/devm-helpers.h>
+#include <linux/extcon.h>
+#include <linux/mfd/samsung/core.h>
+#include <linux/mfd/samsung/s2mu005.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+#include <linux/power_supply.h>
+#include <linux/regmap.h>
+
+struct s2m_chgr {
+	struct device *dev;
+	struct regmap *regmap;
+	struct power_supply *psy;
+	struct extcon_dev *extcon;
+	struct work_struct extcon_work;
+	struct notifier_block extcon_nb;
+};
+
+static int s2mu005_chgr_get_online(struct s2m_chgr *priv, int *value)
+{
+	u32 val;
+	int ret = 0;
+
+	ret = regmap_read(priv->regmap, S2MU005_REG_CHGR_STATUS0, &val);
+	if (ret < 0) {
+		dev_err(priv->dev, "failed to read register (%d)\n", ret);
+		return ret;
+	}
+
+	*value = !!(val & S2MU005_CHGR_CHG);
+
+	return ret;
+}
+
+static void s2mu005_chgr_get_usb_type(struct s2m_chgr *priv, int *value)
+{
+	if (extcon_get_state(priv->extcon, EXTCON_CHG_USB_CDP))
+		*value = POWER_SUPPLY_USB_TYPE_CDP;
+	if (extcon_get_state(priv->extcon, EXTCON_CHG_USB_SDP))
+		*value = POWER_SUPPLY_USB_TYPE_SDP;
+	if (extcon_get_state(priv->extcon, EXTCON_CHG_USB_DCP))
+		*value = POWER_SUPPLY_USB_TYPE_DCP;
+	else
+		*value = POWER_SUPPLY_USB_TYPE_UNKNOWN;
+}
+
+static int s2mu005_chgr_get_property(struct power_supply *psy,
+				     enum power_supply_property psp,
+				     union power_supply_propval *val)
+{
+	struct s2m_chgr *priv = power_supply_get_drvdata(psy);
+	int ret = 0;
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_ONLINE:
+		ret = s2mu005_chgr_get_online(priv, &val->intval);
+		break;
+	case POWER_SUPPLY_PROP_USB_TYPE:
+		s2mu005_chgr_get_usb_type(priv, &val->intval);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return ret;
+}
+
+static int s2mu005_chgr_mode_set_host(struct s2m_chgr *priv)
+{
+	int ret;
+
+	/* set mode to OTG */
+	ret = regmap_update_bits(priv->regmap, S2MU005_REG_CHGR_CTRL0,
+				 S2MU005_CHGR_OP_MODE,
+				 FIELD_PREP(S2MU005_CHGR_OP_MODE,
+					    S2MU005_CHGR_OP_MODE_OTG));
+	if (ret < 0) {
+		dev_err(priv->dev, "failed to set OTG mode (%d)\n", ret);
+		return ret;
+	}
+
+	/* set boost frequency to 2MHz */
+	ret = regmap_update_bits(priv->regmap, S2MU005_REG_CHGR_CTRL11,
+				 S2MU005_CHGR_OSC_BOOST,
+				 FIELD_PREP(S2MU005_CHGR_OSC_BOOST,
+					    S2MU005_CHGR_OSC_BOOST_2MHZ));
+	if (ret < 0) {
+		dev_err(priv->dev, "failed to set boost frequency (%d)\n", ret);
+		return ret;
+	}
+
+	/* set OTG current limit to 1.5 A */
+	ret = regmap_update_bits(priv->regmap, S2MU005_REG_CHGR_CTRL4,
+				 S2MU005_CHGR_OTG_OCP,
+				 FIELD_PREP(S2MU005_CHGR_OTG_OCP,
+					    S2MU005_CHGR_OTG_OCP_1P5A));
+	if (ret < 0) {
+		dev_err(priv->dev, "failed to set OTG current limit (%d)\n", ret);
+		return ret;
+	}
+
+	/* VBUS switches are OFF when OTG over-current happens */
+	ret = regmap_set_bits(priv->regmap, S2MU005_REG_CHGR_CTRL4,
+			      S2MU005_CHGR_OTG_OCP_OFF);
+	if (ret < 0) {
+		dev_err(priv->dev, "failed to set OTG OCP switch (%d)\n", ret);
+		return ret;
+	}
+
+	/* set OTG voltage to 5.1 V */
+	ret = regmap_update_bits(priv->regmap, S2MU005_REG_CHGR_CTRL5,
+				 S2MU005_CHGR_VMID_BOOST,
+				 FIELD_PREP(S2MU005_CHGR_VMID_BOOST,
+					    S2MU005_CHGR_VMID_BOOST_5P1V));
+	if (ret < 0) {
+		dev_err(priv->dev, "failed to set OTG voltage (%d)\n", ret);
+		return ret;
+	}
+
+	/* turn on OTG */
+	ret = regmap_update_bits(priv->regmap, S2MU005_REG_CHGR_CTRL15,
+				 S2MU005_CHGR_OTG_EN,
+				 FIELD_PREP(S2MU005_CHGR_OTG_EN,
+					    S2MU005_CHGR_OTG_EN_ON));
+	if (ret < 0)
+		dev_err(priv->dev, "failed to turn on OTG (%d)\n", ret);
+	return ret;
+}
+
+static int s2mu005_chgr_mode_set_charger(struct s2m_chgr *priv)
+{
+	int ret;
+
+	/* first reset to mode 0 */
+	ret = regmap_clear_bits(priv->regmap, S2MU005_REG_CHGR_CTRL0,
+				S2MU005_CHGR_OP_MODE);
+	if (ret < 0) {
+		dev_err(priv->dev, "failed to reset opmode (%d)\n", ret);
+		return ret;
+	}
+
+	/* wait for the charger to settle before switching to charging mode */
+	msleep(50);
+	/* then set to charging mode */
+	ret = regmap_update_bits(priv->regmap, S2MU005_REG_CHGR_CTRL0,
+				 S2MU005_CHGR_OP_MODE,
+				 FIELD_PREP(S2MU005_CHGR_OP_MODE,
+					    S2MU005_CHGR_OP_MODE_CHG));
+	if (ret < 0)
+		dev_err(priv->dev, "failed to set opmode to charging (%d)\n", ret);
+		return ret;
+}
+
+static int s2mu005_chgr_mode_unset(struct s2m_chgr *priv)
+{
+	int ret;
+
+	/* turn off OTG */
+	ret = regmap_clear_bits(priv->regmap, S2MU005_REG_CHGR_CTRL15,
+				S2MU005_CHGR_OTG_EN);
+	if (ret < 0) {
+		dev_err(priv->dev, "failed to turn off OTG (%d)\n", ret);
+		return ret;
+	}
+
+	/* reset operation mode */
+	ret = regmap_clear_bits(priv->regmap, S2MU005_REG_CHGR_CTRL0,
+				S2MU005_CHGR_OP_MODE);
+	if (ret < 0)
+		dev_err(priv->dev, "failed to reset opmode (%d)\n", ret);
+	return ret;
+}
+
+static void s2mu005_chgr_extcon_work(struct work_struct *work)
+{
+	struct s2m_chgr *priv = container_of(work, struct s2m_chgr, extcon_work);
+
+	if (extcon_get_state(priv->extcon, EXTCON_USB_HOST))
+		s2mu005_chgr_mode_set_host(priv);
+	else if (extcon_get_state(priv->extcon, EXTCON_USB))
+		s2mu005_chgr_mode_set_charger(priv);
+	else
+		s2mu005_chgr_mode_unset(priv);
+
+	power_supply_changed(priv->psy);
+}
+
+static const enum power_supply_property s2mu005_chgr_properties[] = {
+	POWER_SUPPLY_PROP_ONLINE,
+	POWER_SUPPLY_PROP_USB_TYPE,
+};
+
+static const struct power_supply_desc s2mu005_chgr_psy_desc = {
+	.name = "s2mu005-charger",
+	.type = POWER_SUPPLY_TYPE_USB,
+	.properties = s2mu005_chgr_properties,
+	.num_properties = ARRAY_SIZE(s2mu005_chgr_properties),
+	.get_property = s2mu005_chgr_get_property,
+	.usb_types = BIT(POWER_SUPPLY_USB_TYPE_CDP) |
+		     BIT(POWER_SUPPLY_USB_TYPE_SDP) |
+		     BIT(POWER_SUPPLY_USB_TYPE_DCP) |
+		     BIT(POWER_SUPPLY_USB_TYPE_UNKNOWN),
+};
+
+static int s2m_chgr_extcon_notifier(struct notifier_block *nb,
+					unsigned long event, void *param)
+{
+	struct s2m_chgr *priv = container_of(nb, struct s2m_chgr, extcon_nb);
+
+	schedule_work(&priv->extcon_work);
+
+	return NOTIFY_OK;
+}
+
+static int s2m_chgr_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct sec_pmic_dev *pmic_drvdata = dev_get_drvdata(dev->parent);
+	struct s2m_chgr *priv;
+	struct device_node *extcon_node __free(device_node) = NULL;
+	struct power_supply_config psy_cfg = {};
+	const struct power_supply_desc *psy_desc;
+	work_func_t extcon_work_func;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+	priv->dev = dev;
+	priv->regmap = pmic_drvdata->regmap_pmic;
+
+	switch (platform_get_device_id(pdev)->driver_data) {
+	case S2MU005:
+		psy_desc = &s2mu005_chgr_psy_desc;
+		extcon_work_func = s2mu005_chgr_extcon_work;
+		break;
+	default:
+		return dev_err_probe(dev, -ENODEV,
+				     "device type %d is not supported by driver\n",
+				     pmic_drvdata->device_type);
+	}
+
+	psy_cfg.drv_data = priv;
+	psy_cfg.fwnode = dev_fwnode(dev->parent);
+	priv->psy = devm_power_supply_register(dev, psy_desc, &psy_cfg);
+	if (IS_ERR(priv->psy))
+		return dev_err_probe(dev, PTR_ERR(priv->psy),
+				     "failed to register power supply subsystem\n");
+
+	/* MUIC is mandatory. If unavailable, request probe deferral */
+	extcon_node = of_get_child_by_name(dev->parent->of_node, "muic");
+	priv->extcon = extcon_find_edev_by_node(extcon_node);
+	if (IS_ERR(priv->extcon))
+		return -EPROBE_DEFER;
+
+	ret = devm_work_autocancel(dev, &priv->extcon_work, extcon_work_func);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to initialize extcon work\n");
+
+	priv->extcon_nb.notifier_call = s2m_chgr_extcon_notifier;
+	ret = devm_extcon_register_notifier_all(dev, priv->extcon, &priv->extcon_nb);
+	if (ret)
+		dev_err_probe(dev, ret, "failed to register extcon notifier\n");
+
+	return 0;
+}
+
+static const struct platform_device_id s2m_chgr_id_table[] = {
+	{ "s2mu005-charger", S2MU005 },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(platform, s2m_chgr_id_table);
+
+static struct platform_driver s2m_chgr_driver = {
+	.driver = {
+		.name = "s2m-charger",
+	},
+	.probe = s2m_chgr_probe,
+	.id_table = s2m_chgr_id_table,
+};
+module_platform_driver(s2m_chgr_driver);
+
+MODULE_DESCRIPTION("Battery Charger Driver For Samsung S2M Series PMICs");
+MODULE_AUTHOR("Kaustabh Chakraborty <kauschluss@disroot.org>");
+MODULE_AUTHOR("Łukasz Lebiedziński <kernel@lvkasz.us>");
+MODULE_LICENSE("GPL");

-- 
2.53.0


