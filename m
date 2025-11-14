Return-Path: <linux-rtc+bounces-5375-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 46992C5CEC0
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Nov 2025 12:48:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1373D35A7F2
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Nov 2025 11:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D9BC314B95;
	Fri, 14 Nov 2025 11:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pW0YhpL1"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A187311969
	for <linux-rtc@vger.kernel.org>; Fri, 14 Nov 2025 11:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763120848; cv=none; b=MZubooATQyxei+Uko7DLumG4ETI/3hgG5rSq4hGj7tMdF6CVtzehvgm67f7IO1Cb/ATr1+ytZ3myVtrVvFYwAzjN8eXv++daT500gFCXfZGKwJ5p2/K30gn+jobqtAdHRmEh+6aQkQMfMIuAqBEgIJPyUbskGgff4UgeAJ8omoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763120848; c=relaxed/simple;
	bh=epAZ4I9cYfPQx/rUTryoD/OTj8bRWME5BL2aIftN33w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NDCxFlXVxLk2YF8uJ+GpeylTjj3JK3KikI5B8z+nJ5h3imazW74rn7uf4fKXuMiyOXpHDupHI34g2sEZWvoxoUzD9DaAdIzvV1FuvmWwmfBTN0wgURZ++nVTamszf7gR4mTuOwZ/vy0SLtKnZC84u2AhwMlj3fDEqA06SmLOkdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pW0YhpL1; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b3e7cc84b82so303908266b.0
        for <linux-rtc@vger.kernel.org>; Fri, 14 Nov 2025 03:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763120844; x=1763725644; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c6vZLQTlhnGkC3V5b/JVRIOiHJLrOs5aXHUloOcvWJw=;
        b=pW0YhpL103/o2GR7CS0MMNel2ctMES/eyIabp0I/4ngyH2tOPc0tBJs0mpb8whmDg4
         sCFtij8SYc4Lkyw1MTCYGwl8jlqeZd4G9V78tPO2MCOIXyuD3sZwfLtVVy944OPSdLl+
         a2sFpgnHrOaG8623gqvl2UbnWfTU/F/SzZbdd0hgCWwg3f9tTkywBrGS2TMTgJp1TLSD
         Fot05zonij7pfQDPU/DC07WBoceHj4TunKNL5AnRcf1ielK4g9CpBuyh7u5z8wZ0t+Nc
         2Tb/9iDGgN9W8t7nYM2uBH4K0Dx//97sQauRpwVyLGSXXP3nv6MRIvRoqtgp8Fh00A+B
         vwoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763120844; x=1763725644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c6vZLQTlhnGkC3V5b/JVRIOiHJLrOs5aXHUloOcvWJw=;
        b=Gkw8Vo0Dmm2ELrIeAT+G/dBkrQD1pG+7iZ0fskZacUCcfejdssZir0MTBn9qsTPnyw
         NTZ+zmn7K3sAEQHsUc5UqrvFv8KCDmS8Yl9Tdkf1QwqP9+iYgJKtGrPBBwpWf2CkRDt/
         lf+Pxs6bCYRmVvnVqyrfy9Jp12h+v2GBBwvOg4yZcozQVne/FOviGUW+uW/vVmpWM2lJ
         xUz+8dsKsivcS6XQrJzmWsDLrJPxhqwJ2O4lvFq9MA4iRLQfQHkbCHbwGQDI/YKXiQjz
         k6yx1CT5W3EbsIKAFzCa3i4IObiFnSQXQSl41G7kcpNHifK3+B5VMudjsBiSQBjCYDcd
         sPbA==
X-Forwarded-Encrypted: i=1; AJvYcCVZKDSvTKYOioWFCDgFANTt7jfgzJ442WywSbjLcxeGJd2Z8Nj90vmbYqlwJL9bPzUheJyE8BLz2j4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW87JZ6q9g8vKQ+EZTXSaojJBvEV+UGMAP8br+a8F1cgCkNrct
	L6OPtaimTayZIuVoydvZGvlKAXPstBQNzzHo4KOE10AcV3gM+Lpjv2pJfJlXu87UCDc=
X-Gm-Gg: ASbGncsMyAEdIRmSoV/440va9pWdiemGAdjbp+7OjFK3d6m9K9Ez3HPG1HJRcBrM4oM
	Ieqq+JJqxmAEZx3BuXlV3y0QWsVeB3gXZGz/vK32i2+MKDvR1lvWuDRCNE0ZAiTqmHi3bSARRbo
	k8epmWATMnNEcvAJmGsO7mZO8makK+0lA2DUNDxN4ccJSEXpG7324Fv7fWSy+/Q9nbb5dXMvHtn
	pmDpcJ8q4Yf4t7hNNX622/1CMvSfAboLRF69d4QC4cWEFyLdnYxFjnZ6VNaRaPQoHPZ5YZ4CLek
	AZ+P5gbmp2XjNOoR7sZyyIyDmo3lxJsFEqJAcY9nJn/xt90JOn1b4KCZ9bewykDGsyF/G4McBSo
	WvM4G49QxA+gHhn7RNNSZY8X6gg8W2SDkjofrtrcKUio0J4HryDvIurUS2nMBJxMFvBPZXSbr7k
	povCw/2wb+9Yjs4Hjjnx11a4+ltv4gMeOW9/Sm8PGOOVxrKT0RTS5MiPU93H5NvYwkQvBO9LW+k
	35H3w==
X-Google-Smtp-Source: AGHT+IGWfcAafPJXf+nOG04FI28a638seYLqw5MKkweFunN5D3tFLgI80+YDjWlRRIldJ7pB8qo+LA==
X-Received: by 2002:a17:907:1c82:b0:b73:4006:1884 with SMTP id a640c23a62f3a-b7367b8d999mr301251266b.37.1763120844396;
        Fri, 14 Nov 2025 03:47:24 -0800 (PST)
Received: from puffmais2.c.googlers.com (180.192.141.34.bc.googleusercontent.com. [34.141.192.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fb11d94sm372950166b.30.2025.11.14.03.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 03:47:24 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 14 Nov 2025 11:47:22 +0000
Subject: [PATCH 2/3] rtc: s5m: query platform device IRQ resource for alarm
 IRQ
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251114-s5m-alarm-v1-2-c9b3bebae65f@linaro.org>
References: <20251114-s5m-alarm-v1-0-c9b3bebae65f@linaro.org>
In-Reply-To: <20251114-s5m-alarm-v1-0-c9b3bebae65f@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 Douglas Anderson <dianders@chromium.org>, kernel-team@android.com, 
 Kaustabh Chakraborty <kauschluss@disroot.org>, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The core driver now exposes the alarm IRQ as a resource, so we can drop
the lookup from here to simplify the code and make adding support for
additional variants easier in this driver.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index a7220b4d0e8dd35786b060e2a4106e2a39fe743f..c6ed5a4ca8a0e4554b1c88c879b01fc384735007 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -15,7 +15,6 @@
 #include <linux/rtc.h>
 #include <linux/platform_device.h>
 #include <linux/mfd/samsung/core.h>
-#include <linux/mfd/samsung/irq.h>
 #include <linux/mfd/samsung/rtc.h>
 #include <linux/mfd/samsung/s2mps14.h>
 
@@ -683,22 +682,18 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 		case S2MPS15X:
 			regmap_cfg = &s2mps14_rtc_regmap_config;
 			info->regs = &s2mps15_rtc_regs;
-			alarm_irq = S2MPS14_IRQ_RTCA0;
 			break;
 		case S2MPS14X:
 			regmap_cfg = &s2mps14_rtc_regmap_config;
 			info->regs = &s2mps14_rtc_regs;
-			alarm_irq = S2MPS14_IRQ_RTCA0;
 			break;
 		case S2MPS13X:
 			regmap_cfg = &s2mps14_rtc_regmap_config;
 			info->regs = &s2mps13_rtc_regs;
-			alarm_irq = S2MPS14_IRQ_RTCA0;
 			break;
 		case S5M8767X:
 			regmap_cfg = &s5m_rtc_regmap_config;
 			info->regs = &s5m_rtc_regs;
-			alarm_irq = S5M8767_IRQ_RTCA1;
 			break;
 		default:
 			return dev_err_probe(&pdev->dev, -ENODEV,
@@ -719,7 +714,6 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 					     "Failed to allocate regmap\n");
 	} else if (device_type == S2MPG10) {
 		info->regs = &s2mpg10_rtc_regs;
-		alarm_irq = S2MPG10_IRQ_RTCA0;
 	} else {
 		return dev_err_probe(&pdev->dev, -ENODEV,
 				     "Unsupported device type %d\n",
@@ -730,13 +724,14 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 	info->s5m87xx = s5m87xx;
 	info->device_type = device_type;
 
-	if (s5m87xx->irq_data) {
-		info->irq = regmap_irq_get_virq(s5m87xx->irq_data, alarm_irq);
-		if (info->irq <= 0)
-			return dev_err_probe(&pdev->dev, -EINVAL,
-					     "Failed to get virtual IRQ %d\n",
-					     alarm_irq);
-	}
+	alarm_irq = platform_get_irq_byname_optional(pdev, "alarm");
+	if (alarm_irq > 0)
+		info->irq = alarm_irq;
+	else if (alarm_irq == -ENXIO)
+		info->irq = 0;
+	else
+		return dev_err_probe(&pdev->dev, alarm_irq ? : -EINVAL,
+				     "IRQ 'alarm' not found\n");
 
 	platform_set_drvdata(pdev, info);
 

-- 
2.52.0.rc1.455.g30608eb744-goog


