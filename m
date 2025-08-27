Return-Path: <linux-rtc+bounces-4768-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E03B380C3
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Aug 2025 13:23:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16E773B3C56
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Aug 2025 11:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E303134F49A;
	Wed, 27 Aug 2025 11:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M8lQZt1y"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8D1343D75;
	Wed, 27 Aug 2025 11:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756293780; cv=none; b=FU2bsl1EoM1WfDDFoKbMyeiNZF4PuZlorW32WcItIgOEye/JvtuCy50xk6z6+Sk/QSxGXbCOEp3yI+Y+tuS6oyT4c11atj4xTz1ed2DDvTwXWxBJ4lb2ccEjSqHQZQPiPo06UMVxgUkua65v4Xz1yxOlwPpNarFjarOiW9ckNTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756293780; c=relaxed/simple;
	bh=xomdpeLOMSZJEhkz965+CaS+Vdhm+5amA+tX9TAShNo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mB21+TiPmO7ly34qfnuyQ6Vjo57ak8PC7Zi+62mtCQ1pEviIVNsdnSFVoaA6zY+sypvroHen1iTnlL/Vepvt/GlgI4ggsMHPXQ/5E3JN0K3ck18xkH/OTqLOXfux40rFs4XToRVvDJvNTsIVY3k2x4/4ov7ce+DgzU/169NMCIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M8lQZt1y; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b474d0f1d5eso4373264a12.2;
        Wed, 27 Aug 2025 04:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756293778; x=1756898578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tScKS+WzB6dufhL5mNK+c/AStzi+5Gn3nlm3LBGIbwI=;
        b=M8lQZt1yPyZKma1SspHWAdbFF/xof4uUrfuJgkZgO2iYZcCdJg/0LG4LZVfrBPT4O5
         Rb8lP5JwtS0Cmy/O1xe8upUD7fohjB8RwPb3F9LzrEqVn7pXrz3b3n1MiG0bJ9V8kYgC
         6zB8udDrYtLjU+INpmsu9K1jYeHUnkbTQk1+j8lFm9kqCZ4+2+HMPTszlD7XmxL7NEDv
         n4rghPSIS2qLmK601y3rb4tKSpiae+/sbcp0KbkxEw/C08+QDi83ghcLTDnVhSV9NlmK
         Wk+qJ7DvGcT25Ai+QtnxWB8hZW9AAvQI0sCdlIa5/LuGit+wUY/i78XINEFFktpixFN9
         wnZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756293778; x=1756898578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tScKS+WzB6dufhL5mNK+c/AStzi+5Gn3nlm3LBGIbwI=;
        b=WRhXGWqP6wLHCSdoPFtG+XARKC2XrcA5jtKbAC5NeJhYVc9wt+9uhw4jMKyEG7BiHG
         2Lk3MO7F3dp/uL1XDjjMHa19zysI5SsXeFJgOimPA+pzTZGbpCC1K+Lcuo56kpcIY2oA
         YAdT3YiLS+H2rWppbdV21qxe8w784AEhvGH9dyp0a3a2vlH+HLOPp1UHFjxTa/LxHN/y
         bQoAwcz3DeID1vNrU5gO897MFL5i/SoMLHRAP825ZbJRzk8G8b0lnfGlnLjcUgoyQyOR
         eAPyggDeIVTzO4svJb+RxBwNZDQ6OjYje69vcToSBjtklkpiTCdIMYMX0c/gGKiMIngJ
         Mp6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUKxdibOicQwTFXXINnbrVE4jdLWqhha9UQtfRmL1ouX5aHrAcdI9XWFFI5hdQzFporjEr1OWozEI14nM4R@vger.kernel.org, AJvYcCVxpjNGqmC9Ucqjx7PamFn+B0GwP8neGjtlGPLN/ohydTmGKDzaDWaRDG6nFSA48NISXsx/rHhFTF1U@vger.kernel.org, AJvYcCW5nLOzTORefPM1v1XeNHw7U5leQ+4Vj9el7WbPrY/SEfA/dxm8iH/dl+ry+BGAYPm5nq+FWb0dQ7ELe8w=@vger.kernel.org, AJvYcCWUzFgToI5efpqwqzxiUCgLTYPaEfP9QIVBW+533Yjw7h/JBiBrz6aTkeXpLWqv4i8JdLUnWZy9rWmq@vger.kernel.org, AJvYcCWhsH3et2XVUgO5FklBpbBLHh9L1LmMx8J0ojj4QZdvTe76TWVnn5HYWo9NiU4qeY4fllaOJy9rK42SlhE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxC4GuvP3V0gZGaJ0/5nGMZsB2JDfYCRN3n6j7c83BfUPA3EsDO
	VPGbrfuAE5fcKs/UGQDLvqlebZUcwwBlBc7N1c9SQJgH9LpHSK4pv9mn
X-Gm-Gg: ASbGncthH51NE2QKG0aF7KIOq54TeflqEJjWjiA5RDO5cjicPFoY0efUYo6Ar4EmnnA
	0qtKlHhju6VmR6WP0FWBtqibEEn8Crew+u5xekni22sc3Pt554dhExZrB1na8ZIPr6lx8OyHpYU
	UcpK3+F3KOtfmfNq9WCMoB+fJHnu5i7SGKygkXzUgB++e/W+qjkDv4WQEdG8At6C9G5QF/XJI3n
	JA8dDnaK2b4iWqmfaMDE1ky34wZfIuSu1Hsrv/uLjm7suJseSDH8VuC4c0dxKL6An0MzJftYJHW
	xrLBxCMT8dNwcjr202xnDLjO7z9+eqW7lGZKBZSqs4qCKwj2y0nTzAyvsuiExxWhy+LDvIhYfqz
	fs0xbqg0TOMsHIYeD70MflMQ/U+KAlfoktWAe2VBxtpAI7mQVsdShSJ7HTOzh2APaJRQXsLRoCP
	GYkIQqQyym6UoKxD3W
X-Google-Smtp-Source: AGHT+IEHQ8zv3Iwk3K5n+Debu6cIiDOuY8nhm+ii5lcJ3ZyQ2oPc2V5kSWO6f+JtCHeV333/NyZa4Q==
X-Received: by 2002:a17:902:d603:b0:246:a42b:a31d with SMTP id d9443c01a7336-246a42ba453mr172730475ad.44.1756293778541;
        Wed, 27 Aug 2025 04:22:58 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fcd6232sm1819708a91.16.2025.08.27.04.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 04:22:58 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 27 Aug 2025 21:22:35 +1000
Subject: [PATCH v2 01/11] dt-bindings: rtc: Add Apple SMC RTC
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-macsmc-subdevs-v2-1-ce5e99d54c28@gmail.com>
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
In-Reply-To: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>, 
 Mark Kettenis <kettenis@openbsd.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3520;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=QnTrhwUPyGjBEFWqrKCYz13PtbjM0UoOPM4Jc23FSf0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBnrXjUla00QuHr05soLs1Lerqr6uSjCZgdr0LsnPitOs
 Rm8fr9EpKOUhUGMi0FWTJFlQ5OQx2wjtpv9IpV7YeawMoEMYeDiFICJrFjFyLA7dNKavG3hfy8K
 1/jqHtylvSDV8LBG+peNm92rq4VWb7/PyPDT4NCpQ2YVrF+W8EzKfXL+yNML10+VcnG+/Fr57xs
 D50x+AA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Sven Peter <sven@kernel.org>

Apple Silicon Macs (M1, etc.) have an RTC that is part of the PMU IC,
but most of the PMU functionality is abstracted out by the SMC.
An additional RTC offset stored inside NVMEM is required to compute
the current date/time.

Reviewed-by: Mark Kettenis <kettenis@openbsd.org>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Sven Peter <sven@kernel.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/mfd/apple,smc.yaml          |  9 +++++++
 .../bindings/rtc/apple,smc-rtc.yaml      | 35 +++++++++++++++++++++++++
 MAINTAINERS                              |  1 +
 3 files changed, 45 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
index 8a10e270d421ecd703848f64af597de351fcfd74..38f077867bdeedba8a486a63e366e9c943a75681 100644
--- a/Documentation/devicetree/bindings/mfd/apple,smc.yaml
+++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
@@ -41,6 +41,9 @@ properties:
   reboot:
     $ref: /schemas/power/reset/apple,smc-reboot.yaml
 
+  rtc:
+    $ref: /schemas/rtc/apple,smc-rtc.yaml
+
 additionalProperties: false
 
 required:
@@ -75,5 +78,11 @@ examples:
           nvmem-cell-names = "shutdown_flag", "boot_stage",
                              "boot_error_count", "panic_count";
         };
+
+        rtc {
+          compatible = "apple,smc-rtc";
+          nvmem-cells = <&rtc_offset>;
+          nvmem-cell-names = "rtc_offset";
+       };
       };
     };
diff --git a/Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml b/Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..607b610665a28b3ea2e86bd90cb5f3f28ebac726
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/apple,smc-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple SMC RTC
+
+description:
+  Apple Silicon Macs (M1, etc.) have an RTC that is part of the PMU IC,
+  but most of the PMU functionality is abstracted out by the SMC.
+  An additional RTC offset stored inside NVMEM is required to compute
+  the current date/time.
+
+maintainers:
+  - Sven Peter <sven@kernel.org>
+
+properties:
+  compatible:
+    const: apple,smc-rtc
+
+  nvmem-cells:
+    items:
+      - description: 48bit RTC offset, specified in 32768 (2^15) Hz clock ticks
+
+  nvmem-cell-names:
+    items:
+      - const: rtc_offset
+
+required:
+  - compatible
+  - nvmem-cells
+  - nvmem-cell-names
+
+additionalProperties: false
diff --git a/MAINTAINERS b/MAINTAINERS
index fe168477caa45799dfe07de2f54de6d6a1ce0615..aaef8634985b35f54de1123ebb4176602066d177 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2397,6 +2397,7 @@ F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 F:	Documentation/devicetree/bindings/power/apple*
 F:	Documentation/devicetree/bindings/power/reset/apple,smc-reboot.yaml
 F:	Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
+F:	Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml
 F:	Documentation/devicetree/bindings/spi/apple,spi.yaml
 F:	Documentation/devicetree/bindings/spmi/apple,spmi.yaml
 F:	Documentation/devicetree/bindings/watchdog/apple,wdt.yaml

-- 
2.51.0


