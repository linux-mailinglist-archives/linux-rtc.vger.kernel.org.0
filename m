Return-Path: <linux-rtc+bounces-2430-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D559B8E68
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Nov 2024 11:00:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52222280CED
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Nov 2024 10:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71E1219E992;
	Fri,  1 Nov 2024 09:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="qHXvMC+Q"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E5215ECDF
	for <linux-rtc@vger.kernel.org>; Fri,  1 Nov 2024 09:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730455077; cv=none; b=SXDE4nbJabov0XLrlXBQN4LOkuM6khZhNqj/X9g4ocNsAUZlwjV68EKwuTB1aEPDB7FRgTGnsEOJoEC5icScYPFGCHPKt0g4lF9VHcgkNsvUnVM7KFv3VM5X4jg+Cdg94sdmYr59q4REnp+QKgmGcdx+LHMAEXgr3iS8Gk+Vexo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730455077; c=relaxed/simple;
	bh=pfMUh0nCTx4HqI28z1w+eIfG9KaFRT2lAZq9NXKFrTQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gog5o2OfavWH0IJmhBcGUUV7BC2ahbcD6wz4v4jQlUrosZ/+pVXrt0MRWabZ0fo0B3hWKfeONqjnEih+BOLjg8gSJ4/+G/VWv/afE249lpIgOd+ZYdlVHuDi27itXrGcLIJAyJ/Gq9B14IzJLd7KHGJLsYG+wL8fgcbGUK0UynE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=qHXvMC+Q; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a9a5f555cfbso121392566b.1
        for <linux-rtc@vger.kernel.org>; Fri, 01 Nov 2024 02:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730455074; x=1731059874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RPAiWzbcwfO/oeR5F4JHaOzCtAZr+PBDQTIr9NKTt98=;
        b=qHXvMC+QqUTqrbCnwIVLMQKxqencNzmWE8/ocVP/YfCssl6XQiNFjs94hGCYSgZkYI
         UTRVrfUpNSTzkKKlB4qBUIS8+Nmx8DEa1zB7bQTCARHMJk1kEK7wUCGf6SsXCEi5c6o3
         jznc1rBRO/lLt/161w/PF/WObBV3F3/H+Ovwi7wj21nlNVM0YZaZD/LZzUXnYHj+NpWX
         6Z1qeO+KlSSIntiAsm9M6l2/2/0jKodSOyidPZ9Fz7j5Xebh8QnbPVoxkDLtdmxxLrQi
         r4MCM86h//NWGMDD9z8TDayZ/RFRlmueQMvhcv2gVogULX2PVYgqsi4VBqONdgxgnl+T
         hrxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730455074; x=1731059874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RPAiWzbcwfO/oeR5F4JHaOzCtAZr+PBDQTIr9NKTt98=;
        b=vCNE4jqbU8CgYh5gVV0EyI7JThmu6Q9vYFXTKgjhJvRrzcTjjCSuJIUPUV4+ZoJ8xP
         thVceYplvQY4kb5/FwH27a607EuhhguWh87A2imhBqPASpQnrkNL7x9gPf52HSaqT4IF
         zbztEzCkDPVBNWLzWpni3D2WvU1A/D+saLKKEMhIoMRcv7vHXF0Qth0AzwjB0qwlzliy
         KXH0AXLgG5KGot9b9hoRJCEp22nyHxXEELpmjUWGN3Crsqq5ACA5a7uXKxVgZjPGosdN
         ma296B85v5u1gBAQ4LDUUHKnHARGJuE8hT288nYnLG993Pz0Ij9C+zrhrzxBwgBERonN
         ALcg==
X-Forwarded-Encrypted: i=1; AJvYcCW+UWPRuUmqBIV1ktv3/CY6gtTKYhuRjMlOgG7a1pVT0SU8NNRJSbKEKfebh/2sg7a92fGfpt7OZE4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJghuqcQuLruV6SrnNrbHn8kGtJuWPe4kpM5sYuvkqDh4uDKqd
	auh7AZQElnIf4VhpF+742moX3FAQdeK/eGaUl+xOpk7kv9r+Ej9+/KNBuIj4fVA=
X-Google-Smtp-Source: AGHT+IHrP9FP8fHD/OSWluh8tapezeAqFQ+YzxBMlbpTwIN/za5gGLBDUt6ZXq57lFavCwyaNAz2qw==
X-Received: by 2002:a05:6402:51ca:b0:5cb:728e:926b with SMTP id 4fb4d7f45d1cf-5ceb92a38f5mr2691588a12.17.1730455073635;
        Fri, 01 Nov 2024 02:57:53 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac7c8d87sm1364136a12.76.2024.11.01.02.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 02:57:52 -0700 (PDT)
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
Subject: [PATCH v6 7/9] arm64: dts: renesas: rzg3s-smarc-som: Enable VBATTB
Date: Fri,  1 Nov 2024 11:57:18 +0200
Message-Id: <20241101095720.2247815-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable the VBATTB controller. It provides the clock for RTC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v6:
- none

Changes in v5:
- dropped the status = "okay"; from vbattb_xtal node

Changes in v4:
- added assigned-clocks, assigned-clock-parents properties
- set vbattb_xtal status = "okay"
- collected tags

Changes in v3:
- updated patch description
- dropped vbattclk
- added renesas,vbattb-load-nanofarads on vbattb
- moved vbattb before vbattb_xtal

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 71424e69939e..30bb4f5a7dfd 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -5,6 +5,7 @@
  * Copyright (C) 2023 Renesas Electronics Corp.
  */
 
+#include <dt-bindings/clock/renesas,r9a08g045-vbattb.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
 
@@ -344,6 +345,17 @@ mux {
 	};
 };
 
+&vbattb {
+	assigned-clocks = <&vbattb VBATTB_MUX>;
+	assigned-clock-parents = <&vbattb VBATTB_XC>;
+	quartz-load-femtofarads = <12500>;
+	status = "okay";
+};
+
+&vbattb_xtal {
+	clock-frequency = <32768>;
+};
+
 &wdt0 {
 	timeout-sec = <60>;
 	status = "okay";
-- 
2.39.2


