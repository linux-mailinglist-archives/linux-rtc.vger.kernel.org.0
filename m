Return-Path: <linux-rtc+bounces-3740-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25435A79F1C
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 11:01:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C4713B5EEE
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 09:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D84824BCEA;
	Thu,  3 Apr 2025 08:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b8vvVP5n"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E8E248166
	for <linux-rtc@vger.kernel.org>; Thu,  3 Apr 2025 08:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670756; cv=none; b=IMv+VOZeQmAObKjoIC9ifRj1dHsBNAWRrgvG44D0XjX6GoaW9drSMl5DCZZL16QKEo6Z6TYD4XJtcJM1zFP4bQmYEh50WwMOTAz+w2vDMyJo6vHwyTSZp5jrFe6Y0RdEwPoNtNmvDhh0OfQdrLUDFHv0iJBva6zu2lsQ/ZvWW+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670756; c=relaxed/simple;
	bh=acDeJKyeAKIRosg5ADxV9Zz9Wij86n9v8Z9fpq/Qhv4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LAUwpn4xaZOF+VtAYbuP5rLunWsRAgp7i3dUWpdmUcTXwEm1k6jqajdEGxk6WISxyjQrItl2f1tOk5TDoHSdWGBAy4MQSkKArq0El+LHf/QUTPu9HJz8MusTSVKvJhf4KAjYt1VBgwzgXEZxy4sk9vTReCvpDv/wQEahAd/CLjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b8vvVP5n; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac2a9a74d9cso115698266b.1
        for <linux-rtc@vger.kernel.org>; Thu, 03 Apr 2025 01:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670749; x=1744275549; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GcW1mWBfWGvNcEl9sJWjMnkVLrjIE7eEENFwEaEA4Go=;
        b=b8vvVP5n3VQ/7xgndVI4/3Mc1UEnjaBRmBKWVLRViB9QlnvgD8W35fGmn5PhpNSfDc
         wpgyPOr2uKWevcFFFjFyPFeRsYheQdZKuYy5iyPBViwcIoiuoEV+IYOlra5oJFydozFu
         iKw7LlGBOixRlHNvlSl+fGDVVgz/kUACKD1LNyr7NIHtRPpYlxKwtKHifKgkADnltbPR
         WmAk76V9abSSn6XS2BYO5GKH0DAxEnBMGQsy3Z7bNTsvLN0yXMmmTB3yolyMO/r7F1Fo
         NUHKWdu9DPl+vM7cOZWzHwKRkY5ad+7/rYe8MvgT3h9p9iEm85cJHB97ru8icOfjxZI6
         rxgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670749; x=1744275549;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GcW1mWBfWGvNcEl9sJWjMnkVLrjIE7eEENFwEaEA4Go=;
        b=q2WQPb926YSsBVrPoh5p35EU1Qobijm0GHlzyWTuX+FfOJmG97idnsfw2e+VTaQXXT
         fSGdv3qlEDlvcM7Q/qCg7sENwxkh4ZTZlmK6uRuZIWe757ND6YTWZzaHLI0E2/WXtOMS
         C2iB8jhVV8PbaM6atIqgkA6ralsKDCPDphPIOq55rDsy0zCuxSraQ50sSSdt/pBmJqY2
         jU9ADVA+QGlwtBJGyvGmca3kCD2+Z7QRQaA2UXr6iKmVLFlCLZ815DyoAfeT42o4inMt
         VXwonfxDVufuJCtQcyS0ym0wOKgjDcENpnl3H8JRwGcfyFT4blKtbjTaOXBT/1Bwadpk
         +EoA==
X-Forwarded-Encrypted: i=1; AJvYcCVkfeJdAvecoywV7lPm6q9eJ8ZGSSkvuylCI49QzQzrUAln03ck30BoWUV7awZByUYlDEzHhPXt8g8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZPftDHhFOq43kL3pSuthL7RSKrJ6qKDCoeaINrwempGlrLFfp
	TApC/qnimrklwqRHQ8VW4pcjuYd6snw021C/OD6+ePnUoRuPWtxgO57ku5n5Fy0=
X-Gm-Gg: ASbGncuPCQxq/6tlScoaboUo/EI6yrsoBRzdK9Nu8mkiIBRKNBDNTnW5TISPlRHp6RH
	vYCS4qgNaDDxNzIiK2so3Uvdhxu7yNdbIYNhxsi/uBvbstkxo/cr5To9BrhB8Ze2+TXchhIiBFg
	IVBA2MphxUhU9v/WBo93YWYfs1dzGU6udS+jhMaPHt79za47wcub4EYctrM7OhojHgLldoUgNFO
	bwk+9iga6SO3m+/rgn04CkqqJ0l50xo8gjIUZn7pT4Jdk4uUQfn/fMFMbGKLOhzB+Bdtav2+KTV
	g8cpGq0FogOFoQDLyIoWk3zmcHNgp9IOobfNCM2/SZwxwDAXMrQ5ZOMo8GE9PNF0ehudIZSX9LS
	wPrLGr26NBu1EBvINZYwgAuPHM06t
X-Google-Smtp-Source: AGHT+IGavhoPGzCabBNLBzdbL3jiat+xI87iDC+wiboHJiUvbmM/Wprhewp9oSPfUMvc9gVC8l54GA==
X-Received: by 2002:a17:907:6e87:b0:ac7:3911:35e7 with SMTP id a640c23a62f3a-ac7c0a97bb3mr143560466b.59.1743670749216;
        Thu, 03 Apr 2025 01:59:09 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:08 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:06 +0100
Subject: [PATCH v3 14/32] mfd: sec: s2dos05/s2mpu05: use explicit regmap
 config and drop default
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-14-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
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

When support for PMICs without compatibles was removed in
commit f736d2c0caa8 ("mfd: sec: Remove PMICs without compatibles"),
sec_regmap_config effectively became an orphan, because S5M8763X was
the only user left of it before removal, using the default: case of the
switch statement.

When s2dos05 and s2mpu05 support was added in commit bf231e5febcf
("mfd: sec-core: Add support for the Samsung s2dos05") and commit
ed33479b7beb ("mfd: sec: Add support for S2MPU05 PMIC"), they ended up
using that orphaned regmap_config in a non-obvious way due to the
default: case of the device type switch matching statement taking
effect again.

To make things more obvious, and to help the reader of this code while
reasoning about what the intention might be here, and to ensure future
additions to support new devices in this driver don't forget to add a
regmap config, add an explicit regmap config for these two devices, and
completely remove the generic regmap config as it becomes an orphan
again that shouldn't be used by any device.

Note that this commit doesn't fix the issue that s2dos05_regmap_config
ands2mpu05_regmap_config really are incomplete, but I have no
documentation on them.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
* squash two previously separate patches into this one (Krzysztof)
---
 drivers/mfd/sec-i2c.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index a107a9c1e760f90fcb59a9944b74e9a39a0d946c..81f90003eea2a40f2caaebb49fc9494b89370e7f 100644
--- a/drivers/mfd/sec-i2c.c
+++ b/drivers/mfd/sec-i2c.c
@@ -61,7 +61,7 @@ static bool s2mpu02_volatile(struct device *dev, unsigned int reg)
 	}
 }
 
-static const struct regmap_config sec_regmap_config = {
+static const struct regmap_config s2dos05_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 };
@@ -120,6 +120,11 @@ static const struct regmap_config s2mpu02_regmap_config = {
 	.cache_type = REGCACHE_FLAT,
 };
 
+static const struct regmap_config s2mpu05_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
 static const struct regmap_config s5m8767_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
@@ -138,6 +143,9 @@ static int sec_pmic_i2c_probe(struct i2c_client *client)
 	device_type = (unsigned long)of_device_get_match_data(&client->dev);
 
 	switch (device_type) {
+	case S2DOS05:
+		regmap = &s2dos05_regmap_config;
+		break;
 	case S2MPA01:
 		regmap = &s2mpa01_regmap_config;
 		break;
@@ -156,12 +164,16 @@ static int sec_pmic_i2c_probe(struct i2c_client *client)
 	case S2MPU02:
 		regmap = &s2mpu02_regmap_config;
 		break;
+	case S2MPU05:
+		regmap = &s2mpu05_regmap_config;
+		break;
 	case S5M8767X:
 		regmap = &s5m8767_regmap_config;
 		break;
 	default:
-		regmap = &sec_regmap_config;
-		break;
+		return dev_err_probe(&client->dev, -ENODEV,
+				     "Unsupported device type %lu\n",
+				     device_type);
 	}
 
 	regmap_pmic = devm_regmap_init_i2c(client, regmap);

-- 
2.49.0.472.ge94155a9ec-goog


