Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B0E7433983
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Oct 2021 17:00:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232764AbhJSPCx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 19 Oct 2021 11:02:53 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:53874 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231758AbhJSPCx (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 19 Oct 2021 11:02:53 -0400
Received: from [77.244.183.192] (port=62116 helo=melee.fritz.box)
        by hostingweb31.netsons.net with esmtpa (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1mcqbW-00D5qd-Ml; Tue, 19 Oct 2021 17:00:38 +0200
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     linux-kernel@vger.kernel.org
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Chiwoong Byun <woong.byun@samsung.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2 5/9] dt-bindings: mfd: add Maxim MAX77714 PMIC
Date:   Tue, 19 Oct 2021 16:59:15 +0200
Message-Id: <20211019145919.7327-6-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019145919.7327-1-luca@lucaceresoli.net>
References: <20211019145919.7327-1-luca@lucaceresoli.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Add bindings for the MAX77714 PMIC with GPIO, RTC and watchdog.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

Changes in v2: none
---
 .../bindings/mfd/maxim,max77714.yaml          | 58 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/maxim,max77714.yaml

diff --git a/Documentation/devicetree/bindings/mfd/maxim,max77714.yaml b/Documentation/devicetree/bindings/mfd/maxim,max77714.yaml
new file mode 100644
index 000000000000..2b0ce3b9bc92
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/maxim,max77714.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/maxim,max77714.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MAX77714 PMIC with GPIO, RTC and watchdog from Maxim Integrated.
+
+maintainers:
+  - Luca Ceresoli <luca@lucaceresoli.net>
+
+description: |
+  MAX77714 is a Power Management IC with 4 buck regulators, 9
+  low-dropout regulators, 8 GPIOs, RTC and watchdog.
+
+properties:
+  compatible:
+    const: maxim,max77714
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+    description:
+      The first cell is the IRQ number, the second cell is the trigger type.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - "#interrupt-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@1c {
+            compatible = "maxim,max77714";
+            reg = <0x1c>;
+            interrupt-parent = <&gpio2>;
+            interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+
+            interrupt-controller;
+            #interrupt-cells = <2>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 8d118d7957d2..514ff4a735e5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11386,6 +11386,11 @@ F:	drivers/power/supply/max77650-charger.c
 F:	drivers/regulator/max77650-regulator.c
 F:	include/linux/mfd/max77650.h
 
+MAXIM MAX77714 PMIC MFD DRIVER
+M:	Luca Ceresoli <luca@lucaceresoli.net>
+S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/maxim,max77714.yaml
+
 MAXIM MAX77802 PMIC REGULATOR DEVICE DRIVER
 M:	Javier Martinez Canillas <javier@dowhile0.org>
 L:	linux-kernel@vger.kernel.org
-- 
2.25.1

