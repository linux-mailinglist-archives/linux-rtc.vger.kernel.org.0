Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89B082B3E0
	for <lists+linux-rtc@lfdr.de>; Mon, 27 May 2019 14:01:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbfE0MBG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 27 May 2019 08:01:06 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:47197 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbfE0MBG (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 27 May 2019 08:01:06 -0400
Received: from localhost (aaubervilliers-681-1-27-134.w90-88.abo.wanadoo.fr [90.88.147.134])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id BCC6024000B;
        Mon, 27 May 2019 12:01:02 +0000 (UTC)
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rtc@vger.kernel.org
Subject: [PATCH 09/10] ARM: dts: sun8i: v3s: Fix the RTC node
Date:   Mon, 27 May 2019 14:00:41 +0200
Message-Id: <632517d48479da8da8f665ed511c24757b6d488e.1558958381.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <290402405a34506997fd2fab2c4c1486dbe6b7e5.1558958381.git-series.maxime.ripard@bootlin.com>
References: <290402405a34506997fd2fab2c4c1486dbe6b7e5.1558958381.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

For some reason, while the v3s has a dedicated compatible in the RTC
binding, the one actually used was the A31's. However, it turns out that
the controller is pretty different (which justified the compatible).

Let's use the proper compatible, and use the proper binding description as
well.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 arch/arm/boot/dts/sun8i-v3s.dtsi | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-v3s.dtsi b/arch/arm/boot/dts/sun8i-v3s.dtsi
index df72b1719c34..d7aef128acb3 100644
--- a/arch/arm/boot/dts/sun8i-v3s.dtsi
+++ b/arch/arm/boot/dts/sun8i-v3s.dtsi
@@ -84,6 +84,7 @@
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
 			clock-frequency = <24000000>;
+			clock-accuracy = <50000>;
 			clock-output-names = "osc24M";
 		};
 
@@ -91,7 +92,8 @@
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
 			clock-frequency = <32768>;
-			clock-output-names = "osc32k";
+			clock-accuracy = <50000>;
+			clock-output-names = "ext-osc32k";
 		};
 	};
 
@@ -264,17 +266,20 @@
 		ccu: clock@1c20000 {
 			compatible = "allwinner,sun8i-v3s-ccu";
 			reg = <0x01c20000 0x400>;
-			clocks = <&osc24M>, <&osc32k>;
+			clocks = <&osc24M>, <&rtc 0>;
 			clock-names = "hosc", "losc";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 		};
 
 		rtc: rtc@1c20400 {
-			compatible = "allwinner,sun6i-a31-rtc";
+			#clock-cells = <1>;
+			compatible = "allwinner,sun8i-v3-rtc";
 			reg = <0x01c20400 0x54>;
 			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&osc32k>;
+			clock-output-names = "osc32k", "osc32k-out";
 		};
 
 		pio: pinctrl@1c20800 {
@@ -282,7 +287,7 @@
 			reg = <0x01c20800 0x400>;
 			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&ccu CLK_BUS_PIO>, <&osc24M>, <&osc32k>;
+			clocks = <&ccu CLK_BUS_PIO>, <&osc24M>, <&rtc 0>;
 			clock-names = "apb", "hosc", "losc";
 			gpio-controller;
 			#gpio-cells = <3>;
-- 
git-series 0.9.1
