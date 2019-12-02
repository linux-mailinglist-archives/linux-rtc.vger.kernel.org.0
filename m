Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D7BC10EBF4
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Dec 2019 15:58:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727420AbfLBO6C (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 2 Dec 2019 09:58:02 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:27946 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727401AbfLBO6C (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 2 Dec 2019 09:58:02 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xB2Eqcmi006832;
        Mon, 2 Dec 2019 15:57:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=3UQF47IsQbbR4j5RQNmAelC5cxXMhW2+SZ9c6QJK0wI=;
 b=eV/4aBZPeBkt2hJLCUfhHcaifv35f4nx370D/gAlXrx97PD6jrlvdHYkbrhYLdk4LKPj
 biXd4Qsr0KJp3/Y4M+QWvtPEqG5Mog6PP5RqBaHTNNzk2gjnf6kzYUl4oVGcQENT1gyB
 tNv/zL6tkmdLDAuAFkKNhEZzqtyYjnmWw2XCbYIulBnFZuc/JfpzYuh81SEwfCwoVr+q
 J2vtnKTFxman2htG25UofrLG3KTiQwcjYIx7a812O/6Br5OnJ0kJcBSXaKRPzBNJhe5W
 r8Alkbuvp/46gt+lrjTczGLekP7aGF3f0JlwYowdKKodtAK8yS7//wJqN36pbdp8xImv Kw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2wkee9thqg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 02 Dec 2019 15:57:43 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E231B10002A;
        Mon,  2 Dec 2019 15:57:42 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D44A62BE22B;
        Mon,  2 Dec 2019 15:57:42 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 2 Dec 2019 15:57:42
 +0100
From:   Benjamin Gaignard <benjamin.gaignard@st.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <alexandre.torgue@st.com>
CC:     <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [PATCH] dt-bindings: rtc: Convert stm32 rtc bindings to json-schema
Date:   Mon, 2 Dec 2019 15:57:40 +0100
Message-ID: <20191202145740.29123-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-02_02:2019-11-29,2019-12-02 signatures=0
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Convert the STM32 RTC binding to DT schema format using json-schema

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 .../devicetree/bindings/rtc/st,stm32-rtc.txt       |  61 ---------
 .../devicetree/bindings/rtc/st,stm32-rtc.yaml      | 152 +++++++++++++++++++++
 2 files changed, 152 insertions(+), 61 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/st,stm32-rtc.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/st,stm32-rtc.txt b/Documentation/devicetree/bindings/rtc/st,stm32-rtc.txt
deleted file mode 100644
index 130ca5b98253..000000000000
--- a/Documentation/devicetree/bindings/rtc/st,stm32-rtc.txt
+++ /dev/null
@@ -1,61 +0,0 @@
-STM32 Real Time Clock
-
-Required properties:
-- compatible: can be one of the following:
-  - "st,stm32-rtc" for devices compatible with stm32(f4/f7).
-  - "st,stm32h7-rtc" for devices compatible with stm32h7.
-  - "st,stm32mp1-rtc" for devices compatible with stm32mp1.
-- reg: address range of rtc register set.
-- clocks: can use up to two clocks, depending on part used:
-  - "rtc_ck": RTC clock source.
-  - "pclk": RTC APB interface clock.
-    It is not present on stm32(f4/f7).
-    It is required on stm32(h7/mp1).
-- clock-names: must be "rtc_ck" and "pclk".
-    It is required on stm32(h7/mp1).
-- interrupts: rtc alarm interrupt. On stm32mp1, a second interrupt is required
-  for rtc alarm wakeup interrupt.
-- st,syscfg: phandle/offset/mask triplet. The phandle to pwrcfg used to
-  access control register at offset, and change the dbp (Disable Backup
-  Protection) bit represented by the mask, mandatory to disable/enable backup
-  domain (RTC registers) write protection.
-    It is required on stm32(f4/f7/h7).
-
-Optional properties (to override default rtc_ck parent clock on stm32(f4/f7/h7):
-- assigned-clocks: reference to the rtc_ck clock entry.
-- assigned-clock-parents: phandle of the new parent clock of rtc_ck.
-
-Example:
-
-	rtc: rtc@40002800 {
-		compatible = "st,stm32-rtc";
-		reg = <0x40002800 0x400>;
-		clocks = <&rcc 1 CLK_RTC>;
-		assigned-clocks = <&rcc 1 CLK_RTC>;
-		assigned-clock-parents = <&rcc 1 CLK_LSE>;
-		interrupt-parent = <&exti>;
-		interrupts = <17 1>;
-		st,syscfg = <&pwrcfg 0x00 0x100>;
-	};
-
-	rtc: rtc@58004000 {
-		compatible = "st,stm32h7-rtc";
-		reg = <0x58004000 0x400>;
-		clocks = <&rcc RTCAPB_CK>, <&rcc RTC_CK>;
-		clock-names = "pclk", "rtc_ck";
-		assigned-clocks = <&rcc RTC_CK>;
-		assigned-clock-parents = <&rcc LSE_CK>;
-		interrupt-parent = <&exti>;
-		interrupts = <17 1>;
-		interrupt-names = "alarm";
-		st,syscfg = <&pwrcfg 0x00 0x100>;
-	};
-
-	rtc: rtc@5c004000 {
-		compatible = "st,stm32mp1-rtc";
-		reg = <0x5c004000 0x400>;
-		clocks = <&rcc RTCAPB>, <&rcc RTC>;
-		clock-names = "pclk", "rtc_ck";
-		interrupts-extended = <&intc GIC_SPI 3 IRQ_TYPE_NONE>,
-				      <&exti 19 1>;
-	};
diff --git a/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml b/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml
new file mode 100644
index 000000000000..80c445005bfb
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml
@@ -0,0 +1,152 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/st,stm32-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 Real Time Clock Bindings
+
+maintainers:
+  - Gabriel Fernandez <gabriel.fernandez@st.com>
+
+properties:
+  compatible:
+    enum:
+      - st,stm32-rtc
+      - st,stm32h7-rtc
+      - st,stm32mp1-rtc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: rtc_ck
+
+  interrupts:
+    maxItems: 1
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - st,stm32-rtc
+              - st,stm32h7-rtc
+    then:
+      properties:
+        st,syscfg:
+          allOf:
+            - $ref: "/schemas/types.yaml#/definitions/phandle-array"
+            - items:
+                minItems: 3
+                maxItems: 3
+          description: |
+            Phandle/offset/mask triplet. The phandle to pwrcfg used to
+            access control register at offset, and change the dbp (Disable Backup
+            Protection) bit represented by the mask, mandatory to disable/enable backup
+            domain (RTC registers) write protection.
+
+        assigned-clocks:
+          allOf:
+            - $ref: "/schemas/types.yaml#/definitions/phandle-array"
+          description: |
+            override default rtc_ck parent clock reference to the rtc_ck clock entry
+          maxItems: 1
+
+        assigned-clock-parents:
+          allOf:
+           - $ref: "/schemas/types.yaml#/definitions/phandle-array"
+          description: |
+            override default rtc_ck parent clock phandle of the new parent clock of rtc_ck
+          maxItems: 1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: st,stm32-rtc
+
+    then:
+      properties:
+        clocks:
+          minItems: 1
+          maxItems: 1
+
+        clock-names: false
+
+      required:
+        - st,syscfg
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: st,stm32h7-rtc
+
+    then:
+       properties:
+         clocks:
+           minItems: 2
+           maxItems: 2
+
+       required:
+         - clock-names
+         - st,syscfg
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: st,stm32mp1-rtc
+
+    then:
+       properties:
+         clocks:
+           minItems: 2
+           maxItems: 2
+
+         assigned-clocks: false
+         assigned-clock-parents: false
+
+       required:
+         - clock-names
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+
+examples:
+  - |
+    #include <dt-bindings/mfd/stm32f4-rcc.h>
+    #include <dt-bindings/clock/stm32fx-clock.h>
+    rtc@40002800 {
+      compatible = "st,stm32-rtc";
+      reg = <0x40002800 0x400>;
+      clocks = <&rcc 1 CLK_RTC>;
+      assigned-clocks = <&rcc 1 CLK_RTC>;
+      assigned-clock-parents = <&rcc 1 CLK_LSE>;
+      interrupt-parent = <&exti>;
+      interrupts = <17 1>;
+      st,syscfg = <&pwrcfg 0x00 0x100>;
+    };
+
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/stm32mp1-clks.h>
+    rtc@5c004000 {
+      compatible = "st,stm32mp1-rtc";
+      reg = <0x5c004000 0x400>;
+      clocks = <&rcc RTCAPB>, <&rcc RTC>;
+      clock-names = "pclk", "rtc_ck";
+      interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
+    };
+
+...
-- 
2.15.0

