Return-Path: <linux-rtc+bounces-4040-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAA6AAB572
	for <lists+linux-rtc@lfdr.de>; Tue,  6 May 2025 07:29:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE0BB7B36F8
	for <lists+linux-rtc@lfdr.de>; Tue,  6 May 2025 05:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B627A349883;
	Tue,  6 May 2025 00:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hNwXkr7j"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9310F2F7C3E;
	Mon,  5 May 2025 23:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746487172; cv=none; b=HDZabMem71YAZPukYAPvoyHwjXGswkgvuGP+m7f+4kTplyy4xDLtjNkY2vvCE0ZTNcGF6uccCC4nUEun3DbBg4xCnh82dSKfcFQJCzSJ7DCPehIWRp+3kChXytPFBsUnHh6vzK6O4KamhlBz7VktoubQTT25atKQnb1Dllx9wgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746487172; c=relaxed/simple;
	bh=HvmLGFahVqihGC7medF1+sWUmE6L9s+IAxnR2+uIxZw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WqUqcSQaz/XR/QabkEBgEFn73oX3vtyfFTSHwBajUVoiLtSUYXIlBrGcDKAE1ZeNfq4kJ1sFLcmBP+khyWIYeMbPMoB1sBeYwuR+M59ngY2nkQ+RbQ76rRgemrnARa07cGF61HjhVzBBPYveYrd2Z4M5D5vuNtiAmdkHpCw+/EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hNwXkr7j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0CF8C4CEE4;
	Mon,  5 May 2025 23:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746487172;
	bh=HvmLGFahVqihGC7medF1+sWUmE6L9s+IAxnR2+uIxZw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hNwXkr7jW1QYV5OLG25y1C2Vp77cH2fbzDmgD2Vh8n7qjpWnMUnaixokKFLwsKQz9
	 HrMDtCfm/G5Zuvszu2c+bzSs/+oDacfSPKgS5l8i97TzgQNeknikZJ1IUo82YMfuKi
	 ZIEPeXpZimIcthHbd1JwCeA5IJoOdBalCJIYf11+SV7ZEOEAA1sJbcU0HHBXsiV+G3
	 Zv+VtSzRwjNEAL/1uJQ/se0nwvIETCsfo0jtR2AdArS+gdIrIEHsC8soeK/f6E+yGH
	 YO6tA7kBYfgvqLcH6SMppQrSVZwuqionMLJsof86qNkMiT+HvEFNwLtII4wkXnwX1w
	 wwGxM/HjKyUCQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-rtc@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 040/114] rtc: ds1307: stop disabling alarms on probe
Date: Mon,  5 May 2025 19:17:03 -0400
Message-Id: <20250505231817.2697367-40-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505231817.2697367-1-sashal@kernel.org>
References: <20250505231817.2697367-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.237
Content-Transfer-Encoding: 8bit

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

[ Upstream commit dcec12617ee61beed928e889607bf37e145bf86b ]

It is a bad practice to disable alarms on probe or remove as this will
prevent alarms across reboots.

Link: https://lore.kernel.org/r/20250303223744.1135672-1-alexandre.belloni@bootlin.com
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/rtc/rtc-ds1307.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index 07a9cc91671b0..3a2401ce2ec9c 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -1864,10 +1864,8 @@ static int ds1307_probe(struct i2c_client *client,
 		 * For some variants, be sure alarms can trigger when we're
 		 * running on Vbackup (BBSQI/BBSQW)
 		 */
-		if (want_irq || ds1307_can_wakeup_device) {
+		if (want_irq || ds1307_can_wakeup_device)
 			regs[0] |= DS1337_BIT_INTCN | chip->bbsqi_bit;
-			regs[0] &= ~(DS1337_BIT_A2IE | DS1337_BIT_A1IE);
-		}
 
 		regmap_write(ds1307->regmap, DS1337_REG_CONTROL,
 			     regs[0]);
-- 
2.39.5


