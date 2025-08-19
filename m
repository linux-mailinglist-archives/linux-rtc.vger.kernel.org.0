Return-Path: <linux-rtc+bounces-4717-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 74094B2C231
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Aug 2025 13:52:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2636C3B0CF2
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Aug 2025 11:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F0773112DF;
	Tue, 19 Aug 2025 11:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B0/OK+Gj"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C8B32C33B;
	Tue, 19 Aug 2025 11:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755604104; cv=none; b=qH/jr1ViBPW+pB2Fxb6bvrKt13JzrtbJ6wwB5q9tDcRktmnMKb88AF+nc0gKUURQKgcITU0waAbvhPQ85Ep8HyUmXqJI18SVXKJNRN/n9xWey34ywRaUuLmH0+a0geCwHTo2JcPejSImQX77QXuFDAuI5k6K9U1kZUl4fLArBAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755604104; c=relaxed/simple;
	bh=mWy0xB+bKrtovuPUjduB4hi+a8nic/uPZscLfs9cSFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GbHK+bzFxPdF/LXS8gnzvsMhdiWBnGsVyU/m+1lBuny5rkXoaBJ0wz6q92xprGxEolUbc3nxk8pUXW+MPBcnT8gN5eCcbsn8wuCCsdiwQq4jpzIQHb5R6RpIZtDtpwYlTZFa26cHzBUS5XretN4pa363U5fWZMEiECWruEb6D+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B0/OK+Gj; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-76e2ea94c7cso4504484b3a.2;
        Tue, 19 Aug 2025 04:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755604102; x=1756208902; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t/M+gZUFdVQachQlxFfSGPq/1I6HrXBG3slBhmGAHqo=;
        b=B0/OK+GjHsQs/hX/W7uKs2WTW4uAdDWer6zfb0pqW0nCqn4TK1yLgfHPPLdPaFsRlU
         qy22BjIJNu4hzf/LF8HTZertLiQ4kPkA1B+ZwksCdxnzoNXzULBEcz2cNnYH3QG/XA17
         CKWYPpfMIMAZnjW07G7Y8wAt37kIElYfOzzTfOFvY6vlmh+1O0/GKlm4TFwoGtktUAD6
         7ArWjgAhNI4vTGbjVMNxTUmS04Z0UIWSeYr9q+NTRrfkrzwiYkwAWFUhfLkcPO8Wt4Ep
         0feeinQTZwDFUkTLfgFrLbeZNld8Z5MwaT67hhcF2izebnu1ZTF3YP6CkR4XUJdhrPfD
         IoiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755604102; x=1756208902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t/M+gZUFdVQachQlxFfSGPq/1I6HrXBG3slBhmGAHqo=;
        b=vDFArmpiS+9csYF5Ypi+gbt7CXpD+lcyBl4YeRYO02fgd1tPDcbZi0+Q3zyNHKDyD/
         X/jVKurSebLga4oPLmm5hlJSdHbwi7ulxiJ7BObCcmQsSuJWXxvePyB4MKb7tMptk8Ny
         +/3T4HZm43nxAtlOuMv09RKc4kRfr8j9gYrPUke4ZCEMW1Ly7WMIobQpbq7CG9Vx1Qpb
         asTX8160ymX4puu8CsTaAE6nZiYjsp09hyKZpmq+OIfllc5xvngaiTSkkRWtnG3DcOvg
         Q0ksQRXAEtFGrZ7D4oFcCP06MGFDtLyaTag3avXZzrFa7GPOiIm4nwF/SR8rNHeb8lxv
         SNyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAfCNjqFqhxLW/Z7pPw7B2aDNTxWz4aA9Pby4ziSHKrgdzjNRgFZlX4BbbctcPtcrJ3ol/w0xJ73J1@vger.kernel.org, AJvYcCVQMqKzmrmcoHrvcxTgamXO25YsIuOmiq0vxbWCtQnOF8XZ500/SY7F7HrKnN0rzwI3ZbwyeCtlhCr/@vger.kernel.org, AJvYcCXGUsU5ULHByIo5ta+7W9pdD1ZO9lOpr3rSqIPtXOvbN9/QQtDbNRLBRvfK1MBbkBrMI+xib+bn29HPgY0T@vger.kernel.org, AJvYcCXHHsynh2E1uWWHgJSWX7ymppLgSwMk3mxjmBYSMqYK4/IWrfb3wT6Mw8y/L7LWM3gCi6MOhlUjWSgeDH8=@vger.kernel.org, AJvYcCXzylAaq3CA2YgELNrF/NapuchRZ1P52ahM2bmwu80rT9LM3XcFhDJsxV+fJ6JwzNSyqmhcNmI8jm5V+04=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFdC+m5lzoSTeGGnxDEdW+pGV4+Mm9D8N5DUUViT5wY3X4ynLy
	KUXhV1yulHqEjNx+Z38mktWoYYbNpz3qzgY5gqoG4bxCWlkHr0HN3rJu
X-Gm-Gg: ASbGncuPokgc89eETzhUWelx7Q1KafwsFiJKB3Pg8Ll35UjCZYwQRpYCFDY7Vofixt0
	2lqvtmk9HK5thvNOw9FtdvMMw0+nBGhOp9TdLvQ/4NKBkcctdZZo37Igjo5gF9C/3TeaCZPOVm4
	mrZjVMzrGUqPscEpHS7VjaBMbKxLzcuAnp9aPgNN36ir9E+dMUs0gDRn80J0QwM24fEcY6/r4mO
	DNLYGqGYKEs0cmqX//huPbcx9QuhYzUKtjC75ircJVqXOKbOovFrqL5xS5hwqUW6dLckmGw1VQe
	9iCP6t3MqNZPEAGTjUKCnF6XLLVCeCe5+c9O6GQ5p/njGaaXIhWUg5yAMOLBghsB1NzENTz15hj
	aHNgwp23MVk/M/FuqNhUQ+H/aN8JD1FqJVbCCaKsGQKkWPB/liZ2iPydWI1ruc7GgVlu1svxzk4
	vZsMv9yAkVBDziP73uAsfmDMM+Yw==
X-Google-Smtp-Source: AGHT+IGNwhXnpLzY7G6aLzH7VonJ1EWLqph7nLjWaYiYNpFDS/pCs74uzWF5/Mdp1b2iNa2DcyRi+A==
X-Received: by 2002:a05:6a20:9150:b0:240:489:be9a with SMTP id adf61e73a8af0-2430d3792f6mr3408076637.23.1755604101545;
        Tue, 19 Aug 2025 04:48:21 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d76a430sm10286316a12.43.2025.08.19.04.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:48:21 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 19 Aug 2025 21:47:54 +1000
Subject: [PATCH 2/8] dt-bindings: hwmon: add Apple System Management
 Controller hwmon schema
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-macsmc-subdevs-v1-2-57df6c3e5f19@gmail.com>
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
 linux-input@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9287;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=mWy0xB+bKrtovuPUjduB4hi+a8nic/uPZscLfs9cSFk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlLUvLmfFgwfZ3CwRNyj5Y1i6Ws51gas4qh9Nzt3d/Pt
 q9KluC70VHKwiDGxSArpsiyoUnIY7YR281+kcq9MHNYmUCGMHBxCsBErB8xMjyKfTSrIdNo44ll
 WfGvP3zZUX//VMgn+aXHWb/nsBulfc1n+Cv34IeTp5CJnr9AyOpjTLdddXqfnD1eMEettp/vig3
 TE14A
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
 .../bindings/hwmon/apple,smc-hwmon.yaml  | 148 +++++++++++++++++++++++++
 .../bindings/mfd/apple,smc.yaml          |  45 ++++++++
 2 files changed, 193 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..3ebc0463be4e1ce54005418feaa87ec7254dab6e
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
@@ -0,0 +1,148 @@
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
+properties:
+  compatible:
+    const: apple,smc-hwmon
+
+  current:
+    description: SMC current sense endpoints
+    type: object
+    additionalProperties: false
+    patternProperties:
+      "^current-[A-Za-z0-9]{4}":
+        type: object
+        additionalProperties: false
+        required:
+          - apple,key-id
+        properties:
+          apple,key-id:
+            $ref: /schemas/types.yaml#/definitions/string
+            pattern: "^[A-Za-z0-9]{4}"
+            description: The SMC FourCC key of the desired current sensor.
+              Should match the node's suffix, but doesn't have to.
+          label:
+            $ref: /schemas/types.yaml#/definitions/string
+            description: Human-readable name for the sensor
+
+  fan:
+    description: SMC fan control endpoints. A fan is made up of five
+      SMC keys - the fan's current speed, its minimum speed, its maximum
+      speed, a writeable target speed, and a writeable mode. The SMC will
+      automatically manage system fans unless a 1 is written to the fan's
+      mode key.
+    type: object
+    additionalProperties: false
+    patternProperties:
+      "^fan-[A-Za-z0-9]{4}":
+        type: object
+        additionalProperties: false
+        required:
+          - apple,key-id
+        properties:
+          apple,key-id:
+            $ref: /schemas/types.yaml#/definitions/string
+            pattern: "^[A-Za-z0-9]{4}"
+            description: The SMC FourCC key of the desired fan. This is the
+              main key, which reports the fan's current speed. Sould match
+              the node's suffix, but doesn't have to.
+          apple,fan-minimum:
+            $ref: /schemas/types.yaml#/definitions/string
+            pattern: "^[A-Za-z0-9]{4}"
+            description: The minimum speed the current fan can run at
+          apple,fan-maximum:
+            $ref: /schemas/types.yaml#/definitions/string
+            pattern: "^[A-Za-z0-9]{4}"
+            description: The maximum speed the current fan can run at
+          apple,fan-target:
+            $ref: /schemas/types.yaml#/definitions/string
+            pattern: "^[A-Za-z0-9]{4}"
+            description: Writeable endpoint for setting desired fan speed
+          apple,fan-mode:
+            $ref: /schemas/types.yaml#/definitions/string
+            pattern: "^[A-Za-z0-9]{4}"
+            description: Writeable endpoint to enable/disable manual fan
+              control
+          label:
+            $ref: /schemas/types.yaml#/definitions/string
+            description: Human-readable name for the sensor
+
+  power:
+    description: SMC power meter endpoints
+    type: object
+    additionalProperties: false
+    patternProperties:
+      "^power-[A-Za-z0-9]{4}":
+        type: object
+        additionalProperties: false
+        required:
+          - apple,key-id
+        properties:
+          apple,key-id:
+            $ref: /schemas/types.yaml#/definitions/string
+            pattern: "^[A-Za-z0-9]{4}"
+            description: The SMC FourCC key of the desired power meter.
+              Should match the node's suffix, but doesn't have to.
+          label:
+            $ref: /schemas/types.yaml#/definitions/string
+            description: Human-readable name for the sensor
+
+  temperature:
+    description: SMC temperature sensor endpoints
+    type: object
+    additionalProperties: false
+    patternProperties:
+      "^temperature-[A-Za-z0-9]{4}":
+        type: object
+        additionalProperties: false
+        required:
+          - apple,key-id
+        properties:
+          apple,key-id:
+            $ref: /schemas/types.yaml#/definitions/string
+            pattern: "^[A-Za-z0-9]{4}"
+            description: The SMC FourCC key of the desired temperature
+              sensor. Should match the node's suffix, but doesn't have to.
+          label:
+            $ref: /schemas/types.yaml#/definitions/string
+            description: Human-readable name for the sensor
+
+  voltage:
+    description: SMC voltage sensor endpoints
+    type: object
+    additionalProperties: false
+    patternProperties:
+      "^voltage-[A-Za-z0-9]{4}":
+        type: object
+        additionalProperties: false
+        required:
+          - apple,key-id
+        properties:
+          apple,key-id:
+            $ref: /schemas/types.yaml#/definitions/string
+            pattern: "^[A-Za-z0-9]{4}"
+            description: The SMC FourCC key of the desired voltage
+              sensor. Should match the node's suffix, but doesn't have to.
+          label:
+            $ref: /schemas/types.yaml#/definitions/string
+            description: Human-readable name for the sensor
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
index 38f077867bdeedba8a486a63e366e9c943a75681..370928bb42010edca17839faf0bda4630611a7a2 100644
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
@@ -84,5 +87,47 @@ examples:
           nvmem-cells = <&rtc_offset>;
           nvmem-cell-names = "rtc_offset";
        };
+
+        hwmon {
+          compatible = "apple,smc-hwmon";
+          current {
+            current-ID0R {
+              apple,key-id = "ID0R";
+              label = "AC Input Current";
+            };
+          };
+
+          fan {
+            fan-F0Ac {
+              apple,key-id = "F0Ac";
+              apple,fan-minimum = "F0Mn";
+              apple,fan-maximum = "F0Mx";
+              apple,fan-target = "F0Tg";
+              apple,fan-mode = "F0Md";
+              label = "Fan 1";
+            };
+          };
+
+          power {
+            power-PSTR {
+              apple,key-id = "PSTR";
+              label = "Total System Power";
+            };
+          };
+
+          temperature {
+            temperature-TW0P {
+              apple,key-id = "TW0P";
+              label = "WiFi/BT Module Temperature";
+            };
+          };
+
+          voltage {
+            voltage-VD0R {
+              apple,key-id = "VD0R";
+              label = "AC Input Voltage";
+            };
+          };
+        };
       };
     };

-- 
2.50.1


