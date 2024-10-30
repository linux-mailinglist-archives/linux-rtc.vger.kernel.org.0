Return-Path: <linux-rtc+bounces-2372-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B659B60D0
	for <lists+linux-rtc@lfdr.de>; Wed, 30 Oct 2024 12:02:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 829C9281B59
	for <lists+linux-rtc@lfdr.de>; Wed, 30 Oct 2024 11:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B71E1E6DD5;
	Wed, 30 Oct 2024 11:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="fdW2T6ug"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D591E5000
	for <linux-rtc@vger.kernel.org>; Wed, 30 Oct 2024 11:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730286108; cv=none; b=W1l3gjhPQO/vkNacCFz5e1zAcBlbsKpNGj5jKNGupuHovOjf8zje+YwiJcBKrBbkUErvsEYp7G/6aRrTVB/FPjmBd9YZN0jcgTa56EzIhmct0xX0EknD11ONfYN+P++lOitYgls0zKrINsRsqd3EKiMYSKsFmOrHniTHQiTrLGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730286108; c=relaxed/simple;
	bh=GzhYOIOjWWWkcnxKv/+WunfUEbU6v0yAgqFMhuJW65E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FhUeLiybIqgzjgm4odKLTd5NuTWQPQH46O1JCzTFngK0knnndIoLAOMpF1UZtzm5ThxxMtdHTuu+qGB+ee63mo7byLUhTo6adFeokVfu/knIW7RUWJFRE87ystoa9DNxazK7dRR6Yt5laAxJbpOwG7S06x4+jTSLQVPlQ0z/hsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=fdW2T6ug; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4314c4cb752so62070365e9.2
        for <linux-rtc@vger.kernel.org>; Wed, 30 Oct 2024 04:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730286104; x=1730890904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C4QBNlB+d2PHxk6dWy4yzXj/lD/DoVJIDKguatDDGb4=;
        b=fdW2T6ugKpHYeb2S0hhZkw47wyu0c4aIb6hYbyV6anYa0nKhycayNVZxCWZk/fRLXU
         k+YHx7OHGajDh8VVBXsbGDGyRP2SuSHYp92Ym9XtCQYou5RhIJPuqXlITDnKUXlsvyBj
         ZOKN5Meg5jeqjD73g1ASPLG59ssYINR4gpzlnHcl//TYvkTuwyaFSWmplBErPOM6hvFz
         aeZrHIo+7lytEhRtqO8+KThOksuVUx+b3ex6RpZOuwrOPRPt9sh8mDrTcK6zDx70UtYk
         oAfZiJ7VaB7VOk418Qb6EELKespsE5kv7LhHqh6TpRbg037silXd3PD0gURMjEQO0s0P
         EBjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730286104; x=1730890904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C4QBNlB+d2PHxk6dWy4yzXj/lD/DoVJIDKguatDDGb4=;
        b=IcakwLxXtodGF3pYv7drL2APWb/5JuvxBViB/ptO5lNcW1doRNZTDYM5aYvtqYhPrZ
         fQe2l3rZH3YtNYcPfjGNfIL8Kx9uMoeCQwn2qc03cGgol6A7ztaoYOJSoQucUGl4TFN8
         +E5E0XlELdfxfd2yIEo5H/7hayJ3TqGOS5Sf+E7cT9hy2c+XohFZIvoDM0/oQqZuAZN9
         S2Oue5TyMQ+eT9YMg8zflHYjyv4T9JvZ/pwboTEeKrOzt8p6s1IZCat/7DBUu6YWCiMi
         3FHoHFgDofVfpSaQO4qPdaHMmuU8CefxnHcoOMdFy0QaWoTcUc1nFrDF/Tce4owRX34F
         4cVA==
X-Forwarded-Encrypted: i=1; AJvYcCWqkGJi9Bb4jkJYSpTrToeWkhb/X/3gwVbhuLOTS8meuikNj99VHbghbgIkqBfCLtGsY3hWNmu+H2c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrbY7UOG1bpppmr3EH4e9bpWkuzGtE3eg2Y2STBOdtXnI3wSWP
	ZQMWiYPvM8OeSKEz/UbKsje7C1fsI8cgo+MIWCdEkpYxmN4M2/C2m6VtPq1SFV0=
X-Google-Smtp-Source: AGHT+IH0M773hGU4oya6J/fuA+HUQZaFJdAlea6vN77xZ1FRNiRTnlZxHceEr+4/h6lEyss2Uuvwjw==
X-Received: by 2002:a05:600c:1ca6:b0:431:52da:9d67 with SMTP id 5b1f17b1804b1-4319ac7435bmr135949865e9.3.1730286103671;
        Wed, 30 Oct 2024 04:01:43 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd99edebsm17956935e9.45.2024.10.30.04.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 04:01:43 -0700 (PDT)
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
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v5 04/10] dt-bindings: rtc: renesas,rzg3s-rtc: Document the Renesas RTCA-3 IP
Date: Wed, 30 Oct 2024 13:01:14 +0200
Message-Id: <20241030110120.332802-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- added back the #include <dt-bindings/clock/renesas,r9a08g045-vbattb.h>
  in example section to fix the build error
- kept the Rb tag from Rob; Rob, please let me know if you consider it
  otherwise

Changes in v4:
- collected tags
- dropped the assigned-clocks, assigned-clock-parents properties from the
  example, along with r9a08g045-vbattb.h inclusion; these were moved
  to the VBATTB example as it fits better in there since these are
  related to the VBATTB but not to the RTC;

  Rob, I haven't dropped your Rb tag for this; please let me know if you
  consider it otherwise.

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

 .../bindings/rtc/renesas,rz-rtca3.yaml        | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml

diff --git a/Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml b/Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml
new file mode 100644
index 000000000000..e70eeb66aa64
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml
@@ -0,0 +1,84 @@
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
+    #include <dt-bindings/clock/renesas,r9a08g045-vbattb.h>
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
+        power-domains = <&cpg>;
+        resets = <&cpg R9A08G045_VBAT_BRESETN>;
+    };
-- 
2.39.2


