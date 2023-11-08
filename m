Return-Path: <linux-rtc+bounces-223-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BF57E53A6
	for <lists+linux-rtc@lfdr.de>; Wed,  8 Nov 2023 11:44:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B40CB20D3C
	for <lists+linux-rtc@lfdr.de>; Wed,  8 Nov 2023 10:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB38D12B7C;
	Wed,  8 Nov 2023 10:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iJ1GAqoB"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33578125C6
	for <linux-rtc@vger.kernel.org>; Wed,  8 Nov 2023 10:44:05 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 468B31BF2
	for <linux-rtc@vger.kernel.org>; Wed,  8 Nov 2023 02:44:04 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40806e4106dso3791775e9.1
        for <linux-rtc@vger.kernel.org>; Wed, 08 Nov 2023 02:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699440242; x=1700045042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1RgzV0IV23WRll6q2E++ToH69k3tzXfaVshdvzq8RwE=;
        b=iJ1GAqoBLn/tXaswz46AAySJ+xX9knDU4AGexMC+lunDeabwtIpxVGP41vbswH6CJ6
         zDo0iX70sH7KcDkArphIMOrL5yX5gPx3KBQC+mSKInHDn0DOqu7584eWKfLBTK9cu7J/
         NAtdXISNz62cO0nQRNdz8wSv6+qVVJi833Bqk86QSJlFDxGolD2s6INLUDtGOTBzckZ1
         J54uzjmFH6/8xxX5LRCPe9kp131X3zCORFoeBe5iIbQ1m/oSfrlzbjFEQVQD3AftGj6K
         a1xwqEQivTh0PtDGXhJOCrF+DKBlTHOGOozm5SbrhwayKorj46hfOnTIl7rpHzNuh0O9
         g17Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699440242; x=1700045042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1RgzV0IV23WRll6q2E++ToH69k3tzXfaVshdvzq8RwE=;
        b=mfujJ3zNGBZDosrFuwinvy+HgxgY112Rf102scEyMk59yXMOafXzNTCd0O3shWDfbq
         02BQf8VMaHooazMGr6c7vKe5zXOakg07QnmeTJF0KqG3JijQG61/SNtekFMCaKnYAlWK
         fAD+8s2byGUmPZNgB4BiK+Daq/TkYXTCtPjewEwcDD5C9odZu65AOeV9i7k8R9UUYGhq
         8ftI6ZFtpHDI5/jEgj0pEYum7F01bR4uZm3KJpSiKIYozGmGu47PLO6hPasW/zhcPdJy
         F+paQplLSOZs16v+Y6bcGY2H49ofvJAs3NSbDQy+NQ6o1eAOtVyV2OAF31BE57WKR7Lb
         iklA==
X-Gm-Message-State: AOJu0YxPHvHKD7AKZkA0ueSo9QRDkug5XOKpxIwhrTmR0Vf1Zvq+ryDb
	EHFTmy0FPYSEt6FRY6xLWaGfNg==
X-Google-Smtp-Source: AGHT+IHPP+/pDFxlh9Psi/Jca/likZzzh/njk10M+c59wDGroA/smDDkbgNQyV6CWfAIY9RQJ9LQTQ==
X-Received: by 2002:a05:600c:474a:b0:405:3924:3cad with SMTP id w10-20020a05600c474a00b0040539243cadmr1830807wmo.15.1699440242620;
        Wed, 08 Nov 2023 02:44:02 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id fj12-20020a05600c0c8c00b004094c5d92bdsm19377377wmb.31.2023.11.08.02.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 02:44:02 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Lee Jones <lee@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-serial@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 02/17] dt-bindings: i2c: exynos5: add specific compatibles for existing SoC
Date: Wed,  8 Nov 2023 11:43:28 +0100
Message-Id: <20231108104343.24192-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Samsung Exynos SoC reuses several devices from older designs, thus
historically we kept the old (block's) compatible only.  This works fine
and there is no bug here, however guidelines expressed in
Documentation/devicetree/bindings/writing-bindings.rst state that:
1. Compatibles should be specific.
2. We should add new compatibles in case of bugs or features.

Add compatibles specific to each SoC in front of all old-SoC-like
compatibles.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

I propose to take the patch through Samsung SoC (me). See cover letter
for explanation.
---
 Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml | 10 +++++++++-
 .../devicetree/bindings/soc/samsung/exynos-usi.yaml    |  2 +-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
index 3e52a0db6c41..c1f5d2cb7709 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
@@ -25,7 +25,15 @@ properties:
           - samsung,exynos5250-hsi2c    # Exynos5250 and Exynos5420
           - samsung,exynos5260-hsi2c    # Exynos5260
           - samsung,exynos7-hsi2c       # Exynos7
-          - samsung,exynosautov9-hsi2c  # ExynosAutoV9 and Exynos850
+          - samsung,exynosautov9-hsi2c
+      - items:
+          - enum:
+              - samsung,exynos5433-hsi2c
+          - const: samsung,exynos7-hsi2c
+      - items:
+          - enum:
+              - samsung,exynos850-hsi2c
+          - const: samsung,exynosautov9-hsi2c
       - const: samsung,exynos5-hsi2c    # Exynos5250 and Exynos5420
         deprecated: true
 
diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
index a6836904a4f8..5b7ab69546c4 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
@@ -155,7 +155,7 @@ examples:
         };
 
         hsi2c_0: i2c@13820000 {
-            compatible = "samsung,exynosautov9-hsi2c";
+            compatible = "samsung,exynos850-hsi2c", "samsung,exynosautov9-hsi2c";
             reg = <0x13820000 0xc0>;
             interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
             #address-cells = <1>;
-- 
2.34.1


