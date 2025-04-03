Return-Path: <linux-rtc+bounces-3747-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 609ACA79F4C
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 11:02:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32CF6173915
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 09:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9039324E01F;
	Thu,  3 Apr 2025 08:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f8WdtEU9"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F79224BBF3
	for <linux-rtc@vger.kernel.org>; Thu,  3 Apr 2025 08:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670763; cv=none; b=ub1FmtuLFJATZvjbV5ZQVJHpfdawgMEjbcHDf3giEZYYGOZZLeXeQa9799C+RsP65VJiz1fho0U+OiTmCmU0b75a68tmX6g9W3WsdwuY6G2WxNO0ajue5A440EtUZmNoL9ZlC8iJBh9yuHF9h+0BJ6mtqrm3uod6KGJ+mTdWZ5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670763; c=relaxed/simple;
	bh=kEDFa+8UVBQzgPmv5eunRw1YTfTPcSizj/QHfDecNE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kE3jxIySJf4xCjpXhNB5YScxMXIdp6oxioz0N+r0ynsl7uj7p2TicHG2V6hn6XKyYiVyxQHzulfxMnKP7at7gvV/xs7vR2DIPCF01icPxaMo4SjnnwFsbifaydAys7IfME6yqnARxN2auIyyQD5loi45OttTBrm/GUgEJcn9MWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f8WdtEU9; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e8be1c6ff8so1319483a12.1
        for <linux-rtc@vger.kernel.org>; Thu, 03 Apr 2025 01:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670754; x=1744275554; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zep9f0d4foFUFHvL7+wCfhcQlnrOmBCem8a0X84Q4jI=;
        b=f8WdtEU9vO+BsAgldDW/lpOndPTa42kz0y+sHYdaQf5AqJBGzuENzPhiGdb/7TBlNg
         mcqbzmsZtGLzYoH4qkKw/ExxjDY4a5fUn4BV9S9QYinkUtXM8l76t3vncInOVTJVe3sO
         lavU/MyOYretXqAtBUsyfhuHHNjLOSWi5Wo5se+z+aEie9xvjLSjeMIIBSWdAIwwxWRA
         70O7G+LSOdBauY6bI5R/b8Fur/ZZZ9cMJ8jMBOW1hDLNxp3PTG1WzgONdtnr8XCxvgfU
         64tEBAQdjG2T3CVsPYwXzklq0C8S6haeaw7sWLWC9Mgr6BgzoY7V4pKlW3WDuEpdYWC3
         nctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670754; x=1744275554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zep9f0d4foFUFHvL7+wCfhcQlnrOmBCem8a0X84Q4jI=;
        b=qhuPEdaEd2H8TG+2mefV7HP6+pfpRtw4sCuRweaEerBfxlQ9ZevLp2Pqcj1XEUbDHO
         mHJjhcaLOYQb2Byu6VqdR8EOPM7M8WlyKw99o1+5VCjOhvgWvZCLANZNpJ/5HD2sPow0
         FT8PNE7bG6F3TodZWLD/veUeTFDEi82/aGIElY52K73cgwp0fOEHgvnz/JUyUSJXgqfl
         f8uRIHlOcKTqVYx8ifznQZHAtZ634Q2eeoVhypxP6mNYMnTm1hphojfsdOmJ7hZM96VP
         ZPJ8OXjEaOsmUrdXF2IeirVbkRskPTiduJQgJe1OFsFky7pysA/JVTY6GyP4kk1rsiaC
         LYjg==
X-Forwarded-Encrypted: i=1; AJvYcCVrh9AWM2RoTpwp5zXQRVsMsuhVfNjKHxATZRRkDGySSosAKdH3F7l1Q/jVim/W5c2p48gI++jNYZc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzArrqOx41tjdCT6PyB9ma/XrJYjyzrByxMB7PovAaW3/QQVI98
	a6W2KBrjjmgyJtJit6VnsETseooHIEjYkNq5AOe426qzyw8UEx+UgfwlwEAKzgk=
X-Gm-Gg: ASbGncviKkbXFtzb/rNorOGLBhqnsoNxJ4pj/udpffPlLqOMajOoaL0vmKFWmblnFcK
	gAvkqfC8F2dDy4HUKZcoOejisFI6Y1y0fMyWch3WFyjpmGMjrEXGiPCg878JvE6xaWlgrLNutd6
	RfiZNpuYEcqp4tq2sg7p/A3z8ZKKXASfTsNukslMXVSbScm/vK8sJUgKiibH7ml9pPgKnNp9jWT
	fGBzzeK0Xk2x12XH5a2fLgwMPCFLwaJFjWunsMt5HudTC/02fBU0h6M06186SKzf330bYF5oBdq
	r7rLwJ/9VbjcNpAIqT4KPipBlWSO2FaP/lKYLs5z6y2c775YO9dGpc0EbSaKRhehbDdkRxktFdv
	HKdGeFCi+avoGVnQXRhio1k3+w4P4
X-Google-Smtp-Source: AGHT+IHPaEYedqVEDLo93ujbRrtVNCm/mxpEYABRhJlFkwLFXs8WrbrWDofWHLr/5jqHegGOehX8ag==
X-Received: by 2002:a05:6402:5112:b0:5e6:17e6:9510 with SMTP id 4fb4d7f45d1cf-5edfcbe92b8mr15687119a12.6.1743670754243;
        Thu, 03 Apr 2025 01:59:14 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:13 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:15 +0100
Subject: [PATCH v3 23/32] mfd: sec: add myself as module author
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-23-b542b3505e68@linaro.org>
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

Add myself as module author, so people know whom to complain to about
after the recent updates :-)

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 1 +
 drivers/mfd/sec-i2c.c    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 448300ab547c10d81f9f2b2798d54c8a03c714d8..05658f05cb857a784c7d01b1cf25de4870e1a95e 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -293,6 +293,7 @@ static int sec_pmic_resume(struct device *dev)
 DEFINE_SIMPLE_DEV_PM_OPS(sec_pmic_pm_ops, sec_pmic_suspend, sec_pmic_resume);
 EXPORT_SYMBOL_GPL(sec_pmic_pm_ops);
 
+MODULE_AUTHOR("André Draszik <andre.draszik@linaro.org>");
 MODULE_AUTHOR("Chanwoo Choi <cw00.choi@samsung.com>");
 MODULE_AUTHOR("Krzysztof Kozlowski <krzk@kernel.org>");
 MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index 2ccb494c8c024361c78e92be71ce9c215757dd89..74fd28a6bc9a42879fc1eb05546777f60e0062e9 100644
--- a/drivers/mfd/sec-i2c.c
+++ b/drivers/mfd/sec-i2c.c
@@ -233,6 +233,7 @@ static struct i2c_driver sec_pmic_i2c_driver = {
 };
 module_i2c_driver(sec_pmic_i2c_driver);
 
+MODULE_AUTHOR("André Draszik <andre.draszik@linaro.org>");
 MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
 MODULE_DESCRIPTION("I2C driver for the Samsung S5M");
 MODULE_LICENSE("GPL");

-- 
2.49.0.472.ge94155a9ec-goog


