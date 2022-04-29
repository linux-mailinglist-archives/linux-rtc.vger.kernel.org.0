Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D874B514749
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Apr 2022 12:50:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355811AbiD2Kw2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 29 Apr 2022 06:52:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358269AbiD2KvR (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 29 Apr 2022 06:51:17 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BFE1CE486;
        Fri, 29 Apr 2022 03:46:21 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id B3D3C100006;
        Fri, 29 Apr 2022 10:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1651229180;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vImNq21h6tPivLLs2gCCFu8O5rQBoFWExaFnkM+cNSc=;
        b=IaN1wCtmoroZQjCq7DHX/oYXPQMOqOBviMCMeSAbcFvSbYcyxLz9qkRBQNWEDYd1o0iWlg
        Zo4AfQZgbx7VTTx0tWwztcB70QZr/h0L95kdQaM1RVWn+gDsWLCmmLzOOLCP1+BJRNSW/7
        Kd0PDYXuNR4fmHh48v2UsjVofBteEhYQKNanbuDnGnuC2iDqUZFAR+vYcHnhjdovsEwnfP
        166rqA5qHXUyY03Lu0FV66+uhCptMKb0Lserh/avO+1lI0hehya01fMQxy2q+Ys77BMc4w
        b/fV7/vjOuwpWumjng4mOyENcOAxc9yKMFez0IuTz4y6hAdWBYRj2B7OA4Kc4Q==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>
Subject: [PATCH v3 6/6] ARM: dts: r9a06g032: Describe the RTC
Date:   Fri, 29 Apr 2022 12:46:02 +0200
Message-Id: <20220429104602.368055-7-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220429104602.368055-1-miquel.raynal@bootlin.com>
References: <20220429104602.368055-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Describe the SoC RTC which counts time and provides alarm support.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r9a06g032.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/r9a06g032.dtsi b/arch/arm/boot/dts/r9a06g032.dtsi
index eaf305d938cc..a35bd19c616a 100644
--- a/arch/arm/boot/dts/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/r9a06g032.dtsi
@@ -66,6 +66,19 @@ soc {
 		interrupt-parent = <&gic>;
 		ranges;
 
+		rtc0: rtc@40006000 {
+			compatible = "renesas,r9a06g032-rtc", "renesas,rzn1-rtc";
+			reg = <0x40006000 0x1000>;
+			interrupts = <GIC_SPI 66 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 67 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 68 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "alarm", "timer", "pps";
+			clocks = <&sysctrl R9A06G032_HCLK_RTC>;
+			clock-names = "hclk";
+			power-domains = <&sysctrl>;
+			status = "disabled";
+		};
+
 		wdt0: watchdog@40008000 {
 			compatible = "renesas,r9a06g032-wdt", "renesas,rzn1-wdt";
 			reg = <0x40008000 0x1000>;
-- 
2.27.0

