Return-Path: <linux-rtc+bounces-5290-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 844E5C4019C
	for <lists+linux-rtc@lfdr.de>; Fri, 07 Nov 2025 14:26:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA4E1425783
	for <lists+linux-rtc@lfdr.de>; Fri,  7 Nov 2025 13:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A4FA2DCC1A;
	Fri,  7 Nov 2025 13:26:33 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527612DF6E9;
	Fri,  7 Nov 2025 13:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762521993; cv=none; b=eWioLWkVXnW7dAqMft3Ain1jhC5N+KYwIPg1blTE/in2PZnJRMKXkjmDaOn8cvaUPK/xp68ZQVxG/pBimdeymuh8sd9cGb2CviuwCeCqEp8tEh9LK6UatXmgPL4XrIutTGHoqRca8jJI9MWWKSDZao7ZKEXAAUsldHeLAuEHCBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762521993; c=relaxed/simple;
	bh=NaMRGXzSpOd+qF17eyyM82wbKddjMJ02bhCEEG6G+a0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=n+mxw6Hc76A10gbKFKMcvfBGULXci6jm5nV/DDkDXef3O+zsfmDb0fjp+9ZbZK1cP27LdUZ/UqOhKI1xL/+YqESt5S9PM8JW2G2qemK41YoMtH7MftQS5Ib1/fdL1xQWNvAylrkTtRRoH0wAkIhbIdrEbLaFUoZY0CYEoTgL8uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id EAE322016A6;
	Fri,  7 Nov 2025 14:26:23 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B61E7201819;
	Fri,  7 Nov 2025 14:26:23 +0100 (CET)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 8CB0F1800096;
	Fri,  7 Nov 2025 21:26:22 +0800 (+08)
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
Subject: [PATCH v5 1/2] dt-bindings: rtc: Add pcf85053 support
Date: Fri,  7 Nov 2025 18:56:17 +0530
Message-Id: <20251107132618.2246407-1-lakshay.piplani@nxp.com>
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
V4 -> V5: - Updated schema validation logic to enforce correct combinations of
            'nxp,interface' and 'nxp,write-access' using oneOf clauses.
          - Refined property descriptions for clarity and hardware alignment.
V3 -> V4: Add dedicated nxp,pcf85053.yaml.
          Remove entry from trivial-rtc.yaml.
V2 -> V3: Moved MAINTAINERS file changes to the driver patch
V1 -> V2: Handled dt-bindings by trivial-rtc.yaml

 .../devicetree/bindings/rtc/nxp,pcf85053.yaml | 115 ++++++++++++++++++
 1 file changed, 115 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/nxp,pcf85053.yaml

diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf85053.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf85053.yaml
new file mode 100644
index 000000000000..1b3fbde00001
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/nxp,pcf85053.yaml
@@ -0,0 +1,115 @@
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
+      This property helps the driver determine whether it should attempt to
+      claim write-access.
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


