Return-Path: <linux-rtc+bounces-3887-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA610A8325C
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 22:39:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADDA01B62B49
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 20:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 572F4227EAC;
	Wed,  9 Apr 2025 20:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dis10PpJ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E61D21D004
	for <linux-rtc@vger.kernel.org>; Wed,  9 Apr 2025 20:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231077; cv=none; b=jqbYpcY74L1H5ojNGiaDtHcIqPuybLmeDI3sSEfO3t0uJHbuIHsANynI3ZAHt+KH2DaO4h7fT3kB1rI4n6/5mZJHknzDWyFrXBgoXjIGq8DsDo8ARWtP2rR5bLwJ/8nFFRwNsfQdbArNIru4OhUJ+Yt57vSCCphZQbF4pafa38g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231077; c=relaxed/simple;
	bh=9E57e45BxMl50555VhXLsBvSd4mm5Cl4BbZdxjc19jQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EzW7gD5JiR1Y3ZiJRa7frEAybwxNauDuD6R2Z59Fh6QEZP3OH9No/bfedFjFcaKKB3FWedDq6iU6C1Bcl7ghyaFC0493gm3PQ79aoWXJGO240UNAV3l03eReArPU1IRP0x2p/Tz8tGS53mY0WtPFZUJa0ZkKOjlFnJpMboxGjik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dis10PpJ; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac289147833so19096066b.2
        for <linux-rtc@vger.kernel.org>; Wed, 09 Apr 2025 13:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231065; x=1744835865; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aro3/v5oHaDdhAQCIG1fg5IWgisO7nOka33BpVTMzSM=;
        b=dis10PpJJhuLLHNlk8a/obGOaMJdSRYCXYh2upQuJb1jcQzWrlAC664y+VpfySvmQr
         UhVSEfDuvh0XFFSrh5FmL5wPe8zbp4Lj5rp2B6yWHqVJR3PEx9V+R7heoaSkq+ORV52i
         0Dr2NtbM6ALIb9Id10LekqdVU/hAp93o1u13B4MDR40LjI/j9BvYyqTWBvdA3qF3Td2g
         i+HFFQKseSUf0O9Pm9Hqg53z0nIBE6PGQls62GsR5T5JM/17Jf9EVDUiInOpdlMdl4QB
         0F7JmlU376JsFX6T1tAV8xZEVqKqSVWz/u1t86zWJtZbFbSK5QqTYkucdOA7k9hZkpBS
         mcPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231065; x=1744835865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aro3/v5oHaDdhAQCIG1fg5IWgisO7nOka33BpVTMzSM=;
        b=aV8gRU3mW1Cs1jlVGGnyLRL3yHHkTRuRf2IKe/2RKll1x2EqQ4DUPe/JdZ3D9UTaoU
         bF2JrB0Qier9Zs21yopLbd8kgJg202Sqe0EzojJwZC+KiDlqVkQnrqxKWO/4zWC8oSPL
         9Jw8oJUGIknAdH3ofm0qxTVQIEfALnpvAn57LkNjHCy1Kqmc1UVhCeuhFUXp+zmewaWg
         nLezcK2C9K+o6ZsRoJV8GxqFyX7ZnkKa/Xdi3SuDs3w4LThPA1Uo6Eo4Cv5A872H3/Ws
         4EpLmgc7EX1mmURz/0Eh/GVMGxlqSkHOVT6ttKkv3lfptM5rkLSOZvrFf7jaKlKPMqlj
         i7AA==
X-Forwarded-Encrypted: i=1; AJvYcCVPkurfmTRWr4c84R5qb2Vw9SW3C67ydzrZ14g3jdG+YLPvI6Cge4lia17bEUoKUigFlHp30MH6478=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywamc//PFWmT4YDHP/OtcyBzqa5IoVOORjaQeh7Gai2OCnoQ/VG
	2ctHhXCbynTppAZ6mOP0UkIuPHd2gnf1aH+GzbASK1wo04ZDC+Od4WaGsvqKnaw=
X-Gm-Gg: ASbGncumzxcWnKWqbC12oQyOTDOLnco0w/na4mSOq5qGPHwi8UTNOE/RNgct4In4t0Y
	g+xCOsx94DHJAgqCUeGQCxnuNxlYdSL5J2pN5tdr7HDUIqfQuGxbNM5vJosEb3pFwq0eY+fQynf
	RPxxtdSFuXbVn9kKUHS0evikrq0DWKsQuNVjefFmwzvjR54wBwR43ocMfOuIB984PExhyr8yYL9
	yYzUBhKMon9ATKYjtFdQV7WZlSYKYpeL/rbrMkefFILarNONV8XhNPpQmHBncPmyCi9keMTggRo
	G2AZU8T3k1EjtWwHK4iKPQIb8nz8ROGQujW0DhRKnXxeKxC7Tld5LjJLh6eNhtkrtAtcOgq6MH7
	q9TtX1HlURjZ8x/QDoHypH9Q4tAA=
X-Google-Smtp-Source: AGHT+IEdkkXow6n79ZWPbZRhN5XFCjydXvQNxgGlSC/PrHUaOACC0tp9PiBCaVoIN+0xJ5YXvd/Wlg==
X-Received: by 2002:a17:907:3e0f:b0:ac7:391a:e159 with SMTP id a640c23a62f3a-acabd4d8449mr5988466b.60.1744231065076;
        Wed, 09 Apr 2025 13:37:45 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:44 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:51 +0100
Subject: [PATCH v4 30/32] rtc: s5m: replace regmap_update_bits with
 regmap_clear/set_bits
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-30-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
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

The regmap_clear_bits() and regmap_set_bits() helper macros state the
intention a bit more obviously.

Use those.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index f4caed953efdd23fd0132d74d5199dec9cdfd294..27115523b8c25794a9f3ac8e734bb1ed998e9518 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -338,8 +338,8 @@ static int s5m8767_rtc_set_alarm_reg(struct s5m_rtc_info *info)
 
 	/* On S2MPS13 the AUDR is not auto-cleared */
 	if (info->device_type == S2MPS13X)
-		regmap_update_bits(info->regmap, info->regs->udr_update,
-				   S2MPS13_RTC_AUDR_MASK, 0);
+		regmap_clear_bits(info->regmap, info->regs->udr_update,
+				  S2MPS13_RTC_AUDR_MASK);
 
 	return ret;
 }
@@ -351,10 +351,8 @@ static int s5m_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	int ret;
 
 	if (info->regs->read_time_udr_mask) {
-		ret = regmap_update_bits(info->regmap,
-				info->regs->udr_update,
-				info->regs->read_time_udr_mask,
-				info->regs->read_time_udr_mask);
+		ret = regmap_set_bits(info->regmap, info->regs->udr_update,
+				      info->regs->read_time_udr_mask);
 		if (ret) {
 			dev_err(dev,
 				"Failed to prepare registers for time reading: %d\n",

-- 
2.49.0.604.gff1f9ca942-goog


