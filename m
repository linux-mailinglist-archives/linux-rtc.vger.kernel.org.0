Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B12A6D6453
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Apr 2023 15:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235506AbjDDN7F (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 4 Apr 2023 09:59:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235420AbjDDN6u (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 4 Apr 2023 09:58:50 -0400
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com [66.111.4.229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 312635FD3;
        Tue,  4 Apr 2023 06:58:18 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id 54328581F8B;
        Tue,  4 Apr 2023 09:57:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Tue, 04 Apr 2023 09:57:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
        1680616633; x=1680623833; bh=5HHZXkTf0Zua/ovxg1WRxfHNgNGeCw1s6sh
        szl630fA=; b=jEsLIGiwxS49SQiahtryHJpnMF8xm+ezEdu2uCCj4/1ztHMap/r
        VcX88UZL2yRnW8zIustHMaluE2tr2koComRrOSR6Xl1NRb0hiDcYGS+EuFNvwOjH
        4xj6nbV0MSki5F1fXeIQU/hgbhKVAiQ9ME8iShgjRLWwKSTmdzzdj+H0098ubTI2
        AQfr5bpWXoxOUTVzxUIB4VZI+L3ye7E/qPuYfjWqJMr0GsZ87Lsf4SmUm9oQmclH
        B542QFkx1Ot1Dk/cw4PcHM0qlsZlYuWBqh99FS0b25IA5fDRYKx7lL81HbskcPDf
        ZIxaQ4lf/i7MyOfaTt5qoR+UR0szT+X7tTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1680616633; x=1680623833; bh=5HHZXkTf0Zua/ovxg1WRxfHNgNGeCw1s6sh
        szl630fA=; b=GM+kcL/Jg/QkhvI0CJW+fLdUjvlxW0P/Q4hkjEbVg5453dMT3LJ
        sogCos+yEXiXP7gUdh1EFquX8fFEFNWN/YZ7gGFdGhhevs8MBMshLHI4QxF3rxiS
        re2dWlVNOeww8VX5v5LTTxJ+qZUiIBUn2bbvrS2sEr0fZclTIv5O6yCWW3sY28wS
        +8kiGL9rE7Alj5r/BfZozVD0NVUQYtE4BEeWPTFFgrAtutZCj7JqVkoMHq/ssQNv
        s6VpYUkozzQLpnFmL67srqkmGg7orcCEhZ3vYZyxw4yIosZ21jnmHaX6JSlqdBE7
        bbf2BKnzstSQStSTIS+59a3qt5rQdvBpyUA==
X-ME-Sender: <xms:tywsZCGxk7qBjXFjQJeWdIssWPTjHPz-Z6O7JtRhaLqugRrwGv7u1g>
    <xme:tywsZDUtaFJpdzcODlU_cNI5gDJXEmHZrmJbOOHPwpVfGq5kY0UD-yr1wnMJKJlJd
    vhV0NAzyWDzpRTxeyk>
X-ME-Received: <xmr:tywsZMI1NUlRYQ5UL6yxuih9SDyx2F7XnCZVqX7CXeoCEbQZWPAVordnT4279ueCZA_KZHine6WY-HFCdhxmHzpJg2qb3mI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgjedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:tywsZMGbrwmgmwzZ9LU1eLDS7bHCGWWKPisElOrplGHvalKheSk1yw>
    <xmx:tywsZIV75BVAMepZ70Jx2G9FexlU9KTNuZRxcgGyp_IAvRBZ1NaWxQ>
    <xmx:tywsZPOxxE5t5l1nIQ8oZZ9COij_1UEi480Se0ABCgfKaz_TcCO-Yg>
    <xmx:uSwsZLA0-RJYXeekNEk0oZ-_cuOr-t6gO_hpF7R6V2ORuidPl-BkKA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 09:57:10 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Tue, 04 Apr 2023 12:11:43 +0200
Subject: [PATCH v3 53/65] clk: si5351: clkout: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-53-9a1358472d52@cerno.tech>
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Lechner <david@lechnology.com>,
        Sekhar Nori <nsekhar@ti.com>, Abel Vesa <abelvesa@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, patches@opensource.cirrus.com,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
        linux-rtc@vger.kernel.org, linux-sunxi@lists.linux.dev,
        alsa-devel@alsa-project.org, linux-mips@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3536; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=6ONkpiYsB+tMJuo7t9nwoyxm7c9Hn1s5NpT9u/U5gOk=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37f/+8uWvrbWcvNrEQFXTr/LSTPc0z53qLyfMTOnS9Kk
 85dVRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACYio87IsCfhWunhHy7rVrkI6HOy1t
 vsDl1UzBM+naUssK75p4ZgKMP/QJboOTZzL6eevHg8fnqP+r4Hzsz6N2u3imrcW3eEXaCCFwA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Spam-Status: No, score=0.2 required=5.0 tests=DATE_IN_PAST_03_06,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The SI5351 clkout clocks implements a mux with a set_parent hook, but
doesn't provide a determine_rate implementation.

This is a bit odd, since set_parent() is there to, as its name implies,
change the parent of a clock. However, the most likely candidate to
trigger that parent change is a call to clk_set_rate(), with
determine_rate() figuring out which parent is the best suited for a
given rate.

The other trigger would be a call to clk_set_parent(), but it's far less
used, and it doesn't look like there's any obvious user for that clock.

So, the set_parent hook is effectively unused, possibly because of an
oversight. However, it could also be an explicit decision by the
original author to avoid any reparenting but through an explicit call to
clk_set_parent().

The driver does implement round_rate() though, which means that we can
change the rate of the clock, but we will never get to change the
parent.

However, It's hard to tell whether it's been done on purpose or not.

Since we'll start mandating a determine_rate() implementation, let's
convert the round_rate() implementation to a determine_rate(), which
will also make the current behavior explicit. And if it was an
oversight, the clock behaviour can be adjusted later on.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk-si5351.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
index bfab05f4fe28..11aaa934da29 100644
--- a/drivers/clk/clk-si5351.c
+++ b/drivers/clk/clk-si5351.c
@@ -1037,11 +1037,12 @@ static unsigned long si5351_clkout_recalc_rate(struct clk_hw *hw,
 	return parent_rate >> rdiv;
 }
 
-static long si5351_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *parent_rate)
+static int si5351_clkout_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
 	struct si5351_hw_data *hwdata =
 		container_of(hw, struct si5351_hw_data, hw);
+	unsigned long rate = req->rate;
 	unsigned char rdiv;
 
 	/* clkout6/7 can only handle output freqencies < 150MHz */
@@ -1063,13 +1064,13 @@ static long si5351_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
 			rdiv += 1;
 			rate *= 2;
 		}
-		*parent_rate = rate;
+		req->best_parent_rate = rate;
 	} else {
 		unsigned long new_rate, new_err, err;
 
 		/* round to closed rdiv */
 		rdiv = SI5351_OUTPUT_CLK_DIV_1;
-		new_rate = *parent_rate;
+		new_rate = req->best_parent_rate;
 		err = abs(new_rate - rate);
 		do {
 			new_rate >>= 1;
@@ -1080,14 +1081,15 @@ static long si5351_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
 			err = new_err;
 		} while (1);
 	}
-	rate = *parent_rate >> rdiv;
+	rate = req->best_parent_rate >> rdiv;
 
 	dev_dbg(&hwdata->drvdata->client->dev,
 		"%s - %s: rdiv = %u, parent_rate = %lu, rate = %lu\n",
 		__func__, clk_hw_get_name(hw), (1 << rdiv),
-		*parent_rate, rate);
+		req->best_parent_rate, rate);
 
-	return rate;
+	req->rate = rate;
+	return 0;
 }
 
 static int si5351_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -1147,7 +1149,7 @@ static const struct clk_ops si5351_clkout_ops = {
 	.set_parent = si5351_clkout_set_parent,
 	.get_parent = si5351_clkout_get_parent,
 	.recalc_rate = si5351_clkout_recalc_rate,
-	.round_rate = si5351_clkout_round_rate,
+	.determine_rate = si5351_clkout_determine_rate,
 	.set_rate = si5351_clkout_set_rate,
 };
 

-- 
2.39.2

