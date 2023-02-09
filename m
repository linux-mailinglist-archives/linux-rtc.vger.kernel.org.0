Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46F1D690AA8
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Feb 2023 14:42:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230307AbjBINmA (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 9 Feb 2023 08:42:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230308AbjBINls (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 9 Feb 2023 08:41:48 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23B7F5EBFE
        for <linux-rtc@vger.kernel.org>; Thu,  9 Feb 2023 05:41:44 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so3891959wmb.2
        for <linux-rtc@vger.kernel.org>; Thu, 09 Feb 2023 05:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TtExAhyASjCaoXqGCyD4SFP8HX8WU84xqgiQDTtv4mE=;
        b=DZ4iuTh3FtikDJN19LSa9P+ch6kwH06TXcGr9O5HsoP3GNbzqz6d3zOWkobQxkNfUu
         0cC8pZRAUn/bMNiaFwNSIkrTSmGU4WYQAJ3RbxSupAdJm9hMBEyjmsIUNJkhxFXKpY6J
         gounMRJc4gd7VaL14Se5D5QxNkW54DZvWDkws+pZthuPynORhmggp5Wi8x29AYV6BciX
         DgNgLCI8hSuU+tbc28CYbe8joB60yi0BmKiSUH+TfJfH/HIjd1b8Hye/nWtGlVDR1aEH
         2An59fO1i3LypUeM/iOTlWN89K26GPchHe4ptteYzlqjjQtl0YiH99+99vNMaQbMKtxN
         Xbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TtExAhyASjCaoXqGCyD4SFP8HX8WU84xqgiQDTtv4mE=;
        b=vgYaIoRg4QH95XrJNLxcUj/bHxf5g8hd9NxO4xmNFCuA1h6gqDBTjKYFF5JxXLx9Jw
         zcN0aqQLe1imcWWklHYK9z98JQ9nbegNJ6AzKSLG+qPsr5AsPgk55Y0GIhFda0A0K5lp
         8RcAlzMRHouxlKfT8GLhz00/vBrehqLnE48pU/D783x2IvMQ7cDsJKnCeCaL+R2iHxTI
         2tXgHRRofnNp9B6f/LiVDyARRp158VvZS1DeDHBu6ALeAT6Hy58z914Lqps86eRM0Jtn
         v743asAvAWZA4zJFJ2a2UyMnidXGKEd4M81b3pRVZ3AK4/rCfbnh+HOA2ZZa8UqHcYgS
         9n0g==
X-Gm-Message-State: AO0yUKXxM2RcFwcqxwRlOcs5IzbzP3PwhNojEcmLbCbZTqhi02HqQHoG
        lG1uGU/Cvht4UHcJD6fUSM3v3T4TcM6sTS78tw4=
X-Google-Smtp-Source: AK7set8OFp887uOX9Ujf+dz1+EFOgo9XzvM2Bd1CPJzipfjT2n3QdC2yiT6YQ+Mf8MBKOgqIE4ewUQ==
X-Received: by 2002:a05:600c:13d4:b0:3df:e1e9:200e with SMTP id e20-20020a05600c13d400b003dfe1e9200emr10046874wmg.39.1675950103457;
        Thu, 09 Feb 2023 05:41:43 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id k12-20020a7bc40c000000b003dfe549da4fsm4946991wmi.18.2023.02.09.05.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 05:41:43 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Thu, 09 Feb 2023 14:41:40 +0100
Subject: [PATCH 4/6] dt-bindings: soc: amlogic: convert
 amlogic,gxbb-clkc.txt to dt-schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230209-b4-amlogic-bindings-convert-take2-v1-4-c4fe9049def9@linaro.org>
References: <20230209-b4-amlogic-bindings-convert-take2-v1-0-c4fe9049def9@linaro.org>
In-Reply-To: <20230209-b4-amlogic-bindings-convert-take2-v1-0-c4fe9049def9@linaro.org>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Convert the Amlogic Clock Controller bindings to dt-schema.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/clock/amlogic,gxbb-clkc.txt           | 53 ----------------------
 .../bindings/clock/amlogic,gxbb-clkc.yaml          | 51 +++++++++++++++++++++
 2 files changed, 51 insertions(+), 53 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
deleted file mode 100644
index 7ccecd5c02c1..000000000000
--- a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
+++ /dev/null
@@ -1,53 +0,0 @@
-* Amlogic GXBB Clock and Reset Unit
-
-The Amlogic GXBB clock controller generates and supplies clock to various
-controllers within the SoC.
-
-Required Properties:
-
-- compatible: should be:
-		"amlogic,gxbb-clkc" for GXBB SoC,
-		"amlogic,gxl-clkc" for GXL and GXM SoC,
-		"amlogic,axg-clkc" for AXG SoC.
-		"amlogic,g12a-clkc" for G12A SoC.
-		"amlogic,g12b-clkc" for G12B SoC.
-		"amlogic,sm1-clkc" for SM1 SoC.
-- clocks : list of clock phandle, one for each entry clock-names.
-- clock-names : should contain the following:
-  * "xtal": the platform xtal
-
-- #clock-cells: should be 1.
-
-Each clock is assigned an identifier and client nodes can use this identifier
-to specify the clock which they consume. All available clocks are defined as
-preprocessor macros in the dt-bindings/clock/gxbb-clkc.h header and can be
-used in device tree sources.
-
-Parent node should have the following properties :
-- compatible: "syscon", "simple-mfd, and "amlogic,meson-gx-hhi-sysctrl" or
-              "amlogic,meson-axg-hhi-sysctrl"
-- reg: base address and size of the HHI system control register space.
-
-Example: Clock controller node:
-
-sysctrl: system-controller@0 {
-	compatible = "amlogic,meson-gx-hhi-sysctrl", "syscon", "simple-mfd";
-	reg = <0 0 0 0x400>;
-
-	clkc: clock-controller {
-		#clock-cells = <1>;
-		compatible = "amlogic,gxbb-clkc";
-		clocks = <&xtal>;
-		clock-names = "xtal";
-	};
-};
-
-Example: UART controller node that consumes the clock generated by the clock
-  controller:
-
-	uart_AO: serial@c81004c0 {
-		compatible = "amlogic,meson-uart";
-		reg = <0xc81004c0 0x14>;
-		interrupts = <0 90 1>;
-		clocks = <&clkc CLKID_CLK81>;
-	};
diff --git a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.yaml
new file mode 100644
index 000000000000..412453fc75e4
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/amlogic,gxbb-clkc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Clock Controller
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+properties:
+  compatible:
+    enum:
+      - amlogic,gxbb-clkc
+      - amlogic,gxl-clkc
+      - amlogic,axg-clkc
+      - amlogic,g12a-clkc
+      - amlogic,g12b-clkc
+      - amlogic,sm1-clkc
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: xtal
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - '#clock-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    sysctrl: system-controller@0 {
+        compatible = "amlogic,meson-gx-hhi-sysctrl", "simple-mfd", "syscon";
+        reg = <0 0x400>;
+ 
+        clkc: clock-controller {
+            compatible = "amlogic,gxbb-clkc";
+            #clock-cells = <1>;
+            clocks = <&xtal>;
+            clock-names = "xtal";
+        };
+    };

-- 
2.34.1

