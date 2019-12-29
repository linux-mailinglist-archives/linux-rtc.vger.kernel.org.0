Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 359E512CAE2
	for <lists+linux-rtc@lfdr.de>; Sun, 29 Dec 2019 21:45:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727358AbfL2Upz (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 29 Dec 2019 15:45:55 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:50331 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726444AbfL2Upz (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 29 Dec 2019 15:45:55 -0500
X-Originating-IP: 92.184.100.83
Received: from localhost (unknown [92.184.100.83])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 676B7E0002;
        Sun, 29 Dec 2019 20:45:52 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     Nicolas Ferre <nicolas.ferre@microchip.com>,
        Eugen.Hristev@microchip.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 9/9] ARM: dts: at91: sama5d4: use correct rtc compatible
Date:   Sun, 29 Dec 2019 21:44:21 +0100
Message-Id: <20191229204421.337612-9-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191229204421.337612-1-alexandre.belloni@bootlin.com>
References: <20191229204421.337612-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Use the sama5d4 specific compatible string for the RTC.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 arch/arm/boot/dts/sama5d4.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sama5d4.dtsi b/arch/arm/boot/dts/sama5d4.dtsi
index 6ab27a7b388d..e9a8f82a6eda 100644
--- a/arch/arm/boot/dts/sama5d4.dtsi
+++ b/arch/arm/boot/dts/sama5d4.dtsi
@@ -884,7 +884,7 @@
 			};
 
 			rtc@fc0686b0 {
-				compatible = "atmel,at91rm9200-rtc";
+				compatible = "atmel,sama5d4-rtc";
 				reg = <0xfc0686b0 0x30>;
 				interrupts = <1 IRQ_TYPE_LEVEL_HIGH 7>;
 				clocks = <&clk32k>;
-- 
2.23.0

