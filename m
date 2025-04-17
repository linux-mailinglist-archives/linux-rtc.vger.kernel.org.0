Return-Path: <linux-rtc+bounces-3969-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B30C1A9159C
	for <lists+linux-rtc@lfdr.de>; Thu, 17 Apr 2025 09:47:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25ACA19E14E2
	for <lists+linux-rtc@lfdr.de>; Thu, 17 Apr 2025 07:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C5CB21D581;
	Thu, 17 Apr 2025 07:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kqkKGwZA"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF4621D583
	for <linux-rtc@vger.kernel.org>; Thu, 17 Apr 2025 07:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744876007; cv=none; b=eXANYD16/bUWbtZalGx6exkbA2I5yub4uv6srCcgkrE4+fKcvhjLNf+Dig0/8yJjc7/mQBu2bCAza9L9EBLeT5Pxa5snkWne+yonMKiWkhAJkCbZyjtyxzJb/wSEl00siO+WT8OxwObZqV0o4GCbvwONXeAro6OwGFhEoRgZ4qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744876007; c=relaxed/simple;
	bh=wlIEevCmjQERFYbQh8MiayyzelN6WBy0a+lSUqPchRY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qarkTYmwZZUe+zTmnaUn0F9mvlx5EJSswSXvlnMzkCqDWriUVeg+vZK/Nww9391pXA9PSD4+k7NZlLWqEvBlaXaNqi9Tyv84q91Gx60Qrk4JaL9GepcM5pIL38+CKBreRWamyv2gaUMKv2+GqxOzj0wjypKYzI/05COa0eI0cz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kqkKGwZA; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43eeb4e09b5so700885e9.1
        for <linux-rtc@vger.kernel.org>; Thu, 17 Apr 2025 00:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744876002; x=1745480802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A08pQAastHDutVva01psuFdfpJpdF/00lKzxtTarv1U=;
        b=kqkKGwZAMsMK55HiznNAnLXatL28sn8R2HwuMbpZ8ASt9GvhRuyjhXn7OO2gfVB+SP
         ThlpXIbCxZhIkeLH603oYgybWJ0RYB0vs9Y1KEPPzktNqsyGS3RVc+Q3/dD7oFXHPX0y
         FuawI26bwFyejyjFXxbe2sQb1HjTNRZSF54ANcv8IrZV/fgF12FylznT0iDzKaHzdfNr
         K82v+NgmGw9nA5tFFIkWIsdHPXKL7pERQfyoveB8/c9/EvcRiDpSb0ruiHhTVpM55nJq
         DCJDMmW7HGidHYAhYQS868m7KYQ6VKo/Fjj6VU9byZfl3dLoq/gqjUetyiHgzNVN7KzB
         MLvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744876002; x=1745480802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A08pQAastHDutVva01psuFdfpJpdF/00lKzxtTarv1U=;
        b=naXwDwr93olnCMV8VlTtSXtMu6U5ob4rfM4gkGS8EesAqdKodymILY+5zuBJqcD+Gj
         6aqofYWZhhnVUk9m0uO3jSMa8wHu0eh8Tyd6Y7k14QEcCFmHvXD7c4r271lioX3vjZxG
         g5o1j2RebnaUEoQUVUkbKd5+SqK89qoWLZbS2aagNm+74l9FLxTvdLAaeUPT2eSeVuIo
         QrNFgMlkFrrQ7GkP+EIduB64qk4sUaWsKRLai2kCmf03FacNe9KskxwKgbIAZahm+cp1
         yEF6NItEPUbhSG+1pKh3sTiny1EpXFSFhXk+sDuAfhJMhQxlFtj0rUbUOQw09lVDxEGb
         +sVw==
X-Forwarded-Encrypted: i=1; AJvYcCW8DsS001jA6NajbQE3v8Je2k3H9AeGTvLWBBv5xM2pqrG5hYB+efPpDvXTnxWsqUv9D76l15Q1Hhk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZrgJAFaatxeSe/pLDJpvYM7ALvL9pwUeTdFvM2Wto3Ryeluid
	Rbbe3FltVc12rhY418ZUxM2lYSyvK37+NoW4gW1O6yGjhVifpM0KY8XOJEFxtuP2OGsGZQxm8Vz
	q
X-Gm-Gg: ASbGncs52+8Z3mao8mbyrEVrQut7hS/gpkN8WDLRtYZs4cPtFlQ0wmDQEHUuWNIx0tL
	ue0LAkdPNhftOp8O2dOmQCij/o4yGoYZh793M8wZeoI2bQbj1ZcXOur+vYIy0bOGwK0h/zJ5nJq
	uAg96KXM52c9LF76nlaY8EYtPHJCM6kt3xpGMLF3ZewhCyMMAqObC2OJOqkEPGAhZ9eR0o/KB2y
	ATjjcUOIvPv2xGy1FeXYagfGwugqeTynBTfGiIkvGVdgTJAIhH9rMdiNKVTvu1BzXLD3A5OscWx
	AuK6ITyZSt2/Q89cbdjnv9RY5MfdKhffzD5fxigdKSV2f+5fiGsH6irmLOgrICVYKO2DxTiPu63
	rGXq1FA==
X-Google-Smtp-Source: AGHT+IEvdZo2BLP4z8UvFx9FOWgsN7YpYjvUGwIjv+v2bOJs109wEHkXw6zQEzo3mhQTonujYPjgIw==
X-Received: by 2002:a05:600c:3b83:b0:439:9595:c8f4 with SMTP id 5b1f17b1804b1-44061c3741amr8732535e9.0.1744876002430;
        Thu, 17 Apr 2025 00:46:42 -0700 (PDT)
Received: from kuoka.. (46.150.74.144.lvv.nat.volia.net. [46.150.74.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf4456fdsm18922542f8f.86.2025.04.17.00.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 00:46:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] rtc: amlogic: Do not enable by default during compile testing
Date: Thu, 17 Apr 2025 09:46:40 +0200
Message-ID: <20250417074640.81363-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enabling the compile test should not cause automatic enabling of all
drivers, but only allow to choose to compile them.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

For longer rationale:
https://lore.kernel.org/all/191543a8-2e2e-4ac4-9b2b-d253820a0c9f@app.fastmail.com/
---
 drivers/rtc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 838bdc138ffe..6153c50d1abd 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -2088,7 +2088,7 @@ config RTC_DRV_AMLOGIC_A4
 	tristate "Amlogic RTC"
 	depends on ARCH_MESON || COMPILE_TEST
 	select REGMAP_MMIO
-	default y
+	default ARCH_MESON
 	help
 	  If you say yes here you get support for the RTC block on the
 	  Amlogic A113L2(A4) and A113X2(A5) SoCs.
-- 
2.45.2


