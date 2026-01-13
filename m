Return-Path: <linux-rtc+bounces-5744-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 248BFD194C7
	for <lists+linux-rtc@lfdr.de>; Tue, 13 Jan 2026 15:08:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33E6A3093B11
	for <lists+linux-rtc@lfdr.de>; Tue, 13 Jan 2026 14:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84AA0392B7E;
	Tue, 13 Jan 2026 14:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tRUP6nrC"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A573392829
	for <linux-rtc@vger.kernel.org>; Tue, 13 Jan 2026 14:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768312997; cv=none; b=aLMgq0tX5ckdcgLfhcWi0F8roGuFEnJbtxSx6MDwYPcjLemsuaugBPnVa9BH4ieG5OjSATzZmYceFUnIVH/eisAXqr5mFjk2J3waiChgI8ne3YhVvrPiU5sNN/w1ZBnn38wDQ8YadNgwbG3ZvneNeXl1L4clr7ykTW6AZ9ZoMOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768312997; c=relaxed/simple;
	bh=YursKKXNmAq3gLEo1Ra7eyeVALmovWWslD5JKj7z2PM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ofO61u/trwv2Kq+zF9ITeiIDGqZBmXqWVtEoIdeIh6m1hO3q3B6Ukh4keq2CNl5ZKMT/sdqVvwMJfjB2oLsfkLRhymyH0WK2cIZ53gAR5ebssxu9HROMArfEfzS7ZQqhDOsu9s6PF/Ipv42W6rM/IsANi5XLS00yIOyCdMe0xF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tRUP6nrC; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64b791b5584so12487874a12.0
        for <linux-rtc@vger.kernel.org>; Tue, 13 Jan 2026 06:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768312994; x=1768917794; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2QNRfSu+X0n9+C9HJ8TARuT1Nhgd2E5zqZHGvVona/I=;
        b=tRUP6nrCrfrgqXZvZtIAIvdOyt8TtvzY1msQiZPmrxrpHIAxhi2lntUAVkaMOy+otY
         tuE5Fl7nbTpSLFO7H3NYy59cgxEy/GH1IIKk6ocjCagpBdlesqmshakjTJWZnMAyCZDL
         N7W5wPJ5LfmZvXhxG55ZBGlFuPZeSVLu9IE6Iu/E2Cl2sEU68HMhBF1Q3roqNFWknvgp
         n4yWDQMGM1swX9ovQzXPoCAs++01XbO02MF5r6Pl++c49dPxGBAV1+sDGr9Jk/Cila1z
         e39HNA8aOEn3bgSGEAc/2Z7pbXRg328lg7M8F2aOQ9GEZMyW/xt54J8PZqWTSRNrPkHW
         +/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768312994; x=1768917794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2QNRfSu+X0n9+C9HJ8TARuT1Nhgd2E5zqZHGvVona/I=;
        b=eEhTx4PR0BmDFHBhLnOEvRUZThz2xterLvf0JhBlGCq3AViBIh8L/rnbUbbY/13VoW
         BFSkes+5jn+3amCPXkUmmMoatwbNFIo/gyQFeoGdDdqvpTgxzRm6sh7Rp6wxDENoiJvr
         h5IsunV4WGD2yJU+EBCi5z3NOjTMTaVEzDrdPmbkOJs3OO+nUAQ53VDHWr5IZa5D62lQ
         +GwjotVItwPla/7fJNvKhhSc4aa5McoMm4rQlvc2cRYz4Nta54TsxHt0l2I0iOiVxLHZ
         0KZGZEESnOjz4pjPtmkuqP2fj+62YCQYenOrGa3pV8JzOsxS3lyaJDFzi1JnJ/Ld2ExM
         NwWw==
X-Forwarded-Encrypted: i=1; AJvYcCUIvxzkjJ54AXoGmmj6o9u/6nF8/gr+Eh0ruk2R5W2YFoZKAgOOjP/y2Yukq0CGALaWNAdknPHYUu4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPI8MhdK9M774zkygrkkVfDv1w0snjwcyEhmmRIMSZhgJVNDm6
	icYNw5lIwWemhZjVSFDz/lrSbRso4Loe8LFuTm37qRuOtka1rB/9OC1RxRXfChunptU=
X-Gm-Gg: AY/fxX7lKdRQiLhpcDEpiGcuN1PxXG+01SyRNqdEY+9aj8rmrRxP0KQVgJU0C69w+9A
	v2GBA7Qe3CuG8gkrWnpLbFX49b9no+uoJbc8LDE99/xLEni14Z83VKLiPXNwUpl+4p/NXrE3OfS
	cvcEDhQnhsa5wBtODM3T9pHbQJLrOcDHxr5bRXWMVG2ebf3p8eWFOp/IqbKspf8Dl3BGdNyuamx
	mARO3oleHyAm9JppBPZbefMUIB547Kewl0Civl3/o1JuJyr1kk/E+FgeLBAwqfg/4mhOAqMa6MH
	wL1BSIGFLo9qG8J2qiav0/27/+XLaRBbFmvpoxdBpbAD87BF373KqnbwZf7rUHVcOiAdLBJgP3x
	8vYmRbQqvjQW9HrcslJkSY8Z3rHE0zsTXpf2RyW+2helu+lzwIFvA5w9QB1rZ5KfsJhQlCxgbJJ
	6WJF+ylHZXvLarhxzXBDml9c8pch538aqmB0ngNZbSYBxe05v4D84K0C2zHfVKHLDZos0hd38Xw
	FrWww==
X-Google-Smtp-Source: AGHT+IGTTr6SX1QOQDiv8wO0iFLkAfJCO8fhPBk9ftZPt1uQsStN5fTC5tHBZBCLBy3V7N0AGsHvyg==
X-Received: by 2002:aa7:cd13:0:b0:64b:7e89:811 with SMTP id 4fb4d7f45d1cf-65097e071f5mr16815559a12.13.1768312994017;
        Tue, 13 Jan 2026 06:03:14 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf65c07sm20139157a12.23.2026.01.13.06.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 06:03:13 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 13 Jan 2026 14:03:11 +0000
Subject: [PATCH v3 1/3] mfd: sec: add rtc alarm IRQ as platform device
 resource
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260113-s5m-alarm-v3-1-855a19db1277@linaro.org>
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

By adding the RTC alarm IRQ to the MFD cell as a resource, the child
driver (rtc) can simply query that IRQ, instead of having a lookup
table itself.

This change therefore allows the child driver to be simplified with
regards to determining the alarm IRQ.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 38 +++++++++++++++++++++++++++++---------
 1 file changed, 29 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 42d55e70e34c8d7cd68cddaecc88017e259365b4..77370db52a7ba81234136b29f85892f4b197f429 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -23,9 +23,13 @@
 #include <linux/regmap.h>
 #include "sec-core.h"
 
+static const struct resource s5m8767_rtc_resources[] = {
+	DEFINE_RES_IRQ_NAMED(S5M8767_IRQ_RTCA1, "alarm"),
+};
+
 static const struct mfd_cell s5m8767_devs[] = {
 	MFD_CELL_NAME("s5m8767-pmic"),
-	MFD_CELL_NAME("s5m-rtc"),
+	MFD_CELL_RES("s5m-rtc", s5m8767_rtc_resources),
 	MFD_CELL_OF("s5m8767-clk", NULL, NULL, 0, 0, "samsung,s5m8767-clk"),
 };
 
@@ -33,50 +37,66 @@ static const struct mfd_cell s2dos05_devs[] = {
 	MFD_CELL_NAME("s2dos05-regulator"),
 };
 
+static const struct resource s2mpg10_rtc_resources[] = {
+	DEFINE_RES_IRQ_NAMED(S2MPG10_IRQ_RTCA0, "alarm"),
+};
+
 static const struct mfd_cell s2mpg10_devs[] = {
 	MFD_CELL_NAME("s2mpg10-meter"),
 	MFD_CELL_NAME("s2mpg10-regulator"),
-	MFD_CELL_NAME("s2mpg10-rtc"),
+	MFD_CELL_RES("s2mpg10-rtc", s2mpg10_rtc_resources),
 	MFD_CELL_OF("s2mpg10-clk", NULL, NULL, 0, 0, "samsung,s2mpg10-clk"),
 	MFD_CELL_OF("s2mpg10-gpio", NULL, NULL, 0, 0, "samsung,s2mpg10-gpio"),
 };
 
+static const struct resource s2mps11_rtc_resources[] = {
+	DEFINE_RES_IRQ_NAMED(S2MPS11_IRQ_RTCA0, "alarm"),
+};
+
 static const struct mfd_cell s2mps11_devs[] = {
 	MFD_CELL_NAME("s2mps11-regulator"),
-	MFD_CELL_NAME("s2mps14-rtc"),
+	MFD_CELL_RES("s2mps14-rtc", s2mps11_rtc_resources),
 	MFD_CELL_OF("s2mps11-clk", NULL, NULL, 0, 0, "samsung,s2mps11-clk"),
 };
 
+static const struct resource s2mps14_rtc_resources[] = {
+	DEFINE_RES_IRQ_NAMED(S2MPS14_IRQ_RTCA0, "alarm"),
+};
+
 static const struct mfd_cell s2mps13_devs[] = {
 	MFD_CELL_NAME("s2mps13-regulator"),
-	MFD_CELL_NAME("s2mps13-rtc"),
+	MFD_CELL_RES("s2mps13-rtc", s2mps14_rtc_resources),
 	MFD_CELL_OF("s2mps13-clk", NULL, NULL, 0, 0, "samsung,s2mps13-clk"),
 };
 
 static const struct mfd_cell s2mps14_devs[] = {
 	MFD_CELL_NAME("s2mps14-regulator"),
-	MFD_CELL_NAME("s2mps14-rtc"),
+	MFD_CELL_RES("s2mps14-rtc", s2mps14_rtc_resources),
 	MFD_CELL_OF("s2mps14-clk", NULL, NULL, 0, 0, "samsung,s2mps14-clk"),
 };
 
 static const struct mfd_cell s2mps15_devs[] = {
 	MFD_CELL_NAME("s2mps15-regulator"),
-	MFD_CELL_NAME("s2mps15-rtc"),
+	MFD_CELL_RES("s2mps15-rtc", s2mps14_rtc_resources),
 	MFD_CELL_OF("s2mps13-clk", NULL, NULL, 0, 0, "samsung,s2mps13-clk"),
 };
 
 static const struct mfd_cell s2mpa01_devs[] = {
 	MFD_CELL_NAME("s2mpa01-pmic"),
-	MFD_CELL_NAME("s2mps14-rtc"),
+	MFD_CELL_RES("s2mps14-rtc", s2mps14_rtc_resources),
 };
 
 static const struct mfd_cell s2mpu02_devs[] = {
 	MFD_CELL_NAME("s2mpu02-regulator"),
 };
 
+static const struct resource s2mpu05_rtc_resources[] = {
+	DEFINE_RES_IRQ_NAMED(S2MPU05_IRQ_RTCA0, "alarm"),
+};
+
 static const struct mfd_cell s2mpu05_devs[] = {
 	MFD_CELL_NAME("s2mpu05-regulator"),
-	MFD_CELL_NAME("s2mps15-rtc"),
+	MFD_CELL_RES("s2mps15-rtc", s2mpu05_rtc_resources),
 };
 
 static void sec_pmic_dump_rev(struct sec_pmic_dev *sec_pmic)
@@ -220,7 +240,7 @@ int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
 				     sec_pmic->device_type);
 	}
 	ret = devm_mfd_add_devices(sec_pmic->dev, -1, sec_devs, num_sec_devs,
-				   NULL, 0, NULL);
+				   NULL, 0, regmap_irq_get_domain(sec_pmic->irq_data));
 	if (ret)
 		return ret;
 

-- 
2.52.0.457.g6b5491de43-goog


