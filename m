Return-Path: <linux-rtc+bounces-5583-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C14CC7326
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Dec 2025 11:59:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1274231E936A
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Dec 2025 10:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3959D2DC792;
	Wed, 17 Dec 2025 10:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZZCbCOny"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC3830F7F6
	for <linux-rtc@vger.kernel.org>; Wed, 17 Dec 2025 10:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765966261; cv=none; b=DbQ9BBLlr5jCxXXN80bTLc6hQCTZuHhwdexdiYYGQDQnL1P7GueNvzH/dNyyrqBHPAF7Ge0NB5PXJqKd1l9b/HMegumuJee3itQeKzOEzXDGp44U9Yj5Qow4tT05tt6BIzW80A54ittA1SZsfS9w9LL24XrBYpmS6lYT0K9nfyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765966261; c=relaxed/simple;
	bh=H6IMjnPI8ZwYq64P5YA/CKhuGWLFID4mb3NAeF/Wkyc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aDHjLobJlfIIee7/NgrCM7ShEi/fsM+f1gBT96fqODVzBrHELXL7/oJjkETeGpsz08Qfp4hFiT226ONJ+a1r4y7TmGcsakbhrHVQe9CAjkLk1oPAXVBAvGdroE/HFeQxz4O/XMLrkBSyS0G9DrjGaMErJQel21VMO1YT7Yo2lBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZZCbCOny; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so956010566b.2
        for <linux-rtc@vger.kernel.org>; Wed, 17 Dec 2025 02:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765966256; x=1766571056; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eXjtVLazU4FisU7iYDrCs/cvEQo0Kb5lMS6lWuXDtFU=;
        b=ZZCbCOnyoob/cYwp4TjRRXMFpsBeO/8susIx1iu2K3LQO7UFhY/fyIMEdyzZzkE5xU
         VU9X651P/DEne1HlKkZQOqfkhgK35p3r07lOLDkSyVmI2WsdXB4W0WLj9XCBGLDsIxFr
         D02RrChZJr20pClz+h7E3bqNXSo3BCneelwF+Gtbt45JyiBC2QXdYVKaqxnxKnMAskY+
         eMhEao0N2TpJrbElvQ0yxZkn1k2ZiNPUQu8dqv+vWsvE8fq4qPwwrFpht+rtNjma14tI
         nfAmUYnvvYqsq3/amO/96wg/boz3t3abJUgn6RP2yT8Ir9xRNjG0ThD7R6KqB4QOUL5D
         Dj3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765966256; x=1766571056;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eXjtVLazU4FisU7iYDrCs/cvEQo0Kb5lMS6lWuXDtFU=;
        b=oylUa8aAMYoRJTLuYiseF34tRhLu2vSmLYpkY08bpzGfBFet/Hb59/vWOxcefCters
         SV4RYbvPZO+p/kEi7J+y/H1qV3zeEIoh2db3of0Gv4aB6dU6Xdt/XuQ6wUyyKmSZKOxg
         LCeDdp5BlynhKXRr1mBc1kl/AffV1waBcs+0loD65KC8ycyAK1Ap0z50SmtC99AOjrVh
         QsD4CTSR4C7OUcVWSZN+j96dhz9FTg+TD7Xrbm/km+TDgd3Y+eEc9z5JnED2HweyNSDy
         xyOQhhANdBkoaU/omLQ6TwiL8DtPWDfDy4bIqsXhKle6lJMgrgFCvlG1R0gxDTzZ02b2
         fjBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiNE75/AKiTK158W9u+44li1vbsSp6VqjYNUqtajNdKNfBPVvMfBpobyNfbzBibCw90rTL3HZd4Rk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe+cYcNzlZnJ1THyJ2jMYrPQuH5dTsJoBfaIrpRQEZSXITj9jx
	8Rb9g1ZHoCejfq0pJua8Io8bFRYuZz5TBg8N6Yv9GR4s3j2EaDZtuW1+sB8OCoLPjpU=
X-Gm-Gg: AY/fxX6JugutDCqhh6szaW6u8ze1/6/32JXBB3LPIWY+ELUJvveWQqV2/Adkv1nAN7T
	OMZJrgeKARr+lY0M+Mzhws8lVK1jYxZd2h74SBbNOnE3bQGbTxrQjDDMVRZ1zyZwoFcPUaPHfiY
	46T7tNId40jr0X7VBtWiduCA3ovuFrJDHrfh8tjSxRySkxtR8vpsdPZ9/M6LcryoJuHkhZP4GO0
	IeGNj/yrJnj2YDzgEGKc6bWEHhZGT0WRnM45IdI5vcAas+VsC9y5hVpMKmhFY3O8RQNOJoEAUii
	6tLrAeKEsL1EiTz51txmeLwyOKdwo5Ztc2OBAV7NK1hBpc//uzO5grUP1NBGBt7HCK6hzMwh0BH
	6mB2WUNaORdpKHQnaMGoEpu0ucMM0RTBcf/2MrBd7DoenDKbWP34z6Vp7y1BNoctIML4dj19KMT
	XFzJlHZAnUB5ngcNFwzJlPxtgnBGrnLn9rmD3ut1JKtPLnmQENpLZ5cUAR4TPFceyE0n7dxyOcU
	qgtdw==
X-Google-Smtp-Source: AGHT+IHyMM6etwDYB06WTSrwaBUmwLHwdFRBAH3MZ0Riio860UC6heeeZnSPn7h1ka6K1Zx6Y3HXtw==
X-Received: by 2002:a17:907:6d24:b0:b7a:1bde:1223 with SMTP id a640c23a62f3a-b7d23ad88e6mr1656378566b.64.1765966255551;
        Wed, 17 Dec 2025 02:10:55 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b3f4f5a22sm2043811a12.9.2025.12.17.02.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 02:10:55 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 17 Dec 2025 10:10:49 +0000
Subject: [PATCH RESEND v2 2/3] rtc: s5m: query platform device IRQ resource
 for alarm IRQ
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251217-s5m-alarm-v2-2-b7bff003e94c@linaro.org>
References: <20251217-s5m-alarm-v2-0-b7bff003e94c@linaro.org>
In-Reply-To: <20251217-s5m-alarm-v2-0-b7bff003e94c@linaro.org>
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

Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
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
2.52.0.351.gbe84eed79e-goog


