Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4ED624FB6B4
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Apr 2022 11:01:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344058AbiDKJCx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 11 Apr 2022 05:02:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344102AbiDKJCi (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 11 Apr 2022 05:02:38 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C0E93ED1C;
        Mon, 11 Apr 2022 02:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1649667625; x=1681203625;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EWytXuYekgoEisOZ0234lmOJ3vcDaaP1r/uaU+xZy7s=;
  b=0bsieISWGoCX9T70oluw8VoPohUBSWIO6wNVcSLNlaOVK5Vxqrh+TSAT
   HNVHfnQw/6Afdq6oSjFdl51GmAr8lI6WN48qBm2G4cCwsOUwzAX1dFENV
   AnR0zjnBRoiWvuN2UaEj0HQHL0C2JzxtUUZiRuQvd89erHNV9gwZ99Q3O
   jsJt4idR91HU2W9pu++CjycsnpS+G43VqDOdye9vhKlcL3GVRXhQfESt0
   /JDg8HS0tru7s/wLLgJnR6egJWR8QFTbpWpxc9Kz133uTO8s2RbpQ6hQI
   Is0keRbtd+QcIwry+DRrdz0c/JZfvNI5WGidYgUwfw3f88aHx78Pgae1l
   g==;
X-IronPort-AV: E=Sophos;i="5.90,251,1643698800"; 
   d="scan'208";a="152206716"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Apr 2022 02:00:24 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 11 Apr 2022 02:00:23 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Mon, 11 Apr 2022 02:00:19 -0700
From:   Conor Dooley <conor.dooley@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>,
        <palmer@rivosinc.com>, <a.zummo@towertech.it>,
        <alexandre.belloni@bootlin.com>, <robh+dt@kernel.org>,
        <krzk+dt@kernel.org>
CC:     <daire.mcnamara@microchip.com>, <linux-rtc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>,
        Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 2/9] clk: microchip: mpfs: mark CLK_ATHENA as critical
Date:   Mon, 11 Apr 2022 09:59:10 +0100
Message-ID: <20220411085916.941433-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411085916.941433-1-conor.dooley@microchip.com>
References: <20220411085916.941433-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

CLK_ATHENA is another fabric interconnect and should be marked as critical
as with FIC0-3, since disabling it will cause part of the fabric to go
into reset.

Fixes: 635e5e73370e ("clk: microchip: Add driver for Microchip PolarFire SoC")
Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/clk/microchip/clk-mpfs.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
index 7485a5eeb5c0..a361b8743a32 100644
--- a/drivers/clk/microchip/clk-mpfs.c
+++ b/drivers/clk/microchip/clk-mpfs.c
@@ -249,8 +249,10 @@ static const struct clk_ops mpfs_periph_clk_ops = {
  *   trap handler
  * - CLK_MMUART0: reserved by the hss
  * - CLK_DDRC: provides clock to the ddr subsystem
- * - CLK_FICx: these provide clocks for sections of the fpga fabric, disabling them would
- *   cause the fabric to go into reset
+ * - CLK_FICx: these provide the processor side clocks to the "FIC" (Fabric InterConnect)
+ *   clock domain crossers which provide the interface to the FPGA fabric. Disabling them
+ *   causes the FPGA fabric to go into reset.
+ * - CLK_ATHENA: The athena clock is FIC4, which is reserved for the Athena TeraFire.
  */
 
 static struct mpfs_periph_hw_clock mpfs_periph_clks[] = {
@@ -281,7 +283,7 @@ static struct mpfs_periph_hw_clock mpfs_periph_clks[] = {
 	CLK_PERIPH(CLK_FIC1, "clk_periph_fic1", PARENT_CLK(AXI), 25, CLK_IS_CRITICAL),
 	CLK_PERIPH(CLK_FIC2, "clk_periph_fic2", PARENT_CLK(AXI), 26, CLK_IS_CRITICAL),
 	CLK_PERIPH(CLK_FIC3, "clk_periph_fic3", PARENT_CLK(AXI), 27, CLK_IS_CRITICAL),
-	CLK_PERIPH(CLK_ATHENA, "clk_periph_athena", PARENT_CLK(AXI), 28, 0),
+	CLK_PERIPH(CLK_ATHENA, "clk_periph_athena", PARENT_CLK(AXI), 28, CLK_IS_CRITICAL),
 	CLK_PERIPH(CLK_CFM, "clk_periph_cfm", PARENT_CLK(AHB), 29, 0),
 };
 
-- 
2.35.1

