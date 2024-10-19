Return-Path: <linux-rtc+bounces-2247-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEED9A4C51
	for <lists+linux-rtc@lfdr.de>; Sat, 19 Oct 2024 10:49:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDCF91C219C7
	for <lists+linux-rtc@lfdr.de>; Sat, 19 Oct 2024 08:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 131831E0DCC;
	Sat, 19 Oct 2024 08:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="j2iDIc13"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B341E0B98
	for <linux-rtc@vger.kernel.org>; Sat, 19 Oct 2024 08:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729327690; cv=none; b=j/NhNH5ZN65nD8w+xYtJzWyQq232Gi6b085E1qH1D4O/Gp0KdXcnD8IxYjsZ81dAee0aod5e8GWjCw+XAXlZrO0OnD8XOM956B/GHDfT1NFCDxSW4RHgeSJuapf5yoCR01l+zTo2qNnAOMUJY3tFUc3jtHnjR7fn/sjqXQAEeaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729327690; c=relaxed/simple;
	bh=Ha46VISo5j+n6oH6t+bD4vfPcsfLlPK/URPraxBG2N4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J8nahx0RqAMaSj1cuReDBUFve6iob8oIXhLxzOxLP1F5ZRZWUUOj2VHl/FdIqPTXUxyotJo/xmxJEmz/cNErpCSZ5XUHsfQuCluGLad1FwgStOYsAy+mpCBn8WbxV+G1wIuU1VQnxQwX3GbG2CvzVdAR5eFwI6gA+MpJTHOCiNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=j2iDIc13; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37d51055097so2012418f8f.3
        for <linux-rtc@vger.kernel.org>; Sat, 19 Oct 2024 01:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1729327687; x=1729932487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ptzp2AGtDmlh4y6yStaA1mKsAkuInOqVi2zvAlMIYfQ=;
        b=j2iDIc13fazwNSYhaOCF+U5I9BkNm9YHSnx2D1CHd+Df7gO/G7Ok825SaKHaO+j+kg
         SkHiYuW0+OcaOdTXhFGuPD9hx/nbVRlBlDIwsVk4ZrcKm8sCeuvQ1TJDWonueltM+YWJ
         m9d7bDwDUjhdZ7j6b9wzLW491s99cEYqyl+CiKCpBz1ynSjq7UCVo2HlaBMWg7BlH4Mb
         4r7pQf+zxnUGOdEoGX6Q8KpWn8TZbzciAKMUZM5h8FLVLDCFoemVSEHeZYxUFSAAd1i+
         DtRs5RB++CAsymR8E8kzxG9Mzp2vj0GBbMV7bnvD5ZuQLxtqmbzbLu5t8rNyDQ4EKYVO
         m3Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729327687; x=1729932487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ptzp2AGtDmlh4y6yStaA1mKsAkuInOqVi2zvAlMIYfQ=;
        b=dPTifG6MaO5HigWqhMpquyX+tFXhSj6jEFOaBg9I2U+O0Jq88CBnnJqd4tg8VUmZ9K
         QTyo1MxvfHVadeF0z7zIoxpCIW3Gu2zt7GNr8OISgvT/9WbxCRCjoeJ4XvylnQUE313P
         Gb7uLDq8fw9fLHxhOmu5jXPEUeVWy6uzPPatLHY1GvtUKmOJYSRIzLSc89oEktguZzZs
         ynyfM5HMEiZB4b1i1vszcW1DL+WIyq6EOmLp7b6CLGlQaUyidcDUr5KLW0VOjP3tCHWo
         CGYVRXjO3pjbJpTWcu9EedD0k5E457BML7TvTgK9VofvIEgARwtbfK1zDyBUZlaF033l
         JaGg==
X-Forwarded-Encrypted: i=1; AJvYcCVZMPJ5cIQL/a/1R3ZbI2RWwOR5bgfNHm0ooygN+tq3NkFb8KnCY2/7te0fqRoowswPvFCvE3bTtfs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXYnUiDLGhUCewm1r2dJKjchBuWbDK1m+JdhExS8Hkz34OxKVx
	Yr24loW53alKyOHIyNTsa/dvRzt1WkhgZcXDvnvZXTskColaGx9DbAg7PKQG91w=
X-Google-Smtp-Source: AGHT+IGbEO57QVxQnowfYpKy9hDCCPJFLMCxr57/LQT6YuDTh7tb4JJuV+/9WkjzM5dKYZ890WhRRQ==
X-Received: by 2002:a5d:6a8e:0:b0:37d:4e80:516 with SMTP id ffacd0b85a97d-37ea21a215dmr3401480f8f.34.1729327686755;
        Sat, 19 Oct 2024 01:48:06 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ecf0eccbasm3898731f8f.81.2024.10.19.01.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 01:48:06 -0700 (PDT)
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
Subject: [PATCH v4 09/12] arm64: dts: renesas: r9a08g045: Add RTC node
Date: Sat, 19 Oct 2024 11:47:35 +0300
Message-Id: <20241019084738.3370489-10-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241019084738.3370489-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241019084738.3370489-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add the DT node for the RTC IP available on the Renesas RZ/G3S SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- dropped the assigned-clocks, assigned-clock-parents properties as they
  fit better on vbattb node
- moved the RTC close to serial node for ordering

Changes in v3:
- added CPG clock, power domain, reset
- and assigned-clocks, assigned-clock-parents to configure the
  VBATTCLK
- included dt-bindings/clock/r9a08g045-vbattb.h

Changes in v2:
- updated compatibles

 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index 827db9f61802..14e105de2f08 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/r9a08g045-cpg.h>
+#include <dt-bindings/clock/renesas,r9a08g045-vbattb.h>
 
 / {
 	compatible = "renesas,r9a08g045";
@@ -72,6 +73,20 @@ scif0: serial@1004b800 {
 			status = "disabled";
 		};
 
+		rtc: rtc@1004ec00 {
+			compatible = "renesas,r9a08g045-rtca3", "renesas,rz-rtca3";
+			reg = <0 0x1004ec00 0 0x400>;
+			interrupts = <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "alarm", "period", "carry";
+			clocks = <&cpg CPG_MOD R9A08G045_VBAT_BCLK>, <&vbattb VBATTB_VBATTCLK>;
+			clock-names = "bus", "counter";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G045_VBAT_BRESETN>;
+			status = "disabled";
+		};
+
 		vbattb: clock-controller@1005c000 {
 			compatible = "renesas,r9a08g045-vbattb";
 			reg = <0 0x1005c000 0 0x1000>;
-- 
2.39.2


