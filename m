Return-Path: <linux-rtc+bounces-6903-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HH3+LX6CS2p8SgEAu9opvQ
	(envelope-from <linux-rtc+bounces-6903-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 12:25:02 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E4470F1DF
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 12:25:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=S37kx95m;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6903-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6903-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB2743245B9B
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Jul 2026 09:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CE4044CAFB;
	Mon,  6 Jul 2026 09:32:41 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2D042CB0A
	for <linux-rtc@vger.kernel.org>; Mon,  6 Jul 2026 09:32:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330359; cv=none; b=DXk1slu//+5EDu8FW4VRuWwZJ5uUPvSTMKSqp8C+KmSsizQYZCN5v78ZJ2GiEJksD6hTuQIVWn2iYgBRyeYOsG5EunJtMUy+5cKHJmqF2AOAuRvAhrGTg2osavPaANxl9ipk/GY3p5GF5jWKe+9joiRceBeI336LT78gd6svuRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330359; c=relaxed/simple;
	bh=0wL9DFcZk2JYigmbAzm9ZXDoHfKQS3sFzWW4YpBPgNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IlF2adnV9Yhre+YXksiq1fI9xOJDNZ5olOy8myLNtyqViXKHEBo/yX9jXQObYdPMfEfottt7CyuzNteV6YlwJE4m79mRtc7hrEGfZgQvOYPEUV+wPxZqgIumItsCwLx/Izdc31n11+lawpX/aGrSeE8BwdMn7NMz24aqUJEv7aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=S37kx95m; arc=none smtp.client-ip=209.85.128.48
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493ce08a75bso11312845e9.1
        for <linux-rtc@vger.kernel.org>; Mon, 06 Jul 2026 02:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783330353; x=1783935153; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SRVceNWKrizopvzD3aCqIwZgJOVArB+G3JrWb7+Dpwk=;
        b=S37kx95msxJaGoT+W6QX8zv6JZ3pD6eP2P714H+3zgFgeJiDeVVg4RfhcRrkUr7Pr7
         UriD9Z4PPgX/tPhpp/VTOUwWxrB218T1UDHrgTYmQEEBpaPStv+BoCj7BO+0xvL9fxrT
         +27BvdNqNlWF9zw6YcYIExLF4MagtNzBfKCdzX2U/p5PB/LB9yGvwP/mCFE333Yacc82
         jGxrd4ybZMsivrH3Y9waD0gyv6xu7DHloVb0BV9vYETRcpQlp6ZgnDvxrhXY6JaFWobJ
         IF8SC8EzYs1S3sj1D2YxOU7dHovsg0NS6U3QPVwNMgkIbfCn3sgmsokGYZgf+bKDeJtY
         eIrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330353; x=1783935153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SRVceNWKrizopvzD3aCqIwZgJOVArB+G3JrWb7+Dpwk=;
        b=Vyy4FSyqcY2tg4oOZiOd7mGo2biLaI6mIWz8qId9tapI692rdBgw5vFEL4MCtyBdv2
         uFgvAGsXt+mQg7IlL+XXetk69Z1iuIsSPALOowI1tQcrZtvunEZU4kXP4UDZ8BxnKKg4
         gspHqyplqP0cW0wwHPTz3/UZQF2zbRZpnnZ/XBJ5wafBoKQSX1whWGjjekNqC1IK8DK3
         A9KgBHQ3f0fxKSVKdGiELGxlCZhVh5Z7u3IOG0WWt6/+FVb1R+gqW7qHMD6cHaCnrMx5
         HNqNHXMPrdtceOwup2ItKtNYLFcTNJ044HMCmtN+nW5fiuMss1Vv0wTSkXAM0hWwrjOW
         3BCA==
X-Gm-Message-State: AOJu0Yy6TEHuQ6MOCEl+PkLb3u3VJ7rcDDAWAWj6XU15beS+frodowz5
	8EAY6/jGSz6OdzM1dHFRftSuIuptkpC2oEdMdnz5TmSOAhya4L54kwcDawx2c7vDFys=
X-Gm-Gg: AfdE7cmEI7dWGt7EFAMsRT+U47yb3Ntz6HV9ObK2v06XQh/GOpEI19RwblS5Jhg54PP
	QaxUNtUnnrMnfjs27E+I2Y3rVZtuOLKkQ0yKqu9bw7gLIZsOji1Iz5M1/PtRcFZ16mMapcnmbCF
	0fzI/McDSCbInBFXSRCFJqN7W51jMh7VKUbG50KXN0LUY4vNgv1XXsy4vvVuT3BL/E7QFFZXFZN
	5uELr0XrgAYF8rqbho+Sam333xZ9ops82oAnglTmhWBPrlLYa1DCC8EkwvyPvG1T2On32bofHii
	73mrUHHilcizeoJ8uSWQ+nW411BcP5fAkpvnN2ZXB945LMoEW9aNQZgAzkK/a1F3LgmPgo08f6G
	2BFnLfC3Ihm7069MmavIeAvW1Kcb1MDruF3MGQN2EzDb6NV4f2cSTllqSkSq6lFIF6NIMtub1ld
	K6vqNYUiy4plo=
X-Received: by 2002:a05:600c:34c2:b0:493:d9f7:a3cf with SMTP id 5b1f17b1804b1-493d9f7a46emr40792585e9.17.1783330352689;
        Mon, 06 Jul 2026 02:32:32 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1495:8c97:96f4:dff8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa0f21328sm23563937f8f.32.2026.07.06.02.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:32:32 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 06 Jul 2026 11:32:11 +0200
Subject: [PATCH v4 3/9] clk: sunxi-ng: fix ccu probe clock unregister on
 error
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-a733-rtc-v4-3-f330728db3d3@baylibre.com>
References: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
In-Reply-To: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2172; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=0wL9DFcZk2JYigmbAzm9ZXDoHfKQS3sFzWW4YpBPgNE=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqS3Yi2lp9VUHi+gso0+D9KwXzeep3V0RfyNlFD
 8oFLIsmOIuJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakt2IgAKCRDm/A8cN/La
 hRUhD/43mj/jSnmTPc6rmiE4hnV86LDOF0szU0PUXIpytazGHAtIxmIDIlDKZTKCzeCtFb+X2yN
 O/s/rHXB1C+BZ9MaOlMCYM0niirJAu00pMeBFGETxKG3I8YRHs+rNdJmC6VoqYC4z0Xz6ouUuB6
 F7H4bIvuRdl/OyxsKmlj68XDBC6sEmE45CWMw3K495dkJO2MVRzo44+PdOeS2CBMGaqyMm6rlLQ
 HfcyybFMnwendBHYvURq3Tj5X7jtU2Z7OU874xC513CD24FpoPPB9XlZEV7WC9VtuJATL+FDQKU
 quYzgL6d0ZupraF4eBWGwMhmS6c6K7XL6utTkJcVwkriLHpqpG7EYAIFYLhv3f2qeXg6Dhp0FTQ
 MT8mWJzoeWF0osIDidUxMJXyVokwTSLbcz9hl+erkiIcpeBCVAK8lDg6jGlI3n7cJmfobT24H0y
 Oav4Vbj5g5N4MVMWj+xPc2USxc/fHEVfFUb51Ah8xbogDUhoqXVN9TAluM65k0ZT466yFRMs7XP
 6584kIeGiCARD+aRYt7m+Hbu79oTxky41yMn7qDhoh9x8jkZLXaO6E2yTxjwaKrOJTf/1xRNgex
 wCMFX/3ZZOlE8ra7Ib9VghVqUgvZe8/5yH3ZQweTa5lMCEdY5u4Sj8XWdBV6IcUprwnLKdIf/fB
 FYqd09N7mJzneZw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:junhui.liu@pigmoral.tech,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:mripard@kernel.org,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:sashiko-bot@kernel.org,m:jbrunet@baylibre.com,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[pigmoral.tech,bootlin.com,kernel.org,gmail.com,sholland.org,baylibre.com];
	FORGED_SENDER(0.00)[jbrunet@baylibre.com,linux-rtc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-6903-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbrunet@baylibre.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,baylibre.com:from_mime,baylibre.com:email,baylibre.com:mid,baylibre.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 11E4470F1DF

When registering clocks with sunxi_ccu_probe(), the number of ccu_clocks
and the number of hw clocks might be different, eventhough they usually are
the same.

If they are different, it could lead to out-of-bound access or registered
clock left behind on error.

Use a different variable when iterating on hw clocks so every registered
clock, and only those, gets unregistered on error.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260629131254.7E34C1F00A3A@smtp.kernel.org
Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu_common.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_common.c b/drivers/clk/sunxi-ng/ccu_common.c
index 1c083b4d0b7e..43d8eca6abee 100644
--- a/drivers/clk/sunxi-ng/ccu_common.c
+++ b/drivers/clk/sunxi-ng/ccu_common.c
@@ -114,7 +114,7 @@ static int sunxi_ccu_probe(struct sunxi_ccu *ccu, struct device *dev,
 			   const struct sunxi_ccu_desc *desc)
 {
 	struct ccu_reset *reset;
-	int i, ret;
+	int i, j, ret;
 
 	ccu->desc = desc;
 
@@ -130,8 +130,8 @@ static int sunxi_ccu_probe(struct sunxi_ccu *ccu, struct device *dev,
 		cclk->lock = &ccu->lock;
 	}
 
-	for (i = 0; i < desc->hw_clks->num ; i++) {
-		struct clk_hw *hw = desc->hw_clks->hws[i];
+	for (j = 0; j < desc->hw_clks->num ; j++) {
+		struct clk_hw *hw = desc->hw_clks->hws[j];
 		const char *name;
 
 		if (!hw)
@@ -143,7 +143,7 @@ static int sunxi_ccu_probe(struct sunxi_ccu *ccu, struct device *dev,
 		else
 			ret = of_clk_hw_register(node, hw);
 		if (ret) {
-			pr_err("Couldn't register clock %d - %s\n", i, name);
+			pr_err("Couldn't register clock %d - %s\n", j, name);
 			goto err_clk_unreg;
 		}
 	}
@@ -186,8 +186,8 @@ static int sunxi_ccu_probe(struct sunxi_ccu *ccu, struct device *dev,
 err_del_provider:
 	of_clk_del_provider(node);
 err_clk_unreg:
-	while (--i >= 0) {
-		struct clk_hw *hw = desc->hw_clks->hws[i];
+	while (--j >= 0) {
+		struct clk_hw *hw = desc->hw_clks->hws[j];
 
 		if (!hw)
 			continue;

-- 
2.47.3


