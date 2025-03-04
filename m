Return-Path: <linux-rtc+bounces-3394-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D513A4E9AB
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Mar 2025 18:45:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8C198A2C52
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Mar 2025 17:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F03D296D43;
	Tue,  4 Mar 2025 17:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UTDnTvR9"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696C128FFC9
	for <linux-rtc@vger.kernel.org>; Tue,  4 Mar 2025 17:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107943; cv=none; b=sT0ymzCVJE7Rq+wBRgP9Ld+C6IxDblanhRhXVLkU4DddHctZM3ruDTJr8TT/swf/VGE7KGNZnc1wsWbm1aPN8esk5W3F0HRj0PfzznWLVXvKivWY5xmI6RuqOuP+j27gZkcytE3usnXR9vK8myYbNTEYfOlVIpMA1s63faNY0nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107943; c=relaxed/simple;
	bh=UGMJ3GCPyVV/uGz6DNqBy2mH3s73qryTRoU1mvi31cQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p727IJ2R/LOgc9j660AEYnI2OdVkBhBJQZHopNe0E6e83O9PDaDGh/PLK2T2rtosP1yJ08/hb7KoLSvU+7KO5DGzf7+mWkB7FMAE8IeCq960+WJqVDFE4Wo6o/yUsvBh9A6nw0omIvfnUoB4UrGDs+K2TO9dDqZ/d+Sk1ORydr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UTDnTvR9; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso63545705e9.1
        for <linux-rtc@vger.kernel.org>; Tue, 04 Mar 2025 09:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107937; x=1741712737; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NvWUKPp3Qf/mJMvtGf6kleKwT9jTpA0O53gNmEgl49A=;
        b=UTDnTvR97lbQChwnawl2/OUY6d2PQLZraBs7YRMGLL03EvYfholAzz3x8d7k2a/N+f
         qI15DarsYcaoyzYx9O8qlwSC6L3O47FwYY2MjTCYUug5dU8sNI4QEdtNc3xThqpLcJbJ
         UPz0r2TDWjVzN4b7byUxB6GTwPKhWPbgC8iKA+8SoHZuvF5bX9gAfLrQ33DPykxQsDVt
         B1L7fupERgwY7sXiI9w48uWRPAkIJKLQ5ZUAzLlMmlSbvXlZRJB0miy+MqL5X0Wqxdul
         cnwhMG+4KjG0lJcK6xNNQ80kmyxocuNWh11pj5UTJYLysfvK5j1Dqv/eHzEqAyT/D0Td
         iTRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107937; x=1741712737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NvWUKPp3Qf/mJMvtGf6kleKwT9jTpA0O53gNmEgl49A=;
        b=mI7MsocKEtTSlUqORuMTSxNPHdeNyWdBS8knb3kmOASL8oftUPZiEjdymuLTLjf6Ec
         YFAvql1GLrQjcLWVgoTTPJEAE1HDRcoYvy7UXG6rsMQcoK50estqPyxqs/FkMXPBx9Tr
         dfGJcdXMdU90+9KsiC8nFGXhv6mVvo+ZyX9a5tbjT32ph0TwMxiIg70+tFI2T84Sdlzc
         v6GClcegSgsWfEE3In6MTbvkaa2OZQEvGkHjfzDFFRZsQ1pnnydE/O/wKv6H9I2mFshI
         D+S8EjPjJzO7L0u/xmpyhORziE5st831M8L7YrzJiOj3huR60yCwRXZzH5PH8EoRevRD
         +zMw==
X-Forwarded-Encrypted: i=1; AJvYcCWRk0lD2UHy9qcj6a3iS5VQaFRybzTRGhXsmN7iP0bCDOjumRr8o0KB+BcfwP3RfTO1RkFG4E4hXlk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZda07sFKygi5FWwGhLY2+WrMLtmjm9C90jAB9/g2FrGimXbdm
	s5d5H0ZZnB/+u1uGvVe6wQZmalZA0jdGg3TUDodKKQ2aJeYFtqKCZde+w1UYh7o=
X-Gm-Gg: ASbGncvUNf9Pdj5BWTxQFpd7VL2TAhILAaABn4+ynFZQPSdZgbt00+OCyOcHMQFmVBv
	fPTIMovGzzK4HY0qeKV8pHnngiSg/mrAxGGdQN9T2RMlQjEbYDwJ/BsMdOH2pN66D2+21bqidWs
	h43vroWqLTHHnF0q7MJ3edoq351ZtanBs5vooQzlasW0QBdBP+x/5jfBOg18mYNiFbWLi2YjMwS
	EjJNwmXztdXLxH1uAONmgFh4Mcyldm8mYQ4XGlDOa7REIcmwIw8WzHMNsU++1AMWwFcSV6Ws0SM
	y4Mo9nuPCcRSSJWN/2mHn7NmDcC7rvO0g2G5RAj8w1GqyBMKt/PmNVxEjj7AL30tbfzaAE14rlN
	Axub+k5I+qqCCVM97B2A7oi/GvFIt
X-Google-Smtp-Source: AGHT+IHZdsv7jYfFsjyY3TIB4euke/dHgzMkeAeSorD4HntlJXvk76kkhxE/lHiggYkJdsJqp3nEfg==
X-Received: by 2002:a05:6000:10c1:b0:38d:df29:e14f with SMTP id ffacd0b85a97d-390eca069a5mr17165829f8f.43.1741107937298;
        Tue, 04 Mar 2025 09:05:37 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:36 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:37 +0000
Subject: [PATCH v2 09/16] rtc: meson-vrtc: drop needless struct
 meson_vrtc_data::rtc member
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-rtc-cleanups-v2-9-d4689a71668c@linaro.org>
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
 drivers/rtc/rtc-meson-vrtc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-meson-vrtc.c b/drivers/rtc/rtc-meson-vrtc.c
index 5849729f7d01d7ec7868ff3bbdc5ed599aaa8238..7d38258cbe376e5a1b2af6250cb6d04c313175fb 100644
--- a/drivers/rtc/rtc-meson-vrtc.c
+++ b/drivers/rtc/rtc-meson-vrtc.c
@@ -13,7 +13,6 @@
 
 struct meson_vrtc_data {
 	void __iomem *io_alarm;
-	struct rtc_device *rtc;
 	unsigned long alarm_time;
 	bool enabled;
 };
@@ -65,6 +64,7 @@ static const struct rtc_class_ops meson_vrtc_ops = {
 static int meson_vrtc_probe(struct platform_device *pdev)
 {
 	struct meson_vrtc_data *vrtc;
+	struct rtc_device *rtc;
 
 	vrtc = devm_kzalloc(&pdev->dev, sizeof(*vrtc), GFP_KERNEL);
 	if (!vrtc)
@@ -78,12 +78,12 @@ static int meson_vrtc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, vrtc);
 
-	vrtc->rtc = devm_rtc_allocate_device(&pdev->dev);
-	if (IS_ERR(vrtc->rtc))
-		return PTR_ERR(vrtc->rtc);
+	rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(rtc))
+		return PTR_ERR(rtc);
 
-	vrtc->rtc->ops = &meson_vrtc_ops;
-	return devm_rtc_register_device(vrtc->rtc);
+	rtc->ops = &meson_vrtc_ops;
+	return devm_rtc_register_device(rtc);
 }
 
 static int __maybe_unused meson_vrtc_suspend(struct device *dev)

-- 
2.48.1.711.g2feabab25a-goog


