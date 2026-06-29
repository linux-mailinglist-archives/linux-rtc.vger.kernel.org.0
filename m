Return-Path: <linux-rtc+bounces-6775-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RRNuIRBtQmqi6wkAu9opvQ
	(envelope-from <linux-rtc+bounces-6775-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 29 Jun 2026 15:03:12 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BA16DAB31
	for <lists+linux-rtc@lfdr.de>; Mon, 29 Jun 2026 15:03:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=mTCwPFgA;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6775-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6775-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73B5431381C5
	for <lists+linux-rtc@lfdr.de>; Mon, 29 Jun 2026 12:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8073C407576;
	Mon, 29 Jun 2026 12:42:36 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F7F40682D
	for <linux-rtc@vger.kernel.org>; Mon, 29 Jun 2026 12:42:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782736956; cv=none; b=PQTB9NJKxsJJT48hHM3S/DRr4TZjMVjIXF7MpxarVHGqppPEDTWjrbve49kgJgkhIWSxtz5A9L5eZJwXylbjhPLwBp+UH6OfzwJyURtdVpDWSLvxTDE9rH8u/xNqr6j1hATbFfQ/tIP20exds30vf2aaSzDMNK8VEFpO9D52qL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782736956; c=relaxed/simple;
	bh=QIDVb4v67kXTxypoR7T1A+2qrv5ugJGiyI5f/4IznIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XSVupM3bpFXANzAKCdJ/6odvC6957kpVki3p27r5nQ9VgMjX9mEUaOKHpdms40Sbub3KQBrWvjinqn/uvF/O3+GuJHmmtV4PY9QvD6Iiy78aR63PHCpV8Myudp9nH037qW9H7pWTps63X0fk65l81jDpO2rqnnI+weEl92mqIKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=mTCwPFgA; arc=none smtp.client-ip=209.85.128.44
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493a5392c60so7948665e9.2
        for <linux-rtc@vger.kernel.org>; Mon, 29 Jun 2026 05:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782736952; x=1783341752; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p9gMufAEHeq0Shwigbm5Xg4KyFFoCIavO1i9vrLQZfU=;
        b=mTCwPFgA9GSon7eNHOkoqMDLP50YuDjY8dBTpzJ27uw59+VUFHRqESqc/mHqbbQv3n
         034/LNeHysOMqQS5FNBtWtk0y9L6+q1ghIAQTh2nBKOdgnY0EsEGQzqc33LMh1pocYAE
         fB6/WAqGQsysGf0NXRxh2lEQeYKEyDGxLMEGF+BCFoKHutEIP1pL8NtNN7BYE8p4ohGd
         NSzAcodLyfRU0eep6ER1o8qmCGub9Hmme2CM3O1R3Ra8w7oLVoTtgg6gtfrOlaj0djnJ
         9vgp1RmgKnlKAN8v95ZWKdiuQnRCdBlp0EzuBLctimSecs5W0hxHWRPeUbSMEVeeXrrQ
         HATw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782736952; x=1783341752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p9gMufAEHeq0Shwigbm5Xg4KyFFoCIavO1i9vrLQZfU=;
        b=mufYUc5PTKXFoTDC3H34Gakg8Xse2zCdts2w0ndTPcqYEp/GTwcA+mjry/vRrV15lZ
         WsraXftqJqZF8A9BlukwZi/slTaEa667HbewRvGiEKlwz6kJqlZS85iaOYWt92njbvlY
         SnpYlx6DC73SJ5iQkFU7HFKveppP2ZvgeB8+Hq5fOOEQ1LmOkP6qevXQeCoGZsa+AGm/
         ZY2Uqujq/In2nTAZW3g8FU0kKWMIY95RDV9hSVPKwJ7z5LsIq3idA+M3bYTuWbjmRaGL
         hXv32oJLIQswviOfFrxAsIZdtDUucYlA9R6Wntnyt/qX/f0HHr+V3QgJs0wtpxGNS+0g
         UtFQ==
X-Gm-Message-State: AOJu0YwKQI4ocMlF2f1Y3jw75Znr1wQlBgILXOw8OAbCiSnRu8cNgrm8
	mZAQLhClHVfue3xEVzWIM3fBnZeOuG4UFUU9TRkboi4OSN57PmIg1J1HxqIm7rZzguo=
X-Gm-Gg: AfdE7cnlCQvyOVde9MVTtw4N7llsngx4H06YTpjmDs0rPeLAslpe3xl85uHcV5Rn/ud
	2KJbfOpRs0Gn1U/o/fXNv1n4s7dgYarTSU53noT48dZeI4PppJzdQ0RQTyyboM/LIOh6iy5Dp2e
	BoiEC0mawNTGGEVJbhjHDGYCK7ODw5+TAtB8CBwbKuGzEsOwjiOAfTMVfi7k+Uq13VY/57K72Ut
	/PAKZRMPL3TvYXYkCuieqDEIdsYS4cj7G9vGrnwxiJPGNl3kpzZXnbi53xUTLFb9H90j/JEQ9oE
	y7jaBWskjb3Vrm5h5wLjWplE5j6o9QPJcGllGIcUVJFK6eu4E71zUa1l1D3eGCMFCWC91XiEWJa
	lagzAu8ZR+gmrLbGDbam9uVgC9X+YTD7rvzMsRTkXihPjouXQpDQbOI1ft7/UgcBuvDV2XZewcD
	Wuc+51eGuAdHg=
X-Received: by 2002:a05:600c:8117:b0:493:a607:f3b8 with SMTP id 5b1f17b1804b1-493b71413demr11373165e9.0.1782736952553;
        Mon, 29 Jun 2026 05:42:32 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1d21:f5d5:2d3c:23a7])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4726b76e6f8sm19182406f8f.13.2026.06.29.05.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:42:32 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 29 Jun 2026 14:42:06 +0200
Subject: [PATCH v2 2/6] clk: sunxi-ng: sun6i-rtc: clean up DT usage
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-a733-rtc-v2-2-7b72112784f8@baylibre.com>
References: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
In-Reply-To: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2634; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=QIDVb4v67kXTxypoR7T1A+2qrv5ugJGiyI5f/4IznIg=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqQmgu5DnB+eudiTNdZyR8LEcTDWwt/TL8OLgi8
 mOLm0C8spKJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakJoLgAKCRDm/A8cN/La
 hX1QD/95lLPuPyszhXE8d/DJws2q5hAdSAN/+TLFua8a1fFg/xdl1HEmX5SP5l1C7lgaka8FqIm
 rMRKHh0oeizypSTZFQfWkyqPsR8pSx3LiOiKOXwNykN+bmJ4oQqIYKd9LQjKyiFMSUxSmmUbGMH
 hGqFxT6yVW1I76xgw5WCS8tCzdSmePBXggO3hUvLqmE4DU+V/DEokJdKNwmD4zNfxoefthIRnOh
 T9bzIFPN2EiYH1D8oXvkF+GFLqbH6Sl6zpNPLKkzc7HE4fFxE5EY24G1u3VaE0nUlcLn5vEH5PI
 6TrdXRzss5NYcXu6w8m4OnZoUzzSWe6fPy74ExMOrIKH8vUXKsbt632rhR38x7JpO4av+CVwxFv
 XC3sb94OTpYo4I2r5k1uZZz80CEy1BxxcnOSgiDpwWW7dNzsYwivpa8U1v4LrTjX8k5xFILIIDQ
 tjHCt0iDk9qctrHojzZZqsVQdgHiJMY1UerL/4TTdz8NAFah87tu4+TCs3utPCJ3ZRjqAZgAncd
 8iPsOkHBMvKawDAxy82FyLWptvch17SXKekO88Tly3x6sMxR516cMKY04ti/Xm0zJWO+Fyd9cUU
 LG+hzHdrg22dHqqfGNZ4+3ee8nNSvIpsdv1jXwZTeN4oqSvpOsjLKdBNN6Ukri5WQbGGTzKH35F
 WdjsUrDbyv+7IxQ==
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
	TAGGED_FROM(0.00)[bounces-6775-lists,linux-rtc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F3BA16DAB31

With sun6i-rtc compatible devices, the "ext-osc32k" clock input
is optional for the devices that support this input (r329 and onward).

Probably preparing for older SoC support, the driver does something funny
when parsing DT. It check if "ext-osc32k" is present in the clock-names and
if it is not, it uses the first clock as "ext-osc32k". This clock will
actually be the rtc bus clock so what the driver does is wrong.

At the moment, the driver does not support the older SoCs that would have
an external 32k clock provided on index #0 so just remove this quirk.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
index f6bfeba009e8..0f528bfaed00 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
@@ -191,10 +191,8 @@ static struct ccu_common iosc_32k_clk = {
 					 CLK_GET_RATE_NOCACHE),
 };
 
-static const struct clk_hw *ext_osc32k[] = { NULL }; /* updated during probe */
-
-static SUNXI_CCU_GATE_HWS(ext_osc32k_gate_clk, "ext-osc32k-gate",
-			  ext_osc32k, 0x0, BIT(4), 0);
+static SUNXI_CCU_GATE_FW(ext_osc32k_gate_clk, "ext-osc32k-gate",
+			  "ext-osc32k", 0x0, BIT(4), 0);
 
 static const struct clk_hw *osc32k_parents[] = {
 	&iosc_32k_clk.hw,
@@ -352,7 +350,6 @@ MODULE_DEVICE_TABLE(of, sun6i_rtc_ccu_match);
 int sun6i_rtc_ccu_probe(struct device *dev, void __iomem *reg)
 {
 	const struct sun6i_rtc_match_data *data;
-	struct clk *ext_osc32k_clk = NULL;
 	const struct of_device_id *match;
 
 	/* This driver is only used for newer variants of the hardware. */
@@ -363,21 +360,7 @@ int sun6i_rtc_ccu_probe(struct device *dev, void __iomem *reg)
 	data = match->data;
 	have_iosc_calibration = data->have_iosc_calibration;
 
-	if (data->have_ext_osc32k) {
-		const char *fw_name;
-
-		/* ext-osc32k was the only input clock in the old binding. */
-		fw_name = of_property_present(dev->of_node, "clock-names")
-			? "ext-osc32k" : NULL;
-		ext_osc32k_clk = devm_clk_get_optional(dev, fw_name);
-		if (IS_ERR(ext_osc32k_clk))
-			return PTR_ERR(ext_osc32k_clk);
-	}
-
-	if (ext_osc32k_clk) {
-		/* Link ext-osc32k-gate to its parent. */
-		*ext_osc32k = __clk_get_hw(ext_osc32k_clk);
-	} else {
+	if (!data->have_ext_osc32k) {
 		/* ext-osc32k-gate is an orphan, so do not register it. */
 		sun6i_rtc_ccu_hw_clks.hws[CLK_EXT_OSC32K_GATE] = NULL;
 		osc32k_init_data.num_parents = 1;

-- 
2.47.3


