Return-Path: <linux-rtc+bounces-3750-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CACA79F5B
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 11:03:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F42C175C88
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 09:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 654F424EA8B;
	Thu,  3 Apr 2025 08:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X1RH6upS"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813FC24336B
	for <linux-rtc@vger.kernel.org>; Thu,  3 Apr 2025 08:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670766; cv=none; b=Srqhoa4dKs4J6Y3GNjmC1zMYoWI42xOTCLk9PYKOIZvLTAT2pRAKTKeTzXSMGxIaytjccUIJ2/PUHFk0bOGUfeI66DbakjVRc9QQpiLF/MMnItMfvzpQ9b3+eSA/F4T7IMJN2jgfv1Kvv/jkvb/efaHsEz4KVd5NzOwERR2LQYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670766; c=relaxed/simple;
	bh=YO4AyBJQaRYJNR3M/qB00qaKZDbH/de1lTqDCM4IY8M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aid/ClUbb7kRu8YwNXgjUP4PyUT20GZKL0ddgy/H0/SxoEhXhdPg8+8FnZD7PT1230EXG4S5/LASd5rLIAkpa08zhx7UQFJ3wZcbVByvlJGQZQwGM7ENaju1KNgjVrtqq3WAJRJoxID+662LxWHLAY5cs6HK9rajznAALAzqCVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X1RH6upS; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e5c9662131so1125135a12.3
        for <linux-rtc@vger.kernel.org>; Thu, 03 Apr 2025 01:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670755; x=1744275555; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6KRr6Qm0gpuwraE+pyT1hJyit2ZkidoO0SCeL3UgR+0=;
        b=X1RH6upSsdAkhrGpjvWV0AGKa7tgjMzroifdz8pTqH6ypmDij0g7wIDQtWMZiEOleN
         iGwfYIBvgmhPs9fdN+NJcRskFUpHJhvpjwuCZFmG+t8m6qSoX7ut5vmuKHsadcArO45r
         +VQr+eSDc15poiMUVuzlqxKD9zielLTF8BaZwG2n/HC1s5PWdwmOw/Kdvc0EW/aJc2Qb
         9Z+OkwRrAJ1ZhVxffceK2m5Kr7bTvsTosDHahGF73rWXiRfyt6AB7wMGZeOT5/cPqt2C
         Kake5TGuBnd7Wg9cn6L8yi9BVCiVxp8Sd+YvsYHNAlmMT+3CbtB1bHfszg5hMfYoDsOt
         ttDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670755; x=1744275555;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6KRr6Qm0gpuwraE+pyT1hJyit2ZkidoO0SCeL3UgR+0=;
        b=hlsI/au8+rlrVnVoxXR4lOyT7P+A3gqXr2eK1MsfSmYJxMLG0f42EMpbiVwxrHyDK1
         vRWWLPf0FtLEfSxRlfYhl55Wkh0isn2YXJ10fQKwFWmk728QkA/vsRKv6sGfL/ae9xwz
         IaNGhKGyvF8sMRnQ5+8/SlBTnB8Birpm8GJQ710B4ZzHj3B5gs17PfUWf+stjn3gQtIw
         033utcV1zRQRy6JbdFffLptTpWlqFkJSoS+OLCEe+rMaRckzkeLPACsH5JQdSLP/PH67
         RxBF8DsZoYxBbFRIwLFlWylGmaWjgOFtN0n7t7/Tki+TwNc7LvdYyAHuimoIxlli8urp
         U5zg==
X-Forwarded-Encrypted: i=1; AJvYcCUbmlMvCPiSMVaAgfUow3pLJ/uj20tP9yWywPySPOs1ilE85JOcDyPI79mV/vl7QLyd3MnBjrQodzI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzN+y6Gn8d0GtZPzdB3nEc6PSCG0okyxJihPzsJnAFCtIP8SpOn
	5nKR1GY2dbq9c9KTRhKLaGKsFfoFFZSBgTdnOiDesFXtv7RFiatGWl/Z6mBX7KA=
X-Gm-Gg: ASbGncsbVadXuOVdQQ2kHsJyotMfPDJVgin+pKqOgOLyDVNusvtQDS29YD/415hrJzi
	cq5q79kFnx1W+D6CtkTqbeKmXvPB/y5OWGP8WLrDXJhvl3F1+esTjqNpD9ZPWlRfj3wa5nKWAMO
	UyYtXF57Z1LD0If/gEVVDX6ips23mvBfPntyf/XjDn7Ak2qOQs+6vSu7baH7uM+vhiEAcir8tKj
	LVs1UAGdony5orBbwQvXBXrZmp3oOA4/t5aQSPIsZmUguYIVlsvu9+1ocxcpW661N5Be88bJngJ
	ToxBaIvD0LkTjP+0vCVTcGfFtkGh1rjalpdC8NVrfwOxbzpBDFbVe/XJv7IiJMChgObO+0fYeAG
	H/QrFEu3Z9mtgTUzdHfydiRMWKy2R
X-Google-Smtp-Source: AGHT+IHEdGFmSr6KJkifyjVrc0xIRhrTNMltNPXKgSl8ywP+14sm3GrLINtRDwSb2RF2kU14UFLFrw==
X-Received: by 2002:a05:6402:40d3:b0:5e5:437c:1daf with SMTP id 4fb4d7f45d1cf-5edfd156c0amr18247266a12.16.1743670754722;
        Thu, 03 Apr 2025 01:59:14 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:14 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:16 +0100
Subject: [PATCH v3 24/32] clk: s2mps11: add support for S2MPG10 PMIC clock
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-24-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Add support for Samsung's S2MPG10 PMIC clock, which is similar to the
existing PMIC clocks supported by this driver.

S2MPG10 has three clock outputs @ 32kHz: AP, peri1 and peri2.

Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/clk-s2mps11.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.c
index 8ddf3a9a53dfd5bb52a05a3e02788a357ea77ad3..92c8d36dafcf8a448873567fb3541a1b90cd9837 100644
--- a/drivers/clk/clk-s2mps11.c
+++ b/drivers/clk/clk-s2mps11.c
@@ -11,6 +11,7 @@
 #include <linux/regmap.h>
 #include <linux/clk-provider.h>
 #include <linux/platform_device.h>
+#include <linux/mfd/samsung/s2mpg10.h>
 #include <linux/mfd/samsung/s2mps11.h>
 #include <linux/mfd/samsung/s2mps13.h>
 #include <linux/mfd/samsung/s2mps14.h>
@@ -140,6 +141,9 @@ static int s2mps11_clk_probe(struct platform_device *pdev)
 	clk_data->num = S2MPS11_CLKS_NUM;
 
 	switch (hwid) {
+	case S2MPG10:
+		s2mps11_reg = S2MPG10_PMIC_RTCBUF;
+		break;
 	case S2MPS11X:
 		s2mps11_reg = S2MPS11_REG_RTC_CTRL;
 		break;
@@ -221,6 +225,7 @@ static void s2mps11_clk_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id s2mps11_clk_id[] = {
+	{ "s2mpg10-clk", S2MPG10},
 	{ "s2mps11-clk", S2MPS11X},
 	{ "s2mps13-clk", S2MPS13X},
 	{ "s2mps14-clk", S2MPS14X},
@@ -241,6 +246,9 @@ MODULE_DEVICE_TABLE(platform, s2mps11_clk_id);
  */
 static const struct of_device_id s2mps11_dt_match[] __used = {
 	{
+		.compatible = "samsung,s2mpg10-clk",
+		.data = (void *)S2MPG10,
+	}, {
 		.compatible = "samsung,s2mps11-clk",
 		.data = (void *)S2MPS11X,
 	}, {

-- 
2.49.0.472.ge94155a9ec-goog


