Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 907E36F7FBB
	for <lists+linux-rtc@lfdr.de>; Fri,  5 May 2023 11:17:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbjEEJRd (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 5 May 2023 05:17:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231527AbjEEJRb (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 5 May 2023 05:17:31 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CBF6C4C0B;
        Fri,  5 May 2023 02:17:29 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.99,251,1677510000"; 
   d="scan'208";a="161718231"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 05 May 2023 18:17:28 +0900
Received: from localhost.localdomain (unknown [10.226.92.145])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8C3A74006193;
        Fri,  5 May 2023 18:17:25 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Trent Piepho <tpiepho@gmail.com>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3] dt-bindings: rtc: isl1208: Convert to json-schema
Date:   Fri,  5 May 2023 10:17:20 +0100
Message-Id: <20230505091720.115675-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Convert the isl1208 RTC device tree binding documentation to json-schema.

Update the example to match reality.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Updated interrupt-names property by keeping the list of names.
 * Removed Interrupts from required property as it may not be wired.
 * Removed isil,ev-evienb from required property.
RFC->v2:
 * Updated maintainers list
 * Updated description from original bindings
 * removed default from isil,ev-evienb properties to match with the original
   bindings.
 * Added conditional check for interrupts.
---
 .../devicetree/bindings/rtc/isil,isl1208.txt  | 38 ---------
 .../devicetree/bindings/rtc/isil,isl1208.yaml | 81 +++++++++++++++++++
 2 files changed, 81 insertions(+), 38 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/isil,isl1208.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/isil,isl1208.yaml

diff --git a/Documentation/devicetree/bindings/rtc/isil,isl1208.txt b/Documentation/devicetree/bindings/rtc/isil,isl1208.txt
deleted file mode 100644
index 51f003006f04..000000000000
--- a/Documentation/devicetree/bindings/rtc/isil,isl1208.txt
+++ /dev/null
@@ -1,38 +0,0 @@
-Intersil ISL1209/19 I2C RTC/Alarm chip with event in
-
-ISL12X9 have additional pins EVIN and #EVDET for tamper detection, while the
-ISL1208 and ISL1218 do not.  They are all use the same driver with the bindings
-described here, with chip specific properties as noted.
-
-Required properties supported by the device:
- - "compatible": Should be one of the following:
-		- "isil,isl1208"
-		- "isil,isl1209"
-		- "isil,isl1218"
-		- "isil,isl1219"
- - "reg": I2C bus address of the device
-
-Optional properties:
- - "interrupt-names": list which may contains "irq" and "evdet"
-	evdet applies to isl1209 and isl1219 only
- - "interrupts": list of interrupts for "irq" and "evdet"
-	evdet applies to isl1209 and isl1219 only
- - "isil,ev-evienb": Enable or disable internal pull on EVIN pin
-	Applies to isl1209 and isl1219 only
-	Possible values are 0 and 1
-	Value 0 enables internal pull-up on evin pin, 1 disables it.
-	Default will leave the non-volatile configuration of the pullup
-	as is.
-
-Example isl1219 node with #IRQ pin connected to SoC gpio1 pin12 and #EVDET pin
-connected to SoC gpio2 pin 24 and internal pull-up enabled in EVIN pin.
-
-	isl1219: rtc@68 {
-		compatible = "isil,isl1219";
-		reg = <0x68>;
-		interrupt-names = "irq", "evdet";
-		interrupts-extended = <&gpio1 12 IRQ_TYPE_EDGE_FALLING>,
-			<&gpio2 24 IRQ_TYPE_EDGE_FALLING>;
-		isil,ev-evienb = <1>;
-	};
-
diff --git a/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml b/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
new file mode 100644
index 000000000000..aee3c211d914
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/isil,isl1208.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Intersil ISL1209/19 I2C RTC/Alarm chip with event in
+
+maintainers:
+  - Trent Piepho <tpiepho@gmail.com>
+
+description: |
+  ISL12X9 have additional pins EVIN and #EVDET for tamper detection, while the
+  ISL1208 and ISL1218 do not.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - isil,isl1208
+          - isil,isl1209
+          - isil,isl1218
+          - isil,isl1219
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    maxItems: 2
+
+  interrupt-names:
+    items:
+      - const: irq
+      - const: evdet
+
+  isil,ev-evienb:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [ 0, 1 ]
+    description: |
+      Enable or disable internal pull on EVIN pin
+      Default will leave the non-volatile configuration of the pullup
+      as is.
+        <0> : Enables internal pull-up on evin pin
+        <1> : Disables internal pull-up on evin pin
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: rtc.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - isil,isl1209
+              - isil,isl1219
+    then:
+      properties:
+        interrupts:
+          maxItems: 2
+    else:
+      properties:
+        interrupts:
+          maxItems: 1
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        rtc_twi: rtc@6f {
+            compatible = "isil,isl1208";
+            reg = <0x6f>;
+        };
+    };
-- 
2.25.1

