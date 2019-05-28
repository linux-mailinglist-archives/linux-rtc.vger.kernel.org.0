Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88B6E2D053
	for <lists+linux-rtc@lfdr.de>; Tue, 28 May 2019 22:31:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbfE1UbF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 28 May 2019 16:31:05 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:49299 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727334AbfE1UbF (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 28 May 2019 16:31:05 -0400
X-Originating-IP: 90.89.68.76
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 64F2E4000B;
        Tue, 28 May 2019 20:31:02 +0000 (UTC)
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rtc@vger.kernel.org
Subject: [PATCH v2 08/11] ARM: dts: sun6i: Add external crystals accuracy
Date:   Tue, 28 May 2019 22:30:38 +0200
Message-Id: <dbcf6500637a75c532dbbf2922a26f8fbd5bd6ed.1559075389.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <434446bc5541d7dfe5823874355c7db8c7e213fa.1559075389.git-series.maxime.ripard@bootlin.com>
References: <434446bc5541d7dfe5823874355c7db8c7e213fa.1559075389.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The A31 datasheet mandates oscillators accuracy to be within 50ppm. Let's
add that accuracy to their device tree nodes.

Acked-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 arch/arm/boot/dts/sun6i-a31.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi b/arch/arm/boot/dts/sun6i-a31.dtsi
index 9361ef70dbab..dcddc3392460 100644
--- a/arch/arm/boot/dts/sun6i-a31.dtsi
+++ b/arch/arm/boot/dts/sun6i-a31.dtsi
@@ -216,6 +216,7 @@
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
 			clock-frequency = <24000000>;
+			clock-accuracy = <50000>;
 			clock-output-names = "osc24M";
 		};
 
@@ -223,6 +224,7 @@
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
 			clock-frequency = <32768>;
+			clock-accuracy = <50000>;
 			clock-output-names = "ext_osc32k";
 		};
 
-- 
git-series 0.9.1
