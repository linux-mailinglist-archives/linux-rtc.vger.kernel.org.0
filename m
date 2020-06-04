Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4081D1EDAB6
	for <lists+linux-rtc@lfdr.de>; Thu,  4 Jun 2020 03:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726644AbgFDBr0 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 3 Jun 2020 21:47:26 -0400
Received: from inva021.nxp.com ([92.121.34.21]:58974 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727973AbgFDBrZ (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 3 Jun 2020 21:47:25 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id CED362011D0;
        Thu,  4 Jun 2020 03:47:07 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id BCCB12011DF;
        Thu,  4 Jun 2020 03:46:21 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 08582402A5;
        Thu,  4 Jun 2020 09:46:14 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, stigge@antcom.de,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V2] dt-bindings: rtc: Convert imxdi rtc to json-schema
Date:   Thu,  4 Jun 2020 09:35:55 +0800
Message-Id: <1591234555-15187-1-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Convert the i.MXDI RTC binding to DT schema format using json-schema

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
Changes since V1:
	- add "additionalProperties: false".
---
 .../devicetree/bindings/rtc/imxdi-rtc.txt          | 20 ----------
 .../devicetree/bindings/rtc/imxdi-rtc.yaml         | 44 ++++++++++++++++++++++
 2 files changed, 44 insertions(+), 20 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/imxdi-rtc.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/imxdi-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/imxdi-rtc.txt b/Documentation/devicetree/bindings/rtc/imxdi-rtc.txt
deleted file mode 100644
index c797bc9..0000000
--- a/Documentation/devicetree/bindings/rtc/imxdi-rtc.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-* i.MX25 Real Time Clock controller
-
-Required properties:
-- compatible: should be: "fsl,imx25-rtc"
-- reg: physical base address of the controller and length of memory mapped
-  region.
-- clocks: should contain the phandle for the rtc clock
-- interrupts: rtc alarm interrupt
-
-Optional properties:
-- interrupts: dryice security violation interrupt (second entry)
-
-Example:
-
-rtc@53ffc000 {
-	compatible = "fsl,imx25-rtc";
-	reg = <0x53ffc000 0x4000>;
-	clocks = <&clks 81>;
-	interrupts = <25 56>;
-};
diff --git a/Documentation/devicetree/bindings/rtc/imxdi-rtc.yaml b/Documentation/devicetree/bindings/rtc/imxdi-rtc.yaml
new file mode 100644
index 0000000..06bd737
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/imxdi-rtc.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/imxdi-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: i.MX25 Real Time Clock controller
+
+maintainers:
+  - Roland Stigge <stigge@antcom.de>
+
+properties:
+  compatible:
+    const: fsl,imx25-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: rtc alarm interrupt
+      - description: dryice security violation interrupt
+    minItems: 1
+    maxItems: 2
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    rtc@53ffc000 {
+        compatible = "fsl,imx25-rtc";
+        reg = <0x53ffc000 0x4000>;
+        clocks = <&clks 81>;
+        interrupts = <25>, <56>;
+    };
-- 
2.7.4

