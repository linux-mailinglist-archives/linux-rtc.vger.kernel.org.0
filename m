Return-Path: <linux-rtc+bounces-3752-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A73A5A79F6B
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 11:03:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EE691756CC
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 09:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 751BD245006;
	Thu,  3 Apr 2025 08:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hhk8vDhb"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AEB24C66F
	for <linux-rtc@vger.kernel.org>; Thu,  3 Apr 2025 08:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670770; cv=none; b=eHep3jEtEYlhZNbLw5jUbaXT7Box/y0gjPZ5ei9lVZ5/pvli1OcBikIRdMR4iGEuhG2PjuOZYzF67npESFgXP8sxyq6BoQ+IBReI7c1JpktWyGsFEJfN+QkY9YCLA7NXDd2cgJWXcz9kqPBX6KuUDZyHLOrKw9Jo4JoffWSL9o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670770; c=relaxed/simple;
	bh=X823p7d8VeG19dJIhYLsSWA3HtswWk7j0eIGd+yYPcU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P7ClEStqj3ZJRb3IT/doHXKrKTYKGItLX+WTd4+fCJ0E42adG8icpmvDJtiw6rfDFG27tWQ5ltSnrQD1Jo+lp0T4LVI1l/jZcKLU+3+vnPyoX8ZaoykF2F57pDVXhp/39ezy+VilcFCDSPrvo/gkReaW/q+uNjXmeoaRPPIrips=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hhk8vDhb; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac2bdea5a38so104119866b.0
        for <linux-rtc@vger.kernel.org>; Thu, 03 Apr 2025 01:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670758; x=1744275558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5TCn0wifCdb3UC3ucEx7Zkhg1UJ6ww+TPiSGCbm38yQ=;
        b=Hhk8vDhbqcYUwCwLviKA6jMQYEXZJsFvuMh8G+Xqvfdnf2TKNr0cc1BjulGiJ/rXlj
         GsFFn/4bG+va3UMLRfaFSkYMY3d84AKVFWFXQAU9SrSByg/0//BUbzK7J1OnXa7DGgKD
         4hd0Jqcx1KpjeojwJCkAZfVLUU6UP2HIvkscBwtJJKDkauUVoJe1htL7wKTKwxZyS3PG
         /lpiDyrO6MkTboVoXfTxqZTFbnc9mhizkOpLAhlVqVtASUfsPKc+1p4MiP6eCueamnsu
         o5MO68lllCRJZEx6/2sIhoyqxKOqq34CkWBzSf85cX9eoWOrN3MeXfd0Df+BDtCmIiY6
         6ygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670758; x=1744275558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5TCn0wifCdb3UC3ucEx7Zkhg1UJ6ww+TPiSGCbm38yQ=;
        b=hZ4VgCwdEk07hse66Wd2kKXhyrSAw6wQ9Eh7RvMaH+DmHwly5AXd0dZhu2WssrIsVC
         LaUxDAS8sOanv6FVrqtxfli6C/6hIBoln7t8KEK5C5LKeJfDGzENILVnevgy1Qvh0XYB
         mcqFYb5+Hz5JpEkDsxXlAvPlpzcrk2s+VpBfuf8ZNmwBBEH2nKbDKYB7vIbshfKgLMjk
         +RP7GCugzCJjw+cKhJYJbfnDkoY3Qpbal9/lnO8R6ohqni4M5Kcy23wprylIm3D6dR1B
         NLvc1EU/+OKS5GZ4dAVcVpLNHkpi9p9dD1qZaJZG9980sFIjBT+QZUvSzy1gyw2RSpuz
         XuFA==
X-Forwarded-Encrypted: i=1; AJvYcCW5NKblfok3Iq8TItxJV5viVNYCOAjWg6mSPGpk1zhRMaxglq/ikeAv5WkBtgTdBOpqK+98rNfwHOk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqDWJ2H0vNkpqQqQGWdz7sEH7WWJizPkZBfmHdPP79b2sFb2Vq
	xVpGoLZifw6eNZOehIUOwYXJ4Qjz9CfC2WFP7rbQin4tbGr3KowC8Zj6CGxlPmM=
X-Gm-Gg: ASbGncsX5zM8qL2XR30aB/coHUi3z8+LmZ2CvK/8EZwLvQnUWZqJ/Tqer9nH76ga2f9
	hPtksUz1JD9VT9dKL7muvY/dhPioIFBppSQTslOcShZQ9UZQVU3sAPEhSUct72ABxkhG/BNRU2P
	avDmk1hkVvFOD1dH1fJr+WeoSFa/9cjnVvryWJrpWsqrx6DmZG/38Fpo6Z510Clp1UlrNP8Fe2W
	eYgzw5BQE5/DWKbZ6vKAlewP5m0Xwcki060GtLzwk5ou3bqW+HvhHg9ZTSbb8aS2Oxw4BIiLlgk
	BD3VeqLj30BwQXdASwm/YZ5DSvjAsg45+TCx61E2JSB17qf8t1p0H81RDkdh9oqs74t1X9C2vLJ
	n1or2+Olm428o1EelmwRAraYSN93jCsWUrXbdicI=
X-Google-Smtp-Source: AGHT+IGkYnX6rQ6GWjWnABJsBjhI2LJzWv6z53In1ISOpBusxw5cuCX0wciz6W5/efFFB3SIsEOq4g==
X-Received: by 2002:a17:907:d25:b0:abf:4708:8644 with SMTP id a640c23a62f3a-ac738bbebedmr1751267266b.43.1743670757782;
        Thu, 03 Apr 2025 01:59:17 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:17 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:21 +0100
Subject: [PATCH v3 29/32] rtc: s5m: switch to devm_device_init_wakeup
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-29-b542b3505e68@linaro.org>
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

To release memory allocated by device_init_wakeup(true), drivers have
to call device_init_wakeup(false) in error paths and unbind.

Switch to the new devres managed version devm_device_init_wakeup() to
plug this memleak.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index 7b00e65bdd9c25b3426f92355f8ea36e66c3939f..e8e442c503064eb4e570af5bf7dcff6bfa7f4656 100644
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
2.49.0.472.ge94155a9ec-goog


