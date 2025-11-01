Return-Path: <linux-rtc+bounces-5230-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E54C274A4
	for <lists+linux-rtc@lfdr.de>; Sat, 01 Nov 2025 01:45:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E839E4E7DA1
	for <lists+linux-rtc@lfdr.de>; Sat,  1 Nov 2025 00:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60D3E225417;
	Sat,  1 Nov 2025 00:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="okML6Mft"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5A4212FB3
	for <linux-rtc@vger.kernel.org>; Sat,  1 Nov 2025 00:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761957918; cv=none; b=HBsCRGke5ArC47WsyD2Sp04cgV1JTpCJtwCRl899dKuY1311NAw09riCc+Or6V/TWpiCS4a0pM55lglIDD6Jy0efwxCZqyyidSILIzANFs70iPdI7Sqe/hU4Gi+yXL6abbBUl5ANGiSeqV8jkxJ8F6+HJcmPz3E5zVIzCB34ylY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761957918; c=relaxed/simple;
	bh=7DU3Gb5mwsAeENslrMgvCkryaEbOjjfdSj/H9XV0hlA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JtR5lI0wWDiDJHrxeH3TVNb0hOY2N+T2e84xh1cyAF6AjMrXx9NaWM0E15lYehJZxVTLDbfpdbzFoLgrO49doR6siSkPafwMBBW8P4H1475F2+xqCFGAU3Wi189H2tQCEw1nwx/aI82TRez1XiN13lmROD/9vtSuvzwLocuWlwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=okML6Mft; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 801511A17C5;
	Sat,  1 Nov 2025 00:45:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 57FBB6070B;
	Sat,  1 Nov 2025 00:45:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5A99C1181ABB0;
	Sat,  1 Nov 2025 01:45:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761957913; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=e2RdZS4TbDlJ0vf5dfnSXerXLEXyBmJL02eBs2hVtXc=;
	b=okML6MftxczWzrG2b6rZoDJvlqq+VkxyoC/NZ2gIU9BRYfSkw+uO9UGClgAEO2G0TqUCj+
	bj6S4ue80eaAUKtpB1Gm/W2FogwLC7rtO3mZPIaFnzBvDQC/7OdwQlfXoVO8TVSns4I9QH
	Y+OZpgiw8Vjga+T8EfWSGxWfJlzfHtt8Wof2NlucnWik6Rh7zaKGWjoL7b6xz+5P2ePHA+
	V0SQRxnf8FuWev/Ck0CuNVRVUm/le/hamOD1On1tnFYirDDO9oIiM5oLrKphJgfFtdyFD/
	mQq+DyreZnieTUWUZitTw1dBYtIfbpIGIlBkkdn9fxZlsu1cAkCi4MW9WgY7Dg==
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Sat, 01 Nov 2025 01:45:07 +0100
Subject: [PATCH 05/11] rtc: rv3028: stop setting max_user_freq
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251101-max_user_freq-v1-5-c9a274fd6883@bootlin.com>
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
 drivers/rtc/rtc-rv3028.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/rtc/rtc-rv3028.c b/drivers/rtc/rtc-rv3028.c
index c2a531f0e125..d96f6bb68850 100644
--- a/drivers/rtc/rtc-rv3028.c
+++ b/drivers/rtc/rtc-rv3028.c
@@ -1023,8 +1023,6 @@ static int rv3028_probe(struct i2c_client *client)
 	eeprom_cfg.priv = rv3028;
 	devm_rtc_nvmem_register(rv3028->rtc, &eeprom_cfg);
 
-	rv3028->rtc->max_user_freq = 1;
-
 #ifdef CONFIG_COMMON_CLK
 	rv3028_clkout_register_clk(rv3028, client);
 #endif

-- 
2.51.1


