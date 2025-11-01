Return-Path: <linux-rtc+bounces-5236-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 819FBC274DD
	for <lists+linux-rtc@lfdr.de>; Sat, 01 Nov 2025 01:47:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 492EA4E9192
	for <lists+linux-rtc@lfdr.de>; Sat,  1 Nov 2025 00:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D0D1257851;
	Sat,  1 Nov 2025 00:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hQfxUUh6"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA72D1FC0E2
	for <linux-rtc@vger.kernel.org>; Sat,  1 Nov 2025 00:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761957925; cv=none; b=DGFp3BtUyrLVf/ZDhop2i4RqsKrXeUO+kyEMCCwB4hRcuqIamBhuXHZ/sUUc+JsGQa2bu031UpkovTVYCBi5eChnfWnGnBZ/WGx3bUkW/kmum1J2FCQ84WVtwccFyEWIC3cG3QQFXe7OGgX7PBo/HS1iQoJqi62Z5nYMnKjGtfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761957925; c=relaxed/simple;
	bh=F9VjP9MZyfC80zjI0pYGFI9I2uGhstvRQgehchEYHNs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mQ5zXOLNBdIw7pD4Km2mCDvqdEzViUlI/ITAWajpPRnpaTnrkUEkW21HtG6W8JLXyZfD6hpFldtqzzUEGMQpK4Z+1QZ7Y9F2QRDdTV/irEhWGkGzPMtKQdPO0siBtj0kryMhU8ahSkJb5fz9ynevAycPRQ+eHatnfmI/ewWVlSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hQfxUUh6; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1BABA4E4144A;
	Sat,  1 Nov 2025 00:45:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E69F26070B;
	Sat,  1 Nov 2025 00:45:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EE7A61181ABD3;
	Sat,  1 Nov 2025 01:45:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761957920; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EbRbx1I+mIoxOsRtsB/upoTC4mC2hPcZJGHmdGubXRE=;
	b=hQfxUUh6LtrT/sJfftbP0Kik80QjzCMT85fTW4m+rM/gQXU2R9pT/G2aLqfMkzdSZKAHBS
	/MBRuOfRKUI93NAZSfEzgmHNpyIT4zul6t64JqYOiu4F2+dkbxQwYTrqqCwWQVbCQC2g+t
	QIPsuMSKpx3sdmDPIbHQOpgNqU3KiHN3dIFlv0ZmfAECFcF4Jckikt8izImy3ii+0/9NXb
	Ks26ez4XuX78BFfK5A5wtMeXXEFFaFR931PnDlouErCz6TlhfLfQRNVyEdQDrhXKii3uEs
	HkeMKx12+a+/Pb/Wl9I5Gbk7qwDl+3J9RTDrMCciptZFmvvZ51S4IQ2e/u/asg==
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Sat, 01 Nov 2025 01:45:13 +0100
Subject: [PATCH 11/11] rtc: sh: stop setting max_user_freq
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251101-max_user_freq-v1-11-c9a274fd6883@bootlin.com>
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
 drivers/rtc/rtc-sh.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rtc/rtc-sh.c b/drivers/rtc/rtc-sh.c
index 619800a00479..0510dc64c3e2 100644
--- a/drivers/rtc/rtc-sh.c
+++ b/drivers/rtc/rtc-sh.c
@@ -423,7 +423,6 @@ static int __init sh_rtc_probe(struct platform_device *pdev)
 	writeb(tmp, rtc->regbase + RCR1);
 
 	rtc->rtc_dev->ops = &sh_rtc_ops;
-	rtc->rtc_dev->max_user_freq = 256;
 
 	if (rtc->capabilities & RTC_CAP_4_DIGIT_YEAR) {
 		rtc->rtc_dev->range_min = RTC_TIMESTAMP_BEGIN_1900;

-- 
2.51.1


