Return-Path: <linux-rtc+bounces-5295-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 935F5C41BF2
	for <lists+linux-rtc@lfdr.de>; Fri, 07 Nov 2025 22:13:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30F47562B97
	for <lists+linux-rtc@lfdr.de>; Fri,  7 Nov 2025 21:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E76534DB44;
	Fri,  7 Nov 2025 21:07:27 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2574134D929;
	Fri,  7 Nov 2025 21:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762549647; cv=none; b=emVDFX+75gIGlN/hO6zy0d5uucQVeQ1pZzVq1UF39TD3jGDqgYsaFc0nxcrg+nNfqr8PY+N7d3t9OlkIb3rJupwatkPTu0jGut8FtrXGeyPSSMyZWzFUVTYaqkzE5q8GFw2UB9YjDs9Z6aOHgOy8wvn/7PR3h81j6Hb+6m0HiLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762549647; c=relaxed/simple;
	bh=LEDVcd7JTeayJk+3CzFwOxmhOV3RAAW/LzZ5Uk9r8Xk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=swOhDiqC1pwin0tMm/IDVxfSGyekRVioPzX7+60QKJTg05ZnA0u/kIkcBmu539sa+HTqBkxfMYre4YGBAxpQqQMN0OlI27tS1jFAyLwggrL+4ee6/CEyNAcnh27n5J6h62vWYpKpsWSqf6Vl7NC0F2fuE+nUO2PJvl9DeoAcTy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: HB38IexoTFiowME1IgeGuA==
X-CSE-MsgGUID: z0uXwFi4Rd6QgW5Qd7CHmg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 08 Nov 2025 06:07:24 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.93.123])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1ACB14007D1A;
	Sat,  8 Nov 2025 06:07:20 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: claudiu.beznea.uj@bp.renesas.com,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/4] arm64: dts: renesas: r9a09g057: Add RTC node
Date: Fri,  7 Nov 2025 21:07:05 +0000
Message-ID: <20251107210706.45044-4-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251107210706.45044-1-ovidiu.panait.rb@renesas.com>
References: <20251107210706.45044-1-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add RTC node to Renesas RZ/V2H ("R9A09G057") SoC DTSI.

Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 40b15f1db930..8aad46c367ae 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -591,6 +591,21 @@ wdt3: watchdog@13000400 {
 			status = "disabled";
 		};
 
+		rtc: rtc@11c00800 {
+			compatible = "renesas,r9a09g057-rtca3", "renesas,rz-rtca3";
+			reg = <0 0x11c00800 0 0x400>;
+			interrupts = <GIC_SPI 524 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 525 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 526 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "alarm", "period", "carry";
+			clocks = <&cpg CPG_MOD 0x53>, <&rtxin_clk>;
+			clock-names = "bus", "counter";
+			power-domains = <&cpg>;
+			resets = <&cpg 0x79>, <&cpg 0x7a>;
+			reset-names = "rtc", "rtest";
+			status = "disabled";
+		};
+
 		scif: serial@11c01400 {
 			compatible = "renesas,scif-r9a09g057";
 			reg = <0 0x11c01400 0 0x400>;
-- 
2.51.0


