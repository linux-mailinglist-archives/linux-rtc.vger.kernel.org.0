Return-Path: <linux-rtc+bounces-6860-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6DAaI2oeRmoYKQsAu9opvQ
	(envelope-from <linux-rtc+bounces-6860-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Jul 2026 10:16:42 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC096F4ACF
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Jul 2026 10:16:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=kJugaat4;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6860-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6860-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6D6B4303CC70
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Jul 2026 08:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 367F14192EF;
	Thu,  2 Jul 2026 08:10:56 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEDD420E6A
	for <linux-rtc@vger.kernel.org>; Thu,  2 Jul 2026 08:10:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782979856; cv=none; b=NItaTYsM4QX84NJNyrqK0DaKQgZazQWqxTCCejYVWcwpSIMRFJxoP1ppKs2Df46h47jEa6xHiy/vvXtZEQcMvxfQ2mqlecjzeQnlXdtHs280ILC395rPkY4BzLFtbME7DDUgaui6c9siw3SDSZzTZveVWGGVA4OsZQKlrhJhfGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782979856; c=relaxed/simple;
	bh=0uBL/FtS3qxYddEpWPm85zwv8RTdX1Kl9yqgj170ams=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HwACRKdEI3nh0iY15aNlJu6SUjtj1KFTlqPZwp1350cHZvqML/bXdhtZMYnHcipTMRlXWujwrZUiIVtNFRl+kduMPnEx0DL2zgpFdMmhDmKmG1+5smOueX07w4Vsb/r4S0D1UHTozrzf//a20P/RHXIF4e2SIbQ/mk2RoKG/kw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=kJugaat4; arc=none smtp.client-ip=209.85.128.47
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493c83474ddso236135e9.3
        for <linux-rtc@vger.kernel.org>; Thu, 02 Jul 2026 01:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782979853; x=1783584653; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1QZ/tzJaIkMNpKGsZtD20B+8zLkYYTOKlJtJuY0qjaA=;
        b=kJugaat4h4Myzwry9c8tX9puD7aD2Wg/LhZ8Fe12dHc04XPId4xU0Nk4CCN2pRE9Ss
         k6GmI9mSY2w33BDE370S6nFQucosLDoQkNnrzPDmBGd1a+JBf+1STSel57sA6nELBMzA
         qm2pzP2XuQwhXmPuK2kbCutYaTfoQJ9l9cj/Bq9/0uI8SeWJyabuaSAcWGlUVvDgU07b
         +O52ROrQNBxANmLuzM1L0tAKUBMGWxAxdQwwyrg3IKKomiDku2XrjWlwN+7k8XkDDusa
         bdxCMDU+TtuI57KeEbmLt+uYFmhMEO3ckei2XqjKKyALMdykB5PxBQhW1r1bL6OmF6Fz
         VyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782979853; x=1783584653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1QZ/tzJaIkMNpKGsZtD20B+8zLkYYTOKlJtJuY0qjaA=;
        b=hhCEqyUKgtNrd2WjX2DiYdFPK05kZl0sNKGXS/Z+XfUdgejbJSVtxvwB++JJrY3Gwu
         zKWl2MGrm/2ziI8xXXAwJgzMjFFYz/Xchio4Bz7t7dGaZEStRiOu3mp/Yk5YDbHWMY6P
         p1pVXVkF7zHp/poOWa+dacr5/PdMlX5sVgfLEjwqxEU94Pn/XND7BukewcNORSbgPPAj
         h8mI/mvYYGY8uNXTmCFV6rZZ677JsJ3EzX9WPytlvvschAPm14nmIWJChvtaDCehib1h
         YUjHMrhLu6rnEXwQwW88WgknmsqdTCVHOjMfZD6VwsX1nXhbAqeGFkl/O5uay1ynuRl3
         rGcw==
X-Gm-Message-State: AOJu0YyjOuyg3a0+ML80NIv9Ldd2HMGSDi5EbM/XIU0oofTXElf5fwW5
	W9a0BwapZFgSs+RiiK3Di++pHPPfWDpiw9rN9Pfrkm657bUdMgqR9xJUnHMfEZuvXNEEuE3Fo6A
	9M2BY
X-Gm-Gg: AfdE7cn2PCSnl9SR/LhNWo5LTHvy9AdVoXyW8Y6EJMZjk2oHKZCr7L84tC+LjJKOCQX
	yKpRH7jiMakaSarNx/W9609uN4JlUrxJDsKFKG3lYlo8/9F+LstSl/iC1CYR1aYSoYOAMhe1kSM
	FAVUfZ2oppLRey6GUa/DYPpFjxjD8RJ7tqgaG5bmqnbK4xoJEipyM98WWz/k+6dq9vcFwOrEvPE
	xNH4Stc185jKJl7c2DqremnZNRIvVDqDeSa4aVmubdaqqp3Gu0XsOrUUKyEQm/11eJyUM+tZM4k
	jUUu7ZB3ypbx+OFykHxlgYR4V6BO0456UspkXXtnF++ntXDEZ0gWBinoMOQZc2rI1nGq5R7Vdeq
	aiN5om5yRUoi+gwGk/HbDT+LtTm+hB10spj88bUv+s9GX5R4U2ubFgZ2c5AOVoqFsUM1nYTnSWj
	xH/5+WMXnGJGk=
X-Received: by 2002:a05:600c:a4b:b0:493:bef8:ba8 with SMTP id 5b1f17b1804b1-493c3dfc635mr53639805e9.39.1782979852907;
        Thu, 02 Jul 2026 01:10:52 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:2e3a:7dcd:d2a4:6556])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493bfe7427dsm70001875e9.2.2026.07.02.01.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:10:51 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 02 Jul 2026 10:10:03 +0200
Subject: [PATCH v3 4/8] clk: sunxi-ng: sun6i-rtc: clean up DT usage
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-a733-rtc-v3-4-eb2580374de6@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2679; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=0uBL/FtS3qxYddEpWPm85zwv8RTdX1Kl9yqgj170ams=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqRhz5uKxhDHKubvZxQtlYpXYIvwPrXCLC0seV1
 WNDhZX/FeWJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakYc+QAKCRDm/A8cN/La
 hUh9EACSTxeO/WGvg3k425s7xQALo9JT+meGwuevXCEpXNGpfJmYnCeWBOdYw76IaUfLZz8piWu
 fiie9pcLKv1IbGsRhzkUQ7XXb+AWMbWYTy18NjnDAw3JR02bSjqY31qrNTtj82Ih153RgolV+R3
 GGRtx8Uz1+F/a/RDy5GWAInXgSjazJtka1+8wQIXbpx6Tb4fnXXhUEsROIJlCGLx+GYAGM2Jo6N
 Yb/OBdqgFyOez1K4IgYerUPByqDRq9jRpN0FOR436buNMnAT+gAt7crVCsKOTHpE1TEkTqmbvUs
 abVPh1Xlf0XYjv/t8Pu9E/jCgA2illPyEo2OHZWAqfDexBOATbzlUJHAIiMOGrHEIGgipt81JtU
 dC1hmgoUzL1fkDvnkbwya7VSwPMtCYVTLNAvvPNu+UPq76zDxvG5xNmJGbJaAdFp/nZShjy2l1x
 KaBHVbcJxomgjd7eHdzdAaygeCz1OFPyd2iSNaTPCme9xFnKGDbC07oxPyYMsWHz807sGzm8lbE
 P8Z2fu5YN0DeEEZvIcTDYh5B7kTyjcpDYeYF7tPnQXGnnJ5aihpkIZMs1R1IPavzLOosR+BAXzm
 VU84Lp4KFojc8TShzVyouOFSlPDx9zE8qRCNN14oHHIJb6hMwcqlSMXGCMk09BFbGUt8yq0HLrL
 vPhFA0vSiaoyD0Q==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
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
	TAGGED_FROM(0.00)[bounces-6860-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:dkim,baylibre.com:email,baylibre.com:mid,baylibre.com:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2FC096F4ACF

With sun6i-rtc compatible devices, the "ext-osc32k" clock input
is optional for the devices that support this input (r329 and onward).

Probably preparing for older SoC support, the driver does something funny
when parsing DT. It check if "ext-osc32k" is present in the clock-names and
if it is not, it uses the first clock as "ext-osc32k". This clock will
actually be the rtc bus clock so what the driver does is wrong.

At the moment, the driver does not support the older SoCs that would have
an external 32k clock provided on index #0 so just remove this quirk.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
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


