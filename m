Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AE6C1F50C2
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Jun 2020 11:05:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726841AbgFJJFu (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 10 Jun 2020 05:05:50 -0400
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:34504 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726219AbgFJJFu (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 10 Jun 2020 05:05:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1591779949; x=1623315949;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=nBJu57ggmxjsge10aXmvMnYCUOcsP5lcuOm9kP4kso0=;
  b=BJTqCDw4uw0CBBmeopwwHV4LA+IvJQHoR26x+bCtdUvR/87xZl4pvHys
   rHdXBkqyE16bPObGF/T6shJ8v89igD1VW/hlWAHvotU1NIcqUi+ffyNN6
   e6wxwWiQcppta6PaVtLGx49Yhv1Y9HaK7tAgICjz/rVLS4kxFIM0O5yuA
   rTAwYLflqUW3pvuBFoRgeQ5ap8HrlKeYlyKH/6o7idmHpyPCzTKP63u8w
   6PqnaclJMV55V5lYWY08PFGWnGogzHsHShkkXpLUH0U2zUgGfNmwONa0R
   +v+mNcJRB5o+GRg1QeZ3FOH7eGDdA+OvvAQiiThfZqycOX4Il9RlyTH9T
   w==;
IronPort-SDR: 7N0GTyrSg0FHNj/beoY0QAmXuEv38qYQffltHu7o5AfEoPtEjOkHUruGL1CLz4DXttCehRBl7F
 JTyfDv6W2xgBeil5YBf6HhnL8d0JKWPLbda23UKLLO5WSdIixtOxYgiLFUWPIHdiZ/zj4yHpdF
 DU52hSdDjr8BdkohuXhZmhfou4rJrbLteLGhdzbi4RtV2SsyOG7bGO0VuPk/G1s94a2nHbgoWp
 aiIVSfXNfHjzjJmFYgEH8dL7HTup66gyxUT+GdSW8l3GIdOfiOfJbyGYZ0eSoyC6mDx7e09pKg
 uc0=
X-IronPort-AV: E=Sophos;i="5.73,495,1583218800"; 
   d="scan'208";a="15232691"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Jun 2020 02:05:48 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Wed, 10 Jun 2020 02:05:48 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1847.3 via Frontend Transport; Wed, 10 Jun 2020 02:05:43 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <robh+dt@kernel.org>, <nicolas.ferre@microchip.com>,
        <ludovic.desroches@microchip.com>, <tglx@linutronix.de>,
        <jason@lakedaemon.net>, <maz@kernel.org>
CC:     <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH v2 1/3] irqchip/atmel-aic5: add support for sam9x60 rtt fixup
Date:   Wed, 10 Jun 2020 12:05:34 +0300
Message-ID: <1591779936-18577-2-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591779936-18577-1-git-send-email-claudiu.beznea@microchip.com>
References: <1591779936-18577-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Add support for SAM9X60 RTT fixup.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 drivers/irqchip/irq-atmel-aic5.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-atmel-aic5.c b/drivers/irqchip/irq-atmel-aic5.c
index fc1b3a9cdafc..fb4ad2aaa727 100644
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

