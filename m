Return-Path: <linux-rtc+bounces-5013-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F95B95B82
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Sep 2025 13:44:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 159F119C358F
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Sep 2025 11:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2231A32254F;
	Tue, 23 Sep 2025 11:44:19 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F3B322536;
	Tue, 23 Sep 2025 11:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758627858; cv=none; b=Tl65YW2QzURHmI/y4lJfMWsKGQNU4Ye5FPDSdk7EbFmubzMGbNxtQES1rY/B24qbmW5/zu8mlsEmzA7zo+eTjKO2LOggs/mLqf10mtQW1BXKC5CBe8EQXfn7aaz+/2YLrBq/h6amM6cNt8fIwYGc8a/MToHQH/GGP+idb6gS+jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758627858; c=relaxed/simple;
	bh=7Emyyx9BuarRBPWVOBI+FuTRkVGZokBm1yhObHboraA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=R6b444tgcqTqkDT4esXCtYmdSIPhe0J+hwu0XBWZip63+V1vuQKp1iFFouEagSkjkIkGE+Xo8jFSZVAZjvz5vAac4Bc/dCNoBYHDjFSI+B6D0PWLpeGAKSKxRaLIZqZUNCkeBJEFQfjmzeHbxsSfqb9stscMR0bXWsw1BqlTbAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id BCB2D1A0329;
	Tue, 23 Sep 2025 13:34:46 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 812A81A0477;
	Tue, 23 Sep 2025 13:34:46 +0200 (CEST)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 543431800083;
	Tue, 23 Sep 2025 19:34:45 +0800 (+08)
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: alexandre.belloni@bootlin.com,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Cc: pankit.garg@nxp.com,
	vikash.bansal@nxp.com,
	priyanka.jain@nxp.com,
	shashank.rebbapragada@nxp.com,
	Lakshay Piplani <lakshay.piplani@nxp.com>
Subject: [PATCH v4 1/2] dt-bindings: rtc: Add pcf85053 support
Date: Tue, 23 Sep 2025 17:04:40 +0530
Message-Id: <20250923113441.555284-1-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

Add device tree bindings for NXP PCF85053 RTC chip.

Signed-off-by: Pankit Garg <pankit.garg@nxp.com>
Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
---
V3 -> V4: Add dedicated nxp,pcf85053.yaml.
          Remove entry from trivial-rtc.yaml.
V2 -> V3: Moved MAINTAINERS file changes to the driver patch
V1 -> V2: Handled dt-bindings by trivial-rtc.yaml

 .../devicetree/bindings/rtc/nxp,pcf85053.yaml | 128 ++++++++++++++++++
 1 file changed, 128 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/nxp,pcf85053.yaml

diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf85053.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf85053.yaml
new file mode 100644
index 000000000000..6b1c97358486
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/nxp,pcf85053.yaml
@@ -0,0 +1,128 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2025 NXP
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/nxp,pcf85053.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP PCF85053 Real Time Clock
+
+maintainers:
+  - Pankit Garg <pankit.garg@nxp.com>
+  - Lakshay Piplani <lakshay.piplani@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - nxp,pcf85053
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  nxp,interface:
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [ primary, secondary ]
+    description: |
+      Identifies this host's logical role in a multi-host topology for the
+      PCF85053 RTC. The device exposes a "TWO" ownership bit in the CTRL
+      register that gates which host may write time/alarm registers.
+        - "primary": Designated host that *may* claim write ownership (set
+          CTRL.TWO=1) **if** write-access is explicitly requested.
+        - "secondary": Peer host that writes only when CTRL.TWO=0 (default).
+
+  nxp,write-access:
+    type: boolean
+    description: |
+      Request the driver to claim write ownership at probe time by setting
+      CTRL.TWO=1. This property is only valid when nxp,interface="primary".
+      The driver will not modify any other CTRL bits (HF/DM/etc.) and will not
+      clear any status/interrupt flags at probe.
+
+required:
+  - compatible
+  - reg
+  - nxp,interface
+
+additionalProperties: false
+
+# Schema constraints matching driver:
+# 1) If nxp,write-access is present, nxp,interface must be "primary".
+#    Rationale: only the primary may claim ownership; driver will set TWO=1.
+# 2) If nxp,interface is "secondary", nxp,write-access must not be present.
+#    Rationale: secondary never claims ownership and cannot write CTRL/ST/alarm.
+#
+# Practical effect:
+# - Primary without 'nxp,write-access'; primary is read only; secondary may
+#   write time registers.
+# - Primary with 'nxp,write-access'; primary owns writes, secondary is read only.
+allOf:
+  - $ref: rtc.yaml#
+  - oneOf:
+      # Case 1: primary with write-access
+      - required: [ "nxp,write-access" ]
+        properties:
+          nxp,interface:
+            const: primary
+
+      # Case 2: primary without write-access
+      - properties:
+          nxp,interface:
+            const: primary
+        not:
+          required: [ "nxp,write-access" ]
+
+      # Case 3: secondary (must not have write-access)
+      - properties:
+          nxp,interface:
+            const: secondary
+        not:
+          required: [ "nxp,write-access" ]
+
+examples:
+  # Single host example.
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      rtc@6f {
+        compatible = "nxp,pcf85053";
+        reg = <0x6f>;
+        nxp,interface = "primary";
+        nxp,write-access;
+        interrupt-parent = <&gpio2>;
+        interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
+      };
+    };
+
+  # Dual-host example: one primary that claims writes; one secondary that never claims writes.
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c0 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      rtc@6f {
+        compatible = "nxp,pcf85053";
+        reg = <0x6f>;
+        nxp,interface = "primary";
+        nxp,write-access;
+        interrupt-parent = <&gpio2>;
+        interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
+      };
+    };
+
+    i2c1 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      rtc@6f {
+        compatible = "nxp,pcf85053";
+        reg = <0x6f>;
+        nxp,interface = "secondary";
+      };
+    };
-- 
2.25.1


