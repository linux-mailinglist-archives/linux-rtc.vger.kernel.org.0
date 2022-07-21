Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 567AE57CC01
	for <lists+linux-rtc@lfdr.de>; Thu, 21 Jul 2022 15:33:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbiGUNdK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 21 Jul 2022 09:33:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbiGUNdJ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 21 Jul 2022 09:33:09 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A68AD5A44B;
        Thu, 21 Jul 2022 06:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658410388; x=1689946388;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nD1yX5ksgvMbluiuTfJuNMjBc2L4C0xuK0HtgkCRt84=;
  b=bBOVhSOuu9PFwHBdwG3A4wu1G6xPaBCIxUmNWei0NMvYJurBxORkmoUQ
   iN6A5LbLoOLgIC/CLeYp7lo5pdFpYDD7U9zqhHHYG6wGySjkMEJh8nT4i
   AdLShmfGj5qvP9XrTz5PUqq6cPBQV6LamJwyZwPRY4Cu7Z+FvArE6O1WF
   akOHXU6KHy5emwGbJkySA0Z9XDIcFUaG0khVlIaXJU0dblIFdI7unCL3p
   f91UXkoFm123nXB/AxquIsxXYGKmnbuB0UwkWOHSWEkncMPbE+Du+hCxi
   QIatZQbsk9CgHK+6yaZrxb1U5oVwdg0qVtRwgdMSm3cHBiii5kk7CGu1E
   g==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650924000"; 
   d="scan'208";a="25187733"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 21 Jul 2022 15:33:05 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 21 Jul 2022 15:33:05 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 21 Jul 2022 15:33:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658410385; x=1689946385;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nD1yX5ksgvMbluiuTfJuNMjBc2L4C0xuK0HtgkCRt84=;
  b=jR88F0Qplp6lrtY14Jp36BVo9vBgyQW1l975Z+Zy2zqdUK3i84xFFpLK
   8k0QZ4pmTOQwt+/4GWKbDvD3K3D9wDeM6W+/b7GtTNN7o6o5BpbzaoAXU
   IORr7f3nr1H/fX4epFNndOCmoYobmnOBC4DsC8CeDVTudfTQaB4KeGdm0
   qobpBLloZMifpsmzBCc2ftg81yJpwZPS0hTJjkhupp9XMRCOU1ERqf4Ml
   7C4PURp8Q17N17xe4w/aNnHSiqpiZ7xsmirl36EYTu7HbNt882ARre7xw
   QEKt0KFHPxkfmc1V+jcSxJSyqqmygt0KzFDpmKdTNjTVHfuIzdeZRF6Yl
   g==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650924000"; 
   d="scan'208";a="25187732"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 21 Jul 2022 15:33:05 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 82303280056;
        Thu, 21 Jul 2022 15:33:05 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 1/1] dt-bindings: rtc: nxp,pcf85063: Convert to DT schema
Date:   Thu, 21 Jul 2022 15:33:03 +0200
Message-Id: <20220721133303.1998356-1-alexander.stein@ew.tq-group.com>
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
'clock-output-names' and '#clock-cells' are added as well, those were
probably missed when adding clkout support in commit 8c229ab6048b
("rtc: pcf85063: Add pcf85063 clkout control to common clock framework")

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Krzysztof, thanks for your review.

Changes in v2:
* Sorted compatible list
* Mentioned new #clock-cells and clock-output-names properties in commit message
* Removed 'interrupt-names', not needed/used anyway
* Fixed quartz-load-femtofarads defintion/description

 .../devicetree/bindings/rtc/nxp,pcf85063.txt  | 32 --------
 .../devicetree/bindings/rtc/nxp,pcf85063.yaml | 73 +++++++++++++++++++
 2 files changed, 73 insertions(+), 32 deletions(-)
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
index 000000000000..bf86c9786b0f
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml
@@ -0,0 +1,73 @@
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
+      - microcrystal,rv8263
+      - nxp,pcf85063
+      - nxp,pcf85063a
+      - nxp,pcf85063tp
+      - nxp,pca85073a
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
+  quartz-load-femtofarads:
+    description:
+      The capacitive load of the quartz(x-tal).
+    enum: [7000, 12500]
+    default: 7000
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

