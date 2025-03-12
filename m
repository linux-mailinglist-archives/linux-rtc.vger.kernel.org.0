Return-Path: <linux-rtc+bounces-3472-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E5CA5D7A0
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Mar 2025 08:52:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5921189F23F
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Mar 2025 07:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D21BA22D782;
	Wed, 12 Mar 2025 07:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="YU6PwO5O"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1452D1E5713
	for <linux-rtc@vger.kernel.org>; Wed, 12 Mar 2025 07:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741765959; cv=none; b=GWuw1DamPNmeRF5CSGtg6/MTZJ1NUNhQjyHl7rru7yP1YJBIAu3q1d+/B1O4Jj/7qs7mzVzBtBMNkl1EYUBiMWnRlICN2JtoMl25wfzvM9gJNR5O9zp1yfyocgcSkUD+31/IqwDe9n7VHJci5uyO29Q7tMGU0B8ABzwLH+8H7Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741765959; c=relaxed/simple;
	bh=7WhIts/RD1g8IPmV6Yt28GadnJfovcDFdIxByPCm9mg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ue0UvdvWt1I6sh3comPUzPYIBfVgEiJkh9+G6b1vo1QR0+ZcK4ROaCjdKpHQUy5bgEy86fggdfsRBdNqJGjFEFegSgm1NL2rLZMu+BuFCfJIHtPZNk1pABiwmqZ4iBSctO5Bv5QsD9fBifouDTogLFvWf/VS7bvo9hOkM9IZ8cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=YU6PwO5O; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=Bd2yOTijR3c71+
	Cv+kr5An7YZ2C9sfT4F8ehKxNITps=; b=YU6PwO5OngYsFNws8Iqwl23cIZrwVU
	/fPyjizkYOevRJTGHmcYExER/kIw6aXGKOi8pUB4Ncb2Q79BKPqRxacxgIi0xfA9
	cdaG+LzKcGtONUcbW5ASYp/KfqY9xN6KsjBCxIonJCmAvaZbDI2eW5zMCBAK1tA4
	L96tQYQ70rK7sOSz0v0nOXQrOvsoGTvwruJGRAgrRURET/vkP4X0lsn++puODsj1
	Cag0T5Fnv1Lo4w4ssmp5KJs/InJv51cHLuF+tAexmc3JQTJxDI9BBmjgw+puV4Nb
	8yjfQMO1IED5g7r8dcZO8hKnh/cCrsf+4gofPA31bPho8Xc+2ZYGFy4A==
Received: (qmail 1142796 invoked from network); 12 Mar 2025 08:52:32 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Mar 2025 08:52:32 +0100
X-UD-Smtp-Session: l3s3148p1@2hTYfCAwbt8gAwDPXwyXABj42nrU+gpI
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: [PATCH] rtc: rzn1: clear interrupts on remove
Date: Wed, 12 Mar 2025 08:52:26 +0100
Message-ID: <20250312075226.22022-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is good practice to clear running interrupts before removing the
driver. This is not really a bugfix because on current systems RuntimePM
will disable the module clock, so interrupts won't be initiated. The
dependency on that behaviour is subtle, though. Better be self-contained
and clean up when removing.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/rtc/rtc-rzn1.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index eeb9612a666f..d15aa8fad5af 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -444,6 +444,9 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 
 static void rzn1_rtc_remove(struct platform_device *pdev)
 {
+	/* Disable all interrupts */
+	writel(0, rtc->base + RZN1_RTC_CTL1);
+
 	pm_runtime_put(&pdev->dev);
 }
 
-- 
2.47.2


