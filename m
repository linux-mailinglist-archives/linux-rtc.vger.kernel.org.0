Return-Path: <linux-rtc+bounces-3327-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2129BA49B54
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Feb 2025 15:07:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20A5617496C
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Feb 2025 14:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7303626FD9B;
	Fri, 28 Feb 2025 14:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="duu4VZEP"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36F026E17D
	for <linux-rtc@vger.kernel.org>; Fri, 28 Feb 2025 14:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740751649; cv=none; b=TXutZyjsnA1Ey7bRQ0ppZX4NIby/2iIiX0ZS2hI23h5Xldh0kstF9YmUQTj93eapLa2ZdlBbZE/0JMz1nfXOm6yLeBGKRlEcLsVd5anjqGOBaElrDOU6aV6Fz2sYm+nepXp1FoiNVAcSUQI4lIOe2f06lQK46ZCL2P9my7drg2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740751649; c=relaxed/simple;
	bh=ako7uKkoy0pcKOqw3JaomEgmXiZMMPwkguXI68dLj6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TZ1/MCH4l60e/IZKFfT7i0rZupHg6D4zUmN6XiKc9TT1WJ+qIuuiQ+FO7+Eb5TXkz4/USRfYVNUOG+JFCw7xU4ajkZlAOxWXq1SfHadRT4rEIWqilHy07uQC4a+xtlo1EE1APeIiNw9ckslnSKEqYqkMfWFeWOVJxzszHbnWc80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=duu4VZEP; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-abb90f68f8cso416850166b.3
        for <linux-rtc@vger.kernel.org>; Fri, 28 Feb 2025 06:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751645; x=1741356445; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PnUvUu9cMY/Mxw4Q1sllPthcln3NtgGY7cjKJANyPvk=;
        b=duu4VZEPZ8sGv25ffQJ+1bdz7r6wTagwsUflJFWNZhlu4PyYNBlvdwtqL85JQZ/66C
         pnbLUZCNHKvbwF4bHYLVonu4tX5SPwbXrV3IIKNh+gQOpW+EnMFnxjekQtQY0ww9WTJp
         C6tIMdiC7L9O4aTkd5mgj5wQlb+dVsbMdhS5fYVFma2u7QYSM1+0Kn3DNjRHBA8lA05w
         JH3gd5VC3kH3Vy8wRRS2CXNIPeqL9yBhk7EtAFoxQO/I+uYTKe3wXMsfEyIpCEQpXeEn
         Mqf+frzpnRT3kQBZ5+LEdVv+MeqIquLzOd4fT5q6LHiZKaReub3O2fC7RrV8a4M8Z+D3
         P/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751645; x=1741356445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PnUvUu9cMY/Mxw4Q1sllPthcln3NtgGY7cjKJANyPvk=;
        b=t7PR3svux/n+r/AXDzVrusn5dxSmZK6r6TgWq/AQVShubhV+MKs6L3WGhd5/Fi4oml
         bLpygdZkHaONI1eP3oUNQqrcaEMug0h41gI/mE255BNHO8khRg/9QbXzVTfdbF7+4aTz
         4G5Aom9VTk7dtqon5wDsC/bEo0kkFIgg99JLCezuPn9gn6+jRToYhRtc9TJJrTnWF+oE
         sBWGE+ioacSxQUYtyY18/nezrokUdAHBRCf8vc4UpXMstCAPwDTNf0pF/cd+EVvPwOBt
         SrKKd07syQgWVkUPdqecvjLQyhvt9AEaZTaBuDkK04jHjwIBlqRHurluTDp3wWk32MDz
         +PqA==
X-Forwarded-Encrypted: i=1; AJvYcCV+3HwE2O0rxdVWrutJbzGhuq8wfUjiNDMF/DmJY/4GIyj99KmLefG7EUgrv+LkHhiT5bakO1doKsU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGnrajkxdQgTad8GUM0wyAIwAv0PVfbrOGCdslVW9kts/taT9/
	eK47TT9p8gQRzDNbtkT1hGxr/GqZbLFw2PDZC8DtlYOW+YvH6waIa2iGU44Ztt4=
X-Gm-Gg: ASbGncvvYeCrr5nE3ImoE2GqAl7xi4UK8Rf+NX1eY0r1isDFcg9KY39a50GuOaYDe8q
	GwmityQPSmGhNUjvl/Z/cmniPMndbwTcvEQo72QltG71bJO98VFUS/xG67MFtLOdn6x+1Ak1t31
	DNJGigi9sKwWjSs1EsNghYOyN0+8VMIibjQQnGHu0bb0uOoKcvuoMCh7r6WODgZqtV/Ti8LJbiA
	ZB60BhFGLcc7SZXItJ4ioMu4SlQwGhc282mv6rIp2KTw/ooZyOMwbxoxubTrKiF9sv5OkoysglM
	a4MHJIC9uiFxHtZpp6hQIstyLSpUXh0TW2DT8nQKxqgmpiAvOAjIecrh0hoq9ZlPNQZe2cVXUeB
	+h2fEynZhmw==
X-Google-Smtp-Source: AGHT+IFpdib5eLXvAKlYp3fUyW87rQ1IfZ8GEMoJsXuLGkDw56XS2aTZMwaUmenZ5apuVJAYF/Nggw==
X-Received: by 2002:a17:907:c018:b0:ab7:fc9a:28e2 with SMTP id a640c23a62f3a-abf2681f8f2mr377695266b.47.1740751644708;
        Fri, 28 Feb 2025 06:07:24 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:24 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:17 +0000
Subject: [PATCH 04/18] rtc: ds2404: drop needless struct ds2404::rtc member
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250228-rtc-cleanups-v1-4-b44cec078481@linaro.org>
References: <20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org>
In-Reply-To: <20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org>
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
 Dianlong Li <long17.cool@163.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-amlogic@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The memory pointed to by the ::rtc member is managed via devres, and
no code in this driver uses it past _probe().

We can drop it from the structure and just use a local temporary
variable, reducing runtime memory consumption by a few bytes.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-ds2404.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-ds2404.c b/drivers/rtc/rtc-ds2404.c
index 3231fd9f61da49bdaf00e46486fc34836094ee78..217694eca36c3432a8db3b874374e347eeb802d9 100644
--- a/drivers/rtc/rtc-ds2404.c
+++ b/drivers/rtc/rtc-ds2404.c
@@ -31,7 +31,6 @@ struct ds2404 {
 	struct gpio_desc *rst_gpiod;
 	struct gpio_desc *clk_gpiod;
 	struct gpio_desc *dq_gpiod;
-	struct rtc_device *rtc;
 };
 
 static int ds2404_gpio_map(struct ds2404 *chip, struct platform_device *pdev)
@@ -182,6 +181,7 @@ static const struct rtc_class_ops ds2404_rtc_ops = {
 static int rtc_probe(struct platform_device *pdev)
 {
 	struct ds2404 *chip;
+	struct rtc_device *rtc;
 	int retval = -EBUSY;
 
 	chip = devm_kzalloc(&pdev->dev, sizeof(struct ds2404), GFP_KERNEL);
@@ -190,9 +190,9 @@ static int rtc_probe(struct platform_device *pdev)
 
 	chip->dev = &pdev->dev;
 
-	chip->rtc = devm_rtc_allocate_device(&pdev->dev);
-	if (IS_ERR(chip->rtc))
-		return PTR_ERR(chip->rtc);
+	rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(rtc))
+		return PTR_ERR(rtc);
 
 	retval = ds2404_gpio_map(chip, pdev);
 	if (retval)
@@ -200,10 +200,10 @@ static int rtc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, chip);
 
-	chip->rtc->ops = &ds2404_rtc_ops;
-	chip->rtc->range_max = U32_MAX;
+	rtc->ops = &ds2404_rtc_ops;
+	rtc->range_max = U32_MAX;
 
-	retval = devm_rtc_register_device(chip->rtc);
+	retval = devm_rtc_register_device(rtc);
 	if (retval)
 		return retval;
 

-- 
2.48.1.711.g2feabab25a-goog


