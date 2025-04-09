Return-Path: <linux-rtc+bounces-3885-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14627A8327C
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 22:40:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E8CC07AF92E
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 20:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03D4F22330F;
	Wed,  9 Apr 2025 20:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uQ2JPrfy"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A2121CA03
	for <linux-rtc@vger.kernel.org>; Wed,  9 Apr 2025 20:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231075; cv=none; b=j0PmM7EzURW6GYd0vKkLWPwyEMCBqOYnn2oDhQzHC9YcNw1BwUgHdlcwnR4+ZQoqmCnZXNHLj15eIfZlzfFyXaBmRZce/E5pMx14Bu7D16QOEdm+p4EuCE3PoKuuaJGwzFZbGX/lRA4j5C24OMNHxxHZc1XvZaJQYe0+XWCMmYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231075; c=relaxed/simple;
	bh=CoKrSJInLiIXwlY1ZZ7M5lRUgwJwFwDmaqWcxDpmqQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mfhNaXMoZMtPrR71Sq79RC5Pw/KqYB4zsD6FWWTZjR+HLOg0OyEMA1/bZ1hMWETFXNmbXZs1D2tAuT2J0LU5K//Ygu6q3j/z5iVhh83A/1zgpHaele9WIWIfAdCcoaT688S7QdtCrV6RBWEorvWJGj0M8Rwpj0ga1+w4pls7zVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uQ2JPrfy; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac25d2b2354so16876266b.1
        for <linux-rtc@vger.kernel.org>; Wed, 09 Apr 2025 13:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231066; x=1744835866; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Ow5hOPbiIZXZpWZ6Uu6oQmw7CcTYqg39bQG6yedoPQ=;
        b=uQ2JPrfyUL4InhIYJFfMorllx1mzrBQFlwuQghTNuTEbVA9uzUptUuwbdJBoR7sROh
         daTsVIxDMfBXo7w+dSyQIlEzyUb9SpHT0s+U2OejvKDOAe3f63hTr98Ocglgvzu0kOiW
         5aPEr7xyLzTl/SR6ZlMYr3KMb2J5nR6dp7PwMY4q7l3ifdl5qy1+OgUVTT277z/DVMtl
         2C09nOWOU+haKmfD+V5qqmX+QlaBeru5pUvZXVlQFAbDo2gCCRE1xllwbOGyryoVxG9o
         dXbAP/8Wj70FG/MrKFv2EC/bpoxg3391AilSGNJjDySBH7hlpRXOohBHIJSVpJIL6W02
         aTBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231066; x=1744835866;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Ow5hOPbiIZXZpWZ6Uu6oQmw7CcTYqg39bQG6yedoPQ=;
        b=N2SM2LwUeZlaWCqFyopR8T3q0go0VVA5ELkP9SveAN/u6ahJnn4D0A70Kz44RH1JA/
         jPO4QY6r/AgM5llf7yHTDDLx3UUzlRi1vryIJ2cN0Bblo972snrq7OtnJ19FOr4oag8r
         ADRRiGUKLrEo9/gA4IOWtBNkhpgw75IAF1CZKniixODTcwepYTvwhNKQg9M7inflm+tW
         1AaItVeJmoFtBdVa2RX6+5nlhyNvJZYzQMjkYEg/t92czChPlojf58k5fbXiHHAbp0Wp
         FpjNZneFk0Kn4Ue2DYn9k+z+yThI93dV3ccoIBQu1dSrx9pLPs3V2QcitA82IHjvSko3
         GzlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpdPB6ICcKrcmq0pcq35IzOgZD6N+rmLnr4bmpHBiC4hTMLifBQVy6/XNfnfn07EtQfuRxz45/8X0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBVyj6+JzT77Va1v0J787dHCwwdDqIXQRjnWzsWJ5QzM6Su0FZ
	1y+YzssyayPUrEa1RD+Ljurv/KWRnCnIZZd6l8/l4I6BB16mJ0DQ0i843JZ//XI=
X-Gm-Gg: ASbGncsroohTlzj6a0+NAyJ0tyMm+H1/UQ9TtOBubUXvmoJ/dGNsxY7ThUuRqvtgDgZ
	VMaCqvGWq1VRnYkfQYjEKD4mtQe4ctxg3jLAvyKi5LFmyLE0ErYR8gmodMqst2vzaMDwr7jttsR
	/mwM9h6J2BxNWkMKcw5krUduh0VN5fhWBgSHB3kJ7Fj87MJ/9rpGYsOhHy5M5rSQzq9+6i1Rp+5
	AauUKtTpbDGDCo9MwcOIvxfoDCiRm6XhC5WP+q9X1p0aE8k05BBnsOCNRMRiBNBz1BkD5vp1udS
	t2K+nbb6tp3rx98Ww9nVOwxIWJSFNSJnp54+ssDPf44XrIaQIV1bAVkwoK4ATZ/Ieq+/OTgHvl2
	Xcp4bzdafpKLFv855r9AY3st+5F8=
X-Google-Smtp-Source: AGHT+IHIxFKwjUo5uFV6Jyj3wWXPZsF8lPwam2ydOiylWhWcuYhWeTd4XU5X8ZDB51XZhRzJ2FSu4w==
X-Received: by 2002:a17:907:7d8b:b0:ac7:9acf:4ef with SMTP id a640c23a62f3a-acabd4d7131mr6904366b.56.1744231066055;
        Wed, 09 Apr 2025 13:37:46 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:45 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:53 +0100
Subject: [PATCH v4 32/32] MAINTAINERS: add myself as reviewer for Samsung
 S2M MFD
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-32-d66d5f39b6bf@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

I'm working on a Samsung device which includes this MFD and would like
to be Cc'ed to further contributions and help on reviewing them. Add me
as reviewer.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d4d577b54d798938b7a8ff0c2bdbd0b61f87650f..9f05af52b062d8cab0f8b48b2625432108604c3e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21397,6 +21397,7 @@ F:	drivers/platform/x86/samsung-laptop.c
 
 SAMSUNG MULTIFUNCTION PMIC DEVICE DRIVERS
 M:	Krzysztof Kozlowski <krzk@kernel.org>
+R:	André Draszik <andre.draszik@linaro.org>
 L:	linux-kernel@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained

-- 
2.49.0.604.gff1f9ca942-goog


