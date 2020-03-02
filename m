Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 577EE17661F
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Mar 2020 22:40:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726876AbgCBVkU (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 2 Mar 2020 16:40:20 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:40292 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726700AbgCBVkT (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 2 Mar 2020 16:40:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1583185211; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BGwq+fhag28ClFaNMhFdV25yYzPJLioisKoVSy4cwhc=;
        b=tl1O4K9YHPqpP/GsqLu9svrpCSz0veCI95ciwXCA+E+ILkxuYAI4uKIGaE5Q8BK4tlumUF
        k1Ks6FAwqPsfzLDBMPufgMm1FyQt4fffJkX/AFULozEojZNKdLTNbmuCHmbmfMPiUcpK3i
        ksKEkoxDwsYYX54TlSfRvTjNdgEigJM=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     od@zcrc.me,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 3/3] dt-bindings: rtc: Convert and update jz4740-rtc doc to YAML
Date:   Mon,  2 Mar 2020 18:39:53 -0300
Message-Id: <20200302213953.28834-3-paul@crapouillou.net>
In-Reply-To: <20200302213953.28834-1-paul@crapouillou.net>
References: <20200302213953.28834-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Convert the jz4740-rtc doc to YAML, and update it to reflect the new
changes in the driver:
- More compatible strings are specified, with fallbacks if needed,
- The vendor-specific properties are now properly prefixed with the
  'ingenic,' prefix.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 .../bindings/rtc/ingenic,jz4740-rtc.txt       | 37 --------
 .../devicetree/bindings/rtc/ingenic,rtc.yaml  | 87 +++++++++++++++++++
 2 files changed, 87 insertions(+), 37 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/ingenic,jz4740-rtc.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/ingenic,rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/ingenic,jz4740-rtc.txt b/Documentation/devicetree/bindings/rtc/ingenic,jz4740-rtc.txt
deleted file mode 100644
index 41c7ae18fd7b..000000000000
--- a/Documentation/devicetree/bindings/rtc/ingenic,jz4740-rtc.txt
+++ /dev/null
@@ -1,37 +0,0 @@
-JZ4740 and similar SoCs real-time clock driver
-
-Required properties:
-
-- compatible: One of:
-  - "ingenic,jz4740-rtc" - for use with the JZ4740 SoC
-  - "ingenic,jz4780-rtc" - for use with the JZ4780 SoC
-- reg: Address range of rtc register set
-- interrupts: IRQ number for the alarm interrupt
-- clocks: phandle to the "rtc" clock
-- clock-names: must be "rtc"
-
-Optional properties:
-- system-power-controller: To use this component as the
-  system power controller
-- reset-pin-assert-time-ms: Reset pin low-level assertion
-  time after wakeup (default 60ms; range 0-125ms if RTC clock
-  at 32 kHz)
-- min-wakeup-pin-assert-time-ms: Minimum wakeup pin assertion
-  time (default 100ms; range 0-2s if RTC clock at 32 kHz)
-
-Example:
-
-rtc@10003000 {
-	compatible = "ingenic,jz4740-rtc";
-	reg = <0x10003000 0x40>;
-
-	interrupt-parent = <&intc>;
-	interrupts = <32>;
-
-	clocks = <&rtc_clock>;
-	clock-names = "rtc";
-
-	system-power-controller;
-	reset-pin-assert-time-ms = <60>;
-	min-wakeup-pin-assert-time-ms = <100>;
-};
diff --git a/Documentation/devicetree/bindings/rtc/ingenic,rtc.yaml b/Documentation/devicetree/bindings/rtc/ingenic,rtc.yaml
new file mode 100644
index 000000000000..c18ed8ac263f
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/ingenic,rtc.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/ingenic,rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ingenic SoCs Real-Time Clock DT bindings
+
+maintainers:
+  - Paul Cercueil <paul@crapouillou.net>
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+        - ingenic,jz4740-rtc
+        - ingenic,jz4760-rtc
+      - items:
+        - const: ingenic,jz4725b-rtc
+        - const: ingenic,jz4740-rtc
+      - items:
+        - enum:
+          - ingenic,jz4770-rtc
+          - ingenic,jz4780-rtc
+        - const: ingenic,jz4760-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: rtc
+
+  system-power-controller:
+    description: |
+      Indicates that the RTC is responsible for powering OFF
+      the system.
+    type: boolean
+
+  ingenic,reset-pin-assert-time-ms:
+    description: |
+      Reset pin low-level assertion time after wakeup
+      (assuming RTC clock at 32 kHz)
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - minimum: 0
+      - maximum: 125
+      - default: 60
+
+  ingenic,min-wakeup-pin-assert-time-ms:
+    description: |
+      Minimum wakeup pin assertion time
+      (assuming RTC clock at 32 kHz)
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - minimum: 0
+      - maximum: 2000
+      - default: 100
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+examples:
+  - |
+    #include <dt-bindings/clock/jz4740-cgu.h>
+    rtc_dev: rtc@10003000 {
+      compatible = "ingenic,jz4740-rtc";
+      reg = <0x10003000 0x40>;
+
+      interrupt-parent = <&intc>;
+      interrupts = <15>;
+
+      clocks = <&cgu JZ4740_CLK_RTC>;
+      clock-names = "rtc";
+    };
-- 
2.25.1

