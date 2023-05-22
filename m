Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31D4270B9DF
	for <lists+linux-rtc@lfdr.de>; Mon, 22 May 2023 12:19:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbjEVKTf (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 22 May 2023 06:19:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232781AbjEVKT3 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 22 May 2023 06:19:29 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6A9771AC;
        Mon, 22 May 2023 03:19:20 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.00,184,1681138800"; 
   d="scan'208";a="163778344"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 22 May 2023 19:19:20 +0900
Received: from localhost.localdomain (unknown [10.226.93.9])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id F34BD400A10B;
        Mon, 22 May 2023 19:19:17 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-rtc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 05/11] rtc: isl1208: Make similar I2C and DT-based matching table
Date:   Mon, 22 May 2023 11:18:43 +0100
Message-Id: <20230522101849.297499-6-biju.das.jz@bp.renesas.com>
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

The isl1208_id[].driver_data could store a pointer to the config,
like for DT-based matching, making I2C and DT-based matching
more similar.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4->v5:
 * Added Rb tag from Geert.
 * Replaced "unsigned long"->"kernel_ulong_t" in isl1208_id[].
v4:
 * New patch.
---
 drivers/rtc/rtc-isl1208.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-isl1208.c b/drivers/rtc/rtc-isl1208.c
index a73eb78b8a40..9955378b4ea6 100644
--- a/drivers/rtc/rtc-isl1208.c
+++ b/drivers/rtc/rtc-isl1208.c
@@ -90,10 +90,10 @@ static const struct isl1208_config {
 };
 
 static const struct i2c_device_id isl1208_id[] = {
-	{ "isl1208", TYPE_ISL1208 },
-	{ "isl1209", TYPE_ISL1209 },
-	{ "isl1218", TYPE_ISL1218 },
-	{ "isl1219", TYPE_ISL1219 },
+	{ "isl1208", .driver_data = (kernel_ulong_t)&isl1208_configs[TYPE_ISL1208] },
+	{ "isl1209", .driver_data = (kernel_ulong_t)&isl1208_configs[TYPE_ISL1209] },
+	{ "isl1218", .driver_data = (kernel_ulong_t)&isl1208_configs[TYPE_ISL1218] },
+	{ "isl1219", .driver_data = (kernel_ulong_t)&isl1208_configs[TYPE_ISL1219] },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, isl1208_id);
@@ -822,9 +822,9 @@ isl1208_probe(struct i2c_client *client)
 	} else {
 		const struct i2c_device_id *id = i2c_match_id(isl1208_id, client);
 
-		if (id->driver_data >= ISL_LAST_ID)
+		if (!id)
 			return -ENODEV;
-		isl1208->config = &isl1208_configs[id->driver_data];
+		isl1208->config = (struct isl1208_config *)id->driver_data;
 	}
 
 	isl1208->rtc = devm_rtc_allocate_device(&client->dev);
-- 
2.25.1

