Return-Path: <linux-rtc+bounces-3731-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B51F2A79EEB
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 10:59:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28A581895958
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 08:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F4C5245002;
	Thu,  3 Apr 2025 08:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o0NweKEI"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D0019E7D1
	for <linux-rtc@vger.kernel.org>; Thu,  3 Apr 2025 08:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670746; cv=none; b=K6RaOFeCZOzCmJM6beNrG3xrNiz+PUQg+5maIWpmbdQ77sypkl2OjJWStuEOCOgf3y7ItxEiC+Mr6oy4Ei3R+he+Rb7RgkhJcEym9ssqQiRAwzqgVYnkn3H65QI2m2bKg2YfU1tIU2oZOlRCPJK+ty4POCZ5TcOvP81MelyTxBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670746; c=relaxed/simple;
	bh=rtY22MgptB+tLy3QVxclIgluL35Op8OhX0cRjsl/mJo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nsebE5bNlprbGyujfwAfB1KEe1SeloktoBIZGTNcrK/Or5ClQcyFXz1To2ZYTwsfbt6Mk30tEH3cI3s32WqG74EgqaDk4J0errAKAZpLvG6rGi1rxQqME2WLo+bD9IV+N88EUpkXTUA2f9yDgtIJ3LaWhzTnqiw3M+8FMuFvcDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o0NweKEI; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5ed1ac116e3so1183958a12.3
        for <linux-rtc@vger.kernel.org>; Thu, 03 Apr 2025 01:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670741; x=1744275541; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eMxQ7UQKMt0+Oaxy9pEE80XpNTXV7CL+WPCOZ4uzjjQ=;
        b=o0NweKEIpkWSH2jwsB74/XPrYsHAW13Na5HzWQ34OX2Ui5O/wl+6+9VOabs+k5g2Xd
         ORYcdHDJCXk3sGRL9TPgxSddIrQ1C/3yEq6pTHUtL0vAV1ruzHoSXV3zBGH/EoPgt967
         wZLqemNLOurWbEOyIO+rzfczLEcU+5aaN5+mZKRW3cefKIpR/VXSRSZhyf96++Vc838m
         VqYRzbh0Kr3rWaD/wuhr7z7KllYhGHR2s+NqY3ZSKdRduqvcLsdWtdZ7COsBWofND93A
         3VKEr4Ur/+97GJrZn38FtaHcig47HMMNgoxyfoJPFGEThbt7sPyYlM8+fp/pcwzMwfNP
         T/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670741; x=1744275541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eMxQ7UQKMt0+Oaxy9pEE80XpNTXV7CL+WPCOZ4uzjjQ=;
        b=WFmwTnWp/udx6ybdxju6rw57e0b6Sh5pRPxf45OhwJzXmdtcPwIuEHvgebK3xlhzdm
         8YqeTYpKHy3+f8n8iALH+ftxM/Z+0wJGVUqCwabu4wVx5txMqhdlhtlsP1GGmL6UnUF8
         rlQJk3anSGTRNpj5gf7ruP4c/YzS6KhtIZCfmYkVX6tMHw5/WVbM+ruB+hXHVrarDTD+
         jh87dTfCm/q+r5bih5HSK5vHwRIWaezEIm4niWTOFTjfz2TNVEh5R2Gw6/K3scRUYbfS
         9ZWJ1uSdgnhhm30tbH4urVIn/HicjLjDiue0FUNU53L2NUvlk2VqsA1VzjukJOd43X/K
         zKHw==
X-Forwarded-Encrypted: i=1; AJvYcCVllKyxnVZDm4IHNt/dPt3vD0YEO0YPmukF7meueURQOJdJsz8YrYH0veAZelvRoumbf8mpYql4Yug=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWkEHSdrfnuWPhGoCwUVYlDovAUWJnwjcatT3L90AKU0tDEOfm
	DC5ZrXJJtXe4I2Xi3i7armBY4Lvuw/0iLGJi1+T/aWq2NbQE5Ky/+bviInqYnFA=
X-Gm-Gg: ASbGncu48fqsEFUkYZystkyL7+Z0lXVf1125lRa/EKgeO8VGBsPOZBA6lLJXzwGx3Mo
	Q60Pxh7Qi/RzxOGGJD9LlcxPsPzJYILOa9iyoknHbxNH0H2DcmSj9Rexhh/GIWF7+yFjtEsm8B5
	c7HKGGJcjbTQbwH5v8nwIaUXGddDQnNdkJnH3Vg9BYcMYxIiOLmvBTM0znOMJvE2HMzNz4RDASi
	nDieQOnpMgy9PfWsBjJBWo6f3z8s2yWXqazxwJF4aFm0iyMIUbyIWjrxJ/wiOSsqbBp0m5iZJ7V
	GZ9fJ7nz/WSaPRFWtiQ3s8GltweVHsyqyvkibt1oPkFZykWqMYp5O3ifRR63V8bWgShx7u43PPe
	8c19UVw5bTh/89/KFgauLxZZoZcuS
X-Google-Smtp-Source: AGHT+IHQrHf12EJNK/p+81ZjxQhmjVXLedkpjwoD4qMiwxw3fr2xU8zdguaJrZmoo26ZrVzwsXGVGA==
X-Received: by 2002:a05:6402:2802:b0:5ec:cd7c:de55 with SMTP id 4fb4d7f45d1cf-5f08717ff38mr1640036a12.17.1743670741481;
        Thu, 03 Apr 2025 01:59:01 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:00 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:58:56 +0100
Subject: [PATCH v3 04/32] mfd: sec: drop non-existing forward declarations
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-4-b542b3505e68@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

sec_irq_resume() was removed in commit 6445b84abf91 ("mfd: Add s2mps11
irq driver") and sec_irq_exit() in commit 3dc6f4aaafbe ("mfd: sec: Use
devm_mfd_add_devices and devm_regmap_add_irq_chip") while the
prototypes were left. They should be removed.

Do so.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 include/linux/mfd/samsung/core.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index f35314458fd22e43fa13034439406bea17a155c9..b7008b50392ab857751b89e0a05d2c27f6306906 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -72,8 +72,6 @@ struct sec_pmic_dev {
 };
 
 int sec_irq_init(struct sec_pmic_dev *sec_pmic);
-void sec_irq_exit(struct sec_pmic_dev *sec_pmic);
-int sec_irq_resume(struct sec_pmic_dev *sec_pmic);
 
 struct sec_platform_data {
 	struct sec_regulator_data	*regulators;

-- 
2.49.0.472.ge94155a9ec-goog


