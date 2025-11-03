Return-Path: <linux-rtc+bounces-5243-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB91C2BA0B
	for <lists+linux-rtc@lfdr.de>; Mon, 03 Nov 2025 13:22:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 09D924F3EF8
	for <lists+linux-rtc@lfdr.de>; Mon,  3 Nov 2025 12:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06C3530AD0F;
	Mon,  3 Nov 2025 12:19:10 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C529030C347;
	Mon,  3 Nov 2025 12:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762172349; cv=none; b=QHdo8PqIUE5fO83vjlfajGL5ZPJCM/IlvJ9/S6BeLa5q60vLsU8GC7nEEC+NTtljG0f/IJKNO49tD+6uNVkyyLNxHNcCi2wGhdkwkKPjKUwzdqzHTM1fIcT0wGN0WK1u3K3Bl24jd9q+DdCKWH+sSRmOUgJR0RwA6oGr478drA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762172349; c=relaxed/simple;
	bh=B03VFnIRZkQKR6JFfSv8kZNu8YxQ6diXIuSgTrwa0ek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KAt7H9WM6NDiZtGMYefxCOwLfuTD1UU5XmkL9kyAPVtI5vJMRclPNppFw58lZ+1/s29QeENI6cD/7h+9V4SlJ/JID4Sndjh/lKbSMUvn3XyevEeAHMCD8nh6QzWCk5zqAF00Gc4dStqZT302kKG+ZiHCvVHfXX843OW61lcWCHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: 8cRCtiFKT0GwJXIgP5PnTA==
X-CSE-MsgGUID: lLUbxfvtTaayAwj/uTq0vA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 03 Nov 2025 21:19:07 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.152])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id BCB814005E33;
	Mon,  3 Nov 2025 21:19:03 +0900 (JST)
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
Subject: [PATCH v3 3/4] arm64: dts: renesas: r9a09g057: Add RTC node
Date: Mon,  3 Nov 2025 12:18:47 +0000
Message-ID: <20251103121848.6539-4-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251103121848.6539-1-ovidiu.panait.rb@renesas.com>
References: <20251103121848.6539-1-ovidiu.panait.rb@renesas.com>
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


