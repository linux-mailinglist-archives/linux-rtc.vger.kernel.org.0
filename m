Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E2443D3C8E
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Jul 2021 17:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235646AbhGWO7A (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 23 Jul 2021 10:59:00 -0400
Received: from foss.arm.com ([217.140.110.172]:47746 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235652AbhGWO64 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 23 Jul 2021 10:58:56 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2ADB5142F;
        Fri, 23 Jul 2021 08:39:29 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 177B33F73D;
        Fri, 23 Jul 2021 08:39:26 -0700 (PDT)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     Rob Herring <robh@kernel.org>, Icenowy Zheng <icenowy@aosc.io>,
        Samuel Holland <samuel@sholland.org>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        Ondrej Jirman <megous@megous.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Subject: [PATCH v8 06/11] rtc: sun6i: Add support for RTCs without external LOSCs
Date:   Fri, 23 Jul 2021 16:38:33 +0100
Message-Id: <20210723153838.6785-7-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210723153838.6785-1-andre.przywara@arm.com>
References: <20210723153838.6785-1-andre.przywara@arm.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Some newer Allwinner RTCs (for instance the one in the H616 SoC) lack
a pin for an external 32768 Hz oscillator. As a consequence, this LOSC
can't be selected as the RTC clock source, and we must rely on the
internal RC oscillator.
To allow additions of clocks to the RTC node, add a feature bit to ignore
any provided clocks for now (the current code would think this is the
external LOSC). Later DTs and code can then for instance add the PLL
based clock input, and older kernel won't get confused.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/rtc/rtc-sun6i.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index f0ee20bfdccb..ef2b1027ce4c 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -134,6 +134,7 @@ struct sun6i_rtc_clk_data {
 	unsigned int export_iosc : 1;
 	unsigned int has_losc_en : 1;
 	unsigned int has_auto_swt : 1;
+	unsigned int no_ext_losc : 1;
 };
 
 #define RTC_LINEAR_DAY	BIT(0)
@@ -256,7 +257,7 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
 	}
 
 	/* Switch to the external, more precise, oscillator, if present */
-	if (of_get_property(node, "clocks", NULL)) {
+	if (!rtc->data->no_ext_losc && of_get_property(node, "clocks", NULL)) {
 		reg |= SUN6I_LOSC_CTRL_EXT_OSC;
 		if (rtc->data->has_losc_en)
 			reg |= SUN6I_LOSC_CTRL_EXT_LOSC_EN;
@@ -282,14 +283,19 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
 	}
 
 	parents[0] = clk_hw_get_name(rtc->int_osc);
-	/* If there is no external oscillator, this will be NULL and ... */
-	parents[1] = of_clk_get_parent_name(node, 0);
+	if (rtc->data->no_ext_losc) {
+		parents[1] = NULL;
+		init.num_parents = 1;
+	} else {
+		/* If there is no external oscillator, this will be NULL and */
+		parents[1] = of_clk_get_parent_name(node, 0);
+		/* ... number of clock parents will be 1. */
+		init.num_parents = of_clk_get_parent_count(node) + 1;
+	}
 
 	rtc->hw.init = &init;
 
 	init.parent_names = parents;
-	/* ... number of clock parents will be 1. */
-	init.num_parents = of_clk_get_parent_count(node) + 1;
 	of_property_read_string_index(node, "clock-output-names", 0,
 				      &init.name);
 
-- 
2.17.6

