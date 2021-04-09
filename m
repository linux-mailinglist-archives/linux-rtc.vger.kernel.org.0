Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBB5335A08C
	for <lists+linux-rtc@lfdr.de>; Fri,  9 Apr 2021 16:00:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233848AbhDIOAd (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 9 Apr 2021 10:00:33 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:52694 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233828AbhDIOAc (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 9 Apr 2021 10:00:32 -0400
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 09 Apr 2021 07:00:19 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 09 Apr 2021 07:00:16 -0700
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg01-blr.qualcomm.com with ESMTP; 09 Apr 2021 19:29:40 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id C0C76499B; Fri,  9 Apr 2021 19:29:39 +0530 (IST)
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
Subject: [PATCH V2 3/4] dt-bindings: mfd: Convert pm8xxx bindings to yaml
Date:   Fri,  9 Apr 2021 19:29:25 +0530
Message-Id: <1617976766-7852-4-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617976766-7852-1-git-send-email-skakit@codeaurora.org>
References: <1617976766-7852-1-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Convert pm8xxx bindings from .txt to .yaml format. Also,
split this binding into two: parent binding(qcom-pm8xxx.yaml)
and child node RTC binding(qcom-pm8xxx-rtc.yaml).

Signed-off-by: satya priya <skakit@codeaurora.org>
---
Changes in V2:
 - As per Bjorn's comments, I've split this into two, one parent binding
   and one child node rtc binding.
 - Fixed bot errors and changed maintainer name.

 .../devicetree/bindings/mfd/qcom-pm8xxx.txt        | 100 ---------------------
 .../devicetree/bindings/mfd/qcom-pm8xxx.yaml       |  54 +++++++++++
 2 files changed, 54 insertions(+), 100 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/qcom-pm8xxx.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml

diff --git a/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.txt b/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.txt
deleted file mode 100644
index 07f4925..0000000
--- a/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.txt
+++ /dev/null
@@ -1,100 +0,0 @@
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
-		    "qcom,pmk8350-rtc"
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
index 0000000..9065ec5
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/qcom-pm8xxx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm PM8xxx PMIC multi-function devices
+
+maintainers:
+  - Satya Priya <skakit@codeaurora.org>
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
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  interrupts:
+    maxItems: 1
+
+  '#interrupt-cells':
+    const: 2
+
+  interrupt-controller: true
+
+patternProperties:
+  "rtc@[0-9a-f]+$":
+    type: object
+    $ref: "../rtc/qcom-pm8xxx-rtc.yaml"
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
+...
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

