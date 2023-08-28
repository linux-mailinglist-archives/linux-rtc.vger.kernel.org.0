Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDA8378AE5D
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Aug 2023 13:03:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232039AbjH1LCr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 28 Aug 2023 07:02:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232417AbjH1LCY (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 28 Aug 2023 07:02:24 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C23A1BE;
        Mon, 28 Aug 2023 04:02:21 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.02,207,1688396400"; 
   d="scan'208";a="177918588"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 28 Aug 2023 20:02:21 +0900
Received: from localhost.localdomain (unknown [10.226.92.234])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8FE4C41A4FB0;
        Mon, 28 Aug 2023 20:02:18 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-rtc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] rtc: rv8803: Simplify probe()
Date:   Mon, 28 Aug 2023 12:02:16 +0100
Message-Id: <20230828110216.49102-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Simpilfy probe() by replacing of_device_get_match_data() and id lookup for
retrieving match data by i2c_get_match_data().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Note:
 * This patch is only compile tested.
---
 drivers/rtc/rtc-rv8803.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index 1a3ec1bb5b81..ce54048be736 100644
--- a/drivers/rtc/rtc-rv8803.c
+++ b/drivers/rtc/rtc-rv8803.c
@@ -607,15 +607,6 @@ static int rv8803_regs_configure(struct rv8803_data *rv8803)
 	return 0;
 }
 
-static const struct i2c_device_id rv8803_id[] = {
-	{ "rv8803", rv_8803 },
-	{ "rv8804", rx_8804 },
-	{ "rx8803", rx_8803 },
-	{ "rx8900", rx_8900 },
-	{ }
-};
-MODULE_DEVICE_TABLE(i2c, rv8803_id);
-
 static int rv8803_probe(struct i2c_client *client)
 {
 	struct i2c_adapter *adapter = client->adapter;
@@ -644,13 +635,7 @@ static int rv8803_probe(struct i2c_client *client)
 
 	mutex_init(&rv8803->flags_lock);
 	rv8803->client = client;
-	if (client->dev.of_node) {
-		rv8803->type = (uintptr_t)of_device_get_match_data(&client->dev);
-	} else {
-		const struct i2c_device_id *id = i2c_match_id(rv8803_id, client);
-
-		rv8803->type = id->driver_data;
-	}
+	rv8803->type = (uintptr_t)i2c_get_match_data(client);
 	i2c_set_clientdata(client, rv8803);
 
 	flags = rv8803_read_reg(client, RV8803_FLAG);
@@ -712,6 +697,15 @@ static int rv8803_probe(struct i2c_client *client)
 	return 0;
 }
 
+static const struct i2c_device_id rv8803_id[] = {
+	{ "rv8803", rv_8803 },
+	{ "rv8804", rx_8804 },
+	{ "rx8803", rx_8803 },
+	{ "rx8900", rx_8900 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, rv8803_id);
+
 static const __maybe_unused struct of_device_id rv8803_of_match[] = {
 	{
 		.compatible = "microcrystal,rv8803",
-- 
2.25.1

