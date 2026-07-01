Return-Path: <linux-rtc+bounces-6828-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9CewM8EpRWpL8AoAu9opvQ
	(envelope-from <linux-rtc+bounces-6828-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Jul 2026 16:52:49 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB0E6EF005
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Jul 2026 16:52:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ank6lA1Y;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6828-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6828-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CD7A93045E60
	for <lists+linux-rtc@lfdr.de>; Wed,  1 Jul 2026 14:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B15A34D3BE;
	Wed,  1 Jul 2026 14:30:15 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F094349CF3
	for <linux-rtc@vger.kernel.org>; Wed,  1 Jul 2026 14:30:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782916215; cv=none; b=LuIRdJfM7Gs9TFr9YBZ4LUhLiOy7W9WwU0jUOv32DLNrxKS6qc268pP3VYNAFY8KA3DkrQvvxQuY7HeZ7Ka3T0n9slsUczpcx9QA6Hez7lWT6Ko1opxmuqjZ23HtmhCb1CEfa7fvOfjO8qyb93sqRFWYFvaTOMOlo5CuaYDjKEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782916215; c=relaxed/simple;
	bh=Rbnq2Ej5FKBQgS003/b6Pf76go9Kj6sgibIMBjnk5aA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XfwEKamqFJpuasT+hmNHywhN2sTWXgH5ndaMjqASKDWu4gX3CWDguGfqLv7cV5s8IL0kJOVYAn7M3owMu/KAB1ISCEcF/7Rel0t38IUUGldQklHPNnWAPSFTo81dblsIYL6uH8TU5sD4jxbLswHPhpZeMBkPVY3Og68w63pAEeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ank6lA1Y; arc=none smtp.client-ip=209.85.221.45
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-473ba028d46so718610f8f.1
        for <linux-rtc@vger.kernel.org>; Wed, 01 Jul 2026 07:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782916212; x=1783521012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=akjB/2/LB1aH23D2hcdzx1hoAmWJ4htZCQR9ePuxd94=;
        b=ank6lA1YHxRDqytau0/pQWVz8X+Qjc0RkZZmJp1bL+VwXi3g9c9f57FRTcF52+NGRk
         UOvaCJ7qIDJVtvNcDTlACQjcqgrhAs8zsY9g2eoHPVKf6jGOdcYWuLHZB27YdxApel66
         floYki/SiNJEWtGrhryVR1mGO5Z99Pgx212jgfiXr6JSK3GtecOQR+GaXGQ7XkIUbVUl
         dWRJxqF2P+Ro8PewP0Af3b1I3XTYOYblvXghgnZyfCoomnoWNOu51r4+/vS8lpsXS4U7
         F89jGEHzVmnDFsLs7tcxpFgzatvQTxOwUuQNhCHNCN40JvUkkDkGfjQ6t77hYV9883F+
         TqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782916212; x=1783521012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=akjB/2/LB1aH23D2hcdzx1hoAmWJ4htZCQR9ePuxd94=;
        b=kmurCVCH0/YlMEg+CjOoVF/GNunvKXZwwVaTjxTkz1JnSbidFayC593hNtokLiiL+8
         2rAPp2Oo8nSofgzgIkA1R4WzWwupWp2s/dqHp6yGJslb8+4qFje+pAIz0Z7e9iBKjJTJ
         2HKas2BMrX/o3R5qrn1FTzVZOidzzsk4KYzwjgSxaOfbMYz9Rk37HMG1NxyXDYjsvac7
         m29pAZh/F8Lt/vKPHMYFOk0fA663oyEmPB+nErAVvLltK2F7w5gbfvoramBJTBEWPgbn
         1JqSn1OVmhIFnXNsN3BciKTSl27YKvsja8IzhAkhdqbv2oFRtnue+KHw9nYchQrbmFLL
         xxnA==
X-Gm-Message-State: AOJu0YzTBU82mP4+8lNRhp/62xYubnBEfGegYeV+jWLoeHADvCvlqW/q
	zBC4gBVvyXg6xyflTR/T34YwUsstJ4PtBKF3YGjLePrVXtA4Saq4+XJylppqLwMB
X-Gm-Gg: AfdE7cn5xWyftJNaZSVhfe9E+MQXi5MJVARUe6moA4qSSXYr6Mp+/291E/WIdajWYcm
	FFdMNaJzt5iRyy3VXeTQi7MsI1B5ESoKeJvSaOfDCX8VG27D2Q8yTgfPUXqDvvnomxO/9HLr63R
	BQ/l9wgn76oWldNM4AMGo96oj5i3sYP/tg+lh3HcNFSdR86OEvb1pgKUxAMwibol2WQ2CfFFDTA
	ULhMeiZy4DiQyGhgR0CA6sD6+pQXvqmYRI56TxMmWZnsZmXR0opkNvwbjdtsqDGYUmYHUnSH1/y
	9hAGeinCUN0gT3YPJrjoA85zmMi0g+DcyC5vNvPpsK7VZc4fiHDG3BB1tVpt1Igj0ATppV+9ofh
	2/I+G23KbqIUApcNXZl+jRJFdPud4+uzkK2+/peZuk6W22d4+KkGdCmwwt5SCieqa21ChBzrhet
	t5YAy+Wr1+LSLBL2BYTWl7aIYQHADtaIkaQ4Qf1cjS9Dc2KnFnCkurXC/4XTgTFPLPhW5+Z+qEo
	PnqGjt2pBjlV0w4Df7embdzZbA=
X-Received: by 2002:a05:6000:2905:b0:474:b9d1:321b with SMTP id ffacd0b85a97d-47757e57453mr3004596f8f.6.1782916211834;
        Wed, 01 Jul 2026 07:30:11 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:5353:5ce3:a6a2:3b98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477dd94c829sm184902f8f.24.2026.07.01.07.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 07:30:10 -0700 (PDT)
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
Subject: [PATCH v2 07/10] rtc: rzn1: Use temporary variable for struct device
Date: Wed,  1 Jul 2026 15:29:50 +0100
Message-ID: <20260701142953.2014895-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701142953.2014895-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260701142953.2014895-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-6828-lists,linux-rtc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,bp.renesas.com:mid,renesas.com:email,vger.kernel.org:from_smtp,sang-engineering.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EDB0E6EF005

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Use a temporary variable for the struct device pointers to avoid
dereferencing.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v1->v2:
- Added Reviewed-by tag.
---
 drivers/rtc/rtc-rzn1.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 1a45a3d895cf..4540d764edfb 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -380,13 +380,14 @@ static const struct rtc_class_ops rzn1_rtc_ops_scmp = {
 
 static int rzn1_rtc_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	unsigned long rate = 32768;
 	struct rzn1_rtc *rtc;
 	u32 val, scmp_val = 0;
 	struct clk *xtal;
 	int irq, ret;
 
-	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
+	rtc = devm_kzalloc(dev, sizeof(*rtc), GFP_KERNEL);
 	if (!rtc)
 		return -ENOMEM;
 
@@ -394,13 +395,13 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 
 	rtc->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(rtc->base))
-		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->base), "Missing reg\n");
+		return dev_err_probe(dev, PTR_ERR(rtc->base), "Missing reg\n");
 
 	irq = platform_get_irq_byname(pdev, "alarm");
 	if (irq < 0)
 		return irq;
 
-	rtc->rtcdev = devm_rtc_allocate_device(&pdev->dev);
+	rtc->rtcdev = devm_rtc_allocate_device(dev);
 	if (IS_ERR(rtc->rtcdev))
 		return PTR_ERR(rtc->rtcdev);
 
@@ -408,15 +409,15 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	rtc->rtcdev->range_max = RTC_TIMESTAMP_END_2099;
 	rtc->rtcdev->alarm_offset_max = 7 * 86400;
 
-	ret = devm_pm_runtime_enable(&pdev->dev);
+	ret = devm_pm_runtime_enable(dev);
 	if (ret < 0)
 		return ret;
-	ret = pm_runtime_resume_and_get(&pdev->dev);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0)
 		return ret;
 
 	/* Only switch to scmp if we have an xtal clock with a valid rate and != 32768 */
-	xtal = devm_clk_get_optional(&pdev->dev, "xtal");
+	xtal = devm_clk_get_optional(dev, "xtal");
 	if (IS_ERR(xtal)) {
 		ret = PTR_ERR(xtal);
 		goto dis_runtime_pm;
@@ -467,9 +468,9 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 
 	spin_lock_init(&rtc->ctl1_access_lock);
 
-	ret = devm_request_irq(&pdev->dev, irq, rzn1_rtc_alarm_irq, 0, "RZN1 RTC Alarm", rtc);
+	ret = devm_request_irq(dev, irq, rzn1_rtc_alarm_irq, 0, "RZN1 RTC Alarm", rtc);
 	if (ret) {
-		dev_err(&pdev->dev, "RTC alarm interrupt not available\n");
+		dev_err(dev, "RTC alarm interrupt not available\n");
 		goto dis_runtime_pm;
 	}
 
@@ -479,12 +480,12 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 		goto dis_runtime_pm;
 	}
 	if (irq >= 0)
-		ret = devm_request_irq(&pdev->dev, irq, rzn1_rtc_1s_irq, 0, "RZN1 RTC 1s", rtc);
+		ret = devm_request_irq(dev, irq, rzn1_rtc_1s_irq, 0, "RZN1 RTC 1s", rtc);
 
 	if (irq < 0 || ret) {
 		set_bit(RTC_FEATURE_ALARM_RES_MINUTE, rtc->rtcdev->features);
 		clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->rtcdev->features);
-		dev_warn(&pdev->dev, "RTC pps interrupt not available. Alarm has only minute accuracy\n");
+		dev_warn(dev, "RTC pps interrupt not available. Alarm has only minute accuracy\n");
 	}
 
 	ret = devm_rtc_register_device(rtc->rtcdev);
@@ -494,7 +495,7 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	return 0;
 
 dis_runtime_pm:
-	pm_runtime_put(&pdev->dev);
+	pm_runtime_put(dev);
 
 	return ret;
 }
-- 
2.54.0


