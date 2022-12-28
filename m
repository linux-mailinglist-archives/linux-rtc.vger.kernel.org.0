Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2600565777B
	for <lists+linux-rtc@lfdr.de>; Wed, 28 Dec 2022 15:06:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbiL1OG3 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 28 Dec 2022 09:06:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230340AbiL1OG2 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 28 Dec 2022 09:06:28 -0500
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6139DCE12
        for <linux-rtc@vger.kernel.org>; Wed, 28 Dec 2022 06:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1672236384; x=1674828384;
        h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=TBKS80vKaipFTFE6LaivfcVJSzpQsKy/Yk+eyXeau1I=;
        b=GOw4qB+JmFH6/xLMLnlNQh64Fp4VlH1vTxk2J4wDkOk2LIB+aRTD7e8pRZ3DMgQW
        StR0BYUQ35lF+FlkdCqyfldAIFxW5qM2PsO1U6hQLaoL1DKsUdHRq8n6ePt1hLWL
        a7/lVkWDWmKb6M/gQVM63jYoG/Ec911+Zl4JajwFIY4=;
X-AuditID: ac14000a-917fe70000007ecb-97-63ac4d60f0eb
Received: from berlix.phytec.de (Unknown_Domain [172.25.0.12])
        (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 5E.B5.32459.06D4CA36; Wed, 28 Dec 2022 15:06:24 +0100 (CET)
Received: from augenblix2.phytec.de (172.25.0.11) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 28 Dec
 2022 15:06:24 +0100
From:   Wadim Egorov <w.egorov@phytec.de>
To:     <upstream@lists.phytec.de>, <devicetree@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>
CC:     <krzysztof.kozlowski+dt@linaro.org>, <robh+dt@kernel.org>,
        <alexandre.belloni@bootlin.com>, <a.zummo@towertech.it>
Subject: [PATCH] dt-bindings: rtc: Add rv3028 to rv3032.yaml dtschema
Date:   Wed, 28 Dec 2022 15:06:10 +0100
Message-ID: <20221228140610.938686-1-w.egorov@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Berlix.phytec.de (172.25.0.12) To Berlix.phytec.de
 (172.25.0.12)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDLMWRmVeSWpSXmKPExsWyRpKBRzfBd02ywfQn8hZLLl5lt2h/t4zd
        Yv6Rc6wWfS8eMlscW32FzaJ17xF2i+536g7sHvPWVHtsWtXJ5nHn2h42j/7uFlaP6fN+Mnl8
        3iQXwBbFZZOSmpNZllqkb5fAldHfO4O54JJwxZxFy5gaGPfxdzFyckgImEi0Pb/H1sXIxSEk
        sJhJ4vXJ36wQzhNGiT+n3rOAVLEJqEvc2fCNFcQWEYiWaJ37hQ3EZhaokPh49z4jiC0s4Cqx
        /dlGoDgHB4uAqsTf71YgJq+AhcT/ZmuIXfISMy99ZwexeQUEJU7OfMICMUVeonnrbGYIW0Li
        4IsXYLYQUPzFpeUsML3Tzr1mhrBDJbZ+2c40gVFgFpJRs5CMmoVk1AJG5lWMQrmZydmpRZnZ
        egUZlSWpyXopqZsYQSEuwsC1g7FvjschRiYOxkOMEhzMSiK8GmdXJwvxpiRWVqUW5ccXleak
        Fh9ilOZgURLnvd/DlCgkkJ5YkpqdmlqQWgSTZeLglGpgVLzP+rH84XFB6Xzva0afnFgWPzO6
        kxm1duMzdkW59Ej9KqMlib1cczyWiLRPzTyUr5W1UEwv7o7pEsusiYvd66vL1eWubFWSU2Lx
        cFFMUt3nltb9u6chySbDxNtL6a2UzHnpbK95yqZH8y5d/KocxJ5jW6K6OEFZ4lImn1Ljtwkf
        HttZCSmxFGckGmoxFxUnAgDtfW0LXwIAAA==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Move RV3028 RTC bindings from trivial-rtc.yaml into microcrystal,rv3032.yaml.
RV3028 can have a trickle-resitor-ohms property. Make it known to dtschema.

Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
---
 .../bindings/rtc/microcrystal,rv3028.yaml     | 56 +++++++++++++++++++
 .../devicetree/bindings/rtc/trivial-rtc.yaml  |  2 -
 2 files changed, 56 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/microcrystal,rv3028.yaml

diff --git a/Documentation/devicetree/bindings/rtc/microcrystal,rv3028.yaml b/Documentation/devicetree/bindings/rtc/microcrystal,rv3028.yaml
new file mode 100644
index 000000000000..4abe4756bc9b
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/microcrystal,rv3028.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/microcrystal,rv3028.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip RV-3028 RTC
+
+allOf:
+  - $ref: "rtc.yaml#"
+
+maintainers:
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+properties:
+  compatible:
+    const: microcrystal,rv3028
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  start-year: true
+
+  trickle-resistor-ohms:
+    enum:
+      - 3000
+      - 5000
+      - 9000
+      - 15000
+
+required:
+  - compatible
+  - reg
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
+        rtc@51 {
+            compatible = "microcrystal,rv3028";
+            reg = <0x51>;
+            pinctrl-0 = <&rtc_nint_pins>;
+            interrupts-extended = <&gpio1 16 IRQ_TYPE_LEVEL_HIGH>;
+            trickle-resistor-ohms = <3000>;
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
index d9fc120c61cc..84cce1f0ca0c 100644
--- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
@@ -48,8 +48,6 @@ properties:
       # Intersil ISL12022 Real-time Clock
       - isil,isl12022
       # Real Time Clock Module with I2C-Bus
-      - microcrystal,rv3028
-      # Real Time Clock Module with I2C-Bus
       - microcrystal,rv3029
       # Real Time Clock
       - microcrystal,rv8523
-- 
2.34.1

