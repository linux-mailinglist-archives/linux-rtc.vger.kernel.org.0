Return-Path: <linux-rtc+bounces-1803-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC2496624E
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2024 15:03:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D570F1F216E7
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2024 13:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BED571B1D70;
	Fri, 30 Aug 2024 13:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="YrQ7IOkE"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4B41B1D47
	for <linux-rtc@vger.kernel.org>; Fri, 30 Aug 2024 13:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725022965; cv=none; b=C+7f/ws3A0GWjSxQXj9CR19L9BqExbKoJOiEZ6XYAI/931gS2O6LnDTch1YiHp0l2b4BqMO58TGd7osW7OkTkV7QHuZIXCUhEaJ+s3JvgYjZLLVPvzJpqRUUd7hMI/r4jd3VoJUyP3KezPjHVqRr0qTJUWwlj8+mnbgCWrHxFPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725022965; c=relaxed/simple;
	bh=u/I15ebmxXJyi5fv6gUhrZmFRpoJGFy5N/w38hnaTiE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Wv/qMT1ilTxjWBY9jRelOEO9TmGRgumtzZajNc+rMGcVDzexl9PJNpaxF+bCcy8W0DNzzZiRhrEJLKPeM+lOL8kygxcYSprQvcMP1XR4xSMRR6VSYasW+/wCWC7+BrCz0ox20MHWZBFRUDeVJyCiH6PMkOTVsk0ZMaPCDv1fqe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=YrQ7IOkE; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53346132365so2264834e87.1
        for <linux-rtc@vger.kernel.org>; Fri, 30 Aug 2024 06:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725022961; x=1725627761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DpeiQX4Jd1MKWI0V4N5akOWI0CvHFWy28Yf195oO568=;
        b=YrQ7IOkEOKJmF85otW8HgsLNCyL4kFL4fVIqnrdIO/8k5UmoKuCRZ0ZIhpWYPmrBxV
         gqP5t/UHX6ysp4SbBItShIjadyzc9w63+bh3DuiZha8sVUCQFLM5n48rsBg5e5wKywaw
         wGUuE81AWhq1tBXyT0FqLoxiCLbfZdtKkL+j0fiBXxGgiY+2rZKCSupanSJquj1TIX1C
         SuXArAjCjvWxUZsjZ+KEk0JnjakxbgSDnmXFyI0SBsehBF6kIIwBylioVESr9h/Jeydl
         uhf2s0jnjU4P9PYnGz60/XsTOExJ56iQ78CSZ6m4nXmMjTkMv8ikGkcNqF+zvvzF86Z9
         ua1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725022961; x=1725627761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DpeiQX4Jd1MKWI0V4N5akOWI0CvHFWy28Yf195oO568=;
        b=TuzDYyCVpV0VzjH6f42KjSFfuI2f3AgfD0Gl7xeXzS7nMmtmXNv53zAWbP6/P3E6JJ
         bqRN68eSE6xxH87Op41iWvxH1m5i/E/QW7pHpGyVHAdOjBdQYyC3rx24uX2oYRZYnqNm
         b05QoevOeBtcWhuwAQEJorfMFpGNpyvWPsuJgeDsy32n0AzdjMGKSp1zE5cJU2pbVd4U
         peREaxPDQhzNyhWXTXtb/2uFlkbYJxXdTW7rTjM17xc5icNnTTf8ruH2g7ZSx5rRG0O3
         pRKWrtFF16U5JyCh2KXT7EaBZymtk/3C+EtUZuKUbvAlIeiXJQEskCz7yYCUUBTlbqHr
         rYgg==
X-Forwarded-Encrypted: i=1; AJvYcCUPvA+WbL71JlgtUXqsi8mUVUVrQyU9d71lZeRMoJzCtPyCeUCsI1HBG5u0ooYOssJQXTGaXEBQP2k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWwpslN06RCjRPVEEUUH6fXINC6WTQvmG88Ncy2dJ/0tU4bmU8
	m+UZsUJLD2WG6x5OSPs9XJ10CajRbnEK6OCR8jAucMSWJMcuaDPOLTmRbEd98YU=
X-Google-Smtp-Source: AGHT+IEWIQLtsvWqqztg1PR23TQmXh8GZ651LPqdLTXjQkWjM6VBB4/QlA6B9Gy/FjD+jLwhW9TeaQ==
X-Received: by 2002:a05:6512:3f06:b0:52c:850b:cfc6 with SMTP id 2adb3069b0e04-53546b8dc43mr1532482e87.38.1725022960589;
        Fri, 30 Aug 2024 06:02:40 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba642594dsm80361785e9.47.2024.08.30.06.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 06:02:40 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 05/12] dt-bindings: rtc: renesas,rzg3s-rtc: Document the Renesas RTCA-3 IP
Date: Fri, 30 Aug 2024 16:02:11 +0300
Message-Id: <20240830130218.3377060-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Document the RTC IP (RTCA-3) available on the Renesas RZ/G3S SoC.
The RTC IP available on Renesas RZ/V2H is almost identical with the
one found on Renesas RZ/G3S (it misses the time capture functionality
which is not yet implemented on proposed driver). For this, added also a
generic compatible that will be used at the moment as fallback for both
RZ/G3S and RZ/V2H.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- added RTC bus clock, reset and power-domain; it has been detected
  by reverse engineering that RTC and VBATTB clock, reset and power
  domain are shared; HW manual doesn't mention it
- updated example with these and with assigned-clock properties
  needed to configure the VBATTCLK MUX with proper parent
- updated example section with dt-bindings/clock/r9a08g045-cpg.h
  and dt-bindings/clock/r9a08g045-vbattb.h includes
- for all these, dropped Conor's Rb tag

Changes in v2:
- updated patch description and title
- included reference to rtc.yaml
- updated compatible list with a generic compatible as explained in
  patch description; with this the node in examples section has also been
  updated
- used items to describe interrupts, interrupt-names, clock, clock-names
- updated title section

 .../bindings/rtc/renesas,rz-rtca3.yaml        | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml

diff --git a/Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml b/Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml
new file mode 100644
index 000000000000..bc99795dfb6b
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/renesas,rz-rtca3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RTCA-3 Real Time Clock
+
+maintainers:
+  - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,r9a08g045-rtca3 # RZ/G3S
+      - const: renesas,rz-rtca3
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Alarm interrupt
+      - description: Periodic interrupt
+      - description: Carry interrupt
+
+  interrupt-names:
+    items:
+      - const: alarm
+      - const: period
+      - const: carry
+
+  clocks:
+    items:
+      - description: RTC bus clock
+      - description: RTC counter clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: counter
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    items:
+      - description: VBATTB module reset
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
+    #include <dt-bindings/clock/r9a08g045-vbattb.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    rtc@1004ec00 {
+        compatible = "renesas,r9a08g045-rtca3", "renesas,rz-rtca3";
+        reg = <0x1004ec00 0x400>;
+        interrupts = <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "alarm", "period", "carry";
+        clocks = <&cpg CPG_MOD R9A08G045_VBAT_BCLK>, <&vbattclk VBATTB_VBATTCLK>;
+        clock-names = "bus", "counter";
+        assigned-clocks = <&vbattb VBATTB_MUX>;
+        assigned-clock-parents = <&vbattb VBATTB_XC>;
+        power-domains = <&cpg>;
+        resets = <&cpg R9A08G045_VBAT_BRESETN>;
+    };
-- 
2.39.2


