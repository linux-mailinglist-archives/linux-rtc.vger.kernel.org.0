Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA59972E391
	for <lists+linux-rtc@lfdr.de>; Tue, 13 Jun 2023 15:01:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242474AbjFMNBK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 13 Jun 2023 09:01:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242367AbjFMNBI (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 13 Jun 2023 09:01:08 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79F451734
        for <linux-rtc@vger.kernel.org>; Tue, 13 Jun 2023 06:01:05 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4f640e48bc3so6699498e87.2
        for <linux-rtc@vger.kernel.org>; Tue, 13 Jun 2023 06:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1686661264; x=1689253264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xJuMWym61lAEVxXUiTue+H/o7LcrO2jH0iNPvdmqYU=;
        b=LZ554JGK/zXIUQdGLcTIlzX3rHyujMe7o5jnsteRYfwba1zjXfbIijsAxJUTqfVdi6
         LkYCRuULWSMbRWUw9Ba0J9CeyUj8cDhtVmPI3As/dDfgqrfLqBmetoUrRVNcUb1RtLpG
         /uiAbehGWTIUscnTWW3bRyT7vhE+Eos+jxBm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686661264; x=1689253264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+xJuMWym61lAEVxXUiTue+H/o7LcrO2jH0iNPvdmqYU=;
        b=Pb5kOl6IiUWGXyGijs2tJo6tBBKznkXQwzdqcwDcaSymp/wrUhmybyouzsGstwxAYN
         KmiBPoXGuPz7gJ0HHOTcm9cMyn6b/3TSTDlUyjcq82ivosWvolLkLcMfI1JN+LXjnR4V
         5QjaoJkCW2HkgXLrLQxNFIlR3o0IY3kexgqkj4Dtqb9FQQFXDQh9i9nqKjOOz9V8uj2e
         ENKqAQ7bdzR1DBR3Q9obdtZ1DwPsMZFK8zY0gZ9dSPKSs8c5QUonnP3MnKPUMTgOHKxc
         iJ8cP2Yfty+oT8SwVEMNi8ZQQPdMwojGgbXihmxy75Ss6DzCGNqym/WKZnTnw0LPE4nd
         l+ow==
X-Gm-Message-State: AC+VfDw+33JZuzA3/jZO8tG/tbFm8k0F5GKlfHxRxkqxIDU/pEZVvezR
        RhTju1i2NqRw4MpN46UH9fwV1U02GtMTNWsVLEI//Q==
X-Google-Smtp-Source: ACHHUZ7tCa0q1BAkEP3y2uWu1//37M6R75CuHHWbDdaW0T2zY7TFjMq1RkFvolTE0S2Qe6AkLZjCmw==
X-Received: by 2002:a05:6512:3130:b0:4ef:eda6:c14 with SMTP id p16-20020a056512313000b004efeda60c14mr6073313lfd.35.1686661263750;
        Tue, 13 Jun 2023 06:01:03 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id u24-20020ac243d8000000b004f14ae5ded8sm1793786lfl.28.2023.06.13.06.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 06:01:03 -0700 (PDT)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/8] dt-bindings: rtc: Move isil,isl12022 from trivial-rtc.yaml into own schema file
Date:   Tue, 13 Jun 2023 15:00:04 +0200
Message-Id: <20230613130011.305589-3-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230613130011.305589-1-linux@rasmusvillemoes.dk>
References: <20230612113059.247275-1-linux@rasmusvillemoes.dk>
 <20230613130011.305589-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Move the isil,isl12022 RTC bindings from trivial-rtc.yaml into its own
intersil,isl12022.yaml file, in preparation for adding more bindings.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 .../bindings/rtc/intersil,isl12022.yaml       | 45 +++++++++++++++++++
 .../devicetree/bindings/rtc/trivial-rtc.yaml  |  2 -
 2 files changed, 45 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/intersil,isl12022.yaml

diff --git a/Documentation/devicetree/bindings/rtc/intersil,isl12022.yaml b/Documentation/devicetree/bindings/rtc/intersil,isl12022.yaml
new file mode 100644
index 000000000000..7c1e638d657a
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/intersil,isl12022.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/intersil,isl12022.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Intersil ISL12022 Real-time Clock
+
+maintainers:
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    const: isil,isl12022
+
+  reg:
+    maxItems: 1
+
+  interrupts:
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
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        rtc@6f {
+            compatible = "isil,isl12022";
+            reg = <0x6f>;
+            interrupts-extended = <&gpio1 5 IRQ_TYPE_LEVEL_LOW>;
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
index a3603e638c37..b062c64266a6 100644
--- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
@@ -45,8 +45,6 @@ properties:
       - isil,isl1208
       # Intersil ISL1218 Low Power RTC with Battery Backed SRAM
       - isil,isl1218
-      # Intersil ISL12022 Real-time Clock
-      - isil,isl12022
       # Loongson-2K Socs/LS7A bridge Real-time Clock
       - loongson,ls2x-rtc
       # Real Time Clock Module with I2C-Bus
-- 
2.37.2

