Return-Path: <linux-rtc+bounces-6329-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KE5ZKzbh3WnrkgkAu9opvQ
	(envelope-from <linux-rtc+bounces-6329-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Apr 2026 08:39:50 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E834E3F623B
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Apr 2026 08:39:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2312630776B1
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Apr 2026 06:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB4AB36EAAB;
	Tue, 14 Apr 2026 06:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="KtyhWiPJ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E17836EA82;
	Tue, 14 Apr 2026 06:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776148483; cv=none; b=byv/ZJ32Fs40APIZmb5IEDZqC0Mvuij9SvSO3xiswSHEMhNaA/kITdqDAtUwymgS5K4N8eh08aDe0HJ23KMMOQL5H7lRxrYKzEVlSK0+Vj6LnjBUNzVrNoUePkXnaFKIGS7wXDhtW0blEGlArQ5Lt7TOVvLmbHblKes3/BO5OWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776148483; c=relaxed/simple;
	bh=0c6lfJuH7ZJGsVDLlmGmYTAoyFwCX6EtPs7P4iHdSsU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TW91BbuRx7e1XjWW7prpRFiNdHUNu/xYaXqqLsZpy9JfChmH8tGFCHp+JEvw0XBk5AM3SgmNFJUcVvJ2f55yXyTOOtEh5aggEp5V5E94AbpIif8yWWCF6GCLRDU8TxpSGGqQuWU+0M+EzUN4RH1LnCFJT5EiR8ued3PBaeRA9Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=KtyhWiPJ; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 9E94825D82;
	Tue, 14 Apr 2026 08:34:40 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w0t6YYEf_u20; Tue, 14 Apr 2026 08:34:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1776148479; bh=0c6lfJuH7ZJGsVDLlmGmYTAoyFwCX6EtPs7P4iHdSsU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KtyhWiPJ8uLlZkBvVIku/Ayzhv6AJtTSY5D8SqeYjRHUgIi6ataMjyUA2ccEXQ9a+
	 tpwgko2RKbxms04APMltNmj7ZZLtynrCB1YENuyQ5pfvOX5YJuRi6bv05kVIschaL2
	 ko6J8LnLJJNhgkGaRKSa+x0Kc7z2D53RqR1ssitR3AoK1UhWVhZ+lhhyjDkIb7HaFf
	 hT6zAo5Bdob8gSJIU2LM2iqpu59J4mHBzZYZl4lfkNw2YnwgU3mlOgub/pBDAQLHej
	 ZEIV/7K2WNUDVHrrwpmAk7rntJLLors0Fwn93/YPIdHVesIjFDtkif0JjKOT/tFVfX
	 Tf47y99Mu8HIg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 14 Apr 2026 12:03:05 +0530
Subject: [PATCH v4 13/13] power: supply: add support for Samsung S2M series
 PMIC charger device
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260414-s2mu005-pmic-v4-13-7fe7480577e6@disroot.org>
References: <20260414-s2mu005-pmic-v4-0-7fe7480577e6@disroot.org>
In-Reply-To: <20260414-s2mu005-pmic-v4-0-7fe7480577e6@disroot.org>
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6329-lists,linux-rtc=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,samsung.com,linaro.org,bootlin.com,lwn.net,linuxfoundation.org,gmail.com,lvkasz.us];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kauschluss@disroot.org,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[disroot.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lvkasz.us:email,disroot.org:dkim,disroot.org:email,disroot.org:mid]
X-Rspamd-Queue-Id: E834E3F623B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a driver for charger controllers found in certain Samsung S2M series
PMICs. The driver has very basic support for the device, with only
charger online reporting working, and USB 2.0 device negotiations
working.

The driver includes initial support for the S2MU005 PMIC charger.

Co-developed-by: Łukasz Lebiedziński <kernel@lvkasz.us>
Signed-off-by: Łukasz Lebiedziński <kernel@lvkasz.us>
Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/power/supply/Kconfig        |  11 ++
 drivers/power/supply/Makefile       |   1 +
 drivers/power/supply/s2m-charger.c  | 300 ++++++++++++++++++++++++++++++++++++
 include/linux/mfd/samsung/s2mu005.h |   5 +
 4 files changed, 317 insertions(+)

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
index 0000000000000..8836943f14faa
--- /dev/null
+++ b/drivers/power/supply/s2m-charger.c
@@ -0,0 +1,300 @@
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
+	struct s2m_chgr *priv = container_of(work, struct s2m_chgr,
+						 extcon_work);
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
+};
+
+static const struct power_supply_desc s2mu005_chgr_psy_desc = {
+	.name = "s2mu005-charger",
+	.type = POWER_SUPPLY_TYPE_USB,
+	.properties = s2mu005_chgr_properties,
+	.num_properties = ARRAY_SIZE(s2mu005_chgr_properties),
+	.get_property = s2mu005_chgr_get_property,
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
+	priv->psy = devm_power_supply_register(dev, psy_desc, &psy_cfg);
+	if (IS_ERR(priv->psy))
+		return dev_err_probe(dev, PTR_ERR(priv->psy),
+				     "failed to register power supply subsystem\n");
+
+	/* MUIC is mandatory. If unavailable, request probe deferral */
+	if (!of_graph_is_present(dev->of_node))
+		return -ENODEV;
+	extcon_node = of_graph_get_remote_node(dev->of_node, 0, 0);
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
+/*
+ * Device is instantiated through parent MFD device and device matching
+ * is done through platform_device_id.
+ *
+ * However if device's DT node contains proper compatible and driver is
+ * built as a module, then the *module* matching will be done through DT
+ * aliases. This requires of_device_id table. In the same time this will
+ * not change the actual *device* matching so do not add .of_match_table.
+ */
+static const struct of_device_id s2m_chgr_of_match_table[] = {
+	{
+		.compatible = "samsung,s2mu005-charger",
+		.data = (void *)S2MU005,
+	}, {
+		/* sentinel */
+	},
+};
+MODULE_DEVICE_TABLE(of, s2m_chgr_of_match_table);
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
diff --git a/include/linux/mfd/samsung/s2mu005.h b/include/linux/mfd/samsung/s2mu005.h
index 07f4ae664950d..00b5450cf1c60 100644
--- a/include/linux/mfd/samsung/s2mu005.h
+++ b/include/linux/mfd/samsung/s2mu005.h
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2015 Samsung Electronics Co., Ltd
  * Copyright (c) 2025 Kaustabh Chakraborty <kauschluss@disroot.org>
+ * Copyright (c) 2026 Łukasz Lebiedziński <kernel@lvkasz.us>
  */
 
 #ifndef __LINUX_MFD_S2MU005_H
@@ -186,9 +187,11 @@ enum s2mu005_reg {
 #define S2MU005_CHGR_OTG_OCP_ON		BIT(5)
 #define S2MU005_CHGR_OTG_OCP_OFF	BIT(4)
 #define S2MU005_CHGR_OTG_OCP		GENMASK(3, 2)
+#define S2MU005_CHGR_OTG_OCP_1P5A	0x3
 
 /* S2MU005_REG_CHGR_CTRL5 */
 #define S2MU005_CHGR_VMID_BOOST		GENMASK(4, 0)
+#define S2MU005_CHGR_VMID_BOOST_5P1V	0x16
 
 /* S2MU005_REG_CHGR_CTRL6 */
 #define S2MU005_CHGR_COOL_CHG_CURR	GENMASK(5, 0)
@@ -205,6 +208,7 @@ enum s2mu005_reg {
 /* S2MU005_REG_CHGR_CTRL11 */
 #define S2MU005_CHGR_OSC_BOOST		GENMASK(6, 5)
 #define S2MU005_CHGR_OSC_BUCK		GENMASK(4, 3)
+#define S2MU005_CHGR_OSC_BOOST_2MHZ	0x3
 
 /* S2MU005_REG_CHGR_CTRL12 */
 #define S2MU005_CHGR_WDT		GENMASK(2, 0)
@@ -214,6 +218,7 @@ enum s2mu005_reg {
 
 /* S2MU005_REG_CHGR_CTRL15 */
 #define S2MU005_CHGR_OTG_EN		GENMASK(3, 2)
+#define S2MU005_CHGR_OTG_EN_ON		0x3
 
 /* S2MU005_REG_FLED_STATUS */
 #define S2MU005_FLED_FLASH_STATUS(x)	(BIT(7) >> 2 * (x))

-- 
2.53.0


