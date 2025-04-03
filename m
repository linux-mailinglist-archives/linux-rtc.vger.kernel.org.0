Return-Path: <linux-rtc+bounces-3751-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C661A79F4A
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 11:02:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20D5218942B7
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 09:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A55524EAA2;
	Thu,  3 Apr 2025 08:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C8iwvNkt"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC4824C08D
	for <linux-rtc@vger.kernel.org>; Thu,  3 Apr 2025 08:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670767; cv=none; b=EHBGOrv2Dki2nOyXWJOgGDIuHJ+b5+JA+6XW6EWLngjYIVLJsasVM6sLe8PaVoN3Iif6TtWKgme7A0EgXkVnERK+Tv6FkdL/xdEZngfN7Kj0W9ZlncWzLuLGwTUgdpvYqwtduMknp/Y4kgcoKY8+Rx932/8JciMoRIJW4cG1Ilk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670767; c=relaxed/simple;
	bh=ZQXUgJ+++iTVY6rSOqr6bNKwQtS/wOW8Ul9zOtzlYzw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AySl6QmnjoHRwPEtqDTdwCm8GrjYJ1lLKxknmwQA3iCOH4ewuGZw5XOht8OBNmIi4n1YFz3x9URQVfGdtx9CWUksuUdbmjoifuv07GRbeueUQUdckwn/KBefl/dETQvkA1CtYfe1q4VBB5lLO6gbHXiryjS0zJTrbYKRQHuOQgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C8iwvNkt; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e5cded3e2eso1103945a12.0
        for <linux-rtc@vger.kernel.org>; Thu, 03 Apr 2025 01:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670755; x=1744275555; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/FZ2sB+aGjDu2Ign5/fbJkQ1EFpiN/+kFXshKweSgHY=;
        b=C8iwvNktwpSWbWVc527210tUBSRsDCd2Mrocj+6FVI6N5sNG1h2ighoMsWH/iuLQE/
         t9cTHv14FlIQ/iURwrLomEU5MQ/RR4mwO3H04ZPm/0/12R1i6Phvi07oGQXBDG64fIg4
         XpvEV9ZkdTX0EwZ6NzwrU2CEesCpQkCZFpzx/pDVoDlA1aSPm52a6NUWNNZjK31KqTMQ
         GSvMRt2yD7VlywN7/7/tLVoiTTY7Sym58C6GxGB2uKtKHnU6kjcPk+voFFbjNs8poVxN
         BJoNfQPY6TkDDk7pIfPgdECeQrD+Wl8X4GgwdVi/JrsVsqxBbtffdXYRPxGJgeKqwso1
         2WBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670755; x=1744275555;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/FZ2sB+aGjDu2Ign5/fbJkQ1EFpiN/+kFXshKweSgHY=;
        b=FGSed3dOKynrCXsiHQ7mvbe3nf2CCvptHAjvjJGN8zMLEISkGjKiG+Ygdb5mEWl3fR
         NV1j3qdjCRApFaKPaQAkQHzB+Dw3LaDtfAbcOOhkokfwiqJMndgR93AHcgLJAyCMpEqV
         IwILeS+/8u+5HImCEjd6FwIKGGTAz4sY12BKO56KHHyXj6yKbuNBm0z6EWKpBFEYxWuT
         EtehufzyveIrZvZBQqoJjTWPk8BPl21UK/dykmOuN332U3ZBDkRpgo6BawWRQyK1xSrU
         AZu0188v8yFd4oE51OuKxoODj1lzgj6PfZ5ZaTv8XFuG4DIiCsQi/MziSRIMH6ve+jVN
         zKDQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4wT7w1QmFRpt87R/shBV7warKd4PQJCduvQIgKlut0bqfwRIqq9unjq9DZQ1XfCsdWODfCaP7tlI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9HKozxCqU1Z+qTnaMPS8S33FMUmAC10x4W24G6xMAyEbycTjr
	PjrdlaWJXA2PtWr4cvfDN+0e00hB1u2uBtGffr+C1Qoi6ZuAQ6xmctW/J8wqxxw=
X-Gm-Gg: ASbGnctJ2WYLLlStGybUSvRt8V01XACki4T+/ZtT871CK6w2vvBwelc6+kexvnDtPsL
	bp0lEve6P6mVX0EJLn0OE9VFho5jws2Hh8zPjXnVik3zVmxtt/d0RFFhZoYvM0OfoZPK+TOnJ/q
	I4bcUH9kvCvL/CeJA96/ZsDEYSKp3eyCFVlrNzP7adxdb4JfzfT4W/h3B2QZBikAuTN/k4EKkec
	APJtol6Mz1233lohAiVOlADAZIE13SG+MZHt6IFRh+l2EJABve6NpeGQN2m2D7jDZDfDBoC7Elw
	lp9HRqkgOi6gkEBo9jXByx5c3ZjihH+mfNyjOGrLpTWXV/mf/AIbbmiNbaq/iQu/MuT/mIAz6lV
	IHb9kEdPxVBHNePsSjosoTluF6aXp
X-Google-Smtp-Source: AGHT+IGQNpVavXNQ9/frqDzO9rSosrg/aPUOlz+BV6bBkX6B3R/1cOiAuqPEN4gk8MQb14kPnJPxIg==
X-Received: by 2002:a05:6402:40c2:b0:5ee:497:d714 with SMTP id 4fb4d7f45d1cf-5f04ec3a302mr4194362a12.34.1743670755488;
        Thu, 03 Apr 2025 01:59:15 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:15 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:17 +0100
Subject: [PATCH v3 25/32] rtc: s5m: cache value of platform_get_device_id()
 during probe
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-25-b542b3505e68@linaro.org>
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

platform_get_device_id() is called mulitple times during probe. This
makes the code harder to read than necessary.

Just get the ID once, which also trims the lengths of the lines
involved.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index db5c9b641277213aa1371776c63e2eda3f223465..53c76b0e4253a9ba225c3c723d35d9182d071607 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -637,6 +637,8 @@ static int s5m8767_rtc_init_reg(struct s5m_rtc_info *info)
 static int s5m_rtc_probe(struct platform_device *pdev)
 {
 	struct sec_pmic_dev *s5m87xx = dev_get_drvdata(pdev->dev.parent);
+	const struct platform_device_id	* const id =
+		platform_get_device_id(pdev);
 	struct s5m_rtc_info *info;
 	struct i2c_client *i2c;
 	const struct regmap_config *regmap_cfg;
@@ -646,7 +648,7 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 	if (!info)
 		return -ENOMEM;
 
-	switch (platform_get_device_id(pdev)->driver_data) {
+	switch (id->driver_data) {
 	case S2MPS15X:
 		regmap_cfg = &s2mps14_rtc_regmap_config;
 		info->regs = &s2mps15_rtc_regs;
@@ -670,7 +672,7 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 	default:
 		return dev_err_probe(&pdev->dev, -ENODEV,
 				     "Device type %lu is not supported by RTC driver\n",
-				     platform_get_device_id(pdev)->driver_data);
+				     id->driver_data);
 	}
 
 	i2c = devm_i2c_new_dummy_device(&pdev->dev, s5m87xx->i2c->adapter,
@@ -686,7 +688,7 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 
 	info->dev = &pdev->dev;
 	info->s5m87xx = s5m87xx;
-	info->device_type = platform_get_device_id(pdev)->driver_data;
+	info->device_type = id->driver_data;
 
 	if (s5m87xx->irq_data) {
 		info->irq = regmap_irq_get_virq(s5m87xx->irq_data, alarm_irq);

-- 
2.49.0.472.ge94155a9ec-goog


