Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BB53690A9D
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Feb 2023 14:41:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229891AbjBINlr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 9 Feb 2023 08:41:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230291AbjBINlp (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 9 Feb 2023 08:41:45 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D80C15C8BD
        for <linux-rtc@vger.kernel.org>; Thu,  9 Feb 2023 05:41:42 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id az4-20020a05600c600400b003dff767a1f1so1555384wmb.2
        for <linux-rtc@vger.kernel.org>; Thu, 09 Feb 2023 05:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RGW2oT94HK6ngpZmBKHolnNTHtBBlnG2dCVlzG6CWeE=;
        b=Qledw9xPLq/PvO+4IvdhHggxZshP/QGS+twZn4DOnVjLBXRpws8wY3UzjQhwfiMu79
         JWq3NT4amqXdro2bvg24B6Cf+b6Iijvzbmdy61S/HZdaYpP/89NIBjQ3bX3A0t0P71Bs
         MJ2R49zCyJBkDiASjvFg7g4WVnjFqH3VBZ92ljgajD5R4dLyMCL/IfAzBgYD+ycYRxm6
         exNEAZVJiFPPoylgypSxcFv6sZY2pp+xVqoIFD4G2NFwy9py+nbEaCv6M+YcH0TAAwGF
         WLRviEUCziru4V1XyMKO13ycJ6cRFj1nyzRlIN/PBD5QGmtofk2kmwIS8PGyJIsebDOr
         q9Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RGW2oT94HK6ngpZmBKHolnNTHtBBlnG2dCVlzG6CWeE=;
        b=e5oRO7y0itgjk9snAU06Xcn9dNNxwnmTwYjfZEZ0gd48qSWpB/gQahdEeFi7JzLRsy
         9u9MBBCEL+fjz/+1CiiLh3ia7OB58hMC10R4Pp8Vx1Pli72oej0OEXvzpIBrpn9wenLZ
         pfBkJdn+QYodKzI1HXXGrBGsvf1JgE0A+gcT0szkVRm0UZFpT2LN+9HGcO8n3XzrufcY
         29Go5Y3xgWFGow2MA68WeR1ue1lfl0su09PICEgyC56GIpsVV4aU8RebcRvEEsNBTC6/
         q3mILEMzh/alT8hOmuBJAVzoUeZSbImDvdqjVkNNLB3An4aa7/U82OnoBX6gAV1mi5Yr
         6fEg==
X-Gm-Message-State: AO0yUKV7iZOkm0SCHCuPHpZtZ8nN9aRsb99VWWB7+LmwDQDprS3yh+vW
        YvOxyb6YU/x7gt1YweNrzSkJ+Q==
X-Google-Smtp-Source: AK7set8tF+m+2BDy4Jqj9n4mBkHnqUS7RpYgJU7ApYsJuiqWKroRaqouDy7YBCcw28uEE1HvKDcWAQ==
X-Received: by 2002:a05:600c:3416:b0:3df:50eb:7ca6 with SMTP id y22-20020a05600c341600b003df50eb7ca6mr10258428wmp.15.1675950101385;
        Thu, 09 Feb 2023 05:41:41 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id k12-20020a7bc40c000000b003dfe549da4fsm4946991wmi.18.2023.02.09.05.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 05:41:41 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Thu, 09 Feb 2023 14:41:38 +0100
Subject: [PATCH 2/6] dt-bindings: soc: amlogic: convert clk-measure.txt to
 dt-schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230209-b4-amlogic-bindings-convert-take2-v1-2-c4fe9049def9@linaro.org>
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
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Convert the Amlogic Internal Clock Measurer bindings to dt-schema.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../soc/amlogic/amlogic,meson-gx-clk-measure.yaml  | 40 ++++++++++++++++++++++
 .../bindings/soc/amlogic/clk-measure.txt           | 21 ------------
 2 files changed, 40 insertions(+), 21 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
new file mode 100644
index 000000000000..77c281153010
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/amlogic/amlogic,meson-gx-clk-measure.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Internal Clock Measurer
+
+description:
+  The Amlogic SoCs contains an IP to measure the internal clocks.
+  The precision is multiple of MHz, useful to debug the clock states.
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+properties:
+  compatible:
+    enum:
+      - amlogic,meson-gx-clk-measure
+      - amlogic,meson8-clk-measure
+      - amlogic,meson8b-clk-measure
+      - amlogic,meson-axg-clk-measure
+      - amlogic,meson-g12a-clk-measure
+      - amlogic,meson-sm1-clk-measure
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    clock-measure@8758 {
+        compatible = "amlogic,meson-gx-clk-measure";
+        reg = <0x8758 0x10>;
+    };
diff --git a/Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt b/Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt
deleted file mode 100644
index 3dd563cec794..000000000000
--- a/Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt
+++ /dev/null
@@ -1,21 +0,0 @@
-Amlogic Internal Clock Measurer
-===============================
-
-The Amlogic SoCs contains an IP to measure the internal clocks.
-The precision is multiple of MHz, useful to debug the clock states.
-
-Required properties:
-- compatible: Shall contain one of the following :
-			"amlogic,meson-gx-clk-measure" for GX SoCs
-			"amlogic,meson8-clk-measure" for Meson8 SoCs
-			"amlogic,meson8b-clk-measure" for Meson8b SoCs
-			"amlogic,meson-axg-clk-measure" for AXG SoCs
-			"amlogic,meson-g12a-clk-measure" for G12a SoCs
-			"amlogic,meson-sm1-clk-measure" for SM1 SoCs
-- reg: base address and size of the Clock Measurer register space.
-
-Example:
-	clock-measure@8758 {
-		compatible = "amlogic,meson-gx-clk-measure";
-		reg = <0x0 0x8758 0x0 0x10>;
-	};

-- 
2.34.1

