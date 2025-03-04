Return-Path: <linux-rtc+bounces-3395-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7E8A4E8E8
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Mar 2025 18:32:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E5A17A88F3
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Mar 2025 17:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99E882D1F63;
	Tue,  4 Mar 2025 17:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n4wQBx0N"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E557F28F95D
	for <linux-rtc@vger.kernel.org>; Tue,  4 Mar 2025 17:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107943; cv=none; b=KCauvymoU4q0m7Qyxk9q36ReN15a4oEVnISpwALdpCogdwl/Xo2tr5Ss/RYwZ6/fF6MuBt+oYGivMkKbO4rH/cDweeKozmIPnhNzmNWsGTPHf0YeGx4ybgR+ptdbFppXfQCbo3mRr6i4pgLkAO46vzrVWLJQfGktSWXWyWM8L8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107943; c=relaxed/simple;
	bh=w6Ez2HJK0lLtjno5cUxK05/kYeMcWHjoaFlGGgugd14=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g9CS8B/OI5D+DxQeyVofw9JcLx9ddylG9qnmeRqAyN1OcAbcdpCoh1gjNPZj301zZQ6clZJHHAQsfNNg92JDnWC2gWODN7ImPkfFrlUXsrBuOlBHMTkyxARaru6MpEXRqQ8Jau+VAVoZQlY3/oE24Ks0sEH6Fl85WjyawOMQypA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n4wQBx0N; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e0573a84fcso7977605a12.2
        for <linux-rtc@vger.kernel.org>; Tue, 04 Mar 2025 09:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107938; x=1741712738; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l1dbxTlHkaw5uSKNsqDfe9Jgr4Kg+vWUXd+ullz5kUQ=;
        b=n4wQBx0N1w5ENAaX/0C2H1OLJrJ2AZ4Sa1Y8rwOYtPRxSx3d1wWcB+1K3jeM85jw4y
         iKOTh3c0HII7ikEh9wkb7DcikKMjlhoLdoR1gvCLTSVDKwYFDAx06ruJ7O+s+KQW+5uV
         2XVLhhVJAj4o/ZRBNdX6Z0v+jGoP/8yU2+mVnbKb6Mk0YdmHyLAR/WglgvAzp27IJaAd
         /0jXs2AR/Lw2KDvdkB/2wxfQ2Ib1Sy3j+K/sfLSxMZ2reJAaNft7G7BHRdOPgLCkKCP7
         MB+eQybiTh5qGX1R2PMfyG+R8DskFbK51x3SnN7SuIfS+fQdRzJhVKzZcT0b7NqdWLMn
         SEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107938; x=1741712738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l1dbxTlHkaw5uSKNsqDfe9Jgr4Kg+vWUXd+ullz5kUQ=;
        b=vgyd7qD2kbugov4GfGqbaG0One+P7DOLiF1m48inb2EwkCCV78EUg4wMXDI7yadhoe
         AiI3QBSMMbBa4RshF7HhJLqLLWNksQQYOsTLTHmJn5Kcclm08opquzsi7XPhlyC4DDFj
         jXoPhyO3wvFyVuCeqHzHKH9Fw0QO2DdHYq+qsipHyifrCD3x5+SNIt4E14s+s7hrCakp
         0Es6oJGvc2V25KLQuj5mtJCmdKvjf2Ez0wmFgbPeNIV44klXIUQmffAedY3BGE/HsP6J
         Kle1d4XZQ/ShU9TAvxOwS0AxpCebv9A9tyh4BEehpv11VjPz4alNFi26nefN5qPNuWtv
         kbKg==
X-Forwarded-Encrypted: i=1; AJvYcCWhsKMlwSH/h1vRAiUHR6Vv67mpl6cSaDoWzoxubGAHK2S9CeVWg7SJBCXq4wqOFyXIU8F01sYWDKE=@vger.kernel.org
X-Gm-Message-State: AOJu0YydRoE381uim2kQkpAggTC6QIXGl47Vd79yzYdG/LjMYydc/m2B
	x4wDVRyF16uGRTxDyBUtD354jvGE6VPUUX7PxkwUmWirIDFYK+esjZrg/sK6Kj8=
X-Gm-Gg: ASbGncveqhO/mrqy45oCR8Q1DWhlwRTu2yd2OPL6p00Aqd4x9vZaquUvghqEYpUKiq0
	RoiV9la4gVBDgy6Vp19iJuX2+/pbPfEIoYSQrTBfUjWSn5nM4TU1JJLswFiUabYV/ZA9CvptYvp
	dCN5NkAq4eJzyxZo4wDrzmD4bbcin6XZ1MllP0roJx6/si5CZbtlFxpz2lyGw8LIaahe4fJh4ba
	buk9OZnUa2Dv+kHLlOCecEf89CtmeNyczNSI4MUfdIlwaJZjKNcJMk6QV50kqTXXSaKlJTxCnYX
	DpDMqaA672ptEr+lL7b0/F94p0PF5PBkn3YUK3ahnn8KQZNGW3y3Kta66CVHNr1E6XvSvc+lP4w
	0WDRIk7+CULHCyxv+Gl1g96oan/YR
X-Google-Smtp-Source: AGHT+IHF998NpSXE/Qa2EdiSn4vtx17I0lnFV/wyKnxAJsCHaDM1j6HSEMvcUwtHdnvoXlFd/CgYog==
X-Received: by 2002:a05:6402:d0b:b0:5e4:c532:d693 with SMTP id 4fb4d7f45d1cf-5e4d6b8535fmr16782448a12.31.1741107937989;
        Tue, 04 Mar 2025 09:05:37 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:37 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:38 +0000
Subject: [PATCH v2 10/16] rtc: pl030: drop needless struct pl030_rtc::rtc
 member
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-rtc-cleanups-v2-10-d4689a71668c@linaro.org>
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

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-pl030.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-pl030.c b/drivers/rtc/rtc-pl030.c
index 39038c0754ee55a952e5986afe711cffff35840b..e7c81740061bb60c4d8447d6522819685bea9180 100644
--- a/drivers/rtc/rtc-pl030.c
+++ b/drivers/rtc/rtc-pl030.c
@@ -21,7 +21,6 @@
 #define RTC_CR_MIE	(1 << 0)
 
 struct pl030_rtc {
-	struct rtc_device	*rtc;
 	void __iomem		*base;
 };
 
@@ -86,6 +85,7 @@ static int pl030_probe(struct amba_device *dev, const struct amba_id *id)
 {
 	struct pl030_rtc *rtc;
 	int ret;
+	struct rtc_device *rtc_dev;
 
 	ret = amba_request_regions(dev, NULL);
 	if (ret)
@@ -97,14 +97,14 @@ static int pl030_probe(struct amba_device *dev, const struct amba_id *id)
 		goto err_rtc;
 	}
 
-	rtc->rtc = devm_rtc_allocate_device(&dev->dev);
-	if (IS_ERR(rtc->rtc)) {
-		ret = PTR_ERR(rtc->rtc);
+	rtc_dev = devm_rtc_allocate_device(&dev->dev);
+	if (IS_ERR(rtc_dev)) {
+		ret = PTR_ERR(rtc_dev);
 		goto err_rtc;
 	}
 
-	rtc->rtc->ops = &pl030_ops;
-	rtc->rtc->range_max = U32_MAX;
+	rtc_dev->ops = &pl030_ops;
+	rtc_dev->range_max = U32_MAX;
 	rtc->base = ioremap(dev->res.start, resource_size(&dev->res));
 	if (!rtc->base) {
 		ret = -ENOMEM;
@@ -121,7 +121,7 @@ static int pl030_probe(struct amba_device *dev, const struct amba_id *id)
 	if (ret)
 		goto err_irq;
 
-	ret = devm_rtc_register_device(rtc->rtc);
+	ret = devm_rtc_register_device(rtc_dev);
 	if (ret)
 		goto err_reg;
 

-- 
2.48.1.711.g2feabab25a-goog


