Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 697D11D27A1
	for <lists+linux-rtc@lfdr.de>; Thu, 14 May 2020 08:24:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725973AbgENGXb (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 14 May 2020 02:23:31 -0400
Received: from inva021.nxp.com ([92.121.34.21]:36940 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726098AbgENGXA (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 14 May 2020 02:23:00 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B758620022F;
        Thu, 14 May 2020 08:22:57 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id E6986200247;
        Thu, 14 May 2020 08:22:53 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 8178D402B4;
        Thu, 14 May 2020 14:22:48 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        robh+dt@kernel.org, tremyfr@gmail.com, p.bruenn@beckhoff.com,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH 2/2] dt-bindings: rtc: Convert MXC RTC V2 to json-schema
Date:   Thu, 14 May 2020 14:13:25 +0800
Message-Id: <1589436805-22923-2-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589436805-22923-1-git-send-email-Anson.Huang@nxp.com>
References: <1589436805-22923-1-git-send-email-Anson.Huang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Convert the MXC RTC V2 binding to DT schema format using json-schema.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 .../devicetree/bindings/rtc/rtc-mxc_v2.txt         | 17 --------
 .../devicetree/bindings/rtc/rtc-mxc_v2.yaml        | 46 ++++++++++++++++++++++
 2 files changed, 46 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-mxc_v2.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-mxc_v2.yaml

diff --git a/Documentation/devicetree/bindings/rtc/rtc-mxc_v2.txt b/Documentation/devicetree/bindings/rtc/rtc-mxc_v2.txt
deleted file mode 100644
index 79d7e87..0000000
--- a/Documentation/devicetree/bindings/rtc/rtc-mxc_v2.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-* i.MX53 Secure Real Time Clock (SRTC)
-
-Required properties:
-- compatible: should be: "fsl,imx53-rtc"
-- reg: physical base address of the controller and length of memory mapped
-  region.
-- clocks: should contain the phandle for the rtc clock
-- interrupts: rtc alarm interrupt
-
-Example:
-
-rtc@53fa4000 {
-	compatible = "fsl,imx53-rtc";
-	reg = <0x53fa4000 0x4000>;
-	interrupts = <24>;
-	clocks = <&clks IMX5_CLK_SRTC_GATE>;
-};
diff --git a/Documentation/devicetree/bindings/rtc/rtc-mxc_v2.yaml b/Documentation/devicetree/bindings/rtc/rtc-mxc_v2.yaml
new file mode 100644
index 0000000..2d1a306
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/rtc-mxc_v2.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/rtc-mxc_v2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: i.MX53 Secure Real Time Clock (SRTC)
+
+allOf:
+  - $ref: "rtc.yaml#"
+
+maintainers:
+  - Patrick Bruenn <p.bruenn@beckhoff.com>
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx53-rtc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx5-clock.h>
+
+    rtc@53fa4000 {
+        compatible = "fsl,imx53-rtc";
+        reg = <0x53fa4000 0x4000>;
+        interrupts = <24>;
+        clocks = <&clks IMX5_CLK_SRTC_GATE>;
+    };
-- 
2.7.4

