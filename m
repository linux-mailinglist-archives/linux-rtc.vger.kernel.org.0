Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7679C4FF145
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Apr 2022 10:02:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233656AbiDMIEl (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 13 Apr 2022 04:04:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230224AbiDMIEj (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 13 Apr 2022 04:04:39 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2BEF205F1;
        Wed, 13 Apr 2022 01:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1649836938; x=1681372938;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Xn2MNOCffxx+tCEz7pBkbKKEsZdD+0DRzYY3aFgh6pw=;
  b=jmKfHoKXfD/MBOCDo1T9cNTgdcFcx1fJHCt8SIcr8pWvIvdYmV/U0bYG
   7bVrOXLOaEN+OHNNDPwMRMSiFutGkcsNDTsKfj2mk1vy63/PTck6YXXJ2
   KqFNQuEBZCR+QONzbsuzZS8Xo3HbvkoMdgaLXGP0B9aJJlapJIkc4l5bV
   cb/URCEina7CflDPVOgZnZb5Qovn5qA5H2x1XGK25Mk9jkwvR5UWewvRb
   4Xl7/IO7MskJcDqxzDTtvElUZtEDyHVIRWiLFgj/a25Wb/ZsTeroSx9l0
   sJUYU1KKEvOqL22tWZQ95n7pcPpvN713dVXPIP40iWdvCvh+yCTSD095E
   g==;
X-IronPort-AV: E=Sophos;i="5.90,256,1643698800"; 
   d="scan'208";a="160365366"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Apr 2022 01:02:18 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 13 Apr 2022 01:02:17 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Wed, 13 Apr 2022 01:02:14 -0700
From:   Conor Dooley <conor.dooley@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>,
        <palmer@rivosinc.com>, <a.zummo@towertech.it>,
        <alexandre.belloni@bootlin.com>, <robh+dt@kernel.org>,
        <krzk+dt@kernel.org>
CC:     <daire.mcnamara@microchip.com>, <linux-rtc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>,
        Conor Dooley <conor.dooley@microchip.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 6/9] dt-bindings: rtc: add refclk to mpfs-rtc
Date:   Wed, 13 Apr 2022 08:58:33 +0100
Message-ID: <20220413075835.3354193-7-conor.dooley@microchip.com>
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

The rtc on PolarFire SoC does not use the AHB clock as its reference
frequency, but rather a 1 MHz refclk that it shares with MTIMER. Add
this second clock to the binding as a required property.

Fixes: 4cbcc0d7b397 ("dt-bindings: rtc: add bindings for microchip mpfs rtc")
Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/rtc/microchip,mfps-rtc.yaml          | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
index a2e984ea3553..500c62becd6b 100644
--- a/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
@@ -31,11 +31,19 @@ properties:
           to that of the RTC's count register.
 
   clocks:
-    maxItems: 1
+    items:
+      - description: |
+          AHB clock
+      - description: |
+          Reference clock: divided by the prescaler to create a time-based
+          strobe (typically 1 Hz) for the calendar counter. By default, the rtc
+          on the PolarFire SoC shares it's reference with MTIMER so this will
+          be a 1 MHz clock.
 
   clock-names:
     items:
       - const: rtc
+      - const: rtcref
 
 required:
   - compatible
@@ -48,11 +56,12 @@ additionalProperties: false
 
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

