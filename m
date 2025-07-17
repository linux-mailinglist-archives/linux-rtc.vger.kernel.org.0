Return-Path: <linux-rtc+bounces-4527-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD445B0891F
	for <lists+linux-rtc@lfdr.de>; Thu, 17 Jul 2025 11:19:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C99A33BB689
	for <lists+linux-rtc@lfdr.de>; Thu, 17 Jul 2025 09:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03A2D288526;
	Thu, 17 Jul 2025 09:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eGLqCPU7"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA014503B;
	Thu, 17 Jul 2025 09:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752743991; cv=none; b=JcI8yv5ZsfJmZaNoiYJLV1Es5TDM7uNsYcTAqC2wgUUTNwQU8dzc6ZgGO2ebHPHqA4C0S5SzGB3PFbOHLB0U4LUyL+hmltg0m9jc+69bDGlr3gEdSSNzWFXsK6HU311K7ggskLXp8cjCvU0KVegwDlwyogLwDtj8H38n+5p/2e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752743991; c=relaxed/simple;
	bh=berKg2cuWH4Y7zdED4eT5oFHY1ZYlo7PAlZDh/gw2g0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sNHiLShGJ6+jm/B6yV9cwn4qXEkaTUkoU4/rGnQNYOrD8rvRxIbufpR75yKVgOFUGexSHCZxwAw4kaFc+cDsfQw/cY5VFAVIn1YVgt4Cwk5Nc0LBO1g+jtKLoi2tJvWiCnp620VgzMPCRVIJcQEuIOVqGp6uZnV3xn/NXW+0weo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eGLqCPU7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6552AC4CEF7;
	Thu, 17 Jul 2025 09:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752743991;
	bh=berKg2cuWH4Y7zdED4eT5oFHY1ZYlo7PAlZDh/gw2g0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=eGLqCPU71HxltxYx+8SOmxosROA1tIcHvwXwJV2fcsf+9i5B48YzoVF/d5XKQR+9Q
	 mQlUxTh1rfms2L3dirXmXM1a3u7OxVHzvM7sg7e2ZAtdpGPWn5CW58U19h6JW4K7aW
	 ODpRs2RxXedlSj5+Hc79afHV219gNM3ZIDaWMU9VreFgltZ2utlnwTGAEipCfrFwFf
	 gP1ccW5XqK2NKPcY7Lh7VPaYoiUqSOZ8tO5Stikl3iNqW15q7NWkKPdhOsRPXQzm+E
	 P7eD/uIJV+7x9E2MS6OFh0C1c3xBMtaR/gqC26jhBpQP7TVqCkD5wuvnY5JdE4tv4t
	 yioyvK832qNNQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54096C83F22;
	Thu, 17 Jul 2025 09:19:51 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 17 Jul 2025 17:19:35 +0800
Subject: [PATCH] rtc: amlogic-a4: Optimize global variables
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-rtc-regmap-v1-1-ad19736ccb09@amlogic.com>
X-B4-Tracking: v=1; b=H4sIACbAeGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDc0Nz3aKSZN2i1PTcxAJdQxOD1FRjiyTzpDRzJaCGgqLUtMwKsGHRsbW
 1AOcNBfZcAAAA
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752743990; l=1406;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=Tn5lD1nQJpDiw1LSnQ4GALbhpMqAH3g7E7P1O0bGP2E=;
 b=6VRmWFfex68uuBzChVw66cU/9X5dt11KTQvIdrMbsj4WkyCFYWXYXIZvfZTDWe7uAJOPDLj+4
 6ugN6hxm9PqDYRlB2eeuo2y9hMAw5x1LeQ1rHEUgcnkc7g6tRa3zkZg
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Use local variables struct regmap_config instread of global
variables. The goal of saving memory has been achieve.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Use local variables struct regmap_config instread of global
variables. 
---
 drivers/rtc/rtc-amlogic-a4.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-amlogic-a4.c b/drivers/rtc/rtc-amlogic-a4.c
index 09d78c2cc691..1928b29c1045 100644
--- a/drivers/rtc/rtc-amlogic-a4.c
+++ b/drivers/rtc/rtc-amlogic-a4.c
@@ -72,13 +72,6 @@ struct aml_rtc_data {
 	const struct aml_rtc_config *config;
 };
 
-static const struct regmap_config aml_rtc_regmap_config = {
-	.reg_bits = 32,
-	.val_bits = 32,
-	.reg_stride = 4,
-	.max_register = RTC_REAL_TIME,
-};
-
 static inline u32 gray_to_binary(u32 gray)
 {
 	u32 bcd = gray;
@@ -328,6 +321,13 @@ static int aml_rtc_probe(struct platform_device *pdev)
 	void __iomem *base;
 	int ret = 0;
 
+	const struct regmap_config aml_rtc_regmap_config = {
+		.reg_bits = 32,
+		.val_bits = 32,
+		.reg_stride = 4,
+		.max_register = RTC_REAL_TIME,
+	};
+
 	rtc = devm_kzalloc(dev, sizeof(*rtc), GFP_KERNEL);
 	if (!rtc)
 		return -ENOMEM;

---
base-commit: 0bafe291cb429d39b5ff70bcf7b2f3ab026dcb02
change-id: 20250717-rtc-regmap-140ee38b7bf7

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



