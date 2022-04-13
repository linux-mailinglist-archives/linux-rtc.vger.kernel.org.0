Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E0574FF148
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Apr 2022 10:02:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233651AbiDMIEg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 13 Apr 2022 04:04:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230224AbiDMIEf (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 13 Apr 2022 04:04:35 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65452205F8;
        Wed, 13 Apr 2022 01:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1649836935; x=1681372935;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+wiUAzHIPMa+jpdUCRIcyJzb2DHINVr1TKpIJwUq7qw=;
  b=knWcJxgpFH0SP8xprg+iz1xx0J8SuheHH1RAe1ZOWIKnSmPuJZ6TMFqR
   pGQL8mBzQ+YrIsJ2VYS8+PD/0rn2BHuLLCOJvBvxfbU31flxfsGJpXw9C
   HTSIdPZ0mtyFiWELyGzdUm7vPCQgnpFbvaU/z1nvLfphGhpJ5tonNh1EM
   vQ6v74Sw3HmcDI4/FCzmgL9YFvWw7+8QAvtEmNAD1wwR9e7UaPxMck7p/
   uVg7wPL0PJCYkbsAKnDN4c8M2Wo/hlCA4yXL06FUAkHIdS2w45BeioORe
   rDYIuvrWXIQJQyO3Qu2Q0+3LwKwmKUx5SLxOR8h3O0GcKAyhdH/UFtwNh
   A==;
X-IronPort-AV: E=Sophos;i="5.90,256,1643698800"; 
   d="scan'208";a="160365332"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Apr 2022 01:02:14 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 13 Apr 2022 01:02:14 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Wed, 13 Apr 2022 01:02:10 -0700
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
Subject: [PATCH v3 5/9] dt-bindings: clk: mpfs: add defines for two new clocks
Date:   Wed, 13 Apr 2022 08:58:32 +0100
Message-ID: <20220413075835.3354193-6-conor.dooley@microchip.com>
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

The RTC reference and MSSPLL were previously not documented or defined,
as they were unused. Add their defines to the PolarFire SoC header.

Fixes: 2145bb687e3f ("dt-bindings: clk: microchip: Add Microchip PolarFire host binding")
Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 include/dt-bindings/clock/microchip,mpfs-clock.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/microchip,mpfs-clock.h b/include/dt-bindings/clock/microchip,mpfs-clock.h
index 73f2a9324857..4048669bf756 100644
--- a/include/dt-bindings/clock/microchip,mpfs-clock.h
+++ b/include/dt-bindings/clock/microchip,mpfs-clock.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
 /*
  * Daire McNamara,<daire.mcnamara@microchip.com>
- * Copyright (C) 2020 Microchip Technology Inc.  All rights reserved.
+ * Copyright (C) 2020-2022 Microchip Technology Inc.  All rights reserved.
  */
 
 #ifndef _DT_BINDINGS_CLK_MICROCHIP_MPFS_H_
@@ -42,4 +42,7 @@
 #define CLK_ATHENA	31
 #define CLK_CFM		32
 
+#define CLK_RTCREF	33
+#define CLK_MSSPLL	34
+
 #endif	/* _DT_BINDINGS_CLK_MICROCHIP_MPFS_H_ */
-- 
2.35.1

