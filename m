Return-Path: <linux-rtc+bounces-5446-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D859C749A2
	for <lists+linux-rtc@lfdr.de>; Thu, 20 Nov 2025 15:38:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 526EB2A657
	for <lists+linux-rtc@lfdr.de>; Thu, 20 Nov 2025 14:38:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAAD72BE02D;
	Thu, 20 Nov 2025 14:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rOVdIQfU"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F1A279355
	for <linux-rtc@vger.kernel.org>; Thu, 20 Nov 2025 14:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763649490; cv=none; b=WAOKFypUbmNgcxDr89o2MO3qBv1gFRksVeyO3prCKUDx0xWCGh3ip3PKoAbF7EbsvhEkW4VGLXqvsD0wO4rjiSNYxmwVDmMnbvhqCjH8TFa3uBw54QGgo3QPdb+wYwsi8dMRM7LCC8yq6wIK6q1nmHxSDcxUjrXf76mOZ59sdPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763649490; c=relaxed/simple;
	bh=1kTUYewu4Qf6eaZM79yswFLJrKWEOAk1UN22HB6JO80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J0hI1i57kpTHmiVxl0xGcebA8l6sxMMQnUBrcaHnfIjeT310SX4iP5Qng1v/2TdIatAtY62ZIy5dSxATYOUmG01KCKesgM3pHr7XmBtN+s51rRFCE84lH9TYzZOT3TB3xDYESkOxG5z1qtrxZi5XxqVD7hDNZ6GKRMKBApAGwtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rOVdIQfU; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b73161849e1so251507766b.2
        for <linux-rtc@vger.kernel.org>; Thu, 20 Nov 2025 06:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763649486; x=1764254286; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=soaPD2TslKdn5T93ESkr8AaM8d+EcG4AUD/8dOpzu/4=;
        b=rOVdIQfUjs0Jd8Q7n0WdzU5rD8mwbsTebxdFm50afejdxPTcCj0jYHCeqydo07SxUp
         IflQh5082qsSLGAitlYgqsfi4fv9O73NBwV5hVGaA07+Mv7ts1jPU+e2codBv/h/iGPa
         /m3OktYugQ6ZnKgVKD9KJKMBxVeUJM7DOH3hUEMGhLgko3lYKzIDxo/qg+W+wK5uf+eh
         xYxSODwIiyGMCHHQVYDzvdtQmNAmTxAtRohfUV5T+pkPbxYevdlmikSUG4fo/IFYAD3L
         lRxQ6/PLBEiSNHulsOQI0yJEsrAsgRYBPle+6vgcfa91qeGGR0N0EyyRIh/jde1f7QBn
         AeBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763649486; x=1764254286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=soaPD2TslKdn5T93ESkr8AaM8d+EcG4AUD/8dOpzu/4=;
        b=t5pSJhm7OlL641GIvnOaXtuX19ZJY4aayZ09wtlxcYIEZEaTA+Sx3v8oQXu2y7VQyd
         WMztFLyEWKSAke2amJ9Jd1PPShrWgs1ezpfIVlBZsv7lmREkXJz9jptDlcGbfgODbfak
         I5cO4BKb7oGlgcazMuxVJk0wWbZYL6uvo5XwvRzhv8szD4matL+EmeSPYzITdYo5pWqi
         66utosxLwpuXFPkm2I53qJhGUcaqXix/4NxTlh1Prh1r1qIY1QX/kSSD3bwmH7eV8Rw5
         eclQ9qw4f2srfd+Nl9pfRgsWwm4JIpAqXRuEJfx7quYnU93+0xv1xZdxvhuTzvqj6H84
         +ekg==
X-Forwarded-Encrypted: i=1; AJvYcCVKbAhh8vDau9AsQKvj7RghQeMJko40NvVZ8CRGas0289LhUh2k/RjwDl5sGPRGJyjwh38NPJUXeh4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtyO6WVDSoIscnGJ3BjS94Ur8396FqxmdLJw26Y93ajRzxm2f1
	EywATBxGQa02AAG+6NTjwP9D9NSjTWyyTOQTmpQEp1cvvaTNwjcPc1feDIuEvjjhiwA=
X-Gm-Gg: ASbGncsyHmqOY6c7auzj8rqMQGW3hDpgk67d0fbSeQhFMxjTXTZHAdc07LuJU27f6sR
	Ai24H33VTGjCJxfvgTquQ0gtPMVMIak/OUosChyuGHkQKkdIiZKjGoQ1pQ/CSACDVxC6Kw2iOTn
	Jp3WxGKTT3WU8sqhlVFS8sI8+0UBlogF8fXLRttWhRDqjIwYak/peZ6Rcfs1EXU5R5L08ZVpVkF
	bv+NnlcEip1fVLbccyn6Y08habRQuCmpqKBhPRY8doGkjxoVpR6wE23rdBlLx8TaZ86oZSAqiTL
	K72LJU4Srs9eb+2/e6Dp05vZlR9WV289fH8n6zAE93iL0ac+whcg5xwiOTzZTXnYO6kvmHT9Cpv
	yWfFSFrkVwoBYVW3lfg8lNxYH80u5bZmC5CbgBqIxuy5kfue3qtEVSuTv2ppw0o8EhLn7WWdW4I
	r7WN3lA23lQ+f1LjyIXpIgEJwcjVXPLbJtIga3o4DCBvq0kUrGiA7Io+07V4c2Xv0iRMPHWXrnj
	vulLwqaQyexns04
X-Google-Smtp-Source: AGHT+IGhKw3r9ZcHL/9TYJ4X0vTw2phmMobEjcaVgz2zq7gQ8PAeUvdaA3rwFB/lcqs3bHyNaVTxkQ==
X-Received: by 2002:a17:906:c104:b0:b76:52d0:aa2e with SMTP id a640c23a62f3a-b76588e825fmr284535366b.40.1763649485689;
        Thu, 20 Nov 2025 06:38:05 -0800 (PST)
Received: from puffmais2.c.googlers.com (180.192.141.34.bc.googleusercontent.com. [34.141.192.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7655050927sm214326566b.71.2025.11.20.06.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 06:38:05 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 20 Nov 2025 14:38:04 +0000
Subject: [PATCH v2 1/3] mfd: sec: add rtc alarm IRQ as platform device
 resource
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251120-s5m-alarm-v2-1-cc15f0e32161@linaro.org>
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
2.52.0.rc1.455.g30608eb744-goog


