Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C50B412CAD2
	for <lists+linux-rtc@lfdr.de>; Sun, 29 Dec 2019 21:45:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbfL2UpD (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 29 Dec 2019 15:45:03 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:39295 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726302AbfL2UpC (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 29 Dec 2019 15:45:02 -0500
X-Originating-IP: 92.184.100.83
Received: from localhost (unknown [92.184.100.83])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 74922C0002;
        Sun, 29 Dec 2019 20:45:00 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     Nicolas Ferre <nicolas.ferre@microchip.com>,
        Eugen.Hristev@microchip.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 2/9] dt-bindings: rtc: at91rm9200: convert bindings to json-schema
Date:   Sun, 29 Dec 2019 21:44:14 +0100
Message-Id: <20191229204421.337612-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191229204421.337612-1-alexandre.belloni@bootlin.com>
References: <20191229204421.337612-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Convert Real Time Clock for Atmel/Microchip SoCs bindings documentation
to json-schema.

Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 .../bindings/rtc/atmel,at91rm9200-rtc.txt     | 17 --------
 .../bindings/rtc/atmel,at91rm9200-rtc.yaml    | 42 +++++++++++++++++++
 2 files changed, 42 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.txt b/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.txt
deleted file mode 100644
index 5d3791e789c6..000000000000
--- a/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Atmel AT91RM9200 Real Time Clock
-
-Required properties:
-- compatible: should be: "atmel,at91rm9200-rtc" or "atmel,at91sam9x5-rtc"
-- reg: physical base address of the controller and length of memory mapped
-  region.
-- interrupts: rtc alarm/event interrupt
-- clocks: phandle to input clock.
-
-Example:
-
-rtc@fffffe00 {
-	compatible = "atmel,at91rm9200-rtc";
-	reg = <0xfffffe00 0x100>;
-	interrupts = <1 4 7>;
-	clocks = <&clk32k>;
-};
diff --git a/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml b/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml
new file mode 100644
index 000000000000..55bd87e884d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/atmel,at91rm9200-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel AT91 RTC Device Tree Bindings
+
+allOf:
+  - $ref: "rtc.yaml#"
+
+maintainers:
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+properties:
+  compatible:
+    enum:
+      - atmel,at91rm9200-rtc
+      - atmel,at91sam9x5-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    rtc@fffffe00 {
+        compatible = "atmel,at91rm9200-rtc";
+        reg = <0xfffffe00 0x100>;
+        interrupts = <1 4 7>;
+        clocks = <&clk32k>;
+    };
+...
-- 
2.23.0

