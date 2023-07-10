Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52FE374D4C3
	for <lists+linux-rtc@lfdr.de>; Mon, 10 Jul 2023 13:48:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbjGJLsB (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 10 Jul 2023 07:48:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232166AbjGJLr4 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 10 Jul 2023 07:47:56 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 73073BB;
        Mon, 10 Jul 2023 04:47:53 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,194,1684767600"; 
   d="scan'208";a="171607365"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 10 Jul 2023 20:47:52 +0900
Received: from localhost.localdomain (unknown [10.226.93.14])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 526D941E6E4E;
        Mon, 10 Jul 2023 20:47:50 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-rtc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] rtc: isl1208: Simplify probe()
Date:   Mon, 10 Jul 2023 12:47:47 +0100
Message-Id: <20230710114747.106496-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Simplify the probe() by replacing of_device_get_match_data() and
i2c_match_id() by i2c_get_match_data() as we have similar I2C
and DT-based matching table.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/rtc/rtc-isl1208.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/rtc/rtc-isl1208.c b/drivers/rtc/rtc-isl1208.c
index b0712b4e3648..57e77b55e484 100644
--- a/drivers/rtc/rtc-isl1208.c
+++ b/drivers/rtc/rtc-isl1208.c
@@ -862,17 +862,9 @@ isl1208_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, isl1208);
 
 	/* Determine which chip we have */
-	if (client->dev.of_node) {
-		isl1208->config = of_device_get_match_data(&client->dev);
-		if (!isl1208->config)
-			return -ENODEV;
-	} else {
-		const struct i2c_device_id *id = i2c_match_id(isl1208_id, client);
-
-		if (!id)
-			return -ENODEV;
-		isl1208->config = (struct isl1208_config *)id->driver_data;
-	}
+	isl1208->config = i2c_get_match_data(client);
+	if (!isl1208->config)
+		return -ENODEV;
 
 	rc = isl1208_clk_present(client, "xin");
 	if (rc < 0)
-- 
2.25.1

