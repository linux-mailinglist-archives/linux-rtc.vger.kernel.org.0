Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AC5441AA61
	for <lists+linux-rtc@lfdr.de>; Tue, 28 Sep 2021 10:04:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239494AbhI1IGL (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 28 Sep 2021 04:06:11 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:42337 "EHLO
        wnew3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239355AbhI1IFf (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 28 Sep 2021 04:05:35 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.west.internal (Postfix) with ESMTP id 018ED2B01622;
        Tue, 28 Sep 2021 04:03:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 28 Sep 2021 04:03:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=X/0DMCQ8oMsaN
        L+nfCZsscUoW2pPstIXXCBoyVEC0i4=; b=aX2zXZQMwpsq5LSvgyGqERAgsIu63
        LLCrJ0u34G4ofs/gab6Xck5tU+eeeGE3zqb6iHhcdmFTtp71q6rCABu0u2y+/nKT
        ksbd1UEmEAa20rthBF1iLRBoNzO67yQgnQvL2pVyyWQVsHC1g7wQHznyg2w7NSbZ
        bqDubITxlabG9RgKT3+rkanFvyAPJgiw5M5bE8BhLUyCQEWp6fAvfIxgDOOxeeGW
        BrrEqUuDi7I2+xPjOMjVj3N+WWIp1YsYYlW0Hxu26uTqN3nP4yhef8VxcvszMKgq
        McP2WN1GZx9CUMvQ1xWHNdsRIsTKbGdToJtqg4/g9Lx/Zw27IS5P+kGzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=X/0DMCQ8oMsaNL+nfCZsscUoW2pPstIXXCBoyVEC0i4=; b=gm4L2saI
        i+qVAOmG00m4lyNFLjWRLwXftEJLUFq7Zyyom1E/jLCulD5TF8YwGxbnvz3/zrZg
        PYWntzctjhjB/sSHvMumICAwUl6jZ0Qf68i7huwGnokItotefsJxOZXTpxzi1IHp
        9MJshbuHvIDNencilghvI/swuO01iQN1D/kNjt4JRX8MPpE2q/E1BenqOlXlOmUh
        ng2fD6qP/d45W1V2v6impuZlcPlrgttlPCsA2Ns39Jhc6hxj2hJ78MhB49qR0UGN
        YfpaA+p8AogFFPvtdL7FSu/3pyGpqN0mgOevw3u4ISnAK1jLIKGkLZ4HMNpE5Fvr
        rQGiQGrKA+FyKw==
X-ME-Sender: <xms:asxSYSgCYL8tpueGEkaYpiCw2xdRssNAbRbKmZdoneozxYDElvcuLA>
    <xme:asxSYTD3prIzlXFgwJNVU0sMRXakJTjYeJKR8wjHaY9aOL2wp1nNMV7yQnrXZjPTm
    Xswa1asBJSuJxKwmg>
X-ME-Received: <xmr:asxSYaG3zIqmiApgiDN2Z9VwF3Phvw-_63YO61y-6Aq1qCkamWTaE151JQEPUZiYFf--W6vlbznEnkATlc4ImQVV1lPXAGOjUMzkffFs-tYVf_y4O-2LiBDcDhwQoBIGDL9oCg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejledguddvfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheej
    vdfgjeehueeinecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:asxSYbRBdDGhCYg_Q406N_fobqNHp86WgEvO_LMQZqQchjo_ctbkig>
    <xmx:asxSYfx1u2evbnuYqmtWSjAU7JWI1KxKW_aoSeITZWdz6HFNEIqtnw>
    <xmx:asxSYZ5ACGR4fTFiDlhWGTusDDknvzvpfyAEntNoVsLNKpck6ZrAyg>
    <xmx:asxSYXiNX3Si3wI1MZNrntkj7b_VFfc5rQalFMuMzbzttxB2dJzbBnyb2Eg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Sep 2021 04:03:54 -0400 (EDT)
From:   Samuel Holland <samuel@sholland.org>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        Samuel Holland <samuel@sholland.org>
Subject: [PATCH v2 8/9] [DO NOT MERGE] clk: sunxi-ng: sun6i-rtc: Add support for H6
Date:   Tue, 28 Sep 2021 03:03:34 -0500
Message-Id: <20210928080335.36706-9-samuel@sholland.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928080335.36706-1-samuel@sholland.org>
References: <20210928080335.36706-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

H6 has IOSC calibration and an ext-osc32k input.

H6 has the osc32k mux and the rtc-32k mux, but no fanout mux.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
Changes since v1:
  - Rebase.
  - Add a new non-mux "osc32k-fanout" clock instead of changing the
    number of parents in osc32k_fanout_clk.

 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 49 ++++++++++++++++++++++++++++
 drivers/rtc/rtc-sun6i.c              | 17 ----------
 2 files changed, 49 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
index 7e67466c481d..f742f6569f6c 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
@@ -234,9 +234,22 @@ static SUNXI_CCU_MUX_DATA_WITH_GATE(osc32k_fanout_clk, "osc32k-fanout",
 				    osc32k_fanout_parents,
 				    0x60, 1, 2, BIT(0), 0);
 
+static SUNXI_CCU_GATE_HW(osc32k_fanout_gate_clk, "osc32k-fanout",
+			 &osc32k_clk.common.hw, 0x60, BIT(0), 0);
+
 static SUNXI_CCU_M_FW_WITH_GATE(rtc_spi_clk, "rtc-spi", "ahb",
 				0x310, 0, 5, BIT(31), 0);
 
+static struct ccu_common *sun50i_h6_rtc_ccu_clks[] = {
+	&iosc_clk,
+	&iosc_32k_clk,
+	&ext_osc32k_gate_clk.common,
+	&osc32k_clk.common,
+	&osc24M_32k_clk.common,
+	&rtc_32k_mux_clk.common,
+	&osc32k_fanout_gate_clk.common,
+};
+
 static struct ccu_common *sun50i_h616_rtc_ccu_clks[] = {
 	&iosc_clk,
 	&iosc_32k_clk,
@@ -256,6 +269,21 @@ static struct ccu_common *sun50i_r329_rtc_ccu_clks[] = {
 	&rtc_spi_clk.common,
 };
 
+static struct clk_hw_onecell_data sun50i_h6_rtc_ccu_hw_clks = {
+	.num = CLK_NUMBER,
+	.hws = {
+		[CLK_OSC32K]		= &osc32k_clk.common.hw,
+		[CLK_OSC32K_FANOUT]	= &osc32k_fanout_gate_clk.common.hw,
+		[CLK_IOSC]		= &iosc_clk.hw,
+
+		[CLK_IOSC_32K]		= &iosc_32k_clk.hw,
+		[CLK_EXT_OSC32K_GATE]	= &ext_osc32k_gate_clk.common.hw,
+		[CLK_OSC24M_32K]	= &osc24M_32k_clk.common.hw,
+		[CLK_RTC_32K]		= &rtc_32k_mux_clk.common.hw,
+		[CLK_RTC_SPI]		= NULL,
+	},
+};
+
 static struct clk_hw_onecell_data sun50i_h616_rtc_ccu_hw_clks = {
 	.num = CLK_NUMBER,
 	.hws = {
@@ -286,6 +314,13 @@ static struct clk_hw_onecell_data sun50i_r329_rtc_ccu_hw_clks = {
 	},
 };
 
+static const struct sunxi_ccu_desc sun50i_h6_rtc_ccu_desc = {
+	.ccu_clks	= sun50i_h6_rtc_ccu_clks,
+	.num_ccu_clks	= ARRAY_SIZE(sun50i_h6_rtc_ccu_clks),
+
+	.hw_clks	= &sun50i_h6_rtc_ccu_hw_clks,
+};
+
 static const struct sunxi_ccu_desc sun50i_h616_rtc_ccu_desc = {
 	.ccu_clks	= sun50i_h616_rtc_ccu_clks,
 	.num_ccu_clks	= ARRAY_SIZE(sun50i_h616_rtc_ccu_clks),
@@ -300,6 +335,11 @@ static const struct sunxi_ccu_desc sun50i_r329_rtc_ccu_desc = {
 	.hw_clks	= &sun50i_r329_rtc_ccu_hw_clks,
 };
 
+static void sun50i_h6_rtc_ccu_setup(void)
+{
+	have_iosc_calib = 1;
+}
+
 static void sun50i_h616_rtc_ccu_setup(void)
 {
 	have_iosc_calib = 1;
@@ -317,6 +357,11 @@ static void sun50i_r329_rtc_ccu_setup(void)
 	};
 }
 
+static const struct sun6i_rtc_match_data sun50i_h6_rtc_ccu_data = {
+	.desc	= &sun50i_h6_rtc_ccu_desc,
+	.setup	= sun50i_h6_rtc_ccu_setup,
+};
+
 static const struct sun6i_rtc_match_data sun50i_h616_rtc_ccu_data = {
 	.desc	= &sun50i_h616_rtc_ccu_desc,
 	.setup	= sun50i_h616_rtc_ccu_setup,
@@ -328,6 +373,10 @@ static const struct sun6i_rtc_match_data sun50i_r329_rtc_ccu_data = {
 };
 
 static const struct of_device_id sun6i_rtc_ccu_match[] = {
+	{
+		.compatible	= "allwinner,sun50i-h6-rtc",
+		.data		= &sun50i_h6_rtc_ccu_data,
+	},
 	{
 		.compatible	= "allwinner,sun50i-h616-rtc",
 		.data		= &sun50i_h616_rtc_ccu_data,
diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index 079c7c8f3b54..727b34a6e44d 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -364,23 +364,6 @@ CLK_OF_DECLARE_DRIVER(sun8i_h3_rtc_clk, "allwinner,sun8i-h3-rtc",
 CLK_OF_DECLARE_DRIVER(sun50i_h5_rtc_clk, "allwinner,sun50i-h5-rtc",
 		      sun8i_h3_rtc_clk_init);
 
-static const struct sun6i_rtc_clk_data sun50i_h6_rtc_data = {
-	.rc_osc_rate = 16000000,
-	.fixed_prescaler = 32,
-	.has_prescaler = 1,
-	.has_out_clk = 1,
-	.export_iosc = 1,
-	.has_losc_en = 1,
-	.has_auto_swt = 1,
-};
-
-static void __init sun50i_h6_rtc_clk_init(struct device_node *node)
-{
-	sun6i_rtc_clk_init(node, &sun50i_h6_rtc_data);
-}
-CLK_OF_DECLARE_DRIVER(sun50i_h6_rtc_clk, "allwinner,sun50i-h6-rtc",
-		      sun50i_h6_rtc_clk_init);
-
 /*
  * The R40 user manual is self-conflicting on whether the prescaler is
  * fixed or configurable. The clock diagram shows it as fixed, but there
-- 
2.31.1

