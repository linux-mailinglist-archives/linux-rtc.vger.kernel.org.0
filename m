Return-Path: <linux-rtc+bounces-1353-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2614E90D55B
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Jun 2024 16:35:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3906D1C2096C
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Jun 2024 14:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9BED156898;
	Tue, 18 Jun 2024 14:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OTlLKG6E"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A81155A53;
	Tue, 18 Jun 2024 14:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718720349; cv=none; b=JMgPRGIeWn5Qn17WYrAqcJ2qNYTkI8YmrLqLc/qVD5iOmxyzb03uhxgZFICYjezTJPqTNgTIZhQ+yOQaBLXaxQB1c2y2tRVfsutz9bzu/5NtTPEL+3GdLjZOL86KI/8oElUkzwRuMgHlLZ34B1CMLL7no2UwX5BYLsdNYoL8rcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718720349; c=relaxed/simple;
	bh=Ggs4LiAIFz6s55sxtqUcaZ2B7cPu/teZ0uahLhWKsNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uRpfgQQIxgOjQcoFCfvJslwZoX5jOs1hoqyvBtbkSWJ/sf6/6KS9Wyfz+/HUWkMth9TwiJU/QCacWFMaLb/SpdcS6AB14HpDRaStuAHQFsv0zI3sUxUqACINNsyftPYQWqXTWP0HDQ8e0tR72rxSLwEO3/gLRlbiv5sq0vWQn74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OTlLKG6E; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 177BB1C0004;
	Tue, 18 Jun 2024 14:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718720342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=unycStWLNSmZi3IWJRgG9YiHqHREugQ7zxLXwZKoaoM=;
	b=OTlLKG6EFtlVA3DMngANVrxMygfpi+XMU5YIhVnM7y8eZ+tRGUFh+hLvcLJcSwQ0+nUHke
	Wq9S+tpGuTSQTAZvbdt/+bCH+u81h+pyAqHGu1k06HnzpgG+bGWsqN8kINBWhv355imwaL
	HDzJ+3JcM78o9QXZ6d8ivuwyGRgM9Dh4UgZITX8xK0xRuw2lHsTkPwus48q+wNsG3NlAAs
	Af6Tv1FWZGrCki+YWN+tqDu1gRhUHYlLi7Ym1dRBXnt6WoR7VIrBMhmGjmbV9mL/ak83Xr
	/dDOFHVTMx49ufRwY0AAG97s0QVbiDucBQ+q49PhH1weg5tGhHHlSP2kb9FB5Q==
From: Richard Genoud <richard.genoud@bootlin.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Udit Kumar <u-kumar1@ti.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Esteban Blanc <eblanc@baylibre.com>,
	linux-rtc@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH v3 1/3] rtc: tps6594: Fix memleak in probe
Date: Tue, 18 Jun 2024 16:18:49 +0200
Message-ID: <20240618141851.1810000-2-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240618141851.1810000-1-richard.genoud@bootlin.com>
References: <20240618141851.1810000-1-richard.genoud@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: richard.genoud@bootlin.com

struct rtc_device is allocated twice in probe(), once with
devm_kzalloc(), and then with devm_rtc_allocate_device().

The allocation with devm_kzalloc() is lost and superfluous.

Fixes: 9f67c1e63976 ("rtc: tps6594: Add driver for TPS6594 RTC")
Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/rtc/rtc-tps6594.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/rtc/rtc-tps6594.c b/drivers/rtc/rtc-tps6594.c
index 838ae8562a35..bc8dc735aa23 100644
--- a/drivers/rtc/rtc-tps6594.c
+++ b/drivers/rtc/rtc-tps6594.c
@@ -360,10 +360,6 @@ static int tps6594_rtc_probe(struct platform_device *pdev)
 	int irq;
 	int ret;
 
-	rtc = devm_kzalloc(dev, sizeof(*rtc), GFP_KERNEL);
-	if (!rtc)
-		return -ENOMEM;
-
 	rtc = devm_rtc_allocate_device(dev);
 	if (IS_ERR(rtc))
 		return PTR_ERR(rtc);

