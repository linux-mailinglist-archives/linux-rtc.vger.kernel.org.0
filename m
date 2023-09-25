Return-Path: <linux-rtc+bounces-16-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9DC7AD0FF
	for <lists+linux-rtc@lfdr.de>; Mon, 25 Sep 2023 09:03:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sy.mirrors.kernel.org (Postfix) with ESMTP id C1615B20A1C
	for <lists+linux-rtc@lfdr.de>; Mon, 25 Sep 2023 07:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E780107AA;
	Mon, 25 Sep 2023 07:03:07 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E0E1079C;
	Mon, 25 Sep 2023 07:03:05 +0000 (UTC)
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B229B8;
	Mon, 25 Sep 2023 00:03:04 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3ab3aa9ae33so3994827b6e.2;
        Mon, 25 Sep 2023 00:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695625383; x=1696230183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fpAcRisUyrskcWS9AV1ql1Z9KFMGwKdSa1ZIJWKbDtE=;
        b=FU9zrD2sq8w3Xbadp21A6j5gshEOJCAswOpX2X9XEFKkFAGTlm/9NPoQYUibwGEfzJ
         6Kqb3oPsMjhUaIFkmPbDgLNOWkOQe5PahJsQI348vCiLi52WH6WcfUMnSrVBDjZhzzH+
         qiO3e5YpRKBZQSzlJqikGFNCXyDNYd312r+M0Puc065cP1uSiHBve21Bf9yZPMihXpZj
         4Stv/hVuEYA7hw6bur3dpeQ1E33wfibHWSHZG4h57PRdp6RuD+p+TXHSgEjAZK3CkEY2
         EFKyYXA+9HOpNpGQ/9F+AxFuKWDlWlv//MikOcvbeNlrmG4WgLUKtmwJhNSskReJkWw0
         juvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695625383; x=1696230183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fpAcRisUyrskcWS9AV1ql1Z9KFMGwKdSa1ZIJWKbDtE=;
        b=D/x8sPvcecyxD/K6sL1QfBqANbvvcIrCknffMGvYMVp5CbYWKKPKGaNxo+v0HsAhgS
         DvqHt321q5qQVjhdfHq9buO7ZaCPsMRruYuSt3w90+Inq8IqrHGcI2SyVqylxaeHjHGh
         UsN9OPxLyVbyKiecG1zjSqwy1cH7NWVcwHg7KiiEynuAcw9eKDA0G62Lg/Rp+fgOZVF3
         Kn9DyTlNUCSnTIueUvWbegO5qMCuOBLqX9o4uU13IxWHk8+LqX5HTlgZ5oXNTChHliPe
         K7bCoMpFajKPi6PnDhBpWNa+hHHQef8+lNVzoh2F6WABF/Tins0y8lW+L/J+B1WIVL93
         7MJQ==
X-Gm-Message-State: AOJu0Yzo0O4/ig+FHEuY/x+tg4PhhOVPB9NjOS937XF+FFJkQAZxWdvq
	3+dha7LX97Il5yl3wCi/JaWynfMvnUU=
X-Google-Smtp-Source: AGHT+IFmYTfy6kqOkq0zc0gJ4SiSVDy8hVafMmQgbxQ6f9NUQxlyGjrsnM0kn2IvDTVMo3JG8lsY6g==
X-Received: by 2002:aca:f154:0:b0:3ad:fc3f:1202 with SMTP id p81-20020acaf154000000b003adfc3f1202mr6275365oih.53.1695625383369;
        Mon, 25 Sep 2023 00:03:03 -0700 (PDT)
Received: from a28aa0606c51.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id y5-20020a62b505000000b0068ffb8da107sm7349833pfe.212.2023.09.25.00.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 00:03:03 -0700 (PDT)
From: Jacky Huang <ychuang570808@gmail.com>
To: a.zummo@towertech.it,
	alexandre.belloni@bootlin.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	mjchen@nuvoton.com,
	schung@nuvoton.com,
	Jacky Huang <ychuang3@nuvoton.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/3] dt-bindings: rtc: Add Nuvoton ma35d1 rtc
Date: Mon, 25 Sep 2023 07:02:49 +0000
Message-Id: <20230925070251.28-2-ychuang570808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230925070251.28-1-ychuang570808@gmail.com>
References: <20230925070251.28-1-ychuang570808@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

From: Jacky Huang <ychuang3@nuvoton.com>

Add documentation describing the Nuvoton ma35d1 rtc controller.

Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/rtc/nuvoton,ma35d1-rtc.yaml      | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/nuvoton,ma35d1-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/nuvoton,ma35d1-rtc.yaml b/Documentation/devicetree/bindings/rtc/nuvoton,ma35d1-rtc.yaml
new file mode 100644
index 000000000000..5e4ade803eed
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/nuvoton,ma35d1-rtc.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/nuvoton,ma35d1-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 Real Time Clock
+
+maintainers:
+  - Min-Jen Chen <mjchen@nuvoton.com>
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,ma35d1-rtc
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
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    rtc@40410000 {
+        compatible = "nuvoton,ma35d1-rtc";
+        reg = <0x40410000 0x200>;
+        interrupts = <GIC_SPI 5 IRQ_TYPE_EDGE_RISING>;
+        clocks = <&clk RTC_GATE>;
+    };
+
+...
-- 
2.34.1


