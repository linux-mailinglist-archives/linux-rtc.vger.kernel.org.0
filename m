Return-Path: <linux-rtc+bounces-4769-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 86896B380C8
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Aug 2025 13:23:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28B5E16EAAE
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Aug 2025 11:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8BE6350D47;
	Wed, 27 Aug 2025 11:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="diQIRR9g"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5C034F468;
	Wed, 27 Aug 2025 11:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756293787; cv=none; b=hdSyPRzPskr36rkv5smw1G5M41ZsCB7tF1geUNMb9O/SP+spni18QEYgGCsVJUGGtQrJwMMLnhYT6FaTjCqQbw/c7bJQ2ifa+tbO+dC7J4J9qr0hHr+Nn8AT0QruyVfLcMuup+f3cx5oe6P5TPL6GyRcyodZ7sq7XP1t3NAYJ3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756293787; c=relaxed/simple;
	bh=pxcU2aOREOtRRxzuCcs3ZxRurRuImy+zjNoj2CEiGZs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CfC2pUnHJYY5BabK2a8o/Dj/VzoxTlxFshOB/7xzoeh7Z6vH99yibkb4QnJyUgYhOzhkLMZQP+x1jcPkwjZ9m+2vpR6niJ9ShsaDS/MC2rZKbNvajIfC33ukS5IJAFtq7BT3Y6hgXwRm6uMwssQV3+dhYla1S0378WARYfHLNpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=diQIRR9g; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-248a638dbbeso2899675ad.2;
        Wed, 27 Aug 2025 04:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756293785; x=1756898585; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lMx7ge5RX0V+OLlOISVXfqktk6COWSxJMAbdSdyPV+w=;
        b=diQIRR9gkNYYba+bFr+4X+7X949wPomuNK5k8cJRCsL4MbetDlo07WpRoxowQjIrzW
         9OBom3zKBMMuJG3VjtHHq87OpVjteuTTDuj7tyUrRU5yQeiNTj/XdiVPs969M9A93TCM
         tIEhCbpZ5ZegWRkmnAGqKV91A5lJ7wsQ/WM1E81P6jsTCf13Jd4ggPqAb4ZUScBUz8Yz
         ljJw7XIuJUjhRvKG6UZH59HtE6IyZBeaxc1a1r9pFLYeaMfy8WRHe9wIyCDOmPHNz9bC
         Sd+CsHCAc0cdp8tBClv+fQ1qbS0/TN6beyQGFLZ5lKnFTd1c63J+RwVf/ywHJOaB5a+b
         AxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756293785; x=1756898585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lMx7ge5RX0V+OLlOISVXfqktk6COWSxJMAbdSdyPV+w=;
        b=JXQWdM20heibQC63S5+RHiX6PkhxaeTsiBtRsYcg+gZbrf2E2o2WOYI2EOJTvXopLF
         xe+iVRZ3peUGQ7bz4BaYcz4sD5nb5x95tk5etceEun1WSA7tcVll8MQ+F0Cd/kZ+d4Yk
         mLXDKBjpwoNy9NFY/yQ/u5qQi8W4xnY7bI+JJWXbGrlMce2+CD/Nm9QGizTDVzq9s1HO
         3VllLAUzJ9GVyoRYOARsF5L1GIMRDDtkI5U1EWGMFnTymKKruAiNDEBXBXB85HJBeRZO
         uuZFXQryTyryuVgtiq0TTthVWtjKxAFUnXfxnsFRewWtfpDeWPtB4XQdDI/sqG0e7tbF
         vkGg==
X-Forwarded-Encrypted: i=1; AJvYcCUBOi8rxlPXiuAas0wfCqOwwznHqx8I9V8pheCSiW4zM3I22gTBWVSA9r7u8zKl1gKJpKO8VrOoWZuy@vger.kernel.org, AJvYcCVhsZzL5P1UcTiwIwq14fXb2CT6ZwL+SAH6flDZ7m+PJdsvoFpAOq6gmBuJ66KTTel6SVwWxK0zT2yX@vger.kernel.org, AJvYcCWBVmQXTAHw18hJ4c2vo3vxAqAhoDoSgC6qng0adPkfbFjOYfRRmxTBBrWgpT3CQvKHl4L/OSX33UQTIXU=@vger.kernel.org, AJvYcCWTlTHfCrTEVyBO7Nq1ZPDPYb+k9vrdzWQA58l8tuPnHSt/ggg51Jgzxql60I1u7n8Dsrsbv4KbebkrQec=@vger.kernel.org, AJvYcCXo21MM5AzH1hDxP56mUPCcaUftcosg630r2N5fVyR4jXFtlcdmCxY3M44JRa5TJy+9SpvcEsHUUmiAd6Kk@vger.kernel.org
X-Gm-Message-State: AOJu0YwPZpAAZ0cXVE4/Sah+Z4cBLZITaJSRfkx3qLCBlrN2MzlSBS3e
	WFxxRvmSrKcT6wdXzmhoPRduUfgcVrSd3w/l5EnD3LgfRVDwgmpYOc/sujvnbyiT
X-Gm-Gg: ASbGnctRUirsZ/qyufhb3g8v997yLNfcS0b6/BP40Iptz9EhRz5yPmJ8svGkWXFHic3
	oW5l/IK6mJAQELiYrMp1tfioYjCPP+HuY9Dwu6bbMf9huywaVpkHfAjMBe1TUW81a7P/EIANW9o
	xtfnid97XMCclrsLM63Za9MeRZChGQWmRO1Ph6C8inEt2U3JrtHuNON1Bwhzqv2zVttHVFpDp13
	kOM49Vq2//C0kn7jYOCMjTllTpJP56K2aa2WnvJcVFnvoh6pMK4bmC5D0t/dFuDP4jhkKW2gN7F
	4yaTVaUtktUlcS6orCrRXSaLMOT/q4pJk3bPcqqE6HhSoeUjaKgeSt+y3w2RaUDFqpe0KC9i+Hk
	OxA3gKpuQy5aj0HkEDHp7wgvA5EoBMrujXZmteywGM4w7oBnTMvo37uD4WZPeGRcXXQ5cN405AM
	jSm6/g2peejP7wmkcj
X-Google-Smtp-Source: AGHT+IF96nOBV89XAjJ4kjuERk9/bHO1FA/Ey9YMo6wYm4uiasLB6ej7p9n24uxKX3zXTXWR9yC0Sg==
X-Received: by 2002:a17:903:943:b0:242:fbc6:6a83 with SMTP id d9443c01a7336-2462eb56b82mr242150185ad.0.1756293785286;
        Wed, 27 Aug 2025 04:23:05 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fcd6232sm1819708a91.16.2025.08.27.04.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 04:23:04 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 27 Aug 2025 21:22:36 +1000
Subject: [PATCH v2 02/11] dt-bindings: hwmon: Add Apple System Management
 Controller hwmon schema
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-macsmc-subdevs-v2-2-ce5e99d54c28@gmail.com>
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
 linux-input@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7585;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=pxcU2aOREOtRRxzuCcs3ZxRurRuImy+zjNoj2CEiGZs=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBnrXjUZue70sF8b25USLiK50JO1tt/Q0n7atllVx7s/v
 T3Yrh3QUcrCIMbFICumyLKhSchjthHbzX6Ryr0wc1iZQIYwcHEKwEQ8ghn+V3EcFdQ3q5f7I/Zd
 /jeTzeK3CfIHP5y9/bXQ/601n92GCwz/bEKOW5/oyp48Iehb/S+Hbx/eOO1unsWgb2i71S9ie+9
 mLgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Apple Silicon devices integrate a vast array of sensors, monitoring
current, power, temperature, and voltage across almost every part of
the system. The sensors themselves are all connected to the System
Management Controller (SMC). The SMC firmware exposes the data
reported by these sensors via its standard FourCC-based key-value
API. The SMC is also responsible for monitoring and controlling any
fans connected to the system, exposing them in the same way.

For reasons known only to Apple, each device exposes its sensors with
an almost totally unique set of keys. This is true even for devices
which share an SoC. An M1 Mac mini, for example, will report its core
temperatures on different keys to an M1 MacBook Pro. Worse still, the
SMC does not provide a way to enumerate the available keys at runtime,
nor do the keys follow any sort of reasonable or consistent naming
rules that could be used to deduce their purpose. We must therefore
know which keys are present on any given device, and which function
they serve, ahead of time.

Add a schema so that we can describe the available sensors for a given
Apple Silicon device in the Devicetree.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/hwmon/apple,smc-hwmon.yaml  | 132 +++++++++++++++++++++++++
 .../bindings/mfd/apple,smc.yaml          |  36 +++++++
 MAINTAINERS                              |   1 +
 3 files changed, 169 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..08cc4f55f3a41ca8b3b428088f96240266fa42e8
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
@@ -0,0 +1,132 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/apple,smc-hwmon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple SMC Hardware Monitoring
+
+description:
+  Apple's System Management Controller (SMC) exposes a vast array of
+  hardware monitoring sensors, including temperature probes, current and
+  voltage sense, power meters, and fan speeds. It also provides endpoints
+  to manually control the speed of each fan individually. Each Apple
+  Silicon device exposes a different set of endpoints via SMC keys. This
+  is true even when two machines share an SoC. The CPU core temperature
+  sensor keys on an M1 Mac mini are different to those on an M1 MacBook
+  Pro, for example.
+
+maintainers:
+  - James Calligeros <jcalligeros99@gmail.com>
+
+definitions:
+  apple,key-id:
+    $ref: /schemas/types.yaml#/definitions/string
+    pattern: "^[A-Za-z0-9]{4}$"
+    description: The SMC FourCC key of the desired sensor.
+      Must match the node's suffix.
+
+  label:
+    description: Human-readable name for the sensor
+
+properties:
+  compatible:
+    const: apple,smc-hwmon
+
+patternProperties:
+  "^current-[A-Za-z0-9]{4}$":
+    type: object
+    additionalProperties: false
+
+    properties:
+      apple,key-id:
+        $ref: "#/definitions/apple,key-id"
+
+      label:
+        $ref: "#/definitions/label"
+
+    required:
+      - apple,key-id
+      - label
+
+  "^fan-[A-Za-z0-9]{4}$":
+    type: object
+    additionalProperties: false
+
+    properties:
+      apple,key-id:
+        $ref: "#/definitions/apple,key-id"
+
+      apple,fan-minimum:
+        $ref: /schemas/types.yaml#/definitions/string
+        pattern: "^[A-Za-z0-9]{4}$"
+        description: SMC key containing the fan's minimum speed
+
+      apple,fan-maximum:
+        $ref: /schemas/types.yaml#/definitions/string
+        pattern: "^[A-Za-z0-9]{4}$"
+        description: SMC key containing the fan's maximum speed
+
+      apple,fan-target:
+        $ref: /schemas/types.yaml#/definitions/string
+        pattern: "^[A-Za-z0-9]{4}$"
+        description: Writeable endpoint for setting desired fan speed
+
+      apple,fan-mode:
+        $ref: /schemas/types.yaml#/definitions/string
+        pattern: "^[A-Za-z0-9]{4}$"
+        description: Writeable key to enable/disable manual fan control
+
+      label:
+        $ref: "#/definitions/label"
+
+    required:
+      - apple,key-id
+      - label
+
+  "^power-[A-Za-z0-9]{4}$":
+    type: object
+    additionalProperties: false
+
+    properties:
+      apple,key-id:
+        $ref: "#/definitions/apple,key-id"
+
+      label:
+        $ref: "#/definitions/label"
+
+    required:
+      - apple,key-id
+      - label
+
+  "^temperature-[A-Za-z0-9]{4}$":
+    type: object
+    additionalProperties: false
+
+    properties:
+      apple,key-id:
+        $ref: "#/definitions/apple,key-id"
+
+      label:
+        $ref: "#/definitions/label"
+
+    required:
+      - apple,key-id
+      - label
+
+  "^voltage-[A-Za-z0-9]{4}$":
+    type: object
+    additionalProperties: false
+
+    properties:
+      apple,key-id:
+        $ref: "#/definitions/apple,key-id"
+
+      label:
+        $ref: "#/definitions/label"
+
+    required:
+      - apple,key-id
+      - label
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
index 38f077867bdeedba8a486a63e366e9c943a75681..3fc4aa39292395f27b5694550858c6b34d18308d 100644
--- a/Documentation/devicetree/bindings/mfd/apple,smc.yaml
+++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
@@ -44,6 +44,9 @@ properties:
   rtc:
     $ref: /schemas/rtc/apple,smc-rtc.yaml
 
+  hwmon:
+    $ref: /schemas/hwmon/apple,smc-hwmon.yaml
+
 additionalProperties: false
 
 required:
@@ -84,5 +87,38 @@ examples:
           nvmem-cells = <&rtc_offset>;
           nvmem-cell-names = "rtc_offset";
        };
+
+        hwmon {
+          compatible = "apple,smc-hwmon";
+
+          current-ID0R {
+            apple,key-id = "ID0R";
+            label = "AC Input Current";
+          };
+
+          fan-F0Ac {
+            apple,key-id = "F0Ac";
+            apple,fan-minimum = "F0Mn";
+            apple,fan-maximum = "F0Mx";
+            apple,fan-target = "F0Tg";
+            apple,fan-mode = "F0Md";
+            label = "Fan 1";
+          };
+
+          power-PSTR {
+            apple,key-id = "PSTR";
+            label = "Total System Power";
+          };
+
+          temperature-TW0P {
+            apple,key-id = "TW0P";
+            label = "WiFi/BT Module Temperature";
+          };
+
+          voltage-VD0R {
+            apple,key-id = "VD0R";
+            label = "AC Input Voltage";
+          };
+        };
       };
     };
diff --git a/MAINTAINERS b/MAINTAINERS
index aaef8634985b35f54de1123ebb4176602066d177..56aabfbc2520749beb9dba235f8e86c15e17b7b6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2380,6 +2380,7 @@ F:	Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
 F:	Documentation/devicetree/bindings/dma/apple,admac.yaml
 F:	Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
 F:	Documentation/devicetree/bindings/gpu/apple,agx.yaml
+F:	Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
 F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
 F:	Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,*

-- 
2.51.0


