Return-Path: <linux-rtc+bounces-3670-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBE5A74AB9
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Mar 2025 14:37:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B9AE77A2594
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Mar 2025 13:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAB8F21B8E7;
	Fri, 28 Mar 2025 13:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IUsUDsty"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F240219F43A
	for <linux-rtc@vger.kernel.org>; Fri, 28 Mar 2025 13:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168661; cv=none; b=jBCZOhdtKX1fMOBmEuIa/G1bWvcXjVUngwcLEAwC9RXSM/GzPA7Vu2HIV67z5pCCeyR3t9yDxsdDASqtK1ZnYnlAJ/9lhOtsTkbnrqZQ5gKqDy3DHcoH54fRfwiK+w5iWvIdANVJySmJMi2V9Q5JWuqJihCUlx1CtNXriGDqlJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168661; c=relaxed/simple;
	bh=qCh6oRLfLTgTThIJ6lv+09+QKw9X55onfRfdQJjsxHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aMy6TlcS85gWc3zZeRIaPLMw+V9fIZNiAA4yJNX0u58Bva5Hv/IMFMkMxOrzU+v/NhbvMNCwOKAf2GDaT+B22XzOfZoHwlPptQ9j0jY2/WmaRb9TULGe59wguvb1hANfM5U9xpKWM7wC1wCdna2Y4iwqTQGXv2N4mS+bqG/CoPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IUsUDsty; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e5bc066283so3460537a12.0
        for <linux-rtc@vger.kernel.org>; Fri, 28 Mar 2025 06:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168655; x=1743773455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E1w11rlVw/TNBQvhMqe/HobIw1/0AFB8/Oe+GpWOJoY=;
        b=IUsUDsty209X8KDYmlOHZZUCwwfH3dNQZN6IEd8gF0m+DviV3e0ysaK43kubxQ+4iu
         yP2d3C5+5d/f1X1oIWNwHxlEew9DaKhyJFQi6y5Y/M6YIVEyvYoLtZezW6H7DmlhZk72
         Ih5D3imEE1lSKmtAG9UBX3DbnApu1w/3nLb51YLY3iQnja4Nh+6g4bkzia1nET8C2E3O
         t9/IC5yPqM3vDw3BiPO8qkuOuxWn6C9oV2OpZ6woFpcAzUnLgHMKCSpZpU/9FsvvouZt
         33ACMOHxhBGHr/MQZqLPEJtOImI2V53474tN0AhzQ+7CtbIcZFHFZGO6BwDEUl8fxV1w
         T00g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168655; x=1743773455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E1w11rlVw/TNBQvhMqe/HobIw1/0AFB8/Oe+GpWOJoY=;
        b=bLGrocui5kfFGD3TgfRfRTNs76KJxPGb2kPuUDSDszZ3QwVc/sf7GMKOjtaGwj3v8n
         R3p8oizrZXlTaymakSZpsnfqtwz1nMt1RgMB+Io3DWZSWp51YzB5G9qlXxgpcwk3aBNO
         qAtrm76QuQCb84r/BZRBwQ+KrjDRJLzpnhblw+JKP2sWJ1HoAMSoLXJw9lsI7TgMGFm8
         77e8eLtzqXQWyYgYxAQe9peikmQ26j5isUNjyQIKkCmZjskc5+GuBAWqwxmSnnK7Zd+D
         89PUNFtfY6Vbfa4tGDHxYPf+6A4JZW46k6cvO9UDLDEOo7B62May6Go7egqQq/wEizMO
         zi7A==
X-Forwarded-Encrypted: i=1; AJvYcCVlWFqhg7g1u/zkc2IYwxCKdOVCrDRtIoy4bFIyIc2dwtdUNAN0LcGBqji97EpmbSd+6cE1rQ2IZJI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHi03jVkldqQpRdnIDqLzjq9ScyVttLk5CU1CLWHYvh6Hg05eQ
	eoThV82iHgKhlplkAgITpF0pZ2sUSr+zSAtqAJz2DJ9R77Cg6u9Yzqz1ym7lMU8=
X-Gm-Gg: ASbGncsNf434CNRs5NXOo315sLTKVnMV1XxEPcj1bEGie6GzuxI2hpANEBi50tkOW1w
	KNWHujdXYWRyQ4SF0AVOVcib4OqjTgOHXXKtSw2vlwDbbjauRQBCkZZDS42fHP1Yj5SIQMXwylq
	lFJ+RUQgwLLkoruZ4I/neO2aPO/hLD9/WWUUTfQ4SUCiTcw6wKFDixT5YrbEnNaFeP2RGyYgF9u
	+ZuGqie7H7ZaCECZIIIbIB9yF8hDHxRNPzt9dysjy7MIPVQiuTXyALa7vOndS62iMXAAHKkJVqE
	nvmK+MD7jl6zwkRxApe7SCFxt9ECPPt9aMmilipBdXSe4lyEmniEXf1t/3wMlLkvot9c1J2DBSX
	jVez8icau1iTSqtRu/tHGG1aqDCBa
X-Google-Smtp-Source: AGHT+IEq06ryYPSRFnijp9zBT7TVwvuxmad5wvipQF5Or+uJmUZMEkHYbtpAEod3NTnJDeU/8eOeEA==
X-Received: by 2002:a17:907:7b99:b0:ac2:7ec8:c31d with SMTP id a640c23a62f3a-ac6faea0f0amr608739366b.17.1743168654961;
        Fri, 28 Mar 2025 06:30:54 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:30:54 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:28:49 +0000
Subject: [PATCH v2 03/32] dt-bindings: firmware: google,gs101-acpm-ipc: add
 PMIC child node
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-3-b54dee33fb6b@linaro.org>
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

The PMIC is supposed to be a child of ACPM, add it here to describe the
connection.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 .../bindings/firmware/google,gs101-acpm-ipc.yaml        | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
index 2cdad1bbae73bb1795eccf47e1a58e270acd022c..5524f2af5bda2d29b5113f8fe14ece7f02366a60 100644
--- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -27,6 +27,16 @@ properties:
   mboxes:
     maxItems: 1
 
+  pmic:
+    description: Child node describing the main PMIC.
+    type: object
+    $ref: /schemas/mfd/samsung,s2mps11.yaml
+    unevaluatedProperties: false
+
+    properties:
+      compatible:
+        const: samsung,s2mpg10-pmic
+
   shmem:
     description:
       List of phandle pointing to the shared memory (SHM) area. The memory
@@ -43,8 +53,15 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
     power-management {
         compatible = "google,gs101-acpm-ipc";
         mboxes = <&ap2apm_mailbox>;
         shmem = <&apm_sram>;
+
+        pmic {
+            compatible = "samsung,s2mpg10-pmic";
+            interrupts-extended = <&gpa0 6 IRQ_TYPE_LEVEL_LOW>;
+        };
     };

-- 
2.49.0.472.ge94155a9ec-goog


