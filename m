Return-Path: <linux-rtc+bounces-1509-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD589323EF
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Jul 2024 12:30:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CD4B1F23F3B
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Jul 2024 10:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFB01198A0B;
	Tue, 16 Jul 2024 10:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="AFYf92L/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F0C198A34
	for <linux-rtc@vger.kernel.org>; Tue, 16 Jul 2024 10:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721125841; cv=none; b=V1YyugHDWjQipKhjFprNlSgPZHIeogP/MrawSAjYbzQgdWWprB14Og9qof/mfRB+3fFzqVjPIoh0Cx4MAFcmcLgvxggwRmf/oqhQFwBEta1jAb4nFFEBAMZAJfHTL+pfCi1NLO/BIo2fMNJh6vToy3sSruqghgqujXeSjzKPzKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721125841; c=relaxed/simple;
	bh=XALYMcFdRdSgau0ca0keVz4u9zLLYQnULOra+SkwWkc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Yv3RQU/qSF6XtE+k6o+ifWJakjfo5OcHpbVSx1tHzdd579C169S4/YCAS1wsy8jk9vN9R7cdT1GpHK1qJw8JzrpNah/hjscBRf3KN+6AvdrtUcUCMovgerOIH+/8MKK3j9Kv1bD0dzjCb/N1N42qiTl53cyswKqq8ONy0dBp2UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=AFYf92L/; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4266ea6a488so41801145e9.1
        for <linux-rtc@vger.kernel.org>; Tue, 16 Jul 2024 03:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1721125837; x=1721730637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+t2iUwoBkyJVwzS5G9sIz5eBU+IKXxBFR+xf16zt+k=;
        b=AFYf92L/We7WIsJDF4FDMX2YOGt4BP6yKf73LyibHmSOvUZeioqH3KszRoubheao58
         B2ibgbsHft5IAO6Wi4qy27lQYnmn5W4o4uOTk8HQQanv7FUUdWq3f+pNgPHSb3DSAPhK
         3HTmJLIKd3zXxvj7fklPASF1yBy2Ke21Gj/3IbkqPjEjQFRc96+eBvHLSpZvAAeB4A3e
         PJjFBmLC/DiQ2+CMjD8HsfUxQDH2T+s8Nnb9LnwNh0IbikAxw2VSXoGMdR1P2rVQtHvI
         4L4YcmQA1COe+j987ASNBi2alb4al3V9Jto0xYo1r0EaolslLfedrigwjCmumQNI+cDZ
         k3tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721125837; x=1721730637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m+t2iUwoBkyJVwzS5G9sIz5eBU+IKXxBFR+xf16zt+k=;
        b=r7QD3dQwo6b+xBpF2jTKzIKwisDdYFWe9eEBT/zR1L2RBdMiBxCsSlYGdiY7HqBb3C
         g+58caWmFdQgP2AAPEEgT/wuuC/RM52JrNS5fx/wAF5aUEybBy1Ui3sd2FkmZSWYhiWV
         71TpBDpUf82bo+t9UN5fN5zVJ48lrXcv3m07/+4cT3xW/1/+JH50AjeYpAXC4FV1ctdE
         NGr3MHvkjfSH7t3TnaqPm3zzPxclguxCfG94ihYK/bIGH00RCbWy2dG1hZO9Fr8iAOPE
         L43eipfglXbFjFSTSx0u7uKvxb0I1IhfL8CXYl3Lqh/Nle/lUg8OxZmBV7h9SR0WU8e7
         tkQA==
X-Forwarded-Encrypted: i=1; AJvYcCWQMrfLAOmprpJEvJDgsqg9EeYbuoQduQXUlWRBTdzn3hms1Q5Z/S1BV+2evqU0P3QgSjHgX7YtVZJF7aeDLKD3co809ycuKBNq
X-Gm-Message-State: AOJu0YxvA5TO35uH1iOFqEjlpAe/y630AZ5kZ3OuyoT4+n/V9HnRJ62L
	LBHEoaBSLxaeBE8IV3Xw3/3UfvDwPTuflda999O81H0iM0vRuxe9XGeCqJvF1G8=
X-Google-Smtp-Source: AGHT+IHoCx27U64ppPVt17G0OQgQVeXv/aVHB8D419FiaAyPY/jxCEMgyQzJMiTajzb/yMCyNj5SZA==
X-Received: by 2002:a05:600c:4f44:b0:424:aa35:9fb9 with SMTP id 5b1f17b1804b1-427ba64ce8dmr13240765e9.2.1721125837292;
        Tue, 16 Jul 2024 03:30:37 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5e77488sm121546145e9.9.2024.07.16.03.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 03:30:36 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 01/11] dt-bindings: mfd: renesas,r9a08g045-vbattb: Document VBATTB
Date: Tue, 16 Jul 2024 13:30:15 +0300
Message-Id: <20240716103025.1198495-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240716103025.1198495-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240716103025.1198495-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The VBATTB IP of the Renesas RZ/G3S SoC controls the clock for RTC,
the tamper detector and a small general usage memory of 128B. Add
documentation for it.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- changed file name and compatible
- updated title, description sections
- added clock controller part documentation and drop dedicated file
  for it included in v1
- used items to describe interrupts, interrupt-names, clocks, clock-names,
  resets
- dropped node labels and status
- updated clock-names for clock controller to cope with the new
  logic on detecting the necessity to setup bypass

 .../mfd/renesas,r9a08g045-vbattb.yaml         | 136 ++++++++++++++++++
 1 file changed, 136 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/renesas,r9a08g045-vbattb.yaml

diff --git a/Documentation/devicetree/bindings/mfd/renesas,r9a08g045-vbattb.yaml b/Documentation/devicetree/bindings/mfd/renesas,r9a08g045-vbattb.yaml
new file mode 100644
index 000000000000..30e4da65e2f6
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/renesas,r9a08g045-vbattb.yaml
@@ -0,0 +1,136 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/renesas,r9a08g045-vbattb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas Battery Backup Function (VBATTB)
+
+description:
+  Renesas VBATTB is an always on powered module (backed by battery) which
+  controls the RTC clock (VBATTCLK), tamper detection logic and a small
+  general usage memory (128B).
+
+maintainers:
+  - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
+
+properties:
+  compatible:
+    const: renesas,r9a08g045-vbattb
+
+  reg:
+    maxItems: 1
+
+  ranges: true
+
+  interrupts:
+    items:
+      - description: tamper detector interrupt
+
+  interrupt-names:
+    items:
+      - const: tampdi
+
+  clocks:
+    items:
+      - description: VBATTB module clock
+
+  clock-names:
+    items:
+      - const: bclk
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    items:
+      - description: VBATTB module reset
+
+  '#address-cells':
+    const: 2
+
+  '#size-cells':
+    const: 2
+
+patternProperties:
+  "^clock-controller@1c+$":
+    type: object
+    description: VBATTCLK clock
+
+    properties:
+      compatible:
+        const: renesas,r9a08g045-vbattb-clk
+
+      reg:
+        maxItems: 1
+
+      clocks:
+        items:
+          - description: input clock for VBATTCLK
+
+      clock-names:
+        description: |
+          Use xin if connected to an external crystal oscillator.
+          Use clkin if connected to an external hardware device generating the
+          clock.
+        enum:
+          - xin
+          - clkin
+
+      '#clock-cells':
+        const: 0
+
+      renesas,vbattb-load-nanofarads:
+        description: load capacitance of the on board xtal
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [ 4000, 7000, 9000, 12500 ]
+
+    required:
+      - compatible
+      - reg
+      - clocks
+      - clock-names
+      - '#clock-cells'
+      - renesas,vbattb-load-nanofarads
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - power-domains
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r9a08g045-cpg.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    vbattb@1005c000 {
+        compatible = "renesas,r9a08g045-vbattb";
+        reg = <0x1005c000 0x1000>;
+        ranges = <0 0 0x1005c000 0 0x1000>;
+        interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "tampdi";
+        clocks = <&cpg CPG_MOD R9A08G045_VBAT_BCLK>;
+        clock-names = "bclk";
+        power-domains = <&cpg>;
+        resets = <&cpg R9A08G045_VBAT_BRESETN>;
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clock-controller@1c {
+            compatible = "renesas,r9a08g045-vbattb-clk";
+            reg = <0 0x1c 0 0x10>;
+            clocks = <&vbattb_xtal>;
+            clock-names = "xin";
+            #clock-cells = <0>;
+            renesas,vbattb-load-nanofarads = <12500>;
+        };
+    };
-- 
2.39.2


