Return-Path: <linux-rtc+bounces-3391-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 889EEA4E90D
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Mar 2025 18:35:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DD184215E4
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Mar 2025 17:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45DBD28FFE9;
	Tue,  4 Mar 2025 17:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jCztyC70"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EC428D06A
	for <linux-rtc@vger.kernel.org>; Tue,  4 Mar 2025 17:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107940; cv=none; b=kKUgUArKfyTRtligj3+xXY59s9BgpvdrIjsmX3xSBXPHZrrp1ANnLu6mugJvZd20owUV0T67W9/bU9wTuKjr8uO+UOuRWb7pAc1/FNc553102uz1WZmYEBstJD2cWeZWKdNHAx0S41t0iiAtnrbKLX7Huzsn+xjtokvZTpUjehM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107940; c=relaxed/simple;
	bh=ivQXoPCDvr4W65W9v8GXK5+RniJhnQQTUBGH5MrKnmo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qfBoTsghkkX/0oN4CWF5ZR3NmWWyCIoraKB3M6EoqlyE7vtRvL9vkIBC41CrO0nNthk1GQMMTjZ28jKc1HHjQftIxAT4mNNP3aqPX1Rh0wZsu8meDY2Ba0jwuzeTWn8VDPch1dZlW116vzB+dCAWRgg5/DdhdCcKEORZwCoOkzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jCztyC70; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aaec61d0f65so1198372266b.1
        for <linux-rtc@vger.kernel.org>; Tue, 04 Mar 2025 09:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107935; x=1741712735; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MzZ6ILzSkM4BJ8jDBuhIko6B+Jnu0p3f7pMZfR82Jo4=;
        b=jCztyC70CPhDV2/Nt1knWpEikWy5/LpEkyynF4etebkW8UcIoQLdwPw+PvjQhxfm1E
         a2KM10bMoMS6C4GpXRZq97z3TXUjgo6v+GIVYJ+7UwJgH9mgYZZvcMiwtoihJSaVjkpL
         sg+ZB+dFmJ4SVrsIVge22fvi7DbktqRJHHi8sG2JWat+y7hHSHXMj77rMsQxkjoWo9hw
         mXEZLxnrmntEVaGWMBCrX6Yc82MQ1v87m29Bpk4ylpK5p58Qjd6qKVUTWse1ulPiLECs
         s9S788utMoPGt3PB1l8JIHL+XdQ3OggzDO50J4aMrOyuWQM/7zURWWHOwR5PWTkSLdVq
         AYDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107935; x=1741712735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MzZ6ILzSkM4BJ8jDBuhIko6B+Jnu0p3f7pMZfR82Jo4=;
        b=HOqOLkJbKBcGTOw24s6fHR0rO3g8sWUyiusvnMkI8oDl4kviPa2qlQuIOvF2VP1Cf1
         m04+1vrbcMvU6J2bh0n4UhbPhVxhzQUwkbvcNT2Y2hzJ2v7I8rmRAWwDjS/OLQAnOAV6
         vLLYEAnt5CpNSjrn2Ss/NXfaeIOQWM1E3IPkLmZjVKAhP8lwhw5cSZS8PQU4emlvACdn
         hHRCE46cYU+fgRonGKeZ/Sa0u7bTylRD6rxMfcJM/mIM5qPw/LjMwgk0NqZxiZnZs3rS
         D5aJgf48ADV6vwVlH1crU0TrPPK2D8+1usWWUFcK6shwXEh2cKoGPfgZVvmV6eRoJaZt
         8Ggg==
X-Forwarded-Encrypted: i=1; AJvYcCX5VtDWj8qpCcoogFBAAPD6jfocxGGKjcF/mlXjqRGo/CZS/lFBO6oSZnsfWeTMkCAmobV6sEk+Pug=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfoT2+ucShs6qGCfrpZ+rjyJZHD3lp+Gy5KSaAW+r2tosON8+H
	dUkpUzM4wnTih9W3h0SEwAintsM6X/rHTCjOwnJBvbTRzgYQtpEIOpu81qWrTiM=
X-Gm-Gg: ASbGncsf7V0q2rRHfCaqhatidssVVLbih8UIU74kmIsciW2Ak8EcRiIDeEiV1MI55wI
	4830I7riLg6WM9KdpEZS3c5/mM50QE6ZrvjYirAiL4k1vn9vL8GW/1ytEOvT4ZE10Ww82BsR5BS
	1vwNdZninGHomHvN5+JTO5Xghq+FlJjChFRzi7yZESZcMGQ+eLBE15K5vcmWWlgdnRBiAA6sWfw
	BuNFcPKyJfyPXUDuEi0ThrlQ+u8Ezdnrcdu8AaES+8WuzZkUCT6fT9hkMR0cHIk2Esri+d2XXXL
	L1FOYKCXYVvLWxQMWvNe4nbDLZQFn4SC7t+Cte6zne+adLpvVl11Gfrt8C2okeg9IHNaxkWkomA
	p2fwPZ6T/eTOqGP+wGqu+EGJMhifN
X-Google-Smtp-Source: AGHT+IFwDsDh5i25qijWXwIP4x1jml1OHqbOIRoS6nzVQBGxqFZ6SJJ2B5idZS+kqD7e/PzkpEaGBA==
X-Received: by 2002:a17:907:9490:b0:ac1:cceb:d9b0 with SMTP id a640c23a62f3a-ac20d8bcf0bmr3896666b.16.1741107933256;
        Tue, 04 Mar 2025 09:05:33 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:32 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:31 +0000
Subject: [PATCH v2 03/16] rtc: aspeed: drop needless struct
 aspeed_rtc::rtc_dev member
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-rtc-cleanups-v2-3-d4689a71668c@linaro.org>
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

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-aspeed.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-aspeed.c b/drivers/rtc/rtc-aspeed.c
index 880b015eebaf796f68ed82c29998f345e1fd418b..0d0053b52f9b90a61725bf29435bfc8071977f9e 100644
--- a/drivers/rtc/rtc-aspeed.c
+++ b/drivers/rtc/rtc-aspeed.c
@@ -8,7 +8,6 @@
 #include <linux/io.h>
 
 struct aspeed_rtc {
-	struct rtc_device *rtc_dev;
 	void __iomem *base;
 };
 
@@ -85,6 +84,7 @@ static const struct rtc_class_ops aspeed_rtc_ops = {
 static int aspeed_rtc_probe(struct platform_device *pdev)
 {
 	struct aspeed_rtc *rtc;
+	struct rtc_device *rtc_dev;
 
 	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
 	if (!rtc)
@@ -94,17 +94,17 @@ static int aspeed_rtc_probe(struct platform_device *pdev)
 	if (IS_ERR(rtc->base))
 		return PTR_ERR(rtc->base);
 
-	rtc->rtc_dev = devm_rtc_allocate_device(&pdev->dev);
-	if (IS_ERR(rtc->rtc_dev))
-		return PTR_ERR(rtc->rtc_dev);
+	rtc_dev = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(rtc_dev))
+		return PTR_ERR(rtc_dev);
 
 	platform_set_drvdata(pdev, rtc);
 
-	rtc->rtc_dev->ops = &aspeed_rtc_ops;
-	rtc->rtc_dev->range_min = RTC_TIMESTAMP_BEGIN_1900;
-	rtc->rtc_dev->range_max = 38814989399LL; /* 3199-12-31 23:59:59 */
+	rtc_dev->ops = &aspeed_rtc_ops;
+	rtc_dev->range_min = RTC_TIMESTAMP_BEGIN_1900;
+	rtc_dev->range_max = 38814989399LL; /* 3199-12-31 23:59:59 */
 
-	return devm_rtc_register_device(rtc->rtc_dev);
+	return devm_rtc_register_device(rtc_dev);
 }
 
 static const struct of_device_id aspeed_rtc_match[] = {

-- 
2.48.1.711.g2feabab25a-goog


