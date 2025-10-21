Return-Path: <linux-rtc+bounces-5116-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5889EBF52C1
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Oct 2025 10:08:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CE8604FF739
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Oct 2025 08:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1B8D2EBBBC;
	Tue, 21 Oct 2025 08:07:40 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C54392EAD13;
	Tue, 21 Oct 2025 08:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761034060; cv=none; b=LR1mPOPhsA8j8Wcm4IsgLGwA/2doaCP4Ri1itsCpLTRwQwAvv92IUbEbq3YMUW6LalIiBPlTQfxpQNp1vgyTBcsS4zKkIM/oGzD60TNNFK7FOlCtI7R53GmtOmBJuUuilKbt6Iv94u+asn6cD5RmzxQBYQRs8yw5G6UXpyYCecI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761034060; c=relaxed/simple;
	bh=G+YVVs2mGjWA+BKToiF6+sDYcs5kdRAVnMridFv1SqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bHho+lMAublaIFHTFclfgoXYvEPkrODJ23bE2GU5doDrZhOGO/We2YERoRd9I869Ud2Qy4KwYuWotTp6SLJiB39XBaMCas9UYmhCP9923KpADMCDIi2zaL6cUpjIRuZYzhQA51EPBW8mIANO+bpWgLyWrr2hJUomFwneNq2Ek/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: TnTf56QnS4qdJJTyD3VM/w==
X-CSE-MsgGUID: yFO3N4saQm2YAynhfxqBMw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 21 Oct 2025 17:07:38 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.145])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id D1E514141C94;
	Tue, 21 Oct 2025 17:07:33 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: claudiu.beznea.uj@bp.renesas.com,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 5/6] arm64: dts: renesas: r9a09g057: Add RTC node
Date: Tue, 21 Oct 2025 08:07:04 +0000
Message-ID: <20251021080705.18116-6-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251021080705.18116-1-ovidiu.panait.rb@renesas.com>
References: <20251021080705.18116-1-ovidiu.panait.rb@renesas.com>
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
v2 changes:
- Added "reset-names" to RTC dts node.

 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 40b15f1db930..724c4ce95c95 100644
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
+			reset-names = "rtc", "rtc_rtest";
+			status = "disabled";
+		};
+
 		scif: serial@11c01400 {
 			compatible = "renesas,scif-r9a09g057";
 			reg = <0 0x11c01400 0 0x400>;
-- 
2.51.0


