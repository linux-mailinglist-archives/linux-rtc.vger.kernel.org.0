Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03FAC70184F
	for <lists+linux-rtc@lfdr.de>; Sat, 13 May 2023 18:52:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbjEMQwy (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 13 May 2023 12:52:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230369AbjEMQwx (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 13 May 2023 12:52:53 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E60113A86;
        Sat, 13 May 2023 09:52:48 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.99,272,1677510000"; 
   d="scan'208";a="162745876"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 14 May 2023 01:52:48 +0900
Received: from localhost.localdomain (unknown [10.226.92.8])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7BEDF40062D0;
        Sun, 14 May 2023 01:52:45 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Lee Jones <lee@kernel.org>, linux-rtc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH v3 2/5] rtc: isl1208: Add support for the built-in RTC on the PMIC RAA215300
Date:   Sat, 13 May 2023 17:52:24 +0100
Message-Id: <20230513165227.13117-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230513165227.13117-1-biju.das.jz@bp.renesas.com>
References: <20230513165227.13117-1-biju.das.jz@bp.renesas.com>
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
0x11. The PMIC driver detects PMIC version and instantiate appropriate
RTC device based on i2c_device_id.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * RTC device is instantiated by PMIC driver and dropped isl1208_probe_helper().
 * Added "TYPE_RAA215300_RTC_A0" to handle inverted oscillator bit case.
RFC->v2:
 * Dropped compatible "renesas,raa215300-isl1208" and "renesas,raa215300-pmic" property.
 * Updated the comment polarity->bit for External Oscillator.
 * Added raa215300_rtc_probe_helper() for registering raa215300_rtc device and
   added the helper function isl1208_probe_helper() to share the code.
---
 drivers/rtc/rtc-isl1208.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/rtc/rtc-isl1208.c b/drivers/rtc/rtc-isl1208.c
index 73cc6aaf9b8b..d6425780d834 100644
--- a/drivers/rtc/rtc-isl1208.c
+++ b/drivers/rtc/rtc-isl1208.c
@@ -74,6 +74,7 @@ enum isl1208_id {
 	TYPE_ISL1209,
 	TYPE_ISL1218,
 	TYPE_ISL1219,
+	TYPE_RAA215300_RTC_A0,
 	ISL_LAST_ID
 };
 
@@ -83,11 +84,13 @@ static const struct isl1208_config {
 	unsigned int	nvmem_length;
 	unsigned	has_tamper:1;
 	unsigned	has_timestamp:1;
+	unsigned	has_inverted_osc_bit:1;
 } isl1208_configs[] = {
 	[TYPE_ISL1208] = { "isl1208", 2, false, false },
 	[TYPE_ISL1209] = { "isl1209", 2, true,  false },
 	[TYPE_ISL1218] = { "isl1218", 8, false, false },
 	[TYPE_ISL1219] = { "isl1219", 2, true,  true },
+	[TYPE_RAA215300_RTC_A0] = { "rtc_a0", 2, false, false, true },
 };
 
 static const struct i2c_device_id isl1208_id[] = {
@@ -95,6 +98,7 @@ static const struct i2c_device_id isl1208_id[] = {
 	{ "isl1209", TYPE_ISL1209 },
 	{ "isl1218", TYPE_ISL1218 },
 	{ "isl1219", TYPE_ISL1219 },
+	{ "rtc_a0", TYPE_RAA215300_RTC_A0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, isl1208_id);
@@ -166,6 +170,16 @@ isl1208_i2c_validate_client(struct i2c_client *client)
 	return 0;
 }
 
+static int
+isl1208_set_external_oscillator(struct i2c_client *client, int rc,
+				bool is_inverted_oscillator_bit)
+{
+	if (is_inverted_oscillator_bit)
+		rc |= ISL1208_REG_SR_XTOSCB;
+
+	return i2c_smbus_write_byte_data(client, ISL1208_REG_SR, rc);
+}
+
 static int
 isl1208_i2c_get_sr(struct i2c_client *client)
 {
@@ -845,6 +859,13 @@ isl1208_probe(struct i2c_client *client)
 		return rc;
 	}
 
+	if (isl1208->config->has_inverted_osc_bit) {
+		rc = isl1208_set_external_oscillator(client, rc,
+						     isl1208->config->has_inverted_osc_bit);
+		if (rc)
+			return rc;
+	}
+
 	if (rc & ISL1208_REG_SR_RTCF)
 		dev_warn(&client->dev, "rtc power failure detected, "
 			 "please set clock.\n");
-- 
2.25.1

