Return-Path: <linux-rtc+bounces-4574-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95485B11238
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Jul 2025 22:26:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B0E7171866
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Jul 2025 20:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57EDA253B71;
	Thu, 24 Jul 2025 20:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="14fK59CQ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBA824C06A
	for <linux-rtc@vger.kernel.org>; Thu, 24 Jul 2025 20:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753388720; cv=none; b=qEsrEnirfNT4/pCKMYuzo70L4aN0cQj53OFbcKMLjCe1gg9bn+R7/BYbW9DelWfjlcttnBZjpg+xvnb/4KZK3Av2P0poSVkUTA04Fdb0V0rDpziO912GpWSExPnKW+c5AlcAEY+FWSXz4xX2xZyQARtkFFgyePccJa/5nWiPMeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753388720; c=relaxed/simple;
	bh=bU00eIbaxTlZ1yJH4SI23SGz9SQnCl2cghYFI+SdoQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EfjbTZn+ZQCOwTc1vioRYgT9i/OKSP1OxjNjo2Vm5vyQBv5vUwc8+iTO3E/XVj1PqnycI7SuRTmOALPQ/y+llJNmFLIwD30V4PcgbrNsZQq+UQ/QUAxirR1g5QrZn+OnF8wrY3suVYMY5q3+hVHqydOR7/ianN7U+jTf3m1e++Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=14fK59CQ; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-87c28e9e7ddso104032039f.1
        for <linux-rtc@vger.kernel.org>; Thu, 24 Jul 2025 13:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753388717; x=1753993517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+iG+v28WWuHGvV9OeNkoKxEvvahkCo7ownJvbOD1hUw=;
        b=14fK59CQShpyMeyQfVOyGWbPZd9PoG8QCa1txVBC0pg52II3RHniFvaHsAgPpu530+
         XocnaIDkyt4uFFxP0Yy+JsQ+rb6dJ379I4AagEbYjHIVMzQ048vB8RnstXXIxyo+HaGf
         yZnroeiSDEJnbN/DVZSb3gQkSChw3nps5xZrG5snnCevVRxvBllUtBBSjDju9Q01OgME
         3BXC+JtL0RcuGOqyb2NvYewUA451jqLf1TR617XIYxAuXNWfPq82U/0MrGs0ay7pW+yV
         YGxyyN1MzsBFyFKPSE15GgVsmbWZnibOmNTOeh4M8OqXzJ4prdp3HRxe2ra5q/PJtbQc
         RFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753388717; x=1753993517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+iG+v28WWuHGvV9OeNkoKxEvvahkCo7ownJvbOD1hUw=;
        b=JuNuKrK+QboHE5emZpsRAjgO4jOJaCw30zzohQK7gOop9xcD7ls9LcLBy7XFXdBhuV
         KjWnDJ2gwW+zJE7Vf/UUgvp0DaDUdardkdjkCgejMYST5UsPDehBgm+nbSOsm0rEdXqW
         KXF886dhBrgL16sxqKQiRVvU3iniRNg6j3OK9CBsQUvaNrQZ8gN2qOhQhWGsgV7fPDES
         hBVVf46BpXn43hHEFtx9FFwSvPXS4g72wEgpfUC1tRuH4H2Qr7Gh2tZ+bSQhpy/Pxfnh
         qjq4zK5JT4T9Xh3a6cK0o+Wj6hlj3mjheVXv1IZyjPwQSf+rPgCYNYxpStGFLCSWst88
         3lAg==
X-Forwarded-Encrypted: i=1; AJvYcCVz0Djwv42FflYCrUZv4LewzSN9YvS+VrqMGyMRfc5h16heMpOd7qIUbJAvMG7VhLldSFRFmY/g5E4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGsbeF6cpL5Lk5KUxS66qKobk7XYHhsn525jZE8dGYLlkpb8jT
	SbYvEO7hEMigePIb3F9S2BsJf664zc7dtkKDSHzefrPYGw16osV7G/lqWUiUBAM3BnU=
X-Gm-Gg: ASbGncvBLCsyhtC3ASBZGGhqtWk2+BDq/8RaCJT0Zpe+4NVH9RaFv3Ff9lfzZRk4k1t
	G5QO0BiASGMOJSIVVeBbxkAN6eGRrGBNfb3oF56JkwdogIgpP1ptrvGnNMv2sMNtN75vr0DHhJt
	xyv98Enp9BamyBtZeD+iUfhrFN16tXaxy3q87rcjlD1hgFlGu2S3hS+bmn+LLmRFM18OSk2fi/a
	pMEfGSy0fh1B5AROsLzOQ3rySbgqJWRsFeYY1vt/oWC4EmEUxjAbIXKJlKFoqnHxGE4yItlrmF8
	H8glfHQnTt8l8VAdGtUZtvLIF6/z+QY0R1esb8S0evZfvVNQ4rySxhAYMbQEvRuaSyHBVyu0UjB
	Ah7jpPK57qH3CdMUu4xlt8sscQ0a+TzJKqPfuDY+wLYivlHWLiuw=
X-Google-Smtp-Source: AGHT+IF3MGunKrhFL7OMCRuAamAqvXPpD1zcQkVbRcO7EjbuhOz10E5IrYVw1aiHLFsX1ofJu4g53A==
X-Received: by 2002:a05:6602:2cd5:b0:87c:31ad:abe2 with SMTP id ca18e2360f4ac-87c64faa2c6mr1456048539f.5.1753388717180;
        Thu, 24 Jul 2025 13:25:17 -0700 (PDT)
Received: from zoltan.localdomain ([199.59.116.160])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-87c74316a3bsm63080239f.23.2025.07.24.13.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 13:25:16 -0700 (PDT)
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
Subject: [PATCH v9 1/8] dt-bindings: mfd: add support the SpacemiT P1 PMIC
Date: Thu, 24 Jul 2025 15:25:02 -0500
Message-ID: <20250724202511.499288-2-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724202511.499288-1-elder@riscstar.com>
References: <20250724202511.499288-1-elder@riscstar.com>
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
2.43.0


