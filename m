Return-Path: <linux-rtc+bounces-3748-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA5AA79F43
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 11:02:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 384E93B6372
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 09:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF57224E4CE;
	Thu,  3 Apr 2025 08:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="URzP2DcC"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF2E24A067
	for <linux-rtc@vger.kernel.org>; Thu,  3 Apr 2025 08:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670763; cv=none; b=m5grzlZNu0IIBdtjoRsMRoNEQANT9kXhZf0Yyc0Rvc+OrY5lenA+TZmetJeEzS0voxGZAnZHDy8tqAtvNJosWG2rNv2ZMGrhhvIp4aOarl6FSxAqgrS/Lw8EBSwRLC3pueK5wRbeXjM05E8Uu6PIGZzfMuO7jSnjT0tNkidZFVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670763; c=relaxed/simple;
	bh=X0QQTgyZyBPIURJ3v2tympUyOwlqSVYuYyMtIMSpfpo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a6BdybQrfG7S2UfxtTIdnAejXF1Sovbur64kzJq1k6q1BXzhTppDAWY9GiYNplAnXeTxuBr0l+WcvpbwuiIgjGzlGj9EWXPiy+Vuc9mALPHC3/ReNXJE0l1K4Rk7ouCriCZ+r6ad56WcesspWZ6g4Elif7S+ajnTthCkbmLut2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=URzP2DcC; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac2dfdf3c38so119349566b.3
        for <linux-rtc@vger.kernel.org>; Thu, 03 Apr 2025 01:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670753; x=1744275553; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kV75c5wurwfdiB4LfjbAT+jBLqgbz3xs0SfJTGIePwA=;
        b=URzP2DcCIIAiVaxYYoMP73MU7SEV97+smhklH5zWxCElfDYlenJFBlbTeXnyL8euh9
         yojM2ojq8gpYSFUyO2o2EhhfuWdSdqE6duPdeILAc6qZkUMbuqsv9XxgL6bSEzE+mK/E
         EtiCau9LX0kSw5SH1+t27TYBgm6G4/KfA0GmLOdOjst66COPikk+kVdmsVqbe8w56XwL
         BwIa8v3iuxg3ViEGY1horI+IRPXbyVb1QEIeUvyTu133yDODP3FjYSed/DTCOBw0Qcdq
         bMNZ/3xs8eqL/QQJHld6leDsJAG29QtCUVMndeGfgnxz1KwMzppjXf+8PoXaPWKvrDaJ
         wfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670753; x=1744275553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kV75c5wurwfdiB4LfjbAT+jBLqgbz3xs0SfJTGIePwA=;
        b=WRrtQnAvWOyI2Sjoqof8cL+nyp3IQv9Yf5n6eV5sRHn1L0xPw92LHhZDlMutJVpL42
         +bCnCZNrUaRkKKXWEh0jToHuDjvVdALmJ3Sm/o/nc3VFWTfg/x9XbN6Wuo93Ujx+Y0O4
         imsCffzY4XWhtA+htPZhzX6X/ByIDqP9UizQ9d1Ad+WZUuNPTY+EBMSfrQrtH0zA9+uP
         9qnO5/Pqyy4epEKKHh+6wUjk32zgyBUHWLrPCTPZ+v+NO4+MiEfMi0QPgnHCkVrtPLVw
         qeSphtkP6xYkI+V3TPIHABpFt4PSUqh60axb5cQAGHeI1l5ktbfoyS/Wh0+NAK9pKK74
         t9sg==
X-Forwarded-Encrypted: i=1; AJvYcCWhpOpbtZkvkT9JxeBM6IBgP+MpCmH712RT7IzWJvryD0DfnJ7/mTbnQSZT6APVxxihFDdUpoFDRCk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeiiYbDLET/ATXOZ+vdGEA5P8AIDROLYEQFHnmErcsLBjT5JE2
	xwDw04fOBu2Wy/zLltpim6RKw8PSjdfKyvf3zGj+S8P+uitwv9LBCgjSF4Ponlg=
X-Gm-Gg: ASbGncsQthvSsNFRU3lqNgIO/wbbB94awbwP7qpe/43llD7TR9UCQ+0iQRoiy4rLmSJ
	B/cWGftqnuB4At4tfKFPX/idMTdp1QWdwLmW397kEJi/5wtyWoY1YnkW9WuUwF+qQGu3ZXSwALk
	2bB0THUvgtSA8pMUZZ/babvXvroZ6CW8afdx/RGQ2V9ZVbTfgLQAxUWztYPHsD4l9UGIF7YFprR
	A9SPFUHM3XFUhBE3XR2xD0fEkx/KJh8Qunt4vX5aXoQtYaBRx2a/HW/462cI9N3G/1PtTuh7uSZ
	CBnmpIsrkV9hkjpQ+6pJWeZQcW7MyK1Nm2rCuoK+6/e6x2TrZSE+lRV3fgfC2bO5S7+CMreXkJv
	/3helE+GPIJkl2SnY/WxGeqTiLG6a
X-Google-Smtp-Source: AGHT+IGcX+tYkvLIpCQDt/tVecCK/2rtCpUV2gBjKE/E/xLa7G15uMrlM8X/q+3JmlSAkeK9HlD3fA==
X-Received: by 2002:a17:907:9692:b0:ac3:49f0:4d10 with SMTP id a640c23a62f3a-ac7bc259458mr148490166b.38.1743670752608;
        Thu, 03 Apr 2025 01:59:12 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:12 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:12 +0100
Subject: [PATCH v3 20/32] mfd: sec: use sizeof(*var), not sizeof(struct
 type_of_var)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-20-b542b3505e68@linaro.org>
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

Using sizeof(*var) is generally preferred over using the size of its
open-coded type when allocating memory.

This helps avoiding bugs when the variable type changes but the memory
allocation isn't updated, and it simplifies renaming of the struct if
ever necessary.

No functional change.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 55edeb0f73ff4643f23b9759b115658d3bf03e9a..e8e35f7d5f06b522a953e8f21603e6904401c983 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -163,7 +163,7 @@ int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
 	struct sec_pmic_dev *sec_pmic;
 	int ret, num_sec_devs;
 
-	sec_pmic = devm_kzalloc(dev, sizeof(struct sec_pmic_dev), GFP_KERNEL);
+	sec_pmic = devm_kzalloc(dev, sizeof(*sec_pmic), GFP_KERNEL);
 	if (!sec_pmic)
 		return -ENOMEM;
 

-- 
2.49.0.472.ge94155a9ec-goog


