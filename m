Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 700FE720461
	for <lists+linux-rtc@lfdr.de>; Fri,  2 Jun 2023 16:26:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235935AbjFBOZf (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 2 Jun 2023 10:25:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235973AbjFBOZL (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 2 Jun 2023 10:25:11 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3B7179F;
        Fri,  2 Jun 2023 07:25:10 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.00,213,1681138800"; 
   d="scan'208";a="165499023"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 02 Jun 2023 23:25:10 +0900
Received: from localhost.localdomain (unknown [10.226.93.55])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id CE66940065BD;
        Fri,  2 Jun 2023 23:25:07 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-rtc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v6 09/11] rtc: isl1208: Drop enum isl1208_id and split isl1208_configs[]
Date:   Fri,  2 Jun 2023 15:24:24 +0100
Message-Id: <20230602142426.438375-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230602142426.438375-1-biju.das.jz@bp.renesas.com>
References: <20230602142426.438375-1-biju.das.jz@bp.renesas.com>
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

Drop enum isl1208_id and split the array isl1208_configs[] as individual
variables, and make lines shorter by referring to e.g. &config_isl1219
instead of &isl1208_configs[TYPE_ISL1219].

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v5->v6:
 * No change.
v4->v5:
 * Added Rb tag from Geert.
 * Replaced "unsigned long"->"kernel_ulong_t" in isl1208_id[].
v4:
 * New patch
---
 drivers/rtc/rtc-isl1208.c | 56 +++++++++++++++++++++++----------------
 1 file changed, 33 insertions(+), 23 deletions(-)

diff --git a/drivers/rtc/rtc-isl1208.c b/drivers/rtc/rtc-isl1208.c
index 9955378b4ea6..d42615fcdd9f 100644
--- a/drivers/rtc/rtc-isl1208.c
+++ b/drivers/rtc/rtc-isl1208.c
@@ -68,41 +68,51 @@
 
 static struct i2c_driver isl1208_driver;
 
-/* ISL1208 various variants */
-enum isl1208_id {
-	TYPE_ISL1208 = 0,
-	TYPE_ISL1209,
-	TYPE_ISL1218,
-	TYPE_ISL1219,
-	ISL_LAST_ID
-};
-
 /* Chip capabilities table */
-static const struct isl1208_config {
+struct isl1208_config {
 	unsigned int	nvmem_length;
 	unsigned	has_tamper:1;
 	unsigned	has_timestamp:1;
-} isl1208_configs[] = {
-	[TYPE_ISL1208] = { 2, false, false },
-	[TYPE_ISL1209] = { 2, true,  false },
-	[TYPE_ISL1218] = { 8, false, false },
-	[TYPE_ISL1219] = { 2, true,  true },
+};
+
+static const struct isl1208_config config_isl1208 = {
+	.nvmem_length = 2,
+	.has_tamper = false,
+	.has_timestamp = false
+};
+
+static const struct isl1208_config config_isl1209 = {
+	.nvmem_length = 2,
+	.has_tamper = true,
+	.has_timestamp = false
+};
+
+static const struct isl1208_config config_isl1218 = {
+	.nvmem_length = 8,
+	.has_tamper = false,
+	.has_timestamp = false
+};
+
+static const struct isl1208_config config_isl1219 = {
+	.nvmem_length = 2,
+	.has_tamper = true,
+	.has_timestamp = true
 };
 
 static const struct i2c_device_id isl1208_id[] = {
-	{ "isl1208", .driver_data = (kernel_ulong_t)&isl1208_configs[TYPE_ISL1208] },
-	{ "isl1209", .driver_data = (kernel_ulong_t)&isl1208_configs[TYPE_ISL1209] },
-	{ "isl1218", .driver_data = (kernel_ulong_t)&isl1208_configs[TYPE_ISL1218] },
-	{ "isl1219", .driver_data = (kernel_ulong_t)&isl1208_configs[TYPE_ISL1219] },
+	{ "isl1208", .driver_data = (kernel_ulong_t)&config_isl1208 },
+	{ "isl1209", .driver_data = (kernel_ulong_t)&config_isl1209 },
+	{ "isl1218", .driver_data = (kernel_ulong_t)&config_isl1218 },
+	{ "isl1219", .driver_data = (kernel_ulong_t)&config_isl1219 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, isl1208_id);
 
 static const __maybe_unused struct of_device_id isl1208_of_match[] = {
-	{ .compatible = "isil,isl1208", .data = &isl1208_configs[TYPE_ISL1208] },
-	{ .compatible = "isil,isl1209", .data = &isl1208_configs[TYPE_ISL1209] },
-	{ .compatible = "isil,isl1218", .data = &isl1208_configs[TYPE_ISL1218] },
-	{ .compatible = "isil,isl1219", .data = &isl1208_configs[TYPE_ISL1219] },
+	{ .compatible = "isil,isl1208", .data = &config_isl1208 },
+	{ .compatible = "isil,isl1209", .data = &config_isl1209 },
+	{ .compatible = "isil,isl1218", .data = &config_isl1218 },
+	{ .compatible = "isil,isl1219", .data = &config_isl1219 },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, isl1208_of_match);
-- 
2.25.1

