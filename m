Return-Path: <linux-rtc+bounces-3861-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE31EA83221
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 22:38:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DB2D8A0154
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 20:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A097A2144A8;
	Wed,  9 Apr 2025 20:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Se5rR4KD"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C264211A05
	for <linux-rtc@vger.kernel.org>; Wed,  9 Apr 2025 20:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231056; cv=none; b=L3gagOIm4GOTVqr3+Tk5dO0wIO/+68gIXSsP9WkvzYSJi4f07wj+dNY0LYlGLjHB/p3mzb2uF4qmxqTFklku/iwVHw+Nq8dZKOLTHlm44HD69cXQoSiUWqQ4hPE9clkzkGQyB5A0+7nFgkWaQPPAhRZLzm2U9jIhoQRKk1XJzeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231056; c=relaxed/simple;
	bh=3e9/UfR1mJvZZf9g38Aa3kwt2igeAl1jk0oAMPkKz/Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hHJfRTMf6izXiDz82KPcYMUtqXbqU1UP+C0I3MZ/sW6tUf887S4UerGEiV2mydyzyDBr3HNdVeqHxY4Ic8a2Olflbph6r9yoHGP7gKNwntdZ1rr/fTaa3Lm8EhQDCOL3Ojm1ncGOWwMtrWv23K74+lbYPVrvJwjr/wlP435fqp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Se5rR4KD; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac34257295dso22926766b.2
        for <linux-rtc@vger.kernel.org>; Wed, 09 Apr 2025 13:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231051; x=1744835851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RLmgb19AbWrd/UJeKJUHWxq/eTD9hl5bKw4d7syAvGk=;
        b=Se5rR4KDuZ+RaRijeUzq96U19GGhw3U4QryetzbJxQrBmGlhP28oQgTEOkOkOGvt56
         7i9fvECyqyoDZ1DQDp7Dp6KWtky2tv7QruOhuzycCfvr2m5moBwu6KkB0ZC1oEixlitj
         AH8DZ5EOssP2uy9C2hD6hRibirf1RsB4D8LDyHE+W3bIk7wPyzTs/atdGwkmdwhdwC5N
         qKVgRLOjYJji8LuLu2jZkxBSf02/POEHeg43Hb19EmweSGKmLsS/2iMRwr6TJxkBneeR
         z19Z5dxHvcUvTJJIGE7X0p3o+V2aN5bBv85k5k9C+GJPLl5Td0FysZMbaI1pyCr+hpv5
         tpAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231051; x=1744835851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RLmgb19AbWrd/UJeKJUHWxq/eTD9hl5bKw4d7syAvGk=;
        b=wCX/Ze3MAR7Y/ep1wsTdxLC/CjUzSvaVX2ELglwA+JGv7DCTlm97KKsP+/ZoFDhHXN
         hOWUHHnQE5k1DgsrG1toCC7Vji23sOJ+JMEcYB6dciCsaWTsRxVCxCRCZVEWDGJLuEqO
         fwxEHJR1CQBJ9xmO8T7gpSQG3/MoyGITIBTzuT/8NjLAwIzbSC8eAl/zAzTWufQvR92y
         D9tKQN+RmheQ5cZkACO2FHtcinBQAsin/+cnetbWCe8By+cU/sKtkIKSyRwIvhhwCiuG
         W7OCsZu7Hk87cDLAuLoBuJF44q3vHnQeAQysurP4sHvKb0Zc0BHHHbxo/Gy2ahghS+0T
         a2Iw==
X-Forwarded-Encrypted: i=1; AJvYcCUsYFeIt4+WpAgVlNx3Jba9gK9Y3vXUoXNRMEcVnqL709mzhDd3LZQzIj2iu4yEvv/YZU9Vtbkfo2s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAkJRHHJf4dt8R8G9SCD28iXWR9+Zo+n0m0itFqXNu8+dSkaC5
	Kc+lxaFukTxv5Qe2Hwrqb+4JyGji+0xgDogp2WMu7gjmN3AN/vbmpqNNQXTSV2Q=
X-Gm-Gg: ASbGncu+4yYaKNX7xZvV65eKCzdHOtwDA8xdAkjN1kFpCqLxVbUVSWU60paoaErzBa8
	BQZLfMVpuAJdu9g4BwgWOwSzAyTHBsCkOQLClghj2MlW3+kyI6x2xx4Z2I2HNJZaKiHG5oU5PoA
	yQS+yVJUzry69Amk06SyrxvnBYvLdU/sRndafH7YuJ8+VYsNbf1B/VAEr6eiuGwyyqLa/MogKfR
	4vVn+JfcAgapki1aRrPwfzQkfceQfGAXWa4qWAHDwuPO0w4ZlkWPXML/9MuTJOWQF5XGEliBhKQ
	1pidEPFW8ewTkoM7UbJ+Ma73Pb9Fse93KkhTBkqptzrwXsxZL/JfZG2CsxtKHBmqpuaUXqVYh3R
	6DxDCHR1F/fhUg+/5JHKOA70vUiaI35QzvMpHkg==
X-Google-Smtp-Source: AGHT+IH0zvKNuRDAGqLs83RwWCcDR6aym1X5YrwLki7lH6aKqe66Jq6ZWK7rMjqREavabKtC1MlIlw==
X-Received: by 2002:a17:907:3d87:b0:ac3:c59a:413e with SMTP id a640c23a62f3a-acabd4dc96dmr8505266b.55.1744231051490;
        Wed, 09 Apr 2025 13:37:31 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:31 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:25 +0100
Subject: [PATCH v4 04/32] mfd: sec-core: Drop non-existing forward
 declarations
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-4-d66d5f39b6bf@linaro.org>
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
2.49.0.604.gff1f9ca942-goog


