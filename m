Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 335BF286AA9
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Oct 2020 00:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728575AbgJGWFN (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 7 Oct 2020 18:05:13 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:51817 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728780AbgJGWFN (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 7 Oct 2020 18:05:13 -0400
X-Originating-IP: 90.65.88.165
Received: from localhost (lfbn-lyo-1-1908-165.w90-65.abo.wanadoo.fr [90.65.88.165])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 1C161FF805;
        Wed,  7 Oct 2020 22:05:09 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindings: rtc: rv3032: add RV-3023 bindings
Date:   Thu,  8 Oct 2020 00:05:05 +0200
Message-Id: <20201007220506.360469-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201007220506.360469-1-alexandre.belloni@bootlin.com>
References: <20201007220506.360469-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Document the Microcrystal RV-3032 device tree bindings

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
Changes in v2:
 - use millivolt suffix instead of mV

 .../bindings/rtc/microcrystal,rv3032.yaml     | 64 +++++++++++++++++++
 .../devicetree/bindings/rtc/rtc.yaml          |  3 +-
 2 files changed, 65 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/microcrystal,rv3032.yaml

diff --git a/Documentation/devicetree/bindings/rtc/microcrystal,rv3032.yaml b/Documentation/devicetree/bindings/rtc/microcrystal,rv3032.yaml
new file mode 100644
index 000000000000..a2c55303810d
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/microcrystal,rv3032.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/microcrystal,rv3032.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip RV-3032 RTC Device Tree Bindings
+
+allOf:
+  - $ref: "rtc.yaml#"
+
+maintainers:
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+properties:
+  compatible:
+    const: microcrystal,rv3032
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  start-year: true
+
+  trickle-resistor-ohms:
+    enum:
+      - 1000
+      - 2000
+      - 7000
+      - 11000
+
+  trickle-voltage-millivolt:
+    enum:
+      - 1750
+      - 3000
+      - 4400
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        rtc@51 {
+            compatible = "microcrystal,rv3032";
+            reg = <0x51>;
+            status = "okay";
+            pinctrl-0 = <&rtc_nint_pins>;
+            interrupts-extended = <&gpio1 16 IRQ_TYPE_LEVEL_HIGH>;
+            trickle-resistor-ohms = <7000>;
+            trickle-voltage-millivolt = <1750>;
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/rtc/rtc.yaml b/Documentation/devicetree/bindings/rtc/rtc.yaml
index 93f04d5e5307..538f3f9b29a2 100644
--- a/Documentation/devicetree/bindings/rtc/rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/rtc.yaml
@@ -42,8 +42,7 @@ properties:
       Selected resistor for trickle charger. Should be given
       if trickle charger should be enabled.
 
-  trickle-voltage-mV:
-    $ref: /schemas/types.yaml#/definitions/uint32
+  trickle-voltage-millivolt:
     description:
       Selected voltage for trickle charger. Should be given
       if trickle charger should be enabled and the trickle voltage is different
-- 
2.26.2

