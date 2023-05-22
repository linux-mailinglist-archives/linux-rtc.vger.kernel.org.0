Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7971670B9E2
	for <lists+linux-rtc@lfdr.de>; Mon, 22 May 2023 12:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232775AbjEVKTh (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 22 May 2023 06:19:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231979AbjEVKTa (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 22 May 2023 06:19:30 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EFC38C5;
        Mon, 22 May 2023 03:19:25 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.00,184,1681138800"; 
   d="scan'208";a="163778359"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 22 May 2023 19:19:25 +0900
Received: from localhost.localdomain (unknown [10.226.93.9])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 862B5400A10B;
        Mon, 22 May 2023 19:19:23 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-rtc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 07/11] rtc: isl1208: Add isl1208_set_xtoscb()
Date:   Mon, 22 May 2023 11:18:45 +0100
Message-Id: <20230522101849.297499-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230522101849.297499-1-biju.das.jz@bp.renesas.com>
References: <20230522101849.297499-1-biju.das.jz@bp.renesas.com>
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

As per the HW manual, set the XTOSCB bit as follows:

If using an external clock signal, set the XTOSCB bit as 1 to
disable the crystal oscillator.

If using an external crystal, the XTOSCB bit needs to be set at 0
to enable the crystal oscillator.

Add isl1208_set_xtoscb() to set XTOSCB bit based on the clock-names
property. Fallback is enabling the internal crystal oscillator.

While at it, introduce a variable "sr" for reading the status register
in probe() as it is reused for writing.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * Fixed the typo in commit description.
 * Replaced the variable int_osc_en->xtosb_val for isl1208_set_xtoscb() and
   changed the data type from bool->u8.
 * Replaced devm_clk_get->devm_clk_get_optional() in probe.
 * IS_ERR() related error is propagated and check for NULL to find out
   if a clock is present.
v4:
 * New patch.
---
 drivers/rtc/rtc-isl1208.c | 42 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 37 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-isl1208.c b/drivers/rtc/rtc-isl1208.c
index d42615fcdd9f..6ca977595977 100644
--- a/drivers/rtc/rtc-isl1208.c
+++ b/drivers/rtc/rtc-isl1208.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/bcd.h>
+#include <linux/clk.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
@@ -175,6 +176,16 @@ isl1208_i2c_validate_client(struct i2c_client *client)
 	return 0;
 }
 
+static int isl1208_set_xtoscb(struct i2c_client *client, int sr, u8 xtosb_val)
+{
+	if (xtosb_val)
+		sr &= ~ISL1208_REG_SR_XTOSCB;
+	else
+		sr |= ISL1208_REG_SR_XTOSCB;
+
+	return i2c_smbus_write_byte_data(client, ISL1208_REG_SR, sr);
+}
+
 static int
 isl1208_i2c_get_sr(struct i2c_client *client)
 {
@@ -808,9 +819,13 @@ static int isl1208_setup_irq(struct i2c_client *client, int irq)
 static int
 isl1208_probe(struct i2c_client *client)
 {
-	int rc = 0;
 	struct isl1208_state *isl1208;
 	int evdet_irq = -1;
+	struct clk *clkin;
+	u8 xtosb_val = 1;
+	struct clk *xin;
+	int rc = 0;
+	int sr;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
 		return -ENODEV;
@@ -837,6 +852,19 @@ isl1208_probe(struct i2c_client *client)
 		isl1208->config = (struct isl1208_config *)id->driver_data;
 	}
 
+	xin = devm_clk_get_optional(&client->dev, "xin");
+	if (IS_ERR(xin))
+		return PTR_ERR(xin);
+
+	if (!xin) {
+		clkin = devm_clk_get_optional(&client->dev, "clkin");
+		if (IS_ERR(clkin))
+			return PTR_ERR(clkin);
+
+		if (clkin)
+			xtosb_val = 0;
+	}
+
 	isl1208->rtc = devm_rtc_allocate_device(&client->dev);
 	if (IS_ERR(isl1208->rtc))
 		return PTR_ERR(isl1208->rtc);
@@ -848,13 +876,17 @@ isl1208_probe(struct i2c_client *client)
 	isl1208->nvmem_config.size = isl1208->config->nvmem_length;
 	isl1208->nvmem_config.priv = isl1208;
 
-	rc = isl1208_i2c_get_sr(client);
-	if (rc < 0) {
+	sr = isl1208_i2c_get_sr(client);
+	if (sr < 0) {
 		dev_err(&client->dev, "reading status failed\n");
-		return rc;
+		return sr;
 	}
 
-	if (rc & ISL1208_REG_SR_RTCF)
+	rc = isl1208_set_xtoscb(client, sr, xtosb_val);
+	if (rc)
+		return rc;
+
+	if (sr & ISL1208_REG_SR_RTCF)
 		dev_warn(&client->dev, "rtc power failure detected, "
 			 "please set clock.\n");
 
-- 
2.25.1

