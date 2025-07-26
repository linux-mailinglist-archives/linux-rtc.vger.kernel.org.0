Return-Path: <linux-rtc+bounces-4590-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C2CB12A93
	for <lists+linux-rtc@lfdr.de>; Sat, 26 Jul 2025 15:10:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECAA1543677
	for <lists+linux-rtc@lfdr.de>; Sat, 26 Jul 2025 13:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26E62246BA9;
	Sat, 26 Jul 2025 13:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="MEalPpci"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648C5243378
	for <linux-rtc@vger.kernel.org>; Sat, 26 Jul 2025 13:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753535413; cv=none; b=WZdTJONBKNATlvFYR5qkQLIBRjnCXePozDwPrINeJHjg5fJhWDzHFNrne05sAsF11y65IIDl/s3CuhVSdGihKrw1PlebgD68JldjVUIeY6dAjBOVKfV57hrOyR/nUlhp/jtSl+iXbYe0AOqlqFW44fSEiWLr8Gg5ECd/Zty4En4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753535413; c=relaxed/simple;
	bh=f3e7VDZ5RpctNbfj+dyIcOXKfTplNtROBxfFMgGp3q0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EPN1/zbtUOynvFb3ceQqrXf69h2VdKnT3DNmJSrFVi4Y/e/ah2qi1Xs8oXG1FW6TX0s7F00+HOLHGrcW+nrW+Y1VRyixWdfwZHLkfFGuIzz2CnAPQRwAHtLnPzazAhZ4QyyKGFTrQMvWqOTCCQpxWnoURmWlQ2lghb2F3+BqXYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=MEalPpci; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-875acfc133dso122696139f.1
        for <linux-rtc@vger.kernel.org>; Sat, 26 Jul 2025 06:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753535411; x=1754140211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ek2s2DUqL/jgDZvOvv6Rjx1Dp3m/erc1mrYIyBeINSk=;
        b=MEalPpciqofsTD23ypHVjOoZg3mhGgZTUzOcbhXJTTdTJEva7ETDHaxzFQzd+NzOdQ
         qAa9IffOjDq56G2SQk00cTgfbzW6PVVKLr3ebteErRFswMxoFOzqWrjIZnED2xm8egmC
         ykQXraZf/d/XWxS5mU7+GnsmMADwkKK456CO2HR+xzCNW4wlaHahXkGLfykABkJLJSoQ
         rJugMYJPbEFd4hC+ti36Pud7Nahtd3oMCmVbtX/MdpEywWPlKIm590sXN9TOvTRA8FPF
         Kur9IME8CCWZwYiOibua8U4YZb7pkOjd7eO+l5KBufTupbpmrIFlEADxuBGow7dbGHof
         hndQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753535411; x=1754140211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ek2s2DUqL/jgDZvOvv6Rjx1Dp3m/erc1mrYIyBeINSk=;
        b=P6KSDCzcf3B/gOSPCGgvYJiCeE/mXlJAtsDirTf/8eEmGYJuxaz7TlIcqYl+kvZE7C
         v7L+SXJEifuy3cXJEtDnieq5b4fcQ4135/U3P8RezR/Au6WU+eqlPYei1er5hxvaRmOB
         oHLXa6QMdorikV4a1Kq1KhP6wTdHMrue4L9Cov0aAUVmnoV/RA0aoDU6mMNZI75D4Ke4
         gjUa90jnlt17qNLLPFHrAGF5cI6DOWR5BmR73d/E8UOcc47jU6ZCKmZjgsOogzOGb2F8
         gMY4T63evSR3VxFtLXjJBxqhbgpme0M89MaUmZFE0GsSsE6tD5L32yM0TEQWdp9g9mhw
         oh6A==
X-Forwarded-Encrypted: i=1; AJvYcCW/BYvvfia8p2fLyAI8Td3LAugsfinmBwSi0b1KIuW09IXz7pZVU62246ybUFGxFIO42IpNhr6/cS8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5kUC4a4FNia32B+6m88ba6cOKi6uRzDWQwT6wPA6VHDMUn2/v
	GADnnWSJtwCbFe2fjWwLOMZ9LoYXAlWLZpDNhcls++qBbz3OhXAfozjiIxBghP+p6oE=
X-Gm-Gg: ASbGncujKcExxRG4H3B7eRQKdGcgtEFSlX+nIE/CgGbwBD2MaQIhPbbiSv0C1tjpDBR
	yvvLObwVroZr9KO3lztxH3Se4LDutlnF9OWHdEFfcZIUMyCqvEJmy1EKe111VrKOWh1iX10vM+X
	lLz83oTyTokvP2q2xtb8jZwnvQtfDAIYCF4U4K+Z23l3sxMat4UzhF3vMQW3McTPrrC29mFsQbh
	fL8+dAM75n0Yc1P2Ov9Io6QpTBsY3/35Z4CB8tSubpFwEHwgfCBjDKinQSNBYzd/42lnj6pNZCR
	Pwav1Bd1IduwLjiPgvGrO+/rB5XodPl+Swja/Hw718An3oA8KTNN5WlGHyIUImq3ANLqoSUniBe
	ssqm2aWMzreMoEIHzbJhX4epkRWaMWDlyNeyNcH97OHoI3M1xrQuXH3s//qTM3jJ5IX/rwGjA28
	Au
X-Google-Smtp-Source: AGHT+IHyyfkAGrv7e9QP0fqrvp0iqIuBvwoIPIrl5BUPHk4N3KVmqmw/7gL1AW8CJAs0LQjqCf81DA==
X-Received: by 2002:a05:6602:29d2:b0:85b:476e:ede2 with SMTP id ca18e2360f4ac-8802293bd79mr912922239f.13.1753535410568;
        Sat, 26 Jul 2025 06:10:10 -0700 (PDT)
Received: from zippy.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-880f7a4ee9fsm49551439f.33.2025.07.26.06.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 06:10:09 -0700 (PDT)
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
Subject: [PATCH v10 1/8] dt-bindings: mfd: add support the SpacemiT P1 PMIC
Date: Sat, 26 Jul 2025 08:09:55 -0500
Message-ID: <20250726131003.3137282-2-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250726131003.3137282-1-elder@riscstar.com>
References: <20250726131003.3137282-1-elder@riscstar.com>
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


