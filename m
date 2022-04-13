Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33B354FF147
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Apr 2022 10:02:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233647AbiDMIE2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 13 Apr 2022 04:04:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233650AbiDMIEZ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 13 Apr 2022 04:04:25 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D7E8205F8;
        Wed, 13 Apr 2022 01:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1649836924; x=1681372924;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EWytXuYekgoEisOZ0234lmOJ3vcDaaP1r/uaU+xZy7s=;
  b=Wlk5A8Ys2Y1OMs80mugoCop42JVGmjTAG1MTBry9ZRYZIcVXSlcQtwkK
   q7YbRq/W2ApNBmpzhUsba2oFtGHEaKauVkNNz+xH/UVbC/kXDNory9/BL
   lXY/rlcDBCL5a63VT/WPohA1UzGsppeJC/8nfzJz+9jVX6DvOMzc6Hyw4
   AKVpxc8CVPPDJ1lkG+kdPbH73t9Pwn7573vbl34FATllVhwsar0IBAwlE
   pOB0VtzUHCnnkqQrfVzle0QePvYO4d2oFWM+WgjyODjDZsrJJt8BSbnRo
   B4pHZnJ3MTEeIIcyl5RnmaOPpgerg+Iy22OFgewoz/VieTLr85DjNF2iD
   w==;
X-IronPort-AV: E=Sophos;i="5.90,256,1643698800"; 
   d="scan'208";a="160365279"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Apr 2022 01:02:03 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 13 Apr 2022 01:02:03 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Wed, 13 Apr 2022 01:02:00 -0700
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
Subject: [PATCH v3 2/9] clk: microchip: mpfs: mark CLK_ATHENA as critical
Date:   Wed, 13 Apr 2022 08:58:29 +0100
Message-ID: <20220413075835.3354193-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220413075835.3354193-1-conor.dooley@microchip.com>
References: <20220413075835.3354193-1-conor.dooley@microchip.com>
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

