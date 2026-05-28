Return-Path: <linux-rtc+bounces-6578-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COJXLOm6F2rMOwgAu9opvQ
	(envelope-from <linux-rtc+bounces-6578-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 28 May 2026 05:47:53 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 348C55EC49F
	for <lists+linux-rtc@lfdr.de>; Thu, 28 May 2026 05:47:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0AF9830C2528
	for <lists+linux-rtc@lfdr.de>; Thu, 28 May 2026 03:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1804305693;
	Thu, 28 May 2026 03:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="wxOvI3kd"
X-Original-To: linux-rtc@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83316301472;
	Thu, 28 May 2026 03:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779940022; cv=none; b=OYlBm0g1rB0bvEgPt/VWwlW4VUtzmQkqBiuTgi5ZI6iU0VIjBwhZom0osUJt5T2MNyZy8sosBd9rpJ1MPyYNWvk5TrGeMS6Jh+PnITocer+d18/n2QlvTObWSZfRU6ALvMsohGQ2iHynnD5hHH20Ub0AxSM4WbAYEPWj9RJTzSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779940022; c=relaxed/simple;
	bh=qYgQsEk3n99i/U85hwk5jhpAZurLiXSldhvkeh96t6Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=r4lu+sS1kJtszRCPqCALdY8R8yBya+BmsQz5ra+VgYmqSPIaA/e9KOhEtUl+1sQUJlBIfOEnG63CtUNYCB+7pDynF2USnux1S6Pe8zi9TMHhFomuqf0jj4yG3MMjZoLEKZiUUxLA9yL3ATM3qACJACFGgowu/1SJkr+W2825jdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=wxOvI3kd; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779940021; x=1811476021;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=qYgQsEk3n99i/U85hwk5jhpAZurLiXSldhvkeh96t6Q=;
  b=wxOvI3kda/p0gpzhyVKIciUZ7Rmvge/ElM4E7aUmTrjVa1wQWOQqJU4f
   U+YQTCoAm+ZFLCg3eCEUtVYD1gOkJ83oetDV/Gr1KzmWtNoZm3Kk6XTfv
   INj+uMXj9Gp4TBOXE75dfcU3FhfYXD52yteNDU7MDFVfD5Lv4zidT6jLL
   k3SaEnWfCIdP1UidXxgfAfeZvQUB2wVrggLs2nJKOF+/LtgrDdbVuo1NU
   aMKrgCWhLKYWXPV5JlFpUjxAnz23OSRvO5hNUjUNioEn6yFkgcl0zxrjL
   /G0Pwo/9y4y/ZtW16AayPKJSUyEmbAcxfgJL+hyBdEx1Iv7yRDPEsAkyp
   w==;
X-CSE-ConnectionGUID: zqfwHDKVSeu+1EmyMnmlVg==
X-CSE-MsgGUID: snKCs0atRe+0gv5L7W+OXQ==
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="225400142"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 20:46:54 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.41; Wed, 27 May 2026 20:46:54 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 27 May 2026 20:46:51 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Date: Thu, 28 May 2026 09:16:45 +0530
Subject: [PATCH 2/4] rtc: moxart: convert to dev_err_probe()
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260528-cleanup-dev-err-probe-rtc-v1-2-29dc9cb6c3f0@microchip.com>
References: <20260528-cleanup-dev-err-probe-rtc-v1-0-29dc9cb6c3f0@microchip.com>
In-Reply-To: <20260528-cleanup-dev-err-probe-rtc-v1-0-29dc9cb6c3f0@microchip.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Baolin Wang
	<baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, "Orson
 Zhai" <orsonzhai@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>, "Balakrishnan
 Sambath" <balakrishnan.s@microchip.com>
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-6578-lists,linux-rtc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[bootlin.com,linux.alibaba.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,microchip.com:mid,microchip.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 348C55EC49F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use dev_err_probe() in place of dev_err() and return, which
communicates the error type and helps debugging hardware issues.

No functional change.

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 drivers/rtc/rtc-moxart.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/rtc/rtc-moxart.c b/drivers/rtc/rtc-moxart.c
index 2247dd39ee4..e1766f03d73 100644
--- a/drivers/rtc/rtc-moxart.c
+++ b/drivers/rtc/rtc-moxart.c
@@ -253,26 +253,20 @@ static int moxart_rtc_probe(struct platform_device *pdev)
 	moxart_rtc->gpio_data = devm_gpiod_get(&pdev->dev, "rtc-data",
 					       GPIOD_IN);
 	ret = PTR_ERR_OR_ZERO(moxart_rtc->gpio_data);
-	if (ret) {
-		dev_err(&pdev->dev, "can't get rtc data gpio: %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "can't get rtc data gpio\n");
 
 	moxart_rtc->gpio_sclk = devm_gpiod_get(&pdev->dev, "rtc-sclk",
 					       GPIOD_ASIS);
 	ret = PTR_ERR_OR_ZERO(moxart_rtc->gpio_sclk);
-	if (ret) {
-		dev_err(&pdev->dev, "can't get rtc sclk gpio: %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "can't get rtc sclk gpio\n");
 
 	moxart_rtc->gpio_reset = devm_gpiod_get(&pdev->dev, "rtc-reset",
 						GPIOD_ASIS);
 	ret = PTR_ERR_OR_ZERO(moxart_rtc->gpio_reset);
-	if (ret) {
-		dev_err(&pdev->dev, "can't get rtc reset gpio: %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "can't get rtc reset gpio\n");
 
 	spin_lock_init(&moxart_rtc->rtc_lock);
 	platform_set_drvdata(pdev, moxart_rtc);
@@ -280,10 +274,9 @@ static int moxart_rtc_probe(struct platform_device *pdev)
 	moxart_rtc->rtc = devm_rtc_device_register(&pdev->dev, pdev->name,
 						   &moxart_rtc_ops,
 						   THIS_MODULE);
-	if (IS_ERR(moxart_rtc->rtc)) {
-		dev_err(&pdev->dev, "devm_rtc_device_register failed\n");
-		return PTR_ERR(moxart_rtc->rtc);
-	}
+	if (IS_ERR(moxart_rtc->rtc))
+		return dev_err_probe(&pdev->dev, PTR_ERR(moxart_rtc->rtc),
+				     "devm_rtc_device_register failed\n");
 
 	return 0;
 }

-- 
2.34.1


