Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7CC46F5394
	for <lists+linux-rtc@lfdr.de>; Wed,  3 May 2023 10:46:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbjECIqd (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 3 May 2023 04:46:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbjECIqc (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 3 May 2023 04:46:32 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 902624C21;
        Wed,  3 May 2023 01:46:30 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.99,246,1677510000"; 
   d="scan'208";a="161494713"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 03 May 2023 17:46:30 +0900
Received: from localhost.localdomain (unknown [10.226.92.153])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id ACE1F41C6900;
        Wed,  3 May 2023 17:46:26 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Trent Piepho <tpiepho@impinj.com>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH RFC 4/6] dt-bindings: rtc: isl1208: Document built-in RTC device on PMIC RAA215300
Date:   Wed,  3 May 2023 09:46:06 +0100
Message-Id: <20230503084608.14008-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230503084608.14008-1-biju.das.jz@bp.renesas.com>
References: <20230503084608.14008-1-biju.das.jz@bp.renesas.com>
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

The Built-in RTC device found on PMIC RAA215300 is similar to the isl1208
IP. However, RTC is enabled by PMIC RAA215300 and the polarity of the
external oscillator is determined by the PMIC revision.

Document renesas,raa215300-isl1208 compatible and renesas,raa215300-pmic
property to handle these differences.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../devicetree/bindings/rtc/isil,isl1208.yaml       | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml b/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
index 04d51887855f..888a832ed1db 100644
--- a/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
+++ b/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
@@ -18,6 +18,7 @@ properties:
           - isil,isl1209
           - isil,isl1218
           - isil,isl1219
+          - renesas,raa215300-isl1208
 
   reg:
     maxItems: 1
@@ -40,6 +41,10 @@ properties:
         <0> : Enable internal pull-up
         <1> : Disable internal pull-up
 
+  renesas,raa215300-pmic:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the pmic device with isl1208 built-in RTC.
+
 required:
   - compatible
   - reg
@@ -58,6 +63,14 @@ allOf:
         - interrupts-extended
         - interrupt-names
         - isil,ev-evienb
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,raa215300-isl1208
+    then:
+      required:
+        - renesas,raa215300-pmic
 
 unevaluatedProperties: false
 
-- 
2.25.1

