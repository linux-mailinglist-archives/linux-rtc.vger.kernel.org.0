Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15C6C96410
	for <lists+linux-rtc@lfdr.de>; Tue, 20 Aug 2019 17:19:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730449AbfHTPTi (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 20 Aug 2019 11:19:38 -0400
Received: from vps.xff.cz ([195.181.215.36]:32850 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730430AbfHTPTi (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 20 Aug 2019 11:19:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1566314376; bh=P46Ks+pSwFh8evjNR4bT2iq74D9QpPdX+LOP4bcJrNU=;
        h=From:To:Cc:Subject:Date:References:From;
        b=S0zEwvsraRLL0ynpgWwffXnzhAvK37c2ssuZ1jfScVV5/W/7DvdbJ9nEYAiW5Fpbe
         yNcm7wJWYtw9eK2ZU69+TU6nxJ6YCFBmeEEJuBU03A2Kx2uWma0OiQ0ib2NGHf6YwM
         PkDZleYTPeFKpkCHOkfBo3lLRsf/s/t7kmrQyt6w=
From:   megous@megous.com
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     Ondrej Jirman <megous@megous.com>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: [PATCH v2 3/3] arm64: dts: sun50i-h6: Add support for RTC and fix the clock tree
Date:   Tue, 20 Aug 2019 17:19:34 +0200
Message-Id: <20190820151934.3860-4-megous@megous.com>
In-Reply-To: <20190820151934.3860-1-megous@megous.com>
References: <20190820151934.3860-1-megous@megous.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Ondrej Jirman <megous@megous.com>

This patch adds RTC node and fixes the clock properties and nodes
to reflect the real clock tree.

The device nodes for the internal oscillator and osc32k are removed,
as these clocks are now provided by the RTC device. Clock references
are fixed accordingly, too.

Signed-off-by: Ondrej Jirman <megous@megous.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 30 +++++++++++---------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index 67b732e34091..67f920e0fc33 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -56,14 +56,6 @@
 		status = "disabled";
 	};
 
-	iosc: internal-osc-clk {
-		#clock-cells = <0>;
-		compatible = "fixed-clock";
-		clock-frequency = <16000000>;
-		clock-accuracy = <300000000>;
-		clock-output-names = "iosc";
-	};
-
 	osc24M: osc24M_clk {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
@@ -71,11 +63,11 @@
 		clock-output-names = "osc24M";
 	};
 
-	osc32k: osc32k_clk {
+	ext_osc32k: ext_osc32k_clk {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
 		clock-frequency = <32768>;
-		clock-output-names = "osc32k";
+		clock-output-names = "ext_osc32k";
 	};
 
 	psci {
@@ -197,7 +189,7 @@
 		ccu: clock@3001000 {
 			compatible = "allwinner,sun50i-h6-ccu";
 			reg = <0x03001000 0x1000>;
-			clocks = <&osc24M>, <&osc32k>, <&iosc>;
+			clocks = <&osc24M>, <&rtc 0>, <&rtc 2>;
 			clock-names = "hosc", "losc", "iosc";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
@@ -236,7 +228,7 @@
 				     <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&ccu CLK_APB1>, <&osc24M>, <&osc32k>;
+			clocks = <&ccu CLK_APB1>, <&osc24M>, <&rtc 0>;
 			clock-names = "apb", "hosc", "losc";
 			gpio-controller;
 			#gpio-cells = <3>;
@@ -710,10 +702,20 @@
 			};
 		};
 
+		rtc: rtc@7000000 {
+			compatible = "allwinner,sun50i-h6-rtc";
+			reg = <0x07000000 0x400>;
+			interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
+			clock-output-names = "osc32k", "osc32k-out", "iosc";
+			clocks = <&ext_osc32k>;
+			#clock-cells = <1>;
+		};
+
 		r_ccu: clock@7010000 {
 			compatible = "allwinner,sun50i-h6-r-ccu";
 			reg = <0x07010000 0x400>;
-			clocks = <&osc24M>, <&osc32k>, <&iosc>,
+			clocks = <&osc24M>, <&rtc 0>, <&rtc 2>,
 				 <&ccu CLK_PLL_PERIPH0>;
 			clock-names = "hosc", "losc", "iosc", "pll-periph";
 			#clock-cells = <1>;
@@ -741,7 +743,7 @@
 			reg = <0x07022000 0x400>;
 			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&r_ccu CLK_R_APB1>, <&osc24M>, <&osc32k>;
+			clocks = <&r_ccu CLK_R_APB1>, <&osc24M>, <&rtc 0>;
 			clock-names = "apb", "hosc", "losc";
 			gpio-controller;
 			#gpio-cells = <3>;
-- 
2.22.1

