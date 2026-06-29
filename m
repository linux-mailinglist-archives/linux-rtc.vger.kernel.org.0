Return-Path: <linux-rtc+bounces-6776-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pMFLDThvQmpS7AkAu9opvQ
	(envelope-from <linux-rtc+bounces-6776-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 29 Jun 2026 15:12:24 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B136DADC7
	for <lists+linux-rtc@lfdr.de>; Mon, 29 Jun 2026 15:12:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=kRxnQMEb;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6776-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6776-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5837313FDC6
	for <lists+linux-rtc@lfdr.de>; Mon, 29 Jun 2026 12:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47270407CE8;
	Mon, 29 Jun 2026 12:42:38 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F7C407583
	for <linux-rtc@vger.kernel.org>; Mon, 29 Jun 2026 12:42:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782736958; cv=none; b=LcX5bNXh0jfmKs0riXrmagPl18vxLPWr807H2R+D/6eZKJQwaCFAK+lHscJKknfMVIl4aXgYiYcIkp6fz1B1a6n+9se05kf0oC9ylQDuJMiM9kvMCK+PTq6WCQaVadpWcYidQ8l32uPURsUYp0C+m3i6Aoop3CQ7MTqzm8G8xp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782736958; c=relaxed/simple;
	bh=CMXkvBKW25otLd9mL3jHlLeuFI1KrOKFlpzgrTR57uM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B7OpZsVYV+I65Xqp6R8gkm+a3yhN79DZkI5vOhNmqdmUfuuR6Tte7k9oDFbGjWqFcrfArvGp2KN/o9LlqmwXKqVO5+EUHE8drMJ6rak9TQCWE8Y5UJusVkRBaAE0ExG1SdFNkIqRc5RabGWsdJlyqZW9ibS8lB1YQc/pElU+7gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=kRxnQMEb; arc=none smtp.client-ip=209.85.128.52
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493b0fe95feso5174665e9.3
        for <linux-rtc@vger.kernel.org>; Mon, 29 Jun 2026 05:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782736955; x=1783341755; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YhNzJtjd4g7I67fgHg1GjtzbDZpsXvz5OahsTzru97E=;
        b=kRxnQMEbMQ82qNV/zF3MZOVNW0+35PoZwyiRTnmV3f57ZThweaD7slku01XV5t6H9i
         bZS2vHf/FpMXeUIgB0ODc6dwBp45lzDHJ/61F/Yi4KFksRH6+iRiJnVWjdCk8Gl8W94i
         U1hTC46d7RRpNedze1ir/N38ANv88hF4ERref3np7S8xGdUJ8cuYDIDJGuXuoi85qyFc
         hezvQ4Yz6/bJbXwMC6DXPlcc59CPFB0LdmwEGbzKPFzrrTkfPHEN7aFwvf7XQ9cPrKc8
         Uy6y32Z75ub0UpFkdeAre0kuA5rMydkAGp4GcJrLvLIqtl7FH7x2e09WFBK+2zJO/AGP
         F4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782736955; x=1783341755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YhNzJtjd4g7I67fgHg1GjtzbDZpsXvz5OahsTzru97E=;
        b=PRbXhxE6Ov6itZVOS7H68x4yLUf/IfFJgWAwwJslmkaxcbmNcH1jZsCA+XWejbJPfQ
         P9/IhHc9ELCOvYGUeKNI47nrCdw3C4ZJCoP5CIWi1ndP7SMBamvUSkMTMMX87LNfSPNf
         z7iTs4+8P+9h3kqGRYkWSN4Gy/y65IW3zX18MnvUWliYo4KSi+OkUQ7R5YQfn7jmXRnH
         TISoZzIUM48u5m0yCe5o9g8hEhTwKG4XBgYcKDv84akqTfOPi1M0Wn/agVLKHeXpcvAH
         yFrIirH+J12SNJ+/aQpXH7BXH24Lu7g6EXuPVDxcS/VJ14a2P3AO8dSNpBVcRUn2yawb
         9qGQ==
X-Gm-Message-State: AOJu0Yz0eEBPPOCn4/81wbiOaWZR28Oe7/ld3aUbzvtrHRs84Gpliw2c
	BRtCInSXpgKRfXG6Taa0T03arBgy+Lk/frf58YHmVqFPM5n4rs676FNA+Mh7W0bfXEo=
X-Gm-Gg: AfdE7cmbJn7g7j5DiJAsTgzXnuSI89JOd8HJmtmQstBZ1EykPGZpTVLShd/pstjdlnA
	/FY37CS5tqMz0ILMdyzhlzTeRA2IBpgH5SqGmKgZEOFzfuHbe8T2eHGFfMcE5NdvmbAo380gEog
	LFesFbZR2ppPUL870gAaGuYRZ7naFrLlcPn2SO/80hLAebQ53nT/krcu0DOzOGM+/SBI7FcHsWv
	9e4muyBlb9Wi5ex25ioeuWDAnwhbWiAoFbW4fxjMS/VJl/B35XsUDy97vFpDqmbhbQSMqqx5fBZ
	WK9bR+aQIIxj8umNNhZHhROIJts/pcffgb0J4P2wvApXrxSuxzX8d+/3rN79x2ty2auyw6376GO
	9NrErEPlacBHSL3X2GDfGvkd3J3y1XsJ8buV38+tDh0JiLcY67Kp0vicJU6VEuTjwDJRBOxQ9PT
	ntLW2rhEJpUjs=
X-Received: by 2002:a05:600c:5487:b0:493:a623:d090 with SMTP id 5b1f17b1804b1-493a623d54emr88606515e9.10.1782736954582;
        Mon, 29 Jun 2026 05:42:34 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1d21:f5d5:2d3c:23a7])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-46f8d6f10absm43899161f8f.5.2026.06.29.05.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:42:34 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 29 Jun 2026 14:42:07 +0200
Subject: [PATCH v2 3/6] clk: sunxi-ng: sun6i-rtc: Add feature bit for IOSC
 calibration
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-a733-rtc-v2-3-7b72112784f8@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3514; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=qw1svrvYiRbA39e1tTAaC53/r39CysR7OZmJk6EA0P8=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqQmguZlIuTKrBwsDM7sE3NJOiNO0633kiU5jvw
 iqmqtZQIPGJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakJoLgAKCRDm/A8cN/La
 hVowEACbP1RgJeS6oBE7ZfdUCvyvRI5L1vmoVseCOL6b9LQ+Tk6FNRtcrw63NqYvazVySfNE3L9
 IElyTcJyOiet2Y//r9bS9tHvlsPRAGsGNudc47AIrhEB0xj+NWaA7vOy7+vB6P7yF+HmmAJZDPP
 Qj6m5ooIyFzyPpORnjN9fKeC43a3DDed2F6wPGCng3GkNO6SWNfMYkCHSdi9oXpIw6Xbz1V6Ckg
 7d8XtcOzdu4XAv5QMghkEuwjxLgD8iMEgLUx7R01RE0NVn2h+yHKOmGovBWFrKG6+yToDxHiY+u
 Ly6xRyt0rAYmtFCymRKEURq5j13T5FBOWS75ZjtoIsbdiEnsd6h+wuAm43sHNCIzkFUlW3Rvic7
 i4xiS6fnlrKm6oPE46TR4QHptzGgAEPuuIyE2b7RwW6WI3vEVXl4DBa1B1cZ+dFvgp7Dy8mtq2a
 VIrHKq/a4KDYOpRpMioC8BaVoRTCtpIlMbOGxTuAg//xyLVA8xVJZ3x3bOUigiNdkfxUE4zjbDG
 gOUNewajibt80USpU8Dd42aX3AoTHHAwErV8QOhBA67pf5spWQYZ/IH9NymwqWqpvk2ftCX+pfF
 hBZqiqDzoq2+utsG0Xt7/d9OH41U1qohcK6T/VeSRdyGSTABkFfpgEBxgTL33d/TXiloHWohvfl
 Wn+LMvsA0AiuzZw==
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
	TAGGED_FROM(0.00)[bounces-6776-lists,linux-rtc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,pigmoral.tech:email,vger.kernel.org:from_smtp,baylibre.com:dkim,baylibre.com:email,baylibre.com:mid,baylibre.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 82B136DADC7

From: Junhui Liu <junhui.liu@pigmoral.tech>

The sun6i-rtc CCU driver currently uses a global static variable to
denote whether calibration is supported, which makes IOSC operations
tightly coupled to this file.

Convert this into a feature bit to decouple the logic. This allows the
IOSC clock code to be moved into a shared module for reuse by other SoCs.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
Signed-off-by: Jerome Brunet<jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 17 +++++++++--------
 drivers/clk/sunxi-ng/ccu_common.h    |  1 +
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
index 0f528bfaed00..b24c8b196e66 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
@@ -52,8 +52,6 @@ struct sun6i_rtc_match_data {
 	u8				osc32k_fanout_nparents;
 };
 
-static bool have_iosc_calibration;
-
 static int ccu_iosc_enable(struct clk_hw *hw)
 {
 	struct ccu_common *cm = hw_to_ccu_common(hw);
@@ -80,7 +78,7 @@ static unsigned long ccu_iosc_recalc_rate(struct clk_hw *hw,
 {
 	struct ccu_common *cm = hw_to_ccu_common(hw);
 
-	if (have_iosc_calibration) {
+	if (cm->features & CCU_FEATURE_IOSC_CALIBRATION) {
 		u32 reg = readl(cm->base + IOSC_CLK_CALI_REG);
 
 		/*
@@ -119,7 +117,7 @@ static int ccu_iosc_32k_prepare(struct clk_hw *hw)
 	struct ccu_common *cm = hw_to_ccu_common(hw);
 	u32 val;
 
-	if (!have_iosc_calibration)
+	if (!(cm->features & CCU_FEATURE_IOSC_CALIBRATION))
 		return 0;
 
 	val = readl(cm->base + IOSC_CLK_CALI_REG);
@@ -134,7 +132,7 @@ static void ccu_iosc_32k_unprepare(struct clk_hw *hw)
 	struct ccu_common *cm = hw_to_ccu_common(hw);
 	u32 val;
 
-	if (!have_iosc_calibration)
+	if (!(cm->features & CCU_FEATURE_IOSC_CALIBRATION))
 		return;
 
 	val = readl(cm->base + IOSC_CLK_CALI_REG);
@@ -148,7 +146,7 @@ static unsigned long ccu_iosc_32k_recalc_rate(struct clk_hw *hw,
 	struct ccu_common *cm = hw_to_ccu_common(hw);
 	u32 val;
 
-	if (have_iosc_calibration) {
+	if (cm->features & CCU_FEATURE_IOSC_CALIBRATION) {
 		val = readl(cm->base + IOSC_CLK_CALI_REG);
 
 		/* Assume the calibrated 32k clock is accurate. */
@@ -167,7 +165,7 @@ static unsigned long ccu_iosc_32k_recalc_accuracy(struct clk_hw *hw,
 	struct ccu_common *cm = hw_to_ccu_common(hw);
 	u32 val;
 
-	if (have_iosc_calibration) {
+	if (cm->features & CCU_FEATURE_IOSC_CALIBRATION) {
 		val = readl(cm->base + IOSC_CLK_CALI_REG);
 
 		/* Assume the calibrated 32k clock is accurate. */
@@ -358,7 +356,10 @@ int sun6i_rtc_ccu_probe(struct device *dev, void __iomem *reg)
 		return 0;
 
 	data = match->data;
-	have_iosc_calibration = data->have_iosc_calibration;
+	if (data->have_iosc_calibration) {
+		iosc_clk.features |= CCU_FEATURE_IOSC_CALIBRATION;
+		iosc_32k_clk.features |= CCU_FEATURE_IOSC_CALIBRATION;
+	}
 
 	if (!data->have_ext_osc32k) {
 		/* ext-osc32k-gate is an orphan, so do not register it. */
diff --git a/drivers/clk/sunxi-ng/ccu_common.h b/drivers/clk/sunxi-ng/ccu_common.h
index bbec283b9d99..d9dc24ad5503 100644
--- a/drivers/clk/sunxi-ng/ccu_common.h
+++ b/drivers/clk/sunxi-ng/ccu_common.h
@@ -21,6 +21,7 @@
 #define CCU_FEATURE_CLOSEST_RATE	BIT(9)
 #define CCU_FEATURE_DUAL_DIV		BIT(10)
 #define CCU_FEATURE_UPDATE_BIT		BIT(11)
+#define CCU_FEATURE_IOSC_CALIBRATION	BIT(12)
 
 /* MMC timing mode switch bit */
 #define CCU_MMC_NEW_TIMING_MODE		BIT(30)

-- 
2.47.3


