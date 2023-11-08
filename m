Return-Path: <linux-rtc+bounces-231-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A08727E53D6
	for <lists+linux-rtc@lfdr.de>; Wed,  8 Nov 2023 11:44:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFAF21C20B1A
	for <lists+linux-rtc@lfdr.de>; Wed,  8 Nov 2023 10:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BDFA12E5E;
	Wed,  8 Nov 2023 10:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CmtpJmVl"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A953812E60
	for <linux-rtc@vger.kernel.org>; Wed,  8 Nov 2023 10:44:35 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87FC225BB
	for <linux-rtc@vger.kernel.org>; Wed,  8 Nov 2023 02:44:34 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40839652b97so49778065e9.3
        for <linux-rtc@vger.kernel.org>; Wed, 08 Nov 2023 02:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699440273; x=1700045073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tkEvXWcKUOWY7MDhsApmZqSz9A9BrLzom2ZllyUYJqs=;
        b=CmtpJmVlCM4syMknWUpWHAKoK/hAaKOC7nKz1YdbPATq3QoV5ZniZtdasH9YXba1d3
         Oidzw9HrSEldko3wgSnvsglDZmh/S1DyfTYwMI6nJvXs/63+iBbSI8rg3FvcOfqUeaZX
         JIf1rA84zGmA9G/OwOoboCT/BBFUKfxnqHt6fdux5mtz3yIzNyKcCzlTJZYqPCagBEeF
         ifRDedM4yOl20AUWk/bM1L28QOVVQMkpfyK+PvASkpWnKTClenEnkZhrwD2P5l7mUpPF
         QyzRxHYmIKmbwpQopmL1SHTzW84630oij9Enqbkhkb0HVzG+NANHwgLJ26/EkiCBSbMd
         BfxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699440273; x=1700045073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tkEvXWcKUOWY7MDhsApmZqSz9A9BrLzom2ZllyUYJqs=;
        b=hRvYI8ipVPqaoqA8+zSZGb6vjJ8DrJEJzD3xt/X/Vhx+0g95GXtlr/RzgJdy859ZXy
         JM56RFSkOT2cNN9Ug7f/9NZKZu/jwRaWmBnjyDr7/f19m11j3DbDsoX1IdNjONCkuum5
         iiW883EHQVYrJlnZf8lk8jT8bjn0AHU9PobgHS/zdBx2fVijNzBOyat5vfuqO7rJo7TH
         JR71bdcfOJa9TxUn7BTU7/RmH1/BF1ztSxkD/VaLegrxPctNqml+yGEnAvxtEMX8TFZp
         Te0qAziNtHgOzN8xQHcKVpbyp/F/3/5Z/fTkWdiJG5R9yyavzNyQc5s1gxoroynlSYRX
         9uWw==
X-Gm-Message-State: AOJu0YzePyHlkKaZywx5ZkNItZOOc6JN0Dz+1ETsFF02LABMwMCtE9Hc
	mtsrO1B/fHkeyPqVCRoI8MXDHQ==
X-Google-Smtp-Source: AGHT+IGkZ0Z/MGipPYgtciee5bgssBjyKrV3vFjgQq9aKLpthGkLg1gMgK3YX3rqUB7np5d3fs06BQ==
X-Received: by 2002:a05:600c:4fcd:b0:407:8e85:89ad with SMTP id o13-20020a05600c4fcd00b004078e8589admr1286513wmq.14.1699440272758;
        Wed, 08 Nov 2023 02:44:32 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id fj12-20020a05600c0c8c00b004094c5d92bdsm19377377wmb.31.2023.11.08.02.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 02:44:32 -0800 (PST)
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
Subject: [PATCH 10/17] dt-bindings: iio: samsung,exynos-adc: add specific compatibles for existing SoC
Date: Wed,  8 Nov 2023 11:43:36 +0100
Message-Id: <20231108104343.24192-11-krzysztof.kozlowski@linaro.org>
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
 .../bindings/iio/adc/samsung,exynos-adc.yaml  | 29 +++++++++++--------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
index 582d0a03b814..4e40f6bed5db 100644
--- a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
@@ -11,18 +11,23 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - samsung,exynos-adc-v1                 # Exynos5250
-      - samsung,exynos-adc-v2
-      - samsung,exynos3250-adc
-      - samsung,exynos4212-adc                # Exynos4212 and Exynos4412
-      - samsung,exynos7-adc
-      - samsung,s3c2410-adc
-      - samsung,s3c2416-adc
-      - samsung,s3c2440-adc
-      - samsung,s3c2443-adc
-      - samsung,s3c6410-adc
-      - samsung,s5pv210-adc
+    oneOf:
+      - enum:
+          - samsung,exynos-adc-v1                 # Exynos5250
+          - samsung,exynos-adc-v2
+          - samsung,exynos3250-adc
+          - samsung,exynos4212-adc                # Exynos4212 and Exynos4412
+          - samsung,exynos7-adc
+          - samsung,s3c2410-adc
+          - samsung,s3c2416-adc
+          - samsung,s3c2440-adc
+          - samsung,s3c2443-adc
+          - samsung,s3c6410-adc
+          - samsung,s5pv210-adc
+      - items:
+          - enum:
+              - samsung,exynos5433-adc
+          - const: samsung,exynos7-adc
 
   reg:
     maxItems: 1
-- 
2.34.1


