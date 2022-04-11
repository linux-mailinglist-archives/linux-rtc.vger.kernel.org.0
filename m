Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51B654FB6C5
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Apr 2022 11:01:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344052AbiDKJCw (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 11 Apr 2022 05:02:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344029AbiDKJCu (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 11 Apr 2022 05:02:50 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77F38286C8;
        Mon, 11 Apr 2022 02:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1649667636; x=1681203636;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cMUD//YndY/uYZAoKQOOrsgN8z8FUO65LegcEIgqKaU=;
  b=weg+n1oGSpJIPbnphdRHX0PfiFmghoU6VOQs9Hm0Pvcjy1+3VCzELa8Q
   8Gqg78gHMM16QB9w0MptEJQHf5Rpc1jWai9K3tP76OvBD3twkLMZYZgCc
   v1/VFkNkTN/j67+lQgAX5eogTH69zC9L0dkY51zN+cT7hQYeiD9/QpfYo
   +iHoScLSFINyWraCXtK9pa4NdObwgeOaOXmnXu/rHRiguqbalG52s699G
   ibeQ3YbANO+xXlx3h9lurH6+5AOcINjeOi8iPfondlU13SnDn56c2ZPHI
   mamHQNhbA+gbZSvsdvCKw7Kn3sq0yRWyG5eSQJD0ZlIrE/zDSDy1g/4EY
   A==;
X-IronPort-AV: E=Sophos;i="5.90,251,1643698800"; 
   d="scan'208";a="155112938"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Apr 2022 02:00:35 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 11 Apr 2022 02:00:34 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Mon, 11 Apr 2022 02:00:30 -0700
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
Subject: [PATCH v2 5/9] dt-bindings: clk: mpfs: add defines for two new clocks
Date:   Mon, 11 Apr 2022 09:59:13 +0100
Message-ID: <20220411085916.941433-6-conor.dooley@microchip.com>
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

The RTC reference and MSSPLL were previously not documented or defined,
as they were unused. Add their defines to the PolarFire SoC header.

Fixes: 2145bb687e3f ("dt-bindings: clk: microchip: Add Microchip PolarFire host binding")
Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 include/dt-bindings/clock/microchip,mpfs-clock.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/microchip,mpfs-clock.h b/include/dt-bindings/clock/microchip,mpfs-clock.h
index 73f2a9324857..3cba46b9191f 100644
--- a/include/dt-bindings/clock/microchip,mpfs-clock.h
+++ b/include/dt-bindings/clock/microchip,mpfs-clock.h
@@ -1,15 +1,18 @@
 /* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
 /*
  * Daire McNamara,<daire.mcnamara@microchip.com>
- * Copyright (C) 2020 Microchip Technology Inc.  All rights reserved.
+ * Copyright (C) 2020-2022 Microchip Technology Inc.  All rights reserved.
  */
 
 #ifndef _DT_BINDINGS_CLK_MICROCHIP_MPFS_H_
 #define _DT_BINDINGS_CLK_MICROCHIP_MPFS_H_
 
+#define CLK_MSSPLL	34
+
 #define CLK_CPU		0
 #define CLK_AXI		1
 #define CLK_AHB		2
+#define CLK_RTCREF	33
 
 #define CLK_ENVM	3
 #define CLK_MAC0	4
-- 
2.35.1

