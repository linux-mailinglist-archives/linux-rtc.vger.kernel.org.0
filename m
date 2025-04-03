Return-Path: <linux-rtc+bounces-3729-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF42A79EE3
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 10:59:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE611174491
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 08:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69B15244E8C;
	Thu,  3 Apr 2025 08:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zMfY6vZo"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFA2242905
	for <linux-rtc@vger.kernel.org>; Thu,  3 Apr 2025 08:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670745; cv=none; b=eZ5b+mMwWr4peEC+HGU34D4BmSEqZV9dCLc4fUMwa3ESBKfHkzyBJyXLNcClQ0StjM+BlyDg2smC+QhDZsumtJmtg8e2nV4naRfdRK8Y7BOndZlgYGUQ2KR3VYwznP7GL58EGTUntJ7NY1q+3qcrFisTo5sGcKMlpW6uvTvCs3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670745; c=relaxed/simple;
	bh=GY5aflUP8HyQZVCvYH781i7uGwHWsWCKLpX/UgZ7jiM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fzc2q8jnC5Ezn5Z8AqqiMiw7G6dwMz6BcMXr6tLzPya/rGiHI3z/VKc0kLPbdqbwsVCN0V6I29o+ZLa2EB0He5MXcHRg4aYssZ7/034PN5WfPzdG58I5u5PSKk4UkqCz2j3ZBhRv4KdIgsyZ/kKbRzYchiZ75vTRtjIMnPXwN9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zMfY6vZo; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5eb92df4fcbso1266613a12.0
        for <linux-rtc@vger.kernel.org>; Thu, 03 Apr 2025 01:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670740; x=1744275540; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r/wEh4QmLnuluQvbcZ6Yqq9yXOMvoeHgrUwhyH2g5L8=;
        b=zMfY6vZoeD+0C+rJjnkjVt3bDkOAdTXIiZAFKxQECBujQ8CEzEwgH5lM0KDR1GVhg4
         IB6RmNOQnmB1sPJrzkIm90OxheOn1KBdZW4O6gcT9IQRszdJq3QbhfSPRb+w197+l3Iu
         a3hy4Hc+uX9th4a1/y+FVGMUQhI9w99XhPdBkO/osh+phqb+VxYZZm5Pxj98h/nAOCvO
         OaORvxhY3mmS/EX4ipCng5roXPVOyd1MQo9IEy4a4tWLFe2l1ghafJF/fQDb6XKhroYC
         jFPC4YbidkKnscT7zB4iO/RfH868ambV3SjiY0o8GTdLWFeeJQwn0ZZku+rhwcPoLpSy
         fzwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670740; x=1744275540;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r/wEh4QmLnuluQvbcZ6Yqq9yXOMvoeHgrUwhyH2g5L8=;
        b=qlK5SLmA0JyXIJD0vyNotpcBuOQAQajtpIqW+qVESwt8ZAMIxfVduzyoZr6GD0Q0cw
         ICjgUy6ySrmtDFS2z2J1ZN/J5FaVmaQjEuAbCSeuOVL9NFB6AR38a3V6iN1Fgj/D60u6
         9CK2J69IDHQOOrF1Kgqz8rl/jrt6ol1R9EfvwLK0kGLPGBgj/FHsxeceqqOqTojfHJxe
         ZKxRlLwVgQW9KDl6Puz/b+28xW+NMW/wTgmycrPZ/MW/q+ygpIEpMTaJxssH/5VWDrGA
         VdiCFtCjyMU+wRjMvaKta7dZWJmPsEc5pFuc42YF/9QFmhisoDZc5dYwWY4Bv8rHj2sY
         SI0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUvNFfs8xBSHSl6uFNDiH54X7eITXRfR+efJlHXTj0r0xoGe22eF6h1sikqJIawBtvL+MeumouhbbY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5z2K8jRGKZL6ec0SkKIWr9ZmTd9VF9xkGhw8g5hTZ01vTkq0E
	5mWgcpAzWLef7HixDT35MMn7VJu5KCN7jIGtYiQoZQqBJx0n47GKkX6aobXf6QA=
X-Gm-Gg: ASbGnctsB8fUfbShtIbAloThYMTfb2T1KizpyPQELCS5IqlZSevoOaLchI9ar2IhSuv
	c1qQfpwXRroEw2JQtfLiDVTsCWbbgKa6yjVNSlrjgekQmqt5yBln3NuWDCH3v8VifY/06gY4+79
	GS+LQDs1FQECuIagf7XzDDQskvCW/R9IhUq5xYCAhfVMe7DRLuCpqMDDB2QgcNfizicORFqD8mw
	HV7aFTfqhj7xT0RASnmlDQ9uSWaMJrk1q9/BpKCjsgGqKnppXO1gOyZBNsNS7kjP9V2tG+GJmCM
	M4aOqNgFwbjjgvyiL4vFH+AjNxV23Zq63KAncIeAqxmEs8RjuOLBJmDC9G8I60tq5PKDHibbEo9
	tH3i70l/avxTeeqUExhHaqzPSLR4G
X-Google-Smtp-Source: AGHT+IFpNCgTUy3yn5kNBStSgNtkMlYeVkvi4R54YROwAonbhkdXCkRSsgfQeF745WZBnvMJR3nP5A==
X-Received: by 2002:a05:6402:27cf:b0:5ec:958b:6f5a with SMTP id 4fb4d7f45d1cf-5f08726ef19mr1525065a12.28.1743670739930;
        Thu, 03 Apr 2025 01:58:59 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:58:59 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:58:54 +0100
Subject: [PATCH v3 02/32] dt-bindings: clock: samsung,s2mps11: add s2mpg10
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-2-b542b3505e68@linaro.org>
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

The Samsung S2MPG10 clock controller is similar to the existing clock
controllers supported by this binding. Register offsets / layout are
slightly different, so it needs its own compatible.

Acked-by: Stephen Boyd <sboyd@kernel.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
index d5296e6053a1881650b8e8ff2524ea01689b7395..91d455155a606a60ed2006e57709466ae8d72664 100644
--- a/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
@@ -25,6 +25,7 @@ description: |
 properties:
   compatible:
     enum:
+      - samsung,s2mpg10-clk
       - samsung,s2mps11-clk
       - samsung,s2mps13-clk # S2MPS13 and S2MPS15
       - samsung,s2mps14-clk

-- 
2.49.0.472.ge94155a9ec-goog


