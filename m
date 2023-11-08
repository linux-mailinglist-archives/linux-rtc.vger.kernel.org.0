Return-Path: <linux-rtc+bounces-233-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B05F7E53E1
	for <lists+linux-rtc@lfdr.de>; Wed,  8 Nov 2023 11:44:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54DBA2813A7
	for <lists+linux-rtc@lfdr.de>; Wed,  8 Nov 2023 10:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7739212E7C;
	Wed,  8 Nov 2023 10:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EiBfrUd2"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B1813AC4
	for <linux-rtc@vger.kernel.org>; Wed,  8 Nov 2023 10:44:42 +0000 (UTC)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93CBB270A
	for <linux-rtc@vger.kernel.org>; Wed,  8 Nov 2023 02:44:41 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2c515527310so92225361fa.2
        for <linux-rtc@vger.kernel.org>; Wed, 08 Nov 2023 02:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699440279; x=1700045079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eLncO1ADQq/KYbPV1LBS+813XGTk7ajEpj3gEwbCXmE=;
        b=EiBfrUd21IZaF6eVcNL0xmIRkJV/sq/4Lk/RDXWk8gxc6LaEnnRaILWx4D6Mh7cDYX
         +rPBtBlRUyO55Wvf0FMD6MoSbRbOrt0pt2s45bbP/FUB76Rkr8TIr8LvI7MyIyh4sAaq
         0NE+K7lYYKEkfkRhO4XlzfVysjV/ycJFX+kFHpfmLfGHzcsPn3jOxPE/G+EOA1m0HuAD
         smsYSIiVd1pytAVCL4HIjHbDRPSt+lSewvLNear494xDmhYR+RoMXzOgD0oZdVtQ+5Ig
         W1o22vZWGd0+LsgBtJOjGCo12Ho0UhGNHxGWoPMe90E2PJ4GbErAPlpC4m0veTMsJNXt
         btMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699440279; x=1700045079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eLncO1ADQq/KYbPV1LBS+813XGTk7ajEpj3gEwbCXmE=;
        b=UexjlWD+iSoHTCS4qQathtQWiupODNbBqFBhdpOuHxRyM8uV6DCTTgTq4oXU1kRxiW
         3Jy9sVXp5t3wLokNuQig05Hktt9YCoG26HIPC4VZn6wYv5YW2h0q4qeJ54+BVjZI9Eur
         WuiZZ0hR06zZB77Bgk4ALGtJxSLaxDiyFrLa80b91ze/QRlqDXVze8mmJUyS1lmSggt1
         VYbroVU/yJK9wtjZZOpb27morwMBQGcWfzZHDHQk7DU0iz9xOX6Ab3cUsFLRxbLNGDbS
         Od848WVxPLO7YbNQGxxAnKvKfQqPYl5jCDGzS7AXhS3OYpu+ldSV2Nv/8Rtk5JFyraEM
         RR9w==
X-Gm-Message-State: AOJu0YxJWBDl+hcsvcjd/4SCL7DouM8Uz7IymuULP6tzs0Nj/85SX5BC
	sQ9L3fiJFa3bVvtRnJNzp1NgRw==
X-Google-Smtp-Source: AGHT+IE9e7WdZJcWzB5Gf22P43YL/3qsWhZ9UWDtVmtmQ2zCC7QEZqOnQRFgEbbvc33FYHTz/Q1w1g==
X-Received: by 2002:a2e:81a:0:b0:2c5:7afd:75a1 with SMTP id 26-20020a2e081a000000b002c57afd75a1mr1229802lji.44.1699440279685;
        Wed, 08 Nov 2023 02:44:39 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id fj12-20020a05600c0c8c00b004094c5d92bdsm19377377wmb.31.2023.11.08.02.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 02:44:39 -0800 (PST)
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
Subject: [PATCH 12/17] dt-bindings: pwm: samsung: add specific compatibles for existing SoC
Date: Wed,  8 Nov 2023 11:43:38 +0100
Message-Id: <20231108104343.24192-13-krzysztof.kozlowski@linaro.org>
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
 Documentation/devicetree/bindings/pwm/pwm-samsung.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml b/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml
index 2162f661ed5a..89a3875cb50a 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml
+++ b/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml
@@ -29,6 +29,8 @@ properties:
           - samsung,exynos4210-pwm          # 32-bit, Exynos
       - items:
           - enum:
+              - samsung,exynos5433-pwm
+              - samsung,exynos7-pwm
               - samsung,exynosautov9-pwm
           - const: samsung,exynos4210-pwm
 
-- 
2.34.1


