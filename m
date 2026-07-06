Return-Path: <linux-rtc+bounces-6904-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HRbwCcyAS2olSgEAu9opvQ
	(envelope-from <linux-rtc+bounces-6904-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 12:17:48 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CC24670F0F9
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 12:17:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=LeTFOjDB;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6904-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6904-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 26A57309E329
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Jul 2026 09:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F80C44BC82;
	Mon,  6 Jul 2026 09:32:43 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C368A347BD4
	for <linux-rtc@vger.kernel.org>; Mon,  6 Jul 2026 09:32:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330361; cv=none; b=h5Cp4bAWLmtp2YJoxkhZQ/VE5a6YbiaV4FSS/6F+5me2kKWn4CqN6fPPcgw+dBvJm0iiHuQYNlRmBOVDCHUQ3mtOOFEioBkD6scW/zSt2oxOe752Z4Zvm5isFA/nq9jXwTf5owXs3KBMNNl0DGYka8uLFuc6p17vx/2sHfbcBSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330361; c=relaxed/simple;
	bh=0uBL/FtS3qxYddEpWPm85zwv8RTdX1Kl9yqgj170ams=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rteuhixE8wxlf8QeoSDZJgBhmihv/OvdBqYpDdllxjQwHEIAADouDSN2jflF343fOEgftFnR61C9pGnJvjqIHphLLy/ph9cNZE6Zo6jcRpEa/MBJNpBBPFB/hbbgV3DcWe0rKg19p7qv9RTSSGg1Dkc/DUobPPYOsGu6QnrdGZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=LeTFOjDB; arc=none smtp.client-ip=209.85.128.52
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493c2c0b9a8so25241905e9.1
        for <linux-rtc@vger.kernel.org>; Mon, 06 Jul 2026 02:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783330355; x=1783935155; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1QZ/tzJaIkMNpKGsZtD20B+8zLkYYTOKlJtJuY0qjaA=;
        b=LeTFOjDB4D9BKoQ+hkxRm/Trl/261Id2FhWjHs/4kzsXhjeee6vlFV0/+jpO0k7GXb
         jT9Ikd0kE19VsdQngctwAh90Wk4MQbIgdovqFIKBnZQ71GWdmSv9muL5M3aW1JltGZ+5
         CMR/cEk7MWUKZpTUFYYaHqF1S6YQ7WQVfGZhK8Q1Zmq69snHhpC1Ohd5fxFRbbiqAzmA
         5e7aIQ5GcKqW8LtMrZ8OzUQt0RhfZGOXw7ldVM8yBTuqaWP14/XUqOnwId5+/v3L5L6W
         11CqSlk8TCyUuWJpZFhJwhDwDSPPfb6g7cVXpfIvi11s9R6jxfdJHxsp+IndOTOcaTw6
         JM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330355; x=1783935155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1QZ/tzJaIkMNpKGsZtD20B+8zLkYYTOKlJtJuY0qjaA=;
        b=SLFlzt/Iq7ArPXNTwk+SrI6Wet00KSg4Xj96g2F20Ys8s6MY/WTWBtFTmBedalWEF3
         aXXnc43vGXxStGxX4ufPf0RhNhc5Jl/ozYu7+6M5uYbNrDlg+vlPaO2c9aKj/4FyFm12
         SYApgTT3mGJM0zSVgozZRZ6UlsJH1PTNYy3bepVW7AuBitVyq1I1BmF6w8wXbLmAxFRf
         RltSvQ+NrZG3D6rw04LWq4G6NN9siITTkEnqhHXrWV/EY/FxveITEYxOBde4KC0pSIHp
         msyjVO1xOWROEKb2PyKvVDMljhmoATvIM/JR2qfUINgg0N+avxnDYeuKT8CoCRAKBAd1
         3cDg==
X-Gm-Message-State: AOJu0Yxdci6f7tsLnYdF8hiQ7Pj6xFojlMKo1OCmt5EbnWFmcwOv/ft3
	zwYbQtM57gVqQnM3gNGsixDtrqRE047OJMfhoOlDsUmcNiI57Ejh499rF5IXPQCoJo8=
X-Gm-Gg: AfdE7cmyJQCHnFynTDj66ZhDqrFcfOsa/NeFoLN0ewA6GSGgVmkc46etyPv9AV/I4Qm
	DmaiL4FmKpA2EvKKm6V/4taQyQbwTqqD/ughCFRJg9let22EPsAcyPtymPjFichWj5aPGxsyz29
	i73qvySevFA4XnhRwc4lQ/nzDrr46/NsOhRcCViY3/vQm9YBsGpYv6AQDpfGAknFys5vyokiUOf
	bx1L2XgZ3f9ecVsSPeaK0x2CLivQGG6LXJ5bW36dl/vhvsK0EglLTFpUtTpiJMV+hoFOnUsnvsd
	3vdK746ETstrl3Hvaj/vLGuOKYBndkC9y01vvF3AUR/TfeiQffC/2cReSKDjmjA7oyNWWF4NcHp
	stT+RBh8trfHI/ZlZmsnzCVM4C+W1rv9zh+/zcgMMqrdmvLtovmJdhAB3N7vNIHtaJh057Ax+6F
	d3FAyAnH+cdaI=
X-Received: by 2002:a05:600c:811a:b0:493:bc92:ba9a with SMTP id 5b1f17b1804b1-493d11d7e5bmr93766755e9.13.1783330354669;
        Mon, 06 Jul 2026 02:32:34 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1495:8c97:96f4:dff8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493be4a343csm317962395e9.0.2026.07.06.02.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:32:34 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 06 Jul 2026 11:32:12 +0200
Subject: [PATCH v4 4/9] clk: sunxi-ng: sun6i-rtc: clean up DT usage
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-a733-rtc-v4-4-f330728db3d3@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2679; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=0uBL/FtS3qxYddEpWPm85zwv8RTdX1Kl9yqgj170ams=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqS3YjAlK/wAezwRG/Br2o9jTucmyJPFDAgWQJK
 NGnH+1LXpCJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakt2IwAKCRDm/A8cN/La
 heKGEACVs19xz8UT8PIIUFWAjitE9+NBDWhZaJDxvNcUM0SxaCYy96bafmU0d+a2rqtLufr//KC
 Z6WuhTQ7tHSglmlAJYJGPYFWh6rGPUtCTUvd6+nEaLUUGiCfk0VnOtJDTlgka/thanIyvG7C8Ib
 CnWqoMTk4qimPYytuWrTsIffWAuOUIrOsz3DfO3rvDqFU+n+PfI9lXD3+kAY4OLnh2iVuDKk3g+
 wOoaaCddMgxevDmh28+DckALZ5DPj8b4mmDtYdJBfeq+8wB8rH0oTYXMh2YvS6Il5dFLoEkTesb
 X4HEJd8dKaMDVGMIi6Sn+USIZuuIWRpydFCalXQxQhSz8AmNYW/nCF+Kv2J6olyH/yehTqdaqFZ
 RBfacTRrrZVF4K8KO7E1a2eCcFAlV/AXQqFKWqIw1Kljn6x0vMJm64IKq37s0/pMu/tFHpL1Mul
 /hdDazToGy9fdBo48oMitjchP2j3noiOnFZqGn2ZZuqc89RBwRcaiOaEiqxUfDo/74XQe7Z7xls
 cR1ohmd0I1POV7Gp+SKuS8PGZcKzfAISw3A1AnGb7pkYQCf8PsrpXM9ofPeLziH85FqvKJo++9c
 TDK8n6R4fNRVe3j3kH5AZRPFsgn4ijCQKyayBO9Ak2WcrTkCbVATnAi74NLyP+BzTG5fVygyNJe
 Ke9epCWPHbybvhA==
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
	TAGGED_FROM(0.00)[bounces-6904-lists,linux-rtc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:from_mime,baylibre.com:email,baylibre.com:mid,baylibre.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CC24670F0F9

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


