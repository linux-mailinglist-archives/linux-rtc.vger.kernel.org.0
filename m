Return-Path: <linux-rtc+bounces-3392-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 150C0A4E9FC
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Mar 2025 18:53:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72F0A8827EF
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Mar 2025 17:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D7E28FFD4;
	Tue,  4 Mar 2025 17:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xQzxr+/i"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8922028F929
	for <linux-rtc@vger.kernel.org>; Tue,  4 Mar 2025 17:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107940; cv=none; b=rHz+lF5QN9zYsEw6hMLasip36j0QNGaopnwOQr3pbKECZINAnay8DuCTWJzuqq5CXVVpWI8/3o1/lt3A+eWXnulnOcgS3YYn7bNwb68Lx/ik/ZqwKSuRxLns/7FBTER6FQekMvY+iZlGFPgNNoTADaeJEFsCuqgBqH1AAfskcV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107940; c=relaxed/simple;
	bh=5X/V6j0KylZQYS62rYIRbOgl5vZsHZpGMMFoDJktKBs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=poz1XasPofnoS1RcAw2J0YtiYefwb2iDkLmeVIib3WxOCPiqfz4Ee4fv06D2KjBBbjcU3G9J4n9GdkJETlIfSfUA9yuozi/WwcCe1w5zj/zRflhuiKDGlyviXRfmrtCmsuvWRRvW0az99fo21/XgljUkssXQPqOMUE+xxQ4yXaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xQzxr+/i; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-abf4cebb04dso643807666b.0
        for <linux-rtc@vger.kernel.org>; Tue, 04 Mar 2025 09:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107935; x=1741712735; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LQ1rnmYNsg12IhA38qEJtyyMHRjZg5dsRkHMsIbiHfY=;
        b=xQzxr+/itgIRLv26IdzqbvN2KzIxpaBes8rvZIGhFUVBPxXQOcBugDgufa9uDOvCgg
         lWAHsyvVwG3IlvCkPdq2k99TqYN8FPvGtHm9y0MUKc1aLAeWgGk4PbLy4LkTg/I7y3rH
         1rkqFG6o+N+XTH1VEL2OSrgeK+hNYLH+yripsc+i49MEYZT91UXSbQD22qfp8uxJwbTX
         372emBqGRsl9yNXwyjzq2LBDYXqcT0ee+o4o3GskDqJaprn13m0JVldN7vrTEZz7f17L
         WaeMVWkaYIbanusqA0l1LddOTAYZ+WAGRQFfouLLVzwrmNcl/hg4ZRc+3dufDhPfhAfh
         BV0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107935; x=1741712735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LQ1rnmYNsg12IhA38qEJtyyMHRjZg5dsRkHMsIbiHfY=;
        b=O19SVBtWBt85hWvi77KjeJ8EgDHfyYJNKDBMAmaiEm6nHmLJd4xSIftX/cLyGG8+ZQ
         jXTyjMbMid365vsE3NI+nrkeqEidBFaNdQN2VzWyo7J/rD7qgsWF/SQbm1hm50FyD2HM
         DrNu3j2XMgn4s009n63qHwq9AVsC4c7gIDjbLt20H9XC+s30Lk5S8eEVY9jmWrcbh+li
         tRlFNikdFv7ei6KQ3J/zbHGT6k7DzoXHqQ4fznwI6v0oLVFFLzZWEq/cpTKN0oCbpXDE
         6Oc06lVLFOm6O6464D/N5BM6M8MgtO+2vBaHIbcqRX8vbRMAX56qN/vocqS5Rcl0S13U
         1Ugw==
X-Forwarded-Encrypted: i=1; AJvYcCU4bmOVz3QVsXgCJ67hF7Pa7i+qVie7LSHES7GH6pFKmgANuwWVmqahBTkPCvq8T7NSQYpdZ+5rLDc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo+7yvbeJafeooY4rJ5h6L740IgbwefM6ein5Eo6oO79J1GOUh
	MANar3qdG6+3nkbTQNeGijdajrUVQ+4IwyH4/qFuTvr54GLwbNSOKPVgESuLYJ0=
X-Gm-Gg: ASbGnctoUWuudgPJFcJrKGF4EDgjOWIBa2JkUqXtFqsJgSK2FkvpYYqGYLOazQfaVNt
	Ja2veFZBZVTceLMps80ag5IQV3E0SRGb48uaWcExl9JMukn7g3ZPIj4xFJ/ptGDWpsUTaIWDLRX
	IV9vv4waVFqfC112fwi6vuDie1mBUebefqt1sWdsBEzGA0bBWx6ASxGh4q+p0EocnhM6X48cqUg
	xuyzZXYak12N9wMUjBVReFB762L1wxB0ERSNELrjTg/Ogm4yILmG/qpIuuiZeZCrTUO4Iuf8/eR
	ZndUG2CRd+FrN5HgvvuQNYZ7g46LKMcqXDUC98e/80DSDejvnV761fTWpBf0eCk/VBtCZmmRknM
	lgPfMd5XMkZHxzf09DXBDtn+/GBBL
X-Google-Smtp-Source: AGHT+IEctYzZlVVwQPucj8CUHKEVuZPV8n583Yq6QohmEvkW8JU3S9SRTA4/uuDakASHnMKJ8bAleA==
X-Received: by 2002:a17:906:3814:b0:ac1:17fe:c74f with SMTP id a640c23a62f3a-ac1f11e6c1dmr291303166b.21.1741107935167;
        Tue, 04 Mar 2025 09:05:35 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:34 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:34 +0000
Subject: [PATCH v2 06/16] rtc: ftrtc010: drop needless struct
 ftrtc010_rtc::rtc_dev member
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-rtc-cleanups-v2-6-d4689a71668c@linaro.org>
References: <20250304-rtc-cleanups-v2-0-d4689a71668c@linaro.org>
In-Reply-To: <20250304-rtc-cleanups-v2-0-d4689a71668c@linaro.org>
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>, 
 Dianlong Li <long17.cool@163.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-amlogic@lists.infradead.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The memory pointed to by the ::rtc_dev member is managed via devres,
and no code in this driver uses it past _probe().

We can drop it from the structure and just use a local temporary
variable, reducing runtime memory consumption by a few bytes.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-ftrtc010.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/rtc/rtc-ftrtc010.c b/drivers/rtc/rtc-ftrtc010.c
index cb4a5d101f537e20a685bb022e6f6516b0df8271..02608d3784958e69ec0ecbdb9fcc8b333b19e7cc 100644
--- a/drivers/rtc/rtc-ftrtc010.c
+++ b/drivers/rtc/rtc-ftrtc010.c
@@ -28,7 +28,6 @@ MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:" DRV_NAME);
 
 struct ftrtc010_rtc {
-	struct rtc_device	*rtc_dev;
 	void __iomem		*rtc_base;
 	int			rtc_irq;
 	struct clk		*pclk;
@@ -113,6 +112,7 @@ static int ftrtc010_rtc_probe(struct platform_device *pdev)
 	struct ftrtc010_rtc *rtc;
 	struct device *dev = &pdev->dev;
 	struct resource *res;
+	struct rtc_device *rtc_dev;
 	int ret;
 
 	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
@@ -160,29 +160,28 @@ static int ftrtc010_rtc_probe(struct platform_device *pdev)
 		goto err_disable_extclk;
 	}
 
-	rtc->rtc_dev = devm_rtc_allocate_device(dev);
-	if (IS_ERR(rtc->rtc_dev)) {
-		ret = PTR_ERR(rtc->rtc_dev);
+	rtc_dev = devm_rtc_allocate_device(dev);
+	if (IS_ERR(rtc_dev)) {
+		ret = PTR_ERR(rtc_dev);
 		goto err_disable_extclk;
 	}
 
-	rtc->rtc_dev->ops = &ftrtc010_rtc_ops;
+	rtc_dev->ops = &ftrtc010_rtc_ops;
 
 	sec  = readl(rtc->rtc_base + FTRTC010_RTC_SECOND);
 	min  = readl(rtc->rtc_base + FTRTC010_RTC_MINUTE);
 	hour = readl(rtc->rtc_base + FTRTC010_RTC_HOUR);
 	days = readl(rtc->rtc_base + FTRTC010_RTC_DAYS);
 
-	rtc->rtc_dev->range_min = (u64)days * 86400 + hour * 3600 +
-				  min * 60 + sec;
-	rtc->rtc_dev->range_max = U32_MAX + rtc->rtc_dev->range_min;
+	rtc_dev->range_min = (u64)days * 86400 + hour * 3600 + min * 60 + sec;
+	rtc_dev->range_max = U32_MAX + rtc_dev->range_min;
 
 	ret = devm_request_irq(dev, rtc->rtc_irq, ftrtc010_rtc_interrupt,
 			       IRQF_SHARED, pdev->name, dev);
 	if (unlikely(ret))
 		goto err_disable_extclk;
 
-	return devm_rtc_register_device(rtc->rtc_dev);
+	return devm_rtc_register_device(rtc_dev);
 
 err_disable_extclk:
 	clk_disable_unprepare(rtc->extclk);

-- 
2.48.1.711.g2feabab25a-goog


