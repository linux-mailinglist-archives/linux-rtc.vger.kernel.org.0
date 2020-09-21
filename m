Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A4E42730DD
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Sep 2020 19:30:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727851AbgIUR3n (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 21 Sep 2020 13:29:43 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:37394 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726419AbgIUR3k (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 21 Sep 2020 13:29:40 -0400
X-Greylist: delayed 718 seconds by postgrey-1.27 at vger.kernel.org; Mon, 21 Sep 2020 13:29:39 EDT
Received: from relay4-d.mail.gandi.net (unknown [217.70.183.196])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id A63A03A6793;
        Mon, 21 Sep 2020 17:18:02 +0000 (UTC)
X-Originating-IP: 90.65.88.165
Received: from localhost (lfbn-lyo-1-1908-165.w90-65.abo.wanadoo.fr [90.65.88.165])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id A4F5BE0002;
        Mon, 21 Sep 2020 17:17:40 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: rtc: rv3032: add RV-3023 bindings
Date:   Mon, 21 Sep 2020 19:17:33 +0200
Message-Id: <20200921171735.1191342-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200921171735.1191342-1-alexandre.belloni@bootlin.com>
References: <20200921171735.1191342-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Document the Microcrystal RV-3032 device tree bindings

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 .../bindings/rtc/microcrystal,rv3032.yaml     | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/microcrystal,rv3032.yaml

diff --git a/Documentation/devicetree/bindings/rtc/microcrystal,rv3032.yaml b/Documentation/devicetree/bindings/rtc/microcrystal,rv3032.yaml
new file mode 100644
index 000000000000..17411125f0b4
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
+  trickle-voltage-mV:
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
+            trickle-voltage-mV = <1750>;
+        };
+    };
+
+...
-- 
2.26.2

