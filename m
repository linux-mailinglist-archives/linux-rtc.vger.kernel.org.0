Return-Path: <linux-rtc+bounces-238-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C27297E53F8
	for <lists+linux-rtc@lfdr.de>; Wed,  8 Nov 2023 11:45:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 655F41F21B3D
	for <lists+linux-rtc@lfdr.de>; Wed,  8 Nov 2023 10:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B291214018;
	Wed,  8 Nov 2023 10:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W2x3r7qu"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C5413AC4
	for <linux-rtc@vger.kernel.org>; Wed,  8 Nov 2023 10:45:01 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 657422D7D
	for <linux-rtc@vger.kernel.org>; Wed,  8 Nov 2023 02:45:00 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4083f613275so49459515e9.2
        for <linux-rtc@vger.kernel.org>; Wed, 08 Nov 2023 02:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699440299; x=1700045099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQ+G5s8RPHyPJsrBFGNZYZXOAO3f3klrHmjNTSjaK6I=;
        b=W2x3r7qu6kvAoa6YNUPIxT0E6KPjTAYklsVnKTofKbvAg98XR3knJImbMSgo8hvKwD
         8LPnlco7wqZc3KdQicPsuekNV4vgonbicgUT/H53JS0/P/QvrNlvG1eSi2OePM7I5hBi
         K0CXhuHss8MvHXmw+sfOkMh3fetSIT7KhOE1xg10HLX1eKVCxy5o01+PWijCDAsNkCCh
         t9awT+KNIKzM6znauX5Pccw990RIB6oZWUMb4DZb1vFwumRUWWCM0QtHALYoYeI0gZBZ
         e3Z0tjmeqCngooyJFnIvo8IW24JaVkqJVRV34uVnhTkFDRByRlLirP6uwwJcpumE/8k1
         ydQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699440299; x=1700045099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQ+G5s8RPHyPJsrBFGNZYZXOAO3f3klrHmjNTSjaK6I=;
        b=e8pymKgKYllYgjHnquIF+QpEb6D7iFy5+hUDfOjRIQKJQFoaTDUdzmZJES64QLMNPh
         +Fd5iZXeUYK990czh5ph99SI2Nm4FWfvTCJNUniIqfgGnd9Llu0n/stYWK2M4N+I1+di
         948Nnaua0NYj/FdBOykPBkMdkauMA8++QdvknbMOO+mNVVPDLqpZt6Ze9r2uEQffUG79
         Db9032iTpG2btNYJuUUnnUmgiY/Y95O1caWMHE/YMOJ4hjUFf0ERhQfLLsTaBWq3od2S
         0itqKcdt6+VoUuzCvZoWynuezzXCBZ/LdqC77IKwIsiU1OBCWOWIf9GKbXUp0ionzabw
         1okw==
X-Gm-Message-State: AOJu0YwPBiQGIIPvuIRB2FHkn1zcvegiby6FKkoot7DhJj2D18EQ1AEz
	OFCAEREvN8FcU3pPjSU1KJW6Jw==
X-Google-Smtp-Source: AGHT+IFp84xxfo5QRAF0wCrKdORFx4iJmSqJoRpd/lOk7txHM8S/A55ohRCToPiG6pukjYjCgaIN3w==
X-Received: by 2002:a05:600c:3b15:b0:405:95ae:4a94 with SMTP id m21-20020a05600c3b1500b0040595ae4a94mr1341542wms.5.1699440298865;
        Wed, 08 Nov 2023 02:44:58 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id fj12-20020a05600c0c8c00b004094c5d92bdsm19377377wmb.31.2023.11.08.02.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 02:44:58 -0800 (PST)
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
Subject: [PATCH 17/17] arm64: dts: exynosautov9: add specific compatibles to several blocks
Date: Wed,  8 Nov 2023 11:43:43 +0100
Message-Id: <20231108104343.24192-18-krzysztof.kozlowski@linaro.org>
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

ExynosAutov9 reuses several devices from older designs, thus historically
we kept the old (block's) compatible only.  This works fine and there is
no bug here, however guidelines expressed in
Documentation/devicetree/bindings/writing-bindings.rst state that:
1. Compatibles should be specific.
2. We should add new compatibles in case of bugs or features.

Add compatibles specific to ExynosAutov9 in front of all old-SoC-like
compatibles.  This will also help reviews of new code using existing
DTS as template.  No functional impact on Linux drivers behavior.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
index b228cd7e351e..417aa56a81f6 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
@@ -166,7 +166,8 @@ soc: soc@0 {
 		ranges = <0x0 0x0 0x0 0x20000000>;
 
 		chipid@10000000 {
-			compatible = "samsung,exynos850-chipid";
+			compatible = "samsung,exynosautov9-chipid",
+				     "samsung,exynos850-chipid";
 			reg = <0x10000000 0x24>;
 		};
 
@@ -349,7 +350,8 @@ pinctrl_peric1: pinctrl@10830000 {
 		};
 
 		pmu_system_controller: system-controller@10460000 {
-			compatible = "samsung,exynos7-pmu", "syscon";
+			compatible = "samsung,exynosautov9-pmu",
+				     "samsung,exynos7-pmu", "syscon";
 			reg = <0x10460000 0x10000>;
 
 			reboot: syscon-reboot {
-- 
2.34.1


