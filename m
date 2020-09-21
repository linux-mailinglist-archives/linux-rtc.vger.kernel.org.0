Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABC5F271A98
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Sep 2020 08:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726355AbgIUGD7 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 21 Sep 2020 02:03:59 -0400
Received: from inva021.nxp.com ([92.121.34.21]:38266 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726011AbgIUGD7 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 21 Sep 2020 02:03:59 -0400
X-Greylist: delayed 435 seconds by postgrey-1.27 at vger.kernel.org; Mon, 21 Sep 2020 02:03:58 EDT
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 37DE9200621;
        Mon, 21 Sep 2020 07:56:43 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id D16B5200A5A;
        Mon, 21 Sep 2020 07:56:39 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 5619840309;
        Mon, 21 Sep 2020 07:56:35 +0200 (CEST)
From:   Qiang Zhao <qiang.zhao@nxp.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        robh+dt@kernel.org
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Zhao Qiang <qiang.zhao@nxp.com>
Subject: [Patch v2 1/3] dt-bindings: rtc: pcf2127: Add bindings for nxp,pcf2127
Date:   Mon, 21 Sep 2020 13:48:19 +0800
Message-Id: <20200921054821.26071-1-qiang.zhao@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Zhao Qiang <qiang.zhao@nxp.com>

Add bindings for nxp,pcf2127

Signed-off-by: Zhao Qiang <qiang.zhao@nxp.com>
---
Changes for v2:
 - modify the format to yaml
 - add compitable "nxp,pca2129"

 .../devicetree/bindings/rtc/nxp,pcf2127.yaml       | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml

diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
new file mode 100644
index 0000000..226a0b2
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/nxp,pcf2127.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: PCF RTCs
+
+maintainers:
+  - Qiang Zhao <qiang.zhao@nxp.com>
+
+allOf:
+  - $ref: "rtc.yaml#"
+
+properties:
+  compatible:
+    enum:
+      - nxp,pcf2127
+      - nxp,pcf2129
+      - nxp,pca2129
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  no-watchdog:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      With this property, the device will not registered as a watchdog device.
+
+  start-year: true
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+...
-- 
2.7.4

