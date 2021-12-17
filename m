Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94D07479251
	for <lists+linux-rtc@lfdr.de>; Fri, 17 Dec 2021 18:03:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234356AbhLQRDQ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 17 Dec 2021 12:03:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232554AbhLQRDP (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 17 Dec 2021 12:03:15 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7178AC061574;
        Fri, 17 Dec 2021 09:03:15 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id b73so2090017wmd.0;
        Fri, 17 Dec 2021 09:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+7QvCKPI/L+6WqBb049H46/2pOwo+Y564j35w+PmcZg=;
        b=NY3iMTxdfTn0FpwaE7yVFrADI/DOugvlkof8vc8L08VU28Yg6TdkrroPiw2OiTxYvA
         8cwGfw7wXa6ybwtBs3kRQNiDyxmLaFv7JH0nsLHSgS0R+Uuj7DUxZDj2ksOYpcr9cQGV
         DIi5D2O19VU1JwkV3uZ4J5oYTzBdSO+ZoqqAIRHPRZoqaOvosE3AxkYr9/eRpJ8utBFV
         Samkb/mBVaUed/dRBXcOhomkHLJrkRV39HGsTTRY2WjPjgMq28k80ptCi8GlDZJz2dOE
         CNUQsR9R0hwFFSOGNETkjAglNHGMrHP7wvZh3tbNHCJMRR3QQeWin17S0EsfVjXVOlmp
         FU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+7QvCKPI/L+6WqBb049H46/2pOwo+Y564j35w+PmcZg=;
        b=aT4AgvancNnLyZQ/AIhvk2R7HrPlY6cLsfKPUUvNQu0K9WBTjTQ1Y8ha3gHfLAvqqV
         f9tremesLTCXny4V4xYjDu2vcBHSy3TRR64Xm6ci96RtcXCCFptlHb33V8fuigo0MPAN
         /qLFOHfs4yvK5ARWjuNSbfGjuL+g89SYg39Ude09mn/igS39b/7ZNSbj72veut51mgol
         tZCYznTG9ZH6t5Kwlk7E5LwdVRVN/eTeQYdazji5Us5nQb/ke24aWlhMDk80itLNrmtY
         +rVB+yXyj+1AoFeVcTmT33WSVVGI76vYPQTHguFILNIdUdyNbrhViuhQFzu/KPJXvfFn
         jbQA==
X-Gm-Message-State: AOAM530551ZLBq6rEFp5SBayKNfr4Dr533Qenfdim1MS0ZSAJ9KthI45
        luYsRSs3Ot49ZxKylrzLuZu+ckyDXxChvw==
X-Google-Smtp-Source: ABdhPJxTY4N54XmHjnnfm9if6y0t1o0nE9jqSZigwO8nq5Y0uHlitqbH2fl7aAYnwc1Mu6WQx9HTnA==
X-Received: by 2002:a05:600c:19cb:: with SMTP id u11mr6934771wmq.142.1639760594014;
        Fri, 17 Dec 2021 09:03:14 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id b10sm8943721wri.78.2021.12.17.09.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 09:03:13 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: rtc: ds1307: Convert to json-schema
Date:   Fri, 17 Dec 2021 18:03:10 +0100
Message-Id: <20211217170311.2796798-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Convert the DS1307 (and compatible) RTC bindings from the free-form text
format to json-schema.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/rtc/rtc-ds1307.txt    |  52 ---------
 .../devicetree/bindings/rtc/rtc-ds1307.yaml   | 104 ++++++++++++++++++
 2 files changed, 104 insertions(+), 52 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-ds1307.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-ds1307.yaml

diff --git a/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt b/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt
deleted file mode 100644
index 36f610bb051e..000000000000
--- a/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt
+++ /dev/null
@@ -1,52 +0,0 @@
-Dallas DS1307 and compatible RTC
-
-Required properties:
-- compatible: should be one of:
-	"dallas,ds1307",
-	"dallas,ds1308",
-	"dallas,ds1337",
-	"dallas,ds1338",
-	"dallas,ds1339",
-	"dallas,ds1388",
-	"dallas,ds1340",
-	"dallas,ds1341",
-	"maxim,ds3231",
-	"st,m41t0",
-	"st,m41t00",
-	"st,m41t11",
-	"microchip,mcp7940x",
-	"microchip,mcp7941x",
-	"pericom,pt7c4338",
-	"epson,rx8025",
-	"isil,isl12057"
-	"epson,rx8130"
-- reg: I2C bus address of the device
-
-Optional properties:
-- interrupts: rtc alarm interrupt.
-- clock-output-names: From common clock binding to override the default output
-                      clock name
-- wakeup-source: Enables wake up of host system on alarm
-- trickle-resistor-ohms : ds1339, ds1340 and ds 1388 only
-	Selected resistor for trickle charger
-	Possible values are 250, 2000, 4000
-	Should be given if trickle charger should be enabled
-- aux-voltage-chargeable: ds1339, ds1340, ds1388 and rx8130 only
-	Tells whether the battery/supercap of the RTC (if any) is
-	chargeable or not.
-	Possible values are 0 (not chargeable), 1 (chargeable)
-
-Deprecated properties:
-- trickle-diode-disable : ds1339, ds1340 and ds1388 only
-	Do not use internal trickle charger diode
-	Should be given if internal trickle charger diode should be disabled
-	(superseded by aux-voltage-chargeable)
-
-Example:
-	ds1339: rtc@68 {
-		compatible = "dallas,ds1339";
-		reg = <0x68>;
-		interrupt-parent = <&gpio4>;
-		interrupts = <20 0>;
-		trickle-resistor-ohms = <250>;
-	};
diff --git a/Documentation/devicetree/bindings/rtc/rtc-ds1307.yaml b/Documentation/devicetree/bindings/rtc/rtc-ds1307.yaml
new file mode 100644
index 000000000000..df0b55938bda
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/rtc-ds1307.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/rtc-ds1307.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Dallas DS1307 and compatible RTC
+
+maintainers:
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+properties:
+  compatible:
+    enum:
+      - dallas,ds1307
+      - dallas,ds1308
+      - dallas,ds1337
+      - dallas,ds1338
+      - dallas,ds1339
+      - dallas,ds1388
+      - dallas,ds1340
+      - dallas,ds1341
+      - maxim,ds3231
+      - st,m41t0
+      - st,m41t00
+      - st,m41t11
+      - microchip,mcp7940x
+      - microchip,mcp7941x
+      - pericom,pt7c4338
+      - epson,rx8025
+      - isil,isl12057
+      - epson,rx8130
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+
+  clock-output-names:
+    description: From common clock binding to override the default output clock name.
+
+  wakeup-source:
+    description: Enables wake up of host system on alarm.
+
+allOf:
+  - $ref: rtc.yaml
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - dallas,ds1339
+              - dallas,ds1340
+              - dallas,ds1388
+    then:
+      properties:
+        trickle-resistor-ohms:
+          description: Selected resistor for trickle charger. Should be specified if trickle
+            charger should be enabled.
+          enum: [ 250, 2000, 4000 ]
+
+        trickle-diode-disable:
+          description: Do not use internal trickle charger diode. Should be given if internal
+            trickle charger diode should be disabled (superseded by aux-voltage-chargeable)
+          deprecated: true
+
+#  - if:
+#      properties:
+#        compatible:
+#          not:
+#            contains:
+#              enum:
+#                - dallas,ds1339
+#                - dallas,ds1340
+#                - dallas,ds1388
+#                - epson,rx8130
+#    then:
+#      properties:
+#        aux-voltage-chargeable: false
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      rtc@68 {
+        compatible = "dallas,ds1337";
+        reg = <0x68>;
+        interrupt-parent = <&gpio4>;
+        interrupts = <20 0>;
+        trickle-resistor-ohms = <250>;
+      };
+    };
-- 
2.34.1

