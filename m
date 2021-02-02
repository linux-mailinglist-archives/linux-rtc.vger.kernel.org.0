Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 916A530B3D8
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Feb 2021 01:07:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231301AbhBBAH0 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 1 Feb 2021 19:07:26 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:44713 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230517AbhBBAHY (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 1 Feb 2021 19:07:24 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 0D3E21BF206;
        Tue,  2 Feb 2021 00:06:36 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: rtc: pcf2127: update bindings
Date:   Tue,  2 Feb 2021 01:06:34 +0100
Message-Id: <20210202000634.3438575-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The NXP pcf2127 supports reset-source.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---

Changes in v2:
 - remove pcf219 and pca2129

 .../devicetree/bindings/rtc/nxp,pcf2127.yaml  | 51 +++++++++++++++++++
 .../devicetree/bindings/rtc/trivial-rtc.yaml  |  6 +--
 2 files changed, 52 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml

diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
new file mode 100644
index 000000000000..cde7b1675ead
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/nxp,pcf2127.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP PCF2127 Real Time Clock
+
+allOf:
+  - $ref: "rtc.yaml#"
+
+maintainers:
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+properties:
+  compatible:
+    const: nxp,pcf2127
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  start-year: true
+
+  reset-source: true
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
+            compatible = "nxp,pcf2127";
+            reg = <0x51>;
+            pinctrl-0 = <&rtc_nint_pins>;
+            interrupts-extended = <&gpio1 16 IRQ_TYPE_LEVEL_HIGH>;
+            reset-source;
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
index c7d14de214c4..7548d8714871 100644
--- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
@@ -48,12 +48,8 @@ properties:
       - microcrystal,rv3029
       # Real Time Clock
       - microcrystal,rv8523
-      # Real-time clock
-      - nxp,pcf2127
-      # Real-time clock
-      - nxp,pcf2129
-      # Real-time clock
       - nxp,pca2129
+      - nxp,pcf2129
       # Real-time Clock Module
       - pericom,pt7c4338
       # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
-- 
2.29.2

