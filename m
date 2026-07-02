Return-Path: <linux-rtc+bounces-6863-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id k8IzH0keRmoSKQsAu9opvQ
	(envelope-from <linux-rtc+bounces-6863-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Jul 2026 10:16:09 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A7E6F4AB8
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Jul 2026 10:16:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b="JJwk3h/q";
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6863-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6863-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6718F30A0320
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Jul 2026 08:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37CE7420E72;
	Thu,  2 Jul 2026 08:11:03 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2A44229C3
	for <linux-rtc@vger.kernel.org>; Thu,  2 Jul 2026 08:11:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782979863; cv=none; b=iQJIfE+e9eRTnC6FBani8xYK3vgELMo11ft7KYTykXI+E4NoTCUrgrlexdkxJWiKez7MGIbPrmfwqIcstgpNYkDbTlOb/QaV3cdQME7EWxGG4gwJX7FNw6tDgomGyla/sIdZBKwKwJp8RiXbQ8OO1ON2df6RmbdYPDUBZQ27DS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782979863; c=relaxed/simple;
	bh=mDE5aNV7J0YTDC++0PyqpQq+1LRXe/OEq5dNJJriQq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wl7YvXHC74jeUCwEs76LvnqTiSsDSHzPsHF9qqYR+Ay80ehaXGdFvpCXtaZYKLnLXPYEgaOYmtdrE5SPFDBVA9g2jsRlzwwH4lALyHc/99Ul7XRk0Fu8m2Lg6bGgfZrer897MZjC5HPbPcaRyCLk9BIekfKOWvrjjswCF11tfWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=JJwk3h/q; arc=none smtp.client-ip=209.85.128.54
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49241dbf9c1so11931625e9.2
        for <linux-rtc@vger.kernel.org>; Thu, 02 Jul 2026 01:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782979859; x=1783584659; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rSh1ZBRvKf6dioysT8A/x6MNdQs15mKol/PsSCRG53E=;
        b=JJwk3h/qQtnc7NyJAUiOHc3LRNs9k1PaxZ8qWN3irb7xLTwnuXXooJKzOMUUzyOVEx
         ZyuU7XIivqJMadJlCRSU42SPDIyqXSmvYjTuFCSiHT5ZZtspozHwl0JQ6vwzImUKyYYw
         qK70D3c31njjV5ehBVV/CFdbEv3c5jfE3adeOUL8P3iPVW1XHwf6JYNLUifyLbb2AYjL
         lGSf2CbnsM8D5jMmzcS9B6NjKOGroQgblZjQh5KeXPlzp2bVIAPJGXAqie781sbovKNe
         a6pYUiRpCYXj+kb+88jePjRdzfa8bbdzn22NhEyD/kT2JDFUlh9bk7TK25OXdvGchKQB
         jziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782979859; x=1783584659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rSh1ZBRvKf6dioysT8A/x6MNdQs15mKol/PsSCRG53E=;
        b=WSkTv0xNjwn4vgz0VihMkLMirM2Fi1nVCfQ3VeWacXPn4mknxqHhivinlLEcMTfMA3
         cj0ABPDWPOv4h95cRgHnGiiori0sMQiqM4XTRbQKfUlet+921d/Q3XIAsZgACrQR38ch
         Xc04tjN5Gz8B1dsih4k06KheBBJRgC1evVHNVx/PjIwExjEnZp6z04lq7qfxmRNH5iw9
         xTk/FiIts/qLdKIKw4do/yvGRtGmj5HMEt/CSmwfFQUc7rjQdYQv7XKq1gqXaMsON//3
         4ka/T7Yh4MfRDmJViFcwElE3sLv514jK8PTh1cn/qOlGACk3D9OOGvnX3WEA3ZbQdIth
         0S6A==
X-Gm-Message-State: AOJu0YxQ1Pcin4wQwiIeWN0M097veZ/FmMMAbfd1fpjT6lsty8zBSmWK
	rniYCuWXZ3c3VFy8WPTuB6xYQPpucn51IrarjnzSthcVmlNrM5IhzOQC6ZZuRQXHrj0=
X-Gm-Gg: AfdE7cl3E7AXB4pFZ1qx4mI3fAjxXmK6YDb/Z/qYIg9AcllWOyUSFWTktN+8SXuOFR2
	FTVUAIcDUHwF2MfL5unffIDEhY1d9FLjHzwEmnTEN0GheRk4vHg/B7vdzJuuBRAbgMVo2QhYwq1
	+5VNa/Op0ofguu3FcGWNnQt4ZNqjYzP8gk/m7MfyBRLTMw1tIM3F6eUYclMhTSuf+YNrhdwurt2
	8s9cyTzlHpB4XBnmhSz8C/MJf8weEN7WQTRd0vJkO3w/jA+FU+WxswfXEXDdaxQ26CGaHK+91eW
	jJYTX6rPvVff8b1TppC6M7BSFSAZPrrh6rR5drxj0nevQDw9ZRwFhpsOba7WONLONu6cHyfY/lF
	VGCV/KDU9QtD4YQ8mtYqsKXnq5mGV4v2HQ1VlMy2UlbVatjBO35Rtdu8f/M6kdsU8SmtJ6Rws0N
	b8bc+lATm/IzChaiD/ur0BeA==
X-Received: by 2002:a05:600c:c046:b0:493:a8eb:5145 with SMTP id 5b1f17b1804b1-493c3cd4ac7mr42700915e9.4.1782979859299;
        Thu, 02 Jul 2026 01:10:59 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:2e3a:7dcd:d2a4:6556])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493c6372a31sm30759565e9.13.2026.07.02.01.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:10:58 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 02 Jul 2026 10:10:06 +0200
Subject: [PATCH v3 7/8] clk: sunxi-ng: sun6i-rtc: split main oscillator div
 and gate.
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-a733-rtc-v3-7-eb2580374de6@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2479; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=mDE5aNV7J0YTDC++0PyqpQq+1LRXe/OEq5dNJJriQq0=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqRhz84Va+eOo65gJ7r3N6Uf0cw5m///ZPyWWed
 jMOv7SogdyJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakYc/AAKCRDm/A8cN/La
 hX2JEAC0IHxsjEu2zR4yluC1t2Qb1R/L4bdk5ZB2cG6ZO54dIfcruEioVYrQy33K0Ed91Qx1xdE
 60I8i6/hGKoLimMfyWJbAVqKQ29WXMVpz3nY2R/Qnv46o03/dSHRoXFaA6/lWNtZohRlcktfxh8
 pz87aKnhsIc/yHVwoXXniWAT3FpyS4dWoG2odR05jydF7opAW1I76KngNaxEhoKAepZS1/2Pbd4
 L6GlU6TUuzQmxSpqK6hyV/ltMo7+8DnGIjjaH5/LDcBkvUXgf6jfqqYWtetU3AALKJYIsasG+Qn
 eC7Ypky8gYw/34RmJ4M/vKUPr582khMcs9Xi9eOFXS1Zk9YSLncqBCPFLxkvkbLfk+E7moeGo4g
 k/6ux28KThwQx49b/VFGIiAxQKJej3xUtaUY/22zhSM2QKrSAcnSTnBneywFJLzOraENmnJCz/e
 VU257QrLk36zzQqVJcg7MvDtSK2PFYQ6yloz+IGekf1LYV5pCGljTyXowMn0U+uOAnh06SZKyuO
 BkF/Flqz2jcmaHNMsOvAHn7hL7P8HrAIJx4Iw8v3a+/mhvHAoq6nCKnSZ1y2BDMJpxj4qyCVYKF
 2ZMJ0jLwbj6nrVsCADE2p0X9xadDN8s3baLJGDZCxm5FtiYxyB5kZCQXDcQ2LM7aR8Rh1+zAq8D
 6FeMPTX8vOFg/lg==
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
	TAGGED_FROM(0.00)[bounces-6863-lists,linux-rtc=lfdr.de];
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
X-Rspamd-Queue-Id: 38A7E6F4AB8

On the a733 the "osc24M-32k" clock has the same gate bits as the previously
supported SoC but a different divider implementation.

Instead of a fixed 750 divider, the divider is selected based on the
rate of the oscillator. It can be seen as a simple read-only divider.

To easily replace the divider part depending the SoC, split the divider
and gate into two separate clock entities.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 20 +++++++++++---------
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.h |  3 ++-
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
index b24c8b196e66..25dd87e78eb7 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
@@ -218,17 +218,18 @@ static const struct clk_parent_data osc24M[] = {
 	{ .fw_name = "hosc", .name = "osc24M" }
 };
 
-static struct ccu_gate osc24M_32k_clk = {
-	.enable	= BIT(16),
-	.common	= {
-		.reg		= LOSC_OUT_GATING_REG,
-		.prediv		= 750,
-		.features	= CCU_FEATURE_ALL_PREDIV,
-		.hw.init	= CLK_HW_INIT_PARENTS_DATA("osc24M-32k", osc24M,
-							   &ccu_gate_ops, 0),
-	},
+static struct clk_fixed_factor osc24M_32k_div_clk = {
+	.mult = 1,
+	.div = 750,
+	.hw.init = CLK_HW_INIT_PARENTS_DATA("osc24M-32k-div",
+					    osc24M,
+					    &clk_fixed_factor_ops,
+					    0),
 };
 
+static SUNXI_CCU_GATE_HW(osc24M_32k_clk, "osc24M-32k", &osc24M_32k_div_clk.hw,
+			 LOSC_OUT_GATING_REG, BIT(16), 0);
+
 static const struct clk_hw *rtc_32k_parents[] = {
 	&osc32k_clk.common.hw,
 	&osc24M_32k_clk.common.hw
@@ -286,6 +287,7 @@ static struct clk_hw_onecell_data sun6i_rtc_ccu_hw_clks = {
 		[CLK_EXT_OSC32K_GATE]	= &ext_osc32k_gate_clk.common.hw,
 		[CLK_OSC24M_32K]	= &osc24M_32k_clk.common.hw,
 		[CLK_RTC_32K]		= &rtc_32k_clk.common.hw,
+		[CLK_OSC24M_32K_DIV]	= &osc24M_32k_div_clk.hw,
 	},
 };
 
diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h
index 9ae821fc2599..ab7b92b47f59 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h
@@ -9,7 +9,8 @@
 #define CLK_EXT_OSC32K_GATE	4
 #define CLK_OSC24M_32K		5
 #define CLK_RTC_32K		6
+#define CLK_OSC24M_32K_DIV	7
 
-#define CLK_NUMBER		(CLK_RTC_32K + 1)
+#define CLK_NUMBER		(CLK_OSC24M_32K_DIV + 1)
 
 #endif /* _CCU_SUN6I_RTC_H */

-- 
2.47.3


