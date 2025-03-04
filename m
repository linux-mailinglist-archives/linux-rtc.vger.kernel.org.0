Return-Path: <linux-rtc+bounces-3396-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F346A4E937
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Mar 2025 18:36:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A7091897293
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Mar 2025 17:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A88A32BF123;
	Tue,  4 Mar 2025 17:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zx4BAc4r"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0444428F95B
	for <linux-rtc@vger.kernel.org>; Tue,  4 Mar 2025 17:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107943; cv=none; b=qneSAnCkOOYbSLOMpf6oLj6mGAS9jp57RHHxLH7cULhaHTiDObb0f5qYAY64eWD7Ebe9jzOvUbgKGbiPdlGeYTqHWIh32RiDJ70op+U5842VDSLL22Hj2ktMvFcFDqb2i86cDssuqJMntItAggUxpIQVHnq9101BQjvbZLYDHOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107943; c=relaxed/simple;
	bh=O7YHK/iXPLW7JvXPCw3QSGcpCg8mcQhvQ7AlODxEgPY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BnYpvGEiEy3sjxz/UDe2hySBlB59i+w210+1WL8dJR2cImQ4s4O82GsKyEOx0e2rf95xdP7VChiC44ZWBAyURQeoziSLaZqXWvXPaiPO8d9y2Z82ERRB7RsNJuKermYEkI7HT9cistMwW+t61gIooAm3wRp9cJJ/6Zy3tCrAJr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zx4BAc4r; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-abf57138cfaso615833166b.1
        for <linux-rtc@vger.kernel.org>; Tue, 04 Mar 2025 09:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107937; x=1741712737; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GfBBNFFxoATgsY5PG9x5TDiO1XW3it+ha4dH0f4d6kY=;
        b=Zx4BAc4rD08UzQOxlyt4V6dca3NMcXY+9B2U2agt8A0yB5Tk9EQZHVQXwJD8wPZOst
         0FWKB/cHLxMjrD1arJ+tY1YT2UsZpDYi99GzoBWiaxNGss8fFAyuU5K1lrz3tGGJ2Ulo
         KQy3WaNsfbEnOBtXwnkAcvj8tr3Hp6sYeUbFLqjGeNnAekFkma6/AxGm0t+prNeRT4RO
         Z/bcWJBKWlwPXCdTrp1jY92L8m9OIfow1PlpJjnQ1FoUMk6lHRnX3EvAFkox6ivocrwK
         kMaKVtYnDZf5s0q45ys7iseZlfAEyABzobEXqH0GUEw8cq3mUjUKwlJ30lSfU7ktOmdP
         Gl0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107937; x=1741712737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GfBBNFFxoATgsY5PG9x5TDiO1XW3it+ha4dH0f4d6kY=;
        b=cuEsRDA0fARoKXS0lJeLTcU8dzOnQ67x73VhY8VAHB6ykx00dh2r6StijxR9V9WGsA
         ZZipbSJKH8P3c9Q1JjRst0s2m8WJcKdGEqOqeqQGljKvjbkI2pEv/g4FaT8BNJLo13wA
         4yHnZR39aqI/tS8fBk4wfNJ9hvVwmWd8IuGy1RAO8jZPTOxi2dV5FK9JDOCHwCvLhoE7
         uNPYZ+IDnDO777v0KvLwLixpMw8zvmxq7nwfHcAV/UPkCK7Mzr8UdhsWfB4jKoHF3BMp
         JxL7D8BhWV4+S+PRbPFYqonKVOQrc3Y43n09EzGF1Oe9pz5TyZrQ74FSmG5fv973C0lI
         VL1A==
X-Forwarded-Encrypted: i=1; AJvYcCVWaT3/TfbfK5xx9TJ9G2I1WaWH7VSXEAxqzCBU+rJe/RoB+vDV/iq6N8j8KTlgWKVzilYYW+9/n3A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFvpti0Z5LDaiw+6MoOsHATokj0uQbq7pXpwR0ahdj8Nr44zVh
	pBfYCDsEMy41gNIf3QZJypyBK43ZBH6XW8d+2b5XKpk1NlDpmiz9FMohdHD0rQ0=
X-Gm-Gg: ASbGncsVIEpff7aUqQj3heTS+aMU081xiNXgksm989tnkKRSEsacY9GsL0qlxizPgb4
	dZWL2a6ICyrbCCPDo8Ggh5K3186L76ceHCdn1c9qTXqvCwNDkXyAD9IbRXE/rhQUhbY690Tm/Zz
	Am4/2oAeCqF9eMChgEbpfc1cryO9LGfLyOTcQf5YxcvQKw9zvo/8qTG21dG7LawbKBWCc3xiyxn
	40EmAcbvmIuImiroOa3baBZkrMvwmQSO34n2AEvHIb9aZIRwQQxPlMottVeCyE02YIgHOyfo2YD
	+q9txSSVXDeL9XmVtE5zGMXhTGtjGrY4kndmowvwy8VU+iAwBzzPK5x+ed952f5hOYpcnEB9CC8
	H+8JieFHBl4TZj7VjfBVm9fkvUm6O
X-Google-Smtp-Source: AGHT+IH4UfROsxQRuhFhpuKVUGIkJvl9GfdlUj4CrGm+kiSC0tb2f0MQezXBSz1TfcCGXXToQh+ymA==
X-Received: by 2002:a17:907:7210:b0:abf:778c:58c6 with SMTP id a640c23a62f3a-ac20dab329fmr1852966b.16.1741107936481;
        Tue, 04 Mar 2025 09:05:36 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:36 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:36 +0000
Subject: [PATCH v2 08/16] rtc: meson: drop needless struct meson_rtc::rtc
 member
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-rtc-cleanups-v2-8-d4689a71668c@linaro.org>
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

The memory pointed to by the ::rtc member is managed via devres, and
no code in this driver uses it past _probe().

We can drop it from the structure and just use a local temporary
variable, reducing runtime memory consumption by a few bytes.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-meson.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-meson.c b/drivers/rtc/rtc-meson.c
index db1d626edca5fbb590f26c1cdd0774d350244a99..47e9ebf58ffc2f2b6c65932f8ec3773a213a62ef 100644
--- a/drivers/rtc/rtc-meson.c
+++ b/drivers/rtc/rtc-meson.c
@@ -59,7 +59,6 @@
 #define MESON_STATIC_DEFAULT    (MESON_STATIC_BIAS_CUR | MESON_STATIC_VOLTAGE)
 
 struct meson_rtc {
-	struct rtc_device	*rtc;		/* rtc device we created */
 	struct device		*dev;		/* device we bound from */
 	struct reset_control	*reset;		/* reset source */
 	struct regulator	*vdd;		/* voltage input */
@@ -292,6 +291,7 @@ static int meson_rtc_probe(struct platform_device *pdev)
 	};
 	struct device *dev = &pdev->dev;
 	struct meson_rtc *rtc;
+	struct rtc_device *rtc_dev;
 	void __iomem *base;
 	int ret;
 	u32 tm;
@@ -300,16 +300,16 @@ static int meson_rtc_probe(struct platform_device *pdev)
 	if (!rtc)
 		return -ENOMEM;
 
-	rtc->rtc = devm_rtc_allocate_device(dev);
-	if (IS_ERR(rtc->rtc))
-		return PTR_ERR(rtc->rtc);
+	rtc_dev = devm_rtc_allocate_device(dev);
+	if (IS_ERR(rtc_dev))
+		return PTR_ERR(rtc_dev);
 
 	platform_set_drvdata(pdev, rtc);
 
 	rtc->dev = dev;
 
-	rtc->rtc->ops = &meson_rtc_ops;
-	rtc->rtc->range_max = U32_MAX;
+	rtc_dev->ops = &meson_rtc_ops;
+	rtc_dev->range_max = U32_MAX;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
@@ -365,11 +365,11 @@ static int meson_rtc_probe(struct platform_device *pdev)
 	}
 
 	meson_rtc_nvmem_config.priv = rtc;
-	ret = devm_rtc_nvmem_register(rtc->rtc, &meson_rtc_nvmem_config);
+	ret = devm_rtc_nvmem_register(rtc_dev, &meson_rtc_nvmem_config);
 	if (ret)
 		goto out_disable_vdd;
 
-	ret = devm_rtc_register_device(rtc->rtc);
+	ret = devm_rtc_register_device(rtc_dev);
 	if (ret)
 		goto out_disable_vdd;
 

-- 
2.48.1.711.g2feabab25a-goog


