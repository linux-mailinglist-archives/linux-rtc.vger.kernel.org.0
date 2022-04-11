Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B013F4FB6B0
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Apr 2022 11:01:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239178AbiDKJCv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 11 Apr 2022 05:02:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344147AbiDKJCr (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 11 Apr 2022 05:02:47 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9D5D3ED25;
        Mon, 11 Apr 2022 02:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1649667633; x=1681203633;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Lxe+6YYnQOFRMxYyv3uPO62UdmsWV3nnAQEdb9zRcIU=;
  b=sgdKZ2n/WiE9tPjtfmYxLpV7KXZY8aty6kEha2ZLZkw+Z8WQdfHfRu6V
   caBwIdUfD1UmXYnPr4CGmAm+tcctCsH0CCzDf4IUQ/HPTbA4uW+l07pbX
   MR+BoeDWwD/d7mAElUg1fTejZpdCt+QUeM21dGS5seMRc51EE4RxzprtA
   4JvfwzbQwH/q1wMLQEJuW4/c6Tl6UrTA5kmnR6DwGpaTGkeefrQBx8xgp
   NCMd3ITZ9VKpOO0JS/bgUiyqIgU63f2MApwHwtneZz9rCsPNsdzB6zrgm
   6ZDF+GQ9NGUunvnisONhul41b5Aug3GlE65CyLMhEKsMulCIuFWeL0Ekd
   w==;
X-IronPort-AV: E=Sophos;i="5.90,251,1643698800"; 
   d="scan'208";a="155112892"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Apr 2022 02:00:32 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 11 Apr 2022 02:00:30 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Mon, 11 Apr 2022 02:00:27 -0700
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
Subject: [PATCH v2 4/9] dt-bindings: clk: mpfs document msspll dri registers
Date:   Mon, 11 Apr 2022 09:59:12 +0100
Message-ID: <20220411085916.941433-5-conor.dooley@microchip.com>
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

As there are two sections of registers that are responsible for clock
configuration on the PolarFire SoC: add the dynamic reconfiguration
interface section to the binding & describe what each of the sections
are used for.

Fixes: 2145bb687e3f ("dt-bindings: clk: microchip: Add Microchip PolarFire host binding")
Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/clock/microchip,mpfs.yaml     | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/microchip,mpfs.yaml b/Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
index 0c15afa2214c..42919df322ab 100644
--- a/Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
+++ b/Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
@@ -22,7 +22,14 @@ properties:
     const: microchip,mpfs-clkcfg
 
   reg:
-    maxItems: 1
+    items:
+      - description: |
+          clock config registers:
+          These registers contain enable, reset & divider tables for the, cpu, axi, ahb and
+          rtc/mtimer reference clocks as well as enable and reset for the peripheral clocks.
+      - description: |
+          mss pll dri registers:
+          Block of registers responsible for dynamic reconfiguration of the mss pll
 
   clocks:
     maxItems: 1
@@ -51,7 +58,7 @@ examples:
             #size-cells = <2>;
             clkcfg: clock-controller@20002000 {
                 compatible = "microchip,mpfs-clkcfg";
-                reg = <0x0 0x20002000 0x0 0x1000>;
+                reg = <0x0 0x20002000 0x0 0x1000>, <0x0 0x3E001000 0x0 0x1000>;
                 clocks = <&ref>;
                 #clock-cells = <1>;
         };
-- 
2.35.1

