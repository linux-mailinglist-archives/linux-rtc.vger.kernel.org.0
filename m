Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65ED041AA53
	for <lists+linux-rtc@lfdr.de>; Tue, 28 Sep 2021 10:04:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239501AbhI1IGC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 28 Sep 2021 04:06:02 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:33561 "EHLO
        wnew3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239287AbhI1IF3 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 28 Sep 2021 04:05:29 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id 098862B0146F;
        Tue, 28 Sep 2021 04:03:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 28 Sep 2021 04:03:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=Gebz/40zT+RiT
        UUUWaWiMLhZd+FwHe7fYQoeo7vkMek=; b=t9WhNWrIl5jFdMawjprxVELGu443e
        HXX46hFbuEY2Hf8PwYujgRQdN6TBk2odSNxf/j3ZYIxqsoVNTDr8qo9bpUW72jAd
        YxSxBpq3vMsDd9XiwdaTMKbq1VrqN+S/t/RzTIEqxrebZAdWgle3vr2zp3NaEDD3
        EXA9OeRFaS2DYFCNj9bx6sK/L8CgyaUlblU6gqVF96vGZyvIdK0z+fbstwkihqII
        x0qIs83kD2ayuM6Ql8JpZBLaZMhGLa9wJuv9ilDpTJ/mu67CNWhpo+ZCWs2yJC0K
        XRdz9kz4zS0L4pfhTlWDRzwOyOEgMXmOjal3jZVVPFd0zLiwbuC8QZvRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=Gebz/40zT+RiTUUUWaWiMLhZd+FwHe7fYQoeo7vkMek=; b=ZyezsCjj
        G/ScdXrnh6/8LuHY7lmJmGOMvqPJcLpi9hIvycADHrSHddcWQnDajdh9qTWyexkd
        TMGfmmERwqhnj4SWefcmaS7ynH7bzF18JvkJJuJNqzEEq+BVFdvY6yIdqEmgo9VN
        Ay6uxLeoK9RCHKsoV5z+EHDXHpicNkkRDIvaOA+9TBLLNC0skJbrYKwZ/jFkX/HB
        /0EPJsGIkI3FI/AepEitzffKuJWXvjVeizk2tm0WDpWfZWB3xvjYxwjT6wgBCLhg
        7NvQITvIR5ZA1O8dF53M2r7O5OgVOjapkOXt3ti4SYLel0XRVvn+ct3KEjFgQaw3
        xLyYMQwAs0qYTg==
X-ME-Sender: <xms:X8xSYYt3g45JpfgwJRntMPoxAue5ICI4J2MhE5A3dOKVcDZFZWUpSQ>
    <xme:X8xSYVfketHURl_Zf676NPQA-fGT3GpoxJTxLUl0L4-yQ13ZMTok-4xLYwbepyyr_
    ycuqxDyuw8by6qU7w>
X-ME-Received: <xmr:X8xSYTy7DYTiE6jmXhV6ZguMECALXLEgJvUNucfy6nOlwRr3WHL4pIG68cmhdxPVlmLId6TRwMFThhUlgWibGZWCW8t-oLqgajMfP6QdJQbg4QOZz-EA6LRZ1UYAarEpj-SfJw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejledguddvfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheej
    vdfgjeehueeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:X8xSYbMMRHiCiEMW5wsqV6E_bBFZUtqllQdeV_-JiRIs2DJ2v9OXVg>
    <xmx:X8xSYY_-qYMzI36y5lllSQ9aohTzEDmvzHQqaelEx891ZqeWi7x5tw>
    <xmx:X8xSYTV50Pg6Tr19QLkfjy9hIcufJTM36M92gXxZYUPnUdY3ldOFFQ>
    <xmx:X8xSYSeDHyFO5Lqqz9PU1WB3HmqxABxjoYHg97fTFd1WvDYz7RuDN2CNsmw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Sep 2021 04:03:43 -0400 (EDT)
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
Subject: [PATCH v2 3/9] clk: sunxi-ng: div: Add macro using CLK_HW_INIT_FW_NAME
Date:   Tue, 28 Sep 2021 03:03:29 -0500
Message-Id: <20210928080335.36706-4-samuel@sholland.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928080335.36706-1-samuel@sholland.org>
References: <20210928080335.36706-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

To use the external clock references from the device tree, instead of
hardcoded global names, parents should be referenced with .fw_name. Add
a variant of the SUNXI_CCU_M_WITH_GATE initializer which does this.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
Changes since v1:
  - None.

 drivers/clk/sunxi-ng/ccu_div.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu_div.h b/drivers/clk/sunxi-ng/ccu_div.h
index 6682fde6043c..4f8c78a4665b 100644
--- a/drivers/clk/sunxi-ng/ccu_div.h
+++ b/drivers/clk/sunxi-ng/ccu_div.h
@@ -166,6 +166,20 @@ struct ccu_div {
 	SUNXI_CCU_M_WITH_GATE(_struct, _name, _parent, _reg,		\
 			      _mshift, _mwidth, 0, _flags)
 
+#define SUNXI_CCU_M_FW_WITH_GATE(_struct, _name, _parent, _reg,		\
+				 _mshift, _mwidth, _gate, _flags)	\
+	struct ccu_div _struct = {					\
+		.enable	= _gate,					\
+		.div	= _SUNXI_CCU_DIV(_mshift, _mwidth),		\
+		.common	= {						\
+			.reg		= _reg,				\
+			.hw.init	= CLK_HW_INIT_FW_NAME(_name,	\
+							      _parent,	\
+							      &ccu_div_ops, \
+							      _flags),	\
+		},							\
+	}
+
 static inline struct ccu_div *hw_to_ccu_div(struct clk_hw *hw)
 {
 	struct ccu_common *common = hw_to_ccu_common(hw);
-- 
2.31.1

