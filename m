Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D68FB440C36
	for <lists+linux-rtc@lfdr.de>; Sun, 31 Oct 2021 00:51:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232051AbhJ3Wxn (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 30 Oct 2021 18:53:43 -0400
Received: from smtp2.axis.com ([195.60.68.18]:25911 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232023AbhJ3Wxm (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sat, 30 Oct 2021 18:53:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1635634272;
  x=1667170272;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lOpQfqpMsuNgZWc/EdM232nPPYSXeYpY0uJFl6xH1Mk=;
  b=lYaWwVDCmTzHTTONC+rQ7XQ3uyc7+WdDn4BTi+1sQdm78geyviv1RujM
   ZWTpTbgxnNmBEaMTmeYeSZ+X9V+ydpcNCvM+I7X4cPvrpiaWL1jQRBNhV
   jarezQBzu15cp0X9XMFcq3YpAGTpR3qCjddnaOPrdECNBtOijM4LfufFv
   a4ZQsYnzWQUAm2g0oodcivsYkptmW3HTuDNcbB5yKvhfnR2e4kF8A6rzZ
   HBBQ8Aa5bQoEh7kP23PhgE/WGd7xZGWAG0F+QTL6cTUtxx+2u5EVU6fBR
   fLJzqK+fHVnCK8vXf6kVpRoNmCUIfFmYWZovXvvoB531YF1IL1IVwPNaV
   g==;
From:   Pavel Modilaynen <pavel.modilaynen@axis.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <robh+dt@kernel.org>
CC:     <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <lkml@axis.com>, <kernel@axis.com>,
        "Pavel Modilaynen" <pavelmn@axis.com>
Subject: [PATCH 2/2] dt-bindings: rtc: Add bindings for Ricoh rs5c372
Date:   Sun, 31 Oct 2021 00:50:54 +0200
Message-ID: <20211030225054.32114-3-pavel.modilaynen@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211030225054.32114-1-pavel.modilaynen@axis.com>
References: <20211030225054.32114-1-pavel.modilaynen@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Pavel Modilaynen <pavelmn@axis.com>

Create new DT bindings yaml file for Ricoh rs5c372 driver
since adding property support naturally deserves it.
Place a description of this property: ricoh,trim.

Signed-off-by: Pavel Modilaynen <pavelmn@axis.com>
---
 .../bindings/rtc/ricoh,rs5c372.yaml           | 58 +++++++++++++++++++
 .../devicetree/bindings/rtc/trivial-rtc.yaml  | 12 ----
 2 files changed, 58 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/ricoh,rs5c372.yaml

diff --git a/Documentation/devicetree/bindings/rtc/ricoh,rs5c372.yaml b/Documentation/devicetree/bindings/rtc/ricoh,rs5c372.yaml
new file mode 100644
index 000000000000..6cb6a97db5d1
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/ricoh,rs5c372.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/ricoh,rs5c372.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ricoh RS5C372, R2025S/D, RV5C38[67] and R222[13] Real Time Clock
+
+maintainers:
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    enum:
+      - ricoh,r2025sd
+      - ricoh,r2221tl
+      - ricoh,rs5c372a
+      - ricoh,rs5c372b
+      - ricoh,rv5c386
+      - ricoh,rv5c387a
+
+  reg:
+    maxItems: 1
+
+  ricoh,trim:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description: |
+      Raw value of Oscillation Adjustment Register (0x7) which changes
+      time counts of 1 second. Normally, the second counter is incremented
+      once per 32768 clock pulses. The value causes to increment
+      decrement time counts when second digits read 00, 20, 40 seconds
+      (R222[13] can operate on 00 seconds if MSB set).
+      See datasheets for details.
+
+  start-year: true
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
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        rtc@32 {
+            compatible = "ricoh,r2221tl";
+            reg = <0x32>;
+            ricoh,trim = /bits/ 8 <0x23>;
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
index 13925bb78ec7..aeabede89654 100644
--- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
@@ -55,18 +55,6 @@ properties:
       - nxp,pcf2129
       # Real-time Clock Module
       - pericom,pt7c4338
-      # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
-      - ricoh,r2025sd
-      # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
-      - ricoh,r2221tl
-      # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
-      - ricoh,rs5c372a
-      # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
-      - ricoh,rs5c372b
-      # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
-      - ricoh,rv5c386
-      # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
-      - ricoh,rv5c387a
       # 2-wire CMOS real-time clock
       - sii,s35390a
       # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
-- 
2.20.1

