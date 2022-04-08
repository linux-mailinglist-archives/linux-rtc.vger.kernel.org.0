Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2935A4F9838
	for <lists+linux-rtc@lfdr.de>; Fri,  8 Apr 2022 16:37:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236985AbiDHOj5 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 8 Apr 2022 10:39:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236986AbiDHOj4 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 8 Apr 2022 10:39:56 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FAC460DA4;
        Fri,  8 Apr 2022 07:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1649428673; x=1680964673;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RVSiySLuyH36Oge4rtu7xhraomGEeU6vHquQBOWopMw=;
  b=rvva9Is8riJL6jI/klLavxEASAdY8hsmy54wGjv9vb1EbBFZERNS7YQ2
   mb1OIB1Kxlfv77BlsKa1OEH2xWMotdL26zYcIECBjOoirdmSexZbPQb8z
   Kp5JBoBso5GSIL5DhKB1Cviq/nkdmySq+lsB5OBXvOh/OjHdqCY976lbZ
   0VBzAODBCu8cSDpp78DzM5sVbLhQQRfRbO/3FV5qXGyJXXZbDf9YRxcBB
   fHW6LIwTQVv9VyDeCj3SYxqarVGuP9DK4m/1s24JeJ95gswuJgKnDq6dY
   SKm5DFlxCrqi78D8W9fofHR+eOMAHu436ICEI4OvQERa6EZeEL1PcB2QF
   w==;
X-IronPort-AV: E=Sophos;i="5.90,245,1643698800"; 
   d="scan'208";a="91773250"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Apr 2022 07:37:52 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 8 Apr 2022 07:37:52 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 8 Apr 2022 07:37:49 -0700
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
Subject: [PATCH v1 3/7] dt-bindings: rtc: add refclk to mpfs-rtc
Date:   Fri, 8 Apr 2022 14:36:43 +0000
Message-ID: <20220408143646.3693104-4-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408143646.3693104-1-conor.dooley@microchip.com>
References: <20220408143646.3693104-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The rtc on PolarFire SoC does not use the AHB clock as its reference
frequency, but rather a 1 MHz refclk that it shares with MTIMER. Add
this second clock to the binding as a required property.

Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/rtc/microchip,mfps-rtc.yaml           | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
index a2e984ea3553..1ffd97dbe6b9 100644
--- a/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
@@ -31,11 +31,18 @@ properties:
           to that of the RTC's count register.
 
   clocks:
-    maxItems: 1
+    items:
+      - description: |
+          AHB clock
+      - description: |
+          Reference clock: divided by the prescaler to create a time-based strobe (typically 1 Hz)
+          for the calendar counter. By default, the rtc on the PolarFire SoC shares it's reference
+          with MTIMER so this will be a 1 MHz clock.
 
   clock-names:
     items:
       - const: rtc
+      - const: rtcref
 
 required:
   - compatible
@@ -48,11 +55,12 @@ additionalProperties: false
 
 examples:
   - |
+    #include "dt-bindings/clock/microchip,mpfs-clock.h"
     rtc@20124000 {
         compatible = "microchip,mpfs-rtc";
         reg = <0x20124000 0x1000>;
-        clocks = <&clkcfg 21>;
-        clock-names = "rtc";
+        clocks = <&clkcfg CLK_RTC>, <&clkcfg CLK_RTCREF>;
+        clock-names = "rtc", "rtcref";
         interrupts = <80>, <81>;
     };
 ...
-- 
2.35.1

