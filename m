Return-Path: <linux-rtc+bounces-3860-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BDCA83212
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 22:37:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 485C0172AD0
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 20:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B14C213E98;
	Wed,  9 Apr 2025 20:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lkI+cqGh"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6326211479
	for <linux-rtc@vger.kernel.org>; Wed,  9 Apr 2025 20:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231055; cv=none; b=NX0tnVN3GnqN7SYZEDlMQ3GimjptkGC9j4UKcC8ds6JsMJhiKInvwaJjwqJ8ONrQ+XZQ9G9B4Zl3XhotCnMtyWzbRanJ0ZGJqK5TfVqTdbd1VZ1IhcmeA4PXPunYzV7j6aiw5m5e7PTT9bwJGUI7Ar3z2PqwRlgbYX/gGohjHDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231055; c=relaxed/simple;
	bh=oRSZ5ZfkKagzsJyi1Pj0UTKqxcsDGiMKoSYBL2YzZv8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IhGnG2WacswmFPlhxO0zJZMz0eMifLtZzTrS64UeZQ9VlK04+5Fe9vnL2hLPV0RiTz4jhfCep9VGHAmGq3xC2YyYrWJ7qSrQcwLcHw2z+Z4hV01wdf3s47QyUhRVzw7X4zs8f1ltX7MY7ia7FE2qViw3kJKF77po+/QGkkClZos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lkI+cqGh; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5ec9d24acfbso2150986a12.0
        for <linux-rtc@vger.kernel.org>; Wed, 09 Apr 2025 13:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231051; x=1744835851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VVnUcLf7rUkhmKcblE8DIPr7Qf/4SKbPpJHYfQM91kU=;
        b=lkI+cqGho9Bt5fsCYesRDmr15Rx5N4+v9GsyzCGRqVUO0Y6vQHaJC/6NOzjEq/vWR1
         7e6XoIBEunx107xEgsEK/iYVGAgAxHwvuMY2ocdaHZCBbpHMnApY8w5S3MgOXdjhSNjn
         kzKqnX8U5HJ6cjSbQSIbhk9JZmcezgrK6fSxfWiW9aszYAbvKanIdyszCQn5Qj/L8aBA
         kJTEb6Nf4c/Mpqzqb67qIRmBeedJ2an/0Ij83QTU/zFwvQO1lxj3gPrLq3jPCXC2cnOC
         uSQ7ebjfDEHXPvFf2kR1wdiKbNH1lKhbOZdjLVjLp7YRkP5nWzCI63Iemj2QgbreO3g+
         FOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231051; x=1744835851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VVnUcLf7rUkhmKcblE8DIPr7Qf/4SKbPpJHYfQM91kU=;
        b=vS6pzJS5MrizztwvClQJRsE2hEPjSiaaWqr+sGwvIq9HCR6DoFLlnysuj9lzA14PvC
         5LA/ieeH8Ij4l1lRNqzr3PPc+7fKi/qEXfLkY1TJvB+DbCvm0VaSFTGvoCnip7jlwpU1
         9vpq9PUdIKT1nUYtih0ekVRWXZjuK7uLMdWctGzlsx0Lenz0qshdN7bLGdT7oWfxpV4A
         ogPKIf8zBZUJALhNm2UEEi6xA/R8heAo7jhITuoUjC07lPb+7U8RO4D6IW6Qc8K4P60w
         A76cb9+rgFJ7IvdqE3y+Nilf0cTtAg/XgfsFDNTUnRT0m3+O/xlROI7Wme0jwszbzikT
         8MOw==
X-Forwarded-Encrypted: i=1; AJvYcCU9E0WrD6EAnPOf62tE3vxEahylsYQGct3piH67T9OOqT92Ozux8XL6Q2KMSEquKV5tyk+AlYlWBtM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGvAtHVDs3F9K9qAQs3kG2MlW8rFbEs3gGORRa+3mUAtcZttEK
	ouDGby0Abi65fo7rxsyCO6dWPb3YXQgIisJ44s9nTmf6ummpM/Z7JJCAy/m5qJM=
X-Gm-Gg: ASbGncuu2kjA/f8HOFuU6NwUq/Tuqd5S6uakpYaaPorKGLogP2kNw05xHxUyUHF8y8l
	Sw2PjIHp0Qiy1VZpXQ4NGa16JIbOgNsOMtS+Mgo04m2ki2rMjQhjpof/ZlofYt+0PoKb26raEaZ
	qkYVhT8wVDowMHu6JqR2a5DxCU3kXq8Mh+aQyb073FmlwUR0XO9VpUjCg7FIPm6JWETJxoav9oL
	Ng8etFaE/gwwIItTOafyBQseOCb1ZIyBGp9GuMo58j2XQzvDl7NqeizlDFbf+s2bSYXqyhZNuay
	xJ16TNclehm7TADkxHt3bO26+D3oGKUAtiqYOjyD4bRv/MWJUvwNJ8WDP50bvlqE2q2jtjZ7nZq
	Gxz+3f3luWdf8e3Vr/sz5KYVBkpA=
X-Google-Smtp-Source: AGHT+IEjKjbyVX1trxn6vhWMEq8SjYl6s0uvLlNF7RYWo3JUaldcMy8toq0oDQoK52nrthEFmj8Kqw==
X-Received: by 2002:a17:907:7e8e:b0:ac3:8895:2775 with SMTP id a640c23a62f3a-acabd36b337mr8219466b.13.1744231051032;
        Wed, 09 Apr 2025 13:37:31 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:30 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:24 +0100
Subject: [PATCH v4 03/32] dt-bindings: firmware: google,gs101-acpm-ipc: add
 PMIC child node
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-3-d66d5f39b6bf@linaro.org>
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

The PMIC is supposed to be a child of ACPM, add it here to describe the
connection.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
v3:
- drop '$ref' and 'unevaluatedProperties' from pmic subnode, use
  'additionalProperties' instead (Krzysztof)
- add some regulators to examples since s2mpg10 requires them as of v3
---
 .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
index 2cdad1bbae73bb1795eccf47e1a58e270acd022c..9785aac3b5f34955bbfe2718eec48581d050954f 100644
--- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -27,6 +27,15 @@ properties:
   mboxes:
     maxItems: 1
 
+  pmic:
+    description: Child node describing the main PMIC.
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: samsung,s2mpg10-pmic
+
   shmem:
     description:
       List of phandle pointing to the shared memory (SHM) area. The memory
@@ -43,8 +52,34 @@ additionalProperties: false
 
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
+
+            regulators {
+                LDO1 {
+                    regulator-name = "vdd_ldo1";
+                    regulator-min-microvolt = <700000>;
+                    regulator-max-microvolt = <1300000>;
+                    regulator-always-on;
+                };
+
+                // ...
+
+                BUCK1 {
+                    regulator-name = "vdd_mif";
+                    regulator-min-microvolt = <450000>;
+                    regulator-max-microvolt = <1300000>;
+                    regulator-always-on;
+                    regulator-boot-on;
+                };
+            };
+        };
     };

-- 
2.49.0.604.gff1f9ca942-goog


