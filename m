Return-Path: <linux-rtc+bounces-1806-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2517966265
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2024 15:04:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77D001F26C73
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2024 13:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C65C1B29BE;
	Fri, 30 Aug 2024 13:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Cr829d5Z"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB45B1B2514
	for <linux-rtc@vger.kernel.org>; Fri, 30 Aug 2024 13:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725022972; cv=none; b=KEtqWgZAJQvyuh9UfWRV+L+CSe73KjTkF2qOfmsn6CVH2D1AaojR+hZJl3XFJg8LXiuGPW/RQlwXfjptGrZxzxR9K0ZdJVQImRsV/3hO+wP1czNku4ljbPUBKeSrMt5fEGTVduvnhBCgreUPii5a2MXcmp+ewPoOFk3pGPldF/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725022972; c=relaxed/simple;
	bh=Kn8JY+f5fHXbVdAysJnh2gUAir0at5VP87GfCZJ8SYE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aIV2ybunUu7/NadXH2cu7zXFQEKpV8p8IzABkgOlt9LwUlZCXeIBP/QWExsqevhb6O8MgosuCRBHoV46QesKM9CSZ/JvsIW1eqWhVHFHdDNvZ1hZkUod6YwosfV7B0l5QKNcgwimD979w9NQecrXF3m8UBBZYmwn6XsCSsLpPoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Cr829d5Z; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f3f25a1713so21070251fa.2
        for <linux-rtc@vger.kernel.org>; Fri, 30 Aug 2024 06:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725022967; x=1725627767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ukqX5sC9LJpcoIMKohkjjIWRhtJZ817S3qSAcOa4kZM=;
        b=Cr829d5Zt41qpIs9ViBHVJeEeQFYIdWlS9cKMccjC6960HVWXZ1YpyXYmf3gjnhKoN
         n/BxzTPyaXTLy4HQsZ1R6jUUnutMsGbN6GQMQApm+h5hmz0ra4nANN6akw/2OwQJKhtI
         CHgsMET93HrYX5+pX7yggpmC12uECH/RcIurf0u2NFv1pChNz5GX6eynhslWC+rklUee
         IgYtFaBOldVIrkDT369zYdeq8hq0C3wQc1doN4mY5WdDkHij441V0JWHD1hn3jL7TpIJ
         4efGq6cA6srmfYbwtvRxOwjhQECe6p12oaVrH7ZRzbrEx6oq8dKI6OWDIN2tV6wQt+BQ
         ehMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725022967; x=1725627767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ukqX5sC9LJpcoIMKohkjjIWRhtJZ817S3qSAcOa4kZM=;
        b=AvVmo1AOjtOZhrWxNEM0YAoAc+aXbM1uk4o4H2Dv+WB5WUogflTnUCiYdlBykh2Brh
         0h3Wg/TjmW5H5BXZjzxLSAGGKv0x02gt5NRfxTdiF5lW3RZbpQvO2n9liYDC0NPvRIBL
         tuf0VFC84N9493IO1pO5mbyJnvwGgKixbvnRxXk8xOR0asnqdd/R3x007Ts7fJjXXLCN
         +vS2e6q1ny7yJyXZPomMoCXn5r8KTJXrFn7a7+wJmNsT/kumBwx6JEqVcTfZlRmOwcsc
         BNdMx5of1J+O6LcKVYTkSGOyXc0Ql+oIEqXp7ZRYbtkBHL4r74lkakDG6J26pDgupQ7u
         jo7g==
X-Forwarded-Encrypted: i=1; AJvYcCWuBylm90Qs4O3ME6ydInrXl0FPXxaXY1InVgfx8EBpRmdC54SC2u669T4zJquVZChfvjr4w79TSxU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwE8Ns+1gDP9pPH08Sjt/V611IRUU4j1E1GzxzVdKouSsw9Z458
	gWkXsj0dImPEcqygXi152RGDninOv8m75COSK0hwIzZHCHXQj9iRUiPBtmc1SZM=
X-Google-Smtp-Source: AGHT+IF9cc2jwjLzI4jgE1O9TLs1SvEtqqWHN58dUrodIH74E0JWxf1LOzmgmFTE6AuLu3nFrEl8sQ==
X-Received: by 2002:a05:6512:15a0:b0:530:ac0a:15e8 with SMTP id 2adb3069b0e04-53546af3fb5mr1440203e87.11.1725022965066;
        Fri, 30 Aug 2024 06:02:45 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba642594dsm80361785e9.47.2024.08.30.06.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 06:02:44 -0700 (PDT)
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
Subject: [PATCH v3 07/12] arm64: dts: renesas: r9a08g045: Add VBATTB node
Date: Fri, 30 Aug 2024 16:02:13 +0300
Message-Id: <20240830130218.3377060-8-claudiu.beznea.uj@bp.renesas.com>
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

Add the DT node for the VBATTB IP along with DT bindings for the clock
it provides.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- dropped the child nodes of vbattb; along with this dropped ranges,
  interrupt-names, #address-cells, #size-cells
- added vbattb_xtal as input clock for vbattb

Changes in v2:
- update compatibles
- updated clocks and clock-names for clock-controller node
- removed the power domain from the clock-controller as this is
  controlled by parent node in v2

 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index 067a26a66c24..247fa80a4f53 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -160,6 +160,18 @@ i2c3: i2c@10090c00 {
 			status = "disabled";
 		};
 
+		vbattb: vbattb@1005c000 {
+			compatible = "renesas,r9a08g045-vbattb";
+			reg = <0 0x1005c000 0 0x1000>;
+			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G045_VBAT_BCLK>, <&vbattb_xtal>;
+			clock-names = "bclk", "rtx";
+			#clock-cells = <1>;
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G045_VBAT_BRESETN>;
+			status = "disabled";
+		};
+
 		cpg: clock-controller@11010000 {
 			compatible = "renesas,r9a08g045-cpg";
 			reg = <0 0x11010000 0 0x10000>;
@@ -425,4 +437,11 @@ timer {
 		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys",
 				  "hyp-virt";
 	};
+
+	vbattb_xtal: vbattb-xtal {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board. */
+		clock-frequency = <0>;
+	};
 };
-- 
2.39.2


