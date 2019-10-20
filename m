Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79DA4DDC4B
	for <lists+linux-rtc@lfdr.de>; Sun, 20 Oct 2019 06:08:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726205AbfJTEI2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 20 Oct 2019 00:08:28 -0400
Received: from mx2.suse.de ([195.135.220.15]:37122 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725851AbfJTEI2 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sun, 20 Oct 2019 00:08:28 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 605AAACCA;
        Sun, 20 Oct 2019 04:08:26 +0000 (UTC)
From:   =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
To:     linux-realtek-soc@lists.infradead.org
Cc:     linux-arm-kernel@lists.infradead.org,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/8] dt-bindings: rtc: realtek: Convert RTD119x to schema
Date:   Sun, 20 Oct 2019 06:08:11 +0200
Message-Id: <20191020040817.16882-3-afaerber@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191020040817.16882-1-afaerber@suse.de>
References: <20191020040817.16882-1-afaerber@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Convert the RTD119x binding to a YAML schema.

Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 v2: New
 
 .../devicetree/bindings/rtc/realtek,rtd119x.txt    | 16 ---------
 .../devicetree/bindings/rtc/realtek,rtd119x.yaml   | 38 ++++++++++++++++++++++
 2 files changed, 38 insertions(+), 16 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/realtek,rtd119x.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/realtek,rtd119x.yaml

diff --git a/Documentation/devicetree/bindings/rtc/realtek,rtd119x.txt b/Documentation/devicetree/bindings/rtc/realtek,rtd119x.txt
deleted file mode 100644
index bbf1ccb5df31..000000000000
--- a/Documentation/devicetree/bindings/rtc/realtek,rtd119x.txt
+++ /dev/null
@@ -1,16 +0,0 @@
-Realtek RTD129x Real-Time Clock
-===============================
-
-Required properties:
-- compatible :  Should be "realtek,rtd1295-rtc"
-- reg        :  Specifies the physical base address and size
-- clocks     :  Specifies the clock gate
-
-
-Example:
-
-	rtc@9801b600 {
-		compatible = "realtek,rtd1295-clk";
-		reg = <0x9801b600 0x100>;
-		clocks = <&clkc RTD1295_CLK_EN_MISC_RTC>;
-	};
diff --git a/Documentation/devicetree/bindings/rtc/realtek,rtd119x.yaml b/Documentation/devicetree/bindings/rtc/realtek,rtd119x.yaml
new file mode 100644
index 000000000000..71b7396bd469
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/realtek,rtd119x.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/realtek,rtd119x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek RTD129x Real-Time Clock
+
+allOf:
+  - $ref: "rtc.yaml#"
+
+maintainers:
+  - Andreas Färber <afaerber@suse.de>
+
+properties:
+  compatible:
+    const: realtek,rtd1295-rtc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: Specifies the clock gate
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+examples:
+  - |
+	rtc@9801b600 {
+		compatible = "realtek,rtd1295-clk";
+		reg = <0x9801b600 0x100>;
+		clocks = <&clkc RTD1295_CLK_EN_MISC_RTC>;
+	};
+...
-- 
2.16.4

