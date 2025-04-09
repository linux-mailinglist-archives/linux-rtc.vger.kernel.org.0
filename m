Return-Path: <linux-rtc+bounces-3859-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E696A83211
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 22:37:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F219E171E7B
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 20:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66C9B213E91;
	Wed,  9 Apr 2025 20:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CaJX60Vq"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA5920297E
	for <linux-rtc@vger.kernel.org>; Wed,  9 Apr 2025 20:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231055; cv=none; b=DUKQEWVbWHaxgoWo4WDifAXzIP0iu7n5B1Osq7Tmcd930xteNBbVfbzrYroVT1cnKdlCrJ+9VpLJ9hZUSLcJXb5v6Y8T4PvWKjFGk7DZpZu1XQS6rrwjZTRdgdhQvAbT5+btfj7u6/NdLzygUGeMPdmePENN2y4myw1QRWwnQic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231055; c=relaxed/simple;
	bh=CvZ4fbl95FAJENkF4NbrlkZJArtMF1C5hRtEryeGvps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fFn0UJbO1Jn92inupueofpOxTjPveD1Lxb4LvLHPZ+LPzorEHwV6QpsqB5byPMJmnhocbjO6tP4nb368ndZhakmQGRpJ2vxmpy7JXSpVeNAmRve+Xim94qKQYtYEBFNIfi+bDQEAftUMDbufAFZNWfVOznntDF4U5FvS6jWYgKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CaJX60Vq; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac34257295dso22924466b.2
        for <linux-rtc@vger.kernel.org>; Wed, 09 Apr 2025 13:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231050; x=1744835850; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ReTGoMS2vXkEoQxUG9mhQKtXUX9UxWUCToSWrUrmlXA=;
        b=CaJX60VqANMuDt6gWj1Q28EwTjqjYiWqd01dW8wrO0ppMehSPbWK+u3tbozLFN6pld
         5uoL6vXhA05bcKKAz21fXk2tT1swrqGAuFrNDDwJ4qx2F2Er4Etbe35rk8oPKKZgivVb
         TFkHXV2SJVUTO3tkYS4yrmbaOU3teZWRLFvHfeNlskypyVwL7l3isRs5oyEP8U8ulbr8
         ouwfHBSNqs1yFJmYaF93myVfTMFZLHeBlOAjhb+oOfcyTZleWOa+xqvICYZK0/OqlRt1
         toqCj1L9q7aWagiNSBdqn+LDa0pwoMN/8Ut3Du9UnVsSlLbWJlRN/6TT95FrjwcNyrPd
         RvXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231050; x=1744835850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ReTGoMS2vXkEoQxUG9mhQKtXUX9UxWUCToSWrUrmlXA=;
        b=bKjOCC9h0Pba/BDvJmboT49cqoJaT6CEBv1WpYp9xBRaxse/EsnioN8z1VoMDgqLLy
         CZKnaGD3R+tBkBWKpQmBTHuq8eqAgRu/OmaS60qUg/xz2MCFIRUMHjYllQ4HxTycH2qD
         7E/h3tApypFzlJnXHSglwuGOS6idW0/7ui+G7y/Kud5ZrNM5Nvv7TYMZkbbyvV6Biyjz
         qoGwRK3LqwZfIdd9N+kztsgFk3VVWGU/0kRpdStcgAbDBlYBm+2KsJrvL53Fv9R0WrJ9
         GL6dhl6PQU/p5DxMwO72TwJh4zfm4MH43JpW9oTkoXDrQn5uW1cweG9SkKolaoYyTQfv
         xc6Q==
X-Forwarded-Encrypted: i=1; AJvYcCViImSeliNpPGGz3h4Lo8kg+qiVDcclAvG7zmmqxdhEred40KJnJkeS/Lu8fo54Ka9eK0kBMgDHoMQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHXvENL774vm75wUQpJjPAApf9QvfwXAQBUCJKMrudrlaxFcix
	Ubi845oSuSeQiE0HoLNHi2q8hAEuMmLIImURH29UczxUnUegerTm6YxJqqhKNTk=
X-Gm-Gg: ASbGncuosVjwFivcGWLzIn8RnGzObGoTQVRPFlp5XVlaRlS99E3HL/PlhKhMf5tAVAj
	wEoxbfee6uQb602MD0hRZ2fKPwpKxGDiItrnL1up80rjpsotE5RKZwOu6jA1unkdyjgMk+Hic1e
	Q4XDuwABF3Uup+5sn4+e/X+XxKqOOesKGGx6rRAdMKfWGJ53xp2a/kO/nqRGhRi/bId7b1IYaor
	B5UXm1pYzSKbSrVGpqjbGtqu5wLec9r11Op8viI49dGfg4JnP/so38Uuv+qpbNNef+0VWWKmiFe
	FdnT34JNxAoUnj8a+EapGXp3PSIqhepKGocuOcS72Rg0zk++Wn0IxHK3LqYQe0SyuJyRXdarJAS
	RCyWpKL5mB3juyQ4cQw5byC60ZVU=
X-Google-Smtp-Source: AGHT+IEBlNxVh7eTUcIx8bavLvlvqPUje0i7F4RzY9BEv4lu5kBKWoWYEurWTbTU+YYGqwf664Lh9g==
X-Received: by 2002:a17:906:4fd4:b0:aca:9a61:c5cc with SMTP id a640c23a62f3a-acabd3c3b96mr7238466b.43.1744231050538;
        Wed, 09 Apr 2025 13:37:30 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:30 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:23 +0100
Subject: [PATCH v4 02/32] dt-bindings: clock: samsung,s2mps11: add s2mpg10
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-2-d66d5f39b6bf@linaro.org>
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
2.49.0.604.gff1f9ca942-goog


