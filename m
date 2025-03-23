Return-Path: <linux-rtc+bounces-3585-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC967A6D1C8
	for <lists+linux-rtc@lfdr.de>; Sun, 23 Mar 2025 23:41:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BC1818885FF
	for <lists+linux-rtc@lfdr.de>; Sun, 23 Mar 2025 22:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56EF81DE8AF;
	Sun, 23 Mar 2025 22:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ytCHdf13"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A556E1E5B6B
	for <linux-rtc@vger.kernel.org>; Sun, 23 Mar 2025 22:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769582; cv=none; b=A240pEf/VYrfVp7vApbNTbYt7r9VcrcDK5xoITrxFzCzcoGpCzq53VlVkJ6C63oq37QNfgDn04nRN6qHLdTGM0XeYbIxoZLyKP+X+p2oiL8Q0r/w6LszgUKnctUmWUzKTPZG2mpvB2VIANNYzBaa8o94lqiztfrPpjOHvDTe5/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769582; c=relaxed/simple;
	bh=CNr8O5YK2JQvgLnYqrPn1/s+31iKPD62ZA/NdspWTmA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QjHyXeyF06/8g40yK66ibSoCEeFQXPthmmABNPs9kpQWhawkofZAzXG3nHQpTDqHsWR4JA0T+VYX4RhenmUate9GLurfMOD5bdyBRRoPZeh5Zy0fqpwRLvEZ+QmGwVxpl1MzITht1kM6bv9GC/GjH/FlK1T9Zs5DslSt0zli+IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ytCHdf13; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso588941166b.1
        for <linux-rtc@vger.kernel.org>; Sun, 23 Mar 2025 15:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769574; x=1743374374; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ma2h8YcPyNzHzzZtNTsrMSq+4WFWkERbNAUqbwhG/XE=;
        b=ytCHdf13wQ6wy9w2OC+acXO/7QQuQ964Lje7iCXaJKOv5ibrRpLS397TcfRJR1kq7u
         PbKza7+Uyomr8s+8ztSGfVZw/Nbf0nhi2lv/16WaVGbdKhKdI6ifWqXtKbo0KsseLr1d
         olViCTOQvQenLyUjQzkPyfTmTlk4F7LjSDoThJoTkHYv0hERy8wl8Fj6AiApIK483BTi
         S9TSqX6zG24ms89OZcRG2kK/gtpI82ihdfAFTpk3QCWwRXBkfxp/X0gX71r0l+LLX144
         YzEGBviX+jBTOmnS/oZL/Z+6kAWCvkTDVryEmVCth79Ks/ALcUNRO7qtZJt4gDgzunDP
         p5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769574; x=1743374374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ma2h8YcPyNzHzzZtNTsrMSq+4WFWkERbNAUqbwhG/XE=;
        b=viVQDgmPt88+hmkqgdrbCQaElUHmxIK5CgyywMz5vZnaHL1FUvu26m5k1+ZNecVsxO
         nrZPwjUjd7E0F9x7Ne5vNNxgiKkvaiyk36hEDGDDw9OH/m4i+305KG9SQNYHIWWmHWSr
         Gy+foz5NTYX6CZxdV+g5WosUZyyla0iNXV4PC6nHdBxKNTz409+HKTo8Tq2GSoBqTqQB
         7bg06UJYLsFsSyYgq2iAsL7myL0Q5IkvKj8oTFsEb5Ikdt1NqiLt752LGdNIO5KaLsml
         HjcAPYCx9qoZ7y9xoB5YbrbEksu+EiHGREOrdwn8wAGlZzheekc1qzIGtPjkDHFDgRM6
         GJ4g==
X-Forwarded-Encrypted: i=1; AJvYcCUb8x/ObMafMAqxf30+rrYR7YJPaxndZ8B6byfDLJpJcBOVK6Kbl9PhJ6PokQ1xs9RTT/HOUzMktYE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYBuCJ+0cA0CWJX4fSGrpP63nS1bFKelnqA+NZc/lNa/XfoY4O
	PWVAZiOXF6iHJDySTMyrlZto+TKdJ3sjQqQrVO31dZW57dXd+asFJyLxJ2wHpEs=
X-Gm-Gg: ASbGncuujzH8KOznErQ9alrHil97u5WSX10FgpJuTXkLSVu2FnhhmzTCUKRX+NwAtH6
	f9hcRr7dzO7+TiNiOD0otcCLLAB3x1WCBbuWnYzanoAJdzMKKy9MpN9FV1+SNPKu+utsT82VXj6
	ApqOV0RqMGs5wGtzHXVoijg0W8/gqekTIu6jlfVPBfY+NfSmjANe5yVLQIXDmX44vkNHWJ6cmKL
	t550dRwrWSpGE84Iw/Q+P3Y7DWfXtsqttDbvSAKDXB52+B3pexbGp5IDxfvcy9CJrwWQFYU/unL
	3NzPjJArH2kvFdBBQLTu/lMeW29qFCEPMMb42NhBdi8ZPDU/AMrj1u5iT7VZAQ3c1HE10hA7h7a
	oRB/gIbsIvp0UD9JIMdyF0MGMqM0L
X-Google-Smtp-Source: AGHT+IEAdjv9xEbMYB+Oz8xJ1E35q2wdeD2HNBvV+6r3g5vXOlzMcwWya0yXpD0Ui6X7vYMMVnjHVw==
X-Received: by 2002:a17:907:d91:b0:ac2:a4c2:604f with SMTP id a640c23a62f3a-ac3f24a7838mr974893166b.46.1742769573704;
        Sun, 23 Mar 2025 15:39:33 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:33 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:33 +0000
Subject: [PATCH 17/34] mfd: sec: drop generic regmap config
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-17-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
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

Subsequently, the accidental new users have been updated, so
sec_regmap_config is an orphan again, and can and should be removed
from the code. Doing so will also ensure future additions to support
new devices in this driver don't forget to add a regmap config.

Drop this fallback regmap config.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-i2c.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index 3912baa5c2f918b7ad345e2bbbbe4daf2e49ca6d..1bdd6ea36fcd9f56ea5ec1159a87723f4c09a0bd 100644
--- a/drivers/mfd/sec-i2c.c
+++ b/drivers/mfd/sec-i2c.c
@@ -61,11 +61,6 @@ static bool s2mpu02_volatile(struct device *dev, unsigned int reg)
 	}
 }
 
-static const struct regmap_config sec_regmap_config = {
-	.reg_bits = 8,
-	.val_bits = 8,
-};
-
 static const struct regmap_config s2dos05_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
@@ -196,8 +191,9 @@ static int sec_pmic_i2c_probe(struct i2c_client *client)
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
2.49.0.395.g12beb8f557-goog


