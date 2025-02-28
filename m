Return-Path: <linux-rtc+bounces-3335-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3782A49B73
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Feb 2025 15:09:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5B853BA0A4
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Feb 2025 14:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CA1927129C;
	Fri, 28 Feb 2025 14:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j7tPzYs5"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E11B2702B7
	for <linux-rtc@vger.kernel.org>; Fri, 28 Feb 2025 14:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740751653; cv=none; b=aq3PIGBKE2ypMuwWgyP30mu2THGGG4LiKXdkqnQa+S0MC10PSzbsWTih76b8yZHUVYTbibXC1C52pIWGRhBrjnIssTRT4MJC4qRt+o/AaeXn8Uz5Lj5D7KNGuInFtfIf40Bhy3BG4tILFRqZrAbaElGkwjAK7IiDzVNxv/uH3kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740751653; c=relaxed/simple;
	bh=YWsW1Hi2ZTuQ4PTHK3D3g/NShAx4HGeNxSNC1qLA8+w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VoZl9FtG3MiszrpVecBuB+WxxtcB6NzqjQV18lGWQuaBiUWjQ1ditsc0oHAfND/mMCeD0XPlpLSMZ5OviCMLIiKGWr2lIN2XZHM8hXIQwj2+YzNArz6N5rwamX00iiPgeCvDnJ6VuIwO5p/Ls5fjmScFFXo+oWP2LIUKqVm+y30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j7tPzYs5; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e0505275b7so3367295a12.3
        for <linux-rtc@vger.kernel.org>; Fri, 28 Feb 2025 06:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751649; x=1741356449; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IKZrDxBZwKYSSWAqYI1nyzOGiPZfFb6S25OWnyP8uMM=;
        b=j7tPzYs5kMi3OXCfBSZ/zp59PZ+0it49nJTyQFkUfV98Nqr5zXXgEjXPo13EQACQwE
         rcl9sDp+2z2BcLQVgAMS5Y3V9JXPp/rQewLRxGFGD1Eh7t+2ZCSpgDIx69ApmNMeuUZH
         c7WRW3zkmtX4PdALnviuis+bbbC4PKjDhzzFyacNWkFMiu7iGgYm139IpWMdssRf6qmS
         SPI3h6UI3BxN7ewQ74RQ+qCWy1QpSRfmH+TiJF6aALk56/+A4njF/T8nMYYAqWRXpMcQ
         KxROVbTWTF0sjLmmkczb05zYo5zeo2Lk5Yam8b/qihY1xZ2X50pW0fxChgbxBzChM91p
         kjMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751649; x=1741356449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IKZrDxBZwKYSSWAqYI1nyzOGiPZfFb6S25OWnyP8uMM=;
        b=L6FgSzeYqK46gPyoASkX+k9ah8+LtkTHHbPdlbHkMvdkB9xU23rFZ7RAX8JyynukAg
         +7a91A89Vnw0IT1T0HtYw16zgg2KLfrbYadV7wiD/WheVGm8gbydRE+baQfBV53cZYR3
         kt5N53PPaoIorg61ObSWWvgNFL5KM/NQCHXkT8yx5RAP48nM/V8VB6NMacpKsZQuOmMb
         uoXQ3iDkFFBMwyNgoNYnSfT4aNTp1sCn2vVHM91gLMi0Vv9VU3BMAlOLFVO5gz7qXSim
         ch196s/hryRcNftYg2UNb1fGAGd5bmvJlY4ayorDJeuWsnnCnABWrsNqnKJguRUb8pk2
         9mcw==
X-Forwarded-Encrypted: i=1; AJvYcCUsbtKsMAEilb7x6iv6/87Yhbk3QBLZkpHHxB9p5e6lgLJU5x2OR7QY5JR+uKvUcMRa9+rTq1w9uKA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUwOTWuPnhFdhZYFfEeQ/CZyOVHxTo/CDZQAong9MM6GlhHYTI
	EHP5Mt5Jcc3GWagRdH3bVpdN2W4ETGPQ0v6pf+qEdUSdfF8nyEJ6qTMFS87/ab4=
X-Gm-Gg: ASbGncu0gFjrvSyHPxXrZnGk0mQdwq4io23u21nFtX7qMkhxFEpaRBTtXkuqtHimEEu
	p3Eb30MBwijsI22pNAKPtvEirk0hnp2FMIqYXYHKpQt11kEt83utG+dRjnqy30IfqMVqk2Gfc4N
	yGbC2UqcUU6X4kd36OkY0aUF9T1pXZv299OmApRk+d7ayME4fHFM3RnplSFaCPQcjoNAm+Y6+EF
	Q4dqYBA/yySVmRYn+mU/jkGrHhgpVV+0t4GtgcKRuzPnjjukWZd/CvqiQ2P7zgvpRQWqZLAO+ah
	F4PT73eVvIzJ4hblyAIm9Y464fRjVq4A3VR1hed6TVmml+Xi7M7CgpDgGYKVv19GUHa4QrozzIs
	awvPj/KL1Og==
X-Google-Smtp-Source: AGHT+IHq59q43U3ESaHrkdTJX61FFZSQWYbph+vbGLJu0Eb0VqRkvBLNVX+MfvKgdS008nj52Al/2Q==
X-Received: by 2002:a05:6402:5188:b0:5dc:c531:e5c0 with SMTP id 4fb4d7f45d1cf-5e4d6b83d0emr2632501a12.27.1740751649255;
        Fri, 28 Feb 2025 06:07:29 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:28 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:26 +0000
Subject: [PATCH 13/18] rtc: sd2405al: drop needless struct sd2405al::rtc
 member
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250228-rtc-cleanups-v1-13-b44cec078481@linaro.org>
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


