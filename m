Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2CE2336D13
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Mar 2021 08:31:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231804AbhCKHav (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 11 Mar 2021 02:30:51 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:28318 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231631AbhCKHag (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 11 Mar 2021 02:30:36 -0500
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 10 Mar 2021 23:30:37 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 10 Mar 2021 23:30:34 -0800
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg02-blr.qualcomm.com with ESMTP; 11 Mar 2021 13:00:09 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 2E1B14390; Thu, 11 Mar 2021 13:00:08 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Lee Jones <lee.jones@linaro.org>, linux-rtc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org,
        satya priya <skakit@codeaurora.org>
Subject: [PATCH 2/3] dt-bindings: mfd: Convert pm8xxx bindings to yaml
Date:   Thu, 11 Mar 2021 12:59:57 +0530
Message-Id: <1615447798-6959-3-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615447798-6959-1-git-send-email-skakit@codeaurora.org>
References: <1615447798-6959-1-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Convert pm8xxx rtc bindings from .txt to .yaml format.

Signed-off-by: satya priya <skakit@codeaurora.org>
---
 .../devicetree/bindings/mfd/qcom-pm8xxx.txt        |  99 -------------------
 .../devicetree/bindings/mfd/qcom-pm8xxx.yaml       | 108 +++++++++++++++++++++
 2 files changed, 108 insertions(+), 99 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/qcom-pm8xxx.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml

diff --git a/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.txt b/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.txt
deleted file mode 100644
index 9e5eba4..0000000
--- a/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.txt
+++ /dev/null
@@ -1,99 +0,0 @@
-Qualcomm PM8xxx PMIC multi-function devices
-
-The PM8xxx family of Power Management ICs are used to provide regulated
-voltages and other various functionality to Qualcomm SoCs.
-
-= PROPERTIES
-
-- compatible:
-	Usage: required
-	Value type: <string>
-	Definition: must be one of:
-		    "qcom,pm8058"
-		    "qcom,pm8821"
-		    "qcom,pm8921"
-
-- #address-cells:
-	Usage: required
-	Value type: <u32>
-	Definition: must be 1
-
-- #size-cells:
-	Usage: required
-	Value type: <u32>
-	Definition: must be 0
-
-- interrupts:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: specifies the interrupt that indicates a subdevice
-		    has generated an interrupt (summary interrupt). The
-		    format of the specifier is defined by the binding document
-		    describing the node's interrupt parent.
-
-- #interrupt-cells:
-	Usage: required
-	Value type : <u32>
-	Definition: must be 2. Specifies the number of cells needed to encode
-		    an interrupt source. The 1st cell contains the interrupt
-		    number. The 2nd cell is the trigger type and level flags
-		    encoded as follows:
-
-			1 = low-to-high edge triggered
-			2 = high-to-low edge triggered
-			4 = active high level-sensitive
-			8 = active low level-sensitive
-
-- interrupt-controller:
-	Usage: required
-	Value type: <empty>
-	Definition: identifies this node as an interrupt controller
-
-= SUBCOMPONENTS
-
-The PMIC contains multiple independent functions, each described in a subnode.
-The below bindings specify the set of valid subnodes.
-
-== Real-Time Clock
-
-- compatible:
-	Usage: required
-	Value type: <string>
-	Definition: must be one of:
-		    "qcom,pm8058-rtc"
-		    "qcom,pm8921-rtc"
-		    "qcom,pm8941-rtc"
-		    "qcom,pm8018-rtc"
-
-- reg:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: single entry specifying the base address of the RTC registers
-
-- interrupts:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: single entry specifying the RTC's alarm interrupt
-
-- allow-set-time:
-	Usage: optional
-	Value type: <empty>
-	Definition: indicates that the setting of RTC time is allowed by
-		    the host CPU
-
-= EXAMPLE
-
-	pmicintc: pmic@0 {
-		compatible = "qcom,pm8921";
-		interrupts = <104 8>;
-		#interrupt-cells = <2>;
-		interrupt-controller;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		rtc@11d {
-			compatible = "qcom,pm8921-rtc";
-			reg = <0x11d>;
-			interrupts = <0x27 0>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml b/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
new file mode 100644
index 0000000..b4892f1
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
@@ -0,0 +1,108 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/qcom-pm8xxx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm PM8xxx PMIC multi-function devices
+
+maintainers:
+  - Lee Jones <lee.jones@linaro.org>
+
+description: |
+  The PM8xxx family of Power Management ICs are used to provide regulated
+  voltages and other various functionality to Qualcomm SoCs.
+
+properties:
+  compatible:
+    enum:
+      - qcom,pm8058
+      - qcom,pm8821
+      - qcom,pm8921
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+     const: 1
+
+  '#size-cells':
+     const: 0
+
+  interrupts:
+    description: |
+      Specifies the interrupt that indicates a subdevice has generated an
+      interrupt (summary interrupt).
+
+  '#interrupt-cells':
+    description: |
+      Specifies the number of cells needed to encode an interrupt source.
+      The 1st cell contains the interrupt number. The 2nd cell is the
+      trigger type.
+    const: 2
+
+  interrupt-controller: true
+
+patternProperties:
+  "rtc@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        enum:
+          - qcom,pm8058-rtc
+          - qcom,pm8921-rtc
+          - qcom,pm8941-rtc
+          - qcom,pm8018-rtc
+
+      reg:
+        description: Specifies the base address of the RTC registers
+
+      interrupts:
+        description: Specifies the RTC's alarm interrupts
+
+      allow-set-time:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description:
+          Indicates that the setting of RTC time is allowed by the host CPU.
+
+    required:
+      - compatible
+      - reg
+      - interrupts
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - '#address-cells'
+  - '#size-cells'
+  - interrupts
+  - '#interrupt-cells'
+  - interrupt-controller
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/spmi/spmi.h>
+    spmi_bus: spmi@c440000 {
+      reg = <0x0c440000 0x1100>;
+      #address-cells = <2>;
+      #size-cells = <0>;
+      pmicintc: pmic@0 {
+        reg = <0x0 SPMI_USID>;
+        compatible = "qcom,pm8921";
+        interrupts = <104 8>;
+        #interrupt-cells = <2>;
+        interrupt-controller;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pm8921_rtc: rtc@11d {
+          compatible = "qcom,pm8921-rtc";
+          reg = <0x11d>;
+          interrupts = <0x27 0>;
+        };
+      };
+    };
+...
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

