Return-Path: <linux-rtc+bounces-1297-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B17190845C
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Jun 2024 09:20:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3987E1C2312E
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Jun 2024 07:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3864E14885D;
	Fri, 14 Jun 2024 07:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ZBMFP19c"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAA8148858
	for <linux-rtc@vger.kernel.org>; Fri, 14 Jun 2024 07:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718349596; cv=none; b=p8tmIt78rV9A/cNXnimwY6RPXV0UoHHjQqglytU6CF4XdLmJVuEPvXiiWiniQhAi0+TNRRWOk9vVpOLtWagU93f6x7yAxtYJm8fLBr+KFpnm25KOY5otkXZIcAEQGGe2Qyea1ATrGYPA2Jiuf5Jv/lIHKZfLmbB/VjHxNVYr/7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718349596; c=relaxed/simple;
	bh=UnHpqAE/7JWYsoHAOLhzOrWhsGpE0EkoI5ta7RitTbs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZnhZS2ioboAuJn30NyM+SVPVN9FigCqFWrB6GilXllk6qbD5GYCfKvuPk3j//M96tfFPV7co/MK/ZF8UJn+cb6ZSmN9WJ/teu/W02EHGT3i9qiBei8SZNJLSLA1Gm+7SM2g3RkP2HB0APod42QEOjVGAVztygZdBgNnj/Xyu+ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ZBMFP19c; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4217c7eb6b4so18118175e9.2
        for <linux-rtc@vger.kernel.org>; Fri, 14 Jun 2024 00:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1718349593; x=1718954393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0QxVauz5TNvVTL0OezLmGuAsp2A+orwd7NL8d9jK5so=;
        b=ZBMFP19cYL6u/r0z90ResCKJBrD935QzKDt97RXIk7ksAphHUW3mhwbsB7ie8IXExW
         89gxMvn+Td/017Cd3ZnJfVxJhc8Lf3czzUEEYrHzaswMjBZkVh85TF5QhOcG0CvkJ9Dg
         HPB51h0sUHu7HtCj8NZ6S3CvSrFtlGOV9gchym9B5/q8fg162TVeJgjSvxIeG+IybXFU
         SZSxbCeeIdzTHlCniKCCzW671oRi7m/GyGUkGd51N2TZpBKV6yI5htVhrdRAIe8v1lcE
         OHbOSvcGWBU7G8vbhhHP2TXDqJfg0Qjjcw7+oC27xCgBR1jdXpgh5mXfv3RWgFul9/83
         xDSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718349593; x=1718954393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0QxVauz5TNvVTL0OezLmGuAsp2A+orwd7NL8d9jK5so=;
        b=kjTe7fe4vvtACktY82klnFXvKnycKGDUEHBRYEZpkPuH0zcXVn4DY6fjbl1qINzpU0
         QTb2COmNu/rw7O310DKwQ6HrV3NJjtkAYgXHoHQ/ya3AaP9eetz6fYdmMSUCjEDW1EQw
         yeBttMQm2jqzz3fJBhuQfjVSk11v61zUFg5BuglMlcM4M4DthAA/qqU7Ms2hfJg5xoet
         XMLJaFD3IZf7UPqRv0ZBLFYsAlV68I9JahQHaD2hZ8GvTbfYYtG1JFgDqQq+r2CxOSU3
         xWx7Aboc6J90Q6r21GhC5bCSTcCNOr6GkVthFG3S34rP9Io1THBNaTXCEDO4aKjQjxqg
         aONQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCXSLHYGF9wrLNQFrNwHGYK8cHHArJ7beiFkR+8WR9E5UQouBeQkbZPPKlQF6mxRJUklTd93T3sWZnT2jl5scYPeh01HrGQRRo
X-Gm-Message-State: AOJu0Yz8M51Tw/W1TOvjKhpOi/wU6CZ/NVbMIZD2gPjtyowbUVrRY/nY
	DtFZXB1XTygbOopCOnrbmQobF+NdubsVjUTa72CVlqolrEhJymVK5U0FhvcPkUw=
X-Google-Smtp-Source: AGHT+IHfNR5m5jzi7MF01qpnq6BgN03DUzSf3nrX7ojdPohOqwLKv2aANGZR0DxpHv7c1Ds1ipc1mw==
X-Received: by 2002:a05:600c:3587:b0:422:5c5d:1b92 with SMTP id 5b1f17b1804b1-4230482272fmr17219395e9.3.1718349592694;
        Fri, 14 Jun 2024 00:19:52 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286eef9eesm87272555e9.9.2024.06.14.00.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 00:19:52 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org,
	alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 02/12] dt-bindings: clock: renesas,rzg3s-vbattb-clk: Document the VBATTB clock driver
Date: Fri, 14 Jun 2024 10:19:22 +0300
Message-Id: <20240614071932.1014067-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The VBATTB IP of the Renesas RZ/G3S SoC controls the clock that feeds
the RTC and the tamper detector. Add documentation for the VBATTB clock
driver.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 .../clock/renesas,rzg3s-vbattb-clk.yaml       | 90 +++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,rzg3s-vbattb-clk.yaml

diff --git a/Documentation/devicetree/bindings/clock/renesas,rzg3s-vbattb-clk.yaml b/Documentation/devicetree/bindings/clock/renesas,rzg3s-vbattb-clk.yaml
new file mode 100644
index 000000000000..ef52a0c0f874
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/renesas,rzg3s-vbattb-clk.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/renesas,rzg3s-vbattb-clk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas VBATTB clock
+
+maintainers:
+  - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
+
+description:
+  Renesas VBATTB module is an always on powered module (backed by battery) which
+  generates a clock (VBATTCLK). This clocks feeds the RTC and the tamper detector
+  modules.
+
+properties:
+  compatible:
+    const: renesas,rzg3s-vbattb-clk
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: VBATTB module clock
+      - description: VBATTB input xtal
+
+  clock-names:
+    items:
+      - const: bclk
+      - const: vbattb_xtal
+
+  '#clock-cells':
+    const: 0
+
+  power-domains:
+    maxItems: 1
+
+  renesas,vbattb-load-nanofarads:
+    description: load capacitance of the on board xtal
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [ 4000, 7000, 9000, 12500 ]
+
+  renesas,vbattb-osc-bypass:
+    description: set when external clock is connected to RTXOUT pin
+    type: boolean
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - power-domains
+  - '#clock-cells'
+  - renesas,vbattb-load-nanofarads
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r9a08g045-cpg.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    vbattb: vbattb@1005c000 {
+        compatible = "renesas,rzg3s-vbattb", "syscon", "simple-mfd";
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
+        status = "disabled";
+
+        vbattclk: clock-controller@1c {
+            compatible = "renesas,rzg3s-vbattb-clk";
+            reg = <0 0x1c 0 0x10>;
+            clocks = <&cpg CPG_MOD R9A08G045_VBAT_BCLK>, <&vbattb_xtal>;
+            clock-names = "bclk", "vbattb_xtal";
+            #clock-cells = <0>;
+            power-domains = <&cpg>;
+            status = "disabled";
+        };
+    };
+
+...
-- 
2.39.2


