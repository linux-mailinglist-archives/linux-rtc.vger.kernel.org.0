Return-Path: <linux-rtc+bounces-6861-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PjT+LjQfRmpOKQsAu9opvQ
	(envelope-from <linux-rtc+bounces-6861-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Jul 2026 10:20:04 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 539026F4B3C
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Jul 2026 10:19:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=dLtPVpiH;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6861-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6861-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 656CD3048FC2
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Jul 2026 08:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A57D4229B8;
	Thu,  2 Jul 2026 08:10:58 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B954189AF
	for <linux-rtc@vger.kernel.org>; Thu,  2 Jul 2026 08:10:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782979858; cv=none; b=lZ5w6A/l4T5ocXEpQ8QU2X4HdV7ee8IcZTozdO6cvUKh1tstaPDEzVSF+ITLNdBHcsNnnQqhwDdRirxYSql0t2pjEbN8AWfhE9qTSwjxylsYg/1f8IPOLqhQdPtV14z+8PCsp0dQF7fDV518Soic1lPrYrugnT8nV2bgamfuMnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782979858; c=relaxed/simple;
	bh=gRy0cN4LadJrCLwhwvNgyXM95hAtl0BkbsLdjuQgW6A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S1CgAqETGNJ2HrnQOTYCYlhuaMj+sRfCyKHomqLly48m5sVfnqt9KZgvsbBwJFCATjdUtt3uZp2mLwVX8as+WCtmQsxaoo2ubEwrc2PSVeOSVD7uk5+Q3cKaugqmnxCQOv+1J9gg2y7qxYJCZaorua9Ls+7lB9qLrTyIOctdeQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=dLtPVpiH; arc=none smtp.client-ip=209.85.221.46
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4758bd3731bso218353f8f.0
        for <linux-rtc@vger.kernel.org>; Thu, 02 Jul 2026 01:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782979855; x=1783584655; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gpZvamYw9AnVrZnk1GFQEFXSHxgLU3wS0Rp+AMjlVD0=;
        b=dLtPVpiHVpG5sM2IZhCfFjfPuib1TLayWDLEzOIauXInU9Tw+16SQBIpLJVBHMD8Z0
         NWYjN5o8Xee2Y+6KWG0YNt2VEsChuCslDtOdgDN99k6dyCLfTzZ484qUA4M4XSDb92H6
         Cw7xG79lZkI+NOUSIsV4Yht5j7NIiLtBPP8dex7s0Jxz8WwK7AZv2+b+6DTRkeg96n4a
         n7QWu1KRuAIFbTmIinhZtHU51RJuCUqRF24rqGAactR9KsOsU3wmsGpNx9zbSka0Bxy8
         QmytW15Aa4vsCj8SjW8JuhPCGl5PoEEZKf49efDcOKFWb3BEIFSNHkyafov9PPRcbXAM
         yS3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782979855; x=1783584655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gpZvamYw9AnVrZnk1GFQEFXSHxgLU3wS0Rp+AMjlVD0=;
        b=fO8nJ9PVa1jAfRh7lvIK3nEHhBpkNs2I7hrYlvRiteU2FFJNULeUweZ0sVi3SiqFhK
         a4Rbzpm0h6mrge2Hew3+bK2/xqCGHZSJVdQHfcR7FT0IUbaapVBLzhy/H69u2gbqOPXf
         2LeAlwR0n9NPGBwQonUqZsqoQ2uFLdXpue27EoKdGXGgDWTJ0/jhGKHWdgDA8sOH3DrI
         6qm6TsAIyE8i4/QVcd/xllUWd+IZeDSFzjrbQOIPe0esIrNyzb2ifDazAVO/x6XVgjb3
         13warplV4mgvyNsdoetqaieOPHSETVLXNzNPLzRKIAdhrt5++12roy3esn4q5kdCF632
         ItYw==
X-Gm-Message-State: AOJu0YwkeTpz2aOvreNpFxlXR8NdSA6Rmn/TE7sJ7H5Jw2VRnRt4k489
	Z1QtUZBOabnC3dgu8/+n0eRhgH34qM+cDAsPC7qeDJjDTIiMVw+W+m7z6ghmSLKMuFg=
X-Gm-Gg: AfdE7cmAnhVz8SzBnEgV4tdXhNBE3niDhpEVd03kptDnoO+NnvklZifUssCto8+IlY0
	MGLYyaL47oH/2ayi/KizTwis5D1HVPJAInPEuHx912tP6TnrRvAJIaFhmRH+DuTIt+hvaOosxTM
	5mUKaO67JCiCIJg5Mb9fopSoo8YMmzvalPj5eXxAgR276v8ZRYkE+9NKt3zPxHUHO1kFSVXscUq
	nL+E9kEl/9aUcRuSof3bhMUjiQC9FCWJ4v/S2NV6876sTMMvNhhugg+GF9xWk1uDw8b/qmmUUOb
	zy10tjI2lFIeYQsQZLTIioDMGH+3QZFc+t4eJht41kNTbZLX8+NMVK3j5gjiAToV8QrDOPVvr4F
	x1btx12Fe2ccxniBQCi3GBDvCFQ6li/trbObtC44Oeunu1kyhm+AQhPVTvt+hi35iK7iLe/U4kJ
	DjQH4evYNK+yM=
X-Received: by 2002:a05:6000:40ce:b0:473:c2ec:7a79 with SMTP id ffacd0b85a97d-4774424350cmr7132004f8f.12.1782979855094;
        Thu, 02 Jul 2026 01:10:55 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:2e3a:7dcd:d2a4:6556])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-477db3dba3csm6687967f8f.3.2026.07.02.01.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:10:54 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 02 Jul 2026 10:10:04 +0200
Subject: [PATCH v3 5/8] clk: sunxi-ng: sun6i-rtc: Add feature bit for IOSC
 calibration
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-a733-rtc-v3-5-eb2580374de6@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3560; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=LjKLqtELI/k5Bm86qG39EiNLmLLQg2pvRCFKcypyAtM=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqRhz6iQ4ImmQHndHiBUqhJRQYIbF2ssh6u4zet
 LAX/Wa+q56JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakYc+gAKCRDm/A8cN/La
 hevvEACvUM3ca8OwIt1oufqC2tSNAYGaxdWOw46j08bNcil+NPfmr/5Af1LlNbH/cnK2mvD9i17
 uhUOtHab6h+C5k9mFrYY1/iEpNmMfiAqNP9b/SiohQo4XXQ7vH9aCSJwWzZAlrArxDjOkodWaUc
 h88RZxUvA7mpw29FBOGQWAxNpADzCWGUspkbA8rAQRvm8euwYNVi7o/O/eqFeiyK5NHr1BWiZjK
 qHzdkatztZ1pM4D298w9UADjl6bwZ/dDwaRXP5VQp1nZW8W8YDaCjG7yS+RO7IomoAJgRApUaRZ
 fCv2H2xgcSB9tIG2M6bbAzlbJe9oHGE8VwmGCk4XO2n42566JCVwypwJDkjpELB7bHudEQpOe0N
 KAlOo18K8PAcZ5uZNFnxWTOZXeiYLXjOxPAUdCpyQm7RyTZ7oXKsm2oT5k8painM4yMkDUXnRVB
 T03tesm9gVdVWILE+46J+kE4sOjXiNG1Pp2Rw1TPyVPSHfgQ0dFqutz5HsYLHOAQYgz67YjOXfU
 pzBqi+eTBeBslVZK09E9N6D9jQjjoLPsCuxdb87P8ml5T5tLNLxjNmQtkhUUGOERDfIenO571u8
 S/AJZCLIex6hlXowPOaM5FRdQFsxE2H3MNvMuOYOZfpG14rbnirk8o1Ip4YH603HjyOic3M3jSz
 A40fFvy4QCn3l1A==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
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
	TAGGED_FROM(0.00)[bounces-6861-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:dkim,baylibre.com:email,baylibre.com:mid,baylibre.com:from_mime,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,pigmoral.tech:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 539026F4B3C

From: Junhui Liu <junhui.liu@pigmoral.tech>

The sun6i-rtc CCU driver currently uses a global static variable to
denote whether calibration is supported, which makes IOSC operations
tightly coupled to this file.

Convert this into a feature bit to decouple the logic. This allows the
IOSC clock code to be moved into a shared module for reuse by other SoCs.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
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


