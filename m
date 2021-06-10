Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 957063A2EDA
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Jun 2021 17:00:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230434AbhFJPCt (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 10 Jun 2021 11:02:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230361AbhFJPCt (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 10 Jun 2021 11:02:49 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 335FEC061574;
        Thu, 10 Jun 2021 08:00:53 -0700 (PDT)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id A163B82CBE;
        Thu, 10 Jun 2021 17:00:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1623337251;
        bh=yyoCyaHO4w6IoR4qUUqboKSLy+i3pd351UDxLaZ5LXY=;
        h=From:To:Cc:Subject:Date:From;
        b=fwqxLsKMJtVqnKbqrtKQgzK4Ch0giCmhxsMm9CV6rA1qRJ4LWVu55MsfwtDw/HMnl
         99zL9XXd53q3t/8kvJG51Y+d9lZKbjKCFEK7eeE3xdYhL40pndkq8hQN7gEXgxWHyV
         tLV9C2LgFJpUTpUde/+RtGQeuh6AB6Ts6Xj05Gx8A7P3zGiYxEz5xpNBXNe0FkUzDf
         38KBoDTujDjW4/eIfTUMo+GqLpxpYM3PLImKStsctWPkOpCWuwSp4dSbWeAFfiSQnO
         X9fDjOf5IT8ToNodwdRhXcBqmJEFWwAWuNKfoUxfhUCBXRWh454GNnAoqXCTg44/ns
         MaIcai2AlhEYA==
From:   Marek Vasut <marex@denx.de>
To:     devicetree@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>, kernel@dh-electronics.com,
        linux-rtc@vger.kernel.org
Subject: [PATCH V2] dt-bindings: rtc: rx8900: Convert to YAML schema
Date:   Thu, 10 Jun 2021 17:00:44 +0200
Message-Id: <20210610150044.29792-1-marex@denx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Convert the Epson RX8900 DT bindings to YAML schema.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: kernel@dh-electronics.com
Cc: linux-rtc@vger.kernel.org
To: devicetree@vger.kernel.org
---
V2: - Switch the license to (GPL-2.0-only OR BSD-2-Clause)
---
 .../devicetree/bindings/rtc/epson,rx8900.txt  | 22 ---------
 .../devicetree/bindings/rtc/epson,rx8900.yaml | 49 +++++++++++++++++++
 2 files changed, 49 insertions(+), 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/epson,rx8900.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/epson,rx8900.yaml

diff --git a/Documentation/devicetree/bindings/rtc/epson,rx8900.txt b/Documentation/devicetree/bindings/rtc/epson,rx8900.txt
deleted file mode 100644
index 3f61e516ecf6..000000000000
--- a/Documentation/devicetree/bindings/rtc/epson,rx8900.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Real Time Clock driver for:
-  - Epson RX8900
-  - Micro Crystal rv8803
-
-Required properties:
-- compatible: should be: "microcrystal,rv8803" or "epson,rx8900"
-- reg : the I2C address of the device for I2C
-
-Optional properties:
-- epson,vdet-disable : boolean, if present will disable voltage detector.
-  Should be set if no backup battery is used.
-- trickle-diode-disable : boolean, if present will disable internal trickle
-  charger diode
-
-Example:
-
-	rtc: rtc@32 {
-		compatible = "epson,rx8900"
-		reg = <0x32>;
-		epson,vdet-disable;
-		trickle-diode-disable;
-	};
diff --git a/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml b/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml
new file mode 100644
index 000000000000..29fe39bb08ad
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/epson,rx8900.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: EPSON RX8900 / Microcrystal RV8803 Real-Time Clock DT bindings
+
+maintainers:
+  - Marek Vasut <marex@denx.de>
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    enum:
+      - epson,rx8900
+      - microcrystal,rv8803
+
+  reg:
+    maxItems: 1
+
+  epson,vdet-disable:
+    type: boolean
+    description: |
+      Disable voltage detector. Should be set if no backup battery is used.
+
+  trickle-diode-disable: true
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        rtc@32 {
+            compatible = "epson,rx8900";
+            reg = <0x32>;
+            epson,vdet-disable;
+            trickle-diode-disable;
+        };
+    };
-- 
2.30.2

