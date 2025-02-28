Return-Path: <linux-rtc+bounces-3331-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2F4A49B5B
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Feb 2025 15:08:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F80F1897C57
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Feb 2025 14:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8550B276D02;
	Fri, 28 Feb 2025 14:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DdY1jAQ+"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A04926E17C
	for <linux-rtc@vger.kernel.org>; Fri, 28 Feb 2025 14:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740751652; cv=none; b=dM7QK9pnvgYNwCFy+jmUrrW+7V0Xy4cXGML0o+wBONM2edAFt2O3Q0quNvqNOA4PEjfyBH+vsJvf9oYR7cx2LSrGhjbrj4jMb5pl8crYKSQ0eG3qHzoIsgxRe+qeyDDfhfgpZYJ7CXuH9RUT53gIQONYFXBnQ9hNuOWPSKQOR2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740751652; c=relaxed/simple;
	bh=UGMJ3GCPyVV/uGz6DNqBy2mH3s73qryTRoU1mvi31cQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SPTAX7mNlS+3ST6ItZA6+HOPY/qFZr1qFUc3XU3kdi/j/ZW+B+MPYvzMkKxbO9ZYmxCvCtpSxXlHz3EVm/gzOTqEfkEfzUr2PeorwTZDlWqL8dpYhuRxGmhVIna3jUIN/nLh18uuGXlnlQCsBZk3cp+NkYUUTDTn+YFaID6y7ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DdY1jAQ+; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e5050d19e9so1068035a12.3
        for <linux-rtc@vger.kernel.org>; Fri, 28 Feb 2025 06:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751647; x=1741356447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NvWUKPp3Qf/mJMvtGf6kleKwT9jTpA0O53gNmEgl49A=;
        b=DdY1jAQ+yjUwqYfgqH9cNfvplNpOsyXlmerA6D719DmwyePTExZbTjec/fn9Ijrhd4
         cRcjrUON4m6KBm2dKUpSGjT0WvUdyVAKRhyWmiOytmXk6z2hYnCUTEALexQSWdjavfmn
         L0a1do+XcvL//KwWx7wttKuLlPdyKvXmpXrhpieOm7aJnhv2H5+VwimdReXH4SduXWfq
         IpzNE0YvV0t2vVzJj6xu5b8oyq5Ac0ZyeGcZ/nFqHvP1UnfwH7diE5V6IFJ25v8u9fuJ
         rimxFS4YUZvidbLulGnGDbep+2CZrriPXO1aK+j4UpgL3YN4t79/jHNJ67zBfflQ1nzi
         HJYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751647; x=1741356447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NvWUKPp3Qf/mJMvtGf6kleKwT9jTpA0O53gNmEgl49A=;
        b=lP1Qx81hbRihuaAd6sz6wHNwq6tMQ6fZjDcfEXtzclgKn3i3yQk4uO8FyEpw+aSByS
         gh1P0X5sJ0vcD2oLnMNqMCNZlzV4/gjvDq/L5YshUb1qUbbaxtacU3VcOmzFylENIjTT
         F0YhvhsKURWTb70Xk7Y+Wwk+p8xW63Lglp9obbXoOg834Cg8xzTwuJGrX6h3ZsZxuKGn
         28/o8E+apRE2b98RudrWYsR5Y3fw3z3SYTCBv4TZ1MpXdaG0oFQ8Gzd32zfa8JxSGNMI
         QKAgCpQIzAVRkAtQCfsB2rXwnG2Y12Iro6/devlIjZ9of59ZpDyj3Oh7XBW+1rqsFiJ7
         iNhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTySZWFdE1q89zrMrB0JULOmRHWqHZkAfU8N1NlFQ1x6xneI383EtK4maW3k47GmCG5+MH67L6ut8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3/ToNF6b5Jf9Ec9HaJ/G/MoWYdZgOiyl8xlEOKkeAK6olHcJV
	VE//nbuvJWgvIYw1MeOnobzUIag4gBPq9T+MdxBlIscCEQpUtL8Ri0mOAo+nTjnMzfoptziRxMj
	KlQ4=
X-Gm-Gg: ASbGncsvC2N5rnzCxY7qt4PIdrNKcGWAz64sfLXxEUFl0xsykA5++RcMBPUym3UCZny
	yw9v6y/7Ro8ZMGHqz7F55fQfQfDY14qs9K5GvIERRD+yUmxSGFLLsVWZRoDDRNT3hWdnNqYLhgW
	HGbdk5PfxJOckH2brwMEBVKDZ2IuqbLvNH2jXob26p8UNqDJQfQXp+3dzqGZ1ZJT5PqP3z6+vFa
	wKCRWBjscOC1VhVZ6g6SDSjj/EGBRQ4Cqy5/O3u/11SCg982I+EJj+l7xj8J2r/SekVyY2PoL8H
	/f5iKVB9Sc3bNt33f3hKJxm+GE0VVhahL+pr5+dE/lbgsjNy/UsZqfLuouh8mOtclDnOpLp+uwO
	cpC9Mivzfbg==
X-Google-Smtp-Source: AGHT+IGZCKi+h7liDGF2k254zFpRo0bnTt6a/BEgRPyIDc7kptNekspya74S4whe/rs/kwdpZDQeGw==
X-Received: by 2002:a05:6402:27d1:b0:5e0:82a0:50ab with SMTP id 4fb4d7f45d1cf-5e4d6b6240bmr2836488a12.27.1740751647311;
        Fri, 28 Feb 2025 06:07:27 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:26 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:22 +0000
Subject: [PATCH 09/18] rtc: meson-vrtc: drop needless struct
 meson_vrtc_data::rtc member
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250228-rtc-cleanups-v1-9-b44cec078481@linaro.org>
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


