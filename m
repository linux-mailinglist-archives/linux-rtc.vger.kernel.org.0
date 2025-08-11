Return-Path: <linux-rtc+bounces-4662-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B66B201A7
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Aug 2025 10:22:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DB32189C8C3
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Aug 2025 08:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA93A2DC32B;
	Mon, 11 Aug 2025 08:21:36 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA90D2DBF40;
	Mon, 11 Aug 2025 08:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754900496; cv=none; b=mVCbq1Hgf58tCV6AyRmPB0NP/al+p6QAwccwbq6QZh9YOPvjYOtih2Phcfghcx3I/NAn7JRkDYQHudCIl5tu3LMP9wciMvj4Y0Vyg9Os+AK6Z/rfJE9ZhLr/QOV4ykTiL+AGz5d+0FnjNsmdMrvzlDQMJHMnh0EDLwDrzPp0bRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754900496; c=relaxed/simple;
	bh=dwA+k5MoQMPREAqtf+/R5bWlrbm5zpY7s6D0K58iuOM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Z5r3x8MDNpj6DDJ6R0MHPmvn2KEOeEVYu2yrlzI+9NwCSIa0aNPeMCtUtvN8xal45n3MKUohG2k1nNgMW0mdD+Y/o+s0+QSGPuvobCgZutr2MttKLgiayZvUA5SwjfD7qHgzM4x1Y0YSYpjBx+UNY9kobhhnYpioP4meWXrjeho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 74230200F82;
	Mon, 11 Aug 2025 10:21:27 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 378F0200F65;
	Mon, 11 Aug 2025 10:21:27 +0200 (CEST)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id E99411800225;
	Mon, 11 Aug 2025 16:21:25 +0800 (+08)
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
Subject: [PATCH v2 1/2] dt-bindings: rtc: nxp,pcf85363: add timestamp mode config
Date: Mon, 11 Aug 2025 13:51:22 +0530
Message-Id: <20250811082123.1099880-1-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

NXP PCF85263/PCF85363 provides three timestamp registers (TSR1-TSR3)
which latch the current time when a selected event occurs. Add a
vendor specific property, nxp,timestamp-mode, to select the event
source for each register.

Also introduce a new header 'pcf85363-tsr.h' to expose
macros for timestamp mode fields, improving readability
of device tree file.

Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
---
Changes in v2:
- Addressed review comments from Rob Herring:
  * use $ref: /schemas/types.yaml#/definitions/uint32-array
  * tuple form with exactly 3 items (TSR1/TSR2/TSR3), per items decimal enums
  * define 'nxp,timestamp-mode' clearly
  * drop watchdog related vendor properties
  * remove watchdog related vendor properties from i2c example

 .../devicetree/bindings/rtc/nxp,pcf85363.yaml | 23 ++++++++++++++-
 include/dt-bindings/rtc/pcf85363-tsr.h        | 28 +++++++++++++++++++
 2 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/rtc/pcf85363-tsr.h

diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf85363.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf85363.yaml
index 52aa3e2091e9..cf9c155162d6 100644
--- a/Documentation/devicetree/bindings/rtc/nxp,pcf85363.yaml
+++ b/Documentation/devicetree/bindings/rtc/nxp,pcf85363.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/rtc/nxp,pcf85363.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Philips PCF85263/PCF85363 Real Time Clock
+title: NXP PCF85263/PCF85363 Real Time Clock
 
 maintainers:
   - Alexandre Belloni <alexandre.belloni@bootlin.com>
@@ -39,6 +39,24 @@ properties:
   start-year: true
   wakeup-source: true
 
+  nxp,timestamp-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    items:
+      - enum: [0, 1, 2] # TSR1: NONE, FE, LE
+        description: TSR1 mode
+      - enum: [0, 1, 2, 3, 4, 5] # TSR2: NONE, FB, LB, LV, FE, LE
+        description: TSR2 mode
+      - enum: [0, 1, 2, 3] # TSR3: NONE, FB, LB, LV
+        description: TSR3 mode
+    description: |
+      Defines timestamp modes for TSR1, TSR2, and TSR3.
+      Use macros from <dt-bindings/rtc/pcf85363-tsr.h>.
+
+      Each value corresponds to a mode constant:
+        - TSR1: NONE, FE, LE
+        - TSR2: NONE, FB, LB, LV, FE, LE
+        - TSR3: NONE, FB, LB, LV
+
 required:
   - compatible
   - reg
@@ -47,6 +65,7 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/rtc/pcf85363-tsr.h>
     i2c {
         #address-cells = <1>;
         #size-cells = <0>;
@@ -56,5 +75,7 @@ examples:
             reg = <0x51>;
             #clock-cells = <0>;
             quartz-load-femtofarads = <12500>;
+            wakeup-source;
+            nxp,timestamp-mode = <PCF85363_TSR1_FE PCF85363_TSR2_LB PCF85363_TSR3_LV>;
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


