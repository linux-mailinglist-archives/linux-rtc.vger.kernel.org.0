Return-Path: <linux-rtc+bounces-5376-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2BAC5CEC6
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Nov 2025 12:48:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AF64D34CEA0
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Nov 2025 11:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4BBF314D1A;
	Fri, 14 Nov 2025 11:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="suCaNJe+"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9839E3148A7
	for <linux-rtc@vger.kernel.org>; Fri, 14 Nov 2025 11:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763120848; cv=none; b=hGK7d6xNpLY28g9i7VKl2osGbnQFazuq6pqQbsjs6WJuuFGyYhzCUrkoxOx+O6UWaylF6fycv6k8wnu0IsiYXDvM7I7zUgiWi4Jv3EXAO4b5grS32WcRQMeyyHxtbGim8ktv5QgaaB9QHeXBx0Zn0PHnAZVAL1G2bSsVheFeQSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763120848; c=relaxed/simple;
	bh=yIx1/2/tttizwM9cUxKlUJvNvvJijTCkS/Ch+ARlNjM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B/nPmLx93uYm/JKIMZZuhgRrV57BOn6ZhmkjlsQ5KNnpN1pgqgvQYlrXcU7cBfW7TAP1wg+oEJs9Z/zaCFd01Hv76mRBFlMn5ocR7/ihCwt/+X5vje6MMi4RRwFJ0pWTMBOEsnzkAIQYlipCjQcA6CBa1aCoUcXf2WOlZakR8Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=suCaNJe+; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b71397df721so242096766b.1
        for <linux-rtc@vger.kernel.org>; Fri, 14 Nov 2025 03:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763120845; x=1763725645; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GC2LO4E6Ag3mJVSI7KVkmGsqAOI0LYR1zjRab2wprm8=;
        b=suCaNJe+82sVqF5MUnUWTr+C8+0pyNnaRdrYcxM5tXfe47qj9GR5cv9OBZHavrbKh5
         V86qZQ085t69O5hybVksVdK5tPf24NSwyIJH2wcTdFG1SfjLSK9uTR5tlOc4bpEFN6UD
         Y9fcYYp0H3tfPm2WR42Unbw4l0ctMEhl/NzbMpAtWlI/NOyiQrkbRWScT2DwOg/lCuXz
         YD0OKyVLlme2La5TsAmnB1PmTSnYcUKpLOzX4q4xNGetiW6eXGBrApo/MEuLPuoBHEF2
         443W8Jr9pUdIYCCZwgqEJL6vp02+U5XMOtFh4bU2qkYP+OC2ab6/rBcEfNQrARQk+vQS
         Y1KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763120845; x=1763725645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GC2LO4E6Ag3mJVSI7KVkmGsqAOI0LYR1zjRab2wprm8=;
        b=Vi0jla33hs3qkOZQaDi6d2y7SVlpnxMfsZHJGcZGVK9PNa3Xl57ccoLLtfwCdVhnrR
         1YDH3R16JxUXCxJ41n2N/FvzQQACzHD3CuTJHkCQk9Ke3KggHrITAiJTAm/1ZOU9ULx7
         wMz3Yc3/lq+BUa30H+RpkMi88KqXoZHpO27mPGs2geVFkjBk1oI6zAbAxrsn0wWNPTB5
         7jj1/0eoLI7uv77E7VUQEPhqG/X9CiwcD8NecOHfz7W7Z4wozQYSj46Mp+/C9e7vR2VM
         J9RMf+oJqD+D+4VUxvF7Vmh+vGUyT4q8hgo+WiYPPz31+kcy+TxZhwArIRz5X8Kb/Gli
         s/Jw==
X-Forwarded-Encrypted: i=1; AJvYcCWb6Mk0/br9KkoZGTLUpJHnTx2kdlDVdPKKAt3jT0yQZdwEERa5DyspKtFWD+yLFt3vmTISnWe0WR4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrwC6lBOmW09KFSGmwq2u5dG7q6Sajnr/SWZGhwdcB1m58a9jq
	cFmYtbbCjbnw8jMLjlpYZKz/OnrqqDNsaGlZ3zvlKy1KbnCBV3MqnXQvDGv02Nj1yFs=
X-Gm-Gg: ASbGncttlZvkOEDaVHLxQQdM9mb9uM62qBv6n4044W7YSJoqfVn9R0epJwQZrRTH9+w
	SRpuYlOx8yRk/5EqNxZ9rdAg4sr6P6TJuunwkyolMlw7xNzLSz2ZpvlyuvT7YwCxqkDAnOr/v6n
	2UKtB4qMN/YMVWTGaqrqN9/P/uil9Fy66pghF6GtiKrOHAqzHWUw3BcuC1He62GjId87xbJkOi3
	z+jbmsJsAm/wzNuAwYEkD6Uxhfjj2KQXDeG55bpT4OpT5Cboa+g9wEhwqaaOY7KedtTXqIjV6xH
	IRMQRcgmhwH+EvHGpbCv02iDNNRC+y9Iak3D2tg0pFyy0l6oxz7qzCvBVt8lscEYW/0VIwCgZ9Y
	SvVOiAFmRyfGFB4D6XRaesJ364Eb8WjMsCawdOOXSjmM4cwCvdZqiJfLd3mY7KTVfCEagQaP/o3
	ZpfIXnijtseQsgxK8IJsbQwEaLzvJdXImUvC6jV7J5JO4fdCUMmxgeqRhy8/9it2Q92U8=
X-Google-Smtp-Source: AGHT+IERx/gqNIuM/Dn5OIg4s10Il0uVrXiSyfX0ztaAPKunstiUftXQBuF4ITb25vKoBq+sjWueDA==
X-Received: by 2002:a17:907:3f97:b0:b73:36df:fe7 with SMTP id a640c23a62f3a-b7367829b93mr265910266b.28.1763120844913;
        Fri, 14 Nov 2025 03:47:24 -0800 (PST)
Received: from puffmais2.c.googlers.com (180.192.141.34.bc.googleusercontent.com. [34.141.192.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fb11d94sm372950166b.30.2025.11.14.03.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 03:47:24 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 14 Nov 2025 11:47:23 +0000
Subject: [PATCH 3/3] mfd: sec: drop now unused struct
 sec_pmic_dev::irq_data
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251114-s5m-alarm-v1-3-c9b3bebae65f@linaro.org>
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

This was used only to allow the s5m RTC driver to deal with the alarm
IRQ. That driver now uses a different approach to acquire that IRQ, and
::irq_data doesn't need to be kept around anymore.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c         |  5 +++--
 drivers/mfd/sec-core.h           |  2 +-
 drivers/mfd/sec-irq.c            | 10 ++--------
 include/linux/mfd/samsung/core.h |  1 -
 4 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 77370db52a7ba81234136b29f85892f4b197f429..794c4e5398e7dd1a816aff9a6559a6c19fec75a5 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -163,6 +163,7 @@ sec_pmic_parse_dt_pdata(struct device *dev)
 int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
 		   struct regmap *regmap, struct i2c_client *client)
 {
+	struct regmap_irq_chip_data *irq_data;
 	struct sec_platform_data *pdata;
 	const struct mfd_cell *sec_devs;
 	struct sec_pmic_dev *sec_pmic;
@@ -187,7 +188,7 @@ int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
 
 	sec_pmic->pdata = pdata;
 
-	ret = sec_irq_init(sec_pmic);
+	ret = sec_irq_init(sec_pmic, &irq_data);
 	if (ret)
 		return ret;
 
@@ -240,7 +241,7 @@ int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
 				     sec_pmic->device_type);
 	}
 	ret = devm_mfd_add_devices(sec_pmic->dev, -1, sec_devs, num_sec_devs,
-				   NULL, 0, regmap_irq_get_domain(sec_pmic->irq_data));
+				   NULL, 0, regmap_irq_get_domain(irq_data));
 	if (ret)
 		return ret;
 
diff --git a/drivers/mfd/sec-core.h b/drivers/mfd/sec-core.h
index 92c7558ab8b0de44a52e028eeb7998e38358cb4c..c639180ea686f4308af3f872cb1d2209d201b2e7 100644
--- a/drivers/mfd/sec-core.h
+++ b/drivers/mfd/sec-core.h
@@ -18,6 +18,6 @@ int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
 		   struct regmap *regmap, struct i2c_client *client);
 void sec_pmic_shutdown(struct device *dev);
 
-int sec_irq_init(struct sec_pmic_dev *sec_pmic);
+int sec_irq_init(struct sec_pmic_dev *sec_pmic, struct regmap_irq_chip_data **irq_data);
 
 #endif /* __SEC_CORE_INT_H */
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index c5c80b1ba104e6c5a55b442d2f10a8554201a961..05d4cc350a351d994e00ba08f5ce966d0d5c6a0b 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -253,7 +253,7 @@ static const struct regmap_irq_chip s5m8767_irq_chip = {
 	.ack_base = S5M8767_REG_INT1,
 };
 
-int sec_irq_init(struct sec_pmic_dev *sec_pmic)
+int sec_irq_init(struct sec_pmic_dev *sec_pmic, struct regmap_irq_chip_data **irq_data)
 {
 	const struct regmap_irq_chip *sec_irq_chip;
 	int ret;
@@ -302,17 +302,11 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 
 	ret = devm_regmap_add_irq_chip(sec_pmic->dev, sec_pmic->regmap_pmic,
 				       sec_pmic->irq, IRQF_ONESHOT,
-				       0, sec_irq_chip, &sec_pmic->irq_data);
+				       0, sec_irq_chip, irq_data);
 	if (ret)
 		return dev_err_probe(sec_pmic->dev, ret,
 				     "Failed to add %s IRQ chip\n",
 				     sec_irq_chip->name);
 
-	/*
-	 * The rtc-s5m driver requests S2MPS14_IRQ_RTCA0 also for S2MPS11
-	 * so the interrupt number must be consistent.
-	 */
-	BUILD_BUG_ON(((enum s2mps14_irq)S2MPS11_IRQ_RTCA0) != S2MPS14_IRQ_RTCA0);
-
 	return 0;
 }
diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index d785e101fe795a5d8f9cccf4ccc4232437e89416..c7c3c8cd8d5f99ef0cc3188e1c3b49031f4750f2 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -69,7 +69,6 @@ struct sec_pmic_dev {
 
 	int device_type;
 	int irq;
-	struct regmap_irq_chip_data *irq_data;
 };
 
 struct sec_platform_data {

-- 
2.52.0.rc1.455.g30608eb744-goog


