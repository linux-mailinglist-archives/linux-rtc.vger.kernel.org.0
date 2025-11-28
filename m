Return-Path: <linux-rtc+bounces-5494-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBCDC92980
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Nov 2025 17:36:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 964774E1C4D
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Nov 2025 16:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D3A728469B;
	Fri, 28 Nov 2025 16:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RYgur2ci"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495D3264F81
	for <linux-rtc@vger.kernel.org>; Fri, 28 Nov 2025 16:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764347772; cv=none; b=uxRQTabd95xQd9fO6vRAaM4wy+xSOGR+jH7p3EOWzwjjz2x7saGmFsJv2iTXrWN9bY4uiqv9UxGiJzY9LEs9/PAJQGn8e1pveCl1AyH2/02c2zSHqYIA1APW7+ltcu2JRXSOcACZp8K4+Jp1HNEwS56yaQvQVf+AABVzg4iOmSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764347772; c=relaxed/simple;
	bh=rV8j9wbrOPZrNlvkNJphUfu8i9HlNDBAEuKSg/M5zr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lXSVghyAfHDW/L8D42whoB+hpUWWOHtJ7AT62ByYh/JBXoc3blQAjGfxygMfXGp33bWPD7sc5w0QDiTwIb2KZNalSMm4uWLw01jXLIuEiowTwfoIwOtHqbzGH7j6gPrOyZdPZJ5l6i9ykt8idHFJIdvLxkKR27erud/VeDhKlOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RYgur2ci; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 14E03C4CEF1;
	Fri, 28 Nov 2025 16:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764347772;
	bh=rV8j9wbrOPZrNlvkNJphUfu8i9HlNDBAEuKSg/M5zr8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=RYgur2ciS6BR1MznOO0Pf3Vlbzj/AcRkpUAWtRhFNf/iJMvrEAFK3zp4TnYtOzKkr
	 LtnDUYQtDOHtau4uWPn4vHr7pgPc6pxNKX/B1nV/xXr/E2RbgkhzvnJ5Mz0KyHuAPZ
	 lzcX7vpvfGfCinEYby3hcIgMUcf4q+jFlVV3DbfiCp3wZIczG4WAmAfvADrCaGUT8G
	 QggWp0ih5Lxizl01Ei4OXgJ7WaW5xXqB2BBzlz1bYoQiB/Y/xHpzLMqavGAy/7IY/m
	 JPZNKlwmKS2ohBdQPgwZ58u9zDNpZ/b5L8s3+dcNx3T5wIWXTZdQbTzAOq8fqW7QD8
	 6vyEQADph1vBQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03C9BD116E2;
	Fri, 28 Nov 2025 16:36:12 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Date: Fri, 28 Nov 2025 16:36:38 +0000
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
Message-Id: <20251128-max31335-handler-error-v1-1-6b6f7f78dbda@analog.com>
To: linux-rtc@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Antoniu Miclaus <antoniu.miclaus@analog.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764347811; l=1114;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=yZMxjkRilIU/IcTJjTLZ+cXNpd/pN79VeBziWYaCG+k=;
 b=Ww6kNNxfHs92/DiGWx2t9ft94HuafT9pupVr6oNlNPCHvMtFozJL0WX/yzBeWZCS59lwvt/Gu
 XvadEoJuSm+DM9ZB64hxFNHANTNHJZd7jEQFHIF5mimVHejmdOl0RIO
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



