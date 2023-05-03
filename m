Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56E126F5392
	for <lists+linux-rtc@lfdr.de>; Wed,  3 May 2023 10:46:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbjECIq3 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 3 May 2023 04:46:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbjECIq2 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 3 May 2023 04:46:28 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7127E49CA;
        Wed,  3 May 2023 01:46:26 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.99,246,1677510000"; 
   d="scan'208";a="158019835"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 03 May 2023 17:46:26 +0900
Received: from localhost.localdomain (unknown [10.226.92.153])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id CCA6D41C6679;
        Wed,  3 May 2023 17:46:22 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Trent Piepho <tpiepho@impinj.com>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH RFC 3/6] dt-bindings: rtc: isl1208: Convert to json-schema
Date:   Wed,  3 May 2023 09:46:05 +0100
Message-Id: <20230503084608.14008-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230503084608.14008-1-biju.das.jz@bp.renesas.com>
References: <20230503084608.14008-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Convert the isl1208 RTC device tree binding documentation to json-schema.

Update the example to match reality.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../devicetree/bindings/rtc/isil,isl1208.txt  | 38 ----------
 .../devicetree/bindings/rtc/isil,isl1208.yaml | 74 +++++++++++++++++++
 2 files changed, 74 insertions(+), 38 deletions(-)
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
index 000000000000..04d51887855f
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/isil,isl1208.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Intersil ISL12{08,09,18,19} I2C RTC/Alarm chip
+
+maintainers:
+  - Biju Das <biju.das.jz@bp.renesas.com>
+  - Trent Piepho <tpiepho@impinj.com>
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
+    default: 0
+    description: |
+      Enable or disable internal pull on EVIN pin:
+        <0> : Enable internal pull-up
+        <1> : Disable internal pull-up
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
+      required:
+        - interrupts-extended
+        - interrupt-names
+        - isil,ev-evienb
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

