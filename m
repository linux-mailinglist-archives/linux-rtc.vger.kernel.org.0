Return-Path: <linux-rtc+bounces-6905-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tVMBJI+CS2p/SgEAu9opvQ
	(envelope-from <linux-rtc+bounces-6905-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 12:25:19 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD96B70F1ED
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 12:25:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b="Vir8+OM/";
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6905-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6905-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4128E3043D0F
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Jul 2026 09:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C315947CC65;
	Mon,  6 Jul 2026 09:32:47 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BD142F70F
	for <linux-rtc@vger.kernel.org>; Mon,  6 Jul 2026 09:32:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330366; cv=none; b=qlVm4i81D/lapH0/IQBYw6OI2BhAsDmkEdH3T8hf8Un2niFcUmXyx9sWKGa/JXoaT9vFilLKwsnpnG65WTgatHFFKj0lJu2ySzYad70nb7GAO1ymHyuG9oPSPIB5DIIaH9giEsN3HtbpbxiHwiPjJVeMcbNe5onZlObQAiJSH84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330366; c=relaxed/simple;
	bh=YM5ShWAEXTvmgI5Fwj/9iD61+1bTWSy4EWyE1bdkdA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dfnjZvIFAMAU6KH7UlTEsnDW7VGvIl87alBUUdY2XmDOV4FYfdWIQQetXyiUM2CEVutTWAjjGTHr48gNfG05b97OzGZu12VxACEsZnXVSd32l7wormhy3bURLXFJMyhnfK3ekfU0tcDeMMKN61xdt9zIGjqB1gdRwI9aIm0Bf38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Vir8+OM/; arc=none smtp.client-ip=209.85.221.54
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4720f3bf164so1853178f8f.1
        for <linux-rtc@vger.kernel.org>; Mon, 06 Jul 2026 02:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783330359; x=1783935159; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8qaD3KpHXlXTlsicr8XbDQzikndK4UikxNXryf78w+g=;
        b=Vir8+OM/8VEuscHTgeniSLe39xXAmpstmEbeVqZsw5mlmzJQ/3T2fUqb7rxhImrsAt
         0XDdXGLLw7R8517vs2Nvlq3t7MThB2bQCtyQgoarbKJ9DWbYrthUdKLmDTD4sTHOo6EJ
         xRvii/KvHeg+UCyNxmffulDz2OiK9s/TkPqdNu2E6ZU/M2Loe7DWI9s8vWVZkRE52DD+
         HVM0YQrrJ/DogysP37rykW4dsDwJYFwPd4WJr1PdnuJDVDQ5+cUJYEJeyzIIcrpdxUxT
         OyICCU7YFqP2eh6tlHdQawmiuVcLGBZb+/UwEorTHz1txKxoBW0/JD0yeb36H6VQQdsK
         HYhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330359; x=1783935159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8qaD3KpHXlXTlsicr8XbDQzikndK4UikxNXryf78w+g=;
        b=iU85SnyOkKK7074wlzioffrHqvjWB6qpUlUbG3o6LYoP3n7+NogJZnpFkqMINFxtCT
         dDwLrDnEcvjJuM9J0drOSvpm8kWv7TyaEkJuo4thKafXVRLViGktrZNxYAJmSMSXElQY
         8FbTfVLiX7kpxLykeLuCCbcZtfS0rputNVfnvA7tEv8k9FjzDEFOZGg25WBVyUxzDCiX
         i4lqsc6fqEdgg3dLY3N6/Oy87tG4/AOK55RXmtpIlGs8fAzD2XgNkIAvCYcKJ3c0bcTL
         8yx0iE7ScuywWdSq8c3OK8jj7OCTSydRnWRxLnP+XqQZsO7A3EWZY027bfylUZQJKZiD
         QcyQ==
X-Gm-Message-State: AOJu0YyJ6cspevRGHGoTURsNdyRHS3sXwwoqVW5TTIixAj9Nx4AruNrm
	EdlYozw+ucHxjqK7o5SCSVFj/YXspqByTly0veqhXlyaoojIQ0qAlrgXBQ9QE1zl4MU=
X-Gm-Gg: AfdE7cmKNl70kIo4/neolbrsJJ/3s+rFWUndIOswNJuzySe76WpwDuxoTU591vBZYc/
	WimZ1m0gkrMp18LzTIgI2TZpIWFTc+JCbS26lTJ2imPgtTQ61b9N2fyrdXAKZ3Noq/QXTMXv4Bt
	eTh0gH1XTWu5zB0OSp6OaI42L9hgdQ4OE8KwRwNUSP87TuorJbtUuGSUmxr6/p2CoYYxd5NVSET
	AG6OnaJXsbDyxDy4l3Dirw3T/9hg9FxPfqfWCmqbn3vey25JPBRHa0VC4nrTRXlQ43XSGa00jY/
	LHrMBWZFY/96Yitt+l1sq2UAZz9haiSVsnoA6UDhbwCt2SsXGNc+Bmt6O/ZsoX9l6/wBr+hlcPw
	Wi7lho7Va013YTQHXUFtMOo7tbfSgXyJKNlRKnQdJMJ0WWFu+XDfWW6KOFrD3d3KHNZUhyYG5v4
	qhCrdUklGdOWk=
X-Received: by 2002:a05:6000:25e4:b0:473:41c6:f1b9 with SMTP id ffacd0b85a97d-47abad9f4e9mr10488782f8f.11.1783330358720;
        Mon, 06 Jul 2026 02:32:38 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1495:8c97:96f4:dff8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47a9e4d6da9sm22724967f8f.12.2026.07.06.02.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:32:38 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 06 Jul 2026 11:32:14 +0200
Subject: [PATCH v4 6/9] clk: sunxi-ng: div: add read-only operation support
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-a733-rtc-v4-6-f330728db3d3@baylibre.com>
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
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3945; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=YM5ShWAEXTvmgI5Fwj/9iD61+1bTWSy4EWyE1bdkdA4=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqS3Yl3dlm1jKmbVqsn7Rcc9HiTF6eoKTChjUWI
 t1qYB/aI5OJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakt2JQAKCRDm/A8cN/La
 hbzyD/9+ecBIMkVBHC9SbhtGLh+1Wq/re/x8RaQWpRit6MC1z/qa3av70z1wyB2NcUDQkRWHeBA
 SjFnA/G6Ba3ajJfE7fEzeqeoGCeApCTWt9js6jPSzMbQzQl8c2JBmRF1sRlxWzkTJl+L/Vp/yqb
 mWCp4QZAFRq7xxeBYzuAeGYj0mObaO57Th7VCqYlTxQFrBtDURG5eXacWE46CA7qC1QYl9oDb95
 gPPKegGUH40KsqiC7k+dQXklTL8bU61dR1CzYx4jzYIcQmTWCr2TCPy/sI1ft1uL1P0Du9TfXaf
 AxPDUv98UFuUcAJXZlive0q8HiYhwUe39R9DhriwKXzGTt19Axex6TRBEIh0v6FZ/VNjmZEJEKq
 29p7D6jXKU06slB4XfVElIyW949dAdP5cNWjFtpdb6Y+HGh0EuxAIajiGTmcqgxCEt8SmHKk5DH
 rPSIQKzA3HZwk6oIJficJ/t7RwAUo7VE6zTFQ0BY/skXgzwin0D48AfyAeTIJtyzGLRDdFaR18K
 mQB1F47Ks5G89dWYJpsYOzcb6YYlCXKVN1BzsruSmYO0MIfFEt++ssSijsUzaUx3NPEZyR1JFYO
 szCS45D5E4IJuFEZuwlcWr4GUUJQmxp+WwUX9SJ9kCul0K0log1R1X8qH1FWizjlI5Ov9Pv2Fym
 579DH1hjT/dZqKQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
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
	TAGGED_FROM(0.00)[bounces-6905-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,baylibre.com:from_mime,baylibre.com:email,baylibre.com:mid,baylibre.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DD96B70F1ED

Add support for sunxi-ng read-only dividers. This will be
useful to the a733 oscillator detection logic.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu_div.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu_div.h |  1 +
 drivers/clk/sunxi-ng/ccu_mux.c |  2 +-
 drivers/clk/sunxi-ng/ccu_mux.h |  4 ++++
 4 files changed, 48 insertions(+), 1 deletion(-)

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
index 766f27cff748..775d396ccf31 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.c
+++ b/drivers/clk/sunxi-ng/ccu_mux.c
@@ -68,7 +68,7 @@ unsigned long ccu_mux_helper_apply_prediv(struct ccu_common *common,
 }
 EXPORT_SYMBOL_NS_GPL(ccu_mux_helper_apply_prediv, "SUNXI_CCU");
 
-static unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
+unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
 					    struct ccu_mux_internal *cm,
 					    int parent_index,
 					    unsigned long parent_rate)
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


