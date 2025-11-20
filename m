Return-Path: <linux-rtc+bounces-5445-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 94629C7499C
	for <lists+linux-rtc@lfdr.de>; Thu, 20 Nov 2025 15:38:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 4BF212B94B
	for <lists+linux-rtc@lfdr.de>; Thu, 20 Nov 2025 14:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 252EF29E10B;
	Thu, 20 Nov 2025 14:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tM7IpI3i"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C4428851C
	for <linux-rtc@vger.kernel.org>; Thu, 20 Nov 2025 14:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763649490; cv=none; b=IZtnxT5wvmHRPuz8DNR9UIQwY5DK0Ny+c5u4hmTa+gh572FKOYmQuTDFv1WM11fD3U3oECJiYxO/JEQmMVbIhkQ37IWe6O+Bi8zc/vo24AKSmqLZPRtjDEcFskt5MOyoTO6RZ/NdDWPExwKD5ftnzS9BKM5eTg7208rK1b/b0Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763649490; c=relaxed/simple;
	bh=T7NQcuSTK0Wgag7FnGB316ybnPYMXfKzLolu3Rg73KQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dti32n3kBSd1AJleRg50IkosMDhibmZkDXi3K+vMK6OZEvPC2z8br7ttJ0WwZUGXRUK2tfdolHRLnvY2TOFvPRD1zydfrQnEB+EElae67Ys43hpqupvaoA7iO8SkaVMXjGi3zDXgrQ5u/T4ktx+pWNx3v82aJ0Zz2ssa4r49Lv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tM7IpI3i; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-640a503fbe8so1597895a12.1
        for <linux-rtc@vger.kernel.org>; Thu, 20 Nov 2025 06:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763649486; x=1764254286; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TKVEwuNeEzYnlKtvmByCf7hR27qjuXrjbBMyGBFxDEU=;
        b=tM7IpI3iTc8e9VR6PlwXY7laJoWAGUkNUUFTnOJA7ksqJ8EyAME0R63q0Ky0YSUb1j
         ttI8hYCOwZx4TP45CaV65CwRuVMtEETgnrUwY8RY+o/jSimtkx+Hu0TuSlME9ZWKVf1M
         bNiG+Kye4mxWEmeu6g/48nzAassEJMX6MqGpLM5heL7PXfOXjzlSWrKgpvLKnCf7Fbky
         DlIRNHZ6cEdRg7AxgbgBnqLnUXfwPd5AtlrYhSUUfq9CQMvEUTNp7K1dWhr69oMIqDZ9
         GpoEteAQVbtxDa7zXSJdCgACeXyEG1u+uNq+wXFBKTd0sIblngj+CO+a+1RNjGvRzKKs
         I0rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763649486; x=1764254286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TKVEwuNeEzYnlKtvmByCf7hR27qjuXrjbBMyGBFxDEU=;
        b=Ti+iqJS3t1r+8ZCDF9KFBAvJxtqCW5Bkl0FetmvfprNze0ZerdWX7t/tmPoWIrtK6i
         7o2Q8gPv6w5T4DlgDkz5cMDAv4ppXQdcaowgyfThxv60XrpxvutI2h3X56gfvefmuN97
         cr0HnpOXswCGJ5E03MdKqCbGT5IChQMgwCiU1eMHFVW80L20JU46SqkelLZFXVf8oYD0
         1pm/t3K8QKgDc1qZYQDLosl++gBAl9X0mQDRvjxUOo1sKpaMJVmgXSyr7UJB3lOChWmy
         V9es3bcJCpX1uCvsK4If4RNdEykBK3yqB8QROfVP2WLvVaAsNzXeE969inUK8d+9uXk0
         I/dg==
X-Forwarded-Encrypted: i=1; AJvYcCX5aAZVZlIWFalQQhQK8dg1w+uRDj54hrTUQzIp5JKzc1Pm+QGClvZUUt4Jw63D8ufBF5iyoxYdxNI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiVuYVMNItYmBxV1dZu0bQ8l8s/QU7XzNKu2TAOGkoJKf2luLX
	aVl/inESCL99Iiz86oV+hFo170j+SqMkdW34B5daW6kvJl4m/Z9Bik3RGBgqJSrYTB8=
X-Gm-Gg: ASbGncsmIBN82yghnbKiULhafU08j2xNF7VN0qXHp7Zqs7+dt9Q+OdYMov1PrFzkUIG
	GcEgG9iyHJyzzn73TMvno7Pqef7/8v82f4ADYrzpS8zUXFBI7Ubv2hG48D3QNn5T29MLo43357Z
	fANcbhqUB+SvwKR7D71v4MKYtESEIRW+4JzGqhM92dao9k2ezrA4S5saxL5ZQ29FaCiwm65vhQ1
	D1iovAI+BpxT3XYpVhDeHeQ/TtY61adSgIPCZfFX7jjSdV5KN8uwW9C4a7Wxq3JF2L8NJ3WTNvg
	euWbrufuLUjNk5GEJEetnw1MXw2E/1XDCsBN1i7QFU74fsJ/pRU5rli2sMhw9n/D3AA+AsuphrC
	ZIzTvbtqqTNAyP73ZXyiMZzSmbYoP2kgrgTUc96AJhpkwu+n0ej8y0LWP8Syr2LqRo2A4aLHZD3
	PE4e8YOtgcb61tek/e926vxSZLwLGNHVf5Am/kE7IVDWgAMo96aaR0pjrhq/mVo+4RRgPLry2lE
	w91Gg==
X-Google-Smtp-Source: AGHT+IGNU5sr6+plfXZt3ru5qeOfPaQbRzm/Ldfsyxj62YchoQXmawCsQ5xOWRL1NW15aw9u6Zb1PQ==
X-Received: by 2002:a17:906:c103:b0:b76:3a86:bccc with SMTP id a640c23a62f3a-b7654d8cfefmr397361066b.2.1763649486145;
        Thu, 20 Nov 2025 06:38:06 -0800 (PST)
Received: from puffmais2.c.googlers.com (180.192.141.34.bc.googleusercontent.com. [34.141.192.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7655050927sm214326566b.71.2025.11.20.06.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 06:38:05 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 20 Nov 2025 14:38:05 +0000
Subject: [PATCH v2 2/3] rtc: s5m: query platform device IRQ resource for
 alarm IRQ
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251120-s5m-alarm-v2-2-cc15f0e32161@linaro.org>
References: <20251120-s5m-alarm-v2-0-cc15f0e32161@linaro.org>
In-Reply-To: <20251120-s5m-alarm-v2-0-cc15f0e32161@linaro.org>
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
2.52.0.rc1.455.g30608eb744-goog


