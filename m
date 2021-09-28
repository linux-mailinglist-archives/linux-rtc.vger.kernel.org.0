Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DE9D41AA4B
	for <lists+linux-rtc@lfdr.de>; Tue, 28 Sep 2021 10:04:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239462AbhI1IF5 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 28 Sep 2021 04:05:57 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:36803 "EHLO
        wnew3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239313AbhI1IF3 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 28 Sep 2021 04:05:29 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id 3E71D2B01482;
        Tue, 28 Sep 2021 04:03:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 28 Sep 2021 04:03:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=l6+f8N/o4CzHv
        n8mnmbz2zIJFwh4u7TbPKw9aQRkUvM=; b=n5eU77gF7m3rbPoQ6DuuZfycVPMtJ
        UY7eLzE/Q2nQkcEUTOu7BmHb3OoBdTNkngxNZKfgzMsi9jDIGYau4+3lgwQlcMeu
        L6/rz/tV8DNj4i8p4LIDk1gdaKbsx4rRkIIKkLaUdyMspICIfKzB2Wbn1+N6IDxi
        PwqxbheWhGsHj4JkkjlVcrWa7LwpLV/BYUEYOGHooGGbppTssw/OIB2ok8k1w2e6
        8v8+IFqJ9qEC7B5FoRN4wMElUNJ7TobnnHsYqw4JKTYMrLgt54j6Fi3pMeWNTQQa
        Wy4MLIYuE2qQaDGN9K8LoKv3pSeI80Orvr/d70g9VVhD0SL1xK61Rr/5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=l6+f8N/o4CzHvn8mnmbz2zIJFwh4u7TbPKw9aQRkUvM=; b=kWc/DHWt
        bsK7M+veN52q/bybsVtsKK3EcGgSJ65PgKTUaNfb3777IiiGm/oeKSKSsGWicHCO
        /uA6fCfst491/f6m7RYffh1gFJee9uWxZ7es15CdbW646l+CBuEqIjw8euPzhGBV
        j1h3fxrrYhfUuughYVnuq5h6mL7RcJ/h34vksmnQPjYqVuy7aQ1cScHccESFDH8j
        CLHCJcOGtWeepUVhSMQP5A4qVgqW6bdZxYkp+cu4zriPhAisR9OOs9wh2OQNi3KF
        OW5ZJetVAiVo6adOS7M8wn4QQmpoZyMKJhXxDOfZINcRpfWbmgiZq9nEb2f8y5PY
        ocq0E1jhYB/lzw==
X-ME-Sender: <xms:YcxSYedCYdJmgmupv0ygmKVwxto49-tPUe9UCAgKkoe2KzGW42t9TA>
    <xme:YcxSYYMibzyzQMn8YF3Tbdr-U-C97_zsI6jB23DKiLMXDxFUB85oy575JcSVGqSlh
    a76GXsF5DOw8CMmvQ>
X-ME-Received: <xmr:YcxSYfi7d_bVuJM3dWgwj5YcjZU1DzL0G_6Bgg2-jPiHE9ZO-fwLnFHhQzg-dZpxBCpWsZjrYvD2pRTNS7rEpW0WXyubzGz1FL6JzdqV99bP3z5wOFGsy6V9Orx4AVu6MNkxow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejledguddvfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheej
    vdfgjeehueeinecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:YcxSYb9EXyGj3qpGOS_4BYS3lMBStzSJJgPyUoYTeFS0PJMQ_OKcug>
    <xmx:YcxSYaujqwu-rBo8tkUX0TqgKLby1euQ5ApG9-s8cpLhqvbsY6N4Zw>
    <xmx:YcxSYSHuqtm05NAUJj7uZYCVHu2j30DSTN9IWcPsehs7_KqnZrnH_g>
    <xmx:YcxSYfN6X3kpCCCIbqKRgjtLB9pQLBYn2s3Za0_VJrkqNB744sjUhVzpgTs>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Sep 2021 04:03:45 -0400 (EDT)
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
Subject: [PATCH v2 4/9] clk: sunxi-ng: mux: Add macro using CLK_HW_INIT_PARENTS_DATA
Date:   Tue, 28 Sep 2021 03:03:30 -0500
Message-Id: <20210928080335.36706-5-samuel@sholland.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928080335.36706-1-samuel@sholland.org>
References: <20210928080335.36706-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Some muxes need the flexibility to specify a combination of internal
parents (using .hw) and external parents (using .fw_name). Support
this with a version of the SUNXI_CCU_MUX_WITH_GATE macro that uses
CLK_HW_INIT_PARENTS_DATA to provide the parent information.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
Changes since v1:
  - None.

 drivers/clk/sunxi-ng/ccu_mux.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu_mux.h b/drivers/clk/sunxi-ng/ccu_mux.h
index e31efc509b3d..f0e3094f29e4 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.h
+++ b/drivers/clk/sunxi-ng/ccu_mux.h
@@ -72,6 +72,20 @@ struct ccu_mux {
 	SUNXI_CCU_MUX_TABLE_WITH_GATE(_struct, _name, _parents, NULL,	\
 				      _reg, _shift, _width, 0, _flags)
 
+#define SUNXI_CCU_MUX_DATA_WITH_GATE(_struct, _name, _parents, _reg,	\
+				     _shift, _width, _gate, _flags)	\
+	struct ccu_mux _struct = {					\
+		.enable	= _gate,					\
+		.mux	= _SUNXI_CCU_MUX(_shift, _width),		\
+		.common	= {						\
+			.reg		= _reg,				\
+			.hw.init	= CLK_HW_INIT_PARENTS_DATA(_name, \
+								   _parents, \
+								   &ccu_mux_ops, \
+								   _flags), \
+		}							\
+	}
+
 static inline struct ccu_mux *hw_to_ccu_mux(struct clk_hw *hw)
 {
 	struct ccu_common *common = hw_to_ccu_common(hw);
-- 
2.31.1

