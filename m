Return-Path: <linux-rtc+bounces-3813-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6ECA7DCD5
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Apr 2025 13:51:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7396188B9D9
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Apr 2025 11:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCB8B246333;
	Mon,  7 Apr 2025 11:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XY+ow4T1"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40422459FB;
	Mon,  7 Apr 2025 11:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744026538; cv=none; b=Ks5hBc6O/FipXVAQLwwuuvDASqSf4i+El5dvKGYIt9f5Xo+MxfNI1jTVoNeiyrHfNv5opCYqaSngo6ifw3RfqNoLWYbv0g3wAxqXCiL9ExwpWqhdQ8bLBEf05IZ5uS4FDfwiSOC92699xTGXBQyBo1llyNwlRnfXyBvjl263Mok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744026538; c=relaxed/simple;
	bh=K8TbyYbFoFexJklIknQNbJz1L0TvNV9NasumndhoVrI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DzCHGJ8GiNwVU3Gten9he/lcgBRQZ1Gr0N9jBuY6ZwOA9VlUtSucniwFKjD5ArGVA94YHFmBOmnPKw98E7xgKRFYaNvEIi/3dVVKPJB0JAxNvNoEi3wuLbAQr/dE9g4CNfwFlFb3jagtbs9egG4GflGxlyGjC3i1welqIYbO4Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XY+ow4T1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2F452C4CEE9;
	Mon,  7 Apr 2025 11:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744026538;
	bh=K8TbyYbFoFexJklIknQNbJz1L0TvNV9NasumndhoVrI=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=XY+ow4T13NlnWCufVECdYB5+EGQTLp/WyUFdIOxSjVz37QrS5eByqOxdfa2FwTcpn
	 DkFTQWSVtxfStTDUbMWZa62Eu3Bj+C1i4JASVq7FeFiuupydHiObkasl0H0plE/5jB
	 Aqb4DHR45JVsmNYzC08YpKu5x9CRfmmirOH0wfwgfCi540klEsxsc80L2NEltrTt5f
	 dkA7JrRT6lk3BXaOZoG3/rbC/gvGbM0Eb0wzPL+fwFFZu3/wSXUFtwUTq06fWKe8tV
	 +Arl+vZWFYPqnich/l44VTtH7k1OWDmRxj1OclLIcpDwPeJScpS7IukxjeDeHliALE
	 AO/gSMIUX00NQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A9B8C36010;
	Mon,  7 Apr 2025 11:48:58 +0000 (UTC)
From: =?utf-8?q?T=C3=B3th_J=C3=A1nos_via_B4_Relay?= <devnull+gomba007.gmail.com@kernel.org>
Date: Mon, 07 Apr 2025 13:48:49 +0200
Subject: [PATCH] rtc: sd2405al: Add I2C address.
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250407-rtc-sd2405al-i2c-addr-v1-1-efdd951952c0@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKC782cC/x3MwQqDMAyA4VeRnA3UzM7qq4iH0mRbYFRJRQbiu
 694/A7/f0IRUykwNSeYHFp0zRVd20D6xPwWVK4GcuRd7wa0PWFh6p2PX1RKGJkNHyOxDxL8c2C
 o7Wby0t/9nZfr+gMVtME4ZwAAAA==
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744026537; l=976;
 i=gomba007@gmail.com; s=20230706; h=from:subject:message-id;
 bh=fg5GX8rA+Q5pAy0F9ekX3Q4r3NUci+f2g8fC+4fI6IQ=;
 b=lS+9qPiYe02kBjoBsCue2i0H/hxmCMMXIY0GYgeI2sHiYyuUljLEUfzLHKYX8CDQ7BE/FCiCA
 x7D//v3z2FPCZMzTj4MHPk1V9764M88WXK7xfKcZlAyes49iBNqImBe
X-Developer-Key: i=gomba007@gmail.com; a=ed25519;
 pk=iY9MjPCbud82ULS2PQJIq3QwjKyP/Sg730I6T2M8Y5U=
X-Endpoint-Received: by B4 Relay for gomba007@gmail.com/20230706 with
 auth_id=60
X-Original-From: =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>
Reply-To: gomba007@gmail.com

From: Tóth János <gomba007@gmail.com>

It is common to include the I2C address of the device in the source
file.

Signed-off-by: Tóth János <gomba007@gmail.com>
---
It is common to include the I2C address of the device in the source file.
---
 drivers/rtc/rtc-sd2405al.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-sd2405al.c b/drivers/rtc/rtc-sd2405al.c
index 00c3033e8079..708ea5d964de 100644
--- a/drivers/rtc/rtc-sd2405al.c
+++ b/drivers/rtc/rtc-sd2405al.c
@@ -5,7 +5,9 @@
  * Datasheet:
  * https://image.dfrobot.com/image/data/TOY0021/SD2405AL%20datasheet%20(Angelo%20v0.1).pdf
  *
- * Copyright (C) 2024 Tóth János <gomba007@gmail.com>
+ * I2C slave address: 0x32
+ *
+ * Copyright (C) 2024-2025 Tóth János <gomba007@gmail.com>
  */
 
 #include <linux/bcd.h>

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250407-rtc-sd2405al-i2c-addr-392d58e8567d

Best regards,
-- 
Tóth János <gomba007@gmail.com>



