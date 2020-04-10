Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4971F1A486A
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Apr 2020 18:28:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726695AbgDJQ1g (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 10 Apr 2020 12:27:36 -0400
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:22244 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726181AbgDJQ1f (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 10 Apr 2020 12:27:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1586536055; x=1618072055;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=aCd7V+af5Jadl43I0vNMGaR28drNOTy1KPZ4//kZ7rU=;
  b=Y036MAwSrIFrapiS0cMelypoFH8kGgFQf/SDFZq3ZJiQDZQ1PLRYnCzv
   LbDARahNyWqUZAeb9w1COrsUfmWOmaNM2ffGfzXG7etDgPC5Qj3nnj0dH
   p/xrzc+Cl5ms813eUHuwmaodx1hfGXWPlWAw5yVVousXzOrutx7e0WV7J
   IOoXc/M2LrorY1F+Hpf6uzouM6b8troDngS+iGc130NB2KMFLrCraPgDt
   5VnufCKi4z2jIVx/HW0Ev58i7ZNO3AaI3Ewi+eweCUDqqYZ+mbz4prpFc
   DjhL1bwYVRZ7NNPAIc5Gum+dgqdrN79aAadXL9qw4006dPhrC8SokGo9I
   g==;
IronPort-SDR: OWfhyt5f4n/UHw37sg5p75/fNqYt7vB9oATzW44DQilGwdeK0cncJhoslVhwkvc1Y2QPGHgN4X
 W1jS+BQESrFJehC02PXuZh2JuNiTsKEwvdk+1GEMQ8jnofZD79HLD2kGgEeTh0z7E3Q++Fz7Oo
 72Zotpvbvo+LIJFZwRCC9+5d2q4oQ80jXcIvY3Qh2PUCAQioKVpwh57Q1RvtsDwC2b+tuwb11x
 c4Ma6vfYYd+1BAYZq7p6R1OHuxaMnWxU7xWT3Ds1mpKPFi0iel7BZfcUGW4nz5NdOarFlpaXkZ
 U8A=
X-IronPort-AV: E=Sophos;i="5.72,367,1580799600"; 
   d="scan'208";a="8791187"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Apr 2020 09:27:32 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 10 Apr 2020 09:27:43 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Fri, 10 Apr 2020 09:27:23 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <nicolas.ferre@microchip.com>, <ludovic.desroches@microchip.com>,
        <tglx@linutronix.de>, <jason@lakedaemon.net>, <maz@kernel.org>
CC:     <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH 1/5] irqchip/atmel-aic5: add support for sam9x60 rtt fixup
Date:   Fri, 10 Apr 2020 19:26:55 +0300
Message-ID: <1586536019-12348-2-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586536019-12348-1-git-send-email-claudiu.beznea@microchip.com>
References: <1586536019-12348-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Add support for SAM9X60 RTT fixup.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 drivers/irqchip/irq-atmel-aic-common.c | 36 +++++++++++++++++++++-------------
 drivers/irqchip/irq-atmel-aic5.c       |  8 +++++++-
 2 files changed, 29 insertions(+), 15 deletions(-)

diff --git a/drivers/irqchip/irq-atmel-aic-common.c b/drivers/irqchip/irq-atmel-aic-common.c
index 072bd227b6c6..e8681133162b 100644
--- a/drivers/irqchip/irq-atmel-aic-common.c
+++ b/drivers/irqchip/irq-atmel-aic-common.c
@@ -169,21 +169,29 @@ void __init aic_common_rtt_irq_fixup(void)
 {
 	struct device_node *np;
 	void __iomem *regs;
+	static const  struct of_device_id aic_rtt_fixup_ids[] = {
+		{ .compatible = "atmel,at91sam9260-rtt", },
+		{ .compatible = "microchip,sam9x60-rtt", },
+	};
+	int i;
 
-	/*
-	 * The at91sam9263 SoC has 2 instances of the RTT block, hence we
-	 * iterate over the DT to find each occurrence.
-	 */
-	for_each_compatible_node(np, NULL, "atmel,at91sam9260-rtt") {
-		regs = of_iomap(np, 0);
-		if (!regs)
-			continue;
-
-		writel(readl(regs + AT91_RTT_MR) &
-		       ~(AT91_RTT_ALMIEN | AT91_RTT_RTTINCIEN),
-		       regs + AT91_RTT_MR);
-
-		iounmap(regs);
+	for (i = 0; i < ARRAY_SIZE(aic_rtt_fixup_ids); i++) {
+		/*
+		 * The at91sam9263 SoC has 2 instances of the RTT block, hence
+		 * we iterate over the DT to find each occurrence.
+		 */
+		for_each_compatible_node(np, NULL,
+					 aic_rtt_fixup_ids[i].compatible) {
+			regs = of_iomap(np, 0);
+			if (!regs)
+				continue;
+
+			writel(readl(regs + AT91_RTT_MR) &
+			       ~(AT91_RTT_ALMIEN | AT91_RTT_RTTINCIEN),
+			       regs + AT91_RTT_MR);
+
+			iounmap(regs);
+		}
 	}
 }
 
diff --git a/drivers/irqchip/irq-atmel-aic5.c b/drivers/irqchip/irq-atmel-aic5.c
index 29333497ba10..74a66cd05553 100644
--- a/drivers/irqchip/irq-atmel-aic5.c
+++ b/drivers/irqchip/irq-atmel-aic5.c
@@ -310,10 +310,16 @@ static void __init sama5d3_aic_irq_fixup(void)
 	aic_common_rtc_irq_fixup();
 }
 
+static void __init sam9x60_aic_irq_fixup(void)
+{
+	aic_common_rtc_irq_fixup();
+	aic_common_rtt_irq_fixup();
+}
+
 static const struct of_device_id aic5_irq_fixups[] __initconst = {
 	{ .compatible = "atmel,sama5d3", .data = sama5d3_aic_irq_fixup },
 	{ .compatible = "atmel,sama5d4", .data = sama5d3_aic_irq_fixup },
-	{ .compatible = "microchip,sam9x60", .data = sama5d3_aic_irq_fixup },
+	{ .compatible = "microchip,sam9x60", .data = sam9x60_aic_irq_fixup },
 	{ /* sentinel */ },
 };
 
-- 
2.7.4

