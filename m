Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71ECB78A87E
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Aug 2023 11:09:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbjH1JJJ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 28 Aug 2023 05:09:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229617AbjH1JIq (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 28 Aug 2023 05:08:46 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9C2DDEC;
        Mon, 28 Aug 2023 02:08:43 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.02,207,1688396400"; 
   d="scan'208";a="177906192"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 28 Aug 2023 18:08:43 +0900
Received: from localhost.localdomain (unknown [10.226.92.234])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 62E2641B7376;
        Mon, 28 Aug 2023 18:08:40 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-rtc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] rtc: rx8581: Simplify probe()
Date:   Mon, 28 Aug 2023 10:08:28 +0100
Message-Id: <20230828090828.26897-1-biju.das.jz@bp.renesas.com>
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

Make similar OF and ID table and simplify probe() by replacing
of_device_get_match_data()->i2c_get_match_data().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Note:
 * This patch is only compile tested.
---
 drivers/rtc/rtc-rx8581.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-rx8581.c b/drivers/rtc/rtc-rx8581.c
index 48efd61a114d..68dd8b9b52f9 100644
--- a/drivers/rtc/rtc-rx8581.c
+++ b/drivers/rtc/rtc-rx8581.c
@@ -250,8 +250,7 @@ static const struct rx85x1_config rx8571_config = {
 static int rx8581_probe(struct i2c_client *client)
 {
 	struct rx8581 *rx8581;
-	const struct rx85x1_config *config = &rx8581_config;
-	const void *data = of_device_get_match_data(&client->dev);
+	const struct rx85x1_config *config = i2c_get_match_data(client);
 	static struct nvmem_config nvmem_cfg[] = {
 		{
 			.name = "rx85x1-",
@@ -273,9 +272,6 @@ static int rx8581_probe(struct i2c_client *client)
 
 	dev_dbg(&client->dev, "%s\n", __func__);
 
-	if (data)
-		config = data;
-
 	rx8581 = devm_kzalloc(&client->dev, sizeof(struct rx8581), GFP_KERNEL);
 	if (!rx8581)
 		return -ENOMEM;
@@ -307,7 +303,7 @@ static int rx8581_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id rx8581_id[] = {
-	{ "rx8581", 0 },
+	{ "rx8581", (kernel_ulong_t)&rx8581_config },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rx8581_id);
-- 
2.25.1

