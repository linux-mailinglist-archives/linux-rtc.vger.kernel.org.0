Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05124649227
	for <lists+linux-rtc@lfdr.de>; Sun, 11 Dec 2022 04:01:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229965AbiLKDBN (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 10 Dec 2022 22:01:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229909AbiLKDBM (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 10 Dec 2022 22:01:12 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13C6A303;
        Sat, 10 Dec 2022 19:01:09 -0800 (PST)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id AAF94852A9;
        Sun, 11 Dec 2022 04:01:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1670727666;
        bh=18upj2ctjUcqOpNeYXJ1aoD2x9negKba1i7phTKzLYY=;
        h=From:To:Cc:Subject:Date:From;
        b=l+00lHn+R31uDiv7dAECZ2tMmO01Ap/hR7hn03qj0CVVKCj+ytdD9OyR9o1EFdgTd
         mIgxNBAQbqhRcwojasw6tmu5RGFJ6UCytc9vNcTRHriDpa07ZrrXGoAZkb3taqxVqy
         a5/QCUkQM7XejZkfCxF5lwIYg4ZnX6+EvbRklxGwSs2GuZp/gmb6Zsoudti/6oLNv2
         0Brlm6lVf+i0SCRoM+jTrMszXtvXjptVMroZVYvdH8ydw+tpjOi38lXEfkkXYYmIYb
         Ipje9w0IgpAbvYROGhhVDbW+a2yUrYDC8narA2uDtYQRcnvp1Kr8Hilb4P9kclG0xb
         GSfgiUxq/XRMA==
From:   Marek Vasut <marex@denx.de>
To:     devicetree@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-rtc@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: rtc: m41t80: Convert text schema to YAML one
Date:   Sun, 11 Dec 2022 04:00:53 +0100
Message-Id: <20221211030054.672717-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Convert the m41t80 text schema to YAML schema.

Add "#clock-cells" requirement, which is required by clock-output-names.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-rtc@vger.kernel.org
To: devicetree@vger.kernel.org
---
V2: - Add maxItems:1 to clock-output-names
    - Skip wakeup-source property, comes from rtc.yaml
    - Mention the new clock-cells requirement coming from
      clock-output-names property.
    - Rename rtc-m41t80.txt to st,m41t80.yaml
---
 .../devicetree/bindings/rtc/rtc-m41t80.txt    | 39 ----------
 .../devicetree/bindings/rtc/st,m41t80.yaml    | 73 +++++++++++++++++++
 2 files changed, 73 insertions(+), 39 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-m41t80.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/st,m41t80.yaml

diff --git a/Documentation/devicetree/bindings/rtc/rtc-m41t80.txt b/Documentation/devicetree/bindings/rtc/rtc-m41t80.txt
deleted file mode 100644
index cdd196b1e9bdb..0000000000000
--- a/Documentation/devicetree/bindings/rtc/rtc-m41t80.txt
+++ /dev/null
@@ -1,39 +0,0 @@
-ST M41T80 family of RTC and compatible
-
-Required properties:
-- compatible: should be one of:
-	"st,m41t62",
-	"st,m41t65",
-	"st,m41t80",
-	"st,m41t81",
-	"st,m41t81s",
-	"st,m41t82",
-	"st,m41t83",
-	"st,m41t84",
-	"st,m41t85",
-	"st,m41t87",
-	"microcrystal,rv4162",
-- reg: I2C bus address of the device
-
-Optional properties:
-- interrupts: rtc alarm interrupt.
-- clock-output-names: From common clock binding to override the default output
-                      clock name
-- wakeup-source: Enables wake up of host system on alarm
-
-Optional child node:
-- clock: Provide this if the square wave pin is used as boot-enabled fixed clock.
-
-Example:
-	rtc@68 {
-		compatible = "st,m41t80";
-		reg = <0x68>;
-		interrupt-parent = <&UIC0>;
-		interrupts = <0x9 0x8>;
-
-		clock {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency = <32768>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/rtc/st,m41t80.yaml b/Documentation/devicetree/bindings/rtc/st,m41t80.yaml
new file mode 100644
index 0000000000000..9977c8954307e
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/st,m41t80.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/st,m41t80.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ST M41T80 family of RTC and compatible
+
+maintainers:
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+properties:
+  compatible:
+    enum:
+      - st,m41t62
+      - st,m41t65
+      - st,m41t80
+      - st,m41t81
+      - st,m41t81s
+      - st,m41t82
+      - st,m41t83
+      - st,m41t84
+      - st,m41t85
+      - st,m41t87
+      - microcrystal,rv4162
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
+    maxItems: 1
+    description: From common clock binding to override the default output clock name.
+
+  clock:
+    type: object
+    $ref: /schemas/clock/fixed-clock.yaml#
+    properties:
+      clock-frequency:
+        const: 32768
+
+allOf:
+  - $ref: rtc.yaml
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
+      rtc@68 {
+        compatible = "st,m41t80";
+        reg = <0x68>;
+        interrupt-parent = <&UIC0>;
+        interrupts = <0x9 0x8>;
+
+        clock {
+          compatible = "fixed-clock";
+          #clock-cells = <0>;
+          clock-frequency = <32768>;
+        };
+      };
+    };
-- 
2.35.1

