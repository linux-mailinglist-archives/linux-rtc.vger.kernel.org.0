Return-Path: <linux-rtc+bounces-3577-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50378A6D1AB
	for <lists+linux-rtc@lfdr.de>; Sun, 23 Mar 2025 23:40:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFDE9188C673
	for <lists+linux-rtc@lfdr.de>; Sun, 23 Mar 2025 22:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63D7D1E5B95;
	Sun, 23 Mar 2025 22:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="evgXH92t"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5451C6FE8
	for <linux-rtc@vger.kernel.org>; Sun, 23 Mar 2025 22:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769576; cv=none; b=PNGovrMivVzLzX4TJSaRi+VGRqC8pmXsz1efv5O/hkPkEe8eeePOVC6ReewUcjQgVdhrul1kjROiDi9C2e/kNx50FEg35KX0nGLgbLw9f8lhfHOjkmeJcPN3iUmMavfn1nFiig4ZhfNxXRB8zCiqybJ+QWQdhr1NIzLHOZdAXeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769576; c=relaxed/simple;
	bh=vhmwcNLdq/vAk/57/nIwHgfUXmRE5veIwzqtkTfIDCM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z7ZGJcLIoHlHnKLAeMT0hd4gumlUbSYvQ0sNOoeP9LrSYW9Qfodf1rWBmbwnyDcVPqNC3WfEn3W2WikPfuHeXTAY7bVsS5/ypvNdAY4Lj6CnT5FuugDW7ZzaHZKTzPs9nQLHsKfEoaRcEzpVGoO6nMb3Wx5S7i8Rtrl6E7+9krI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=evgXH92t; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac3fcf5ab0dso326550166b.3
        for <linux-rtc@vger.kernel.org>; Sun, 23 Mar 2025 15:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769570; x=1743374370; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UPaIY3x3VVrMkB4/G8kk/a/tWB9/OjPG56rBALdlvrQ=;
        b=evgXH92tqHyJLaExNh4ZZ8xmGgq54s0dUHli9+RWyVVeMQgxKwBPqgNUNz0NTbUKmt
         X4nhCb8UtjXIROlwBJrVveHFIKsHis4G5uEl1/7Acxh9QIiC6kQX7TJiZgX0p5diHZOV
         iJL0kLCMz5v5paf4P1xrwduIoXzK5eIpNYZDwQQsG4nCsRR8mZu8XLdMOUbz9SgpNut/
         sX90rblFd5gfW4jk0iinBQPRvGGsXH3u1AhRjMA331+a8JdABeHlrzOy7Mj+BV69FpGy
         47Az53jUg/1QoF2F+L0D+n+DDFucYPdV8DShGzY0JJiw203ZlWQQsZ6Z1sXAN6JjEx3r
         w/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769570; x=1743374370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UPaIY3x3VVrMkB4/G8kk/a/tWB9/OjPG56rBALdlvrQ=;
        b=bbySMjkkgFbuMVx3ds1muyEz7VmQ/6IVV1l+Rm+9JqdXxXr2lGJG3VBMSXTs3qhaIW
         UdjgM7IUztll4OtYxcxuyW10kDgeTlfshqoGLt4IGLgRwnCCNbWtUKK2gdzhB6q3Os6p
         L2k6ULsz0qsC0B1/AJsxq6n5HV2SyitOledUYTXyU4wrszgJhRSRoGVgiX8Zcvhu39bd
         jbMxebDtfjwhatpN7jf9t7uvVZDgXLu0+oEEgTj9/Nln0DM8jADpYvThLY1n6Qlh8U7D
         dCyTDZM//gE+nslTB+Uio3ws1ID3kTBaPypXamDYadLAx0AoFvSZIQTQEkHd60FZodmw
         kEVg==
X-Forwarded-Encrypted: i=1; AJvYcCWolRCQ743gNeK7RiIsnwhb4dItjzSSwf4KoBp8Tul9nKBbHaSeYMnUfjgeUq7DMBfKK9+SEndg+dU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdMYNSOIpjE3qq4QQamoN230A6kmRKCTTgxyHL+mycDkErz/IE
	gZjh9i/Eas0Tt0YeZkddrTG95R8WSHcAqLCqJruh/GttjS6ig3u9vXXDvUcn/s8=
X-Gm-Gg: ASbGncvZkETyebkCjq0pe49qYv1o8au7nZrY+b8QUNavgoXFoCGK2wCSTq453rqkKcK
	GAMN3HTMgN0NnU0vyRAJEDRUJFAk4S4JDjZl+qnhJRi5JlfqofN+oWOtEKlxON3G3SbWDibWD07
	uCCWvnldhq7TqS0ycx0eMY1gQo/VKUMiUlff7JwV2qNZrlFKM6qIP4xBoiKYZGxYRhHf65QV8si
	yP/SYoPe8BTEv5Ve+mtYMEkj40XgGWU7ZQkByl0arYrqh4ZTkIl7CTwEno4kr19PZ2nXK74Nfoy
	uvy9Y0c9up1Nc/1E/cR+1CTx6nVu+sjaXApodJ7b6OgZGjtDq56SVQoHlKE4oUMRK6hVXRfN40d
	jYTaEfBREcFvGvXzL/LDSpgcjv6aM
X-Google-Smtp-Source: AGHT+IFPXn5kuydsVZ5juxiG+97RkmMKn/3aV6ozY9UpbUvRFJV9i4K4wAS7EARyuWbOU8je237GtQ==
X-Received: by 2002:a17:907:7293:b0:abf:fb78:673a with SMTP id a640c23a62f3a-ac3f22b0fb0mr895769166b.29.1742769569876;
        Sun, 23 Mar 2025 15:39:29 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:29 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:27 +0000
Subject: [PATCH 11/34] defconfigs: rename CONFIG_MFD_SEC_CORE to
 CONFIG_MFD_SEC_I2C
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-11-d08943702707@linaro.org>
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

We are adding support for Samsung PMICs that aren't using I2C and
therefore had to rename the Kconfig symbol.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm/configs/exynos_defconfig   | 2 +-
 arch/arm/configs/multi_v7_defconfig | 2 +-
 arch/arm/configs/pxa_defconfig      | 2 +-
 arch/arm64/configs/defconfig        | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 7ad48fdda1dac69a4a9612eabb573729bed7b3a6..251f45be6c14af59263373f21b27b15f42ec7f61 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -167,7 +167,7 @@ CONFIG_MFD_MAX77686=y
 CONFIG_MFD_MAX77693=y
 CONFIG_MFD_MAX8997=y
 CONFIG_MFD_MAX8998=y
-CONFIG_MFD_SEC_CORE=y
+CONFIG_MFD_SEC_I2C=y
 CONFIG_MFD_STMPE=y
 CONFIG_STMPE_I2C=y
 CONFIG_MFD_TPS65090=y
diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index ad037c175fdb0ec8601c9b3607aca0c0e5f3c145..7d06ac5369b1a2f325462f2cf5b54fe22061ca77 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -612,7 +612,7 @@ CONFIG_MFD_QCOM_RPM=y
 CONFIG_MFD_SPMI_PMIC=y
 CONFIG_MFD_RK8XX_I2C=y
 CONFIG_MFD_RN5T618=y
-CONFIG_MFD_SEC_CORE=y
+CONFIG_MFD_SEC_I2C=y
 CONFIG_MFD_STMPE=y
 CONFIG_MFD_PALMAS=y
 CONFIG_MFD_TPS65090=y
diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index de0ac8f521d7612704ce327e9ac16ab9e999f3d3..064e79baf20da809c9ab1f1fa18282aaba11a41f 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -335,7 +335,7 @@ CONFIG_MFD_MAX77693=y
 CONFIG_MFD_MAX8907=m
 CONFIG_EZX_PCAP=y
 CONFIG_UCB1400_CORE=m
-CONFIG_MFD_SEC_CORE=y
+CONFIG_MFD_SEC_I2C=y
 CONFIG_MFD_PALMAS=y
 CONFIG_MFD_TPS65090=y
 CONFIG_MFD_TPS6586X=y
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e8dfbe22db68d9aa24df5af0786a2eeb8f33bf3c..cc4dc330cfe82d11ca0c4c9ba8cac4b14decdeab 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -769,7 +769,7 @@ CONFIG_MFD_MT6397=y
 CONFIG_MFD_SPMI_PMIC=y
 CONFIG_MFD_RK8XX_I2C=y
 CONFIG_MFD_RK8XX_SPI=y
-CONFIG_MFD_SEC_CORE=y
+CONFIG_MFD_SEC_I2C=y
 CONFIG_MFD_SL28CPLD=y
 CONFIG_RZ_MTU3=y
 CONFIG_MFD_TI_AM335X_TSCADC=m

-- 
2.49.0.395.g12beb8f557-goog


