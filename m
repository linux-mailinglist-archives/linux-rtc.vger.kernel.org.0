Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F1656F5397
	for <lists+linux-rtc@lfdr.de>; Wed,  3 May 2023 10:46:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbjECIqg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 3 May 2023 04:46:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbjECIqf (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 3 May 2023 04:46:35 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 97BA240CF;
        Wed,  3 May 2023 01:46:34 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.99,246,1677510000"; 
   d="scan'208";a="158019849"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 03 May 2023 17:46:34 +0900
Received: from localhost.localdomain (unknown [10.226.92.153])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id D565341C6679;
        Wed,  3 May 2023 17:46:30 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Lee Jones <lee@kernel.org>, linux-rtc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH RFC 5/6] rtc: isl1208: Add support for the built-in RTC on the PMIC RAA215300
Date:   Wed,  3 May 2023 09:46:07 +0100
Message-Id: <20230503084608.14008-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230503084608.14008-1-biju.das.jz@bp.renesas.com>
References: <20230503084608.14008-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The built-in RTC found on PMIC RAA215300 is the same as ISL1208.
However, the external oscillator polarity is determined by the
PMIC version. For eg: the PMIC version has inverted polarity for
the external oscillator and the corresponding bit in RTC need to
be inverted(XTOSCB). This info needs to be shared from PMIC driver
to RTC driver, so that it can support all versions without any code
changes.

Add a new compatible renesas,raa215300-isl1208 to support RTC found
on PMIC RAA215300 and renesas,raa215300-pmic property to support
different versions.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/rtc/rtc-isl1208.c | 50 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/rtc/rtc-isl1208.c b/drivers/rtc/rtc-isl1208.c
index 73cc6aaf9b8b..f4ea19691ac1 100644
--- a/drivers/rtc/rtc-isl1208.c
+++ b/drivers/rtc/rtc-isl1208.c
@@ -74,6 +74,7 @@ enum isl1208_id {
 	TYPE_ISL1209,
 	TYPE_ISL1218,
 	TYPE_ISL1219,
+	TYPE_RAA215300_ISL1208,
 	ISL_LAST_ID
 };
 
@@ -83,11 +84,13 @@ static const struct isl1208_config {
 	unsigned int	nvmem_length;
 	unsigned	has_tamper:1;
 	unsigned	has_timestamp:1;
+	unsigned	has_pmic_parent:1;
 } isl1208_configs[] = {
 	[TYPE_ISL1208] = { "isl1208", 2, false, false },
 	[TYPE_ISL1209] = { "isl1209", 2, true,  false },
 	[TYPE_ISL1218] = { "isl1218", 8, false, false },
 	[TYPE_ISL1219] = { "isl1219", 2, true,  true },
+	[TYPE_RAA215300_ISL1208] = { "isl1208", 2, false, false, true },
 };
 
 static const struct i2c_device_id isl1208_id[] = {
@@ -104,6 +107,10 @@ static const __maybe_unused struct of_device_id isl1208_of_match[] = {
 	{ .compatible = "isil,isl1209", .data = &isl1208_configs[TYPE_ISL1209] },
 	{ .compatible = "isil,isl1218", .data = &isl1208_configs[TYPE_ISL1218] },
 	{ .compatible = "isil,isl1219", .data = &isl1208_configs[TYPE_ISL1219] },
+	{
+		.compatible = "renesas,raa215300-isl1208",
+		.data = &isl1208_configs[TYPE_RAA215300_ISL1208]
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, isl1208_of_match);
@@ -166,6 +173,43 @@ isl1208_i2c_validate_client(struct i2c_client *client)
 	return 0;
 }
 
+static bool isl1208_is_xtosc_polarity_inverted(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct i2c_client *pmic_dev;
+	unsigned int *pmic_version;
+	struct device_node *np;
+	bool ret = false;
+
+	np = of_parse_phandle(dev->of_node, "renesas,raa215300-pmic", 0);
+	if (np)
+		pmic_dev = of_find_i2c_device_by_node(np);
+
+	of_node_put(np);
+	if (!pmic_dev)
+		return ret;
+
+	pmic_version = dev_get_drvdata(&pmic_dev->dev);
+	/* External Oscillator polarity is inverted on revision 0x12 onwards */
+	if (*pmic_version >= 0x12)
+		ret = true;
+
+	put_device(&pmic_dev->dev);
+
+	return ret;
+}
+
+static int
+isl1208_set_ext_osc_based_on_pmic_version(struct i2c_client *client, int rc)
+{
+	if (isl1208_is_xtosc_polarity_inverted(client))
+		rc &= ~ISL1208_REG_SR_XTOSCB;
+	else
+		rc |= ISL1208_REG_SR_XTOSCB;
+
+	return i2c_smbus_write_byte_data(client, ISL1208_REG_SR, rc);
+}
+
 static int
 isl1208_i2c_get_sr(struct i2c_client *client)
 {
@@ -845,6 +889,12 @@ isl1208_probe(struct i2c_client *client)
 		return rc;
 	}
 
+	if (isl1208->config->has_pmic_parent) {
+		rc = isl1208_set_ext_osc_based_on_pmic_version(client, rc);
+		if (rc)
+			return rc;
+	}
+
 	if (rc & ISL1208_REG_SR_RTCF)
 		dev_warn(&client->dev, "rtc power failure detected, "
 			 "please set clock.\n");
-- 
2.25.1

