Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5495C62F79B
	for <lists+linux-rtc@lfdr.de>; Fri, 18 Nov 2022 15:35:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234213AbiKROfC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 18 Nov 2022 09:35:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242449AbiKROeN (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 18 Nov 2022 09:34:13 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EC967C456
        for <linux-rtc@vger.kernel.org>; Fri, 18 Nov 2022 06:33:41 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id i186-20020a1c3bc3000000b003cfe29a5733so7648323wma.3
        for <linux-rtc@vger.kernel.org>; Fri, 18 Nov 2022 06:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=09aY4u5C18C95IeW01R0+92XJvP4bpZqONCKdfc3+Xw=;
        b=Hz6QAFCl6u3Xg9aZpvQtddO3JKE/IgN/I5pDQoSPQf5cdZwtlhLKb8TgdVwLTtOq9C
         UOycTp7N8Shc+QeRli8chI3ys0R3LIkynrk+6dbqocreNS22aR+fYFeMU5tnWDSnmlpM
         NpWRroujyOa4rO1bPwEKyUy59P0eLFtFVqP0ESM63wHz/aZ3t64uAA7JhkOPKdGqgRvs
         /IxKVbSoYISyxh72nb1/0zz0IIZJffX3c4bVbl4V3BZna6wHmeYqmvvOk1Iqil0d7y0J
         ObPOjfJPfHyw0AJBcg3VjRPMRT4BHp9sagQl/tyfZjyy1ZtJIjw2Dgx89wRI7YoZ/4i4
         jn6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=09aY4u5C18C95IeW01R0+92XJvP4bpZqONCKdfc3+Xw=;
        b=eKimDgJIDuTgvN3gj+ynERrpJQcuGzk1nTdzVS0ZG1ZfUovLryC+gdb99IETtzwB2j
         S69ln1NnyGeNZxqP0BUGH6nXvsAAGdS29hE9Sywel4ZF5bEJeqvUUQ+uqmlYJ/74x1vw
         HAoe+VSDk8Tk5fQIlImwWMe9nkQIUjbBl4oCxtP+0kvhApc8IKDAwq5eTqK8J7UbK2uw
         Wod8Fg3Kg7Esruf+9HtzIPgL6mw26flFStVnbT6CIB8Zs2rUMY5MISHzuYOdzv0APxl8
         qCckrPWWW7Px3odqJrBIzD3VGMNY3waR5lj4z4iiINo/1rmKEFTLHc514Jyh+m2rJlfw
         w6XA==
X-Gm-Message-State: ANoB5pkVLT0hCAGN/0CO0lP2jFl6uQ519N/EGJ8mP4ONi/MpA0ILJCoZ
        ZO2oJpLZ2eNdEP3U1nrbnBvZpxlsyx9TkA==
X-Google-Smtp-Source: AA0mqf5j6wl5M3NRdgUjqO/lUfZMPosplhrqhTWjq9z76lGsnjGSOV4qyvFEj22qrrANUGlEr+SIfg==
X-Received: by 2002:a05:600c:3109:b0:3cf:5731:53db with SMTP id g9-20020a05600c310900b003cf573153dbmr8846282wmo.85.1668782019560;
        Fri, 18 Nov 2022 06:33:39 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id j21-20020a05600c1c1500b003cfb7c02542sm5436726wms.11.2022.11.18.06.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 06:33:39 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 18 Nov 2022 15:33:32 +0100
Subject: [PATCH 06/12] dt-bindings: rtc: convert rtc-meson.txt to dt-schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221117-b4-amlogic-bindings-convert-v1-6-3f025599b968@linaro.org>
References: <20221117-b4-amlogic-bindings-convert-v1-0-3f025599b968@linaro.org>
In-Reply-To: <20221117-b4-amlogic-bindings-convert-v1-0-3f025599b968@linaro.org>
To:     Jakub Kicinski <kuba@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Eric Dumazet <edumazet@google.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "David S. Miller" <davem@davemloft.net>
Cc:     linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        devicetree@vger.kernel.org
X-Mailer: b4 0.10.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Convert the Amlogic Meson6 RTC bindings to dt-schema.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/rtc/amlogic,meson6-rtc.yaml           | 62 ++++++++++++++++++++++
 .../devicetree/bindings/rtc/rtc-meson.txt          | 35 ------------
 2 files changed, 62 insertions(+), 35 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/amlogic,meson6-rtc.yaml b/Documentation/devicetree/bindings/rtc/amlogic,meson6-rtc.yaml
new file mode 100644
index 000000000000..8bf7d3a9be98
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/amlogic,meson6-rtc.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/amlogic,meson6-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Meson6, Meson8, Meson8b and Meson8m2 RTC
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+  - Martin Blumenstingl <martin.blumenstingl@googlemail.com>
+
+allOf:
+  - $ref: rtc.yaml#
+  - $ref: /schemas/nvmem/nvmem.yaml#
+
+properties:
+  compatible:
+    enum:
+      - amlogic,meson6-rtc
+      - amlogic,meson8-rtc
+      - amlogic,meson8b-rtc
+      - amlogic,meson8m2-rtc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  vdd-supply: true
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    rtc: rtc@740 {
+        compatible = "amlogic,meson6-rtc";
+        reg = <0x740 0x14>;
+        interrupts = <GIC_SPI 72 IRQ_TYPE_EDGE_RISING>;
+        clocks = <&rtc32k_xtal>;
+        vdd-supply = <&rtc_vdd>;
+        resets = <&reset_rtc>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        mac@0 {
+            reg = <0 6>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/rtc/rtc-meson.txt b/Documentation/devicetree/bindings/rtc/rtc-meson.txt
deleted file mode 100644
index e921fe66a362..000000000000
--- a/Documentation/devicetree/bindings/rtc/rtc-meson.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-* Amlogic Meson6, Meson8, Meson8b and Meson8m2 RTC
-
-Required properties:
-- compatible: should be one of the following describing the hardware:
-	* "amlogic,meson6-rtc"
-	* "amlogic,meson8-rtc"
-	* "amlogic,meson8b-rtc"
-	* "amlogic,meson8m2-rtc"
-
-- reg: physical register space for the controller's memory mapped registers.
-- interrupts: the interrupt line of the RTC block.
-- clocks: reference to the external 32.768kHz crystal oscillator.
-- vdd-supply: reference to the power supply of the RTC block.
-- resets: reset controller reference to allow reset of the controller
-
-Optional properties for the battery-backed non-volatile memory:
-- #address-cells: should be 1 to address the battery-backed non-volatile memory
-- #size-cells: should be 1 to reference the battery-backed non-volatile memory
-
-Optional child nodes:
-- see ../nvmem/nvmem.txt
-
-Example:
-
-	rtc: rtc@740 {
-		compatible = "amlogic,meson6-rtc";
-		reg = <0x740 0x14>;
-		interrupts = <GIC_SPI 72 IRQ_TYPE_EDGE_RISING>;
-		clocks = <&rtc32k_xtal>;
-		vdd-supply = <&rtc_vdd>;
-		resets = <&reset RESET_RTC>;
-
-		#address-cells = <1>;
-		#size-cells = <1>;
-	};

-- 
b4 0.10.1
