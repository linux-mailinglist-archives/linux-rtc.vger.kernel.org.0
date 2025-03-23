Return-Path: <linux-rtc+bounces-3568-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C287A6D184
	for <lists+linux-rtc@lfdr.de>; Sun, 23 Mar 2025 23:39:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C4B23AA0A4
	for <lists+linux-rtc@lfdr.de>; Sun, 23 Mar 2025 22:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 604AE1A841A;
	Sun, 23 Mar 2025 22:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AUILnTg5"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0038B1AD3E0
	for <linux-rtc@vger.kernel.org>; Sun, 23 Mar 2025 22:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769568; cv=none; b=QEISWv/rexXJ0NzESaCh8/KwdhH1OSK7VxrW1ithkTdEMsNlZnkpEiim5vst3WJQszNf7wxRHggnXfcoyOjN3tx+xReSWOBcJ2yhrP276uZoE0C2YsBevkj1Wci/Key00fVu0J+ZPmsxoWAtyVIncoSqxu1niczKN5/eQafdFX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769568; c=relaxed/simple;
	bh=6BfqEn0+AzamtK4yJsWD0fg9sFcnberX6yxt/ti3b7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qmmk61IsiMH/I7A/WpQADkHI/q7AbXYoV8my8HxKbyyv9yt31L6V5yEHI4OBppwfEHF4BF/Rp4NUKWdCiPQW97JKfhMKPFgjlDmnvCrgKtAyzVn9zTx4kuyGeGXqpgj+ekUuH2D0CyRw30lVz0EUPhzaImz+Uyibx/NrbOBXDEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AUILnTg5; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e6ff035e9aso7023860a12.0
        for <linux-rtc@vger.kernel.org>; Sun, 23 Mar 2025 15:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769564; x=1743374364; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HXb1pE2B5VZK7eIRvGjCX0bwONX10G0/gh8FJgs0P90=;
        b=AUILnTg5pDyMjJktcjQAtmP1cN0YWyqEKXXo2XqFLorxlSzzY4rR4Y+GKYRE4L5Qpr
         YAOgFfFJ8jr/0y3aYyYRjzmlWg1XGmdvjig6nStIcR5K3EEugCpiCrtqpnbYE0xX+VzX
         cU3oJU3EJQ1l1Exx2tOzCS2IIEj5Uu9WypxXStl0JV2h1KbJ9snD3locDm9NdMXCxe+0
         PbdQf1Va1iNNfWpUo9pbv5LDd+AZs+zxuXfOmxyY5xR1GyYgq/7xw6fb+uRaQPbIsO/P
         Ggo4tyrvSmebQcqNHcSyIioe4w0x5AfrbuNtC49MKrZZRu+m5zTeEK+LYZ+baQXqFQRe
         Hq1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769564; x=1743374364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HXb1pE2B5VZK7eIRvGjCX0bwONX10G0/gh8FJgs0P90=;
        b=YVkR9f6j+3BkDU4roI8gEg/xUqSh+dMJiXpaPAb3vJXbLXCsRl9UXtZWybjtEPLDI0
         sFtu/F6oiznVr7ZY1n9F8PUu/PJvARpy2exMYI1WuTbZ1Q+IeEhOHkj5QDu66Lusz8CR
         PcLaVOxJaJWIVQMh2/hqtQawilixRl+Wd3rNR9motDGq8XcCDdMiQIpchkSvFun0dTno
         HD8rfQv33Fg+LfvQYGxgpiDKfaWNHq0zdfQ8zQcKJ2XFfIH9eNwLwhl3u4tqiNcVEqRy
         2KrlEQqPQ88U4iWYIJ6YCb4s+2F3nZbF4LgCN4kRrXRwZASHPeG0Hxfy/vvNz5qDkhMK
         pqeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPHBBy9IKch/HeGu79YcBFtv/FaZwwraCV/HIVzadVDVGkBhuMKFBr2CcE4DXSjflFV2y1qDFZsf0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyAm+3FfP1RMuZYxTcM+jXrV43WrUm5BPxbriHzK3ot1GqIEE0
	b7XFTLLqiTBRm2mHLjvyVce5C3k4mPCCxa6Gw4M4hpp0QDa0FMpgWSPsvl5ttqs=
X-Gm-Gg: ASbGncvygZFpE5UsqYsW/OaKBtnHVtXOVlo2QKPsme2t4D0e7h3kT0+/CMeNpJ9UuN+
	5Ag9JHt4Znpp9l+7h3clcBNPc+VrOKMRxkJ9kOnzRFkksqiWutQfy9w2Sq+9xCh+h2StOAb26hQ
	jNNYka/Rax0t2zu8rbNe3+9diziq0raWcbk7nZJaZIHGclozgkHZoWI2setnKy7jIxjKxcSr0zu
	jniMZ7y1GK6Wzj/xGW1zn2J1HeQUVa1c/BTBd284XUyMfyylCJ+d7qifOk/qFqkq1c7pFHeczAK
	/tg0sKIP9TQBK53GqU+w1xVl2KivN20T3buxgOLZ0pJNRZWF8VUt9jU5yJC1suR4EQITTtY94ur
	tf3K0Vi8/GOIr8xPUCfcIL23q4IE3
X-Google-Smtp-Source: AGHT+IFEmZ9BlAcg5cpLq9P2zpjpd5ecowSIznI/DDr2rcI73G5OWcR4yuBPI4oD1OUtU38fBId+Ng==
X-Received: by 2002:a17:907:7ba8:b0:ac2:b684:542a with SMTP id a640c23a62f3a-ac3f23df97emr1170613466b.33.1742769564196;
        Sun, 23 Mar 2025 15:39:24 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:23 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:17 +0000
Subject: [PATCH 01/34] dt-bindings: mfd: samsung,s2mps11: add s2mpg10
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-1-d08943702707@linaro.org>
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

The Samsung S2MPG10 PMIC is similar to the existing PMICs supported by
this binding.

It is a Power Management IC for mobile applications with buck
converters, various LDOs, power meters, RTC, clock outputs, and
additional GPIOs interfaces.

Unlike other Samsung PMICs, communication is not via I2C, but via the
Samsung ACPM firmware, it therefore doesn't need a 'reg' property but a
handle to the ACPM firmware node instead.

S2MPG10 can also act as a system power controller allowing
implementation of a true cold-reset of the system.

Support for the other components will be added in subsequent future
patches.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 .../devicetree/bindings/mfd/samsung,s2mps11.yaml   | 34 ++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
index ac5d0c149796b6a4034b5d4245bfa8be0433cfab..ae8adb80b3af7ec3722c2a5718ad8fddf0a5df34 100644
--- a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
+++ b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
@@ -20,6 +20,7 @@ description: |
 properties:
   compatible:
     enum:
+      - samsung,s2mpg10-pmic
       - samsung,s2mps11-pmic
       - samsung,s2mps13-pmic
       - samsung,s2mps14-pmic
@@ -43,6 +44,12 @@ properties:
     description:
       List of child nodes that specify the regulators.
 
+  exynos,acpm-ipc:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      Phandle to the ACPM node for when ACPM is used to communicate with the
+      PMIC, rather than I2C.
+
   samsung,s2mps11-acokb-ground:
     description: |
       Indicates that ACOKB pin of S2MPS11 PMIC is connected to the ground so
@@ -58,16 +65,39 @@ properties:
       reset (setting buck voltages to default values).
     type: boolean
 
+  system-power-controller: true
+
   wakeup-source: true
 
 required:
   - compatible
-  - reg
-  - regulators
 
 additionalProperties: false
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,s2mpg10-pmic
+    then:
+      properties:
+        regulators: false
+        samsung,s2mps11-acokb-ground: false
+        samsung,s2mps11-wrstbi-ground: false
+
+      required:
+        - exynos,acpm-ipc
+
+    else:
+      properties:
+        exynos,acpm-ipc: false
+        system-power-controller: false
+
+      required:
+        - reg
+        - regulators
+
   - if:
       properties:
         compatible:

-- 
2.49.0.395.g12beb8f557-goog


