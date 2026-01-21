Return-Path: <linux-rtc+bounces-5817-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIa1DLK2cGndZAAAu9opvQ
	(envelope-from <linux-rtc+bounces-5817-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Jan 2026 12:21:22 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D9955EAE
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Jan 2026 12:21:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AE5A39604A6
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Jan 2026 11:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C41947AF5A;
	Wed, 21 Jan 2026 11:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="ZLE+eB6r"
X-Original-To: linux-rtc@vger.kernel.org
Received: from sender4-op-o16.zoho.com (sender4-op-o16.zoho.com [136.143.188.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB09A466B4B;
	Wed, 21 Jan 2026 11:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768993485; cv=pass; b=P9ygdLa/U8iN0LKNfS8bCNd6Panik0uBbblJes+O/mjNVZ+MJZwJCwM3DQXsz/ilBUv6beRETYfx92v6kkmuMUVOHAdkMXK3AC7G12ZPPrc50G1zFP84C+0yQO6H6is4sMyxglBCoXU87hpHR2Jxk6FHbIAiDhIgxnIIWqln5+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768993485; c=relaxed/simple;
	bh=yie5eDb9BUEl0Aid6eA7yIm0Tl3wT/Y7FXEWcLOUikU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GMhnXK/Rrofe8FgaKSrLQ+vlvCtFLbkW/StfokOxP0YjB1HSnzAwCTIaarr3fG35cYS2vrnf8pVXT7b0WIU7zrK8UiJFiZFiys44EBHPcfMLmhHkgKogvSuQwisvv4810qxgbvOFbjBvL5wc12pzIXqo68X3m9ceJk3QVkEkiHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=ZLE+eB6r; arc=pass smtp.client-ip=136.143.188.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
ARC-Seal: i=1; a=rsa-sha256; t=1768993466; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eb3hiUC5Koqr6vPcmvWzPJdUAk915tMpGc9bHh6mTEzVZkdNkI31Kcb+a+cCH5VnoYmKFQIwzhMb0b1Dio0W7MDZFwVU1OlmBR6phV+BJRTQ0utXykSc8s9eprViyX1tSDUrkPqaeOkrT0QqYyb7B6S8HyURO7yhiuh7lQoge6E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768993466; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=RJub5ZPZsJzcOi4zRa+ExZyiUH46huzX/t4vX9Ke4aw=; 
	b=La7j1YqmWwPHritPc1rW6d/gW2BBoLpO4JJYoav6aSKBh1omjZ4y4uQeLAUgXtBoU+9MQXqpxw8veqsAOe+Zi6quU3R7uYasONH6y8PKKrrFqbc8Pkzln5PUE7AWVGUsLBBXZnejcw/zZ3yvoumWJqEuIMxOP6vUZlW/liUilTI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768993466;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=RJub5ZPZsJzcOi4zRa+ExZyiUH46huzX/t4vX9Ke4aw=;
	b=ZLE+eB6rErOyEkMgFBto2im1xQ1ZOrIIEN34eLu/sMWlIkv2VW5LwlIj5xzxTMMp
	+I3O7gh+WN7qfM92e2T+qc5HoIGZ2V+GYb4wz6CG14JooRAdyFVBNv0ltE/NR+n7H1m
	0y2fSfg/P2MYgqKb/mi197s87zrNNAss3Xqzu5W8=
Received: by mx.zohomail.com with SMTPS id 1768993464430169.99826292706462;
	Wed, 21 Jan 2026 03:04:24 -0800 (PST)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Wed, 21 Jan 2026 18:59:11 +0800
Subject: [PATCH 5/7] clk: sunxi-ng: mux: Add mux read-only clock operations
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-a733-rtc-v1-5-d359437f23a7@pigmoral.tech>
References: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech>
In-Reply-To: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768993386; l=1825;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=yie5eDb9BUEl0Aid6eA7yIm0Tl3wT/Y7FXEWcLOUikU=;
 b=9BCMuiNZQfMjro/P67t39fZX/nmh4DdJ8jFx/n3oo2WozsR3OdLUMu9+Ny/e+pHwGOx4vg8F3
 MQI2nQiRjoaBkyMIgonRuwoTrp3vuKfvUKFUaHVZ6FdvzaIXv7d+5eW
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=3vU0qIPJAH8blXmLyqBhKx+nLOjcLwwYhZXelEpw7h4=
X-ZohoMailClient: External
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[pigmoral.tech:s=zmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[baylibre.com,kernel.org,gmail.com,sholland.org,bootlin.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[pigmoral.tech];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-5817-lists,linux-rtc=lfdr.de];
	DKIM_TRACE(0.00)[pigmoral.tech:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[junhui.liu@pigmoral.tech,linux-rtc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pigmoral.tech:email,pigmoral.tech:dkim,pigmoral.tech:mid,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: E3D9955EAE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Allwinner A733 SoC introduces some mux clocks (such as the one
indicating the DCXO frequency) that use read-only registers to report
their current hardware configuration. Writing to these registers is not
supported by hardware and should be avoided.

Add ccu_mux_ro_ops to support these clocks, which omit .set_parent()
and .determine_rate() to prevent changing the mux state.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 drivers/clk/sunxi-ng/ccu_mux.c | 11 +++++++++++
 drivers/clk/sunxi-ng/ccu_mux.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mux.c
index 74f9e98a5d35..d48e7c3e065d 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.c
+++ b/drivers/clk/sunxi-ng/ccu_mux.c
@@ -277,6 +277,17 @@ const struct clk_ops ccu_mux_ops = {
 };
 EXPORT_SYMBOL_NS_GPL(ccu_mux_ops, "SUNXI_CCU");
 
+const struct clk_ops ccu_mux_ro_ops = {
+	.disable	= ccu_mux_disable,
+	.enable		= ccu_mux_enable,
+	.is_enabled	= ccu_mux_is_enabled,
+
+	.get_parent	= ccu_mux_get_parent,
+
+	.recalc_rate	= ccu_mux_recalc_rate,
+};
+EXPORT_SYMBOL_NS_GPL(ccu_mux_ro_ops, "SUNXI_CCU");
+
 /*
  * This clock notifier is called when the frequency of the of the parent
  * PLL clock is to be changed. The idea is to switch the parent to a
diff --git a/drivers/clk/sunxi-ng/ccu_mux.h b/drivers/clk/sunxi-ng/ccu_mux.h
index eb1172ebbd94..887c164d00f4 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.h
+++ b/drivers/clk/sunxi-ng/ccu_mux.h
@@ -129,6 +129,7 @@ static inline struct ccu_mux *hw_to_ccu_mux(struct clk_hw *hw)
 }
 
 extern const struct clk_ops ccu_mux_ops;
+extern const struct clk_ops ccu_mux_ro_ops;
 
 unsigned long ccu_mux_helper_apply_prediv(struct ccu_common *common,
 					  struct ccu_mux_internal *cm,

-- 
2.52.0


