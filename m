Return-Path: <linux-rtc+bounces-4649-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D59B1E70F
	for <lists+linux-rtc@lfdr.de>; Fri,  8 Aug 2025 13:23:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA4685804D3
	for <lists+linux-rtc@lfdr.de>; Fri,  8 Aug 2025 11:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1521C2737F9;
	Fri,  8 Aug 2025 11:23:01 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233681D5CDE;
	Fri,  8 Aug 2025 11:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754652181; cv=none; b=DOQ2sjEKy2b2ODx6u5MXmwP542ivpUP62Cc+b8aPfNsOSwsOuWrJhoqqI1iahZdGgvm9gVD+Tlx1tWc0Y14u15MDuE0YG6azVKqiNRTL+kaZM3Oyh4yIL+A84VGgj/hCwV5TRHTB7yD8aMBnr/L1H7JEGtOQRHXNaJ9EJcaUfyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754652181; c=relaxed/simple;
	bh=Xf9rULh+8yfWLoX9lUHy9LywRyzAvnzJtZ3g39bgC5k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CtDCg75+vYCNxy9NDVKIR8x1tUC97GyflosCeAfiOge0wXhFjnidv0/KvXecGm1nFcekxUcc/8sm/64jvM6CmIwbBOWVrC05FXVf50Q5oN1FSeufejpZv5jDEcKWEJRmcwtOtT28zdgw913E6Q87cm7n99bdJvr2ZDzAfw2eMXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id DACA01A07A2;
	Fri,  8 Aug 2025 13:22:50 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 9D3841A03B2;
	Fri,  8 Aug 2025 13:22:50 +0200 (CEST)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 577A21800085;
	Fri,  8 Aug 2025 19:22:49 +0800 (+08)
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
	Lakshay Piplani <lakshay.piplani@nxp.com>
Subject: [PATCH 1/2] rtc: pcf85363: add support for timestamp and watchdog
Date: Fri,  8 Aug 2025 16:52:45 +0530
Message-Id: <20250808112246.4169280-1-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

Extend the device tree binding for NXP PCF85263/PCF85363 RTC with:
- Timestamp mode configuration
- Watchdog timer configuration

Also introduce a new header 'pcf85363-tsr.h' to expose
macros for timestamp mode fields, improving readability
of device tree file.

Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
---
 .../devicetree/bindings/rtc/nxp,pcf85363.yaml | 44 ++++++++++++++++++-
 include/dt-bindings/rtc/pcf85363-tsr.h        | 28 ++++++++++++
 2 files changed, 71 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/rtc/pcf85363-tsr.h

diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf85363.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf85363.yaml
index 52aa3e2091e9..2d2b52f7a9ba 100644
--- a/Documentation/devicetree/bindings/rtc/nxp,pcf85363.yaml
+++ b/Documentation/devicetree/bindings/rtc/nxp,pcf85363.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/rtc/nxp,pcf85363.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Philips PCF85263/PCF85363 Real Time Clock
+title: NXP PCF85263/PCF85363 Real Time Clock
 
 maintainers:
   - Alexandre Belloni <alexandre.belloni@bootlin.com>
@@ -39,6 +39,41 @@ properties:
   start-year: true
   wakeup-source: true
 
+  nxp,timestamp-mode:
+    description: |
+      Defines timestamp modes for TSR1, TSR2, and TSR3.
+      Use macros from `dt-bindings/rtc/pcf85363-tsr.h`.
+    items:
+      - description: TSR1 mode (e.g., PCF85363_TSR1_FE)
+      - description: TSR2 mode (e.g., PCF85363_TSR2_LB)
+      - description: TSR3 mode (e.g., PCF85363_TSR3_LV)
+
+  nxp,enable-watchdog:
+    type: boolean
+    description: |
+      If present, the RTC watchdog timer is enabled and integrated with Linux watchdog subsystem.
+
+  nxp,watchdog-timeout:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 31
+    default: 10
+    description: |
+      Watchdog timeout value in seconds. Allowed values range from 1 to 31.
+
+  nxp,watchdog-stepsize:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 3
+    default: 0
+    description: |
+      Watchdog step size select: 0=0.25Hz, 1=1Hz, 2=4Hz, 3=16Hz.
+
+  nxp,watchdog-repeat:
+    type: boolean
+    description: |
+      If present, sets the watchdog to repeat mode. If omitted, watchdog runs in one-shot mode.
+
 required:
   - compatible
   - reg
@@ -47,6 +82,7 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/rtc/pcf85363-tsr.h>
     i2c {
         #address-cells = <1>;
         #size-cells = <0>;
@@ -56,5 +92,11 @@ examples:
             reg = <0x51>;
             #clock-cells = <0>;
             quartz-load-femtofarads = <12500>;
+            wakeup-source;
+            nxp,timestamp-mode = <PCF85363_TSR1_FE PCF85363_TSR2_LB PCF85363_TSR3_LV>;
+            nxp,enable-watchdog;
+            nxp,watchdog-timeout = <10>;
+            nxp,watchdog-stepsize = <0>;
+            nxp,watchdog-repeat;
         };
     };
diff --git a/include/dt-bindings/rtc/pcf85363-tsr.h b/include/dt-bindings/rtc/pcf85363-tsr.h
new file mode 100644
index 000000000000..1fb5b9b3601e
--- /dev/null
+++ b/include/dt-bindings/rtc/pcf85363-tsr.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef _DT_BINDINGS_RTC_PCF85363_TSR_H
+#define _DT_BINDINGS_RTC_PCF85363_TSR_H
+
+/* TSR1 modes */
+#define PCF85363_TSR1_NONE 0x00
+#define PCF85363_TSR1_FE 0x01
+#define PCF85363_TSR1_LE 0x02
+
+/* TSR2 modes */
+#define PCF85363_TSR2_NONE 0x00
+#define PCF85363_TSR2_FB 0x01
+#define PCF85363_TSR2_LB 0x02
+#define PCF85363_TSR2_LV 0x03
+#define PCF85363_TSR2_FE 0x04
+#define PCF85363_TSR2_LE 0x05
+
+/* TSR3 modes */
+#define PCF85363_TSR3_NONE 0x00
+#define PCF85363_TSR3_FB 0x01
+#define PCF85363_TSR3_LB 0x02
+#define PCF85363_TSR3_LV 0x03
+
+#endif /* _DT_BINDINGS_RTC_PCF85363_TSR_H */
-- 
2.25.1


