Return-Path: <linux-rtc+bounces-6778-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id e/+9NUhsQmpw6wkAu9opvQ
	(envelope-from <linux-rtc+bounces-6778-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 29 Jun 2026 14:59:52 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BED86DAA8D
	for <lists+linux-rtc@lfdr.de>; Mon, 29 Jun 2026 14:59:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=NGaRvJ3p;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6778-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6778-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 096D931291B1
	for <lists+linux-rtc@lfdr.de>; Mon, 29 Jun 2026 12:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CDA3408620;
	Mon, 29 Jun 2026 12:42:42 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD0A408028
	for <linux-rtc@vger.kernel.org>; Mon, 29 Jun 2026 12:42:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782736962; cv=none; b=JzdadVkOoGDQyzifV4eQalOKVWXZm32RUYQQKrAmbaXI4D/GmxUASPUfpVZBc5EcoVRFKCQidQ8pUsS8+FChR7F1edEH61dEdDapSL/xvrQPBeO0YOQRHJpJ53W1stDQ82hb+pzMSDTijIeUQAiXpQasDnnwt7uEegiwTLn9sQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782736962; c=relaxed/simple;
	bh=mDE5aNV7J0YTDC++0PyqpQq+1LRXe/OEq5dNJJriQq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j0ZPxxOTsXSs79uoo3zHEcwYI9tZvj7YaxkNUJhRddGuZ1joRPlQBby9HkiAYOqaWy9ZPsrxcwkEDaLkF4dzTC6ieDw8De3U2WrXUk6wMFULkN4abWehs+HSq4f75Eu7ph9HUSJ5IYNiX1Q5eZT8CfIEZeBZDmT4Eg0rWgFZMEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=NGaRvJ3p; arc=none smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493a7bd27c2so11814035e9.3
        for <linux-rtc@vger.kernel.org>; Mon, 29 Jun 2026 05:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782736959; x=1783341759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rSh1ZBRvKf6dioysT8A/x6MNdQs15mKol/PsSCRG53E=;
        b=NGaRvJ3pKdrzawa5CQoL2X0tGODbKMiNJ1m68rKTbe6BNTpBnrlynETqFz5kP3t882
         /lGSfikchUWVdfYyW+LTrz9ofqwhT5O/ntRiAhZw1ZLOG1YA+VVDym5rlMT77GwETCyj
         Ve8sQZoYrgnDpa+tJfKNVQ5qttmI5HT893lyieriAUtM9tPtHmhj7jM9CNezrI+sdrz9
         0u41IygVqV4eRZIUIfUnFr9cyC9B7/02kwiUhckiznXUlIjqsF5dB3z7NtK1/Sw0xrv4
         LsRZeqxQk60eIvA7kW0VJWi5j2UoCEH5sTe7oy405OeSwlzsiswNKw5UZ8luhnH3l2hv
         Hj2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782736959; x=1783341759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rSh1ZBRvKf6dioysT8A/x6MNdQs15mKol/PsSCRG53E=;
        b=c2UT3BSNxNEbyBemWu5sAKTzkmx06GjfupEZifGDrfxiVwZTAMcoVsbJUFIo/3qoup
         +/TZHJz9m32ruoln19dgX+G++iHZIOQgY2r2OnaRW84xtxXnqGM+77Gi4DOpjmIpiGAJ
         HMRLkLpJ7mg42sRIujAItxttkd8ZsbUBv9gBxs2nLEJOXm9504jhOlVYpamsezauyVAZ
         uKohrIg76fGhINoPPCfe62IMmgQXPcep3BS6PEu2t9OveScb3MoattmM8Hgu+Nb3O3yQ
         HQJafXGfhCkBDJ0dCYHH8joZ1M1N5A/k3loMwI16ynyS8aFTru7Ti0/ljypiA+qpkFEH
         blAA==
X-Gm-Message-State: AOJu0Yyl7kOOfZxSLSf+tdjuuWqtvBJ7MZ19A/KWvvSTET8N7/pIlJjY
	ePuSePxwIQUHRZbbYrPvLEAKaV78LvHKmj9azd5z17NY6S8C9LU3ebGEPujn9P6ANrWfzY8qkFj
	Hb52T
X-Gm-Gg: AfdE7cnBkBnYZZDPgSnPHvbUWKjo58vAz6n9JvJc50Dgo3xP7FiF/Gpnn0ABTlTWIe5
	qHELECO4dPHQfnGLDDdZGMpxmsWQO2wAckD0XZvYROJG3J/2pAaXad8mqbwyQ/4SjqEPDQdKlhM
	7f5YGMh42WkBBoxUWVJb3BHfy625NfE6jvaPqiriAM0zDEfDontqVNlpTOC86Qj4Zl7bm0mquBZ
	gi9mblUXocJuXl8t4NxdxbRS+mWP8IfLg63H4MFjZA7L7Y/Vw2ahYh2mpu4WUfEta/ThOU5w1vq
	qBT7P5dxnEklBAKPSR4VG9fXy5ZIiIY17MqBwi2/TaklzH2ALPLCDOn0YMJK+Q0n94YLSjhCEWH
	qPKJ9uTavW/oL2N1RlSohjCl981gVQjfD+KyGN5cjltn9/myN1ucEtnNIB5EHApp3AcxFbFEFPx
	LVsX2dmOUiYQY=
X-Received: by 2002:a05:600c:8b30:b0:492:6eff:7d02 with SMTP id 5b1f17b1804b1-493b71dad66mr10202405e9.30.1782736958743;
        Mon, 29 Jun 2026 05:42:38 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1d21:f5d5:2d3c:23a7])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4730937e18dsm14116290f8f.21.2026.06.29.05.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:42:38 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 29 Jun 2026 14:42:09 +0200
Subject: [PATCH v2 5/6] clk: sunxi-ng: sun6i-rtc: split main oscillator div
 and gate.
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-a733-rtc-v2-5-7b72112784f8@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2479; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=mDE5aNV7J0YTDC++0PyqpQq+1LRXe/OEq5dNJJriQq0=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqQmgwCcpAim4iGNmxcdYBHSDfCGlZjMmgEkjlG
 pEgFgGXBn+JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakJoMAAKCRDm/A8cN/La
 haOZEACnFfbvW3FhdzHAFggeUxMCHosJfDMAsVLsgX8coJCaSYo7KTr+uvuDH5zi96kgfbQFk82
 JX8sRKJemEUWdYZWWiBiqVSWYlk0LGOqL1aeqZjNYRpcHDuo+bEZSUute478X/gtGo+xF+Euqyx
 qc7ecT16wVXAGk6Ti6B14ixs+kgmoai6oyYcW7u8hhVpyfsC8+RaawD/4ng0FE5W0U5mhkAtrZU
 quu/IsG8QrFmvHaRy2b+clEQdK9t885FlCriHWlqqv6L0Sq1OLS2oyFpXmtwNpcdx3yrzPr2IIl
 +3EU7yJCxknNQh42OtSEBB+KwnCUUY/mWyQnOPihDWtxWT3Uoc3OVdJsaZdYkOL5zBrttkVmMKr
 d5E5ddcl3ChK4VuC8rjgjMhs19xua46P9haUS4YSlaXtUn3xftoXpfNwtcERxLlxVjAD37M0ti9
 ioQJ093gTZFRC7JPe6LETF2qSlneea758Jm26jQy72/2XhemfiIZUdQ1Vg9iD5zVlFvRDZ4Xv2F
 +WVGtuV6ayT1kuc/vV+VwQ8umGEzGBF5JsTxHTUjPvOxQIy5AncPF9bkWrxrG0Cilc4JNgYNZ6/
 k4f5yOMZyIOlo+C1LPERCOt0MZICSk9UBeQeyrAEqHGaL52hNAQtcQ3b2W1yVzdcy6S0YkN4Wjv
 2JBzJngCguw2AUQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
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
	TAGGED_FROM(0.00)[bounces-6778-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:dkim,baylibre.com:email,baylibre.com:mid,baylibre.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6BED86DAA8D

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


