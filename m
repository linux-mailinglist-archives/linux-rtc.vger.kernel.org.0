Return-Path: <linux-rtc+bounces-5228-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E6FC27495
	for <lists+linux-rtc@lfdr.de>; Sat, 01 Nov 2025 01:45:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98392420B67
	for <lists+linux-rtc@lfdr.de>; Sat,  1 Nov 2025 00:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30E11212568;
	Sat,  1 Nov 2025 00:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="qxNkHPW7"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1ED15E5DC;
	Sat,  1 Nov 2025 00:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761957916; cv=none; b=OlU86NUs55Sae9rGaiLwZKhPhri9/2CYL74t0fp5bkUuLrisMxEUjXvKodI/WHjV2A7JSylJNXvCWFY5GFoJk1sktfnDhh8/wCX5GCGX0AwVKwdqzTCRUWzkkH4qCgDc/cXSE1wZSYEemecdMJEnTHfT4Pm6rqSUzYqorqKIHcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761957916; c=relaxed/simple;
	bh=/jxoynyBaShK9+FI01QQ2oG3U0XL7BViJ01AF3IPgDQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lOXvbi5Z82+xINcqiO86pztw0Ty5k9OrLGewKV4ub36783bcHphyISB1h5dU/LBkmlXiJz/Q1m4kQHi1w2U2y6TGFv/b5TWtZJH5xDb/5ZtH6IGFNiiGdoUPXVtp7mU/qO3HHSLeyPdg2bdtoohmwJUL371rFMSiGwgNJLTAFgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=qxNkHPW7; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 548384E4145A;
	Sat,  1 Nov 2025 00:45:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2A0576070B;
	Sat,  1 Nov 2025 00:45:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 43C5E1181ABB0;
	Sat,  1 Nov 2025 01:45:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761957911; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+Sw9x0lfyio5hvi1NamAm1DllHegD6Zt+iX/+ppYJlQ=;
	b=qxNkHPW793gPbeLrQ2Hp+9nGDA+z6vuaawfwLa41vpdCHUFmck8TRtzoH2BdxlaMkOOvgu
	0YcRv65emeDyp9NXHFNzn4CWSGEwOj0dL0s9lVbnV0CsH+/CIWYN1xbg7fghoP7NJtNpNi
	yiX2e1riNgulC7kKJ/rvAhVGMKtDbTIppi99j7Aq7Ue5weAzsRzVNz5N9MOvVXhges+BhT
	minJ6WhUtbHe6/5oylAzUOeQMfTSLcjgmMoD0sEAIviGy3HeFtHWe0Dvs6L24IGv8zeBxa
	hH6yFGVYYRPWQSCLGQsXVsrxqJJDASpjvLj+DCVbtEH6+9bp4ur9uKDffBy1tA==
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Sat, 01 Nov 2025 01:45:05 +0100
Subject: [PATCH 03/11] rtc: pic32: stop setting max_user_freq
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251101-max_user_freq-v1-3-c9a274fd6883@bootlin.com>
References: <20251101-max_user_freq-v1-0-c9a274fd6883@bootlin.com>
In-Reply-To: <20251101-max_user_freq-v1-0-c9a274fd6883@bootlin.com>
To: Joshua Kinard <linux@kumba.dev>, 
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

max_user_freq has not been related to the hardware RTC since commit
6610e0893b8b ("RTC: Rework RTC code to use timerqueue for events"). Stop
setting it from individual driver to avoid confusing new contributors.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pic32.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/rtc/rtc-pic32.c b/drivers/rtc/rtc-pic32.c
index 2812da2c50c5..52c11532bc3a 100644
--- a/drivers/rtc/rtc-pic32.c
+++ b/drivers/rtc/rtc-pic32.c
@@ -340,8 +340,6 @@ static int pic32_rtc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_nortc;
 
-	pdata->rtc->max_user_freq = 128;
-
 	pic32_rtc_setfreq(&pdev->dev, 1);
 	ret = devm_request_irq(&pdev->dev, pdata->alarm_irq,
 			       pic32_rtc_alarmirq, 0,

-- 
2.51.1


