Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBC7B1D2784
	for <lists+linux-rtc@lfdr.de>; Thu, 14 May 2020 08:23:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726102AbgENGW7 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 14 May 2020 02:22:59 -0400
Received: from inva021.nxp.com ([92.121.34.21]:36898 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726067AbgENGW6 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 14 May 2020 02:22:58 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 4BB03201556;
        Thu, 14 May 2020 08:22:56 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 7A5C92014EC;
        Thu, 14 May 2020 08:22:52 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 1A7EE40245;
        Thu, 14 May 2020 14:22:47 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        robh+dt@kernel.org, tremyfr@gmail.com, p.bruenn@beckhoff.com,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH 1/2] dt-bindings: rtc: Convert MXC RTC to json-schema
Date:   Thu, 14 May 2020 14:13:24 +0800
Message-Id: <1589436805-22923-1-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Convert the MXC RTC binding to DT schema format using json-schema.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 Documentation/devicetree/bindings/rtc/rtc-mxc.txt  | 26 ----------
 Documentation/devicetree/bindings/rtc/rtc-mxc.yaml | 59 ++++++++++++++++++++++
 2 files changed, 59 insertions(+), 26 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-mxc.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-mxc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/rtc-mxc.txt b/Documentation/devicetree/bindings/rtc/rtc-mxc.txt
deleted file mode 100644
index 5bcd31d..0000000
--- a/Documentation/devicetree/bindings/rtc/rtc-mxc.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-* Real Time Clock of the i.MX SoCs
-
-RTC controller for the i.MX SoCs
-
-Required properties:
-- compatible: Should be "fsl,imx1-rtc" or "fsl,imx21-rtc".
-- reg: physical base address of the controller and length of memory mapped
-  region.
-- interrupts: IRQ line for the RTC.
-- clocks: should contain two entries:
-  * one for the input reference
-  * one for the the SoC RTC
-- clock-names: should contain:
-  * "ref" for the input reference clock
-  * "ipg" for the SoC RTC clock
-
-Example:
-
-rtc@10007000 {
-	compatible = "fsl,imx21-rtc";
-	reg = <0x10007000 0x1000>;
-	interrupts = <22>;
-	clocks = <&clks IMX27_CLK_CKIL>,
-		 <&clks IMX27_CLK_RTC_IPG_GATE>;
-	clock-names = "ref", "ipg";
-};
diff --git a/Documentation/devicetree/bindings/rtc/rtc-mxc.yaml b/Documentation/devicetree/bindings/rtc/rtc-mxc.yaml
new file mode 100644
index 0000000..d5c5ccd
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/rtc-mxc.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/rtc-mxc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Real Time Clock of the i.MX SoCs
+
+allOf:
+  - $ref: "rtc.yaml#"
+
+maintainers:
+  - Philippe Reynes <tremyfr@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx1-rtc
+      - fsl,imx21-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: input reference
+      - description: the SoC RTC clock
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: ref
+      - const: ipg
+    maxItems: 2
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx27-clock.h>
+
+    rtc@10007000 {
+        compatible = "fsl,imx21-rtc";
+        reg = <0x10007000 0x1000>;
+        interrupts = <22>;
+        clocks = <&clks IMX27_CLK_CKIL>,
+                 <&clks IMX27_CLK_RTC_IPG_GATE>;
+        clock-names = "ref", "ipg";
+    };
-- 
2.7.4

