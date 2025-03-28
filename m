Return-Path: <linux-rtc+bounces-3696-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DA12FA74B52
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Mar 2025 14:44:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E26EB17B964
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Mar 2025 13:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC36C235C17;
	Fri, 28 Mar 2025 13:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lU8nw+eG"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E741990CD
	for <linux-rtc@vger.kernel.org>; Fri, 28 Mar 2025 13:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168684; cv=none; b=bev/DNEugJ2hqcsLfiYTkS7LTO7pLYc4s28Irgc7LJYmydj5/1WHV3HvEs8MqWSmnk8bMbEqMzfAnOsgUUk0F9+rJXXEpRK6UQcMi5A+h8tmpC3nauMOI8/KkgpSkck+90/71+ixRwEZMDv18TqBf7xgB8DtDkPGJWhf6dLJINk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168684; c=relaxed/simple;
	bh=X823p7d8VeG19dJIhYLsSWA3HtswWk7j0eIGd+yYPcU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kKyHwB6D+kJiC/pzgfOmLX91fl0b85zDnq7+R4VxPeUlG1I5Ifbz+rZJdp/oH2F2AfXEngli+hPMS9lHYqWjaXx6IBG4Zt/u4FbHau5pTUMaBDMi2uA7PvOxlaHD6LlL2yGm8aeZI1evcZxLBJcKC5qhsK6HmCTo2n+dP2bKjnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lU8nw+eG; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e677f59438so3356921a12.2
        for <linux-rtc@vger.kernel.org>; Fri, 28 Mar 2025 06:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168670; x=1743773470; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5TCn0wifCdb3UC3ucEx7Zkhg1UJ6ww+TPiSGCbm38yQ=;
        b=lU8nw+eGPn8sYUYY8pW8wrAmszaAHu9XAx8uMAYBv39XNsOUH++MflwfrtZxjxPdGl
         W8ZiBJtB61yW1SaHlo3br8niEBunD35aSOTcXYFAoD4x1m8zdzyiYQa7NnZwoOVxp8Zg
         0/62ToUJ9cxBM9EWRCGgfCVefe5tuJ4WmRaHq30aMwpeKjfcTP9UbKMnKRwypr+HDWOR
         6sDVPFPgc8P5pqvjiztX5EykPZN6AqDwT/Z4n6xhbuzPTnNqpML7mIrsze4pZgX1+6UQ
         PkMrUdpSwyYIhaiT5/utbbcL7EqFDn6K/nAg6hVkBXWCCxeF1sv96r1anMWYTd8Vy8JE
         6AHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168670; x=1743773470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5TCn0wifCdb3UC3ucEx7Zkhg1UJ6ww+TPiSGCbm38yQ=;
        b=EIDdJYKMKz7MTYBKNG1yvw75JleyBW1iycug+8L/TgVDsGHfEQAzStZwg67kbnCrOr
         xdfZcQ8GVB07cHvTp/zXc5AgUj2u1Ytn4eUR5l5yOQEhT2rCb3ixzJ6khhYRjDoc/MZp
         SV60IFuvH4179GRZsJ67sZFdsea6+CPfcAy+LWv8LEHKdFIA1d2SX/JRVk/aaf4x2jKX
         vjsxvRN5Jsgf1nDiJyMg0xvvA1nRYGb2MqwEfxFWnNvhDbSZoiJT+2tryLglbwPi5e7o
         8wyCvhvDRmF+umhRVRK7XrcFOJpxkzeXgdZBOrc6HHEmVJjuKLStqRjDCiGby+kVyQVp
         h86A==
X-Forwarded-Encrypted: i=1; AJvYcCW5ztVs/soYA0UVSD97xeU24QFutaS0BQAQnAp9Bhy8xYnIKD5LC4JABMONMh3FlA3l2ch/2+wRrN0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz52gxt7zVqh//mtWp3U6YY49Bwv1rg9R1vG2AKpczeXtiS2R3E
	bv3w+4DR7wpFoLAABY+KlFhgjdIxHIYF2NFlNxNtChEVnNPMvpVkB/eZPH9KZ/Q=
X-Gm-Gg: ASbGncvyrAAKwK7uBjnyBaUu02VBd1qFZoREGhCCemwlDbdpd59U5KGhljZ3BiL5ceg
	OWm7LUb6te4jhWpeqH3AhFXlOANkDpRDJGkcBOowqjj/QqoF3Kl/9COBJHeQWzpq785vMEZibAL
	ZSW6UDq3Nbwdv9k9i0gf9MNkkRzG+w2iME/lG5bKMfRQwrBzUAuY/tUSAO2Fpk33M1jOGpwoUax
	6QEt2hyyxdiBEBJ8jkEFumNviaEG3Nnc2X+yoAzSUKBVIB4zChMUPkvUi2uAPrWat0pbqpAuxcB
	tYaZ0lx/HcBF8NtQET/uJ5qwLqLTDqqT0Q9yy3JiSpighP6iuQyL7ZANxFnoJRu35dkmVYatVDQ
	/vpX4wQB+fG4yEuxftVmhrmLYegmN
X-Google-Smtp-Source: AGHT+IH4AkvKS9gIeAEdf4WO0mRjBtbxCllwxmJHe2U/y4p8yWBXxd7byUvVNmfoRgEJ54AQL4uegA==
X-Received: by 2002:a05:6402:1d4a:b0:5e5:dea5:3eb2 with SMTP id 4fb4d7f45d1cf-5ed8e388e5emr8163708a12.11.1743168669663;
        Fri, 28 Mar 2025 06:31:09 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:09 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:29:15 +0000
Subject: [PATCH v2 29/32] rtc: s5m: switch to devm_device_init_wakeup
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-29-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

To release memory allocated by device_init_wakeup(true), drivers have
to call device_init_wakeup(false) in error paths and unbind.

Switch to the new devres managed version devm_device_init_wakeup() to
plug this memleak.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index 7b00e65bdd9c25b3426f92355f8ea36e66c3939f..e8e442c503064eb4e570af5bf7dcff6bfa7f4656 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -779,7 +779,11 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 			return dev_err_probe(&pdev->dev, ret,
 					     "Failed to request alarm IRQ %d\n",
 					     info->irq);
-		device_init_wakeup(&pdev->dev, true);
+
+		ret = devm_device_init_wakeup(&pdev->dev);
+		if (ret < 0)
+			return dev_err_probe(&pdev->dev, ret,
+					     "Failed to init wakeup\n");
 	}
 
 	if (of_device_is_system_power_controller(pdev->dev.parent->of_node) &&

-- 
2.49.0.472.ge94155a9ec-goog


