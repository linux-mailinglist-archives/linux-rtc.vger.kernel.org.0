Return-Path: <linux-rtc+bounces-1300-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5006C90846B
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Jun 2024 09:20:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF80D2862E7
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Jun 2024 07:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 886C3184121;
	Fri, 14 Jun 2024 07:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="WR/e30Uo"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CFB1836E2
	for <linux-rtc@vger.kernel.org>; Fri, 14 Jun 2024 07:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718349601; cv=none; b=Nk3Q9AEdZj1vo8tpnsfwFoMuaQzGhQWziPm9M0Fx8Sl+t3d4w+WA6uqn6aa0DSyejbsJEydInvKpixSqasnQHFWz3lZCOQ4YiPZ93fcYM7FZLu9VBLEGVJUAq5O6id8DSt86drJR1wjHNPMPOmqnoOKQM6tgYHzvA8j/slVsJrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718349601; c=relaxed/simple;
	bh=+sPmTTkEHsi5OI2Ril+WrbrgmWyUr4giRSVYtUqk3dE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YpHOpCNCRYOnPcdj0bPhXQg4CRr9k6czMzNJf/WcW3UWpbnvK4urC1j3cNH631wF1B3uHVm3VOj6Unn4Xq7VJBJlVmWWk6uvG9ULsb30C2cQIereOh32rOWWDY91isgYpgpq/g7ki3M7Z+3ZmbqJQBw60une7rENWFeYJvhI6v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=WR/e30Uo; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4210aa00c94so17154125e9.1
        for <linux-rtc@vger.kernel.org>; Fri, 14 Jun 2024 00:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1718349598; x=1718954398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r7siOFVYUaSSVi4rSlfod3aMeNU0h2Ys5AF3R/iRB18=;
        b=WR/e30UoPB4LkcV/fFPYWW8Kz1fzER/xQY6A+PRZr5BpnEfn34+aOFVdQKWj3mrqWb
         oqNfi23Zcum6LinQ2dcmWqvfTyhbrjafNLj9n2zeUtM3/GbhxvWY+g+9Tece/XIyvkz4
         ZaZ4tWnfniZ5tMKYeTFoy4bzFOWKXQ9gp0EIK2+nB/2nnlnKNFUNqHuiCQ+KryOAtmzQ
         RFGLOAL5N0iJrCI+eeQdiLrXnIEL6nzkAG1D0SKPx2sTTySRZmZo3YEKYiwryxlv8yN+
         A15n3coWCSe2inyWlkDllT0hs34fWP/DSbQpvpN3Mpo7v1KqKbQl+AkpiNRKBhAS2fC7
         IjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718349598; x=1718954398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r7siOFVYUaSSVi4rSlfod3aMeNU0h2Ys5AF3R/iRB18=;
        b=Iq/88XnLe5OZesRqfBKSan0ViaAIjOuIbdQHw9m0ExnBux04UdBF3ogeWfI5sNtRHG
         vtHC1HJOVFcVvFpsaJxvcE1i/I7RDSlp8DYiSmzybrjfwIHYZICn0n01MzUJaqLtpGKF
         tG7Vjio33GlPel2mG14VznOejfN4k15z6dce9CtIgH/EB66Cd9ml5RqQi/AvZbImAhAS
         T9yLc0KdH+Qs85Zprk2Gx6sycvhn1BFyBdq//TQNPcswvOHJyTjgLGOImyEpyEjbPA4U
         yXuafDci3eUOjjvA2dV2u/KgsjUh5tsdMb22ST/sVo+7zkkYSTvKnZUzAO68fgmauTdO
         V2lA==
X-Forwarded-Encrypted: i=1; AJvYcCWvye+PmRxr1SJhISmMZfNZ+RoWzl+FMv8tyt7ZnDQ8uo5irZfFsgwlefOG8NmWZVdh/eUUYUUo6Y1Zys79NSNj1pDSrQVgGUfZ
X-Gm-Message-State: AOJu0YwXhW8Y4fxiQ9JbWTeW58bgp018KvH9V4U5K1Cd6LHKHbSaUHqU
	81X7FPLGj/i2UbQE6gt9v6poXrCunaeAc5Ufefyt4SrR/ctf18OzCqOvtX9Yg1E=
X-Google-Smtp-Source: AGHT+IHvJbe0MPxxmAy0Jaa+i29h6XRm4HO3GS+nYni4SEUr1oyYsazmbKlbSli1ZCLA+9ThckA7xQ==
X-Received: by 2002:a05:600c:a43:b0:421:ad:f104 with SMTP id 5b1f17b1804b1-42304827c4emr19665955e9.10.1718349598308;
        Fri, 14 Jun 2024 00:19:58 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286eef9eesm87272555e9.9.2024.06.14.00.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 00:19:57 -0700 (PDT)
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
Subject: [PATCH 05/12] dt-bindings: rtc: renesas,rzg3s-rtc: Document the Renesas RZ/G3S RTC
Date: Fri, 14 Jun 2024 10:19:25 +0300
Message-Id: <20240614071932.1014067-6-claudiu.beznea.uj@bp.renesas.com>
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

Document the RTC IP (RTCA-3) available on the Renesas RZ/G3S SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 .../bindings/rtc/renesas,rzg3s-rtc.yaml       | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/renesas,rzg3s-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/renesas,rzg3s-rtc.yaml b/Documentation/devicetree/bindings/rtc/renesas,rzg3s-rtc.yaml
new file mode 100644
index 000000000000..0e17f8a36155
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/renesas,rzg3s-rtc.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/renesas,rzg3s-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Real Time Clock for Renesas RZ/G3S SoC
+
+maintainers:
+  - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
+
+properties:
+  compatible:
+    const: renesas,rzg3s-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 3
+
+  interrupt-names:
+    items:
+      - const: alarm
+      - const: period
+      - const: carry
+
+  clocks:
+    maxItems: 1
+    description: RTC counter clock
+
+  clock-names:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    rtc: rtc@1004ec00 {
+        compatible = "renesas,rzg3s-rtc";
+        reg = <0x1004ec00 0x400>;
+        interrupts = <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "alarm", "period", "carry";
+        clocks = <&vbattclk>;
+        clock-names = "counter";
+        status = "disabled";
+    };
-- 
2.39.2


