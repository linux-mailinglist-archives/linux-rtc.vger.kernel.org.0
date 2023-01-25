Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA7C567BFF1
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Jan 2023 23:29:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236307AbjAYW3C (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 25 Jan 2023 17:29:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234668AbjAYW3B (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 25 Jan 2023 17:29:01 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B34F60CA1;
        Wed, 25 Jan 2023 14:28:48 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id y19so298585edc.2;
        Wed, 25 Jan 2023 14:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SknBnpJKa9Le9Ohn9Af3FhBYcCoixgyHtGZJrle29Mk=;
        b=BMeY2H1SnnytoFvIB2srqelouqpuy0uyMXWk7FXrOEoOjRW2PKZnNM3y5qTgPaZv/Z
         kOh4aVcU9bUwP8VC+7zepandHCecvhrh6ljiIRDqLlf+zDly2gwUapfvCarEEn6nFQ4x
         9aYQSlWWBHbByY1U1ij31MGlwJ8XNJMGyBIkZz4SGXu0WF6kCW+6AywVngtYhILFzMzx
         Up6vqe+DKosm0oqjHUPXIcQhYDWXyUPYuB3NK4R511oRem4Wosh021bZT45V4Dq/De8C
         xaNB6/QirxI8HpSqf/oM/9jeZMcPGuG1nE1hkorH5OOJl83hKTikJV5w/QnYeMyf7aJS
         e6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SknBnpJKa9Le9Ohn9Af3FhBYcCoixgyHtGZJrle29Mk=;
        b=RtR1YKnb5vhbDfBRTWq5iakYOtxlqAtG+bUy6TQxLTUX0qUrz1c/0LtMgwyYsutO2Y
         YO14ka0qrd8WGAul2a0+a5ZqjTRycA15MmSwW95URFbCVzeRht/wUUFTv6A7oBJNud6B
         DO7FTCcTa6ES48ckmmgiFklwZBM7nuFwS3SpWQm9PbO1KN8EI0ZXhA+gVZB6mGgXNouB
         8FTM4v6gDn+qro2ha7ChDd6uTIaeVZ56Bzw8LcuZzczlPbux4z+IIHEKNdR7s+73hD4D
         E5qSIpqmItb8vEaRBMTVBZVNVuc8SDQnhvxg2XMVtVsC7CHeQK4J/5sIKLlikcJd7AN3
         nU2A==
X-Gm-Message-State: AFqh2kpF2yiVBMINHE1cg7yoSx6FOs+/lnTKheyMxnzlyOlL2+O/yGWF
        E+i29Ir17m3fdDZeORsR8Dw=
X-Google-Smtp-Source: AMrXdXtVNwIZ/OnkeKeiaUswnp8VEO04Z8vkoe1lxyyoTajb75PHr6b6G1JW46m7LrDgU36GFXWXfg==
X-Received: by 2002:a05:6402:1f13:b0:49b:cf25:152d with SMTP id b19-20020a0564021f1300b0049bcf25152dmr32007759edb.24.1674685726784;
        Wed, 25 Jan 2023 14:28:46 -0800 (PST)
Received: from ?IPV6:2a01:c22:720f:5a00:b1aa:59d6:6587:3051? (dynamic-2a01-0c22-720f-5a00-b1aa-59d6-6587-3051.c22.pool.telefonica.de. [2a01:c22:720f:5a00:b1aa:59d6:6587:3051])
        by smtp.googlemail.com with ESMTPSA id u10-20020aa7db8a000000b00487b73912c2sm2891416edt.12.2023.01.25.14.28.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 14:28:46 -0800 (PST)
Message-ID: <d820d54b-d082-589a-621f-2795d885696a@gmail.com>
Date:   Wed, 25 Jan 2023 23:24:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2] dt-bindings: rtc: Convert Amlogic Meson vrtc controller
 binding
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        linux-rtc@vger.kernel.org
References: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
Content-Language: en-US
In-Reply-To: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Convert Amlogic Meson vrtc controller binding to yaml.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- improve title and commit message
- remove bus part from example
---
 .../bindings/rtc/amlogic,meson-vrtc.yaml      | 44 +++++++++++++++++++
 .../bindings/rtc/rtc-meson-vrtc.txt           | 22 ----------
 2 files changed, 44 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/amlogic,meson-vrtc.yaml
 delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-meson-vrtc.txt

diff --git a/Documentation/devicetree/bindings/rtc/amlogic,meson-vrtc.yaml b/Documentation/devicetree/bindings/rtc/amlogic,meson-vrtc.yaml
new file mode 100644
index 000000000..a89865fa6
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/amlogic,meson-vrtc.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/amlogic,meson-vrtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Virtual RTC (VRTC)
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+description: |
+  This is a Linux interface to an RTC managed by firmware, hence it's
+  virtual from a Linux perspective.  The interface is 1 register where
+  an alarm time (in seconds) is to be written.
+  The alarm register is a simple scratch register shared between the
+  application processors (AP) and the secure co-processor (SCP.)  When
+  the AP suspends, the SCP will use the value of this register to
+  program an always-on timer before going sleep. When the timer expires,
+  the SCP will wake up and will then wake the AP.
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    enum:
+      - amlogic,meson-vrtc
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    rtc@a8 {
+      compatible = "amlogic,meson-vrtc";
+      reg = <0x000a8 0x4>;
+    };
diff --git a/Documentation/devicetree/bindings/rtc/rtc-meson-vrtc.txt b/Documentation/devicetree/bindings/rtc/rtc-meson-vrtc.txt
deleted file mode 100644
index c014f54a9..000000000
--- a/Documentation/devicetree/bindings/rtc/rtc-meson-vrtc.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-* Amlogic Virtual RTC (VRTC)
-
-This is a Linux interface to an RTC managed by firmware, hence it's
-virtual from a Linux perspective.  The interface is 1 register where
-an alarm time (in seconds) is to be written.
-
-Required properties:
-- compatible: should be "amlogic,meson-vrtc"
-- reg: physical address for the alarm register
-
-The alarm register is a simple scratch register shared between the
-application processors (AP) and the secure co-processor (SCP.)  When
-the AP suspends, the SCP will use the value of this register to
-program an always-on timer before going sleep. When the timer expires,
-the SCP will wake up and will then wake the AP.
-
-Example:
-
-	vrtc: rtc@0a8 {
-		compatible = "amlogic,meson-vrtc";
-		reg = <0x0 0x000a8 0x0 0x4>;
-	};
-- 
2.39.1


