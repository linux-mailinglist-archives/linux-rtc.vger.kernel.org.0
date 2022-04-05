Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DABFF4F4878
	for <lists+linux-rtc@lfdr.de>; Wed,  6 Apr 2022 02:02:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232260AbiDEVkZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 5 Apr 2022 17:40:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1573373AbiDES7u (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 5 Apr 2022 14:59:50 -0400
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 036B6CD33C
        for <linux-rtc@vger.kernel.org>; Tue,  5 Apr 2022 11:57:49 -0700 (PDT)
Received: from relay12.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::232])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id 3B9F7CAA93
        for <linux-rtc@vger.kernel.org>; Tue,  5 Apr 2022 18:47:31 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id EE4CF200007;
        Tue,  5 Apr 2022 18:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1649184441;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=H31g2lSzg7n7VxTobwZqrUHtLT3mR7JfXrSowetcS0w=;
        b=EQxDMFEwl4Uxy8D2SwWeQ8tAQ+2j2I/zKbmGibaOzOVWJoZmunWjeF3lcUcR8DeYJkhEvY
        abGqGR71XtqDseu8jLNaClkZZpO7sYWiO78kDpbCrS8+QboA2xSH91qLv5HdyFNhMwbUH9
        pWuhCApaCc/SLHyplkTin48tYeGFe0powHkt/6UCZu8CabRQA1C5C56W3m/fco8oDb+XZR
        bRxW/LLJctxd4MRQWOai45lQVw5DyIMYzHftJAV6/9I0ufMBgw+///8Hy1cWBEGWnjevXb
        Invmw8YRhSNc35i5XHPgZUx0wrQ2HMhuDCUKxspmm599ZMXc5xVuX9T1W84tYQ==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        linux-rtc@vger.kernel.org,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 1/7] dt-bindings: rtc: rzn1: Describe the RZN1 RTC
Date:   Tue,  5 Apr 2022 20:47:10 +0200
Message-Id: <20220405184716.1578385-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220405184716.1578385-1-miquel.raynal@bootlin.com>
References: <20220405184716.1578385-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Add new binding file for this RTC.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../bindings/rtc/renesas,rzn1-rtc.yaml        | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
new file mode 100644
index 000000000000..903f0cd361fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/renesas,rzn1-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/N1 SoCs Real-Time Clock DT bindings
+
+maintainers:
+  - Miquel Raynal <miquel.raynal@bootlin.com>
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r9a06g032-rtc
+          - const: renesas,rzn1-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 3
+    maxItems: 3
+
+  interrupt-names:
+    items:
+      - const: alarm
+      - const: timer
+      - const: pps
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: hclk
+
+  start-year: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - start-year
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/r9a06g032-sysctrl.h>
+    rtc@40006000 {
+       compatible = "renesas,r9a06g032-rtc", "renesas,rzn1-rtc";
+       reg = <0x40006000 0x1000>;
+       interrupts = <GIC_SPI 66 IRQ_TYPE_EDGE_RISING>,
+                    <GIC_SPI 67 IRQ_TYPE_EDGE_RISING>,
+                    <GIC_SPI 68 IRQ_TYPE_EDGE_RISING>;
+       interrupt-names = "alarm", "timer", "pps";
+       clocks = <&sysctrl R9A06G032_HCLK_RTC>;
+       clock-names = "hclk";
+       start-year = <2000>;
+     };
-- 
2.27.0

