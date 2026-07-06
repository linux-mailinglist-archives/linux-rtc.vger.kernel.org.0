Return-Path: <linux-rtc+bounces-6932-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y2HsBTnuS2qodAEAu9opvQ
	(envelope-from <linux-rtc+bounces-6932-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 20:04:41 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FD6714418
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 20:04:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=qs2+alxI;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6932-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6932-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 71CCC304A9C1
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Jul 2026 17:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CADB243784E;
	Mon,  6 Jul 2026 17:51:57 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C889435AB3
	for <linux-rtc@vger.kernel.org>; Mon,  6 Jul 2026 17:51:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360317; cv=none; b=alRGyxeDKUsrb6p8qn6oxGnKZpCUu8ilISMWEa1Knc+ZeHvxhMhIgt6HHa9q5mV76+rhCNdGAyLLH7OUTD/F8o8oaajLNdcLdvkXybq0MUYORuhZRXC0FDL/2zkImoIl4zSpQ80WU4Gy6cNsJLZ2zzl+rGPuaOLAJqzfZMoVPuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360317; c=relaxed/simple;
	bh=1Ee8nZmSJ3L29r+OJFo3suta0pD8PXMZVf4X0sAqyEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=snQ9DpOuCbAoYK40VHaRphwPIVBm/RMU8MBGgDN5dQI6IIzHbtKgO3IxzuBGc5Tc3nb0yEZd/yZ20R0M35RjDzi3ufMtUpG5ig5eMYokMy/et2y+7leKFzufOF/Bm9ewr3yHe0ChHfNfeaYUKzN0zQYn1hVqQCNkDIih5aM5M5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qs2+alxI; arc=none smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493c55d5c7aso32176475e9.1
        for <linux-rtc@vger.kernel.org>; Mon, 06 Jul 2026 10:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783360314; x=1783965114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yp0vLf5KoweydvqbpTIiIXXIIq2wJj4VTBhY9AKqs00=;
        b=qs2+alxI7ZMllJZ2ONWIkFFz5GKYv/hy8SGiGv3Gr8l020cJYbhXXTdANU82+6fEP1
         O9A9eCf0P4CP3VHyKjJxG9YzuulXGE26Xhem1GAgAkE3FnAMfF5kfhTmmUCx69xPRhY+
         KFThBuGoGH4eIIQvPpkoa9Wbwh98EWSPOiGZamAltToXXeNCW6Sl5r2WCJTkwMXadRKj
         1u7G4/wzl2nOtIaUGCBY/5hpwezgNjAAKKCmE7gGLF2w+5wGP11xwkrqZjPFI6w9I1+Y
         91oI0r0EASHAMhhR9+5b2wyze18duyL0vqzr07RyjQDiVbq84rWYVtFeQoGYaJgwS1VW
         8HXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360314; x=1783965114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yp0vLf5KoweydvqbpTIiIXXIIq2wJj4VTBhY9AKqs00=;
        b=bgSuHUEgIEU1EXxHlUUaLryEWfSCNvcyj7x7voya/lxWNrV6gAgiqExKG0DbdAYJAz
         oxs12/fTr6GuU9Ob8aHJgvavxTxSXBA/AhM59X+7FJBB+fVeaIlTi1F1TFLbQpkOcQtf
         ax7l+9tkmIS1KmjSKaWH0roKsn1GznJgTHnP9yYBKUJUn4XN1IjaSOY6gAVfGnnGmvao
         ENCx+yFvGedgAv0AArEekdnaXLPvi1FGBs/FNirFPqTfyIFL1Vwii7lhvp6h3+5hfHnp
         Wr5wQ8oTLkwPOldaNquon0xXLIwCQ+YwTAHN9XhODBDcIZkOk8ufsNbJ3r4OvK2m+Fes
         b+tQ==
X-Gm-Message-State: AOJu0YxHUQHoipfNQdY83Vgek34GiLvE74i13VnKfterwALaqrnu1qq1
	19yRACV9gHyW0Gqx6X/CXjIYHud3Xn4UoMBfI9eZf8O3yC3G0CyiBHMo
X-Gm-Gg: AfdE7clMAPaa1osgG+9FuNPWZdtzP2npVWSW8jGVXuAtgS9ITUFghu9NWr4nRD0RK4q
	xqdBwNpuu6RkFxrkRfXUomG38y9sjGLNKveqB00byRb/h8hCkwWOCPxjNVRYiQqcNlmIJy78Jr3
	WYOw9rLjGMKxHUBdWy00TuoDobhBvpMduL+pt3BM8UyJ897nWn2O/GT9gKkxkUIXh1q3SA5Wd33
	2xmGf2bt8oNCjLMCpVt6Df18V97/muGbmJpfZ+dx1HigsMz+kDCLUm4pL5X3GAfPTyy0RZSNojP
	cuEvqq8uiQ3gbhQtflwvzhj6B0BepoOwAcqFCSOWs7qpPvlyeQgSjmehWb28bVqQce17VUVmo/X
	peCaAscrp0qng8BZ5NrYv5u2l6MhpR4eB3Ep1R0qh1XGV12wVoUFfFBpG89nbyOvhsnWXeun9BD
	xlLGEF9FDo8N0+Pig7sZnUQnzS7qKBaWANG5sJQVG4/t2dcO0IcNkj/LJw2xHJbNBx9ZcjyAFlF
	0xFaPxhQB3G91kpR3zw/iqWUhg=
X-Received: by 2002:a05:600c:348d:b0:490:bd1d:4732 with SMTP id 5b1f17b1804b1-493df0a758emr17001865e9.23.1783360313673;
        Mon, 06 Jul 2026 10:51:53 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8e02:886d:c345:c5e2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0078d49sm1263145e9.0.2026.07.06.10.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:51:52 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 07/12] rtc: rzn1: Replace remove callback with devm_add_action_or_reset()
Date: Mon,  6 Jul 2026 18:51:33 +0100
Message-ID: <20260706175138.12587-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6932-lists,linux-rtc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:miquel.raynal@bootlin.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:wsa+renesas@sang-engineering.com,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg+renesas@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,glider.be,gmail.com,sang-engineering.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-rtc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 17FD6714418

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Simplify the driver teardown by registering a managed cleanup action with
devm_add_action_or_reset(). This eliminates the explicit probe error path
and allows the .remove() callback to be dropped.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- New patch to replace the remove callback with devm_add_action_or_reset().
---
 drivers/rtc/rtc-rzn1.c | 56 +++++++++++++++++-------------------------
 1 file changed, 23 insertions(+), 33 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index a5283e680e36..1e6d26a122b8 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -378,6 +378,17 @@ static const struct rtc_class_ops rzn1_rtc_ops_scmp = {
 	.alarm_irq_enable = rzn1_rtc_alarm_irq_enable,
 };
 
+static void rzn1_rtc_disable_hardware(void *data)
+{
+	struct device *dev = data;
+	struct rzn1_rtc *rtc = dev_get_drvdata(dev);
+
+	/* Disable all interrupts */
+	writel(0, rtc->base + RZN1_RTC_CTL1);
+
+	pm_runtime_put(dev);
+}
+
 static int rzn1_rtc_probe(struct platform_device *pdev)
 {
 	struct rzn1_rtc *rtc;
@@ -415,18 +426,19 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
+	ret = devm_add_action_or_reset(&pdev->dev, rzn1_rtc_disable_hardware, &pdev->dev);
+	if (ret)
+		return ret;
+
 	/* Only switch to scmp if we have an xtal clock with a valid rate and != 32768 */
 	xtal = devm_clk_get_optional(&pdev->dev, "xtal");
 	if (IS_ERR(xtal)) {
-		ret = PTR_ERR(xtal);
-		goto dis_runtime_pm;
+		return PTR_ERR(xtal);
 	} else if (xtal) {
 		rate = clk_get_rate(xtal);
 
-		if (rate < 32000 || rate > BIT(22)) {
-			ret = -EOPNOTSUPP;
-			goto dis_runtime_pm;
-		}
+		if (rate < 32000 || rate > BIT(22))
+			return -EOPNOTSUPP;
 
 		if (rate != 32768)
 			scmp_val = RZN1_RTC_CTL0_SLSB_SCMP;
@@ -439,7 +451,7 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	ret = readl_poll_timeout(rtc->base + RZN1_RTC_CTL0, val,
 				 !(val & RZN1_RTC_CTL0_CEST), 62, 123);
 	if (ret)
-		goto dis_runtime_pm;
+		return ret;
 
 	/* Set desired modes leaving the controller disabled */
 	writel(RZN1_RTC_CTL0_AMPM | scmp_val, rtc->base + RZN1_RTC_CTL0);
@@ -462,14 +474,12 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	ret = devm_request_irq(&pdev->dev, irq, rzn1_rtc_alarm_irq, 0, "RZN1 RTC Alarm", rtc);
 	if (ret) {
 		dev_err(&pdev->dev, "RTC alarm interrupt not available\n");
-		goto dis_runtime_pm;
+		return ret;
 	}
 
 	irq = platform_get_irq_byname_optional(pdev, "pps");
-	if (irq == -EPROBE_DEFER) {
-		ret = irq;
-		goto dis_runtime_pm;
-	}
+	if (irq == -EPROBE_DEFER)
+		return irq;
 	if (irq >= 0)
 		ret = devm_request_irq(&pdev->dev, irq, rzn1_rtc_1s_irq, 0, "RZN1 RTC 1s", rtc);
 
@@ -479,26 +489,7 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 		dev_warn(&pdev->dev, "RTC pps interrupt not available. Alarm has only minute accuracy\n");
 	}
 
-	ret = devm_rtc_register_device(rtc->rtcdev);
-	if (ret)
-		goto dis_runtime_pm;
-
-	return 0;
-
-dis_runtime_pm:
-	pm_runtime_put(&pdev->dev);
-
-	return ret;
-}
-
-static void rzn1_rtc_remove(struct platform_device *pdev)
-{
-	struct rzn1_rtc *rtc = platform_get_drvdata(pdev);
-
-	/* Disable all interrupts */
-	writel(0, rtc->base + RZN1_RTC_CTL1);
-
-	pm_runtime_put(&pdev->dev);
+	return devm_rtc_register_device(rtc->rtcdev);
 }
 
 static const struct of_device_id rzn1_rtc_of_match[] = {
@@ -509,7 +500,6 @@ MODULE_DEVICE_TABLE(of, rzn1_rtc_of_match);
 
 static struct platform_driver rzn1_rtc_driver = {
 	.probe = rzn1_rtc_probe,
-	.remove = rzn1_rtc_remove,
 	.driver = {
 		.name	= "rzn1-rtc",
 		.of_match_table = rzn1_rtc_of_match,
-- 
2.54.0


