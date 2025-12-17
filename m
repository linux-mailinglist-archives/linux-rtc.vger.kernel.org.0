Return-Path: <linux-rtc+bounces-5582-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E402CC7152
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Dec 2025 11:29:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 71E5930B0265
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Dec 2025 10:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 723A330F54D;
	Wed, 17 Dec 2025 10:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oTNQGCBT"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFF630EF7D
	for <linux-rtc@vger.kernel.org>; Wed, 17 Dec 2025 10:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765966259; cv=none; b=IxUQ1W5qix2c0vCBml8/BxuoxErQE55NIN9LcKuYxikWfVLm4gv+wMYbdw/hTFCVJISJU8uYfjoTm/BpDH0vPWDGylOrhE+A6oAf0eLOy8hYjDzWVWEyChbAQk5lDHPAKiFlwyLwWegBccaHXAoBru2Tazx6C9RdI0H7dvrFIRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765966259; c=relaxed/simple;
	bh=vZuZvZxOilgG99K1CCus8hp1iS1vINW92yTYPy99geM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gXxtpZEKqizvDKCEurM08nV6hDlYYeqH5IX/eZlfWW4voKa+PEXgBMQBRVqDvcysG+nkjmdAXVUbSyNbvVmelm3tIMz3anHxLOQkCR5aNynGd/KbJVBw/gUXxpR8QSIia3KZ5XYnJB2JKIXehRTLXh/RFrf4lIxO/2r88FZrGZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oTNQGCBT; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b7ce5d6627dso430266666b.2
        for <linux-rtc@vger.kernel.org>; Wed, 17 Dec 2025 02:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765966255; x=1766571055; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2I1z9PKfucHgXypI2JVRh4FRyFEf87RZSzZ/ck7bvnU=;
        b=oTNQGCBTouX8ExG6Yk40GlGAUWeke6Mf6YidWjme1iQXhoNEbkTjmZsfZPHtlp3ZJd
         P8YUrtioBgYYKR0cRyjJ+Vf19oeigivYXBja8fwn7fkibZl85gVqjua5BiyzscX92sa5
         dQOy7QKBPJn9f8w6/NXZPDEGX0BGhw3z6a8vRetUckRnn/yUlFDcGQDeT9Je+BWEF5SB
         4fADzEaIgHaEz9komKU5cgegNY5SRvHkuLUqZ1vcHT/m6gt91U0mL9/qtr39axQ9sIGg
         0gJgJjdOgiq6Z69EZ1xdI8HmB62LOIK79sjGSRD7wlKiPSRFg24rrIBA8qUvOg8PgW3A
         tBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765966255; x=1766571055;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2I1z9PKfucHgXypI2JVRh4FRyFEf87RZSzZ/ck7bvnU=;
        b=HRDjXPK3gGgdgRsK8jjLMJPdE+/FKq7AWOZMorupLkqNbZEySoD4MnbCC9dD7rpMjK
         aQ0PFMH6RsgE6DAIVmHUmmFZDNtZLexqzaYowbJOxq+9nMC9G6d+hbLIqeWbWU5FOKsx
         bPYYsU0YUXcKsjA+B/juE05HF0W+w1EXbLr/sZMxw0BYvJlae8+T9UIEpKtLoOfVbMYl
         U+N8Of9IUa6O53m0C7035HPBJCZsXhoUi50CZpjXaZkkbmYsQhVDiT1eSPZr9ohUVqxq
         tbbtobpuaBm4yAIeztwpA+a67hoRr6Frn5jshEiP7Jnb5MyZpHmB2sqQ+nvSvTGRPzhL
         iPyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTDTFrYxDwx9XMlUtPCoRXJMr2pgfBoS80wXmpc5KCqbdHMoby/rugxrHbl7GoyUgORwjegwxg5pk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFKi244YzHtg5TBVtvkMJbkU5/MDDUi0jYon0BTCw4Cw/bSU+K
	rPB8BH7N8fc1vVggu4EjETCtEsAFfW8MZCBtHPxQtR4/6BazPJl7LS/mLgZXs0ZjsI8=
X-Gm-Gg: AY/fxX4y5MyCQuNtyY8xentf9Ffg0/d86cplfZ5BYYfKGw7knuZZaJyar0959ljX1ve
	QmcqU05XQvkeLhgNTFTNTGV0bwCK6h3AttGI8CbAlegSF1hXnQ2ibapKWZR4aT+DhFb8xkjNAnS
	518+fJ2pI7G0N7eLvJYFZahCSVZ8eo3w30A0SQFnNfJLRbpTA2D4NM3xYWgyljoUZiDqd/nIib5
	d8J/wWEblK/rsa1hMD6ezQZYxcKHiH3Zbbnj/CWSWNwPec5TD6XJz1CzCDlnUJGL6piuoBbn3ZB
	SnygnOTFsrMBeVGdChlw+smak5GFhgssLqDzSrObDfVG0yIWTlf9jTpCjSbWwuUL3yS0iUdZeJl
	fxGOVF8ZWv/wRijTqtwg4brJznWTWcOpp4BNRN/nEsyfyT6PMWGtHw/LwX4haWomHFsYpx0e53D
	MPE+LhGngYZBwSQ3oFrK871pynxcw7IuBKKjt964fW1f4zbs8uiIwKqO6sA18doT4J6H577U/nr
	4+3sg==
X-Google-Smtp-Source: AGHT+IEw9OR6970NlwrrVo2N5ViWtBVHSFhvWHB7PcDIt2dJr50vikuCJE35Z5BDLGoFltIUs/2JMQ==
X-Received: by 2002:a17:907:9282:b0:b79:f4e4:b544 with SMTP id a640c23a62f3a-b7d236c0376mr1941191166b.21.1765966255102;
        Wed, 17 Dec 2025 02:10:55 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b3f4f5a22sm2043811a12.9.2025.12.17.02.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 02:10:54 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 17 Dec 2025 10:10:48 +0000
Subject: [PATCH RESEND v2 1/3] mfd: sec: add rtc alarm IRQ as platform
 device resource
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251217-s5m-alarm-v2-1-b7bff003e94c@linaro.org>
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
2.52.0.351.gbe84eed79e-goog


