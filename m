Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D37426F878D
	for <lists+linux-rtc@lfdr.de>; Fri,  5 May 2023 19:25:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231920AbjEERZt (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 5 May 2023 13:25:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232493AbjEERZs (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 5 May 2023 13:25:48 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CA8AA1A13F;
        Fri,  5 May 2023 10:25:46 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.99,252,1677510000"; 
   d="scan'208";a="158275157"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 06 May 2023 02:25:46 +0900
Received: from localhost.localdomain (unknown [10.226.92.145])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id AB80A4073785;
        Sat,  6 May 2023 02:25:43 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Lee Jones <lee@kernel.org>, linux-rtc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH v2 3/5] rtc: isl1208: Add support for the built-in RTC on the PMIC RAA215300
Date:   Fri,  5 May 2023 18:25:28 +0100
Message-Id: <20230505172530.357455-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230505172530.357455-1-biju.das.jz@bp.renesas.com>
References: <20230505172530.357455-1-biju.das.jz@bp.renesas.com>
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
However, the external oscillator bit is inverted on PMIC version
0x12 and later. This info needs to be shared from the PMIC driver
to the RTC driver so that it can support all versions without any
code changes.

Add support for RTC found on PMIC RAA215300 by adding a helper
function for registering the RTC device.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
RFC->v2:
 * Dropped compatible "renesas,raa215300-isl1208" and "renesas,raa215300-pmic" property.
 * Updated the comment polarity->bit for External Oscillator.
 * Added raa215300_rtc_probe_helper() for registering raa215300_rtc device and
   added the helper function isl1208_probe_helper() to share the code.
---
 drivers/rtc/rtc-isl1208.c   | 61 ++++++++++++++++++++++++++++++-------
 include/linux/rtc/isl1208.h |  9 ++++++
 2 files changed, 59 insertions(+), 11 deletions(-)
 create mode 100644 include/linux/rtc/isl1208.h

diff --git a/drivers/rtc/rtc-isl1208.c b/drivers/rtc/rtc-isl1208.c
index 73cc6aaf9b8b..f2dc96d3e4e1 100644
--- a/drivers/rtc/rtc-isl1208.c
+++ b/drivers/rtc/rtc-isl1208.c
@@ -166,6 +166,19 @@ isl1208_i2c_validate_client(struct i2c_client *client)
 	return 0;
 }
 
+static int
+isl1208_set_ext_osc_based_on_pmic_version(struct i2c_client *client, int rc,
+					  unsigned int pmic_version)
+{
+	/* External Oscillator bit is inverted on revision 0x12 and later */
+	if (pmic_version >= 0x12)
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
@@ -797,7 +810,8 @@ static int isl1208_setup_irq(struct i2c_client *client, int irq)
 }
 
 static int
-isl1208_probe(struct i2c_client *client)
+isl1208_probe_helper(struct i2c_client *client, bool is_raa215300_rtc,
+		     unsigned int pmic_version)
 {
 	int rc = 0;
 	struct isl1208_state *isl1208;
@@ -815,17 +829,22 @@ isl1208_probe(struct i2c_client *client)
 		return -ENOMEM;
 	i2c_set_clientdata(client, isl1208);
 
-	/* Determine which chip we have */
-	if (client->dev.of_node) {
-		isl1208->config = of_device_get_match_data(&client->dev);
-		if (!isl1208->config)
-			return -ENODEV;
+	if (is_raa215300_rtc) {
+		isl1208->config = &isl1208_configs[TYPE_ISL1208];
 	} else {
-		const struct i2c_device_id *id = i2c_match_id(isl1208_id, client);
-
-		if (id->driver_data >= ISL_LAST_ID)
-			return -ENODEV;
-		isl1208->config = &isl1208_configs[id->driver_data];
+		/* Determine which chip we have */
+		if (client->dev.of_node) {
+			isl1208->config = of_device_get_match_data(&client->dev);
+			if (!isl1208->config)
+				return -ENODEV;
+		} else {
+			const struct i2c_device_id *id = i2c_match_id(isl1208_id,
+								      client);
+
+			if (id->driver_data >= ISL_LAST_ID)
+				return -ENODEV;
+			isl1208->config = &isl1208_configs[id->driver_data];
+		}
 	}
 
 	isl1208->rtc = devm_rtc_allocate_device(&client->dev);
@@ -845,6 +864,13 @@ isl1208_probe(struct i2c_client *client)
 		return rc;
 	}
 
+	if (is_raa215300_rtc) {
+		rc = isl1208_set_ext_osc_based_on_pmic_version(client, rc,
+							       pmic_version);
+		if (rc)
+			return rc;
+	}
+
 	if (rc & ISL1208_REG_SR_RTCF)
 		dev_warn(&client->dev, "rtc power failure detected, "
 			 "please set clock.\n");
@@ -903,6 +929,19 @@ isl1208_probe(struct i2c_client *client)
 	return devm_rtc_register_device(isl1208->rtc);
 }
 
+static int
+isl1208_probe(struct i2c_client *client)
+{
+	return isl1208_probe_helper(client, false, 0);
+}
+
+int
+raa215300_rtc_probe_helper(struct i2c_client *client, unsigned int pmic_version)
+{
+	return isl1208_probe_helper(client, true, pmic_version);
+}
+EXPORT_SYMBOL(raa215300_rtc_probe_helper);
+
 static struct i2c_driver isl1208_driver = {
 	.driver = {
 		.name = "rtc-isl1208",
diff --git a/include/linux/rtc/isl1208.h b/include/linux/rtc/isl1208.h
new file mode 100644
index 000000000000..1dee540f9ab4
--- /dev/null
+++ b/include/linux/rtc/isl1208.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _LINUX_ISL1208_H_
+#define _LINUX_ISL1208_H_
+
+int raa215300_rtc_probe_helper(struct i2c_client *client,
+			       unsigned int pmic_version);
+
+#endif /* _LINUX_ISL1208_H_ */
-- 
2.25.1

