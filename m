Return-Path: <linux-rtc+bounces-3678-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3523CA74B0C
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Mar 2025 14:42:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A55F2177BF0
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Mar 2025 13:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B53DF2356CA;
	Fri, 28 Mar 2025 13:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bvKneH+s"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78EC21B182
	for <linux-rtc@vger.kernel.org>; Fri, 28 Mar 2025 13:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168670; cv=none; b=lfl22mblF68o/7utMzKBy0fX6LRrOvNAC+6h2RMGsngqKkKHgRbcTa0rYi8H9Eu32mfQmHnAdP/+IU4xeEtrN3mtwhR5ykpG3pYMeTFct05WnIMYwCnuT38sUalXbnqg/0KmVPCUkVlPS2RVvv/6Cp91EtQQhrNZtw7FAaryGVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168670; c=relaxed/simple;
	bh=acDeJKyeAKIRosg5ADxV9Zz9Wij86n9v8Z9fpq/Qhv4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fh4u3e8W2T7Kpj89MClsuNpDekBvUhbsC83CPlHKj6xdt4VK55DC40ZFiymgYvjlT5t09GcsRmjeq+70SAGQ6NeMFRAVawejwKFIKb4gFZXfFfj93QL5uOl2u2Dl5dAw0ICLI94nMPhiS6B7D1kC5GYZyo8puMMrvD1pt6xDimw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bvKneH+s; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e5e8274a74so3529606a12.1
        for <linux-rtc@vger.kernel.org>; Fri, 28 Mar 2025 06:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168661; x=1743773461; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GcW1mWBfWGvNcEl9sJWjMnkVLrjIE7eEENFwEaEA4Go=;
        b=bvKneH+sQ0S+FWIi4x7KGXFixQX7Hfjyx1Dn4wGs6ifhM6U32D7OrnFVvpZz9fJQUJ
         KLcgVGGCOJ7txjPe2H9WjZiMkXJbb4O1j0LRdDX+SCE99S78R0+dNP6PQpJnuqxllcUG
         wV4g5CvKUd0+pvMcVShUnNfdLVPiA+CUMwdaK5AxYktMhxLeokopLhGhE66z4MDg4FrA
         m3dwfx8QNFQEXOWnYpJalKYVhwJhwjcOhntlzc5RVWDp/aNl0lHUdI8zzZJnwZ8jopeB
         yLlD1rFGHIgp8mfrh/8gtkFuUjcBuHeyXxxovrxhtYUNWa9CI4f7thV61wZN0cUJsCcH
         c53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168661; x=1743773461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GcW1mWBfWGvNcEl9sJWjMnkVLrjIE7eEENFwEaEA4Go=;
        b=HYuzlDxphiTg1gkMkVR7mWGEbeUpqgkZZ9A0+8H6LRhEGXYZA1f5ZyeoatkS2KCjm+
         b/XN7Jkb31HN/tmKSeIzcQP0nrlq8d+fvkcAnjzJfYNwMpvQPWY7lLs/E7yqEGKk7epF
         YWvwrFIAGpQNGpO1yNhOspYCeZvSb6cbPs/DvdtiJ5/4JtMeFW/M1gfvaPxV/6qjPdjp
         75oTs+kJu4l/ZK9b3BbWc7OeXh9t2Z1HmZDQryuqVLWy4Mq7rl5UgStReNCrkU1Wi+He
         Mu92vHZX+jEkj9qweIjRzxbaonHi+yGOSAY8m5BTrpezTeii8ygWdjXfiI0hHVj9ipUu
         aBuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSI8GV7gMdqvyp9lqA4UXMUIoa/tBWnTu0ofZ4YjFlRlfLvXKya3fW7dDAdmR2TMrpJBK6+2SAU58=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHN3QP+L06yJo8I9N4JynXc/cDEPDOGIAIJUSy+WWgwJOFmYa0
	MWAswpKeY52kMWvEoXo0OLzkT2j1SZ4PIu6vBUGIcUlGqYlenTwy7VMkKuG//BM=
X-Gm-Gg: ASbGncvmPQtUuGIO+QNClpFyA4jZmWJm4imDwxO9ViRREW+ateXFcHRPZIBU6dg68n4
	cDyUBgdZo2d7he2QZcF0GY99LEcEsLvT4XkepxF9RVTgQ8oqC96bStCeVuQH0/lGIKzUjbORxdd
	VAgJMR0hTWCERxhCAUTT9rL8/R+d/3UNMhGfLfUrU/lLCR3vdziTueFXLJcWK5oYMe8Znlczw8c
	NW8y0w+cFcLRLKoofwJLRmHKDrJ8ZJ7/MZ33YLVnYgq+tGeoInOxYCDIsNha9Yi/Kd5kqs25kJt
	CNCcmeGerSGqh1XbURM9T+4XzDjwyHPzaj/MTBRUIAZn2JgTUfUo6rWTtMbdGxiC+n3wEYbiju9
	egKiRKo2BysFkQS/ETpUjmcWaGrjC
X-Google-Smtp-Source: AGHT+IFoyjCdv6rnlWEUloFhpOSmsaTb0sh0cSCSk2tmwmMxrnGI+F5Pjs7eau9btRCy52IBbxAE/A==
X-Received: by 2002:a05:6402:1d4a:b0:5e5:ba77:6f24 with SMTP id 4fb4d7f45d1cf-5ed8e59e28cmr8076694a12.16.1743168660911;
        Fri, 28 Mar 2025 06:31:00 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:00 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:29:00 +0000
Subject: [PATCH v2 14/32] mfd: sec: s2dos05/s2mpu05: use explicit regmap
 config and drop default
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-14-b54dee33fb6b@linaro.org>
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


