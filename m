Return-Path: <linux-rtc+bounces-4631-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7630AB19195
	for <lists+linux-rtc@lfdr.de>; Sun,  3 Aug 2025 04:58:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A36E83BA1FD
	for <lists+linux-rtc@lfdr.de>; Sun,  3 Aug 2025 02:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0081B194098;
	Sun,  3 Aug 2025 02:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="AFCCAYIE"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20D514EC5B
	for <linux-rtc@vger.kernel.org>; Sun,  3 Aug 2025 02:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754189900; cv=none; b=NtmMaE8UJVktMO7sniCRtiLRsqo2AKDw6dJWucRnJiUNiBJOOILpEINHF/qswVDhL0KpXtefSIxM453MRCq/x7TgoP9pD1cnK7H8CYR1Wk7aGGVfLEu0zp77eWkTMoiWRe2CKEiOi+Px6611LOamShcGhPWlKg7A/TVRu3Bl7PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754189900; c=relaxed/simple;
	bh=f3e7VDZ5RpctNbfj+dyIcOXKfTplNtROBxfFMgGp3q0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XI7LtIgfdRfCsxTWwDRxUA2JUGPAHgxtDbFq85eaPeP/BXOepii4kEZJG5jeLHITqbKCDlIy1seWAymy5gyMYtjVb8Qa9S1zs0NgDNhfF+Y9Ww+InW0gWYG6AtCaaQSoY1uhlR0OIpXQvEiu9PDYyqO0ZhjmGAshj3ej+VIT0Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=AFCCAYIE; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-87c26c9e8d5so178918139f.0
        for <linux-rtc@vger.kernel.org>; Sat, 02 Aug 2025 19:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1754189898; x=1754794698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ek2s2DUqL/jgDZvOvv6Rjx1Dp3m/erc1mrYIyBeINSk=;
        b=AFCCAYIEp/AW/hyrmC9wCGgH4ayQm8hS9iGGTVrkoLg9svXnhJcCb2esBkWnYTdvd4
         hLB4rWiHGU4AVuJMm/v8pq6QXo27WlTJYZeGOc3RhUJnFcCigEBx/wBu8D5k2UYtORb0
         KEiAD2FbjbyvOau5tCZRI5cWHOyK7PemzitfeO5C2xI2Vwu01BTL17PygEvLmHkn4ew0
         mGTwL48nI/Wc77mkguc1qHczaW70CEF+huQGz+pKych/WGyP41KpPJWRP4K55HkO5xSN
         ZqXaMVOwdtyAt+CMRfDpu5P9vViJAEX544abp2CdtjRuJeyBU+Nt61t2RXLwLjqAvEve
         Sllw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754189898; x=1754794698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ek2s2DUqL/jgDZvOvv6Rjx1Dp3m/erc1mrYIyBeINSk=;
        b=LqU6mG1ZBLamKm0oMe5BqTk2adADSMiZT1Y3P33HP+G24khvqlCebPg3MDnFUHOy09
         F51T3HiLsL6Ncd4VmmaDOU8nozH23nUDsutr6t4QQhy6MIZXTpj1OSpPqQKTR4LJDrcN
         hiert9fdl95twn7+tDbjNNGUpU3P+Vi+ZJf5DY3HDe7ST/bnwuG8fq7P0V7wh8DM59xY
         0RPI4LaL4vyUcsbRggvby6A++LxUjiiynK+cHJ8bbAVKdwmwPCb4vXPFJErT7lCSPju/
         qKQh8aDoeN/Cct5Rl28uR2MvyRIYz7picp/yTxiSKSXZEY9jsstHcsiJbOkGCmFXnGIl
         xUcw==
X-Forwarded-Encrypted: i=1; AJvYcCV0pEmz3d4IYC3x2nSxJMQSwKegDs1AzxUdbNHzssTwQIZxryCQU+LEQWko1If3Jk3m5vnI6AbiDpU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDhYcoVG6IzbUVQu8wY3+KZ3Y3wk38iTy8WcQif133iz/JA8Xt
	ZcaHrG1C6836nK1ICOrZ5cOA5aDAnZvFzt/mfJkStJm1hX9E1GoT8FkURUjXQxf3+2Q=
X-Gm-Gg: ASbGncvSKgyASrbu8hecQhYWpFKzjMSsWPNIe17JA8NfF2yTFMlr91tQa0DdSVRHBKJ
	HPoEHJx2cNaf6N7VZW92StUun85A9gbLVehRWXdFDvS1ixQAMfJVvZ/Iy9bOppyeW3Wqr8gUiJa
	M4G3gA7q/QExaUtSIn8+2XzehIBylTKRnAw+fHhLhxYvUmCvI97qRdqAB3LbUASj0aPjNc/kxG/
	HPg+o2m1YXSvbE/nyoz19P3zun5n2TgH8MvhKO2lZkPsgodB8wm6YkrmeQypwO+FRjTwY+R5TVf
	dtZuFli0PgIUQ9/k5Q8ZhYyExkKLjXi+G1xJ01hcRKXlP0zQpXLTjWGRzBySXOVSfdfVMrkl1Co
	pZgp75O4zQEdRoOgs5HnyKEeA0Irb4Qcb6dndatFRjwRSAepc1ctSzoipursTkEpZjA==
X-Google-Smtp-Source: AGHT+IE1EI0ik3qR8R9p6oS+/rMP5rmrF5tbzg4vFpoKSdksN0WY5toRor+4wX4VhlAJ+LsTRTCKSg==
X-Received: by 2002:a05:6e02:1485:b0:3e3:c6a6:2799 with SMTP id e9e14a558f8ab-3e4161e006dmr100052085ab.21.1754189897967;
        Sat, 02 Aug 2025 19:58:17 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50a55b1ac2esm2251906173.1.2025.08.02.19.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 19:58:17 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux.amoon@gmail.com,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v11 1/7] dt-bindings: mfd: add support the SpacemiT P1 PMIC
Date: Sat,  2 Aug 2025 21:58:05 -0500
Message-ID: <20250803025812.373029-2-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250803025812.373029-1-elder@riscstar.com>
References: <20250803025812.373029-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the SpacemiT P1, which is an I2C-controlled PMIC.  Initially
only the RTC and regulators will be supported.

Signed-off-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/mfd/spacemit,p1.yaml  | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml

diff --git a/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
new file mode 100644
index 0000000000000..5cc34d4934b54
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/spacemit,p1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT P1 Power Management Integrated Circuit
+
+maintainers:
+  - Troy Mitchell <troymitchell988@gmail.com>
+
+description:
+  P1 is an I2C-controlled PMIC produced by SpacemiT.  It implements six
+  constant-on-time buck converters and twelve low-dropout regulators.
+  It also contains a load switch, watchdog timer, real-time clock, eight
+  12-bit ADC channels, and six GPIOs.  Additional details are available
+  in the "Power Stone/P1" section at the following link.
+    https://developer.spacemit.com/documentation
+
+properties:
+  compatible:
+    const: spacemit,p1
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  vin-supply:
+    description: Input supply phandle.
+
+  regulators:
+    type: object
+
+    patternProperties:
+      "^(buck[1-6]|aldo[1-4]|dldo[1-7])$":
+        type: object
+        $ref: /schemas/regulator/regulator.yaml#
+        unevaluatedProperties: false
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@41 {
+            compatible = "spacemit,p1";
+            reg = <0x41>;
+            interrupts = <64>;
+
+            regulators {
+                buck1 {
+                    regulator-name = "buck1";
+                    regulator-min-microvolt = <500000>;
+                    regulator-max-microvolt = <3450000>;
+                    regulator-ramp-delay = <5000>;
+                    regulator-always-on;
+                };
+
+                aldo1 {
+                    regulator-name = "aldo1";
+                    regulator-min-microvolt = <500000>;
+                    regulator-max-microvolt = <3400000>;
+                    regulator-boot-on;
+                };
+
+                dldo1 {
+                    regulator-name = "dldo1";
+                    regulator-min-microvolt = <500000>;
+                    regulator-max-microvolt = <3400000>;
+                    regulator-boot-on;
+                };
+            };
+        };
+    };
-- 
2.48.1


