Return-Path: <linux-rtc+bounces-6859-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EKkcH0geRmoQKQsAu9opvQ
	(envelope-from <linux-rtc+bounces-6859-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Jul 2026 10:16:08 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 255BB6F4AB2
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Jul 2026 10:16:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=ZE6IuqGW;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6859-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6859-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 12742300824F
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Jul 2026 08:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02E1B4218A0;
	Thu,  2 Jul 2026 08:10:53 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657D6420E92
	for <linux-rtc@vger.kernel.org>; Thu,  2 Jul 2026 08:10:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782979852; cv=none; b=FYFUs2U4k9Q6ZSp/Rz01jOo0d4TIDjeb80b3NRkJSXX1lKOFoPiuWZ6+V0ujNzs16984hUhlKkH6a/PJqhzbTVfQaLwkqH4Z9pp5D7hFKVHdXLMRNQ2REjBDNsaFE7jab6H8hB9jgXYYKCzXGTDsSb/2AkJwRc67Hhs3kjDb1W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782979852; c=relaxed/simple;
	bh=xEow9YFv9tWxKuTGRmYBanqZYgnlQCz+XPTruWbAxlY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mLLSVPdWUcyz167lXgtnOK0DUbZKfdzgSU5PL5eqtrsA7OxONrHQgA1SE+5lpUttkk3zYEy9PY2BazEfsUpRU08AzZfyoFOBYEvHIK8z3aIlnjOtp7k9IOCUYKpgrqNktEwj7+0NMEsyi2Evf8mMRbV8YHC4HF6Tqv60LkSzWJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ZE6IuqGW; arc=none smtp.client-ip=209.85.128.41
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso6436015e9.3
        for <linux-rtc@vger.kernel.org>; Thu, 02 Jul 2026 01:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782979850; x=1783584650; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n4DUzlDYde7+nlA7K6gg98zrSYXmo4pVwxHlPtRIQOc=;
        b=ZE6IuqGW/XCDIfi+4yOik3qLAUFuqsFD646rK+ZhZKnIc73JkNI1iuuBlun0SCCdHr
         CdHjCCtY6nQamF+4nDuxtte4Ia4CAiGdlEoAahzdhGErcfInrhm6v45b3zZJhnauEac6
         yBWHBpNpEllCbRoz5MdqOAXZZ1BxvN5pjp2YgbXiS4XpJXZaXUsePaSf+wC5QS4It/nW
         VPreHekyTuWSqay+MbirOTYifQGNAbBAHG7VSLkIRCpZ9e7Kg43bJbcYSl2k5EtmvdSO
         xxFvm2w+1yxbEl2SX1+e4J8RegE0CJDEIIgaK7ki2UhyvBR9VpRSKIupfjXTx8mkK4Vq
         6gUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782979850; x=1783584650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n4DUzlDYde7+nlA7K6gg98zrSYXmo4pVwxHlPtRIQOc=;
        b=CHtd+kRWtryGwVSRLePcBqJU385TGqm2/QXwazhBYc7XBKF4ob5hFlebqxRs0wTPnR
         qDkrlBdk9BOll6ilAQm3v7zzuPNB1BuRJvgHRKZ6upvE09T4mnewK+yrNAlETF7lbipy
         +6zWAZ7/Q6r4jF4UfLMjusYdNQ3Ttsqwo8gKXFux5+v9So+B1m5AauMGV9zklwFl3E++
         nyo7DvWkiyTiaSOR0xFMSb8ZBBZ6OtI9ace1QegXaCo/x+TJ5/NLmU//UqZwfvdmzq2q
         LwUrBp4NedFGyOaHheOx7HZrfEya1J+0FpE5ckO2vBJll7E/cCco/wUnqLXUUVwQN9An
         T+xg==
X-Gm-Message-State: AOJu0Yy+Us2rsC4U2E/3LARR8SiiLCTiKX0s1s2Hkez/2dTFTAkJ7fjz
	DC0f2ptRg2sKUwO0AS3PvM/tY8u570J94w4Fo2M9NdQ+dy8l90LrWo0BO03wpY7s8Zk=
X-Gm-Gg: AfdE7clTdvn772gA85fGr/tGt32tOf/y/8dwObmGVuQ05sdDMPsiVUP2cyQKXs0VfUM
	zNoxelK4gxM6ozUW8ng5vyzCxkIvMCfmamKjQvw9VMXcOc0gEXT9uvyp+ovAFND1V2a+siO/Oma
	MnIuOb7lBkZrMp0ZpTvJDhWWZ2SN66ToRtNNvHPGx2X+cZiEXa8v1xcjtH/qup9ZXBXWYotAAdi
	oqIy+/5ULblGqVzSw2p3OHayrmwqwrLPxd9/SrS0RQt5G3GGECjEKRZSO+qcr1v9pel+lAID9wb
	uhBBGNIDehS/0A76hmKBaGAh33kzRkhD2O6F1e+BYU2iBM7gGTf3AkYT7Yaq7jdeRLOP1qyzNfL
	xSQY/dyIR3hKNvEQmmmFXI96ue9/xzE5lzkNumWAPca7mhkcTujSgnnefuTitGrhbqkEXkOFTs7
	KofyeS+Tk3zUA=
X-Received: by 2002:a05:600c:4ba1:b0:493:af56:8e64 with SMTP id 5b1f17b1804b1-493c2b9e74fmr46177105e9.32.1782979849885;
        Thu, 02 Jul 2026 01:10:49 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:2e3a:7dcd:d2a4:6556])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493c636ea60sm26008745e9.3.2026.07.02.01.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:10:49 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 02 Jul 2026 10:10:02 +0200
Subject: [PATCH v3 3/8] clk: sunxi-ng: fix ccu probe clock unregister on
 error
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-a733-rtc-v3-3-eb2580374de6@baylibre.com>
References: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
In-Reply-To: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2127; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=xEow9YFv9tWxKuTGRmYBanqZYgnlQCz+XPTruWbAxlY=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqRhz4y0UzWpG2vq9pNsBeXNaVPQAXpCwoH/CqF
 5UKSr9tabGJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakYc+AAKCRDm/A8cN/La
 heBcEACG7fRdAKaggYdYW+Kmy5AukfFGo0WDxvZitKeqqERRluPiowtv+fiW72Eh+xmI6rB88xT
 A9NgJkcYyLsMKEa30ZOg6paZS/e1Wyfg3apNWs04HXG/SCHZ1TO5FUrXxjDAynwHEvOprtof54n
 ZLep4U6cVL48VOhgvX+nqF5WLDhVSQbK1jnIVR2kaMNj7a/240tzf/mAmrrUKOJMVH5qzNP1+qZ
 /PR38HOQLqe+7u8mM3QBRDraZ2jCio4OxQy1IgVN5hXCEXCiCf2FmN+bmfZ/jcJNZlBJ9GPgz4W
 G8PAZ3AvDVIcT8KAtgqJ2tCqZ3yeKPrXB28FAJc+40ocBqjJBa+LUWI+KqyRQe014Xyl/FMvbSf
 gQ3jd+LBj+Rzu0p6SMgkS1qdOhtsYBT3FX4LMuKFGeU66/pWtS8JorozPyetUsdhu1jVEafMysx
 EAdBUqHexlFlrIaiRITCK2q72pAO87AEBno0EjyJp50T3JM+X3TuZ3Q5DxPQeiLA6go+cc8p3yn
 w5SNHC+GNWQK3GXnqjK5KaUQkw0IJu/QZIk+UadfkrPS8A6qY8+MmDPytdCqXoXBn5SzIHQ6uGI
 lr7rCwIHXbb0Zb9O2YfDG2T/vooP48C9zFfsO9fx6pXw5qjqEWU64yAokgm1wxnnYPZJjKY4a5s
 LgBFgUmnX/HASMQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
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
	TAGGED_FROM(0.00)[bounces-6859-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:dkim,baylibre.com:email,baylibre.com:mid,baylibre.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 255BB6F4AB2

When registering clocks with sunxi_ccu_probe(), the number of ccu_clocks
and the number of hw clocks might be different, eventhough they usually are
the same.

If they are different, it could lead to out-of-bound access or registered
clock left behind on error.

Use a different variable when iterating on hw clocks so every registered
clock, and only those, gets unregistered on error.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260629131254.7E34C1F00A3A@smtp.kernel.org
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


