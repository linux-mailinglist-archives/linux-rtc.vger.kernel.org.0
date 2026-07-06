Return-Path: <linux-rtc+bounces-6909-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id R/ANGMCVS2ryVwEAu9opvQ
	(envelope-from <linux-rtc+bounces-6909-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 13:47:12 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEC67100A6
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 13:47:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=K3526KCR;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6909-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6909-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6164C340F22B
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Jul 2026 09:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E1A048A2AA;
	Mon,  6 Jul 2026 09:32:56 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10144C955B
	for <linux-rtc@vger.kernel.org>; Mon,  6 Jul 2026 09:32:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330375; cv=none; b=Dp2QG/SMN9FGXXV9gtoV8gbHDYdb1Bd6+NXELstqmCYR0WM7B9SVWo6oWqbLR3/yqGzqHuQ86dsBarDXJG/Ig0SWiDj9ZPR6cC92HSJnv0T17ACjR+l22BEMEoOtFDNQO1/agtDGYMj1nr4kWF+fEuITcnVN/sVP7OZTYsyHqOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330375; c=relaxed/simple;
	bh=mDE5aNV7J0YTDC++0PyqpQq+1LRXe/OEq5dNJJriQq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SM3DC0Ru0lphHOvG7w2n235oBNg+yPssaheEVFNxQ3myKUhJK/LrRiKIWcboe4ytrr1pFHMJPMEDHvt6+NX6dNDqtz94+uJ7RHl2DwAg8Ja0RreqiRaK8W29h0JEpB7d/l4NEi4UPLEy7n6Pmz4E7ZzxstvoaEZX2u/xuvSLDjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=K3526KCR; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso28949845e9.3
        for <linux-rtc@vger.kernel.org>; Mon, 06 Jul 2026 02:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783330363; x=1783935163; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rSh1ZBRvKf6dioysT8A/x6MNdQs15mKol/PsSCRG53E=;
        b=K3526KCR914YHslGiuIRPAhEM1pCpyAnNJrXLYLHUR0eOCgLp5gIJteVE2+9nXs3bD
         xxZkjMNmRl7G6WxL/qJSKqEI9CRAokRnCQ8c7xlRwE0HaPzRaSk2+cipIpSeMR0cMELg
         XI+FfENQ2fIHzRAXqo9htEW79cF7j5xdP05rhrrEsM6MWxiNdHeOtCfuASxi1JWN9acT
         CBhqLbPJ8fZIhl7x6wVLvDEdEOxLsASA0AncRezYJBi5zqsdVV5SUox+sdiCvZkIjPQQ
         2MSyMD3X6hCOuKQogWqSn92TMRGZYMPWT4DSoMIUu6YwHeUJy4pfTn9zklytAu8koCXu
         hSsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330363; x=1783935163;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rSh1ZBRvKf6dioysT8A/x6MNdQs15mKol/PsSCRG53E=;
        b=lrvzk+Zt2sXzKNuIhdrSI7vqMwqqNzipknLh1Kn0v5zTym3vKueHnXWgAJU2mrK3TL
         3rBfXCbDAUHyS4u/MZ/Ny2gFjGp48/5pplNEwl6dilDbSUKfu+tz59UfHJYRysnmC+r1
         kWga7L/AXzJYTEavLreF/PE0YMw+LCJBgXLqw0d+e8ZSsejsA3ipj+ob7TdQOEouE7/Y
         ZFKbrjUJdtiXGrBU8ObunExShdT3XmO7Bu8XLrLU9ez6DaQTUmopwQKN7rJ3IXVClvAk
         GIcrVCNZHcZ7Tf+i3vml4vnNlbYnNcpv7iKDpwyBwjYWbETXiWGr/M/m0heCqj2qV/fa
         k4Yw==
X-Gm-Message-State: AOJu0YxYxfktPCzO4QQmGTPCpyXvCRFec6bfjhPsFG7QA/pj9qHSAFPe
	VgI7Hm+JHzqZ7OrZZgbrKOxPVEBvz+6uQqoNwB4O9PAx4KSvDr1Bxe+GOz8Rxk2zf3s=
X-Gm-Gg: AfdE7cksF6q9LTlbZsFcI8pzouaxm9KDQdON07X++KsbjRujgLboocyj7PrijKOc8vx
	x3JrwWEouLbAyhVMkjWk+GafuMrkVgxID//rUxKqCDfRqA8Vwre/TBwqkPq3pI4GD5gIGe2Q9x/
	Ehg4PuxVbrmaGFTRpew9DKAnG4kxJvGbLXeYKIJxXrpuTbRRWkRMfsHoIBJ9j9lTJQohF3zBBHR
	v8HFBxzqwnTqilx7UFMy0IElB7sod8PibplO3sQ6GpfSpcaI93y6YPUY5MHm0SDf0poaYW08LSw
	H8AD55ZPDL7RSV4tacxy3Bt98XjWXyBe5f4ZytyHoSeOWcsFGdqOaBIPMHFE305myyMNN1zF6QY
	AM9qAPkoKNrwTv8MwsR5qMsTbteYbL4HXv0+KAhSofZCHoHAsICXrjLgzSzL9bAt4HbjCM46pyA
	VCknASabXj+wQ=
X-Received: by 2002:a05:600c:3f0a:b0:492:4a50:41fe with SMTP id 5b1f17b1804b1-493d11f05a3mr108518285e9.22.1783330363453;
        Mon, 06 Jul 2026 02:32:43 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1495:8c97:96f4:dff8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa0960634sm24496957f8f.26.2026.07.06.02.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:32:43 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 06 Jul 2026 11:32:16 +0200
Subject: [PATCH v4 8/9] clk: sunxi-ng: sun6i-rtc: split main oscillator div
 and gate.
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-a733-rtc-v4-8-f330728db3d3@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2479; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=mDE5aNV7J0YTDC++0PyqpQq+1LRXe/OEq5dNJJriQq0=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqS3YmTWLBuAgutDebw3ejtGqAFUPS56EkSWc4A
 wtGJpbqBNSJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakt2JgAKCRDm/A8cN/La
 hVRZD/9c7MLYh8cPg12ioyQi+NhtPqzROV5AnuK4OgtAmpPfUuF85geQbj6t5HzciSP2Hh5Mc07
 aeHHxl1ymAujhPPVz/w0sx4tnU+MQcTN0E/JoNe6YjsD4IXSKB2UYWaz2Mzj2rHOBpz8Jt9BdFc
 UQ+FcbGsS1mwn9pQK5kgnb/qp6qptHo5Kz/Rih4Zsnx17p0P6tn0hMHPUa1KSiBattQ0RX+xAt2
 IWtiahvXeBrLgJyzYxnMeK70V8BtmwhBIPs1dFcCzFka/fKigZrksQx8e7ZsF0AUqwkcbbSdIRT
 ZCd3xtLzkBr1JoH/pO9xhIl3YI4eAPZVc/jnTc1DfSNmnrplpCz3KKensHb+1OJgpT9r0h84CTP
 c+cJ1JLw3U1lLEzIaDO8qd6WKjb6zIHaifi0TOp+L/JZ+HHGvyCaSc5Dq2tD7PGFpfwEVAMH3xZ
 tL8TXrkKZuCXaxuOJNB7N3lFLcqjU/0C+Xi7RdoDJZDZ8p4ARlcQYEC6p/16tVFuvRWgKI7cEIL
 mwOOfAGoQLdeKsNPTFgA5qOjVVZNIn24USq7nNhqzvmSXlZvTBpSswK5YjYXGrCCO79jPg3hdwR
 POG1wdQfq4QO6f7JNq1s/CJgCpm662359uW9sY5QIdpPDl+Uui0d9y7VRYZHOHWijGo6fR3pkgT
 ySkhTV0XZ+V7+gQ==
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
	FORGED_RECIPIENTS(0.00)[m:junhui.liu@pigmoral.tech,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:mripard@kernel.org,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:jbrunet@baylibre.com,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[pigmoral.tech,bootlin.com,kernel.org,gmail.com,sholland.org,baylibre.com];
	FORGED_SENDER(0.00)[jbrunet@baylibre.com,linux-rtc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-6909-lists,linux-rtc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,baylibre.com:from_mime,baylibre.com:email,baylibre.com:mid,baylibre.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ADEC67100A6

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


