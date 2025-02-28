Return-Path: <linux-rtc+bounces-3329-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF22A49B58
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Feb 2025 15:08:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A43091897A22
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Feb 2025 14:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D42C2702A6;
	Fri, 28 Feb 2025 14:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R9YMZXnh"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609CF26F44A
	for <linux-rtc@vger.kernel.org>; Fri, 28 Feb 2025 14:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740751650; cv=none; b=AQ0imzHobcQSeNUvRcCD3jGFvjvD8pGdxXi/Az+mld27IIvHHkZMuMzvnWL6kMe0Wop1pFaSP7PSmOnx6NzIXXNimMg+2DLIGv/G4T1n5ql6mLRbAOhT2uXY5NglTG9AQcGI9UR+oJiWzI765S4/LVuLLrsh8VajsIrxJcLGSoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740751650; c=relaxed/simple;
	bh=96lokglM16xoW0bhDeFwQgKQck5a27ZC3KAyN/gWBFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NI71mN82Py7sQo8gEFsjE/tsQZcMLADRIHyi5LjYFCCQxyR1rWr7KSQjHfOSCoGC/49Wit+f+ZEQieF5uZCLama5wdXqgjsbfLkS0+4heUHjppTl2KBfYA3aE5veZB13WIytKxdAUMQ9FRA6J37nNOzdKE5e3cPJt1UaFcZbUlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R9YMZXnh; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e04cb346eeso3601928a12.2
        for <linux-rtc@vger.kernel.org>; Fri, 28 Feb 2025 06:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751646; x=1741356446; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IgG/ZB1ufhyJ5LLnH+TbRO+Ff9QR7sb5p8sH4cYGYcE=;
        b=R9YMZXnh1zrTv4GDjxr8Nv0HMUqufzXC/q+ve+iHUkA5myd441jrUh/4BI26Hv0W65
         dax2EHzr3zeQ70OEhsQZZ1OXaoITlLwDOhwCAW9ZDXYrEnDQRrG/gekRYUtS0asjNF1k
         EkQGOjDWVzlAverug5FQmkK7AuUtKRKdR6U/f/tG7dAbEE8TnXxzWd7gHlKpj8dnp0iS
         Ye+73QhzpOoBa1dE/KzrxJ73E4rcOjnhJdM8QNb0UsHxDiRcAdLrsRa+VuNxlRW9PJBr
         EPKPrB8K2kguil0L1uN1CDbV5N58fp3LFVi8V/Z5Zw391NSOyl0J1pUyADpHqDeKCn3Z
         6gLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751646; x=1741356446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IgG/ZB1ufhyJ5LLnH+TbRO+Ff9QR7sb5p8sH4cYGYcE=;
        b=ZWm07vrVEC+RRUVhk4cqqxWlODK4IQcUaLma3j+TaRYfEl05T7oQ1rGcZOPsNSnmz3
         t8EIHQ2hwvzGVkup5CqmTxWljc2i4LfNbxVo2fZLNUiMDl4xEu+/tXPxcxgDhtuWpHhk
         fc1Iden90GXD1bF9IQKoYQm5ewF4gx8akMwXFnXAy7xVZ/oPsXfyVpbNm4ZS6OqDobqt
         F4bpes9YGFC20bqc5D0n3bSCu9DzlOt3BLdEMgY68UoWio3C/3ixsfQy1powSEpIpj0Q
         Pz3YTEFGcuTLXXOkjDcXBQtAVbv2Sf3rYLiUImfeY/Mcqw6lss7UHAmnw4Ia1Am8FRkE
         VIWA==
X-Forwarded-Encrypted: i=1; AJvYcCUV0aQWUTLf9uyLZ+/eLHrLOi1HutaJDUm1gb5wu8C5bPgsj/z0NgQADWLMJyDFU6Tf22dzv1SOgrY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4/mQIoJZ4yyS8ithXMvGpJU9r10U8yMPsISSAoEu8WyRqE21v
	WyOUZncDQ3U4wBRxhBWaCJ1QKVuGfTC0p2Ny1VhP8pZfkDDLPcug/OK3b03GUeU=
X-Gm-Gg: ASbGnctYAOi9DsNqz2mtL4SF6mSpNCUlBU51NY6C4S1EUgWhDdt1WqxUlhWfmFGosvY
	IDDcj062z1ou2TFzaFvKKDd971frjAxgTCZop/NOOa0IveqyKxq8u6vEJQNZupyDix7yKFVabJa
	UcShC9svNAFgk9dvhujk64hYcprAI1Ogifrxz2tYI1hzbJ2V9MeTxDfIWEN/q3Ecm9tploOhiiu
	ZFaWOM7wNi0uFSa3K0rEIIBx+vBXL7zJr+GGe6OTxOmENp71pKFIPDvB4X0uD6LKm2hmJoFuGih
	EXLjskiJ9Drf1iR46xD5v3+kH3VM0hV2zU1Qo5mWgzJAWS6+LFxV4+fsYnyIvLHpsU0GPFibmiw
	rhb6PEb+6cg==
X-Google-Smtp-Source: AGHT+IGw8/Em8B8f2s0ytjmI+eWh2dyA3vFh7dmQ8lnXofAka3id8ECQEXS4gzzEIESeh9rUlyHc/w==
X-Received: by 2002:a05:6402:270d:b0:5de:5263:ae79 with SMTP id 4fb4d7f45d1cf-5e4d6adec08mr2881207a12.12.1740751646341;
        Fri, 28 Feb 2025 06:07:26 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:25 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:20 +0000
Subject: [PATCH 07/18] rtc: m48t86: drop needless struct
 m48t86_rtc_info::rtc member
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250228-rtc-cleanups-v1-7-b44cec078481@linaro.org>
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
 drivers/rtc/rtc-m48t86.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-m48t86.c b/drivers/rtc/rtc-m48t86.c
index dd4a62e2d39c73b1c8c3f50a59fd4fffc0b45105..10cd054fe86f9e6be74eb282222b2751dd91cc7e 100644
--- a/drivers/rtc/rtc-m48t86.c
+++ b/drivers/rtc/rtc-m48t86.c
@@ -41,7 +41,6 @@
 struct m48t86_rtc_info {
 	void __iomem *index_reg;
 	void __iomem *data_reg;
-	struct rtc_device *rtc;
 };
 
 static unsigned char m48t86_readb(struct device *dev, unsigned long addr)
@@ -219,6 +218,7 @@ static bool m48t86_verify_chip(struct platform_device *pdev)
 static int m48t86_rtc_probe(struct platform_device *pdev)
 {
 	struct m48t86_rtc_info *info;
+	struct rtc_device *rtc;
 	unsigned char reg;
 	int err;
 	struct nvmem_config m48t86_nvmem_cfg = {
@@ -250,17 +250,17 @@ static int m48t86_rtc_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	info->rtc = devm_rtc_allocate_device(&pdev->dev);
-	if (IS_ERR(info->rtc))
-		return PTR_ERR(info->rtc);
+	rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(rtc))
+		return PTR_ERR(rtc);
 
-	info->rtc->ops = &m48t86_rtc_ops;
+	rtc->ops = &m48t86_rtc_ops;
 
-	err = devm_rtc_register_device(info->rtc);
+	err = devm_rtc_register_device(rtc);
 	if (err)
 		return err;
 
-	devm_rtc_nvmem_register(info->rtc, &m48t86_nvmem_cfg);
+	devm_rtc_nvmem_register(rtc, &m48t86_nvmem_cfg);
 
 	/* read battery status */
 	reg = m48t86_readb(&pdev->dev, M48T86_D);

-- 
2.48.1.711.g2feabab25a-goog


