Return-Path: <linux-rtc+bounces-3398-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 43349A4E8EE
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Mar 2025 18:32:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C57217A1B52
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Mar 2025 17:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C3A028FFC2;
	Tue,  4 Mar 2025 17:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qMj5jSd5"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9B0290BAD
	for <linux-rtc@vger.kernel.org>; Tue,  4 Mar 2025 17:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107945; cv=none; b=Lj9sWJJH8mSNPRrXKAzf6IQRXe8wMAaStBbSWhtCzE/ik8/SNI9sukLera4J2x/7rmIUNN16nTZb2MbycvIwgi0wBLUVzhPwnn+emyni0zqqaGVTgNexXEVfGLs+BKYd6FXer5mENO9h/3T6Ae/McXnU1OIUANl6z0fKzfzZrGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107945; c=relaxed/simple;
	bh=wcWeDWs75X61m+m4siXkgCaNrKLjTdrfe/93knsU6io=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O7dEPAJSjRB1SCO9TKBu4RI3T19eYSowp/xH+UDg1MJe94T/yiTHhz6N2KdCWNVTLGE8VDFfOywYgijXxzzrNqk8/90TbogbzD3b3QhTFZeUiMimlEc/5XL+JPxnLTLCtxv5v04xfujUp6wZ9wITjlAO7bozN3gfPhgP+qisuBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qMj5jSd5; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-abec8b750ebso1023447866b.0
        for <linux-rtc@vger.kernel.org>; Tue, 04 Mar 2025 09:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107939; x=1741712739; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ka86PnTxcRg56Z11OHXTxcAKX5oZrUWInphsB9KYtsw=;
        b=qMj5jSd5vyjtXimunQXFhiA4f7t6jK4K7e7WqiKUpeu5qXdOxYNMaKhmhZ8Xz+3YWl
         Qw7aPsb8vkp35rzAvE4L0a4zMCg16fn24ck8hJX8FT9BBhMBoic2FYVv+gcdMTLNScK7
         qVTIGwPMVOlBwE64r/NG5W+1nF1tPC/TnIWtu0b5ULy2LO7pB64htAs1v+KJlTVjRIzc
         9i/Ht897sOcHhPgFE/17PGSKXpIWj3IHzOyVhSMFe0VhsEI60Vc8lL6XLChkK4dqyidJ
         ryYxfx15svRW6/DFhMoB5AyKA51iY1zj51cfQDXDZk/Vje/ffjJa1bI/46KmgD0gjnEC
         tR6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107939; x=1741712739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ka86PnTxcRg56Z11OHXTxcAKX5oZrUWInphsB9KYtsw=;
        b=SKglP/i+tDlL3rDQhCji80L8F8qvri5H0WpuIynlotidDjDcMmPMpPydB54jc2PQy3
         f/1Mmm7tqmaCq0y62cmt8gNcxdndL3n2k37uJp23cSanTzuWETaRs7MgHNDzFRdlq9aO
         uJOb1NFJFuxbdKoqDBY11wVRYum5YFz8H4gzzIK8k/HyVVY4cGAkcECp8s3v+mHVdlhr
         U+N239Jwm9XaA4KL4eYIswurqlMWThQmNPgaoKs/Xnz2O6vOj2M2hDzsUQHn96V1zwcV
         v9PwHV8uOysqPK92gf25CZUxH3rDAebndLT43oBc8ImCe8rAII6FJlM+ojWrI+muLR5K
         mMxA==
X-Forwarded-Encrypted: i=1; AJvYcCVBVE5tFk22tiOTQCWftJZZS4hZIY3213yLkg+qTNs5GIFeCTiidMoqzmMjoSFgpOnvtA3Yh1FvqAU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHhLjCZbBsqUB4w6DBUK0bO7oXRMlz1z7Lvct/LFAtBmujkZ6T
	pEuxULnl/HyqfMVnhhp+kyijER4Gps//icsnZzrm2NA1LSmpbS4RCGySDA6VES0=
X-Gm-Gg: ASbGnctVoMyWOnP6SNyc48cP3V8wXXK8DPMIdn/XTEon95+DTKFFiHPwacqRAujXD4+
	MGDJeCXgl7s00g7qiyDst3z6bTQCOm4ukQPg9s1bpcnwS1kNheBB2lMIKZj1eFbklxG6tiP1APf
	nAKiH6rjrF1Ahq6wJeAmj/eV7cauxul3Yb/fW1+ZLKHo13Q7z8C81A4pRISeSmXsVpizOKMTY0b
	V1E89Gpv4tt5GaVC8vOaPeFjf1aaJhF4fxWNbdzCXjKTf3o3yojzVfoNvvYUSXH2g5sNFXmqNKp
	cLFcaql0L4+OJ8cVOhrFx7xxoKjupXfnlrN/Lanv0YPGpoNBTSf8Zm7761vgieR34eVpkMhX99g
	Drg2GMfXIoGVPl5WSa2DGuAiqsTND
X-Google-Smtp-Source: AGHT+IEZqUVJFopMcdCw0Fa6138jis8STGfKBc9DN3g8sZLmJaNDRTq42x6nu+WBoJl/BXVMQfaxGw==
X-Received: by 2002:a17:907:97d5:b0:aba:246b:3954 with SMTP id a640c23a62f3a-abf268263f9mr1810089466b.47.1741107939344;
        Tue, 04 Mar 2025 09:05:39 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:38 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:40 +0000
Subject: [PATCH v2 12/16] rtc: s35390a: drop needless struct s35390a::rtc
 member
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-rtc-cleanups-v2-12-d4689a71668c@linaro.org>
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
 drivers/rtc/rtc-s35390a.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/rtc/rtc-s35390a.c b/drivers/rtc/rtc-s35390a.c
index e3dc18882f41445c41fbea56edbd5c869514880c..3408d2ab274194e39cde38a83567d37bd53f6632 100644
--- a/drivers/rtc/rtc-s35390a.c
+++ b/drivers/rtc/rtc-s35390a.c
@@ -63,7 +63,6 @@ MODULE_DEVICE_TABLE(of, s35390a_of_match);
 
 struct s35390a {
 	struct i2c_client *client[8];
-	struct rtc_device *rtc;
 	int twentyfourhour;
 };
 
@@ -422,6 +421,7 @@ static int s35390a_probe(struct i2c_client *client)
 	int err, err_read;
 	unsigned int i;
 	struct s35390a *s35390a;
+	struct rtc_device *rtc;
 	char buf, status1;
 	struct device *dev = &client->dev;
 
@@ -447,9 +447,9 @@ static int s35390a_probe(struct i2c_client *client)
 		}
 	}
 
-	s35390a->rtc = devm_rtc_allocate_device(dev);
-	if (IS_ERR(s35390a->rtc))
-		return PTR_ERR(s35390a->rtc);
+	rtc = devm_rtc_allocate_device(dev);
+	if (IS_ERR(rtc))
+		return PTR_ERR(rtc);
 
 	err_read = s35390a_read_status(s35390a, &status1);
 	if (err_read < 0) {
@@ -480,17 +480,17 @@ static int s35390a_probe(struct i2c_client *client)
 
 	device_set_wakeup_capable(dev, 1);
 
-	s35390a->rtc->ops = &s35390a_rtc_ops;
-	s35390a->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
-	s35390a->rtc->range_max = RTC_TIMESTAMP_END_2099;
+	rtc->ops = &s35390a_rtc_ops;
+	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	rtc->range_max = RTC_TIMESTAMP_END_2099;
 
-	set_bit(RTC_FEATURE_ALARM_RES_MINUTE, s35390a->rtc->features);
-	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, s35390a->rtc->features );
+	set_bit(RTC_FEATURE_ALARM_RES_MINUTE, rtc->features);
+	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->features);
 
 	if (status1 & S35390A_FLAG_INT2)
-		rtc_update_irq(s35390a->rtc, 1, RTC_AF);
+		rtc_update_irq(rtc, 1, RTC_AF);
 
-	return devm_rtc_register_device(s35390a->rtc);
+	return devm_rtc_register_device(rtc);
 }
 
 static struct i2c_driver s35390a_driver = {

-- 
2.48.1.711.g2feabab25a-goog


