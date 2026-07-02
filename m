Return-Path: <linux-rtc+bounces-6862-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xzWxISYeRmoGKQsAu9opvQ
	(envelope-from <linux-rtc+bounces-6862-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Jul 2026 10:15:34 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6136F4A9B
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Jul 2026 10:15:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=PwgUO5xd;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6862-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6862-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 04AFC30911D1
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Jul 2026 08:11:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CEEF4229CB;
	Thu,  2 Jul 2026 08:11:00 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C077B4229C2
	for <linux-rtc@vger.kernel.org>; Thu,  2 Jul 2026 08:10:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782979860; cv=none; b=PfsDJ3+hvwsIwkIPOTezer9Q6sXLsn9IKXUqw2+smGX2v34RQkDpOxr0sd2xpwtnsX3wcXWZyPGh2mlTXXSQoOD6MisI2BKP2Q3cWFFHHb9axGV9at/UH6NEEj/opV/f3pbPWVlG9CGy0EI9Crgowc/xC34eggJpmt5QsXiZJMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782979860; c=relaxed/simple;
	bh=2L2d0QfPA9w8m9zLHFuDIP+92mtPVG6eY7jP2BAgsNc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yap+5qylRNDoRQZyplZLYjWNzRSC3xa1yIzbAv+bSKZ6O84WNkBh5Sa98F2Lw0yYVRQD34FnqH9+ByWNKwPSDmg8BO4yrSss4T0NUUXlMEd8EX9GwlMWLzLT+YceKm21l6MsW4Z/YQh1U2Fo+ZdUXGRSgRGkkmfcNr9vMxM5vkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=PwgUO5xd; arc=none smtp.client-ip=209.85.128.41
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso6437545e9.3
        for <linux-rtc@vger.kernel.org>; Thu, 02 Jul 2026 01:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782979857; x=1783584657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zMIl1Eh3yVsZrdBP1XorCdcYvGVBjprl7wt0TiPGGoE=;
        b=PwgUO5xdHMmPqvPJJI1ou8HGofwWQneMOy6cRlrHAecRqSdYX43uq5Qgs+vflaPH7M
         bx8nBgyEs4H6flPCACCWcSPdoyk6UtGTrmA1KdTd1p8eGvzzQJIMPfrDeEvGAjOcqIjI
         ydkvWWlFmGytx4KL3HNDG04klKK+LcJjwfB3KDiOyMwSsabtiMX75WG7GaRIU+8k6FvI
         k5Mt7N7IRpckgJtaMo5TxqKoEuKWQX1D/wfx2CUBqdffC77ydULOUVml0vhNUMAv/5tK
         uLQh1vzBXTaIP7wB3N43bEB8RiC54jpPjgnf4XKoluKlhpquowNy2KQnf20UlhnRIkLK
         2Jmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782979857; x=1783584657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zMIl1Eh3yVsZrdBP1XorCdcYvGVBjprl7wt0TiPGGoE=;
        b=mYQunGAsw7Xud9e68kwMSjbHrVy/dboqXIxzcyVruDWvQHOwhX0ZL/W43PY7a2+CkM
         z86kL1usqsPVKlCyGgNCgQTRQZUOHgM7MVGTvOKplhBPW0zuGH+XZd1/4si9LoAfBdVt
         RCYRLU0O10XjdMlYCbj1nRiiTTI9GQK8EE0ayDKaWRy0EQ8CS6f28afSCm/qCrkl/RPU
         +ynAEqhYtEqOyQLcDOtb+8X+caieJxWhGXpX3hHS7zWpzUrJL/kH4J64p484ay8s3Uwj
         r+7NxaoYsio4W14DpMXKftuJHLsxs5w4TgCQEO1HB/Q0tSLLfMwqeJUfyII/uJ/kBeo3
         vQ+Q==
X-Gm-Message-State: AOJu0YxSHQrBo8Fhz9RsSSwqoAg0FWmdkgwzPukjZgqpPI/IELhZQoG1
	4sDUyCZq5n1lfDLnUZbGvM9i7MxYhZN3Q5MsSfO6xjJkn9+g1Lq39ZW/5E0M/g6EEng=
X-Gm-Gg: AfdE7cl04nRg2jsT/YaGYtqlNDT7oc48uQ+KvL9W8v86a2iOVQgRN42IGjmKP+01uYc
	PPpsdmM93EZ/RU3+C7vBAe8iY+u3swZ3XOJazwn9vy4ghNZPqMsdBai5qpoDRyJzrii0qlu92rr
	+RtBY6dYsBI9tKHVuDHwKE4DHUlzc723uuQ7z/KQPff7Y6CS3HD3NRJBxTRE9v5WGrRwesd2cjV
	gY9G6y6RkW+7tSX20KK+op7wClblU0hyCp2htVr9/5gA31Xy+kYIfC1u2AeNegbfDMEntmYFsiO
	DHqQPrj8HhHgpi4qlXVwOh++D1/NMmTElzboY4Dhx0nDGf6rzvwO3Tsu5rZ7Ce3nHaR+OVGE1MA
	R2DRC6bJaG0esniQtIpIIcItQxIx7GtaY/xhAs168jugU7Tb53jpBRbZFVzdqU8m9KHmoiQSzVC
	NXIH0eK8iIs/A=
X-Received: by 2002:a05:600c:3e15:b0:493:a8ff:d7af with SMTP id 5b1f17b1804b1-493c2b15c9bmr72077075e9.4.1782979857187;
        Thu, 02 Jul 2026 01:10:57 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:2e3a:7dcd:d2a4:6556])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493c6354771sm29596785e9.3.2026.07.02.01.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:10:56 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 02 Jul 2026 10:10:05 +0200
Subject: [PATCH v3 6/8] clk: sunxi-ng: div: add read-only operation support
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-a733-rtc-v3-6-eb2580374de6@baylibre.com>
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
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4152; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=2L2d0QfPA9w8m9zLHFuDIP+92mtPVG6eY7jP2BAgsNc=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqRhz7i1ZELfjYtb5C5oSl5YLVh5u5d5JSDVFlW
 oxSy/mKcsyJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakYc+wAKCRDm/A8cN/La
 hXkTD/9UqEGQ7lP5+o137L4ZK0dj6r9uITACcbnFagNW8dgCdbRUU1Gkc0pqcmmiv7+UB8ntF87
 o3jhmGckjY10GSP4z5O8LRX/RFDQxleFMjfojpwO36ioEKJgnSlA+lu6OQhi+g46wQnN6DtJxEr
 7JlXSuU8D4pI9ZQn31jIAnknDdGuyFwCU4AyWVBFecyW+hb4MBoA2tFxwxGlNEVY/TUTXx2QY4x
 tYvNkf1qU8DkddNz3GUjYzAil3ORQTbsYfo2jaVBXakn+CO9BWdNsGeBhkUn4ztynpV6xy/rtuU
 lT79/EIarFGTxDfnY+bVcEwjofdNIiVhoX+pH7wegGNzkxeYD5ZQaBA/BkWGCtjunu01dEGyu1D
 qfKldcvBjqwRW6evTZxpsz4AelUn8ryl95Z5blQogwYlL0us3lXlUBIA7yXmxL5H6T/aWPctE8y
 6vgieBFPI3dWAgVTtuQiLGVMCGH9oUWKi+yHa9vSDnK6YOz1MT7iOcNqkzYDdwVv4TT+9uvUGB3
 DCbtmqU4H6691jYrfWWqQ1Pqet1p5g4i+mv30yFGfOlGL370t9V+6n+XWEq7wiSIbX53129CGo/
 xFa0KgrvLpUNUzhv2A9ND2uuvgGDvNbpeN+kjVgK1rB2PNnhZ8gwqPB7CuvqchwTz7tb4Z1BAh6
 7IchPeO7hREhSqA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:junhui.liu@pigmoral.tech,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:mripard@kernel.org,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:jbrunet@baylibre.com,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[pigmoral.tech,bootlin.com,kernel.org,gmail.com,sholland.org,baylibre.com];
	FORGED_SENDER(0.00)[jbrunet@baylibre.com,linux-rtc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-6862-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,baylibre.com:dkim,baylibre.com:email,baylibre.com:mid,baylibre.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0B6136F4A9B

Add support for sunxi-ng read-only dividers. This will be
useful to the a733 oscillator detection logic.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu_div.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu_div.h |  1 +
 drivers/clk/sunxi-ng/ccu_mux.c |  3 ++-
 drivers/clk/sunxi-ng/ccu_mux.h |  4 ++++
 4 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_div.c
index 62d680ccb524..d1c8c7baa12d 100644
--- a/drivers/clk/sunxi-ng/ccu_div.c
+++ b/drivers/clk/sunxi-ng/ccu_div.c
@@ -84,6 +84,36 @@ static int ccu_div_determine_rate(struct clk_hw *hw,
 					     req, ccu_div_determine_rate_helper, cd);
 }
 
+static int ccu_rodiv_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
+{
+	struct ccu_div *cd = hw_to_ccu_div(hw);
+	unsigned long val;
+	u32 reg;
+	int ret;
+
+	reg = readl(cd->common.base + cd->common.reg);
+	val = reg >> cd->div.shift;
+	val &= (1 << cd->div.width) - 1;
+
+	req->rate = ccu_mux_helper_unapply_prediv(&cd->common, &cd->mux, -1,
+						  req->rate);
+
+	if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
+		req->rate *= cd->fixed_post_div;
+
+	ret = divider_ro_determine_rate(hw, req, cd->div.table,
+					cd->div.width, cd->div.flags, val);
+
+	if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
+		req->rate /= cd->fixed_post_div;
+
+	req->rate = ccu_mux_helper_apply_prediv(&cd->common, &cd->mux, -1,
+						req->rate);
+
+	return ret;
+}
+
 static int ccu_div_set_rate(struct clk_hw *hw, unsigned long rate,
 			   unsigned long parent_rate)
 {
@@ -143,3 +173,15 @@ const struct clk_ops ccu_div_ops = {
 	.set_rate	= ccu_div_set_rate,
 };
 EXPORT_SYMBOL_NS_GPL(ccu_div_ops, "SUNXI_CCU");
+
+const struct clk_ops ccu_rodiv_ops = {
+	.disable	= ccu_div_disable,
+	.enable		= ccu_div_enable,
+	.is_enabled	= ccu_div_is_enabled,
+
+	.get_parent	= ccu_div_get_parent,
+
+	.determine_rate	= ccu_rodiv_determine_rate,
+	.recalc_rate	= ccu_div_recalc_rate,
+};
+EXPORT_SYMBOL_NS_GPL(ccu_rodiv_ops, "SUNXI_CCU");
diff --git a/drivers/clk/sunxi-ng/ccu_div.h b/drivers/clk/sunxi-ng/ccu_div.h
index be00b3277e97..a30a92780a05 100644
--- a/drivers/clk/sunxi-ng/ccu_div.h
+++ b/drivers/clk/sunxi-ng/ccu_div.h
@@ -300,5 +300,6 @@ static inline struct ccu_div *hw_to_ccu_div(struct clk_hw *hw)
 }
 
 extern const struct clk_ops ccu_div_ops;
+extern const struct clk_ops ccu_rodiv_ops;
 
 #endif /* _CCU_DIV_H_ */
diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mux.c
index 766f27cff748..e2d6833a6d33 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.c
+++ b/drivers/clk/sunxi-ng/ccu_mux.c
@@ -68,13 +68,14 @@ unsigned long ccu_mux_helper_apply_prediv(struct ccu_common *common,
 }
 EXPORT_SYMBOL_NS_GPL(ccu_mux_helper_apply_prediv, "SUNXI_CCU");
 
-static unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
+unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
 					    struct ccu_mux_internal *cm,
 					    int parent_index,
 					    unsigned long parent_rate)
 {
 	return parent_rate * ccu_mux_get_prediv(common, cm, parent_index);
 }
+EXPORT_SYMBOL_NS_GPL(ccu_mux_helper_unapply_prediv, "SUNXI_CCU");
 
 int ccu_mux_helper_determine_rate(struct ccu_common *common,
 				  struct ccu_mux_internal *cm,
diff --git a/drivers/clk/sunxi-ng/ccu_mux.h b/drivers/clk/sunxi-ng/ccu_mux.h
index c94a4bde5d01..272a2c36a8f2 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.h
+++ b/drivers/clk/sunxi-ng/ccu_mux.h
@@ -134,6 +134,10 @@ unsigned long ccu_mux_helper_apply_prediv(struct ccu_common *common,
 					  struct ccu_mux_internal *cm,
 					  int parent_index,
 					  unsigned long parent_rate);
+unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
+					    struct ccu_mux_internal *cm,
+					    int parent_index,
+					    unsigned long parent_rate);
 int ccu_mux_helper_determine_rate(struct ccu_common *common,
 				  struct ccu_mux_internal *cm,
 				  struct clk_rate_request *req,

-- 
2.47.3


