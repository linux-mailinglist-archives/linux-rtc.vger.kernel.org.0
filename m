Return-Path: <linux-rtc+bounces-5745-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EC4D194DC
	for <lists+linux-rtc@lfdr.de>; Tue, 13 Jan 2026 15:08:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED4EA30A28E8
	for <lists+linux-rtc@lfdr.de>; Tue, 13 Jan 2026 14:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E83FF392B81;
	Tue, 13 Jan 2026 14:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zVExJH6/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DFF392836
	for <linux-rtc@vger.kernel.org>; Tue, 13 Jan 2026 14:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768312999; cv=none; b=GaR5ng6UnIETwbJxMeMvSCXywdUbziku5Th2EAr2kJeckbBwr/KXu3VghkbsgsR3RGqdzf4vH49I7xC5s+9hKpKvqdUX/PVlqCgjcH9GsmuYEesAfwUlFWQDKe/wOSnWZud/tNWCpuHlnAUNZ+V891BfozOmHTuLsKIvqCDwAgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768312999; c=relaxed/simple;
	bh=AjcBVqaSwngnU7vWvCLDzdROI1QNyjFRZt30RDyeG1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mIXX1EIqFWwppRVEplRaXGguUsW7s89/5006ABt2Qhcpl5WPF0366RKA50bilB9Kd701MDNDOJTyAZNr21MeR0B48CQkk0aRhDY2e8ZwBfiPmKiHoj9/Xw/BT/kZVnSvYYY4qy+NrsRWfLdpFwXrPnoxxcVJgtQZhKPV/z4+L5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zVExJH6/; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6505d141d02so12122844a12.3
        for <linux-rtc@vger.kernel.org>; Tue, 13 Jan 2026 06:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768312995; x=1768917795; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u5Qwb5fmkXxIaTr5x+YXiqZotS/TDI0WvSzgONSjKHg=;
        b=zVExJH6/NTmHWb4z80CXbbLMphVYtGX9ea5Ey0mBxeMxMsChAdJtS9GmO1NyvFNbJR
         j2sJsQ6ujlHeGVVlHjcto4EOZAgYxMtAfCbE2HDQ7JSAksPn4MNNjy489j3c4257/6vG
         /yG8G3CZtSxgXOgESwMAUE+t4c3ZbUHBp+OQgOMs7G8Z98JVwzrrDD9R49kWBaaC+iYc
         f3e9RB65WL4Rl0GhYKzjQbiTgYhbvJhnLRZU1QW43gM8k8NWxOP/NWu55bwWpZpTChKy
         2oT96Cm9oDaZqH3ZaOZTcCJZCMJyPgSDrAhavQYZFhX/AIoB56KWS99w0E83NzRL07K9
         FH1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768312995; x=1768917795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u5Qwb5fmkXxIaTr5x+YXiqZotS/TDI0WvSzgONSjKHg=;
        b=KvYISMnsxnK6ouKLFNbt3x6J2uueWweC6jG7nuh7Ce3TQz+g+Ca1Ed1aIdCz8HGQ03
         0TeFWWonQxJsacMv8J9RBBlKRIBqxK+v7FnLs3RVoZKfEzj0QD3ct1BRX0LhE9b/YdMg
         c+V3t5yywcMcDmMGbkaTm2a+ID95VLJix3WDP2TMaBX0grNtVdK2sHBaa5W8kFENFsS5
         JcMNJTBrBx+yMNkrNJrYBZ8y8yO0GaZNKsSDIGDWSgg1M3/3dATnAM1ZmJPZrReDLf3l
         FzCd1gYcckIdSHYhxoqtsDjBjvX8MEYI6TO2ikh/JXHvQBlg23l1T8mqRGoupIM64tmi
         tvnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdHxh+/bVqgFnJu+ymghK0jq+0cZk6yasRIAxCZh9OuoVG6XIZGTCbVviuIE95xAEW8xW0WP3Z3AQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCicJesK3bfRUcVK/SqzNpyY3g+GCCzHa76qCNpzWJHUqJ/tiT
	s+yJfUa3S6CbVwyIR8bh0fQrUoqS/qQj3/3G7Y92MSiVYMNkNzdz7qQdjrXLgOulX0Y=
X-Gm-Gg: AY/fxX7jSI7UKxR3Wz9snLrFGzZlzII8GVBpdYVyrGPKBEd372fuIb/3SHCJT58fve8
	0xte3WOH5LL/No+khFUznnUvKQ1H8MYNAjbF5rUGYwMwp/nnXNBqkkdkA5EtViOI3c10CsHtFuQ
	lxvq/QDCZfUSB0ESvKcjJGzx3nlObSkrcEUn1CeGwAE0SvUDoj2abx2WuEvhCWiNmlkdJqiWbLf
	13+pTC0KxrXsPyeUfLstTz6lxsqU4v8Jf5ijWt/7VUOplVLKHpWALuCeCofIYO5kF6/nuL0S/St
	x4xxKpLZsL7r+bj9ehikumWVfuhZFcYtXannjIwwf/ztY5/u/brskp5C02Sm4duPUDpOv6iSiWj
	24kRJWTSZR3j8i4jutbF4NMk49+U6r5nteUKFOMKhvFUnmZBmyAxXRiUBKYfhcpYQ4CqiOUR7RJ
	usJFzCUZ22W2g1iohDpAL3+zCd6mZhn1n4TTptXEysBMHtOD0hoZUDxSMEMt+O/0Kx9PkQYWBVk
	0jwqw==
X-Google-Smtp-Source: AGHT+IGD5Nz5s9REDbdCYuNAnZ1go2Ngvk7Gzz33zgEgVPupf8AA6b4vmxIJTcTUNUBnRLOq0woxNw==
X-Received: by 2002:a17:907:97cc:b0:b87:3809:6982 with SMTP id a640c23a62f3a-b8738096f23mr258296666b.57.1768312994526;
        Tue, 13 Jan 2026 06:03:14 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf65c07sm20139157a12.23.2026.01.13.06.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 06:03:14 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 13 Jan 2026 14:03:12 +0000
Subject: [PATCH v3 2/3] rtc: s5m: query platform device IRQ resource for
 alarm IRQ
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260113-s5m-alarm-v3-2-855a19db1277@linaro.org>
References: <20260113-s5m-alarm-v3-0-855a19db1277@linaro.org>
In-Reply-To: <20260113-s5m-alarm-v3-0-855a19db1277@linaro.org>
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
2.52.0.457.g6b5491de43-goog


