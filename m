Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D37654F6E1
	for <lists+linux-rtc@lfdr.de>; Fri, 17 Jun 2022 13:44:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236384AbiFQLo2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 17 Jun 2022 07:44:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234717AbiFQLo2 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 17 Jun 2022 07:44:28 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 486E06AA5F;
        Fri, 17 Jun 2022 04:44:27 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id hj18so7654594ejb.0;
        Fri, 17 Jun 2022 04:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1UeNBa8WGFnUa9gvCmk5AGcklwHpEZHH/0gayeD8QyQ=;
        b=A1nxkAiVtT6rnVT0e1XeO1qypnRhE6/HX3I/rYpjU1HKjHBKoOR3dGoJXYmHK6Y9F2
         c83gYbkYXu3/K/6KyPceHsYnGllfcFzCM87L2d0DU7D+//Zg0S8lftClVgYVkjLZJmDF
         DtrDQ/YajqZkXhm5PbUcUQ7sn1hgAAr2BXjw9h+r+wXmsb2m8XN5oG/vc6P42RKrHfad
         2D6vQocd9EGlXcGaoHyAt5TEta8MYCUh7KhOHRN0LMnqF3P2rEUQI6LwqYMbhNgHKM8f
         5g53pTbUkIlcyzi8RAczA9NaNWo0QdSEGgd3q98oqplWZWlFrwVVBDjhq3NyjzW+Gl22
         ciMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1UeNBa8WGFnUa9gvCmk5AGcklwHpEZHH/0gayeD8QyQ=;
        b=GdygId77bPXpDRMbrGasiUdutXQyJrfSuhZm5rgDfUFiBNvKRU2+1R9N9h4qf59Fwu
         erwtGSX2QppgXewhCU8p/id/2XwrkYMfoAVQ+owSEWSzcD0DzvLUCqnHbXOt8KnGZjOl
         xkRFjG3PITwnUWt+yShVTjzbuk7SPQUTSOdWiD8w7/pmj+bG3QTf8JWFKPPzk5ZgiMJ+
         hNuwgNF7uYbald9pJklBrGZWJEsau81MkE2TEDQ3Vea+FFhCAdyi7/TFPz1j1LB8aNRy
         WNGCuJ13Ja7Y3VADMVRwSF+rpvCgrO5O2qrJ++IC5gsherXSBwjpnfOXrEWfs6yp3rM8
         BD5g==
X-Gm-Message-State: AJIora9jsmzEPFpKMgEC/I+eAbt1pzPPKH5KNnIfWBNYjv8oLnWl4iBx
        j/KOJ437BHf5fdepV280exU=
X-Google-Smtp-Source: AGRyM1sgQybvBxcClkOJqn0fHVX0FeraeeC5JCkT0NkXdfHW/HHhwv2GSYyosuTksywtkKcICzg2/w==
X-Received: by 2002:a17:907:c302:b0:711:cb4b:1382 with SMTP id tl2-20020a170907c30200b00711cb4b1382mr8736390ejc.476.1655466265619;
        Fri, 17 Jun 2022 04:44:25 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id g18-20020a17090604d200b0070d9aad64a1sm1990385eja.208.2022.06.17.04.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 04:44:24 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: rtc: ds1307: Convert to json-schema
Date:   Fri, 17 Jun 2022 13:44:19 +0200
Message-Id: <20220617114420.1398259-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Convert the DS1307 (and compatible) RTC bindings from the free-form text
format to json-schema.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- add compatible string list for [ st,m41t00, dallas,ds1338 ]
- allow second interrupt and interrupt-names
- remove commented-out section
- allow vcc-supply

 .../devicetree/bindings/rtc/rtc-ds1307.txt    |  52 ---------
 .../devicetree/bindings/rtc/rtc-ds1307.yaml   | 102 ++++++++++++++++++
 2 files changed, 102 insertions(+), 52 deletions(-)
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
index 000000000000..98d10e680144
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/rtc-ds1307.yaml
@@ -0,0 +1,102 @@
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
+    oneOf:
+      - enum:
+          - dallas,ds1307
+          - dallas,ds1308
+          - dallas,ds1337
+          - dallas,ds1338
+          - dallas,ds1339
+          - dallas,ds1388
+          - dallas,ds1340
+          - dallas,ds1341
+          - maxim,ds3231
+          - st,m41t0
+          - st,m41t00
+          - st,m41t11
+          - microchip,mcp7940x
+          - microchip,mcp7941x
+          - pericom,pt7c4338
+          - epson,rx8025
+          - isil,isl12057
+          - epson,rx8130
+
+      - items:
+          - enum:
+              - st,m41t00
+          - const: dallas,ds1338
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    maxItems: 2
+
+  interrupt-names:
+    maxItems: 2
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
+  vcc-supply: true
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
2.36.1

