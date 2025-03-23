Return-Path: <linux-rtc+bounces-3570-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67641A6D188
	for <lists+linux-rtc@lfdr.de>; Sun, 23 Mar 2025 23:39:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A8297A6070
	for <lists+linux-rtc@lfdr.de>; Sun, 23 Mar 2025 22:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6B561D7E31;
	Sun, 23 Mar 2025 22:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CYMGyJ2q"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689E31C5F27
	for <linux-rtc@vger.kernel.org>; Sun, 23 Mar 2025 22:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769569; cv=none; b=X3xgq6pn0eqBiJKPAOlyakRVsVY80IfQKRthcsEZgW68cG7qwFWlc72Ciyc6jjD3fWYpJIc2t+GxxBT7m66Bg9LhlZgTgYwcIzyfqWbdAxdu/ghdEgdxIZROSFYexw5YYTYXkDj39WMCNIPBg5ENdS5/1307M3I58hFLrq7qaIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769569; c=relaxed/simple;
	bh=yWyEsUV61SIUGSRUBs0R2s8QMDXNnM8dfUs8hI7iDhI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WFb1EuRCD7V/NsLKwKkdQ1Lt6h4PPDmBs+oXCZ5kQN/anm2oRZop1OFN21/aa4KZ6Idxs8ZolHqWOAvq8TPLt183n2elVWKJKt3ekTVHJNoH6UJOdz5owzmHXL7ANsFGh3frYUTQS6T4PUL1fkHahonl8wXEw4MJ+/3MpC590Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CYMGyJ2q; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac2dfdf3c38so490782366b.3
        for <linux-rtc@vger.kernel.org>; Sun, 23 Mar 2025 15:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769565; x=1743374365; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9y2iwGfLCsw/LkK7ASOWMxlU+K/ybzYKfyvSxQC13dg=;
        b=CYMGyJ2qx/SSOxrxrYL05VEaM9hVN5UqiThK8rKWJri6u4f4SD6LRLAdiOFpf+c6Kw
         uYrw8msKNc6pSP0ZygXin8UgmGTqB0i+zAi7hsixnyQF4XpgDtxPngX1gyUCEs9uz1Xb
         B8YL/RT8A2KGqoU/a/9BBhvu/+1oR59eR8+iYzPPlCI+Ku5cLxCmP9qk8ItlVSf94Hk1
         164BzjnVaBuV0X9BwoDg+N/HUrmQWvuP4GtTnl6DbyXEk0OoqcWJO9cYJcjVS+LHL1Gx
         BlXxVIjNMeF0hTMd6Uxk997Ahc2z1kmk6+F663qfSoCkgG0wY5GEQjOr4m7stKAWpSfr
         yoDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769565; x=1743374365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9y2iwGfLCsw/LkK7ASOWMxlU+K/ybzYKfyvSxQC13dg=;
        b=feOqF68EgBnSpIoSd7G388fPRjFgEp+nd7/1BlbsFWKTkuno0VaWo8cBrhl8SZ2Ijr
         wkdFcdR5YYiHO0Lj5b9An+O0p7nN979JOPQO7kvitU1Mcj5bW2T5dxmDPwO+SfDLPkZm
         DftUGzMfrvumyhx2dFH7x/NvljKhwEPhgwx1oMyAcSK8BNX0F8dgMxxH6muSYMUJG6m3
         F1QcU9mewNWq9VW2dT4I7J8nFbTUF15vumKXZO1Sr6byXtSBlHFAlEiEvXZTMxAnYMYo
         CqanoDw/p2t7RrvVNU8iQFs96BYzpuPLZE/iiZbNyKqLPKVua86G5dGmoEUL9eUbf9J8
         eTBg==
X-Forwarded-Encrypted: i=1; AJvYcCUwkDYTndNfwDqbat6aCTksXB2twBEK3e+OnnUkxthU1lFG5cL7EkHExb+t2eS+9d0VycZHl7HlPfE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrimRuYSZI4a9F/ORw1RmML2MDI6VUNVrvL2W0fgQSi384exES
	5gSYBxYWB9/l4IVI/EVMSgdlgIEcXNGUb0bxDg6p5kejzDugWqhfY45fFGxTXWE=
X-Gm-Gg: ASbGncswC4Qv/4nIQJVfkG8xFuHXGo7cHb0EZy6ZJaDFMRGIg9QKdPi/9rriyyE7Pmz
	dCMfsRsvEp/TIqJlAb3lTzijkxmIprofFMIyiG/kJTlUrcU0ZHP+Yq46KkFmvrDmLHxh+6YAQIr
	RZ6KFvvyYKvpjWXRLZSWE22FhW4SqK5vk2dJQMOw/JwPBH9ajB5QSUzTpnkSUVOYfAyPgAG2xny
	6cZ9S4ITfZwV17HEgD76XO71erSJoPl7qxYRGI5FN2yKt7H2fnb3fY9CJsAp0v1RH9raqmSct75
	42WZih7p7+Q9ogSUbfr9nqWtD/xPuqXcyxjv1orTYY886EHbalDH5Q8U+Pp9PWRZ+HryOkGS1K7
	W4S+Wp+wugKD6F6bNthAvlVfsHZ6f
X-Google-Smtp-Source: AGHT+IGsAC+lKGhqNteT46jfSAPWq5SZvMmaurRX3KpVQHgnAMqrYltc7UBx62PPecd7JPcN0qJQgA==
X-Received: by 2002:a17:907:9805:b0:abf:4c82:22b1 with SMTP id a640c23a62f3a-ac3f2297ac8mr1130529166b.32.1742769565476;
        Sun, 23 Mar 2025 15:39:25 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:25 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:19 +0000
Subject: [PATCH 03/34] firmware: exynos-acpm: export
 devm_acpm_get_by_phandle()
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-3-d08943702707@linaro.org>
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

The upcoming Samsung S2MPG10 PMIC driver will need this symbol to
communicate with the IC.

Export it.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index a85b2dbdd9f0d7b1f327f54a0a283e4f32587a98..7525bee4c6715edb964fc770ac9d8b3dd2be2172 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -741,6 +741,7 @@ const struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev,
 
 	return handle;
 }
+EXPORT_SYMBOL_GPL(devm_acpm_get_by_phandle);
 
 static const struct acpm_match_data acpm_gs101 = {
 	.initdata_base = ACPM_GS101_INITDATA_BASE,

-- 
2.49.0.395.g12beb8f557-goog


