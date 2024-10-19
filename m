Return-Path: <linux-rtc+bounces-2246-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B909A4C4C
	for <lists+linux-rtc@lfdr.de>; Sat, 19 Oct 2024 10:49:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D4F91C20E6B
	for <lists+linux-rtc@lfdr.de>; Sat, 19 Oct 2024 08:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 067911E0DA4;
	Sat, 19 Oct 2024 08:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ZYs2wCD9"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677A91E0B70
	for <linux-rtc@vger.kernel.org>; Sat, 19 Oct 2024 08:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729327688; cv=none; b=NSiAleF1oFe35R39QOsRe1Q4SppMYgNrBMIKYlYdchg67FG2KLxEwYf4CGqwapZlfbpQXJ3Np9bC5rUQEkXLZvq4rDBlO2J5kC257llxzfVuf3yohgJ3kDmvYTGVo2f8c1ATA7fR3a5x9Cj7JZNohzdDpeYKdCABiL4sSRgzuzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729327688; c=relaxed/simple;
	bh=7mbQShJcFfpZtsV/0O0X70LuaZZJCjkF9SKuyahgYN8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LJ7sC0ji2JHQVjhxtNOfaKWJWdUcQmQcBe5KMzd8DXpONShIvfRIWSYj0kdlEJaJij8VMoV4QshBn4K55K/ZnRt9CGmOA9U4Ecb+BY6+Ek+CXADjeEcPqTbtziy2ZVcNbCNO8XAoZNVo6lBn737OIGFhwMxXKhhN+zZnrnK33aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ZYs2wCD9; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37d63a79bb6so2134312f8f.0
        for <linux-rtc@vger.kernel.org>; Sat, 19 Oct 2024 01:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1729327685; x=1729932485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n76uaOc9JNK30gqBdGs/PkLGDzcsWgIHozNG9uixX7Y=;
        b=ZYs2wCD91F5zDk3THtLqKIm6kGVt5+cYYKijkacAKsZiHLFb8ghPItFZsXDz4hHtoG
         ISgPYpsMuYWxFAR4CuuL84RiXmlfESs5qtT5hXrF8yDTLZiHjJwmz7daOYCGGdRXSkow
         PDk1gUB7ibPPkxKa+0SvdO7h1DfINN7zP0mPRSTzrX5pNDjVJ+1SPUBVX/ugqYRdOT0n
         pcUwD+Bb9nXFYR2y6jhXyPXw+mxUpM2Jyy42uTTJtQGOfnp8hc0zGz9tX6wYVjRv9UBm
         ZVmNMlslYjR6q+hST0ESNEzkNpOKhCteYWvha5DEZs5ZB6XRu3vycgacYWuiJtH1rgL1
         Z6Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729327685; x=1729932485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n76uaOc9JNK30gqBdGs/PkLGDzcsWgIHozNG9uixX7Y=;
        b=YrQ2Qqp6DXzN4Kb0ZvsJlS+SYoCQdqhEPuBVoqphDnvnuY0ASRH49TokuwxJ6cKbGg
         gE3ww/o9Q3mz0bTtSwrkIpIxHYYI+EQfk8LYVAvAmDfRODXwDt9RizixKLcIkllZG8by
         iGadXGR0P77NQ9Sb+O1Qz+02LhRPcUr+q332gtDhv/992EqmHMzg7a3/tYG66PLo06Uw
         3QqRh/Sfv4GkiuFRHEiSD6AqQw5xVO/5jVP1q/iqT8OgYqWhdL2gJFe8PI9xyq5CYIDn
         W1lj9WuJVtF4ItHzl/GUAijGgBfAVR1BHeZFbNIQRuBcni696ndODt6T1EkBX4LCZIy8
         nxdw==
X-Forwarded-Encrypted: i=1; AJvYcCXy+kzDtHlvNR7NOYfMz4XrkoRU56d3oZYnpDNG0iuh3f5V5yul/2WZyDw73pP3qeDrp4tlZLNw31g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzalvRUBTxN/vzcCSNSoVwU2G85miIpttL33vIlCxhwXArA4j1s
	Mm8qQ9imo5EFsGdNozcLV6+KsVPaJHPe0tkSAmG0CRTK1bY8gLo9V8OWl/7TPHQ=
X-Google-Smtp-Source: AGHT+IEEpZiPiPfOC3M+a4OKPRdnozREuAvkhWiKYBAZoC4J0fDI95R1gsDCMYp599YKfb8ArETdfQ==
X-Received: by 2002:a5d:67cc:0:b0:37d:4cd6:6f2b with SMTP id ffacd0b85a97d-37eab6ec97cmr3930148f8f.14.1729327684650;
        Sat, 19 Oct 2024 01:48:04 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ecf0eccbasm3898731f8f.81.2024.10.19.01.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 01:48:04 -0700 (PDT)
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
Subject: [PATCH v4 08/12] arm64: dts: renesas: r9a08g045: Add VBATTB node
Date: Sat, 19 Oct 2024 11:47:34 +0300
Message-Id: <20241019084738.3370489-9-claudiu.beznea.uj@bp.renesas.com>
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

Add the DT node for the VBATTB IP along with DT bindings for the clock
it provides.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- used clock-controller for the vbattb node name
- move the node near scif0 for ordering
- set the vbattb_xtal status as disabled to avoid having it exported
  in linux with frequency = 0 in boards that don't use it
- collected tags

Changes in v3:
- dropped the child nodes of vbattb; along with this dropped ranges,
  interrupt-names, #address-cells, #size-cells
- added vbattb_xtal as input clock for vbattb

Changes in v2:
- update compatibles
- updated clocks and clock-names for clock-controller node
- removed the power domain from the clock-controller as this is
  controlled by parent node in v2

 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index 067a26a66c24..827db9f61802 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -72,6 +72,18 @@ scif0: serial@1004b800 {
 			status = "disabled";
 		};
 
+		vbattb: clock-controller@1005c000 {
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
 		i2c0: i2c@10090000 {
 			compatible = "renesas,riic-r9a08g045", "renesas,riic-r9a09g057";
 			reg = <0 0x10090000 0 0x400>;
@@ -425,4 +437,12 @@ timer {
 		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys",
 				  "hyp-virt";
 	};
+
+	vbattb_xtal: vbattb-xtal {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board. */
+		clock-frequency = <0>;
+		status = "disabled";
+	};
 };
-- 
2.39.2


