Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19AC470B9DD
	for <lists+linux-rtc@lfdr.de>; Mon, 22 May 2023 12:19:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232207AbjEVKTe (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 22 May 2023 06:19:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232769AbjEVKT2 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 22 May 2023 06:19:28 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 92D9F1A7;
        Mon, 22 May 2023 03:19:18 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.00,184,1681138800"; 
   d="scan'208";a="160250862"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 22 May 2023 19:19:17 +0900
Received: from localhost.localdomain (unknown [10.226.93.9])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 34B214000AAA;
        Mon, 22 May 2023 19:19:14 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-rtc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 04/11] rtc: isl1208: Drop name variable
Date:   Mon, 22 May 2023 11:18:42 +0100
Message-Id: <20230522101849.297499-5-biju.das.jz@bp.renesas.com>
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

Drop unused name variable from struct isl1208_config.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4->v5:
 * Added Rb tag from Geert.
v4:
 * New patch.
---
 drivers/rtc/rtc-isl1208.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-isl1208.c b/drivers/rtc/rtc-isl1208.c
index 73cc6aaf9b8b..a73eb78b8a40 100644
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

