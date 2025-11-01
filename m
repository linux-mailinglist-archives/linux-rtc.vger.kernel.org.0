Return-Path: <linux-rtc+bounces-5231-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE90C274B0
	for <lists+linux-rtc@lfdr.de>; Sat, 01 Nov 2025 01:46:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 757D74E824A
	for <lists+linux-rtc@lfdr.de>; Sat,  1 Nov 2025 00:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31DFB22DFB8;
	Sat,  1 Nov 2025 00:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nPK/nqUq"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B73222156F;
	Sat,  1 Nov 2025 00:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761957919; cv=none; b=A4vBEQo6myS6phZQo/tZ5oomc7wAfmZklDnyWRiWSpui1W37Di08A6z+MOYZmqErKeoTOg9evDiX7GUAsiKWHVDCzzUkX8ZOTJSY1XQvh3PWcG/Le85iXy8LMkbSPAJK6shpJG5PvL9gK2BDPZ2p8MPFNWvgquc+IuZpWoGEE0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761957919; c=relaxed/simple;
	bh=sGH6upfh+TcClYAnuHx8xUZYfzOcEBal6VRL0R94VlY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mRgRliwAC5v62P7iFImfStgTRv4dtJ7WvAd6UovPsJu86+IxzhZ2wc9N79ir14dK8hFN8Ec2qTqy+dUSZlSgeRPTUSa9L5udtJqEd5S/5oy3v/uV06th3euUnrs1K+Cuom+izOwPoksXrMlEdXM+AqpHbHKEW5FjKER+pxA7Qzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nPK/nqUq; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C2F75C0E963;
	Sat,  1 Nov 2025 00:44:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5B03C6070B;
	Sat,  1 Nov 2025 00:45:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7CA131181ABB0;
	Sat,  1 Nov 2025 01:45:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761957914; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jDWyGb3RRZopHXhl6YMWKxHX2sGWn7H5g8JS5Vz0uiM=;
	b=nPK/nqUqEn2kTLz3gc3toNoFTXxr2gUQiL4+dZ0g+A4Yu9eto86wjrkqJvbJ6tcyoD4FPN
	dcoBBHqemR0tHjSw1ysAukaLU3tPY8uDR04aeT/VzNbg4z9RZk8ndSIemUvbxVYGMF7jVC
	GLjQDfGlyvKvlxa+kgJh5qbwXbkwmDTvw3k8gSPRiVnxdW9AzYyYhKlvs+eLvwD/WHA3Z1
	9XkDydrAVgr0o4I/qI5flYP6nJBOIAA7qXy6UVYDsdB7vlDSTGTQ+yYwjjnp4qHrgGkyag
	nuOgXLyc4cOs4adi2nHbgRVwtemRrqvjNfj2oIuaIfl5IW6z7YiwpZrzXYnMKA==
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Sat, 01 Nov 2025 01:45:08 +0100
Subject: [PATCH 06/11] rtc: rv3032: stop setting max_user_freq
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251101-max_user_freq-v1-6-c9a274fd6883@bootlin.com>
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
 drivers/rtc/rtc-rv3032.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/rtc/rtc-rv3032.c b/drivers/rtc/rtc-rv3032.c
index b8376bd1d905..6c09da7738e1 100644
--- a/drivers/rtc/rtc-rv3032.c
+++ b/drivers/rtc/rtc-rv3032.c
@@ -968,8 +968,6 @@ static int rv3032_probe(struct i2c_client *client)
 	eeprom_cfg.priv = rv3032;
 	devm_rtc_nvmem_register(rv3032->rtc, &eeprom_cfg);
 
-	rv3032->rtc->max_user_freq = 1;
-
 #ifdef CONFIG_COMMON_CLK
 	rv3032_clkout_register_clk(rv3032, client);
 #endif

-- 
2.51.1


