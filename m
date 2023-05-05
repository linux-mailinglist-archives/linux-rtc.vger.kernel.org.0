Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81A936F81DB
	for <lists+linux-rtc@lfdr.de>; Fri,  5 May 2023 13:28:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231950AbjEEL2M (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 5 May 2023 07:28:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231946AbjEEL2L (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 5 May 2023 07:28:11 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D26731A4AB;
        Fri,  5 May 2023 04:28:03 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 115943200A60;
        Fri,  5 May 2023 07:28:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 05 May 2023 07:28:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683286079; x=1683372479; bh=GKKf9EhaXnod3gyBbs+J+eUBVfhftHN+tr+
        h5ZiCjC8=; b=kbHFdePpG/Gw+jbXUa3N+59OdNbjWCGnY7Cu7w0JiZJ7pLYILm8
        vDbvyTjq6fOcKNHwATv7V+Punxh0CEHbch7BiOgl3RaNUBzvoPNEFEH1g2Yey8DW
        eoJd6FzbUTmDkEjPwbRhhNR0oR3azfNoEjurtDQKkW8Kx5vjH1khLn21NkqGX6Tq
        TSR3ohItxvZOm83oKxY5iW9ioy5Cslx5EAx2BMpWT31BYk+RuqfMQ8mtMkLtK+Cs
        Umbqm8XbvLq3hlHI6U6cVUpv1Z1joElbamz/yXjbtatdOpSd8QwUXeSlW5YvuUMV
        VJiwciI726CKODf5gxYmTtLb7m4FpO2neNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683286079; x=1683372479; bh=GKKf9EhaXnod3gyBbs+J+eUBVfhftHN+tr+
        h5ZiCjC8=; b=VQSdl3StcDi4VuqmS+qnbmXi42yDUbAbtTyVcx41J8Gv1C7x0yg
        v3BNe1khACFWAEBGnkPioylZPKsVrRbbjlXuxXzLS+rhvQqrQ6/L9sM4dEuIwPpm
        kg9U8dCxMMV8n3zrO27NJ8Cucqvl9Lgl+xsHXphesxlaE+Qd9gIVfMao6gccfSyM
        icIIRxM5IwBmrFqjnXeAS2bynlJiXwoAc0aRh3y3/Co7tJo0g5wvqUCY5+xr/lzO
        ZM2towkOZJbPBRMXGJikzv/I2Lf78+kogii1ERuKTftPfRFqBMPkDicU9BpIqh03
        0IKVu3ngYN8x6x4wGZLGACEF02+RYhw+bLA==
X-ME-Sender: <xms:P-hUZMjcys2w-kPZZ4f3bmgFNvwB4eKLt2M-_RhjhuJHvxIMK644aQ>
    <xme:P-hUZFDNESLIv7e8p036iehIxsISftCupdL4VqgTphtNW9yowRkNj7u0RbyZ4BsuM
    oU4Fmqq0rov9hdDydo>
X-ME-Received: <xmr:P-hUZEGjKh0MZa6ofw5cQNBVwEi7_1P-4FGLvS2rYjWJoNu-zhTJkvmX2UqkBE2x-TeypubneC0UZD7z7SFJL8PWAcGAVNY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:P-hUZNRUo9y9q-byD5H5fsvyTdalhl5FT7LGt-GeMaT7z-vc6b9igw>
    <xmx:P-hUZJxadfdqS16GTwez_wAfJJ4NRay_XxarJA3CGc1KPdI7dfzW1w>
    <xmx:P-hUZL5YFh2inUBetVrE76QFiaPcdmPBZUb6qSzYbWcQqknVt-tT0g>
    <xmx:P-hUZOrLl97Vm7GL9JNvkkFViKqFc4xDMy0wNcmDk61324_rJYxqSA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:27:58 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:47 +0200
Subject: [PATCH v4 45/68] rtc: sun6i: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-45-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
        linux-sunxi@lists.linux.dev
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2434; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=3Q4a/GiK9m4nbc17ziwEKJILlFgG0TnxAPcyIHI/6dg=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhz5d0iC+vOvuh+erPO47+UwKe3ag7Ne8JU2d16s92qaZV
 Fyd2dZSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAihmcZGS6u8GTslXq+ppOt98rWyZ
 rF7BL521e7spZwuO4U2HO6N5DhF/ObEiW/j/GiF9QK5k5bEOchfrrjZcKpmf139+jI7dW/wgwA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The Allwinner sun6i RTC clock implements a mux with a set_parent hook,
but doesn't provide a determine_rate implementation.

This is a bit odd, since set_parent() is there to, as its name implies,
change the parent of a clock. However, the most likely candidates to
trigger that parent change are either the assigned-clock-parents device
tree property or a call to clk_set_rate(), with determine_rate()
figuring out which parent is the best suited for a given rate.

The other trigger would be a call to clk_set_parent(), but it's far less
used, and it doesn't look like there's any obvious user for that clock.

Similarly, it doesn't look like the device tree using that clock driver
uses any of the assigned-clock properties on that clock.

So, the set_parent hook is effectively unused, possibly because of an
oversight. However, it could also be an explicit decision by the
original author to avoid any reparenting but through an explicit call to
clk_set_parent().

The latter case would be equivalent to setting the determine_rate
implementation to clk_hw_determine_rate_no_reparent(). Indeed, if no
determine_rate implementation is provided, clk_round_rate() (through
clk_core_round_rate_nolock()) will call itself on the parent if
CLK_SET_RATE_PARENT is set, and will not change the clock rate
otherwise.

And if it was an oversight, then we are at least explicit about our
behavior now and it can be further refined down the line.

Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rtc@vger.kernel.org
Cc: linux-sunxi@lists.linux.dev
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/rtc/rtc-sun6i.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index dc76537f1b62..71548dd59a3a 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -214,6 +214,7 @@ static int sun6i_rtc_osc_set_parent(struct clk_hw *hw, u8 index)
 
 static const struct clk_ops sun6i_rtc_osc_ops = {
 	.recalc_rate	= sun6i_rtc_osc_recalc_rate,
+	.determine_rate	= clk_hw_determine_rate_no_reparent,
 
 	.get_parent	= sun6i_rtc_osc_get_parent,
 	.set_parent	= sun6i_rtc_osc_set_parent,

-- 
2.40.0

