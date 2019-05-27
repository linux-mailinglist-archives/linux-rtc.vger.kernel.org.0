Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D62172B3D6
	for <lists+linux-rtc@lfdr.de>; Mon, 27 May 2019 14:00:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726888AbfE0MA5 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 27 May 2019 08:00:57 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:49423 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726946AbfE0MA5 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 27 May 2019 08:00:57 -0400
Received: from localhost (aaubervilliers-681-1-27-134.w90-88.abo.wanadoo.fr [90.88.147.134])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id C4282200011;
        Mon, 27 May 2019 12:00:53 +0000 (UTC)
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rtc@vger.kernel.org
Subject: [PATCH 04/10] dt-bindings: rtc: Convert Allwinner A31 RTC to a schema
Date:   Mon, 27 May 2019 14:00:36 +0200
Message-Id: <e345cb06e54ce80db07e96c2cf2ef51794130585.1558958381.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <290402405a34506997fd2fab2c4c1486dbe6b7e5.1558958381.git-series.maxime.ripard@bootlin.com>
References: <290402405a34506997fd2fab2c4c1486dbe6b7e5.1558958381.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The newer Allwinner SoCs have an embedded RTC supported in Linux, with a
matching Device Tree binding.

Now that we have the DT validation in place, let's convert the device tree
bindings for that controller over to a YAML schemas.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml | 112 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 Documentation/devicetree/bindings/rtc/sun6i-rtc.txt                |  46 +------------------------------
 2 files changed, 112 insertions(+), 46 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
 delete mode 100644 Documentation/devicetree/bindings/rtc/sun6i-rtc.txt

diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
new file mode 100644
index 000000000000..942ddfc1689d
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/allwinner,sun6i-a31-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A31 RTC Device Tree Bindings
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <maxime.ripard@bootlin.com>
+
+properties:
+  "#clock-cells":
+    const: 1
+
+  compatible:
+    oneOf:
+      - const: allwinner,sun6i-a31-rtc
+      - const: allwinner,sun8i-a23-rtc
+      - const: allwinner,sun8i-h3-rtc
+      - const: allwinner,sun8i-v3-rtc
+      - const: allwinner,sun50i-h5-rtc
+      - items:
+          - const: allwinner,sun50i-a64-rtc
+          - const: allwinner,sun8i-h3-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: RTC Alarm 0
+      - description: RTC Alarm 1
+
+  clocks:
+    maxItems: 1
+
+  clock-output-names:
+    minItems: 1
+    maxItems: 3
+    description:
+      The RTC provides up to three clocks
+        - the Low Frequency Oscillator or LOSC, at index 0,
+        - the Low Frequency Oscillator External output (X32KFOUT in
+          the datasheet), at index 1,
+        - the Internal Oscillator, at index 2.
+
+allOf:
+  - $ref: "rtc.yaml#"
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun6i-a31-rtc
+
+    then:
+      properties:
+        clock-output-names:
+          minItems: 1
+          maxItems: 1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun8i-a23-rtc
+              - allwinner,sun8i-v3-rtc
+
+    then:
+      properties:
+        clock-output-names:
+          minItems: 2
+          maxItems: 2
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun8i-h3-rtc
+              - allwinner,sun50i-h5-rtc
+
+    then:
+      properties:
+        clock-output-names:
+          minItems: 3
+          maxItems: 3
+
+required:
+  - "#clock-cells"
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-output-names
+
+additionalProperties: false
+
+examples:
+  - |
+    rtc: rtc@1f00000 {
+        compatible = "allwinner,sun6i-a31-rtc";
+        reg = <0x01f00000 0x400>;
+        interrupts = <0 40 4>, <0 41 4>;
+        clock-output-names = "osc32k";
+        clocks = <&ext_osc32k>;
+        #clock-cells = <1>;
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/rtc/sun6i-rtc.txt b/Documentation/devicetree/bindings/rtc/sun6i-rtc.txt
deleted file mode 100644
index 6b732c41392b..000000000000
--- a/Documentation/devicetree/bindings/rtc/sun6i-rtc.txt
+++ /dev/null
@@ -1,46 +0,0 @@
-* sun6i Real Time Clock
-
-RTC controller for the Allwinner A31
-
-Required properties:
-- compatible	: Should be one of the following combinations:
-		    - "allwinner,sun6i-a31-rtc"
-		    - "allwinner,sun8i-a23-rtc"
-		    - "allwinner,sun8i-h3-rtc"
-		    - "allwinner,sun8i-r40-rtc", "allwinner,sun8i-h3-rtc"
-		    - "allwinner,sun8i-v3-rtc"
-		    - "allwinner,sun50i-a64-rtc", "allwinner,sun8i-h3-rtc"
-		    - "allwinner,sun50i-h5-rtc"
-
-		  Where there are two or more compatible strings, this
-		  denotes the hardware covered by the most specific one
-		  is backward-compatible with the latter ones, and the
-		  implementation for the latter ones can be used, albeit
-		  with reduced functionality.
-
-- reg		: physical base address of the controller and length of
-		  memory mapped region.
-- interrupts	: IRQ lines for the RTC alarm 0 and alarm 1, in that order.
-
-Required properties for new device trees
-- clocks	: phandle to the 32kHz external oscillator
-- clock-output-names : names of up to three clock outputs. See below.
-- #clock-cells  : must be equal to 1.
-
-The RTC provides the following clocks at the given indices:
-- 0: LOSC
-- 1: LOSC external output, known as X32KFOUT in the datasheet.
-     This clock is not available on the A31 and is deprecated for old
-     device trees still using the "allwinner,sun6i-a31-rtc" compatible.
-- 2: InternalOSC, or internal RC oscillator (A64/H3/H5 only)
-
-Example:
-
-rtc: rtc@1f00000 {
-	compatible = "allwinner,sun6i-a31-rtc";
-	reg = <0x01f00000 0x400>;
-	interrupts = <0 40 4>, <0 41 4>;
-	clock-output-names = "osc32k";
-	clocks = <&ext_osc32k>;
-	#clock-cells = <1>;
-};
-- 
git-series 0.9.1
