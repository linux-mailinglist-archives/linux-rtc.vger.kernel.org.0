Return-Path: <linux-rtc+bounces-4037-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B47B1AAB6D5
	for <lists+linux-rtc@lfdr.de>; Tue,  6 May 2025 07:58:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B774E1B65304
	for <lists+linux-rtc@lfdr.de>; Tue,  6 May 2025 05:54:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A8AC208961;
	Tue,  6 May 2025 00:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X/gO97ls"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D30380954;
	Mon,  5 May 2025 23:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746486013; cv=none; b=jJC3L96M4cwNwop6QFPk7+LVZljplb9eunkCxq3BNIpR0fCJdubxqOXpzYgpNPHOqrPsM20q08tIjsiA7DsQeXf/lGWhloi/BHSWKKfFF48wslS073JKS0SEIm2V5FApuOUrWdZNi4b5pqxNLHOccQfQu54Po2O2qEH7p+b2Xf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746486013; c=relaxed/simple;
	bh=l+9ita/VRN4kySxpSef/s+yyFzRG0AyvoVqg/UrIxyY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XYD/1TDagdHzTIaJIVU6/3Ibv0lNKkSWkCnqxafGlN8hT4Xkhw9PvzRd3ji4ltGQbeZEn7yR/2jgRS9gpNgjN9U0cTlHNyn4NzTi94JQ0gJzqEjmnegXn9kfNyhn1cr4IonGLlpJiZtaB038IkAjep2lizVied4UBc81eudSd08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X/gO97ls; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 471BCC4CEEE;
	Mon,  5 May 2025 23:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486011;
	bh=l+9ita/VRN4kySxpSef/s+yyFzRG0AyvoVqg/UrIxyY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X/gO97lsmHPYVi9kTqDwELOxWYYuMjdEzmZ5heIQUAzOjw0Img+jmLJDcPkmzmx54
	 KZ8gcblkS666EypuhsmCIcewVhwX47veI8ZwuliQaoAhworIZGuJtYZfIDqt78uVJV
	 69SPFix3xXDeRYPRHZZ49BqphbnxNmYt2vEB9hrR7QosGD8k2hF8+RYLaLNpK3e5Kv
	 i3o1DYVIfoFJxSrqee3cNQjxMqnRvvMM6aDUz0HXHDxcwTKkJJySOwHrsln0lob8yC
	 5Vj3Ox+70f8mj2hQank8p96y6WJAjxpVZojITc2p1/Z9aKotPIwy5Tv+wJXwlZygXP
	 o419GG0gQVgVQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-rtc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 109/294] rtc: ds1307: stop disabling alarms on probe
Date: Mon,  5 May 2025 18:53:29 -0400
Message-Id: <20250505225634.2688578-109-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505225634.2688578-1-sashal@kernel.org>
References: <20250505225634.2688578-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
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
index 506b7d1c23970..0c78451960926 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -1802,10 +1802,8 @@ static int ds1307_probe(struct i2c_client *client)
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


