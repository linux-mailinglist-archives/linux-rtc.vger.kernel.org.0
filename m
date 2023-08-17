Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46B2277FBAD
	for <lists+linux-rtc@lfdr.de>; Thu, 17 Aug 2023 18:12:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236259AbjHQQLh (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 17 Aug 2023 12:11:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353625AbjHQQLa (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 17 Aug 2023 12:11:30 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9B2E635B1;
        Thu, 17 Aug 2023 09:11:06 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,180,1684767600"; 
   d="scan'208";a="176888065"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 18 Aug 2023 01:10:43 +0900
Received: from localhost.localdomain (unknown [10.226.93.71])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 37CEF40175E8;
        Fri, 18 Aug 2023 01:10:40 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-rtc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Pavel Machek <pavel@denx.de>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] rtc: isl1208: Fix incorrect logic in isl1208_set_xtoscb()
Date:   Thu, 17 Aug 2023 17:10:38 +0100
Message-Id: <20230817161038.407960-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The XTOSCB bit is not bit 0, but xtosb_val is either 0 or 1. If it is 1,
test will never succeed. Fix this issue by using double negation.

While at it, remove unnecessary blank line from probe().

Reported-by: Pavel Machek <pavel@denx.de>
Closes: https://lore.kernel.org/all/ZN4BgzG2xmzOzdFZ@duo.ucw.cz/
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/rtc/rtc-isl1208.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-isl1208.c b/drivers/rtc/rtc-isl1208.c
index 712ca652d6d3..e50c23ee1646 100644
--- a/drivers/rtc/rtc-isl1208.c
+++ b/drivers/rtc/rtc-isl1208.c
@@ -188,7 +188,7 @@ isl1208_i2c_validate_client(struct i2c_client *client)
 static int isl1208_set_xtoscb(struct i2c_client *client, int sr, int xtosb_val)
 {
 	/* Do nothing if bit is already set to desired value */
-	if ((sr & ISL1208_REG_SR_XTOSCB) == xtosb_val)
+	if (!!(sr & ISL1208_REG_SR_XTOSCB) == xtosb_val)
 		return 0;
 
 	if (xtosb_val)
@@ -944,7 +944,6 @@ isl1208_probe(struct i2c_client *client)
 		rc = isl1208_setup_irq(client, client->irq);
 		if (rc)
 			return rc;
-
 	} else {
 		clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, isl1208->rtc->features);
 	}
-- 
2.25.1

