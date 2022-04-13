Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7015D4FF142
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Apr 2022 10:02:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231984AbiDMIE1 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 13 Apr 2022 04:04:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233637AbiDMIEZ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 13 Apr 2022 04:04:25 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72407205F1;
        Wed, 13 Apr 2022 01:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1649836923; x=1681372923;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ptGLsfDZs/+cC1lSfUbsHlNYhSzYidKWWjp9jDVuh6I=;
  b=AeoSCkGwIjTygI9VnXl4EqcG9HRlYHaiRIBgK8Zsk9WyT/YRL9POf0kd
   VfyZLjRn2eqb8bpJP3+BTAg545Csnp8fiWK4cgyj+opbgQ52ID0HtbQAg
   sLLwxdXYbtgYbZ04D4oosausmZbOjuYQBvI3rDfKdFB4ydF+CtEQ5+HyV
   irxRUVzkGGv7iXBOzrn9c3+oR9B6yztC/cZknQ+YLNEHP++JmobAXV4ro
   emxxu3LC0dPBOc23ipTZnZFom1HMbfWkT/MDYFbE5eKof76C7m18dg7vM
   9tinb7q/jvZnGPB+Nol/D2MjXnCRzRtrp4mzQ96Ky/bjoe73RmWBylnxl
   w==;
X-IronPort-AV: E=Sophos;i="5.90,256,1643698800"; 
   d="scan'208";a="92231035"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Apr 2022 01:02:01 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 13 Apr 2022 01:01:59 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Wed, 13 Apr 2022 01:01:56 -0700
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
Subject: [PATCH v3 1/9] clk: microchip: mpfs: fix parents for FIC clocks
Date:   Wed, 13 Apr 2022 08:58:28 +0100
Message-ID: <20220413075835.3354193-2-conor.dooley@microchip.com>
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

The fabric interconnects are on the AXI bus not AHB.
Update their parent clocks to fix this.

Fixes: 635e5e73370e ("clk: microchip: Add driver for Microchip PolarFire SoC")
Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/clk/microchip/clk-mpfs.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
index aa1561b773d6..7485a5eeb5c0 100644
--- a/drivers/clk/microchip/clk-mpfs.c
+++ b/drivers/clk/microchip/clk-mpfs.c
@@ -277,11 +277,11 @@ static struct mpfs_periph_hw_clock mpfs_periph_clks[] = {
 	CLK_PERIPH(CLK_GPIO1, "clk_periph_gpio1", PARENT_CLK(AHB), 21, 0),
 	CLK_PERIPH(CLK_GPIO2, "clk_periph_gpio2", PARENT_CLK(AHB), 22, 0),
 	CLK_PERIPH(CLK_DDRC, "clk_periph_ddrc", PARENT_CLK(AHB), 23, CLK_IS_CRITICAL),
-	CLK_PERIPH(CLK_FIC0, "clk_periph_fic0", PARENT_CLK(AHB), 24, CLK_IS_CRITICAL),
-	CLK_PERIPH(CLK_FIC1, "clk_periph_fic1", PARENT_CLK(AHB), 25, CLK_IS_CRITICAL),
-	CLK_PERIPH(CLK_FIC2, "clk_periph_fic2", PARENT_CLK(AHB), 26, CLK_IS_CRITICAL),
-	CLK_PERIPH(CLK_FIC3, "clk_periph_fic3", PARENT_CLK(AHB), 27, CLK_IS_CRITICAL),
-	CLK_PERIPH(CLK_ATHENA, "clk_periph_athena", PARENT_CLK(AHB), 28, 0),
+	CLK_PERIPH(CLK_FIC0, "clk_periph_fic0", PARENT_CLK(AXI), 24, CLK_IS_CRITICAL),
+	CLK_PERIPH(CLK_FIC1, "clk_periph_fic1", PARENT_CLK(AXI), 25, CLK_IS_CRITICAL),
+	CLK_PERIPH(CLK_FIC2, "clk_periph_fic2", PARENT_CLK(AXI), 26, CLK_IS_CRITICAL),
+	CLK_PERIPH(CLK_FIC3, "clk_periph_fic3", PARENT_CLK(AXI), 27, CLK_IS_CRITICAL),
+	CLK_PERIPH(CLK_ATHENA, "clk_periph_athena", PARENT_CLK(AXI), 28, 0),
 	CLK_PERIPH(CLK_CFM, "clk_periph_cfm", PARENT_CLK(AHB), 29, 0),
 };
 
-- 
2.35.1

