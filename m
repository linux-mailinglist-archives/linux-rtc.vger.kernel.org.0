Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B414078AE7F
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Aug 2023 13:11:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232434AbjH1LKs (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 28 Aug 2023 07:10:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232450AbjH1LKo (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 28 Aug 2023 07:10:44 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 72A30E3;
        Mon, 28 Aug 2023 04:10:40 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.02,207,1688396400"; 
   d="scan'208";a="177919416"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 28 Aug 2023 20:10:39 +0900
Received: from localhost.localdomain (unknown [10.226.92.234])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 3B5EF4005E25;
        Mon, 28 Aug 2023 20:10:36 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-rtc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] rtc: rs5c372: Simplify probe()
Date:   Mon, 28 Aug 2023 12:10:34 +0100
Message-Id: <20230828111034.52764-1-biju.das.jz@bp.renesas.com>
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
 drivers/rtc/rtc-rs5c372.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-rs5c372.c b/drivers/rtc/rtc-rs5c372.c
index f8fab0205f8c..936f4f05c8c7 100644
--- a/drivers/rtc/rtc-rs5c372.c
+++ b/drivers/rtc/rtc-rs5c372.c
@@ -825,12 +825,7 @@ static int rs5c372_probe(struct i2c_client *client)
 
 	rs5c372->client = client;
 	i2c_set_clientdata(client, rs5c372);
-	if (client->dev.of_node) {
-		rs5c372->type = (uintptr_t)of_device_get_match_data(&client->dev);
-	} else {
-		const struct i2c_device_id *id = i2c_match_id(rs5c372_id, client);
-		rs5c372->type = id->driver_data;
-	}
+	rs5c372->type = (uintptr_t)i2c_get_match_data(client);
 
 	/* we read registers 0x0f then 0x00-0x0f; skip the first one */
 	rs5c372->regs = &rs5c372->buf[1];
-- 
2.25.1

