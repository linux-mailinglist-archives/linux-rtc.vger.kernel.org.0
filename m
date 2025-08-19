Return-Path: <linux-rtc+bounces-4716-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD53EB2C225
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Aug 2025 13:51:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E64B23ADEC3
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Aug 2025 11:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2A843314BE;
	Tue, 19 Aug 2025 11:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jk0HNHsS"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392A132C31C;
	Tue, 19 Aug 2025 11:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755604096; cv=none; b=l/DLH52TeyDlpEvSzUlVTlKy0Vppx+lWVw66p18yHMQMzWJZ8CkUerdwjG1i39B0zwyMzClaauGSieMyq3f5UaD+6dDLqYF2LUzSfHsxXeb24mf8JBfH+tn84KxLofYMKSBm3CdMlUOX3mWj7dgSp8uHZNPWeEXoc2v28RM+m4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755604096; c=relaxed/simple;
	bh=HRZjz/PDQepfTTL+nFEADTvkRMXX9VLy0qMaACyKeNA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TUip0kpscSjS89+d26s8Nj4qXPs640KFqMadUV/NVfwjorkOtDjpmxjlxQJwj2L0zhro/XsJCdiiz9b0z5cjR6qSUpcuWkENe6qXAXxY+nioO5Gi396CSFejfT13cRWdkHywDupQiwFl3t4Hh7CbaOpxN2QShlI8kru3ttbgr0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jk0HNHsS; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-76e2e6038cfso6155837b3a.0;
        Tue, 19 Aug 2025 04:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755604094; x=1756208894; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FBxHD5/WjVJ+H6FOdZLWHLUBELVzL67VAq9dX93Pcug=;
        b=jk0HNHsSPD55xOQPoJcSHffRN+UXKk6K4rX5pZLmXHoEOhZiHyFm0z2fIpXyXG4Kav
         14mlqnA1Xann5jwf7p0NMnCuZLtFaY/cCKBs4g/eD5akXPc+QyWdlXBdsGZBt782goB1
         o9MCEbKviFSlLoXnvDwyd6//XGjj1piyJ6jYNVA7v/N6xzwUja9Sls9q1M0Vg7xOscEM
         hKPxV2zb6v2MvEHNZ8TivPqirQjWdLuH2rYsZXwTxs6i2xprt784pSAwEs489prQTed4
         tgsnhLiy89FaC/k8JzZKh6acaGpixb5YyVajBq4WQcWttiQ71mtY1Ctg0ZSknQmvPeSw
         AEWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755604094; x=1756208894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FBxHD5/WjVJ+H6FOdZLWHLUBELVzL67VAq9dX93Pcug=;
        b=dVsvFXfK3r/8TLQ2MTbnhlhpGEA6x21jFmgOisQ7S+WJMmFh0RbV+xwyKf38l8PzMV
         uOKnKnY7CmiBhUK943dDu/Ugn+oMqMKFIN/6DJhuOkEcjeguiQH5Mo4feg7Xe4XT5FfB
         BVop8l6ylz7UO1XbYzURB7G4QDX6l75rwaipRZBRcCKP7Hz3SbrVDU2cjRfxFrArOSjX
         oYIGsfaO3C2cMl50jMBGeniObAQo09+YZgfnuWc+0dGqvtay/c1Lb7nM/k5Q3lWIqYYy
         EhhBWvEjdeug4xMH7lJcjm148wmiLnbi+PvKmeL5LDb7plkqWJI5NnWbkEbbS39bTQAS
         4gaA==
X-Forwarded-Encrypted: i=1; AJvYcCUruxYn3Q3gwNtPhcE1RGB6y/Y0MkoY1msAgI3C4YdroW99gM3+WEZTbe2D1TDDLZpC9y2djrtEO5nM@vger.kernel.org, AJvYcCUukHlACeLOmF+4zdXWycvFzLZgKTwQaUAGwMSmw9pNFf9bELmrYcL+pxiWdXToh+w9t8JbPp0I/2Cuh6U=@vger.kernel.org, AJvYcCVpjoj3e5IqjliiIntL/WJNgEuTxCQs4GeXoEUzJqfiXgbo2MAAFRk8WGiKTMwbGyY1ZOybVpbL7Beo@vger.kernel.org, AJvYcCVsHpb97lx6NiCMiH7WGtYpa2nTYbvCTMIMhqNGdNYAviE/0GLS/CKmCajpqu7lf9c4TSk03qZN6hVcLn8r@vger.kernel.org, AJvYcCW9ta2NPW5BiC+PiIxTQYxd2UHpoSImc6bGHRcSjo51WujONVwW07b3HtPaIQIdnw1ni71Jf15L0Psql7A=@vger.kernel.org
X-Gm-Message-State: AOJu0YywdXBNvqldCz1w+s4fnn7UooMs0WVMzz4BTwFy5OIZUX2HM19F
	aOWHPR6/B4rxaD3ABy/LwIqqZBg3te//VcywoG4O5PW0LUpQU20Qf6tS
X-Gm-Gg: ASbGnctKd/zHwUc5KjVRCzlgxJfaJbHUlE59AfTcY5Zgyne4pvoHAij0a0smefplTkF
	Tp6EJHu8dco7Bdvbbbiy0vYvPuJEUsrCRS1ACjHx98cBfMGtj8RmJ7afO9L737QKoTs18CdWbDI
	qxZg1x2f6jJt9OF44oDFVIdDwspwNdT5wp3IB6tBVY9w0jaQwLaYg5zc8xMWqD/8Upbc9TuM80N
	c4/bYdylnNX1ra/YxDN7KCTWpFjOVDfOnF9qrtcaKYqBg+LY1B/HwxaFLUfgYnvEe9wGlVrNCkd
	UyHDaoDVtWBhKs+ObIaqbqNCulSdueynKIREZ4wu1M0eOj53DtqkZCnlanbAPoCPzcS8j9pHODY
	Y0cteuGG4+wkYQQx6uk5FIwnnwgSNbvw5HmJQGnmOCIs6KPblJ4/2ZU9RtGNBQdwz0SJEOrkJNC
	x1OOtcB1AUlCPsfw8=
X-Google-Smtp-Source: AGHT+IFjTYI7L8+Tc1wo47L6JKf/YYDxT3E6ajTWF/Wb72qSoljfkLbdAWqppksKIyFsvHI6OufsKg==
X-Received: by 2002:a05:6a20:e02:b0:243:15b9:7662 with SMTP id adf61e73a8af0-24315b97a4fmr453322637.60.1755604094461;
        Tue, 19 Aug 2025 04:48:14 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d76a430sm10286316a12.43.2025.08.19.04.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:48:14 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 19 Aug 2025 21:47:53 +1000
Subject: [PATCH 1/8] dt-bindings: rtc: Add Apple SMC RTC
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-macsmc-subdevs-v1-1-57df6c3e5f19@gmail.com>
References: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
In-Reply-To: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3470;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=qrLflRK+GGZAbgfPL/rFlU+6xRQThTOb/YM9H8lO9nI=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlLUvLW/t9TY3X828uY+j3N4tfaNPs36lVfYtfSUT/vz
 aUtnny4o5SFQYyLQVZMkWVDk5DHbCO2m/0ilXth5rAygQxh4OIUgIlcnsbwi9lA+FqsqeAjBbeZ
 BrLPr01d/llLcuo8Nj1Wk7Ub5VyfODIyTOup3rVm68M7nlNTVf5xK6zZPSf11ynGC3bdnmIcSq7
 buAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Sven Peter <sven@kernel.org>

Apple Silicon Macs (M1, etc.) have an RTC that is part of the PMU IC,
but most of the PMU functionality is abstracted out by the SMC.
An additional RTC offset stored inside NVMEM is required to compute
the current date/time.

Reviewed-by: Mark Kettenis <kettenis@openbsd.org>
Reviewed-by: Neal Gompa <neal@gompa.dev>
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
2.50.1


