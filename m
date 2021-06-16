Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2AED3A9CAF
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Jun 2021 15:53:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233664AbhFPNzL (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 16 Jun 2021 09:55:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233692AbhFPNx7 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 16 Jun 2021 09:53:59 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0995C0617A8
        for <linux-rtc@vger.kernel.org>; Wed, 16 Jun 2021 06:51:48 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:cc2e:97ae:7127:22f8])
        by andre.telenet-ops.be with bizsmtp
        id Hprl2500b51zX4F01prlsJ; Wed, 16 Jun 2021 15:51:46 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ltVxJ-000HIQ-BO; Wed, 16 Jun 2021 15:51:45 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ltVxI-006MUc-Mb; Wed, 16 Jun 2021 15:51:44 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: rtc: ti,bq32k: Convert to json-schema
Date:   Wed, 16 Jun 2021 15:51:43 +0200
Message-Id: <42d9c71b4ee1f120e0cdcf6b266547d29d1fb9a4.1623851377.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Convert the TI BQ32000 I2C Serial Real-Time Clock Device Tree binding
documentation to json-schema.

Document missing properties.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/rtc/ti,bq32000.yaml   | 49 +++++++++++++++++++
 .../devicetree/bindings/rtc/ti,bq32k.txt      | 18 -------
 2 files changed, 49 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/ti,bq32000.yaml
 delete mode 100644 Documentation/devicetree/bindings/rtc/ti,bq32k.txt

diff --git a/Documentation/devicetree/bindings/rtc/ti,bq32000.yaml b/Documentation/devicetree/bindings/rtc/ti,bq32000.yaml
new file mode 100644
index 0000000000000000..392bd71bd1bee25c
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/ti,bq32000.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/ti,bq32000.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI BQ32000 I2C Serial Real-Time Clock
+
+maintainers:
+  - Pavel Machek <pavel@ucw.cz>
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    const: ti,bq32000
+
+  reg:
+    const: 0x68
+
+  interrupts:
+    maxItems: 1
+
+  start-year: true
+
+  trickle-resistor-ohms:
+    enum: [ 1120, 20180 ]
+
+  trickle-diode-disable: true
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            bq32000: rtc@68 {
+                    compatible = "ti,bq32000";
+                    reg = <0x68>;
+                    trickle-resistor-ohms = <1120>;
+            };
+    };
diff --git a/Documentation/devicetree/bindings/rtc/ti,bq32k.txt b/Documentation/devicetree/bindings/rtc/ti,bq32k.txt
deleted file mode 100644
index e204906b9ad3b161..0000000000000000
--- a/Documentation/devicetree/bindings/rtc/ti,bq32k.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-* TI BQ32000                I2C Serial Real-Time Clock
-
-Required properties:
-- compatible: Should contain "ti,bq32000".
-- reg: I2C address for chip
-
-Optional properties:
-- trickle-resistor-ohms : Selected resistor for trickle charger
-       Values usable are 1120 and 20180
-       Should be given if trickle charger should be enabled
-- trickle-diode-disable : Do not use internal trickle charger diode
-       Should be given if internal trickle charger diode should be disabled
-Example:
-       bq32000: rtc@68 {
-               compatible = "ti,bq32000";
-               trickle-resistor-ohms = <1120>;
-               reg = <0x68>;
-       };
-- 
2.25.1

