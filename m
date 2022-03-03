Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA1644CBFAC
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Mar 2022 15:13:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233978AbiCCONm (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 3 Mar 2022 09:13:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233979AbiCCONk (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 3 Mar 2022 09:13:40 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60F7F18CC1F;
        Thu,  3 Mar 2022 06:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1646316774; x=1677852774;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ii1IDpzBCywstrqs0ihtCZsjxQTenixL/7CD9yqjDzk=;
  b=jslexHGVQ6j680Jwo5BJhkpCCBZ8Rzs1jJ5slBHeARBZI4JrBcPZt0zz
   kSKEzuLHOSOzO4ZfYO31sStdzVS1o8w59SnyvJrz45JJhJoE41L0oN9JK
   dobVvcbtXFi9qwDO+TG/mfdkB4dvSeswhom3c5JDh9Wem3qzJbhAPoFjE
   Zp7PD/8poyWXvFB6/yYLGtbRBbz6y4cdvNn0cA6D9gWqKIDo0+blEuOvq
   chs4CDeU6hMwHyM4W888AAq3Ruuh/nyEuZO16lYJ1he50GILHDcfLkDQy
   0W7urTgspPhePo4AsMBQOoEboGSGnyX6fr2IU5nSzqfkVhiPVpAPXurE+
   w==;
X-IronPort-AV: E=Sophos;i="5.90,151,1643698800"; 
   d="scan'208";a="155125685"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Mar 2022 07:12:53 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 3 Mar 2022 07:12:52 -0700
Received: from ROB-ULT-M68701.amer.actel.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Thu, 3 Mar 2022 07:12:46 -0700
From:   Sergiu Moga <sergiu.moga@microchip.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski@canonical.com>,
        <nicolas.ferre@microchip.com>, <claudiu.beznea@microchip.com>
CC:     <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Sergiu Moga <sergiu.moga@microchip.com>
Subject: [PATCH v2 4/5] dt-bindings: rtc: convert at91sam9 bindings to json-schema
Date:   Thu, 3 Mar 2022 16:06:25 +0200
Message-ID: <20220303140626.38129-5-sergiu.moga@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303140626.38129-1-sergiu.moga@microchip.com>
References: <20220303140626.38129-1-sergiu.moga@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,
        T_SPF_PERMERROR autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Convert RTC binding for Atmel/Microchip SoCs to Device Tree Schema
format.

Signed-off-by: Sergiu Moga <sergiu.moga@microchip.com>
---
 .../bindings/rtc/atmel,at91sam9-rtc.txt       | 25 --------
 .../bindings/rtc/atmel,at91sam9-rtc.yaml      | 61 +++++++++++++++++++
 2 files changed, 61 insertions(+), 25 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/atmel,at91sam9-rtc.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/atmel,at91sam9-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/atmel,at91sam9-rtc.txt b/Documentation/devicetree/bindings/rtc/atmel,at91sam9-rtc.txt
deleted file mode 100644
index 3f0e2a5950eb..000000000000
--- a/Documentation/devicetree/bindings/rtc/atmel,at91sam9-rtc.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-Atmel AT91SAM9260 Real Time Timer
-
-Required properties:
-- compatible: should be one of the following:
-	- "atmel,at91sam9260-rtt"
-	- "microchip,sam9x60-rtt", "atmel,at91sam9260-rtt"
-- reg: should encode the memory region of the RTT controller
-- interrupts: rtt alarm/event interrupt
-- clocks: should contain the 32 KHz slow clk that will drive the RTT block.
-- atmel,rtt-rtc-time-reg: should encode the GPBR register used to store
-	the time base when the RTT is used as an RTC.
-	The first cell should point to the GPBR node and the second one
-	encode the offset within the GPBR block (or in other words, the
-	GPBR register used to store the time base).
-
-
-Example:
-
-rtt@fffffd20 {
-	compatible = "atmel,at91sam9260-rtt";
-	reg = <0xfffffd20 0x10>;
-	interrupts = <1 4 7>;
-	clocks = <&clk32k>;
-	atmel,rtt-rtc-time-reg = <&gpbr 0x0>;
-};
diff --git a/Documentation/devicetree/bindings/rtc/atmel,at91sam9-rtc.yaml b/Documentation/devicetree/bindings/rtc/atmel,at91sam9-rtc.yaml
new file mode 100644
index 000000000000..5a639c0ec2c0
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/atmel,at91sam9-rtc.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2022 Microchip Technology, Inc. and its subsidiaries
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/atmel,at91sam9-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel AT91 RTT Device Tree Bindings
+
+allOf:
+  - $ref: "rtc.yaml#"
+
+maintainers:
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: atmel,at91sam9260-rtt
+      - items:
+          - const: microchip,sam9x60-rtt
+          - const: atmel,at91sam9260-rtt
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  atmel,rtt-rtc-time-reg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      Should encode the GPBR register used to store the time base when the
+      RTT is used as an RTC. The first cell should point to the GPBR node
+      and the second one encodes the offset within the GPBR block (or in
+      other words, the GPBR register used to store the time base).
+
+  start-year: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - atmel,rtt-rtc-time-reg
+
+additionalProperties: false
+
+examples:
+  - |
+    rtc@fffffd20 {
+        compatible = "atmel,at91sam9260-rtt";
+        reg = <0xfffffd20 0x10>;
+        interrupts = <1 4 7>;
+        clocks = <&clk32k>;
+        atmel,rtt-rtc-time-reg = <&gpbr 0x0>;
+    };
-- 
2.25.1

