Return-Path: <linux-rtc+bounces-3397-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AF98DA4E8EC
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Mar 2025 18:32:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 565517A37B8
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Mar 2025 17:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA57E2BF15D;
	Tue,  4 Mar 2025 17:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BoIbshlp"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39E4296D41
	for <linux-rtc@vger.kernel.org>; Tue,  4 Mar 2025 17:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107945; cv=none; b=HWqI/5qv9sbU9bAZ9qGlV1o703EKifbRr/FB89YosUYbt0MbymBSlqH7gBdd6RqMYe/cZ0O84/S5GlymRm2qsdzhfTUjd+sWdnCOgGfR91z/CAYYqjbhA/3BSpE91JCHkxZTK1BVPzLauPaqrCWAaHuJib9uQxu3F3yXyxM2AEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107945; c=relaxed/simple;
	bh=M4Ze9HORH9tUnnjpPlWigivxQdkAcaAxYcFUsuXXVuQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mQc6ec6hI2IHCDhJAxl7shmifXqDygTF31E1oVZ4xpBu2KkQySmsXIrNeMfk8/tjZLKkky24Z+yZRSlttiR07b72eD33d2dZZ2IZzieAHcY7SPrXcaUeTvrDJAIrMnxjGkZbFLS95PH3BkVaq5CfESt1SxicM5vuDkIPtj0t7UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BoIbshlp; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ab78e6edb99so816696166b.2
        for <linux-rtc@vger.kernel.org>; Tue, 04 Mar 2025 09:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107940; x=1741712740; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hsaGEw76ofDXd3Q1RIPfSv8CJUvwC0w+ueATTj/NegM=;
        b=BoIbshlp0G00gd27VwrJ6i2hu7nG72FbP/83qvMN+QuKU0ebLPzqQNEEZ+uV+1Sm1t
         4uN1xglWjnFCOA26onxYUtgtHp3yOycVeYpgimSVPixkuc27yEwk51n1gFXwO5hl+SK3
         wbOUAqdy1IuXnDIqGpPX2EExxNgVkoX53kD6y7zMa6Y/2upyI+JFFH0Z5xqDFVOdWw+q
         eObY8R+0joo+1Y4FNzje2j3AV2fN92qdthcDEVpZ7pKF8ujo2kY07B9+6gZUaetowcl/
         DKI9CqsoLJWsTI60Ev9TslXZDD5H/ERQ2jgJkM+xCD0GPNsNoenSNSQeGxkVzkJ3JeyX
         unRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107940; x=1741712740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hsaGEw76ofDXd3Q1RIPfSv8CJUvwC0w+ueATTj/NegM=;
        b=nwBnn2U/ikDLXjNWg80bsqrH0hNrSK+58NRyR3fB6qpm9GF1M6DcB7mTrrf4Ut19BR
         RO8pb5uC3cXFHb3KpFjUzENR+6aCaFzaSH/FASkddr47tk71UqHkDax3Oyzv7lgMA1Xk
         gyeeXNiPEBUf42NnmdjwQ7pQI+Xn6aOP56UdeThE44r10UJtoWMS7VjkqVkrK2oAt5Ew
         YMHGJfs0b+c0zJnWIzdqX5lNPleuS7TE0NYB+GUOFNexifpMOMq1NJYpMoDYkY0yYEUP
         gbZtj61sxWPj98VeShGxDnI5KH0AnU2ZeFRwsa/AsTWPiasf7tJ0DkNhAU0UNR3Il0YJ
         zAjw==
X-Forwarded-Encrypted: i=1; AJvYcCUJIxENwBOtcU5R9Lzmcf2jME9Lo7ylPul79r7EcfuNXhbWhvWLchWllXtk0QUL2JZa3B7R7G+T+w8=@vger.kernel.org
X-Gm-Message-State: AOJu0YznUVfB9rOVh9UotGPzKpfhjxQuODtBRt1h8y3ZbZrJbNap4/Qn
	GSkL7N5wwAMXrlkuwYX7k4Oq0lkmKqiRtzVL/8lRhxJPZXgFryzr/I6WXYCS4YU=
X-Gm-Gg: ASbGncsMldAqhSsAI3FnclKleNi1CWwOaDwDxkoXuNRKiyqf9snxroY+Ooh0Jw3UGKY
	SNrNBSQZymW1bSU/jG2cxOKjnmdJ9X10WcWjnk+CE49Ioo9xAuGnzmOIHQDLZfxEpoxRnatn74Z
	z0cIzZHooIPUbd6ovFCx6rsnMT7/4FpUiR7fHMqQFWTYSgbeBGIef8AAMKPzJLNpMG2yKIL7oKK
	3qaD9riKebuHv3xy+ylqQdY+/3I6ULVox/WNN5swYCemUJFMGjY1J4Wc2+ZQB0GPskwfb9nEavu
	5uiVJjzV5oVlhyUpKSI8KV4LdDvgmrAIqSmx7lqR9MLeDlr5ByQHrbDBNiO1IgK63UOTtznf6+6
	NbdqFHoZaUOGly2i+7TtoNZwjKsut
X-Google-Smtp-Source: AGHT+IFl6TTi8U8Sph/F6W/xnjfer4H7R9+DXzK4OCCEVcy7pkMVR63rOrht0Su/bmOb+eKFGQTbhQ==
X-Received: by 2002:a17:907:1c8b:b0:abf:38a:6498 with SMTP id a640c23a62f3a-ac20db16fb1mr2300366b.55.1741107940186;
        Tue, 04 Mar 2025 09:05:40 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:39 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:41 +0000
Subject: [PATCH v2 13/16] rtc: sd2405al: drop needless struct sd2405al::rtc
 member
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-rtc-cleanups-v2-13-d4689a71668c@linaro.org>
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

Tested-by: Tóth János <gomba007@gmail.com>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-sd2405al.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-sd2405al.c b/drivers/rtc/rtc-sd2405al.c
index d2568c3e387659dfea598cd2ef6bddc5c076cbb9..00c3033e8079b5f10aaabcc7a1d3f19771263a02 100644
--- a/drivers/rtc/rtc-sd2405al.c
+++ b/drivers/rtc/rtc-sd2405al.c
@@ -42,7 +42,6 @@
 
 struct sd2405al {
 	struct device		*dev;
-	struct rtc_device	*rtc;
 	struct regmap		*regmap;
 };
 
@@ -167,6 +166,7 @@ static const struct regmap_config sd2405al_regmap_conf = {
 static int sd2405al_probe(struct i2c_client *client)
 {
 	struct sd2405al *sd2405al;
+	struct rtc_device *rtc;
 	int ret;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
@@ -182,17 +182,17 @@ static int sd2405al_probe(struct i2c_client *client)
 	if (IS_ERR(sd2405al->regmap))
 		return PTR_ERR(sd2405al->regmap);
 
-	sd2405al->rtc = devm_rtc_allocate_device(&client->dev);
-	if (IS_ERR(sd2405al->rtc))
-		return PTR_ERR(sd2405al->rtc);
+	rtc = devm_rtc_allocate_device(&client->dev);
+	if (IS_ERR(rtc))
+		return PTR_ERR(rtc);
 
-	sd2405al->rtc->ops = &sd2405al_rtc_ops;
-	sd2405al->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
-	sd2405al->rtc->range_max = RTC_TIMESTAMP_END_2099;
+	rtc->ops = &sd2405al_rtc_ops;
+	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	rtc->range_max = RTC_TIMESTAMP_END_2099;
 
 	dev_set_drvdata(&client->dev, sd2405al);
 
-	ret = devm_rtc_register_device(sd2405al->rtc);
+	ret = devm_rtc_register_device(rtc);
 	if (ret < 0)
 		return ret;
 

-- 
2.48.1.711.g2feabab25a-goog


