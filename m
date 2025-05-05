Return-Path: <linux-rtc+bounces-4031-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 321F5AAA9C9
	for <lists+linux-rtc@lfdr.de>; Tue,  6 May 2025 03:22:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED999168BD7
	for <lists+linux-rtc@lfdr.de>; Tue,  6 May 2025 01:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF2E137645C;
	Mon,  5 May 2025 22:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QiVFqIso"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6176829CB56;
	Mon,  5 May 2025 22:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746485143; cv=none; b=N9QMhroALzeBan/vpKVM2mve3JZsZeqD+MAEFSgJQjhWRlvI7P+/3dVWZPuIgVJ6rJaM/uW4GThU4AWQ8NKRgIFYYT8h2YfokPLwQtK0lYNbAI+vrlKDHXJhJdGfapYoxcekzRKaVfaVHqKPKWzpdzWmoAYBmH3OkgxG/t2enP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746485143; c=relaxed/simple;
	bh=Ztz+nIN4jVsm5dk1LbPMMQ3xifHEySLYwovq03zpYkw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=drlWdQvVgOqLbPjkNFwRZMh5MUYv4z9v1GKVWiTyfwD6heI+YiliLyY6161wUjgoQjYOt6P31BsasX7TU/8srxkJG5FAMtju3cct2Kv5jlsjykEcbZSuU3buO6W4gVvC6X7peXvW93hIh053XzLPLXM1ZmF6tSQnzcwTE1CJtf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QiVFqIso; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 361F6C4CEF1;
	Mon,  5 May 2025 22:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485141;
	bh=Ztz+nIN4jVsm5dk1LbPMMQ3xifHEySLYwovq03zpYkw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QiVFqIso5MyEiVmXaMBqv9nOl4HuXmxrZkQgTdIdPguD85GKch6K0l+beC5Z1C5jj
	 EX5lgZKz7IwXnJf7hEHD+5/A/XVMz4x+xgFQn3YJ+eb34Qb1PJZ0Bj6+h4bMmu4hku
	 7bL6ipx0umnzYJhpHzTiS/dr6YX+oyjLIw5s+WJ4VvinzOE82//0RLU6am2dJbNZWx
	 XqqqdHZGAgsDQQLoNjURq0LM41qtOrkpiF9qKMHgiaeFtluNyvHQpj0fPaDjMJR2N6
	 gGt5bDeVHSd1yNazJxlLcSgks7KHpPgmApuuNO5UYlmkOv7WJMOp44fP0guHedm15J
	 T5fCNcl+pN2gQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-rtc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 181/486] rtc: ds1307: stop disabling alarms on probe
Date: Mon,  5 May 2025 18:34:17 -0400
Message-Id: <20250505223922.2682012-181-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
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
index 872e0b679be48..5efbe69bf5ca8 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -1807,10 +1807,8 @@ static int ds1307_probe(struct i2c_client *client)
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


