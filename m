Return-Path: <linux-rtc+bounces-3600-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F25F6A6D20F
	for <lists+linux-rtc@lfdr.de>; Sun, 23 Mar 2025 23:42:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B08B2188C65F
	for <lists+linux-rtc@lfdr.de>; Sun, 23 Mar 2025 22:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C8F41EF09A;
	Sun, 23 Mar 2025 22:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sg/BoZUo"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0231F03E4
	for <linux-rtc@vger.kernel.org>; Sun, 23 Mar 2025 22:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769593; cv=none; b=TduoX123L4DKO42PsRTF7YWWb2vdhkUUijibGjrveKHBfV19NGJFg8gAPhii5/kxMLNF0DTaAi9JMgz6JQqbi0+4g871Z6yqu1It/5fN3+AWt9/pTmiF+cc6dxZiYpUBvNy1qGcDNdwh0lVuufqTlUekCBmMMKQcDJQFnSmylb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769593; c=relaxed/simple;
	bh=H9PnjiGdaPmfWukTzjrtFxLU+96UeMWEkuYWR2ErP7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EwXoXmDFr6imyUvLK9fju7Id2gRZ4ueB0/9zAfCYfp2bvE9jM9YIBmuxqlgH/ObVXsh0E82G2tqN/6SRELPGfWL88B7ZJHfX2Nc6KbVKGBSyTDb/jUslRhFFUC32NtU7NoTUn6uDyNieXaVuf1Gq+rfR6oMiXhgnyrkyR7j14v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sg/BoZUo; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so805173366b.1
        for <linux-rtc@vger.kernel.org>; Sun, 23 Mar 2025 15:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769583; x=1743374383; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+9zuZxWNg3rbrJTairaqhANzxAqu72T6zzPhxq7UOmE=;
        b=sg/BoZUoO1vvhUz/iyXWR/MXNTeBGwofC6UNpxJQrUNNiw4KK7eE2KsY4y7RmEDrgc
         CJDWqICOsVStbXFUlcoIpWqaRqmNNCv3c12rcDsZ/VNGnK6VtAlsbYR3wNoU3zuaC46C
         fwz7FHf6mwR9L+LRktEj+XD8Vfg6qal8O9QomUJ2Tt536IPiTrdB1ffkNYE9bqYyKMlc
         tnWoNjR9gAQhM8yrQ9ooN+jhbYkfFc/NTsvVLHYDekiMBbo3Lw/btgm3ML3LS3PXwz/t
         kOBqxBnV5cVs/bHhMlwVsJk84DAfki4LbUB/W/IVthCI0pHuv19sX6FD39us8LONlxYz
         8GjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769583; x=1743374383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+9zuZxWNg3rbrJTairaqhANzxAqu72T6zzPhxq7UOmE=;
        b=X5Pob5x30mQWIvwg9DMgKwMvI9mPipbj2eIAntvT7NgJXSjFXthJwvavzd6YD+Jqof
         bGdsDFFHPjGajNqr2w53yoQCvFq77zGrSKO0rQw8wYjyRCYQ8F6oif5ISSp/p/jn0S2i
         O8kTBVIWVHDtqXt3Q/CTAAYWseJHnTm/RwUc1qlFAFnqcIA8/M6I++bXDWc3TnSYUWkb
         XD4Gy/3q8JQMOAm0VSxtw+Il0ApXhpR085KI4ftT2bV0VJYt3AzPLxUcmkcsgy/0u1lz
         albnE/2aDzlZDTeHB6WqIsWwlHNkSufOsHbu2JeyQ9VRalmFBaEY2u3SkQ6thXKxSJlA
         T34w==
X-Forwarded-Encrypted: i=1; AJvYcCUbxGSK9yrqMymZkJLkcfFNcHSXjGefqhLfgExI6jXp7xrfaMZ+1wjZpKc1TMgsBuZR0Eic7zOgZow=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHA5bWWBZ5GnEFgxHsmU/OmlvXw3h5fNSsn5oxqXzpiJLX+RvZ
	8/HqGVbvfRInZjb3YH33xbIXFCKmOhkm0wkHOWwDZn6IWHtcLD98uEnMpBiD2AQ=
X-Gm-Gg: ASbGncv9ryTX4nnS7LiQ2bStdAbLcdwvTzlOYzdVwb551C5L/2g7cbwwm3SFex7al24
	sIOvtnpma3HvHyyNuXGsZpo9fwIigTQzsNXTFxCb6/HpP78j79hS28CsMQbahzeQB6LjsvGHCir
	Ws1gGkVv28lwlwnnp6PTwVJA1yyO1+4M0b1QB6QMrXJroKSSAscNiLXKjh1BRRoxDNVAU5LzMmg
	6+6hVJGhdhpMoUMeigZ3J4uno0+kOIqXVH1Ccm66QT0ayYmbgV5DoW1uLh4meUrXvsdPJNxYWHK
	xRg/F2sGt6O4bnYRq7pNLt/EUyzccXAH8UT+FT1PcEGIPQ4+Iwzl9qgEEOc1BX53cHdeprBL6UJ
	bcQApOF/89qM7GPlt4xQvXd6+ZcTWucZ4fgD7hKw=
X-Google-Smtp-Source: AGHT+IFs4xHKZtefwGlVOQ1hTfmO2hUQ+8e+EVgI4+xRTbfzM8/S+AZdGH6X4/sL+XMu2751zvkyBQ==
X-Received: by 2002:a17:907:7f0d:b0:ac3:3cfc:a59c with SMTP id a640c23a62f3a-ac3f20b9b10mr1154328366b.11.1742769583314;
        Sun, 23 Mar 2025 15:39:43 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:42 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:49 +0000
Subject: [PATCH 33/34] rtc: s5m: replace open-coded read/modify/write
 registers with regmap helpers
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-33-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
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

Instead of the open-coded read/modify/write sequence, we can simply use
the regmap helpers regmap_set_bits() and regmap_update_bits()
respectively.

This makes the code easier to read, and avoids extra works in case the
underlying bus supports updating bits via
struct regmap_bus::reg_update_bits() directly (which is the case for
S2MPG10 on gs101 where this driver communicates via ACPM).

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index fb65a8e439d72d9070751c00f5826a403ac0b416..2ad01fb3bc72fe9259a8307584c9cf3a839bd492 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -279,17 +279,9 @@ static int s5m_check_pending_alarm_interrupt(struct s5m_rtc_info *info,
 static int s5m8767_rtc_set_time_reg(struct s5m_rtc_info *info)
 {
 	int ret;
-	unsigned int data;
-
-	ret = regmap_read(info->regmap, info->regs->udr_update, &data);
-	if (ret < 0) {
-		dev_err(info->dev, "failed to read update reg(%d)\n", ret);
-		return ret;
-	}
-
-	data |= info->regs->write_time_udr_mask;
 
-	ret = regmap_write(info->regmap, info->regs->udr_update, data);
+	ret = regmap_set_bits(info->regmap, info->regs->udr_update,
+			      info->regs->write_time_udr_mask);
 	if (ret < 0) {
 		dev_err(info->dev, "failed to write update reg(%d)\n", ret);
 		return ret;
@@ -303,19 +295,12 @@ static int s5m8767_rtc_set_time_reg(struct s5m_rtc_info *info)
 static int s5m8767_rtc_set_alarm_reg(struct s5m_rtc_info *info)
 {
 	int ret;
-	unsigned int data;
-
-	ret = regmap_read(info->regmap, info->regs->udr_update, &data);
-	if (ret < 0) {
-		dev_err(info->dev, "%s: fail to read update reg(%d)\n",
-			__func__, ret);
-		return ret;
-	}
+	unsigned int udr_mask;
 
-	data |= info->regs->write_alarm_udr_mask;
+	udr_mask = info->regs->write_alarm_udr_mask;
 	switch (info->device_type) {
 	case S5M8767X:
-		data &= ~S5M_RTC_TIME_EN_MASK;
+		udr_mask |= S5M_RTC_TIME_EN_MASK;
 		break;
 	case S2MPG10:
 	case S2MPS15X:
@@ -327,7 +312,8 @@ static int s5m8767_rtc_set_alarm_reg(struct s5m_rtc_info *info)
 		return -EINVAL;
 	}
 
-	ret = regmap_write(info->regmap, info->regs->udr_update, data);
+	ret = regmap_update_bits(info->regmap, info->regs->udr_update,
+				 udr_mask, info->regs->write_alarm_udr_mask);
 	if (ret < 0) {
 		dev_err(info->dev, "%s: fail to write update reg(%d)\n",
 			__func__, ret);

-- 
2.49.0.395.g12beb8f557-goog


