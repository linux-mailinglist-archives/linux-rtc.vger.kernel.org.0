Return-Path: <linux-rtc+bounces-5233-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9DAC274B6
	for <lists+linux-rtc@lfdr.de>; Sat, 01 Nov 2025 01:46:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4CCC935022A
	for <lists+linux-rtc@lfdr.de>; Sat,  1 Nov 2025 00:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 227FA23D7CD;
	Sat,  1 Nov 2025 00:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ymqvfxk3"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544F5231827;
	Sat,  1 Nov 2025 00:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761957921; cv=none; b=VJbZVNDru8t8rG+9p2pBXD+b/BdKTgRtX0WTQiSApMrZxjKdzzJxFhrUiTD6hcvJp9meIpPKI/FTDBifI75s1VsKEf9cEwYJAaU/nbiQTLHh1lUyyQi21TsqhfBzO+Xr0LeeclLoMTZ9JWS6M5Qi8GA1kjUjLqhtFEJ83LoQrX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761957921; c=relaxed/simple;
	bh=Fv2Q+Pc3Cbz9NsFabzY3O6hrENIlZ1AR/am3rMC1pOo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lHf2wiMAb0TejhmfdHf/5RsfoJGKx5lQt0V0ui9yCXdh/f7uYF5wSdq9SLePngjD66vmJu2/FlKNwzJnH1jWE/UmwzmExjI9KlzcAm3Bz9bDpaGRVVIjaTxdaQeNuJYg6a3/afXlkL5Ewip8PgayWscPjykB0QKzDDtv43QzuSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ymqvfxk3; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9958C1A17CE;
	Sat,  1 Nov 2025 00:45:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 716296070B;
	Sat,  1 Nov 2025 00:45:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 578C01181ABD2;
	Sat,  1 Nov 2025 01:45:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761957916; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9ISPyZ2sYo5mkihKAAgI3YiQvJpREmCo2BpCfHsdfhg=;
	b=ymqvfxk33OYlO+xtgyrWu79Qgx8oXy/9ZGzbRxSJNXCADP0Xw7E6/rVfS4aAhflyTqOHkr
	xXpPCQUHdwk4LItydVCVP8naOCTzKgzKOGbh7dnVY4ZRjX5ae5uYHjLMb2IsQukNS2kU8h
	iY7Ikvt1FVpTxSZHnXZvGlXIqRqSY/k/HO3EQe4FR4PthMSdFalAEm8e3jnPyBiRIcmzux
	gyKGOH7BFkDrPq6Hhhjn2dhJlNr4+c0uYykLxYR3V4jRttmAp8EnuXDaHMR2BkW4Kk25Sj
	SkLBhVTId9vLO3fBlXMG220WT8U2td9kvwz/La+VK/+MRyyQVnBtcsIIP3q7NQ==
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Sat, 01 Nov 2025 01:45:10 +0100
Subject: [PATCH 08/11] rtc: rx6110: stop setting max_user_freq
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251101-max_user_freq-v1-8-c9a274fd6883@bootlin.com>
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
 drivers/rtc/rtc-rx6110.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/rtc/rtc-rx6110.c b/drivers/rtc/rtc-rx6110.c
index 7c423d672adb..07bf35ac8d79 100644
--- a/drivers/rtc/rtc-rx6110.c
+++ b/drivers/rtc/rtc-rx6110.c
@@ -324,8 +324,6 @@ static int rx6110_probe(struct rx6110_data *rx6110, struct device *dev)
 	if (err)
 		return err;
 
-	rx6110->rtc->max_user_freq = 1;
-
 	return 0;
 }
 

-- 
2.51.1


