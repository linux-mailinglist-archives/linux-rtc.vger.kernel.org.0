Return-Path: <linux-rtc+bounces-3889-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F00AA8328C
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 22:40:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 579C08A2796
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 20:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CD4821CFFF;
	Wed,  9 Apr 2025 20:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qWvQaglg"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D8D211278
	for <linux-rtc@vger.kernel.org>; Wed,  9 Apr 2025 20:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231078; cv=none; b=H7uaEA5hjh03idOGynqfG9HSl+QXTWniVm2BRNh7uDir7j72SfIRfviWMNUBKrIQMHzU8mLGRQyVpQADIpjmvosPIwD0xLHOWt0XlN4hUkJw6DqD7RjkKKfLaggzuldz0lP+XpCT4oxWrJYZIdk6sYHxst/gXchhmJXfnrp9UhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231078; c=relaxed/simple;
	bh=AQOh1SAmTjWO6vzJ8CZkmZ+2uws48CsZYe/GOw/fK5s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i9R26e2uielB0YyLDUOE2KRE3Fg8fHPIHWlE5aO2TvR0oJ2VRpfRYS0waaShaara2pIbTEOWHKVjkKZblzcUrNEDvfih9TztYQIddyWEEt8fJxjg2gpPWcF24OQBepKfF/wH8vYkIgl9nFKUIQJgpqIF/08yQHvpjB5xLzc9s84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qWvQaglg; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e8be1bdb7bso198688a12.0
        for <linux-rtc@vger.kernel.org>; Wed, 09 Apr 2025 13:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231064; x=1744835864; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+zcRydoPq0e3uOYwLlj7ABnDIgPKatAxdb7+TG8s1Ss=;
        b=qWvQaglgLv2lTaKwxS+lfEzU8PLEEPSwpZhB8yOV5+a4qJvgRYG4O37f5tzZWZPqla
         OLTr20EO3qW96L7iGj2qKI9Z9Q5MmG15dYUtsP5VwoWnpbv2X5ruOon3QunQk7ETp/OA
         F1ZmsA7OcDzf89HOaPwm5sTZqgClRg/869lniWKsBIRbOtHwpxCoYq2IcvUZTYHZfg4Z
         Tq+4WppFDucsk2p9QNhttj8dx1ft47D7ul0UJYq6yRtWis3rI8DGw7QcTrm3wZkAm3yr
         Sd/jKbmTmBUHGH0ui3/QIMCs1chenKUEb/PUVwr2lQwLlVCMW+cY7U31W2TlImumNmGm
         v5HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231064; x=1744835864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+zcRydoPq0e3uOYwLlj7ABnDIgPKatAxdb7+TG8s1Ss=;
        b=PaT4CA21F3+gU0l2iyf7fikjiFIcxoJCafmBjeKrPgz05UQyAGN7pQEcg+oCRP+tLv
         nimEcqXYpLVa8n4jtAW5q3UDSQ29P+lwFkOCSCi8LTYQQujKELGRAMbNN/nJqD6aqeJM
         au4s2l/z3V5peHlPRXyOO+/fEOrGCkXRXn3xLzjtnkrmKPxZ1b4VD3QQUPAz2T6ycGOu
         Gy1ECaaJQgif3Bgf6AgurmuFDEkUckxkFVAZYbZ05WH4PUEM9GuLZNqh8vLd4qPwNgvK
         bOxwZMGTWWbf6x0b8pz4BG7glO0ER8or1Vxt7POfS2POAtniYeqmA4O8HH+VujhoBzt3
         0ySA==
X-Forwarded-Encrypted: i=1; AJvYcCVlin7gJD0ZZWkCok2cyMJ16nRhMKaWKbqZL1ZzXVqwt3BjqevqWAuyM75s3CVXXHW+qbvaIZcAmXc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5dLV02SD5kbubpOb1OHyCtECDqYowoUt7S4q7XYG9kWNIK+bJ
	5uclohNnH11zHRI2ZiVG/F4H0WKpm9FwLrWhSsObuksF4ipGwjFRwf22+6ej6zU=
X-Gm-Gg: ASbGncsL78sisWqavOG/7faLhD7Rug7WBmAnm5G/KIc6gdNwtDMn4P1xKdElTHdpybI
	nS2K8Glt5NWilWSTdz8Tmztk50m28mP+kalRmMmTREdluJktPKhszQd+WTb0/HyxjQbyiQ5n3sD
	7l5x3cNDOuSw/K0Dj051SafDCB8Hdml7BQZygwZ4bfNdnYwsoY7tOsMXOUVmsVn1+M6iLMdZ3i9
	pVT4Ju6uX96Ln38WfpFpcCZ/toBvNlf2IwVI29A28XAcDGR7Aeg0ASVDY0OYLcAENGNiqftMvAr
	tUOpBqYxKpAeoV5ScLPBeajNkcAlYUQRm0FRXfD5I/t88O2fjSVymNQiIEpfegG8XpmE6waW3hL
	aCT0mBcIbDL9z/gS7vuxNlqoBdCM=
X-Google-Smtp-Source: AGHT+IGvuuLoVK2j6sMyyQsZa8p1VCqZY8y0EZ8duJvRWZG85z91U/cgYPqYUZihq20x9iTbe4XZTg==
X-Received: by 2002:a17:907:7203:b0:ac7:19f0:aa5a with SMTP id a640c23a62f3a-acabd2517dcmr7867666b.27.1744231064521;
        Wed, 09 Apr 2025 13:37:44 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:44 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:50 +0100
Subject: [PATCH v4 29/32] rtc: s5m: switch to devm_device_init_wakeup
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-29-d66d5f39b6bf@linaro.org>
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

To release memory allocated by device_init_wakeup(true), drivers have
to call device_init_wakeup(false) in error paths and unbind.

Switch to the new devres managed version devm_device_init_wakeup() to
plug this memleak.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index 095b090ec3949e0e8074cc344105daa00b795245..f4caed953efdd23fd0132d74d5199dec9cdfd294 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -779,7 +779,11 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 			return dev_err_probe(&pdev->dev, ret,
 					     "Failed to request alarm IRQ %d\n",
 					     info->irq);
-		device_init_wakeup(&pdev->dev, true);
+
+		ret = devm_device_init_wakeup(&pdev->dev);
+		if (ret < 0)
+			return dev_err_probe(&pdev->dev, ret,
+					     "Failed to init wakeup\n");
 	}
 
 	if (of_device_is_system_power_controller(pdev->dev.parent->of_node) &&

-- 
2.49.0.604.gff1f9ca942-goog


