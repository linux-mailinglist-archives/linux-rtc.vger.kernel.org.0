Return-Path: <linux-rtc+bounces-3104-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B23EDA2871C
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Feb 2025 10:55:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 247E33A3905
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Feb 2025 09:55:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F27E22A80C;
	Wed,  5 Feb 2025 09:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="MONBK2bc"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F146222A7F7
	for <linux-rtc@vger.kernel.org>; Wed,  5 Feb 2025 09:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738749327; cv=none; b=mFamY8EBw6+wy3UtFx8CyzyHQ2spCgWjanDvGtH8NQR4rkikGvuOWsDmrkMjNj2zu/rjO60/Dbl+TN66cQG0XT0xSNfHNRtbVHQ/9mIY8aRjduJ6cW57endRISx9hyLNjS5ZWq1/9htYM4PHfGlonH8l8eZe2i+Fnd5o6E+Nvns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738749327; c=relaxed/simple;
	bh=UyuZ63AebhUpU/in3ALgxcHCnsp1FQfXWKq6EW4qYdo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PV/T0znvB11Kn4LSAmoO4Tsv8JiXV0PGBFipV/Nb9MfqMpVqlmbJQ3Y9oJPYSInIS4yRHGy4Sz8iDLHh1WQfIZbZclQH2VcEYx24iR69EXwm3D2vcZTfHg3I8wYLzIWKs+BMqz62q6cdVenTEs1/UXDBGJ9fJL0STL03wL4OcAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=MONBK2bc; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aafc9d75f8bso1311110066b.2
        for <linux-rtc@vger.kernel.org>; Wed, 05 Feb 2025 01:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1738749324; x=1739354124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LosAM8MKixrze+DKy3KPUaCIuTYER6dudsHxBAM96I4=;
        b=MONBK2bcr5K5cMLVTlo3gEvZ5wyJa1BdixHUJ5NYQy590ELKINXrXg9e3Lk3Ofk2Wa
         SzDe8yMuDp4rC7NyVRqhBG7NyP6xSfPVSBmaRC17iwjhWvwTIJZaaW9NXENIEdTimd+b
         WwsYCsbkEgcqXAEGfv7/BIf4V2VjreD0CzTR7v3zaKLbv7IRrrV293scZVZenYHsN2RM
         noSVO8bES9Rl5Jc3OiYRRF1mH1YZYZzvgBl4MFFCX1TaHXG5fJhHsql+vc0EX/LF7nr5
         XaIKFiPeRI1jdtwAfEf0nSzDKIY6rmTv42XnphNs6zZQyfdCAu4U2qSonqpE46h1iD7y
         9ljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738749324; x=1739354124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LosAM8MKixrze+DKy3KPUaCIuTYER6dudsHxBAM96I4=;
        b=qEmleN0pziaimmryju+z3INhM5diEAIsx+BwMkV1nRfxGv6sWE429GI+CoC37Ub026
         GISUqtqPvyttq1gzF207o7M4OhtxTYjFD8ExS1TlOMpGhpMJlHNQCLgFzmA25P59OQrp
         9jG1iILPcMFIdCUik3RBjrrju+WfCgxVWedPKAwUlgHNfM7ZvWywFf8vn0TIAtpLZk4+
         1K2IjhZLSGXhyX+Pw4GRXwT3IltOHHNJlbA8gJXFECeIy/gpJgkFm9sTsHsgoN18as5b
         ts9xGTGRuN/ix/7Of9EP3dMVW5Mjfhx+OKiJxMikV9Zy3b6R4T09uDUOhNxyq+VEs2Ti
         xLkQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5bNgr6mgsu1Z/qfJUnfDuPhgXKEYl70HzB9xAzHGsyCcGXeq7z1SYdBeIjXWs34xLS3ycT5h/FVA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc/90Q5Jq5ArdpUqUXJv6cx9BD+rGtMaLaUhJVBJZfNdftXSWR
	pMVyNwto6rl0qyeYMBmLqxaN080/oY0OxQ/cPC7y3gM0jhFhSGGseKyomP+2wevJYgySClo2b5d
	k
X-Gm-Gg: ASbGncub31W8/UQ5+p/FOgI2L9zaq37Ymk8tPzLHIH6BBK6gd4fhk7ztQG+SsLuhbtw
	v0NpYHVzrOtAART5wKGkzoMjcv2OafMPNceL6bft9dQOrlbpw/vrJKTv9wsaVjCK7MSiHit7pXz
	mzAtMi633s+2Y1lp3z4HyrYBAutgwIi4nnhxYWjiwPUdR1vJvF7ksr1YcXbuNQARZvzkVZS7s22
	llpQQAApkQuTI09SNA+3JqHHifGM1Xjp14vWngrpMdDNzTpcj0aXko8b/Q/NeAGsO4GPipqUZoZ
	/Lcf3P0Lx414kVR/EFwwFXzTNyw5Fm5kELBDaDDL2W6mgg==
X-Google-Smtp-Source: AGHT+IFa23Ek/09ua5oWaqm4xkzUASaUOHIN061he97UBtBQrBAR3KC7IXfPrH98pn40XLsEElBz+w==
X-Received: by 2002:a17:906:b008:b0:ab7:63fa:e4a8 with SMTP id a640c23a62f3a-ab763fafe8amr111455066b.0.1738749323599;
        Wed, 05 Feb 2025 01:55:23 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.173])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47a7de5sm1075030666b.35.2025.02.05.01.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 01:55:23 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: alexandre.belloni@bootlin.com
Cc: claudiu.beznea@tuxon.dev,
	linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH] rtc: renesas-rtca3: Disable interrupts only if the RTC is enabled
Date: Wed,  5 Feb 2025 11:55:19 +0200
Message-ID: <20250205095519.2031742-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

If the RTC is not enabled and the code attempts to disable the interrupt,
the readb_poll_timeout_atomic() function in the
rtca3_alarm_irq_set_helper() may timeout, leading to probe failures.
This issue is reproducible on some devices because the initial values of
the PIE and AIE bits in the RCR1 register are undefined.

To prevent probe failures in this scenario, disable RTC interrupts only
when the RTC is actually enabled.

Fixes: d4488377609e ("rtc: renesas-rtca3: Add driver for RTCA-3 available on Renesas RZ/G3S SoC")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/rtc/rtc-renesas-rtca3.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/rtc/rtc-renesas-rtca3.c b/drivers/rtc/rtc-renesas-rtca3.c
index a056291d3887..dd50bcf79823 100644
--- a/drivers/rtc/rtc-renesas-rtca3.c
+++ b/drivers/rtc/rtc-renesas-rtca3.c
@@ -586,17 +586,14 @@ static int rtca3_initial_setup(struct clk *clk, struct rtca3_priv *priv)
 	 */
 	usleep_range(sleep_us, sleep_us + 10);
 
-	/* Disable all interrupts. */
-	mask = RTCA3_RCR1_AIE | RTCA3_RCR1_CIE | RTCA3_RCR1_PIE;
-	ret = rtca3_alarm_irq_set_helper(priv, mask, 0);
-	if (ret)
-		return ret;
-
 	mask = RTCA3_RCR2_START | RTCA3_RCR2_HR24;
 	val = readb(priv->base + RTCA3_RCR2);
-	/* Nothing to do if already started in 24 hours and calendar count mode. */
-	if ((val & mask) == mask)
-		return 0;
+	/* Only disable the interrupts if already started in 24 hours and calendar count mode. */
+	if ((val & mask) == mask) {
+		/* Disable all interrupts. */
+		mask = RTCA3_RCR1_AIE | RTCA3_RCR1_CIE | RTCA3_RCR1_PIE;
+		return rtca3_alarm_irq_set_helper(priv, mask, 0);
+	}
 
 	/* Reconfigure the RTC in 24 hours and calendar count mode. */
 	mask = RTCA3_RCR2_START | RTCA3_RCR2_CNTMD;
-- 
2.43.0


