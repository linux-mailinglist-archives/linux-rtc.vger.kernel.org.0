Return-Path: <linux-rtc+bounces-3601-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78736A6D213
	for <lists+linux-rtc@lfdr.de>; Sun, 23 Mar 2025 23:42:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D96D188F826
	for <lists+linux-rtc@lfdr.de>; Sun, 23 Mar 2025 22:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB5D51F30DD;
	Sun, 23 Mar 2025 22:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zeR+DCHD"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DDD1EA7F5
	for <linux-rtc@vger.kernel.org>; Sun, 23 Mar 2025 22:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769593; cv=none; b=l2cSj4BFKMbGigtPDETvCBxjOynueEmcCkIIdk2/mOfm95CYOPtQ6fKwyisdJcmtdLjKPOo8pjUCo82ppi6Ebisahx5Y07wJNDxNFGby2YTCfopkvnfnrF6rJxVxau4Br3DKRNhCNOWn2WwJ99RN4fffxDfhsskrO/BasylIO6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769593; c=relaxed/simple;
	bh=PIE3UA5RRPW78dm5St1dv8icSuMZdl9l2kQ0j44xOOk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M+qLDitqQowCsIPiPL9IiWAcxzgcE0I6fb8hUGp5kAUK4ge26FwhZ9qY60a6icxzDxSJ3zJdUv3MGHwyuw9YTbgoZNvW2d8ZJRFCVWoSxUeD9b9gXqWJGlWbrb7vSkuWnIAvbugZq7e1Ds+2tLu0nFf0H15rziHlfBQnZIJk2Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zeR+DCHD; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac2963dc379so636679066b.2
        for <linux-rtc@vger.kernel.org>; Sun, 23 Mar 2025 15:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769584; x=1743374384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jhTacnWIaHzojbgZVRhkXLoj0m8Qn0dJu2GgWCUO9Oo=;
        b=zeR+DCHDsDBIMpShQebkdtUXd40HXIHIzeIvW7Kd+RwPGGXp5/ug1FhtqNmdp0LjpT
         89inYhfOkztgyaHcOSyUKjD62uXumVJsbYEuhsodv65UAAcZWAaQWGQOn7O2EmSiTIly
         vYA1ccF21zyR1GxD68OogxS8Vw06JkrR5s5JVYQYxLftw0dwbbSuBFq5eWzOijVSfRoF
         8qT78qjhKymxXXtNqphz5NjHp0+5HjuPiZSz7jqp7obOiMYeyMDVZCsz5xXEmAnpj7AN
         82OwFGTRWWles4Sc2f3lL9q6w688lwkqMRA49Rg1+meWzd7qZ8CumTyXWx7ittyOKLnC
         SFiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769584; x=1743374384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jhTacnWIaHzojbgZVRhkXLoj0m8Qn0dJu2GgWCUO9Oo=;
        b=Xkbdz65WQUR8qciOfgBc/RQf3K3EKvcV28/x43mBAeLlnX/CGo+bHpNIaLPhoC5YYn
         8kZDJJd22HX3A7IbaVG8MBI6UrlBfEWwYJ/itDB5AybugruomWZbHyilWtjOdmyQzLVD
         568Fijx6rbF+k+sxhzoM+IUt1XRNmp5K+Nt9I7QV5j+KGdGqZ/rXl9K/PlA0+xT1vLVN
         BbtX1wRJyG6lX8pCfkzj1Cg1T4iYxLm/mFZhdVTjrobYf/Za1zoFAf/FQ0CaO0QqsskF
         NxUDsA/hWXlcizSXr1gN9F7DxarS3LWSBWXTb8ixrLCgI1eq+ChJzObTPEC+PRTqK7KQ
         DYoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvFnFSLIEMmCZA99Ldl14xsbjdGcbouR8aiZotbbwwB8EoD73WJnl0SFXwhGdUu7Ed/R0vfG5rJyc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4kTOkaUF/MJfvd3N+uXm2RkxQZzstnk54/BPLbYu+0+eS7FQX
	A74Ut578FqRZdfXjLFavcmkwpS/6DbzShcxdfIoBhWJIBa6RA5COTOxL5NeV6QLaCS3B1CT2sY4
	1qOA=
X-Gm-Gg: ASbGncupsbjp8FJXixVIHuTNZSrwHIsLh1eNVWsBFql/94rUzs9RCAOTtEwJzpXAmUH
	251pJEqBji4hIrhfSEU3M5fNxil5usF30HEAH95RJ4VeH7X5DUyT+DoVkzPVLPpBpj2HtcaMIoE
	vYxpZd6f7STZ9+lXh6rLfazWr7KGBKDVeZ1B3OgS8di/FD8gNoHa7AkLot/JBrGE5uBrsL7oQfx
	xWq6yAEL0nhc2z/n3fTV5qsSlKIg1pkVU5tzT1ddV3UAmJUgbmNCq8Evq32N6wD6MXvdoArv1J4
	b+ZEy5zhnQj2CwUPJ7hWfdK8bCq4AgeEMUXrnYcgWYkGIIEQdMGAvoBeEpL/Z5Z3uMPRnBt2HOh
	sjpp325V/fcohQMl6NPxEgW4Q3/JT
X-Google-Smtp-Source: AGHT+IGBmk43Q/5KSqStfiKdhkMzhnRppuC/FFtUW+Zjtoma50FlDv2NtShPafcq2wFC3LRoUhXzZg==
X-Received: by 2002:a17:907:d2dc:b0:ac3:a7bb:1c2f with SMTP id a640c23a62f3a-ac3f241b95emr1147181566b.7.1742769583868;
        Sun, 23 Mar 2025 15:39:43 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:43 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:50 +0000
Subject: [PATCH 34/34] MAINTAINERS: add myself as reviewer for Samsung S2M
 MFD
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-34-d08943702707@linaro.org>
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

I'm working on a Samsung device which includes this MFD and would like
to be Cc'ed to further contributions and help on reviewing them. Add me
as reviewer.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d686e02dc7ccd61e35173df997d2f894ee5ab515..10945909f5b317a894b6afbeb6bbccd1a691de9d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21341,6 +21341,7 @@ F:	drivers/platform/x86/samsung-laptop.c
 
 SAMSUNG MULTIFUNCTION PMIC DEVICE DRIVERS
 M:	Krzysztof Kozlowski <krzk@kernel.org>
+R:	André Draszik <andre.draszik@linaro.org>
 L:	linux-kernel@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained

-- 
2.49.0.395.g12beb8f557-goog


