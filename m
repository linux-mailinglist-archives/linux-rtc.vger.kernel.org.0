Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04A0078AD3E
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Aug 2023 12:47:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231899AbjH1Kqx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 28 Aug 2023 06:46:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232021AbjH1Kqb (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 28 Aug 2023 06:46:31 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 04C20CD4;
        Mon, 28 Aug 2023 03:46:08 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.02,207,1688396400"; 
   d="scan'208";a="174208412"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 28 Aug 2023 19:46:03 +0900
Received: from localhost.localdomain (unknown [10.226.92.234])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id AB8BD4004956;
        Mon, 28 Aug 2023 19:46:00 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-rtc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] rtc: ds1307: Simplify probe()
Date:   Mon, 28 Aug 2023 11:45:57 +0100
Message-Id: <20230828104557.45343-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Simpilfy probe() by replacing device_get_match_data() and id lookup for
retrieving match data by i2c_get_match_data().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Note:
 * This patch is only compile tested.
---
 drivers/rtc/rtc-ds1307.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index 506b7d1c2397..d41cbb5a1cbd 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -1714,9 +1714,7 @@ static const struct regmap_config regmap_config = {
 
 static int ds1307_probe(struct i2c_client *client)
 {
-	const struct i2c_device_id *id = i2c_client_get_device_id(client);
 	struct ds1307		*ds1307;
-	const void		*match;
 	int			err = -ENODEV;
 	int			tmp;
 	const struct chip_desc	*chip;
@@ -1742,17 +1740,11 @@ static int ds1307_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, ds1307);
 
-	match = device_get_match_data(&client->dev);
-	if (match) {
-		ds1307->type = (uintptr_t)match;
-		chip = &chips[ds1307->type];
-	} else if (id) {
-		chip = &chips[id->driver_data];
-		ds1307->type = id->driver_data;
-	} else {
+	ds1307->type = (uintptr_t)i2c_get_match_data(client);
+	if (!ds1307->type)
 		return -ENODEV;
-	}
 
+	chip = &chips[ds1307->type];
 	want_irq = client->irq > 0 && chip->alarm;
 
 	if (!pdata)
-- 
2.25.1

