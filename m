Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CB603A216D
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Jun 2021 02:28:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbhFJAav (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 9 Jun 2021 20:30:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbhFJAav (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 9 Jun 2021 20:30:51 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B15C4C061574;
        Wed,  9 Jun 2021 17:28:55 -0700 (PDT)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 17CE182D15;
        Thu, 10 Jun 2021 02:28:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1623284932;
        bh=wFd/qRWTKJWKzM4Q4EEo/8l+uBRGY8gyeffvoSBXWxs=;
        h=From:To:Cc:Subject:Date:From;
        b=JMj8Z+tUfNVU95q+6bkzprmaB/SkzoOV/T7Wfss6p6GhCcPiWa4Pve+q+n/sQ3bN2
         rMSaauawAh0ZTfozA1UtgphkoE0tEY+QS5N5doJEIqVDL7N8ha7vujwy4MD+3bFHfI
         2T/4BGQfZuLsZ5lGTxr76esaLd9JsV4sa7b5XL4GdicKvLIGu+cJ5u56PHN8dzCJ+J
         A+rCRkRaztWPGM10za/d6K8UjtpkMqzxkrMNRSMULYSjA+A7RV0NSF4/qohGxqFJvF
         R1nu6wVVhgbSztUkEOyUWOJUs0hLEFgMGrBpf9PYSz4uVLa7aGgB88tOFITC+/6Npy
         ny2LoED3EXLaQ==
From:   Marek Vasut <marex@denx.de>
To:     devicetree@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh@kernel.org>, kernel@dh-electronics.com,
        linux-rtc@vger.kernel.org
Subject: [PATCH] dt-bindings: rtc: rx8900: Convert to YAML schema
Date:   Thu, 10 Jun 2021 02:28:41 +0200
Message-Id: <20210610002841.134200-1-marex@denx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Convert the Epson RX8900 DT bindings to YAML schema.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>
Cc: kernel@dh-electronics.com
Cc: linux-rtc@vger.kernel.org
To: devicetree@vger.kernel.org
---
 .../devicetree/bindings/rtc/epson,rx8900.txt  | 22 ---------
 .../devicetree/bindings/rtc/epson,rx8900.yaml | 49 +++++++++++++++++++
 2 files changed, 49 insertions(+), 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/epson,rx8900.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/epson,rx8900.yaml

diff --git a/Documentation/devicetree/bindings/rtc/epson,rx8900.txt b/Documentation/devicetree/bindings/rtc/epson,rx8900.txt
deleted file mode 100644
index 3f61e516ecf6..000000000000
--- a/Documentation/devicetree/bindings/rtc/epson,rx8900.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Real Time Clock driver for:
-  - Epson RX8900
-  - Micro Crystal rv8803
-
-Required properties:
-- compatible: should be: "microcrystal,rv8803" or "epson,rx8900"
-- reg : the I2C address of the device for I2C
-
-Optional properties:
-- epson,vdet-disable : boolean, if present will disable voltage detector.
-  Should be set if no backup battery is used.
-- trickle-diode-disable : boolean, if present will disable internal trickle
-  charger diode
-
-Example:
-
-	rtc: rtc@32 {
-		compatible = "epson,rx8900"
-		reg = <0x32>;
-		epson,vdet-disable;
-		trickle-diode-disable;
-	};
diff --git a/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml b/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml
new file mode 100644
index 000000000000..92ea28de9a3f
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/epson,rx8900.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: EPSON RX8900 / Microcrystal RV8803 Real-Time Clock DT bindings
+
+maintainers:
+  - Marek Vasut <marex@denx.de>
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    enum:
+      - epson,rx8900
+      - microcrystal,rv8803
+
+  reg:
+    maxItems: 1
+
+  epson,vdet-disable:
+    type: boolean
+    description: |
+      Disable voltage detector. Should be set if no backup battery is used.
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
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        rtc@32 {
+            compatible = "epson,rx8900";
+            reg = <0x32>;
+            epson,vdet-disable;
+            trickle-diode-disable;
+        };
+    };
-- 
2.30.2

