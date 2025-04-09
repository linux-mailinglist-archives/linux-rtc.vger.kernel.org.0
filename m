Return-Path: <linux-rtc+bounces-3883-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B00C1A83275
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 22:40:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BAC78A40A0
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 20:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03379222595;
	Wed,  9 Apr 2025 20:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fgT8kvhz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2E521C174
	for <linux-rtc@vger.kernel.org>; Wed,  9 Apr 2025 20:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231075; cv=none; b=PdONvxmdmzyw9yw6jWGzj5v4+QWKcXLCv4d4mwTVhVSFdg+TWtYEJK/LEhc0RnoEDXfcp29KIGzFcdAv071pNzfM+MVBzklIICsZjwu554Q/sqSAPSCvCWUVoPQqFqzSJdOJfzAXSFoetd5TaPBHW1ypS99hdFMDBK3juLf6aTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231075; c=relaxed/simple;
	bh=qSv5/qRfekv1BXqCAyoLS9fhjEPlxat67lwDh+L/ZJw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h/uoLRHO6S5G3VqwJNdgBgU0wdqClWy2/QgN7nJlZGQ6RiODajCoaHjT8Jo0vMI67WF0E+A7qPWltd5A69+3PWBjpEcZBH31MNn4eltAfDfLoX4mjRlpzYwiJSOl3ORNvE2/+uH9FG92xA4IffPCYpPPmd6A6ljZAme4Ijj0zrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fgT8kvhz; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e5e1a38c1aso130133a12.2
        for <linux-rtc@vger.kernel.org>; Wed, 09 Apr 2025 13:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231062; x=1744835862; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yvl4l0Ok5PkRG0EWi21Y82ldA8DtM3z/BsTax0kidDk=;
        b=fgT8kvhztDK9j2B9NsFMoMoAPRlJ2/YjAyQuCPArIwJ2Nt87a9nP6Sgn+V/2kAIuts
         GWy/ZrxjXDgTeW6Qb0JZK0zvvwhbXpCV/vdZZSs1N6bFRIJoeVkGIy8SJ2uuQ7v4cBmv
         I4zXU6W4VJFK1mRaTPqXllhJ6zE+gFaRo62S7u7EeudWjinb8zfBnMJkaWqM/5SMFf6t
         sIJIQO6ihhYbT2yIOlCdnBJO7hfjcmG5skj9Vhn5LruF8yMMm9odJpb5po+5QWNRmeti
         rX5iwXDJegPHB6rYdcSCU74JzIKlb6eaMXJui5IVDwP61o2VrxOkF05vTTSrMF2VPu/V
         ofAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231062; x=1744835862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yvl4l0Ok5PkRG0EWi21Y82ldA8DtM3z/BsTax0kidDk=;
        b=PNCOaX6Ypy9+pfyF/u4jcjdKggQJ9h0swVtYd7oDX2Seayvnam12MVD2JDKPIWSnbq
         fURiPtX1WtUkqjE/hXcsgLlatQCQIfLkZea++DlToq3OICWO6c3PP8+XBjCs5dZw3VMu
         9S1N4brf6kATpDy1iHHGvD6al4mCc13TK64f041V8Pguk43gLeVaVHVJOTMx83lapD1Z
         pkZlCr7JKRjv80QoLTzq+mFI1q3VzBn3JFfIEM9WaN4CQR06BnSC9OwTWFIOrhPKtJMe
         DvogTXjE6q4wrok3xPTJRMrCSrz9f16EfUaY/bZv+G776Dqpl6sEXkxBhuZKMnRnS9x3
         WpSQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2aOq+HQt27zqK1Xa/JMKyiQfb8tB6EV0fSgD09kPZhegq85leqCyRUCawzXgaTCKCtxJp0a2mkCY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3c/J9gGtylLi5iMf8wqaGoAdLdA+MVMqniad+CA70Ce4IVE4o
	AulUmeFiGlBVPTIaKavxaQTb3QvDjMLz10USUp72Zx8X3WQP9Mi49G8z/DDLBP0=
X-Gm-Gg: ASbGncuMBvPEVESnCEtRKdufBXv7VQk5SerCMoEFj+KHukVtR2iqKzDRBoDQuFSgiK1
	OslutNizuAosNNUzWFr7t4EUw3/DPi65TsT0d9epJH9IeIgVU/0jOoS3m//Cap3hkuRzXaASdqi
	+GWOUxWAXfyS9SJGOeI+cnMXt/NCOtsJDZP5nppWPB9chuS/dIUPrPgJRWqRtO1X9czH2V2I8WZ
	LI0MtDCr+sNOTh5bJCE6IoYs4i0uN4BGxNnE22Fj79rwvi95xYddfdVIXrsG7BeU85fJnZfsBzb
	6DJ/A6fd8+U/xICZ0vWTWGB3cOzNpLVaBM6jzAxmit2sK14JHb0qZJdzONmkqUyMy5gB6EeUtaL
	v1ECZwGey6bSC/JpJVWxqJw3hNzY=
X-Google-Smtp-Source: AGHT+IHbuLfVklw/YEV595LIDXkT6NJfGZ8tsFxVvFej7hgAnnMJK0l8IFDXzmywh/fHAbSmWr9RuQ==
X-Received: by 2002:a17:906:dc89:b0:aaf:103a:e6e3 with SMTP id a640c23a62f3a-acabd3c36a7mr7622566b.43.1744231062434;
        Wed, 09 Apr 2025 13:37:42 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:42 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:46 +0100
Subject: [PATCH v4 25/32] rtc: s5m: cache device type during probe
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-25-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
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

platform_get_device_id() is called mulitple times during probe to
retrieve the device type. This makes the code harder to read than
necessary.

Just get the type once, which also trims the lengths of the lines
involved.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v4:
- cache the driver data, i.e. the enum type (Krzysztof)
---
 drivers/rtc/rtc-s5m.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index db5c9b641277213aa1371776c63e2eda3f223465..c7636738b797b8087a0ed6844df62d47427e33b8 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -637,6 +637,8 @@ static int s5m8767_rtc_init_reg(struct s5m_rtc_info *info)
 static int s5m_rtc_probe(struct platform_device *pdev)
 {
 	struct sec_pmic_dev *s5m87xx = dev_get_drvdata(pdev->dev.parent);
+	enum sec_device_type device_type =
+		platform_get_device_id(pdev)->driver_data;
 	struct s5m_rtc_info *info;
 	struct i2c_client *i2c;
 	const struct regmap_config *regmap_cfg;
@@ -646,7 +648,7 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 	if (!info)
 		return -ENOMEM;
 
-	switch (platform_get_device_id(pdev)->driver_data) {
+	switch (device_type) {
 	case S2MPS15X:
 		regmap_cfg = &s2mps14_rtc_regmap_config;
 		info->regs = &s2mps15_rtc_regs;
@@ -669,8 +671,8 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 		break;
 	default:
 		return dev_err_probe(&pdev->dev, -ENODEV,
-				     "Device type %lu is not supported by RTC driver\n",
-				     platform_get_device_id(pdev)->driver_data);
+				     "Device type %d is not supported by RTC driver\n",
+				     device_type);
 	}
 
 	i2c = devm_i2c_new_dummy_device(&pdev->dev, s5m87xx->i2c->adapter,
@@ -686,7 +688,7 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 
 	info->dev = &pdev->dev;
 	info->s5m87xx = s5m87xx;
-	info->device_type = platform_get_device_id(pdev)->driver_data;
+	info->device_type = device_type;
 
 	if (s5m87xx->irq_data) {
 		info->irq = regmap_irq_get_virq(s5m87xx->irq_data, alarm_irq);

-- 
2.49.0.604.gff1f9ca942-goog


