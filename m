Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA1782B3E2
	for <lists+linux-rtc@lfdr.de>; Mon, 27 May 2019 14:01:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727042AbfE0MBH (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 27 May 2019 08:01:07 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:40149 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727032AbfE0MBH (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 27 May 2019 08:01:07 -0400
X-Originating-IP: 90.88.147.134
Received: from localhost (aaubervilliers-681-1-27-134.w90-88.abo.wanadoo.fr [90.88.147.134])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 99051FF819;
        Mon, 27 May 2019 12:01:04 +0000 (UTC)
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rtc@vger.kernel.org
Subject: [PATCH 10/10] ARM: dts: r40: Change the RTC compatible
Date:   Mon, 27 May 2019 14:00:42 +0200
Message-Id: <834199999676fdb119f3aa1966eb1b1d1391f347.1558958381.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <290402405a34506997fd2fab2c4c1486dbe6b7e5.1558958381.git-series.maxime.ripard@bootlin.com>
References: <290402405a34506997fd2fab2c4c1486dbe6b7e5.1558958381.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Unlike what's being reported in the device tree so far, the RTC in the R40
is quite different from the H3. Indeed it doesn't have the internal
oscillator output, and it has only a single interrupt. Let's add a
compatible for it.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 arch/arm/boot/dts/sun8i-r40.dtsi | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi b/arch/arm/boot/dts/sun8i-r40.dtsi
index bb856e53b806..96fe39f27f24 100644
--- a/arch/arm/boot/dts/sun8i-r40.dtsi
+++ b/arch/arm/boot/dts/sun8i-r40.dtsi
@@ -318,13 +318,12 @@
 		};
 
 		rtc: rtc@1c20400 {
-			compatible = "allwinner,sun8i-r40-rtc",
-				     "allwinner,sun8i-h3-rtc";
+			#clock-cells = <1>;
+			compatible = "allwinner,sun8i-r40-rtc";
 			reg = <0x01c20400 0x400>;
 			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
-			clock-output-names = "osc32k", "osc32k-out";
 			clocks = <&osc32k>;
-			#clock-cells = <1>;
+			clock-output-names = "osc32k", "osc32k-out";
 		};
 
 		pio: pinctrl@1c20800 {
-- 
git-series 0.9.1
