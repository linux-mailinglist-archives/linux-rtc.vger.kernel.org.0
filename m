Return-Path: <linux-rtc+bounces-5310-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD22C4F4E5
	for <lists+linux-rtc@lfdr.de>; Tue, 11 Nov 2025 18:48:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41CF7189BE5D
	for <lists+linux-rtc@lfdr.de>; Tue, 11 Nov 2025 17:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17E63365A13;
	Tue, 11 Nov 2025 17:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DcgXixfi"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E4122157B
	for <linux-rtc@vger.kernel.org>; Tue, 11 Nov 2025 17:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762883320; cv=none; b=l3xEQMXliGnpzwqsLwZU5+Fbi/h5FdnlWDKLvdlBVZc1I/qKBDGnLjWxSLlErTCoGIfyHzTFgffDb9Bdq6M3y8LCV5Xn9tLfA6fuN7HLaUIFtofWggZF5pZKN0gZij1IxaUQD4CmSrJiiJDzSHKb5Yfr9+N/VlMbH19wYd749Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762883320; c=relaxed/simple;
	bh=rV8j9wbrOPZrNlvkNJphUfu8i9HlNDBAEuKSg/M5zr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VNfsQp1+c6D4qb16YZV6ychH4fxltc328ZCjqmb5XuPJccvRAYbArmP6Wy9DDYxF/ZyCogalQuCU22CneRjiN7jtr14IupZMW3GviEuGF4HZXvi6WQTPvcE7f4A5kw+b4B07HOa+T3+gm+ZDGCLHBX100GpVGZ9nJjVBGog88g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DcgXixfi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 651ADC16AAE;
	Tue, 11 Nov 2025 17:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762883319;
	bh=rV8j9wbrOPZrNlvkNJphUfu8i9HlNDBAEuKSg/M5zr8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=DcgXixfiea/+hRyPUf+zhYyg3a+xqreKw7Gzlxb7/dcAnxhT8M5k6aweb9xfK8ZWQ
	 R3X6ZkwotJCuaIDyWfCiySS5kWCm6SBvKAuIpm7lWajNtHs3/XREPB55SSyLQA0i+/
	 7OgkqGOYoCNgQ50RLEeE0mvs9Ia4psAWksSvqHg92sickQmgiHc9QCzqW0e9jkpUn/
	 0m9sCUP0P4QWVqwbyejxVrAgntL+Yj+iyTNfeZg2BueNN+QuulZLZXfkBBI54scWtl
	 /3svXe8V/Q1W9rOSBSWjmkPAPYiQ4HWLG+OEh9lAiVZ5kiOIi19A5nszTsvH/YWRLQ
	 t70kNZ/B8WbGw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5963ACCF9E3;
	Tue, 11 Nov 2025 17:48:39 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Date: Tue, 11 Nov 2025 17:48:48 +0000
Subject: [PATCH RESEND] rtc: max31335: Fix ignored return value in
 set_alarm
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251111-max31335-handler-error-v1-1-2152457cc203@analog.com>
To: linux-rtc@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Antoniu Miclaus <antoniu.miclaus@analog.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762883356; l=1114;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=yZMxjkRilIU/IcTJjTLZ+cXNpd/pN79VeBziWYaCG+k=;
 b=ttzyhZJ0mCNUgOFgpX1uTN8JaIkC35I6YwJy1pkPYIN4HY4/l5Bocb+UvekaSDr1V3fNIEZGd
 VmBcFgeZMHVBCICkCV7KGQCazJ7ugdb8/1Cna7TQlqpyqix4qRyd4GH
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

From: Nuno Sá <nuno.sa@analog.com>

Return the result from regmap_update_bits() instead of ignoring it
and always returning 0.

Fixes: dedaf03b99d6 ("rtc: max31335: add driver support")
Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 drivers/rtc/rtc-max31335.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-max31335.c b/drivers/rtc/rtc-max31335.c
index dfb5bad3a369..23b7bf16b4cd 100644
--- a/drivers/rtc/rtc-max31335.c
+++ b/drivers/rtc/rtc-max31335.c
@@ -391,10 +391,8 @@ static int max31335_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	if (ret)
 		return ret;
 
-	ret = regmap_update_bits(max31335->regmap, max31335->chip->int_status_reg,
-				 MAX31335_STATUS1_A1F, 0);
-
-	return 0;
+	return regmap_update_bits(max31335->regmap, max31335->chip->int_status_reg,
+				  MAX31335_STATUS1_A1F, 0);
 }
 
 static int max31335_alarm_irq_enable(struct device *dev, unsigned int enabled)

---
base-commit: 9db26d5855d0374d4652487bfb5aacf40821c469
change-id: 20251029-max31335-handler-error-65a286c74289
--

Thanks!
- Nuno Sá
-- 
Nuno Sá <nuno.sa@analog.com>



