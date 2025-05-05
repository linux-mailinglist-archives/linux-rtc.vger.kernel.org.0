Return-Path: <linux-rtc+bounces-4039-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD27AAB505
	for <lists+linux-rtc@lfdr.de>; Tue,  6 May 2025 07:20:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69B9B188442F
	for <lists+linux-rtc@lfdr.de>; Tue,  6 May 2025 05:16:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7383A39E052;
	Tue,  6 May 2025 00:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lo3jDAXd"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363C22F4192;
	Mon,  5 May 2025 23:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746486921; cv=none; b=e2DVjDYNTqYm3mMi4peFIxMWfS/pMediIcWtZ+qbjvFkyAtdGUZFBYIuFEwOpoi4Rv0BJBXYaXz8/STyLEJZPTeimmcfH/IWkgr2tQ/zciK4NE6998qQlbU8C6ptTX7OIZamglq+0A56p4QChV/pEmIGVnaY3N0PB1a08bcsnH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746486921; c=relaxed/simple;
	bh=RRUgPX0O/LV1tO5163H3IsNpYfSObehSHHW0CGMWlWk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=l+3WPiWjPxJgsr7zNznPi73w/16MKL3sKOiLtm6fMd5oWf5vJ4WNNx8XV6TbZp+9SYm+9bnwX92AQSJk18NBJfQVo6iToU1DpswKYQLfe7paJT8po+8JAy3s3cPPsToAUeJfWY0gO8GwBaP2YTVJy6zOZ8NGqPU9rBfHqCKeGlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lo3jDAXd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7968EC4CEE4;
	Mon,  5 May 2025 23:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486920;
	bh=RRUgPX0O/LV1tO5163H3IsNpYfSObehSHHW0CGMWlWk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Lo3jDAXdAbE4xtGdyqBAv8EzuXFhMbrDNR9GQvFQQSonFYyp1SR6FZICzBysmDVlD
	 HkClxVs3xw3bn/mxAfUIl9lv7x/Rp9HOYtzVp74sgy2pwSu4UxntPLyKaxbaBdD6NK
	 rF01fxExfLxwiF22tvKP4hthhLVGp/5yha6SUmsuoLg/5N6rDpv3AZERTo5QhZIqMm
	 40m4PJ/Lpk+50qdEz8Hr0uNv1VOIl1oz+QonbboARlm1yQNL+08ddriU9xHaSrLgfa
	 MrVij4+oV3gdYyTL8QNOoLpWh5RtAf5VMtcZb4HiDWotlMzZvkzlnz5WNEx0giU9PT
	 9QcbedySzBhpA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-rtc@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 059/153] rtc: ds1307: stop disabling alarms on probe
Date: Mon,  5 May 2025 19:11:46 -0400
Message-Id: <20250505231320.2695319-59-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505231320.2695319-1-sashal@kernel.org>
References: <20250505231320.2695319-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.181
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
index 336cb9aa5e336..d5a7a377e4a61 100644
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


