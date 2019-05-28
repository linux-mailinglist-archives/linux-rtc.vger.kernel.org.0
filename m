Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F0AB2D05E
	for <lists+linux-rtc@lfdr.de>; Tue, 28 May 2019 22:31:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726943AbfE1UbT (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 28 May 2019 16:31:19 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:57641 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726879AbfE1UbT (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 28 May 2019 16:31:19 -0400
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id DAADE24000A;
        Tue, 28 May 2019 20:31:12 +0000 (UTC)
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rtc@vger.kernel.org
Subject: [PATCH v2 07/11] ARM: dts: sun6i: Fix RTC node
Date:   Tue, 28 May 2019 22:30:37 +0200
Message-Id: <244929ef8dc98110bd35ebe620c5904dd0ebe2e5.1559075389.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <434446bc5541d7dfe5823874355c7db8c7e213fa.1559075389.git-series.maxime.ripard@bootlin.com>
References: <434446bc5541d7dfe5823874355c7db8c7e213fa.1559075389.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The RTC node doesn't match what is described in the binding for historical
reasons. Let's add the proper description.

Acked-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 arch/arm/boot/dts/sun6i-a31.dtsi | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi b/arch/arm/boot/dts/sun6i-a31.dtsi
index a57cbf33c12f..9361ef70dbab 100644
--- a/arch/arm/boot/dts/sun6i-a31.dtsi
+++ b/arch/arm/boot/dts/sun6i-a31.dtsi
@@ -223,7 +223,7 @@
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
 			clock-frequency = <32768>;
-			clock-output-names = "osc32k";
+			clock-output-names = "ext_osc32k";
 		};
 
 		/*
@@ -588,7 +588,7 @@
 		ccu: clock@1c20000 {
 			compatible = "allwinner,sun6i-a31-ccu";
 			reg = <0x01c20000 0x400>;
-			clocks = <&osc24M>, <&osc32k>;
+			clocks = <&osc24M>, <&rtc 0>;
 			clock-names = "hosc", "losc";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
@@ -601,7 +601,7 @@
 				     <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&ccu CLK_APB1_PIO>, <&osc24M>, <&osc32k>;
+			clocks = <&ccu CLK_APB1_PIO>, <&osc24M>, <&rtc 0>;
 			clock-names = "apb", "hosc", "losc";
 			gpio-controller;
 			interrupt-controller;
@@ -1287,10 +1287,13 @@
 		};
 
 		rtc: rtc@1f00000 {
+			#clock-cells = <1>;
 			compatible = "allwinner,sun6i-a31-rtc";
 			reg = <0x01f00000 0x54>;
 			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&osc32k>;
+			clock-output-names = "osc32k";
 		};
 
 		nmi_intc: interrupt-controller@1f00c00 {
@@ -1308,7 +1311,7 @@
 			ar100: ar100_clk {
 				compatible = "allwinner,sun6i-a31-ar100-clk";
 				#clock-cells = <0>;
-				clocks = <&osc32k>, <&osc24M>,
+				clocks = <&rtc 0>, <&osc24M>,
 					 <&ccu CLK_PLL_PERIPH>,
 					 <&ccu CLK_PLL_PERIPH>;
 				clock-output-names = "ar100";
@@ -1343,7 +1346,7 @@
 			ir_clk: ir_clk {
 				#clock-cells = <0>;
 				compatible = "allwinner,sun4i-a10-mod0-clk";
-				clocks = <&osc32k>, <&osc24M>;
+				clocks = <&rtc 0>, <&osc24M>;
 				clock-output-names = "ir";
 			};
 
@@ -1373,7 +1376,7 @@
 			reg = <0x01f02c00 0x400>;
 			interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&apb0_gates 0>, <&osc24M>, <&osc32k>;
+			clocks = <&apb0_gates 0>, <&osc24M>, <&rtc 0>;
 			clock-names = "apb", "hosc", "losc";
 			resets = <&apb0_rst 0>;
 			gpio-controller;
-- 
git-series 0.9.1
