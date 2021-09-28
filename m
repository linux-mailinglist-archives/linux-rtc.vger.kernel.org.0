Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 621A841AA5B
	for <lists+linux-rtc@lfdr.de>; Tue, 28 Sep 2021 10:04:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239469AbhI1IGI (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 28 Sep 2021 04:06:08 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:36755 "EHLO
        wnew3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239324AbhI1IFa (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 28 Sep 2021 04:05:30 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.west.internal (Postfix) with ESMTP id 6EB672B01619;
        Tue, 28 Sep 2021 04:03:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 28 Sep 2021 04:03:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=QgH4NWp1cwKin
        oSU/DCR2ZQ5c69368eYkorZC4IC6nA=; b=l7yQfD4Vq8aTGBTn5WQZJl+NLUFpU
        zLbYv2tZ+C+y4Fq+6/qLQR50CPGZYNIAGDCLtYB37rfTf2HPfG5DJNE3RbkNIbKn
        7IcWvH8KpXq7lejQ14Ka4tQI6oyDVj31tbcJVv+2p7WNR+lanAUTaRsIqljUExb/
        g9g+030cCC9b68gfGbhjbbOqLAHyqAzarv7JFI67WjZkaklwGR3422vwgGxTP1fg
        OMNKILVARhSt2F3s80xVK1bHQiki9A3Jaw7+SD3gdqzjvvp5TNt7QMJnAbl6yeTs
        80cpBVCuEtzUt3M6yBwe0i5fqvuf3/59HJBHYj1lvwOfwx14bQin1MK4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=QgH4NWp1cwKinoSU/DCR2ZQ5c69368eYkorZC4IC6nA=; b=OkO4r9kw
        +Q+RSemvmgeGoD6gOI+jb0RRzFPHYyZXyYvUC2jX2J3DMFmaWwXMx1fzZCwBGMZY
        dD6wzX0VyWDb0exvt6e72G5gLlQ2kcDb+BnuELTR1q5VHwMUiiecRK8rZZXCOX03
        0a8HGpLCWyu5VaMdtrVe5k1yFUniwtdMbQKVKm7IqHUJn8x4Z/Rxcbyr7NRSBqrB
        nN3OcTlpaqc4kKG48ythFF53NtGpgveS52y/2/zPpIur5+5EB+C26CMdRhKXF3b0
        r26Hsb8cvYFchy2uDWBZVJVgCUHsInP09JKaDwPztaK+9oe0EOy0bbOJ+jyC7VDq
        QnWgZdmTsECOrg==
X-ME-Sender: <xms:Y8xSYbh5MyIQ7qS9JI1lJ25U2VgIIOAQi-GgzWCRwmmXd_M1c3iNcw>
    <xme:Y8xSYYA_3NxSZoLnl_hMkj6elabJBXlFn1FDjR4P11TPlHN8Uj7Ct90oZvy7Xg8xD
    rOO3ZVGTQIn47L7fQ>
X-ME-Received: <xmr:Y8xSYbFhNGzHV5wKPduobUnG71BQiG26AmEkOvbikL5skKguyHGKIJUocU8M8aKQpCLV7bJs1Hu04FVZ8YEmOh6-rOj6LEYiNGL87w2Iz9qBhT9lLwV2V6t6I5zQwp003RCzdA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejledguddvfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheej
    vdfgjeehueeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:Y8xSYYQKIvS3StnKhebDLA91RSGlhoKXKGcsNemVZRQ84uyDBXUGlQ>
    <xmx:Y8xSYYzW5O1qlshDCe0Ghshpkw6iUPiXHau6v5HEjArHHNdElJQpbg>
    <xmx:Y8xSYe69J5XHKDtYkAVsDfUolgSpYYINqdlR_6iQ0b7oFdX4S_yI5w>
    <xmx:ZMxSYUgnXAgWnmuZcPWRezc6mIBP7ddg098e7qobci6nX6qFRbb7CofH2lc>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Sep 2021 04:03:47 -0400 (EDT)
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
Subject: [PATCH v2 5/9] clk: sunxi-ng: mux: Allow muxes to have keys
Date:   Tue, 28 Sep 2021 03:03:31 -0500
Message-Id: <20210928080335.36706-6-samuel@sholland.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928080335.36706-1-samuel@sholland.org>
References: <20210928080335.36706-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The muxes in the RTC can only be updated when setting a key field to a
specific value. Add a feature flag to denote muxes with this property.

Since so far the key value is always the same, it does not need to be
provided separately for each mux.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
Changes since v1:
  - None.

 drivers/clk/sunxi-ng/ccu_common.h |  1 +
 drivers/clk/sunxi-ng/ccu_mux.c    |  7 +++++++
 drivers/clk/sunxi-ng/ccu_mux.h    | 14 ++++++++++++++
 3 files changed, 22 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu_common.h b/drivers/clk/sunxi-ng/ccu_common.h
index 98a1834b58bb..fbf16c6b896d 100644
--- a/drivers/clk/sunxi-ng/ccu_common.h
+++ b/drivers/clk/sunxi-ng/ccu_common.h
@@ -17,6 +17,7 @@
 #define CCU_FEATURE_LOCK_REG		BIT(5)
 #define CCU_FEATURE_MMC_TIMING_SWITCH	BIT(6)
 #define CCU_FEATURE_SIGMA_DELTA_MOD	BIT(7)
+#define CCU_FEATURE_KEY_FIELD		BIT(8)
 
 /* MMC timing mode switch bit */
 #define CCU_MMC_NEW_TIMING_MODE		BIT(30)
diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mux.c
index e8149f3c2324..da5ad4b87440 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.c
+++ b/drivers/clk/sunxi-ng/ccu_mux.c
@@ -12,6 +12,8 @@
 #include "ccu_gate.h"
 #include "ccu_mux.h"
 
+#define CCU_MUX_KEY_VALUE		0x16aa0000
+
 static u16 ccu_mux_get_prediv(struct ccu_common *common,
 			      struct ccu_mux_internal *cm,
 			      int parent_index)
@@ -188,6 +190,11 @@ int ccu_mux_helper_set_parent(struct ccu_common *common,
 	spin_lock_irqsave(common->lock, flags);
 
 	reg = readl(common->base + common->reg);
+
+	/* The key field always reads as zero. */
+	if (common->features & CCU_FEATURE_KEY_FIELD)
+		reg |= CCU_MUX_KEY_VALUE;
+
 	reg &= ~GENMASK(cm->width + cm->shift - 1, cm->shift);
 	writel(reg | (index << cm->shift), common->base + common->reg);
 
diff --git a/drivers/clk/sunxi-ng/ccu_mux.h b/drivers/clk/sunxi-ng/ccu_mux.h
index f0e3094f29e4..1758dcc82ca6 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.h
+++ b/drivers/clk/sunxi-ng/ccu_mux.h
@@ -86,6 +86,20 @@ struct ccu_mux {
 		}							\
 	}
 
+#define SUNXI_CCU_MUX_HW_WITH_KEY(_struct, _name, _parents, _reg,	\
+				  _shift, _width, _flags)		\
+	struct ccu_mux _struct = {					\
+		.mux	= _SUNXI_CCU_MUX(_shift, _width),		\
+		.common	= {						\
+			.reg		= _reg,				\
+			.features	= CCU_FEATURE_KEY_FIELD,	\
+			.hw.init	= CLK_HW_INIT_PARENTS_HW(_name,	\
+								 _parents, \
+								 &ccu_mux_ops, \
+								 _flags), \
+		}							\
+	}
+
 static inline struct ccu_mux *hw_to_ccu_mux(struct clk_hw *hw)
 {
 	struct ccu_common *common = hw_to_ccu_common(hw);
-- 
2.31.1

