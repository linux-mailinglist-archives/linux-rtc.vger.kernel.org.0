Return-Path: <linux-rtc+bounces-232-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC6E7E53DE
	for <lists+linux-rtc@lfdr.de>; Wed,  8 Nov 2023 11:44:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 722FFB20FBA
	for <lists+linux-rtc@lfdr.de>; Wed,  8 Nov 2023 10:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5273512E78;
	Wed,  8 Nov 2023 10:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Psapt02Z"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE97512E60
	for <linux-rtc@vger.kernel.org>; Wed,  8 Nov 2023 10:44:38 +0000 (UTC)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB32C26A3
	for <linux-rtc@vger.kernel.org>; Wed,  8 Nov 2023 02:44:37 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-32faea0fa1fso375364f8f.1
        for <linux-rtc@vger.kernel.org>; Wed, 08 Nov 2023 02:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699440276; x=1700045076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGiEI+OsEJo1M0u1Cd6qitBsDMBm2mmYId37rcw3fhE=;
        b=Psapt02ZaVLYsotjjTD3flBAqRFY0KEBdrfcegaOovtOOXrzFO+KY8ERw1j9pOotqA
         FiqBSylaG1c3YrVAhmtRcDO/jNV3aDi8brvU053zkAUutA6JjFmXbNKOLhmJZdNHF0hp
         a0uzHxZjXSywAjad6U0RSLJIvuI4FXbiN5OYGVrfnkXGyqTvfOhEhUKZPcUhDxCor82q
         Vq9L+XnHYKeZwAZeTBnM9oI3wqfLhn/ER/0Cias06jSUMDSJcsdvDWOwJeuRMgr80wDh
         WH3QP2IkbtlJhcjB8sxFZVSfJbIt2vIcPkPWjtelwWizbj7igEJgYCAxAYKEMgS5ZuKy
         cXvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699440276; x=1700045076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fGiEI+OsEJo1M0u1Cd6qitBsDMBm2mmYId37rcw3fhE=;
        b=HRpe4lndWIc7NQaSJzELXOwzttq4jmigakDQpNTr8F+/tAK+xqsF65kX2EUePjZudV
         gQq/gGjVngSVgQ75oIU3dnkFLCjHQIGB4Ex6FhL5H5NA27C0uB59VJeyBwhMrEe0gm68
         z4jTxoTamHxNALr4GaWcgJVgOgTyjj/F64q+dKL4kCQTnxsnmhkGGtNNpZ/W4MYHLiw9
         Ry+xbra0e8vbsHkZab3aybAO1X9+YXak62ZqBrO0O7NMi5Q9VAUmfZpDWQO0/fJbOvNB
         CbUMvyqtUrtTo5IJGlycs3KaG8mmzF/EqpcGZOVIrH+d3FPJWtCNn6F8ZjayabsZly7Y
         GTJA==
X-Gm-Message-State: AOJu0Yx3VD33tXUdg3vsEpbY0O5S6uWfKXF3SGXAGhyRWkU1LJLa+AtD
	7zt24/JNJQs1kkA/ZLLOGcxzMA==
X-Google-Smtp-Source: AGHT+IH7MQXw4E1mPFEKg813JtQdA84Wn0PvEKQEX8huqjOTZRExGYnzsA13byMaAL83CD1YOh5HLg==
X-Received: by 2002:adf:fd09:0:b0:32f:7beb:d009 with SMTP id e9-20020adffd09000000b0032f7bebd009mr1610826wrr.17.1699440276267;
        Wed, 08 Nov 2023 02:44:36 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id fj12-20020a05600c0c8c00b004094c5d92bdsm19377377wmb.31.2023.11.08.02.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 02:44:35 -0800 (PST)
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
Subject: [PATCH 11/17] ASoC: dt-bindings: samsung-i2s: add specific compatibles for existing SoC
Date: Wed,  8 Nov 2023 11:43:37 +0100
Message-Id: <20231108104343.24192-12-krzysztof.kozlowski@linaro.org>
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
 .../mfd/samsung,exynos5433-lpass.yaml         |  2 +-
 .../bindings/sound/samsung-i2s.yaml           | 19 ++++++++++++-------
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,exynos5433-lpass.yaml b/Documentation/devicetree/bindings/mfd/samsung,exynos5433-lpass.yaml
index b97b06848729..f154103f32cc 100644
--- a/Documentation/devicetree/bindings/mfd/samsung,exynos5433-lpass.yaml
+++ b/Documentation/devicetree/bindings/mfd/samsung,exynos5433-lpass.yaml
@@ -85,7 +85,7 @@ examples:
         };
 
         i2s@11440000 {
-            compatible = "samsung,exynos7-i2s";
+            compatible = "samsung,exynos5433-i2s", "samsung,exynos7-i2s";
             reg = <0x11440000 0x100>;
             dmas = <&adma 0>, <&adma 2>;
             dma-names = "tx", "rx";
diff --git a/Documentation/devicetree/bindings/sound/samsung-i2s.yaml b/Documentation/devicetree/bindings/sound/samsung-i2s.yaml
index 30b3b6e9824b..f45f73b5056d 100644
--- a/Documentation/devicetree/bindings/sound/samsung-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung-i2s.yaml
@@ -44,13 +44,18 @@ properties:
       frequencies supported by Exynos7 I2S and 7.1 channel TDM support
       for playback and capture TDM (Time division multiplexing) to allow
       transfer of multiple channel audio data on single data line.
-    enum:
-      - samsung,s3c6410-i2s
-      - samsung,s5pv210-i2s
-      - samsung,exynos5420-i2s
-      - samsung,exynos7-i2s
-      - samsung,exynos7-i2s1
-      - tesla,fsd-i2s
+    oneOf:
+      - enum:
+          - samsung,s3c6410-i2s
+          - samsung,s5pv210-i2s
+          - samsung,exynos5420-i2s
+          - samsung,exynos7-i2s
+          - samsung,exynos7-i2s1
+          - tesla,fsd-i2s
+      - items:
+          - enum:
+              - samsung,exynos5433-i2s
+          - const: samsung,exynos7-i2s
 
   '#address-cells':
     const: 1
-- 
2.34.1


