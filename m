Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A34F37BB7A
	for <lists+linux-rtc@lfdr.de>; Wed, 12 May 2021 13:11:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230178AbhELLMz (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 12 May 2021 07:12:55 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:33260 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230035AbhELLMy (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 12 May 2021 07:12:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1620817906; x=1652353906;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Scya2VZAJZLJolwIvXUSMsqdNvVkhrQpv7RtZcVkHbI=;
  b=Usi8CGEpDd3tWmE4H/IfGtWrq8J1mLnP9bY2IVrcV+dgPB1nL8FDu3KF
   pfdobdEswrwrxThnKNwJcshxnEk0BI6mvq5BsBRijPGvrn20rafQebKer
   +KS9euc0OlBp3+tkdboGOK6grHAIcXl5ly6xgys5smw+NfCFgevJRJj+z
   UHNljcTBDpQExXaHgiBIyahsMBOSwtbJMNFllxNoB+dPTn9Q/k85nMtlR
   5HQxLRZz+jak6tjXqXfcCqqX4AUqNaMzXw9fiCjcngLLmsic/BDAJeeGo
   WW53senX0tGe6J78w7uPFcYF8mrY4iXjBX21mynWMpluRu/V3yy8O8YhB
   A==;
IronPort-SDR: o+Ik2olpsNtWI4iN6qDQYRyxaoPqLZ96B4mOMQRDC4xEmShkDnc86WrZITVaoQr8/FmKE+cGOd
 vA0avdhf4hF3Ke4+GimikRDJGEADtTOY+P6d/zVXtUuOzD2l/eMFwCYBOxT72oNH0UscynNBhu
 V0Dl3JWMxy5KLM3l6vnU+T8ebGuCk8/zP1AWxiYkUl2DdkAuYdN74NrijXyzt07iGk2q4092zd
 Mm467qEBl352ryXf+JkIjRSfV9l/yzV4VWFxPdxOdRWyFCvamsBUBda3OJFy3cRYpLxrjRsRdH
 iZ8=
X-IronPort-AV: E=Sophos;i="5.82,293,1613458800"; 
   d="scan'208";a="127748955"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 May 2021 04:11:45 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 12 May 2021 04:11:45 -0700
Received: from daire-ubuntu.school.villiers.net (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Wed, 12 May 2021 04:11:41 -0700
From:   <daire.mcnamara@microchip.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <linux-rtc@vger.kernel.org>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
CC:     <palmer@dabbelt.com>, <cyril.jean@microchip.com>,
        <padmarao.begari@microchip.com>, <lewis.hanly@microchip.com>,
        <conor.dooley@microchip.com>, <david.abdurachmanov@gmail.com>,
        Daire McNamara <daire.mcnamara@microchip.com>
Subject: [PATCH v1 1/2] dt-bindings: rtc: microchip: Add Microchip PolarFire host binding
Date:   Wed, 12 May 2021 12:11:32 +0100
Message-ID: <20210512111133.1650740-2-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210512111133.1650740-1-daire.mcnamara@microchip.com>
References: <20210512111133.1650740-1-daire.mcnamara@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Daire McNamara <daire.mcnamara@microchip.com>

Add device tree bindings for the Microchip PolarFire real-time
clock controller

Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
---
 .../bindings/rtc/microchip,mfps-rtc.yaml      | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
new file mode 100644
index 000000000000..c82b3e7351e0
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/microchip,mfps-rtc.yaml#
+
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip PolarFire Soc (MPFS) RTC Device Tree Bindings
+
+allOf:
+  - $ref: "rtc.yaml#"
+
+maintainers:
+  - Daire McNamara <daire.mcnamara@microchip.com>
+  - Lewis Hanly <lewis.hanly@microchip.com>
+
+properties:
+  compatible:
+    enum:
+      - microchip,mpfs-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  prescaler:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: rtc
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/microchip,mpfs-clock.h>
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        rtc@20124000 {
+            compatible = "microchip,mpfs-rtc";
+            reg = <0 0x20124000 0 0x1000>;
+            clocks = <&clkcfg CLK_RTC>;
+            clock-names = "rtc";
+            interrupts = <80>;
+        };
+    };
+...
-- 
2.25.1

