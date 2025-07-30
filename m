Return-Path: <linux-rtc+bounces-4605-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 841C6B15BA8
	for <lists+linux-rtc@lfdr.de>; Wed, 30 Jul 2025 11:32:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 605C17B0136
	for <lists+linux-rtc@lfdr.de>; Wed, 30 Jul 2025 09:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4839E277CAF;
	Wed, 30 Jul 2025 09:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jRoZoA1X"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66366275B1D
	for <linux-rtc@vger.kernel.org>; Wed, 30 Jul 2025 09:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753867915; cv=none; b=STeKTiKzi3R40wGZYQ+b2B3AGlZku/eZEXimlRdr7kCZeUj9ZFM1u0WYRvlVXS4KvbylB6sRSi6XcOSHx5/PuPmG3Z1/skbMjQh4oNyoW73FvE1xcpxAVgNOpuvWrVdlJ4PpkhOng82NIQt+yDzHDfi9Bs3I3MH+V3uuye1o5fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753867915; c=relaxed/simple;
	bh=z0sV7SsJGuqFTYd+996vC08KW4HD/oyOt5IUehYunPU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pZ6t61r44m3ArgCuKrVGPG+OTzeRts/udXUx/4cMBbkLMYnQDHgugnLBXTHlRTprlgGDGAjdAMMtFRSbXgdJRoUm/ws4MJX0hO7zo03H4/iriZEsuSI7/73cKlyUs/20qsQBM3/i6HBTzvJWq4hyLPBzjKfKFCx2qWIRp9q1w0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jRoZoA1X; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-615756b1e99so2449743a12.0
        for <linux-rtc@vger.kernel.org>; Wed, 30 Jul 2025 02:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753867910; x=1754472710; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jGjRMX4G/COI/IQf9/y2Lgcl/FQUEBYc+9lDliHqOG8=;
        b=jRoZoA1XKBRFDe+qdAVZjLUGo18CsWEeKrteg4OlGq5ZIrJIDCT5cPd/YXQaGK9S6j
         kmpdVMVY/y+wH230Zuvb7S4UlZaPkVheCTPpeQZesCrMwfwaGjshtlvwnDQ5zzdfQxKY
         odLg5WZTEQ0+/SDOZ6aGo7yil4Q+yl0PLprCgFgSRWPkHWD+82BklO+6ScMXcWkMGbI6
         3PSuOJeGoIeepz4r+0GUOrA2hwgeE2NOqCISk/S62Pob9SM9lLkGEpiJxCG8OAtnbMUD
         jWpLZtCygBJcahy9lgnufhScAtaOAKtoOcf+Fxa0l9WazCJqkBuVqq5TsFU4xdRqpe1j
         yugQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753867910; x=1754472710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jGjRMX4G/COI/IQf9/y2Lgcl/FQUEBYc+9lDliHqOG8=;
        b=EKN7DhkPt4PRMlvpAd29Y1k+7eQb6V+sb2eDfCrgjTrdyb8f/bK6hZr1LHH/iluXmL
         YvTpLkm9TZ24ggAIOja7XiGGh3XYhH8yJSOU6+0Z5s/aseH/bnzKXC8+nBicJC1Q9iCK
         WA5dwksxU6txitYGvLGaUIG5jxxmZ+WpF/0Ww17wEef8cZpJDnyxOyLS34w1MVsyqUSf
         gmAh/CLG3eypcqgpJiWw8i+qsubHduzFjjbmz4jsTt+h7zPGEmCx0X5/u1GpNvxLy8EU
         xbuivqwKGE5VoUeMouJjedkLAp2cdDsRUb1/BFUis7UhPRqduG8qxnNUn8lgzvlcUY1g
         PuXA==
X-Forwarded-Encrypted: i=1; AJvYcCWlr+oI177bxr2DhRTh5NXxdsqh3gqyyfeSd6Cf/JXBi2/IaQYyCfltRNpSuSS1md14eSZZNRvH+Os=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywub/MBNXEQepyFORhXsdynC5qXXMiKCJ1DmM/9C7iMV2CIWaON
	fmU1GIWlwJJHEyv9tXiRv3lWS+v9BGD9XdEx9UpDa71DbekRb9vkY5bGDpI2IizZvrc=
X-Gm-Gg: ASbGncs5u6b1031IWBSFz7+3eyCUNc6zfnOS954qXfaX91u3umTPQYhc0biDvo38qhw
	p7+E57X3PFNmhsarx30BAkJI/vRCAsXDV6esUEhGb+bi8hqAPigkalqTrv9rfeKeuyaCQ3/E1L5
	A3EWgDYcyoIQVX7kvM9O1YKihEX/H3nPObGzOfNe9NN8koudZCPKf75MI9PzGcBwPD+WX/VA3dA
	8lM+qsyL+8mxxdZMetkHJcsAuTSfwtLGL0erpwApZ0oqGw2pGbUhI+R5RXzvcIH5wnE+TqczUfM
	PwbXVY0up8WUYRjeKULochx3z1OmbD2x6CG0taoUaMJGqeaYuBTHGsnluexCLN1V7wtA0pzW46c
	fB0LrGMM8pkzvInt3ESKvKrZ9bHLFBIhg/mHieo/XwNbGBczvFSZZm8R+5q+CWN2dvpzHWfrF4L
	B0osCl/g==
X-Google-Smtp-Source: AGHT+IEUMxf3gSpGjkAUfDfzDG2wfz30DekTf/PJZewF4AZbZS4xARY+7EQX+t4IEFMHZ+3vt+QMSg==
X-Received: by 2002:a05:6402:40c5:b0:615:9b4e:7b81 with SMTP id 4fb4d7f45d1cf-6159b4e7f50mr683882a12.7.1753867910401;
        Wed, 30 Jul 2025 02:31:50 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61536916dbasm4090424a12.43.2025.07.30.02.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 02:31:50 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 30 Jul 2025 10:31:34 +0100
Subject: [PATCH v5 1/2] dt-bindings: clock: samsung,s2mps11: add s2mpg10
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250730-s2mpg10-v5-1-cd133963626c@linaro.org>
References: <20250730-s2mpg10-v5-0-cd133963626c@linaro.org>
In-Reply-To: <20250730-s2mpg10-v5-0-cd133963626c@linaro.org>
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
2.50.1.552.g942d659e1b-goog


