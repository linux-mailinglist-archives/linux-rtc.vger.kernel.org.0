Return-Path: <linux-rtc+bounces-5374-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E6406C5CF0B
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Nov 2025 12:52:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 761014F09A5
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Nov 2025 11:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E1EF314B62;
	Fri, 14 Nov 2025 11:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G1fk0Mxn"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62C03009F1
	for <linux-rtc@vger.kernel.org>; Fri, 14 Nov 2025 11:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763120847; cv=none; b=SYS7pDCMS6mdfyDrFXYxSVP0jSRX0QWLbf74OH6shMcB3b2jpeDI5/0f4FkneD0JfdF/2KbjZV/hrKXexGzySYkHqjPFU7yJSWIuCXdtbAjOxfV8JGvJYlAbbG0PtKgjsF3P5RFNQwYdsRTl19TyJq+P27ZLQ+DaUpdRoaxsScg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763120847; c=relaxed/simple;
	bh=1kTUYewu4Qf6eaZM79yswFLJrKWEOAk1UN22HB6JO80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=abHmyfBEY9al6RKfv4yunJgmgwRRJJKGj+Kz2pdj0igxaj6jk48zRNiSQyTDgGN8njE8qG80xBuoMNHIDBNRKs5dn1v1jr9B3dW3fJXq1u4clOsxMfd+vTHwkD8IAeMTbf6CbyafcIZwxW9HI9TJoPGujUp8Wrbk37IZnfNVhyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G1fk0Mxn; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-641977dc00fso2781042a12.1
        for <linux-rtc@vger.kernel.org>; Fri, 14 Nov 2025 03:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763120844; x=1763725644; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=soaPD2TslKdn5T93ESkr8AaM8d+EcG4AUD/8dOpzu/4=;
        b=G1fk0MxnWo5OkVA15w5p/tW556BXP34u2WNmwRlPT4DJ7deVFTtLx+jIvSNZMNOIbS
         9uwAdME1Qqis7RN6BWzamP+SfBAnk+/DBY6CB23zvUIf8hqbJUDrzABbFaBrJ5Nvbfjo
         yO/ItxBqGUbC4pT0Rzc5hD2Y47s4KEekkFRiCwya1GIvd/xAFJn001Gb/S7M6ZkkQ/mv
         uytE9vstug57+pQrRZ/id9RXXkHhhNGEszcai1zjKi7m8PnCmEmoAgN91Tc4MiWvI1H6
         yQoSyI8EJJnbpbNLZo7LGjej0P20wZCkEOhjecbWp/XB1dsZdK/RfC+HrNyp4gUVt+a/
         g/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763120844; x=1763725644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=soaPD2TslKdn5T93ESkr8AaM8d+EcG4AUD/8dOpzu/4=;
        b=c57boEvmmLMCrkMEEJbLg/iKo2sYD84XrYqRtvvTGBBCStYJctzcbMUpWTOEzCGQ1i
         gnUuMUiZaJpXVM48afo6RELqY0tlkfR5i0bVoRK9NYDATwEEW6tvAa9NgTzNEF6WRqgc
         qTHJ/hL24gOU9RL0GyONUYjdy3+gZJ0/3kjB2y5UFpyiolOARl2W1cflnN+er61AsIbb
         7DnA1HCtpxqsw86nj2edaE64jGUxrX+BgaaUePKNmBJL3DGP8McMGYpR9mFyhWZDcH77
         /facvyTatsTWYnpbkhmbNWJxVeG35L5d1ZT/9WaFac7eh/BQPkwmDUTdcaMuwOlhV9BZ
         Tr1w==
X-Forwarded-Encrypted: i=1; AJvYcCWufTiLVyVUz6SVu881fsUS1LkjS0OIuuHY/GAH9zeU1LO5+kUVQ1E0MFExPgxVst3vyUkpwO5nUhE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+2TXFE60raahnWYCSwKKNZqLvf87j4F2qrktDzQ+1dZzfs63n
	gkZu/z0X2/O/Ch3xXEwE7RTvA321p0lzvKclNJ86km1qc1eTXJ+dOHnPFoDIZCMnr6M=
X-Gm-Gg: ASbGncuOLa/0+rxi8b6Dw44ViKPRq1uvJ2Jja/SzjHPOoa4HLsPSqgD32cocgiiazhn
	Oq+EL6wFyGhjZPS2IJk3sZk0g/mTIOSmp7AUmTRVJluZbgZuNN/21xF++UYH21xaHFhnKAFBZs5
	qebrWO7CPPnLjLGIQFxiHk2M7ZuxWuRYgNyz4dZfS2I+ji8xWu/tzRt/bLE3ogBtSSXtlFRbgKI
	WE0MA1JsXPI+rlzHSqv9UPMKhlgXRJdhckMRgguasrw4nf+X/r898FJcn2M6ZI1+p1wjLfIb5jJ
	b0HHyRRk7GwdaQ1NuXMKwX/aynqmh+lWHv7NCSbXsq5knd2vywZrdJJ2zwwmhJVNhhiSllzKtTA
	UhcEbcHj6WuM18rA/88PH0aRx3QNTeNchR2R3+8JxdmPE4v1pRRJuNcVu0FWRDLdqxdrwI0FGEP
	NX6L4tKmyXwfIFWc2spKLCW52Fc9Jkl6JdtbRzGNbeD9hryC5raj6/DFAI/YlRPY7kcgjdEGWZe
	qFtCQ==
X-Google-Smtp-Source: AGHT+IFJrb5t+LjIPBx5pG10Xi0I9odWXxiMcRtHD1RF7OmqbxPtCtyv5Q78m29q5m+XfKIs1IpaPg==
X-Received: by 2002:a17:907:f818:b0:b72:5bdf:6074 with SMTP id a640c23a62f3a-b736780d4ebmr219404666b.20.1763120843860;
        Fri, 14 Nov 2025 03:47:23 -0800 (PST)
Received: from puffmais2.c.googlers.com (180.192.141.34.bc.googleusercontent.com. [34.141.192.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fb11d94sm372950166b.30.2025.11.14.03.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 03:47:23 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 14 Nov 2025 11:47:21 +0000
Subject: [PATCH 1/3] mfd: sec: add rtc alarm IRQ as platform device
 resource
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251114-s5m-alarm-v1-1-c9b3bebae65f@linaro.org>
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


