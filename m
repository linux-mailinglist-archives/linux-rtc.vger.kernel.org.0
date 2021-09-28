Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4DAF41AA5F
	for <lists+linux-rtc@lfdr.de>; Tue, 28 Sep 2021 10:04:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239525AbhI1IGK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 28 Sep 2021 04:06:10 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:59529 "EHLO
        wnew3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239372AbhI1IFh (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 28 Sep 2021 04:05:37 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.west.internal (Postfix) with ESMTP id 2E50F2B01620;
        Tue, 28 Sep 2021 04:03:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 28 Sep 2021 04:03:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=MZr1ROPsa7huk
        ZlSBuo6Lot+29g5/AyZ+XRVJeB1+z0=; b=uE/MuVjV8S+Y5a7yePJbasPwcE/uY
        1T26aIR1rxCiWu5feWUc+7e76u6EGYlwPwEvSbR1upjFnq7QeNBxMEs/hirHpggS
        rVVO3xcvHfWoGOwbBA86XTRHoBAddX7n0Pwcg7iQ4LW9erTb16A5r6ae+zPGdp5m
        N+U1M99CFgpzOV3uE69IoFuACjIfRRKcTKJ8qMr98dr5xmxgjbgtWH0CJuIn3hsz
        pKRq2whWz1lV7OEhTHdZjYeQijiLI4lgYYf7x5DtF84ODTFPVbUH34P1bB0hXVEf
        jyG5TPMaTwNntnk2DFdKATPJqeuyE4L7YXobSg9Ids7mRLFMgh3Sv8QoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=MZr1ROPsa7hukZlSBuo6Lot+29g5/AyZ+XRVJeB1+z0=; b=QDH/DdCA
        OyRWaJABYJaWLRlwsGkbGakKqlJDi+6QtosbTMOLOG/O70T4pCuN42eyM1dQRT2I
        WMupQSPEU2pvGCmOKh22J5uXZM/MAcdQesnCDFMLfDSMs1ix2C/y1iJ6mG8HrrGA
        ucyxuMrdfWgmvTLxbl0j6IgPXVUMzyop9jniJdnZuRhAPWS8pu0+elGyWn9c9/Qa
        qwP1g5EpxkuBSq18j5p68aPV1FoucSdvHeEUuuJG0by8phR62UfQNE0CaMWbMPpH
        Nq90qXo/q96nQGI+CKJPYRc+Lhu00odvJ5slb5VP4ILDZNw7egyVUWqcOYfSzwvL
        rLFiCVREhd2M4g==
X-ME-Sender: <xms:bMxSYe2iMM7HK9hfvhLuVwOtYuBoU-1GAOU81XDkmaR_dyTuV8hYLQ>
    <xme:bMxSYRFpiH3WnHo3Mxp93ys9Lu4Wd7h8uCNVk2bpx235G2rlm_pxuwbCs6ozCGM93
    Evqvj7sVO0GwZeVxQ>
X-ME-Received: <xmr:bMxSYW5ahpKNdikqoO8GId0F135MEhe8haNDmv-I3nbmWpA6k3OextC_210TyuzhFRTWyvyaKYS6eKUdpZI5RWX6jbX5NwM4OiO2rvVfEU9r7IDAhlNMVWIjHcN7rKFWWgcEfQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejledguddvfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheej
    vdfgjeehueeinecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:bMxSYf3Avh56HFfNYmPz_LRkT4emcQ2sArV1NTgC-6rItD0_jXdc9g>
    <xmx:bMxSYRE-GwQAelDGacPXFMjJ1JTQsCF9EXsQhYLoN5_Pnod5EpuMpg>
    <xmx:bMxSYY9P769JUpt9jTPpGdOAO36W_Es99YK9ForUHXsld2ty8pND4w>
    <xmx:bMxSYZGAJhmVNXSUbjWKc5czldz-uXC76Az2j_r5999p13qa0b0zMvsSsmo>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Sep 2021 04:03:56 -0400 (EDT)
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
Subject: [PATCH v2 9/9] [DO NOT MERGE] clk: sunxi-ng: sun6i-rtc: Add support for T5
Date:   Tue, 28 Sep 2021 03:03:35 -0500
Message-Id: <20210928080335.36706-10-samuel@sholland.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928080335.36706-1-samuel@sholland.org>
References: <20210928080335.36706-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The T5 RTC is similar to the H616 RTC (no rtc-32k mux, pll-32k as the
second fanout input), except that it adds the ext-osc32k input.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 45 ++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
index f742f6569f6c..88946c990b61 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
@@ -240,6 +240,15 @@ static SUNXI_CCU_GATE_HW(osc32k_fanout_gate_clk, "osc32k-fanout",
 static SUNXI_CCU_M_FW_WITH_GATE(rtc_spi_clk, "rtc-spi", "ahb",
 				0x310, 0, 5, BIT(31), 0);
 
+static struct ccu_common *sun8i_t5_rtc_ccu_clks[] = {
+	&iosc_clk,
+	&iosc_32k_clk,
+	&ext_osc32k_gate_clk.common,
+	&osc32k_clk.common,
+	&osc24M_32k_clk.common,
+	&osc32k_fanout_clk.common,
+};
+
 static struct ccu_common *sun50i_h6_rtc_ccu_clks[] = {
 	&iosc_clk,
 	&iosc_32k_clk,
@@ -269,6 +278,21 @@ static struct ccu_common *sun50i_r329_rtc_ccu_clks[] = {
 	&rtc_spi_clk.common,
 };
 
+static struct clk_hw_onecell_data sun8i_t5_rtc_ccu_hw_clks = {
+	.num = CLK_NUMBER,
+	.hws = {
+		[CLK_OSC32K]		= &osc32k_clk.common.hw,
+		[CLK_OSC32K_FANOUT]	= &osc32k_fanout_clk.common.hw,
+		[CLK_IOSC]		= &iosc_clk.hw,
+
+		[CLK_IOSC_32K]		= &iosc_32k_clk.hw,
+		[CLK_EXT_OSC32K_GATE]	= &ext_osc32k_gate_clk.common.hw,
+		[CLK_OSC24M_32K]	= &osc24M_32k_clk.common.hw,
+		[CLK_RTC_32K]		= &rtc_32k_fixed_clk.hw,
+		[CLK_RTC_SPI]		= NULL,
+	},
+};
+
 static struct clk_hw_onecell_data sun50i_h6_rtc_ccu_hw_clks = {
 	.num = CLK_NUMBER,
 	.hws = {
@@ -314,6 +338,13 @@ static struct clk_hw_onecell_data sun50i_r329_rtc_ccu_hw_clks = {
 	},
 };
 
+static const struct sunxi_ccu_desc sun8i_t5_rtc_ccu_desc = {
+	.ccu_clks	= sun8i_t5_rtc_ccu_clks,
+	.num_ccu_clks	= ARRAY_SIZE(sun8i_t5_rtc_ccu_clks),
+
+	.hw_clks	= &sun8i_t5_rtc_ccu_hw_clks,
+};
+
 static const struct sunxi_ccu_desc sun50i_h6_rtc_ccu_desc = {
 	.ccu_clks	= sun50i_h6_rtc_ccu_clks,
 	.num_ccu_clks	= ARRAY_SIZE(sun50i_h6_rtc_ccu_clks),
@@ -335,6 +366,11 @@ static const struct sunxi_ccu_desc sun50i_r329_rtc_ccu_desc = {
 	.hw_clks	= &sun50i_r329_rtc_ccu_hw_clks,
 };
 
+static void sun8i_t5_rtc_ccu_setup(void)
+{
+	have_iosc_calib = 1;
+}
+
 static void sun50i_h6_rtc_ccu_setup(void)
 {
 	have_iosc_calib = 1;
@@ -357,6 +393,11 @@ static void sun50i_r329_rtc_ccu_setup(void)
 	};
 }
 
+static const struct sun6i_rtc_match_data sun8i_t5_rtc_ccu_data = {
+	.desc	= &sun8i_t5_rtc_ccu_desc,
+	.setup	= sun8i_t5_rtc_ccu_setup,
+};
+
 static const struct sun6i_rtc_match_data sun50i_h6_rtc_ccu_data = {
 	.desc	= &sun50i_h6_rtc_ccu_desc,
 	.setup	= sun50i_h6_rtc_ccu_setup,
@@ -373,6 +414,10 @@ static const struct sun6i_rtc_match_data sun50i_r329_rtc_ccu_data = {
 };
 
 static const struct of_device_id sun6i_rtc_ccu_match[] = {
+	{
+		.compatible	= "allwinner,sun8i-t5-rtc",
+		.data		= &sun8i_t5_rtc_ccu_data,
+	},
 	{
 		.compatible	= "allwinner,sun50i-h6-rtc",
 		.data		= &sun50i_h6_rtc_ccu_data,
-- 
2.31.1

