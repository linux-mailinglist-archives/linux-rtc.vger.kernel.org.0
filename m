Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3DF296417
	for <lists+linux-rtc@lfdr.de>; Tue, 20 Aug 2019 17:19:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730533AbfHTPTp (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 20 Aug 2019 11:19:45 -0400
Received: from vps.xff.cz ([195.181.215.36]:32832 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730427AbfHTPTh (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 20 Aug 2019 11:19:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1566314376; bh=9Bu3I/MHKVFLzcyKmY5PFKEAWplV+hj5AiRwPhNXy18=;
        h=From:To:Cc:Subject:Date:References:From;
        b=SMGaAyxpdu5QWmCjcwcx+YRShBYwGguwWZyv0b5+jRl38S939zdFmrCJfNAAbQ2iY
         w70t8bzvUTGXqwYtteDbcgznmlvCO771ChE8QbXY5tWN8iouEgWUtKsRP1YH0TwqS3
         K16IWoRvv79fGJlAznCCKUsHIvnnJhOgq/x4xuLk=
From:   megous@megous.com
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     Ondrej Jirman <megous@megous.com>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: [PATCH v2 2/3] rtc: sun6i: Add support for H6 RTC
Date:   Tue, 20 Aug 2019 17:19:33 +0200
Message-Id: <20190820151934.3860-3-megous@megous.com>
In-Reply-To: <20190820151934.3860-1-megous@megous.com>
References: <20190820151934.3860-1-megous@megous.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Ondrej Jirman <megous@megous.com>

RTC on H6 is mostly the same as on H5 and H3. It has slight differences
mostly in features that are not yet supported by this driver.

Some differences are already stated in the comments in existing code.
One other difference is that H6 has extra bit in LOSC_CTRL_REG, called
EXT_LOSC_EN to enable/disable external low speed crystal oscillator.

It also has bit EXT_LOSC_STA in LOSC_AUTO_SWT_STA_REG, to check whether
external low speed oscillator is working correctly.

This patch adds support for enabling LOSC when necessary:

- during reparenting
- when probing the clock

H6 also has capacbility to automatically reparent RTC clock from
external crystal oscillator, to internal RC oscillator, if external
oscillator fails. This is enabled by default. Disable it during
probe.

Signed-off-by: Ondrej Jirman <megous@megous.com>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/rtc/rtc-sun6i.c | 40 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index d50ee023b559..b0c3752bed3f 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -32,9 +32,11 @@
 /* Control register */
 #define SUN6I_LOSC_CTRL				0x0000
 #define SUN6I_LOSC_CTRL_KEY			(0x16aa << 16)
+#define SUN6I_LOSC_CTRL_AUTO_SWT_BYPASS		BIT(15)
 #define SUN6I_LOSC_CTRL_ALM_DHMS_ACC		BIT(9)
 #define SUN6I_LOSC_CTRL_RTC_HMS_ACC		BIT(8)
 #define SUN6I_LOSC_CTRL_RTC_YMD_ACC		BIT(7)
+#define SUN6I_LOSC_CTRL_EXT_LOSC_EN		BIT(4)
 #define SUN6I_LOSC_CTRL_EXT_OSC			BIT(0)
 #define SUN6I_LOSC_CTRL_ACC_MASK		GENMASK(9, 7)
 
@@ -128,6 +130,8 @@ struct sun6i_rtc_clk_data {
 	unsigned int has_prescaler : 1;
 	unsigned int has_out_clk : 1;
 	unsigned int export_iosc : 1;
+	unsigned int has_losc_en : 1;
+	unsigned int has_auto_swt : 1;
 };
 
 struct sun6i_rtc_dev {
@@ -190,6 +194,10 @@ static int sun6i_rtc_osc_set_parent(struct clk_hw *hw, u8 index)
 	val &= ~SUN6I_LOSC_CTRL_EXT_OSC;
 	val |= SUN6I_LOSC_CTRL_KEY;
 	val |= index ? SUN6I_LOSC_CTRL_EXT_OSC : 0;
+	if (rtc->data->has_losc_en) {
+		val &= ~SUN6I_LOSC_CTRL_EXT_LOSC_EN;
+		val |= index ? SUN6I_LOSC_CTRL_EXT_LOSC_EN : 0;
+	}
 	writel(val, rtc->base + SUN6I_LOSC_CTRL);
 	spin_unlock_irqrestore(&rtc->lock, flags);
 
@@ -215,6 +223,7 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
 	const char *iosc_name = "rtc-int-osc";
 	const char *clkout_name = "osc32k-out";
 	const char *parents[2];
+	u32 reg;
 
 	rtc = kzalloc(sizeof(*rtc), GFP_KERNEL);
 	if (!rtc)
@@ -235,9 +244,18 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
 		goto err;
 	}
 
+	reg = SUN6I_LOSC_CTRL_KEY;
+	if (rtc->data->has_auto_swt) {
+		/* Bypass auto-switch to int osc, on ext losc failure */
+		reg |= SUN6I_LOSC_CTRL_AUTO_SWT_BYPASS;
+		writel(reg, rtc->base + SUN6I_LOSC_CTRL);
+	}
+
 	/* Switch to the external, more precise, oscillator */
-	writel(SUN6I_LOSC_CTRL_KEY | SUN6I_LOSC_CTRL_EXT_OSC,
-	       rtc->base + SUN6I_LOSC_CTRL);
+	reg |= SUN6I_LOSC_CTRL_EXT_OSC;
+	if (rtc->data->has_losc_en)
+		reg |= SUN6I_LOSC_CTRL_EXT_LOSC_EN;
+	writel(reg, rtc->base + SUN6I_LOSC_CTRL);
 
 	/* Yes, I know, this is ugly. */
 	sun6i_rtc = rtc;
@@ -345,6 +363,23 @@ CLK_OF_DECLARE_DRIVER(sun8i_h3_rtc_clk, "allwinner,sun8i-h3-rtc",
 CLK_OF_DECLARE_DRIVER(sun50i_h5_rtc_clk, "allwinner,sun50i-h5-rtc",
 		      sun8i_h3_rtc_clk_init);
 
+static const struct sun6i_rtc_clk_data sun50i_h6_rtc_data = {
+	.rc_osc_rate = 16000000,
+	.fixed_prescaler = 32,
+	.has_prescaler = 1,
+	.has_out_clk = 1,
+	.export_iosc = 1,
+	.has_losc_en = 1,
+	.has_auto_swt = 1,
+};
+
+static void __init sun50i_h6_rtc_clk_init(struct device_node *node)
+{
+	sun6i_rtc_clk_init(node, &sun50i_h6_rtc_data);
+}
+CLK_OF_DECLARE_DRIVER(sun50i_h6_rtc_clk, "allwinner,sun50i-h6-rtc",
+		      sun50i_h6_rtc_clk_init);
+
 static const struct sun6i_rtc_clk_data sun8i_v3_rtc_data = {
 	.rc_osc_rate = 32000,
 	.has_out_clk = 1,
@@ -675,6 +710,7 @@ static const struct of_device_id sun6i_rtc_dt_ids[] = {
 	{ .compatible = "allwinner,sun8i-r40-rtc" },
 	{ .compatible = "allwinner,sun8i-v3-rtc" },
 	{ .compatible = "allwinner,sun50i-h5-rtc" },
+	{ .compatible = "allwinner,sun50i-h6-rtc" },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, sun6i_rtc_dt_ids);
-- 
2.22.1

