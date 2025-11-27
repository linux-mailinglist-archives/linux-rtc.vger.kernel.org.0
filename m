Return-Path: <linux-rtc+bounces-5487-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE4FC8E2F0
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Nov 2025 13:05:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 431BC3AE33F
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Nov 2025 12:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A23432E728;
	Thu, 27 Nov 2025 12:05:15 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DED832E6BD;
	Thu, 27 Nov 2025 12:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764245115; cv=none; b=Kv9/A7p0gpC/nYEiBtoP0U6A1AlYl3QLI4EJX9P1gI9ucdQ2ik4A+h4mKTEabp5zyPlwD5XJE5dCeTr7oEDxQuYR5z4oyngNOpSbC6TAOh9ippKY7govZSerXLw1sjKpgyMzUqeIXQvq0LFzf4tviTx6jral9qJjOf8it864Pqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764245115; c=relaxed/simple;
	bh=eQcaX7QQGRbichX5g121DxRcToGnuFmjTqFeqxFEnpE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IU6P1Z0WL3K8RraT6hKyU8i8xI4Vw7WIdnWYZrhlKPpgzUs1mVC5e99rd+UISRrNZ1A3b+Ed3q2rdFIDROXUYlZwpycFGpAzUk0cztnwjpoVPNc9ph74apXMoZGObtxOwMk68cw1QByZIBIi9c48Q4r4mBOsSVB6VgKDVcQ/WFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 4FB3D1A02A0;
	Thu, 27 Nov 2025 13:05:06 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 15D811A02A3;
	Thu, 27 Nov 2025 13:05:06 +0100 (CET)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id C48241800083;
	Thu, 27 Nov 2025 20:05:04 +0800 (+08)
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: alexandre.belloni@bootlin.com,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Cc: vikash.bansal@nxp.com,
	priyanka.jain@nxp.com,
	shashank.rebbapragada@nxp.com,
	Lakshay Piplani <lakshay.piplani@nxp.com>,
	Pankit Garg <pankit.garg@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v7 1/2] dt-bindings: rtc: Add pcf85053 support
Date: Thu, 27 Nov 2025 17:34:55 +0530
Message-Id: <20251127120456.1849177-1-lakshay.piplani@nxp.com>
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
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
V6 -> V7: - no changes
	  - Added Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
V5 -> V6: - Dropped driver-specific commentary from property descriptions.
	  - Simplified and clarified descriptions for better readability.
V4 -> V5: - Updated schema validation logic to enforce correct combinations of
            'nxp,interface' and 'nxp,write-access' using oneOf clauses.
          - Refined property descriptions for clarity and hardware alignment.
V3 -> V4: Add dedicated nxp,pcf85053.yaml.
          Remove entry from trivial-rtc.yaml.
V2 -> V3: Moved MAINTAINERS file changes to the driver patch
V1 -> V2: Handled dt-bindings by trivial-rtc.yaml

 .../devicetree/bindings/rtc/nxp,pcf85053.yaml | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/nxp,pcf85053.yaml

diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf85053.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf85053.yaml
new file mode 100644
index 000000000000..81cfceabc04c
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/nxp,pcf85053.yaml
@@ -0,0 +1,114 @@
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
+      This property determines the intended role of the host in relation to
+      the write ownership.
+
+      The actual role depends on whether 'nxp,write-access' is also specified.
+      Supported configurations are:-
+        1. Primary with 'nxp,write-access' -> primary claims write ownership.
+        2. Primary without 'nxp,write-access' -> primary is ready only; secondary may write.
+        3. Secondary (must not specify 'nxp,write-access') -> Secondary writes only
+           when no primary claims ownership.
+
+  nxp,write-access:
+    type: boolean
+    description: |
+      Indicates that write ownership of the PCF85053 RTC should be claimed by setting
+      CTRL.TWO=1. This property is only valid when acting as the primary interface
+      (nxp,interface="primary").
+
+required:
+  - compatible
+  - reg
+  - nxp,interface
+
+additionalProperties: false
+
+allOf:
+  - $ref: rtc.yaml#
+  - if:
+      properties:
+        nxp,interface:
+          const: secondary
+    then:
+      not:
+        required: [ "nxp,write-access" ]
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


