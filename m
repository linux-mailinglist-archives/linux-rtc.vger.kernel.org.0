Return-Path: <linux-rtc+bounces-4033-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0570EAAAC15
	for <lists+linux-rtc@lfdr.de>; Tue,  6 May 2025 04:08:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49B2B9A15BF
	for <lists+linux-rtc@lfdr.de>; Tue,  6 May 2025 02:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C1BD2FA109;
	Mon,  5 May 2025 23:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qz/uFum1"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262032EE18A;
	Mon,  5 May 2025 23:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746486549; cv=none; b=QFdeec/Hf2WnX3JrMuhs6/8459l98G6Qxyok8yr8Ge+ZkhgVDmV9wKpXCly29b7MnG731Zpgxt9rTNZ9WwLopw5UJhfu63HESXaO1pQSn8Yz+8fj7OH3xQqjAoxzTs47OHIpmf5hkFtL23jwJ2qO5l10kdBxypfEpdp8EDsVsMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746486549; c=relaxed/simple;
	bh=deF9WFnhs+HXATmzRfNY6gqbFNY+7J57nQE35vZzB/M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GkMhDbJZCdqFtGeiMkud0aRmgVcIIj0yr7g+Ct1XT2SrUooNmCxFcZgYLlU/kqslkUM8u0HiCms6a94MiyE2yhLnVm9QJ7EzcsXcGb5I0+Pb8Kr+Ku4CKACvTL+IZsNjED52THdqKm+uNlDZT3TMBFQHSZ/amd+fW6FHrdy1jCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qz/uFum1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 663B6C4CEF1;
	Mon,  5 May 2025 23:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486548;
	bh=deF9WFnhs+HXATmzRfNY6gqbFNY+7J57nQE35vZzB/M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qz/uFum11BLY5ePIF03u9dtt1MTnlB7BqxHRVRcgAiOv31lN25em4BzdJyD3fT4wH
	 s9wqUTQ95ueA2SPUpV/h748jOQdE2cOTeAWCo1FNSq/yBkot2hWZFYbQavJxAMylyl
	 hCkqpiaXxhLrRnFfn9OVRRKrHktHmHfLCbJcOYmcBH8JsW3XayMg0IiYDydu68YkjC
	 UDhkqXK8xUgZ0OqI+KwI7nwlb19PoVDxtP+AN4ISUlFKdd2EFCcr5zFwlsF831ryHd
	 yd73U/mN/I44S/n4sDsRSfRkdsaU+h3xA1b2uLfmaFEB/ZfeK2Gi/VSeoHyLR5mRxd
	 hGO5mqasOsZng==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-rtc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 084/212] rtc: ds1307: stop disabling alarms on probe
Date: Mon,  5 May 2025 19:04:16 -0400
Message-Id: <20250505230624.2692522-84-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505230624.2692522-1-sashal@kernel.org>
References: <20250505230624.2692522-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.136
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
index d51565bcc1896..b7f8b3f9b0595 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -1802,10 +1802,8 @@ static int ds1307_probe(struct i2c_client *client,
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


