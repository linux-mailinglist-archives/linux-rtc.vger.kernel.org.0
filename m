Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6053388BC1
	for <lists+linux-rtc@lfdr.de>; Wed, 19 May 2021 12:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348372AbhESKnl (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 19 May 2021 06:43:41 -0400
Received: from foss.arm.com ([217.140.110.172]:58920 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348432AbhESKnj (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 19 May 2021 06:43:39 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 945F1101E;
        Wed, 19 May 2021 03:42:19 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C8CE3F719;
        Wed, 19 May 2021 03:42:17 -0700 (PDT)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     Rob Herring <robh@kernel.org>, Icenowy Zheng <icenowy@aosc.io>,
        Samuel Holland <samuel@sholland.org>,
        Ondrej Jirman <megous@megous.com>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Subject: [PATCH v6 05/17] rtc: sun6i: Add Allwinner H616 support
Date:   Wed, 19 May 2021 11:41:40 +0100
Message-Id: <20210519104152.21119-6-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210519104152.21119-1-andre.przywara@arm.com>
References: <20210519104152.21119-1-andre.przywara@arm.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The H616 RTC changes its day storage to the newly introduced linear day
scheme, so pair the new compatible string with this feature flag.
So far the clock parts seem to be the same as the H6, so combine the
compatible string with the existing H6 support bits.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/rtc/rtc-sun6i.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index 0228e9dfd969..ec0cd0ee539a 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -382,6 +382,8 @@ static void __init sun50i_h6_rtc_clk_init(struct device_node *node)
 }
 CLK_OF_DECLARE_DRIVER(sun50i_h6_rtc_clk, "allwinner,sun50i-h6-rtc",
 		      sun50i_h6_rtc_clk_init);
+CLK_OF_DECLARE_DRIVER(sun50i_h616_rtc_clk, "allwinner,sun50i-h616-rtc",
+		      sun50i_h6_rtc_clk_init);
 
 /*
  * The R40 user manual is self-conflicting on whether the prescaler is
@@ -773,6 +775,8 @@ static const struct of_device_id sun6i_rtc_dt_ids[] = {
 	{ .compatible = "allwinner,sun8i-v3-rtc" },
 	{ .compatible = "allwinner,sun50i-h5-rtc" },
 	{ .compatible = "allwinner,sun50i-h6-rtc" },
+	{ .compatible = "allwinner,sun50i-h616-rtc",
+		.data = (void *)RTC_LINEAR_DAY },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, sun6i_rtc_dt_ids);
-- 
2.17.5

