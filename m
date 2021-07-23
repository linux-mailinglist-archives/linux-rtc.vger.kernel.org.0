Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49A473D3C91
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Jul 2021 17:40:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235688AbhGWO7C (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 23 Jul 2021 10:59:02 -0400
Received: from foss.arm.com ([217.140.110.172]:47780 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235668AbhGWO66 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 23 Jul 2021 10:58:58 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75D46139F;
        Fri, 23 Jul 2021 08:39:31 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6240F3F73D;
        Fri, 23 Jul 2021 08:39:29 -0700 (PDT)
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
Subject: [PATCH v8 07/11] rtc: sun6i: Add Allwinner H616 support
Date:   Fri, 23 Jul 2021 16:38:34 +0100
Message-Id: <20210723153838.6785-8-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210723153838.6785-1-andre.przywara@arm.com>
References: <20210723153838.6785-1-andre.przywara@arm.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The H616 RTC changes its day storage to the newly introduced linear day
scheme, so pair the new compatible string with this feature flag.
The clock part is missing an external 32768 Hz oscillator input pin,
for future expansion we must thus ignore any provided clock for now.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/rtc/rtc-sun6i.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index ef2b1027ce4c..db65273c6f59 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -392,6 +392,23 @@ static void __init sun50i_h6_rtc_clk_init(struct device_node *node)
 CLK_OF_DECLARE_DRIVER(sun50i_h6_rtc_clk, "allwinner,sun50i-h6-rtc",
 		      sun50i_h6_rtc_clk_init);
 
+static const struct sun6i_rtc_clk_data sun50i_h616_rtc_data = {
+	.rc_osc_rate = 16000000,
+	.fixed_prescaler = 32,
+	.has_prescaler = 1,
+	.has_out_clk = 1,
+	.export_iosc = 1,
+	.no_ext_losc = 1,
+};
+
+static void __init sun50i_h616_rtc_clk_init(struct device_node *node)
+{
+	sun6i_rtc_clk_init(node, &sun50i_h616_rtc_data);
+}
+
+CLK_OF_DECLARE_DRIVER(sun50i_h616_rtc_clk, "allwinner,sun50i-h616-rtc",
+		      sun50i_h616_rtc_clk_init);
+
 /*
  * The R40 user manual is self-conflicting on whether the prescaler is
  * fixed or configurable. The clock diagram shows it as fixed, but there
@@ -799,6 +816,8 @@ static const struct of_device_id sun6i_rtc_dt_ids[] = {
 	{ .compatible = "allwinner,sun8i-v3-rtc" },
 	{ .compatible = "allwinner,sun50i-h5-rtc" },
 	{ .compatible = "allwinner,sun50i-h6-rtc" },
+	{ .compatible = "allwinner,sun50i-h616-rtc",
+		.data = (void *)RTC_LINEAR_DAY },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, sun6i_rtc_dt_ids);
-- 
2.17.6

