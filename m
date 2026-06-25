Return-Path: <linux-rtc+bounces-6765-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HNubBvomPWr5xwgAu9opvQ
	(envelope-from <linux-rtc+bounces-6765-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Jun 2026 15:02:50 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1FB6C5DF3
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Jun 2026 15:02:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=WaAZgomu;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6765-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6765-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BC2F030451D7
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Jun 2026 13:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98ED028725B;
	Thu, 25 Jun 2026 13:02:23 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B1B259CBD;
	Thu, 25 Jun 2026 13:02:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782392543; cv=none; b=Xehum5pJnJ3vApkbCyKTPOUGDFGuOWXa5YHxg7mlbKl4Gak2J/ANOz6jtOHD6be4TGMMas/xfo1JmZTUV7nrSvqOYUHSqNSoxqaKqnVuH7dp4zPiV0M8qid/Wpgt4mHPNv3OgZBH7W01M4bgx1E08Ba4egtLnbGi9SwMlbWuw28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782392543; c=relaxed/simple;
	bh=3dRw3OQf0VjkFY2WnH2CciQx1t9KOWuwG1ckEavBsz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gogvE3Yw88Tez38VIFQC261g5cw9bRN0Nqe1r7bBbLoqysNsTQyWlP3o9CB7wJtu1jkCEXPZVp/9Ar/w+UH2B8XJ05fE0SP673F1B7H1UbutthIHSn1Q1IJC/uGTmGKyWqb8uevA8zl4nb9EE84/ByDKcadRaJLg/QuGF/AuggQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WaAZgomu; arc=none smtp.client-ip=185.171.202.116
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6AEADC5CD50;
	Thu, 25 Jun 2026 13:02:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0EF835FF03;
	Thu, 25 Jun 2026 13:02:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B26C7104C8397;
	Thu, 25 Jun 2026 15:02:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782392538; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=WoqTvALpS/1feaI3cyN1kzX91IgQsi/6yFT+HwS9w4Q=;
	b=WaAZgomu08bQ1Lrrg70UsY+VLbE9hF0Vws+YivQ5h7YiajvLHnDvjURw2t5OgR+eHtqhT2
	hqwwftoKTo7RIwfVPOTkbtaJSwOVYqHmeVofcUDS6ROd6OqGTEiFfr+YwnNZJu6MEVwSND
	Vp+QU9NuoCJsETwqPaWRSdMrcATBmJ+czJyoVv+61ABz3Xjl/Gg9WIvSLsLwrFFGeUWdz8
	NsqglTUPadEfTXS/NDg1iHW4JX89YLlbhyNdhuBEEoYNujfPKHDEabUt0g9HQPcOrdvDmc
	zQLBM4bX+IXN/I000SCB7gMK2OOxZjeYJOZn+XbR/IeYzqJTPd28acQ6d42Gbg==
From: alexandre.belloni@bootlin.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: =?UTF-8?q?Gr=C3=A9gory=20Clement?= <gregory.clement@bootlin.com>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] rtc: mv: remove mv_rtc_remove
Date: Thu, 25 Jun 2026 15:02:01 +0200
Message-ID: <20260625130202.1621692-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260625130202.1621692-1-alexandre.belloni@bootlin.com>
References: <20260625130202.1621692-1-alexandre.belloni@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6765-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexandre.belloni@bootlin.com,m:gregory.clement@bootlin.com,m:linux-rtc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B1FB6C5DF3

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

Use devm_device_init_wakeup() so we can avoid having to explicitly teardown
of module removal.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-mv.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/rtc/rtc-mv.c b/drivers/rtc/rtc-mv.c
index c0f1bcd838e3..db64c459ee19 100644
--- a/drivers/rtc/rtc-mv.c
+++ b/drivers/rtc/rtc-mv.c
@@ -260,7 +260,7 @@ static int __init mv_rtc_probe(struct platform_device *pdev)
 	}
 
 	if (pdata->irq >= 0)
-		device_init_wakeup(&pdev->dev, true);
+		devm_device_init_wakeup(&pdev->dev);
 	else
 		clear_bit(RTC_FEATURE_ALARM, pdata->rtc->features);
 
@@ -275,14 +275,6 @@ static int __init mv_rtc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static void __exit mv_rtc_remove(struct platform_device *pdev)
-{
-	struct rtc_plat_data *pdata = platform_get_drvdata(pdev);
-
-	if (pdata->irq >= 0)
-		device_init_wakeup(&pdev->dev, false);
-}
-
 #ifdef CONFIG_OF
 static const struct of_device_id rtc_mv_of_match_table[] = {
 	{ .compatible = "marvell,orion-rtc", },
@@ -313,14 +305,7 @@ static int mv_rtc_resume(struct device *dev)
 
 static SIMPLE_DEV_PM_OPS(mv_rtc_pm_ops, mv_rtc_suspend, mv_rtc_resume);
 
-/*
- * mv_rtc_remove() lives in .exit.text. For drivers registered via
- * module_platform_driver_probe() this is ok because they cannot get unbound at
- * runtime. So mark the driver struct with __refdata to prevent modpost
- * triggering a section mismatch warning.
- */
-static struct platform_driver mv_rtc_driver __refdata = {
-	.remove		= __exit_p(mv_rtc_remove),
+static struct platform_driver mv_rtc_driver = {
 	.driver		= {
 		.name	= "rtc-mv",
 		.of_match_table = of_match_ptr(rtc_mv_of_match_table),
-- 
2.54.0


