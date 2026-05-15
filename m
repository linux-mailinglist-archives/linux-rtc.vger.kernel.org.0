Return-Path: <linux-rtc+bounces-6532-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MG0GG3uUB2pR9gIAu9opvQ
	(envelope-from <linux-rtc+bounces-6532-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 15 May 2026 23:47:39 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5E85586C9
	for <lists+linux-rtc@lfdr.de>; Fri, 15 May 2026 23:47:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5505930A17CC
	for <lists+linux-rtc@lfdr.de>; Fri, 15 May 2026 21:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD44B3EFFBD;
	Fri, 15 May 2026 21:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="jLvNQsk3"
X-Original-To: linux-rtc@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06523EDACD;
	Fri, 15 May 2026 21:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778881250; cv=none; b=miHE+4ScJcbFviGBc6gIsb2iPDLjZNxdx7gIFfVGd12nVARAMHJXMZvgdcN+xckHMMYS2hJPeIH8dJvCRTrAE2YPI4s8Joj6W+9VcabMdvqIuMUaoV2tLIoSp0RtX3MksiMq9JftKjpVSrIJsf+yzLggjZVighG+WQTCALswskc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778881250; c=relaxed/simple;
	bh=8JrnFI7Vl3CJ1BNRgrQrlFdwognOikguFtI62Ej8OLM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V9fN7O1XfASgnX3FveEl/CQdCQP3CHVWXjCBE7Jhy06nidJ2WniL2qN9DxjpnBqPlAbWnhVuce55zxy17+N3D9YlvX/+byWGJIZas8AiGakTUBzOW0bftPmcIqXXCHwujbvQ65VZxU0muBU6EifhA9/V2sYcHfau6ZJMtUbYTnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=jLvNQsk3; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 855212686F;
	Fri, 15 May 2026 23:40:47 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jp5F3DuGfee1; Fri, 15 May 2026 23:40:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1778881246; bh=8JrnFI7Vl3CJ1BNRgrQrlFdwognOikguFtI62Ej8OLM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=jLvNQsk318F1A8UeneCSqL4VTlKpE+Z4ePdrK4QRQ/+OwqcGLVJeRvVcpDahZSXhG
	 oE533eJ0Pac0cpQvebaKk7I8Wz46ZYKdvaOX4yoiGChAEXC9fDwp/mOo+tmwPIReWN
	 Emrrmr4wAS5XcKYNOa5cAjJgRDcOzCg3jSKuv8tQTMzAgaxpnoLcQeh/EEOJ0w8efO
	 +JOOOygqpOa2nkysGbfHbicztuKERhChAseEabbLtd9wX05WBUBkRozoJDkgOykcz9
	 PchE7e1qvps1lQ8SyVJRJ51jFZaNO8wcKFLe5baXR1zZ0S4iwAOU+ie7O+lB9qlAmj
	 /OcyM2fyfKkqQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sat, 16 May 2026 03:08:42 +0530
Subject: [PATCH v7 10/10] power: supply: add support for Samsung S2M series
 PMIC charger device
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260516-s2mu005-pmic-v7-10-73f9702fb461@disroot.org>
References: <20260516-s2mu005-pmic-v7-0-73f9702fb461@disroot.org>
In-Reply-To: <20260516-s2mu005-pmic-v7-0-73f9702fb461@disroot.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Sebastian Reichel <sre@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Nam Tran <trannamatk@gmail.com>, 
 =?utf-8?q?=C5=81ukasz_Lebiedzi=C5=84ski?= <kernel@lvkasz.us>, 
 Yassine Oudjana <y.oudjana@protonmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-doc@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Rspamd-Queue-Id: DD5E85586C9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6532-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,samsung.com,linaro.org,bootlin.com,lwn.net,linuxfoundation.org,gmail.com,lvkasz.us,protonmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
 drivers/power/supply/Kconfig       |  10 ++
 drivers/power/supply/Makefile      |   1 +
 drivers/power/supply/s2m-charger.c | 313 +++++++++++++++++++++++++++++++++++++
 3 files changed, 324 insertions(+)

diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfig
index 83392ed6a8da9..899c929f31620 100644
--- a/drivers/power/supply/Kconfig
+++ b/drivers/power/supply/Kconfig
@@ -856,6 +856,16 @@ config CHARGER_RK817
 	help
 	  Say Y to include support for Rockchip RK817 Battery Charger.
 
+config CHARGER_S2M
+	tristate "Samsung S2M series PMIC battery charger support"
+	depends on EXTCON_S2M
+	depends on MFD_SEC_CORE
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
index 0000000000000..4d1f2c2c71446
--- /dev/null
+++ b/drivers/power/supply/s2m-charger.c
@@ -0,0 +1,313 @@
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
+	int ret;
+
+	ret = regmap_read(priv->regmap, S2MU005_REG_CHGR_STATUS0, &val);
+	if (ret) {
+		dev_err(priv->dev, "failed to read register (%d)\n", ret);
+		return ret;
+	}
+
+	*value = !!(val & S2MU005_CHGR_CHG);
+
+	return 0;
+}
+
+static void s2mu005_chgr_get_usb_type(struct s2m_chgr *priv, int *value)
+{
+	if (extcon_get_state(priv->extcon, EXTCON_CHG_USB_CDP) > 0)
+		*value = POWER_SUPPLY_USB_TYPE_CDP;
+	else if (extcon_get_state(priv->extcon, EXTCON_CHG_USB_SDP) > 0)
+		*value = POWER_SUPPLY_USB_TYPE_SDP;
+	else if (extcon_get_state(priv->extcon, EXTCON_CHG_USB_DCP) > 0)
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
+	int ret;
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_ONLINE:
+		ret = s2mu005_chgr_get_online(priv, &val->intval);
+		if (ret)
+			return ret;
+		break;
+	case POWER_SUPPLY_PROP_USB_TYPE:
+		s2mu005_chgr_get_usb_type(priv, &val->intval);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
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
+	if (ret) {
+		dev_err(priv->dev, "failed to set OTG mode (%d)\n", ret);
+		return ret;
+	}
+
+	/* set boost frequency to 2MHz */
+	ret = regmap_update_bits(priv->regmap, S2MU005_REG_CHGR_CTRL11,
+				 S2MU005_CHGR_OSC_BOOST,
+				 FIELD_PREP(S2MU005_CHGR_OSC_BOOST,
+					    S2MU005_CHGR_OSC_BOOST_2MHZ));
+	if (ret) {
+		dev_err(priv->dev, "failed to set boost frequency (%d)\n", ret);
+		return ret;
+	}
+
+	/* set OTG current limit to 1.5 A */
+	ret = regmap_update_bits(priv->regmap, S2MU005_REG_CHGR_CTRL4,
+				 S2MU005_CHGR_OTG_OCP,
+				 FIELD_PREP(S2MU005_CHGR_OTG_OCP,
+					    S2MU005_CHGR_OTG_OCP_1P5A));
+	if (ret) {
+		dev_err(priv->dev, "failed to set OTG current limit (%d)\n", ret);
+		return ret;
+	}
+
+	/* VBUS switches are OFF when OTG over-current happens */
+	ret = regmap_set_bits(priv->regmap, S2MU005_REG_CHGR_CTRL4,
+			      S2MU005_CHGR_OTG_OCP_OFF);
+	if (ret) {
+		dev_err(priv->dev, "failed to set OTG OCP switch (%d)\n", ret);
+		return ret;
+	}
+
+	/* set OTG voltage to 5.1 V */
+	ret = regmap_update_bits(priv->regmap, S2MU005_REG_CHGR_CTRL5,
+				 S2MU005_CHGR_VMID_BOOST,
+				 FIELD_PREP(S2MU005_CHGR_VMID_BOOST,
+					    S2MU005_CHGR_VMID_BOOST_5P1V));
+	if (ret) {
+		dev_err(priv->dev, "failed to set OTG voltage (%d)\n", ret);
+		return ret;
+	}
+
+	/* turn on OTG */
+	ret = regmap_update_bits(priv->regmap, S2MU005_REG_CHGR_CTRL15,
+				 S2MU005_CHGR_OTG_EN,
+				 FIELD_PREP(S2MU005_CHGR_OTG_EN,
+					    S2MU005_CHGR_OTG_EN_ON));
+	if (ret) {
+		dev_err(priv->dev, "failed to turn on OTG (%d)\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int s2mu005_chgr_mode_set_charger(struct s2m_chgr *priv)
+{
+	int ret;
+
+	/* first reset to mode 0 */
+	ret = regmap_clear_bits(priv->regmap, S2MU005_REG_CHGR_CTRL0,
+				S2MU005_CHGR_OP_MODE);
+	if (ret) {
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
+	if (ret) {
+		dev_err(priv->dev, "failed to set opmode to charging (%d)\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int s2mu005_chgr_mode_unset(struct s2m_chgr *priv)
+{
+	int ret;
+
+	/* turn off OTG */
+	ret = regmap_clear_bits(priv->regmap, S2MU005_REG_CHGR_CTRL15,
+				S2MU005_CHGR_OTG_EN);
+	if (ret) {
+		dev_err(priv->dev, "failed to turn off OTG (%d)\n", ret);
+		return ret;
+	}
+
+	/* reset operation mode */
+	ret = regmap_clear_bits(priv->regmap, S2MU005_REG_CHGR_CTRL0,
+				S2MU005_CHGR_OP_MODE);
+	if (ret) {
+		dev_err(priv->dev, "failed to reset opmode (%d)\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void s2mu005_chgr_extcon_work(struct work_struct *work)
+{
+	struct s2m_chgr *priv = container_of(work, struct s2m_chgr, extcon_work);
+
+	if (extcon_get_state(priv->extcon, EXTCON_USB_HOST) > 0)
+		s2mu005_chgr_mode_set_host(priv);
+	else if (extcon_get_state(priv->extcon, EXTCON_USB) > 0)
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
+	/* MUIC is mandatory. If unavailable, request probe deferral */
+	extcon_node = of_get_child_by_name(dev->parent->of_node, "muic");
+	if (!extcon_node)
+		return dev_err_probe(dev, -ENODEV, "MUIC node required but not found\n");
+
+	priv->extcon = extcon_find_edev_by_node(extcon_node);
+	if (IS_ERR(priv->extcon))
+		return -EPROBE_DEFER;
+
+	psy_cfg.drv_data = priv;
+	psy_cfg.fwnode = dev_fwnode(dev->parent);
+	priv->psy = devm_power_supply_register(dev, psy_desc, &psy_cfg);
+	if (IS_ERR(priv->psy))
+		return dev_err_probe(dev, PTR_ERR(priv->psy),
+				     "failed to register power supply subsystem\n");
+
+	ret = devm_work_autocancel(dev, &priv->extcon_work, extcon_work_func);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to initialize extcon work\n");
+
+	priv->extcon_nb.notifier_call = s2m_chgr_extcon_notifier;
+	ret = devm_extcon_register_notifier_all(dev, priv->extcon, &priv->extcon_nb);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register extcon notifier\n");
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


