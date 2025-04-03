Return-Path: <linux-rtc+bounces-3739-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DF8A79F0F
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 11:00:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62AB01895792
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 09:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D18A24BC01;
	Thu,  3 Apr 2025 08:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g070MNra"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1552A2475C3
	for <linux-rtc@vger.kernel.org>; Thu,  3 Apr 2025 08:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670755; cv=none; b=S4KiSA325V68o3j6gYSzr80e2TQ02nl3Q688tNBgggfCJCjYqprOAVhaYaFKShA9bXrNE5PzMZeR3lQZcmEeketLsg61aDF6T/k2XlxUPoFdwohswwqNBzvARJ1AmRiHqzrgfxnS2DdreiTO/xft0pCoXfZ5jILvKVL8d2sw64c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670755; c=relaxed/simple;
	bh=y6yU6lYRyqEHU2RYOfcRxwcasP7T27SnGV4OR5isOHE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rQpP75hWw4/sVKjNNh3IMbzLAyAIvbFik0ICJu1VP3LkDgiVZXH9n3kr7jGo4Xvdv+LB07fZlEz1rzTxrlQ2ZHPLsf4F7OTvEA81rmkFaHfIs2LS058DG4VyUDON+BzYdFQR9rum133ygjKeSITP3Ki9yxssBmTXIgb3eACuLaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g070MNra; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso121625166b.0
        for <linux-rtc@vger.kernel.org>; Thu, 03 Apr 2025 01:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670748; x=1744275548; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pB7gFyupIzWsX2vSOEGK7q4UbjZdy1MRwKTSd+TQnVk=;
        b=g070MNraLUu9C+TbpnMBlzKxN/8ckq+vfpi6i2v7e2IfEW66QjhDjw2e3vyMuw5G4A
         Sh/4V0dCc7MpUs9VHiLL97WtrYMgj+dCOQXTKItOZrsyEx6RbIZjhX4wsAIhXCypARga
         BQQmlrYMejWYoYvFKyjcRzECEOHF9p3Yn8UorQ2wGQAwBwoeFYfzxehbHgcEMO/LsYc7
         pgs9+mbQd5GJUbcnVCPCdotUdlWfWF5XCbb5vUhdDHz+yWfZKSXPyOOIxKnjrLG7KtVu
         xJHWgfbt1jpSE8AVPbQ/zw8+xfdbVFAEZzQjzHtpaOckeWoDNPtczPqKlOY5a2LE2C73
         wJPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670748; x=1744275548;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pB7gFyupIzWsX2vSOEGK7q4UbjZdy1MRwKTSd+TQnVk=;
        b=MWYOex1Tf15R8Iu6arMtIQ3F7nDTloTKbgy5rrqRzHJkG9imjfDMgI28aK+JpCo+IN
         kRWMzC5A2bcrzbauF6uSM2nj1G91Agj+8KJFP0JKLDiNZslmBtUnJmzotVos7q7L5Ij4
         +bFW3nx01LOI5swFbQvtdexw5q/2j+Ri3S1qBHKzRM7zJ95Ln5PuP1GIQ1k/9dr0sk8w
         6PPPNyybluUO5iiuGtw3eWEkD2X23ZuKH2qpJHRfDAIFFCFChHAG5/MVRUuMzRvJdPRw
         Zz9YUxvoSN9bv3LO6T0edSAHDbjsdBjYNI3cjqqV4uo+1NqF/5LmUJ8/Bu1dp0PGrLsW
         XlxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPVxiOdB70MoIure4HEFYwHcX/+n1hL4JRYe0jT2fqbW83SqzwxgmQu3r9CNrrhlGTsUbQyPrDXs0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAQGh78dI1n92HkgyzRpD9dK6Z7sAc+xuFZt82twKkWtGVsRkg
	+tU+4lh5PzykKifLVNTCRtRElobajDalSUxP3S1hlPW5CPD487WfoHWJ1I4RTLg=
X-Gm-Gg: ASbGnct4LfCs2cVxK9kq1lqNNWhETdn2e7r4oKgbNvF9tQKaBR8mKh7/5oR9Kp9oy5x
	tCjlS9wnmaLXBKcgkWQxZVnDz2JO8CWjvrFJjyGWGwQgCuOOEbGhLuzm7drHeCov5GgnPUjoMaL
	sfOWXEsgTeiTiW237aGtD+LC6qwa1mMo+nGos7cDFph5xFi7Q6QhU+tPMb/XmaTs/1f8NdlzjDL
	2B4gPoL+ti9THDse+Jqji47xsBh/FICxtH2Ubdm01eae+rc4MNz/7frDuVOy+GpOwgezGTlQJ7w
	hnLa+D8ygYnJT8pgpifjpEzVlPbi13NRFRQID3bF2vuGvi7e1hGqruUWaUBM5/SlsNIiAOC9/bu
	WVxLmqJaSM9F8umDBp4cxFV3TasMbuxcxC9jEBls=
X-Google-Smtp-Source: AGHT+IHJBM6wgjWYZps6ri5VFfxoUgvh5j0PdsJYHzhGp7CXuLgrnxXEuXRPTmCkvL8y435madc/FA==
X-Received: by 2002:a17:907:9708:b0:ac1:fab4:a83 with SMTP id a640c23a62f3a-ac738a50828mr1837746066b.25.1743670747866;
        Thu, 03 Apr 2025 01:59:07 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:07 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:04 +0100
Subject: [PATCH v3 12/32] mfd: sec: sort struct of_device_id entries and
 the device type switch
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-12-b542b3505e68@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

Sort struct of_device_id entries and the device type switch in _probe()
alphabetically, which makes it easier to find the right place where to
insert new entries in the future.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-i2c.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index 8e3a365ff3e5533e27d94fa8a15dbfa639518a5f..966d116dd781ac6ab63453f641b2a68bba3945a9 100644
--- a/drivers/mfd/sec-i2c.c
+++ b/drivers/mfd/sec-i2c.c
@@ -154,12 +154,12 @@ static int sec_pmic_i2c_probe(struct i2c_client *client)
 	case S2MPS15X:
 		regmap = &s2mps15_regmap_config;
 		break;
-	case S5M8767X:
-		regmap = &s5m8767_regmap_config;
-		break;
 	case S2MPU02:
 		regmap = &s2mpu02_regmap_config;
 		break;
+	case S5M8767X:
+		regmap = &s5m8767_regmap_config;
+		break;
 	default:
 		regmap = &sec_regmap_config;
 		break;
@@ -184,11 +184,11 @@ static void sec_pmic_i2c_shutdown(struct i2c_client *i2c)
 
 static const struct of_device_id sec_pmic_i2c_of_match[] = {
 	{
-		.compatible = "samsung,s5m8767-pmic",
-		.data = (void *)S5M8767X,
-	}, {
 		.compatible = "samsung,s2dos05",
 		.data = (void *)S2DOS05,
+	}, {
+		.compatible = "samsung,s2mpa01-pmic",
+		.data = (void *)S2MPA01,
 	}, {
 		.compatible = "samsung,s2mps11-pmic",
 		.data = (void *)S2MPS11X,
@@ -201,15 +201,15 @@ static const struct of_device_id sec_pmic_i2c_of_match[] = {
 	}, {
 		.compatible = "samsung,s2mps15-pmic",
 		.data = (void *)S2MPS15X,
-	}, {
-		.compatible = "samsung,s2mpa01-pmic",
-		.data = (void *)S2MPA01,
 	}, {
 		.compatible = "samsung,s2mpu02-pmic",
 		.data = (void *)S2MPU02,
 	}, {
 		.compatible = "samsung,s2mpu05-pmic",
 		.data = (void *)S2MPU05,
+	}, {
+		.compatible = "samsung,s5m8767-pmic",
+		.data = (void *)S5M8767X,
 	},
 	{ },
 };

-- 
2.49.0.472.ge94155a9ec-goog


