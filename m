Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74CE473B978
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Jun 2023 16:10:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231767AbjFWOKf (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 23 Jun 2023 10:10:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230459AbjFWOKd (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 23 Jun 2023 10:10:33 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6B4D426AE;
        Fri, 23 Jun 2023 07:10:25 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,152,1684767600"; 
   d="scan'208";a="165108870"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 23 Jun 2023 23:10:24 +0900
Received: from localhost.localdomain (unknown [10.226.93.107])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 883504270489;
        Fri, 23 Jun 2023 23:10:21 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-rtc@vger.kernel.org,
        Trent Piepho <tpiepho@gmail.com>,
        Wolfram Sang <wsa@kernel.org>, Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v7 06/10] rtc: isl1208: Drop name variable
Date:   Fri, 23 Jun 2023 15:09:44 +0100
Message-Id: <20230623140948.384762-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230623140948.384762-1-biju.das.jz@bp.renesas.com>
References: <20230623140948.384762-1-biju.das.jz@bp.renesas.com>
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

Drop unused name variable from struct isl1208_config.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v6->v7:
 * No change.
v5->v6:
 * No change.
v4->v5:
 * Added Rb tag from Geert.
v4:
 * New patch.
---
 drivers/rtc/rtc-isl1208.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-isl1208.c b/drivers/rtc/rtc-isl1208.c
index 92a7a1d8d5c3..6b3ff21084c5 100644
--- a/drivers/rtc/rtc-isl1208.c
+++ b/drivers/rtc/rtc-isl1208.c
@@ -79,15 +79,14 @@ enum isl1208_id {
 
 /* Chip capabilities table */
 static const struct isl1208_config {
-	const char	name[8];
 	unsigned int	nvmem_length;
 	unsigned	has_tamper:1;
 	unsigned	has_timestamp:1;
 } isl1208_configs[] = {
-	[TYPE_ISL1208] = { "isl1208", 2, false, false },
-	[TYPE_ISL1209] = { "isl1209", 2, true,  false },
-	[TYPE_ISL1218] = { "isl1218", 8, false, false },
-	[TYPE_ISL1219] = { "isl1219", 2, true,  true },
+	[TYPE_ISL1208] = { 2, false, false },
+	[TYPE_ISL1209] = { 2, true,  false },
+	[TYPE_ISL1218] = { 8, false, false },
+	[TYPE_ISL1219] = { 2, true,  true },
 };
 
 static const struct i2c_device_id isl1208_id[] = {
-- 
2.25.1

