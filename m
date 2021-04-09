Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBC4F35A07C
	for <lists+linux-rtc@lfdr.de>; Fri,  9 Apr 2021 16:00:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233693AbhDIOAa (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 9 Apr 2021 10:00:30 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:52694 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233577AbhDIOA3 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 9 Apr 2021 10:00:29 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 09 Apr 2021 07:00:12 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 09 Apr 2021 07:00:09 -0700
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg01-blr.qualcomm.com with ESMTP; 09 Apr 2021 19:29:40 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id D92404EFA; Fri,  9 Apr 2021 19:29:39 +0530 (IST)
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
Subject: [PATCH V2 4/4] dt-bindings: rtc: qcom-pm8xxx-rtc: Add qcom pm8xxx rtc bindings
Date:   Fri,  9 Apr 2021 19:29:26 +0530
Message-Id: <1617976766-7852-5-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617976766-7852-1-git-send-email-skakit@codeaurora.org>
References: <1617976766-7852-1-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Add binding doc for qcom pm8xxx rtc device.

Signed-off-by: satya priya <skakit@codeaurora.org>
---
Changes in V2:
 - Added this in V2 to have separate binding for rtc node.

 .../devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml   | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml b/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
new file mode 100644
index 0000000..4fba6db
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/qcom-pm8xxx-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm PM8xxx PMIC RTC device
+
+maintainers:
+  - Satya Priya <skakit@codeaurora.org>
+
+properties:
+  compatible:
+    enum:
+      - qcom,pm8058-rtc
+      - qcom,pm8921-rtc
+      - qcom,pm8941-rtc
+      - qcom,pm8018-rtc
+      - qcom,pmk8350-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  allow-set-time:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Indicates that the setting of RTC time is allowed by the host CPU.
+
+required:
+  - compatible
+  - reg
+  - interrupts
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

