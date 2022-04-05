Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB0274F4882
	for <lists+linux-rtc@lfdr.de>; Wed,  6 Apr 2022 02:03:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235966AbiDEVlJ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 5 Apr 2022 17:41:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1573378AbiDES7w (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 5 Apr 2022 14:59:52 -0400
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2ADACD33E
        for <linux-rtc@vger.kernel.org>; Tue,  5 Apr 2022 11:57:53 -0700 (PDT)
Received: from relay12.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::232])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id EB7C4CB506
        for <linux-rtc@vger.kernel.org>; Tue,  5 Apr 2022 18:47:42 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 908BC200006;
        Tue,  5 Apr 2022 18:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1649184454;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Xxdt0tyZWd8zeGpcOomewbA36qGbMLLM+1tWmHX19c8=;
        b=NJFDnHyej9QXSnfYFN+Nd9Y6DySfU/M34GWjlzY/xKl5ohq8pspgXHHbCZ2VnRB6xm0mP6
        pDB8+w8a6Ja8ftDsQQcTAX4Y9+9t2IGNZxprl72OGFuwe3M4bOKdFEM/s6tZd8DbozcxvY
        EsyPdSEv0o2UzQhmFBdP/4mG4nhq6ySpMYMKVAWwQSnErp7mYGxQk0LiLKh2ErQ6ww2iW1
        qUY/zR8rzya5GfuKAfkTn1wx58+DOm5aToTNEIYkhdjngk8rTw2H8j6bsK7X2OtwYYdfom
        8TsYmWS9rROGKzFBvJKQrrB0BHzA5i13oSCo21Hi6wWlyM6cLTwSOEg4P0xU6Q==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        linux-rtc@vger.kernel.org,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 7/7] ARM: dts: r9a06g032: Describe the RTC
Date:   Tue,  5 Apr 2022 20:47:16 +0200
Message-Id: <20220405184716.1578385-8-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220405184716.1578385-1-miquel.raynal@bootlin.com>
References: <20220405184716.1578385-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Describe the SoC RTC which counts time and provides alarm support.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 arch/arm/boot/dts/r9a06g032.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/r9a06g032.dtsi b/arch/arm/boot/dts/r9a06g032.dtsi
index 4288b935fcea..7d380a38c7cd 100644
--- a/arch/arm/boot/dts/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/r9a06g032.dtsi
@@ -103,6 +103,18 @@ dmamux: dma-router@a0 {
 			};
 		};
 
+		rtc0: rtc@40006000 {
+			compatible = "renesas,r9a06g032-rtc", "renesas,rzn1-rtc";
+			reg = <0x40006000 0x1000>;
+			interrupts = <GIC_SPI 66 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 67 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 68 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "alarm", "timer", "pps";
+			clocks = <&sysctrl R9A06G032_HCLK_RTC>;
+			clock-names = "hclk";
+			status = "disabled";
+		};
+
 		uart0: serial@40060000 {
 			compatible = "renesas,r9a06g032-uart", "renesas,rzn1-uart", "snps,dw-apb-uart";
 			reg = <0x40060000 0x400>;
-- 
2.27.0

