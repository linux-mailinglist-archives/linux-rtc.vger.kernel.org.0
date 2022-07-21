Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D17EB57C553
	for <lists+linux-rtc@lfdr.de>; Thu, 21 Jul 2022 09:31:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230013AbiGUHbu (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 21 Jul 2022 03:31:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbiGUHbt (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 21 Jul 2022 03:31:49 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCD0B4A826;
        Thu, 21 Jul 2022 00:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658388708; x=1689924708;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SLMwd2A0TMOCUQShsl7NPdbyQGyeZ5aGV5O58Fvg310=;
  b=LsCrr4ziHsFgqPD1kJpf1Wu2gIZh0QWOTQH/hWPaQP3sDcENrJA8TabR
   2mC1K2EwW3KPMoSNz+Z54spbq5rHcGjNlACUY/1FoEeXFarvnUArJMXI6
   09B0hfr2y+yOFxtCYiNU/7QFmTGHWKTmmnxlsPt93XWD7MUHlcp/ILjpk
   INfc+jp07QA0eHvjW0ERHxCftu0Z4h4+dvPMwx5fvig3EGicL/ngM9+Mk
   8Lugvh6vy1Keq3bTtwoP8L5kj9srs5pnx8Fm/UxYhgTdaf0XPq4q6j0Qi
   25yqem0Vk/rSV9dJx73F89goYnfeGBnwYAJkg3CbOpDIvt3rGteqFt0pn
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,288,1650924000"; 
   d="scan'208";a="25175232"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 21 Jul 2022 09:31:46 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 21 Jul 2022 09:31:46 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 21 Jul 2022 09:31:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658388706; x=1689924706;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SLMwd2A0TMOCUQShsl7NPdbyQGyeZ5aGV5O58Fvg310=;
  b=JncCOSmdxeddjnf7W80x7BHQ2D6enapGvBm256i0CLNC2fhOJv/ma0CH
   FU6XfaJ7D0Ff7VANbVRQ7E4fYwzgATlcRT0on4DX7tC9nLM9lppN7Ztwk
   OaxlOJ7FMmTLv/iyYVnhq5uhAi3QhnU/PoAAYmOoOPAKQZCKthfozMPs5
   NtCFb9a+dApUSkdfz99NBfAxRCDEEKeS5ih0BI5xMqX+2sZf0KuqwiQND
   25/ZelE5SoR1U1+cGLSYvC/JJ56kOExSQzi4l7MJLwckwMImFgmFM+Tl+
   l3VruTkIBTfLilB2B36pb1r5DZ3uDzjQF64YQiiGa8aK3Ng5QAl+jv0pz
   A==;
X-IronPort-AV: E=Sophos;i="5.92,288,1650924000"; 
   d="scan'208";a="25175231"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 21 Jul 2022 09:31:45 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id C5CC3280056;
        Thu, 21 Jul 2022 09:31:45 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/1] dt-bindings: rtc: nxp,pcf85063: Convert to DT schema
Date:   Thu, 21 Jul 2022 09:31:41 +0200
Message-Id: <20220721073141.1746700-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Convert the NXP PCF85063 RTC binding to DT schema format.

Add 'interrupts' and 'wakeup-source' as this device has an interrupt
which was not documented, but is in use.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
checkpath.pl warns about:
WARNING: DT binding docs and includes should be a separate patch. See:
Documentation/devicetree/bindings/submitting-patches.rst

But this seems to be a false positive to me. Includes are not touched at
all.

 .../devicetree/bindings/rtc/nxp,pcf85063.txt  | 32 --------
 .../devicetree/bindings/rtc/nxp,pcf85063.yaml | 76 +++++++++++++++++++
 2 files changed, 76 insertions(+), 32 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/nxp,pcf85063.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml

diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf85063.txt b/Documentation/devicetree/bindings/rtc/nxp,pcf85063.txt
deleted file mode 100644
index 217b7cd06c11..000000000000
--- a/Documentation/devicetree/bindings/rtc/nxp,pcf85063.txt
+++ /dev/null
@@ -1,32 +0,0 @@
-* NXP PCF85063 Real Time Clock
-
-Required properties:
-- compatible: Should one of contain:
-	"nxp,pca85073a",
-	"nxp,pcf85063",
-	"nxp,pcf85063a",
-	"nxp,pcf85063tp",
-	"microcrystal,rv8263"
-- reg: I2C address for chip.
-
-Optional property:
-- quartz-load-femtofarads: The capacitive load of the quartz(x-tal),
-  expressed in femto Farad (fF). Valid values are 7000 and 12500.
-  Default value (if no value is specified) is 7000fF.
-
-Optional child node:
-- clock: Provide this if the square wave pin is used as boot-enabled fixed clock.
-
-Example:
-
-pcf85063: rtc@51 {
-	compatible = "nxp,pcf85063";
-	reg = <0x51>;
-	quartz-load-femtofarads = <12500>;
-
-		clock {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency = <32768>;
-		};
-};
diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml
new file mode 100644
index 000000000000..f46c7e5378e1
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/nxp,pcf85063.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP PCF85063 Real Time Clock
+
+maintainers:
+  - Alexander Stein <alexander.stein@ew.tq-group.com>
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    enum:
+      - nxp,pca85073a
+      - nxp,pcf85063
+      - nxp,pcf85063a
+      - nxp,pcf85063tp
+      - microcrystal,rv8263
+
+  reg:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 0
+
+  clock-output-names:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    const: irq
+
+  quartz-load-femtofarads:
+    description:
+      The capacitive load of the quartz(x-tal),
+      expressed in femto Farad (fF). Valid values are 7000 and 12500.
+      Default value (if no value is specified) is 7000fF.
+
+  clock:
+    $ref: /schemas/clock/fixed-clock.yaml
+    description:
+      Provide this if the square wave pin is used as boot-enabled
+      fixed clock.
+
+  wakeup-source: true
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
+        rtc@51 {
+          compatible = "nxp,pcf85063";
+          reg = <0x51>;
+          quartz-load-femtofarads = <12500>;
+
+          clock {
+            compatible = "fixed-clock";
+            #clock-cells = <0>;
+            clock-frequency = <32768>;
+          };
+        };
+      };
-- 
2.25.1

