Return-Path: <linux-rtc+bounces-4677-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B03EB23E54
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Aug 2025 04:45:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D4856224C6
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Aug 2025 02:45:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29DE81EF389;
	Wed, 13 Aug 2025 02:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="sf0B3yS1"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8D5C147
	for <linux-rtc@vger.kernel.org>; Wed, 13 Aug 2025 02:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755053118; cv=none; b=J3iAu1GNT6B1gsg+og6vWjinck56ZOwy77DpvETdpYMyILrgj9+4QFdF3ip4glfLT062jzG9UEbXqWvbi29qKu+LV3xNRtrCLZbrlm2lPf76lvwwiXgrcOGRi7DYdn63KyzkK/w1b1pH3svcNCFBVlVxhJ08newgje4gbGhIFt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755053118; c=relaxed/simple;
	bh=f3e7VDZ5RpctNbfj+dyIcOXKfTplNtROBxfFMgGp3q0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dpA+w9G7OFXCY9ymWSiv2Jmy8cHBfqZV27cN0ga1XTma8qcSI0cbBd1sA/oAVOs5Xr/bch1j4Rf9ejTbChSCSFUfTfGn2ZMwaUN5WMM7uEjrdFcB2O0FUq0XA4F9f6TkQcfHYPv+alSgnnpvrJ71XnGws6rvdrsRDno3qme12ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=sf0B3yS1; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3da73df6b6bso25687905ab.3
        for <linux-rtc@vger.kernel.org>; Tue, 12 Aug 2025 19:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755053115; x=1755657915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ek2s2DUqL/jgDZvOvv6Rjx1Dp3m/erc1mrYIyBeINSk=;
        b=sf0B3yS1qPud7q0W3S6BWnLkjqfU+/Ju2ZJenWEd5LYeNeg+/pSFoLuBki6/pm9NGN
         ZvPeNY8njAoqVaHrLOHzQAusHYSmAYC8etonHWddbRyG/tYcjaM2Nll3ynGj6F1g6min
         Q7YQMxm/flHGpB+Nk/eVBYDPWa9zAEActpDiZgoo8CtqLfYsyNGVWlHW5zOZzXycBSM3
         uUP60JNt3X3/rB8ZZiNkyz5kuf3OwzDbWthTq5aFh838vBVq3izeciEcPl5lYnXT1iu6
         AJGdWzncJuQmNv7lOjOvgRXQntzsfck1oZWkbVPMprIbUqqsbDRwHnBml4iKm18N3Yux
         7MEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755053115; x=1755657915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ek2s2DUqL/jgDZvOvv6Rjx1Dp3m/erc1mrYIyBeINSk=;
        b=GT+4TrB1srbOs7i9ZkJns39MSQFqGy5BASgjkKfoOE9GYrgP4mKCV9LeS21lQ1wyYg
         +8o+nyR7ZsN8MKWa67SCWZTtBU0bxYm4AtWQE9pUZPF1Kz2FO1IgDSoy7vb5fLwUmP4S
         k6cPKgo9W2qmzeKRqNh4eEjwGai5JhF8HgV8mTFGDeUjGYnUecL9jfHS5ppeTNfzd7i5
         ag2OekOKzvrb4mwzEXch9+tQSSBxbDjNBvr1EEdOgADNfaWOkH4TL420l2lCGxiwE1a2
         pLrXmcJpbG1l/9u9JzL9XVLtoiTJeUe09AoIvWyHE2s3Orw4BKXRKm5Vt/YM4DVaJE19
         e/hQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4Q0b06gWPV84Zxas0iyPweWuv081wfKxnQ9ygpgLMsYcfNmRaKHtAaUe9EjSukxc4z1a8cDZz/hQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiORIpgDoQCA7v0837Qz7ueFDQkVznNlpw26XaR22Gv02Aarl9
	6hAIn8nKhNa5l+x/ISjEnjvsud1XSgZFa4RbKfB45hoBuApl/wbZwkVxCvq7UzRSY9Q=
X-Gm-Gg: ASbGnctzMJRBhQI7nXKklYQwSR1LxLYlqzRAAGRQOttUKBFLjLY305lcPbVwEoC7RAR
	IgNPH/c94DtLVg9aKMkyDuPKaDS/IoGiU+hEGzWGFyVWZ8/QijDCPxDc2+AC2OKogWCI3vLVTPp
	vDrKeC8KCBo9a34Hlkg4KSyDjo1H2FWUr9kiDM+4yIxV/ntg/s6NfVWA3+TPWhMc8ZDZ8x/AJUT
	LQcN6Eal0EmeXbdfVn3dkteb7Sr1Erd0uS3//d/qM7s4tTNApzWE9uIagGMmKYLL3wu6FROgt5M
	4M2Um6XCpOOF61Qh4w21uLuWrYrFuZvTX2BOTUKCGpd5tXV9OvpmQwdFHMtAFEerq8R86lTJ1Tx
	Rda6jjcwDIMS4FLPJo2ux+xwA/TWRfqMXv6eX9rFq/4XRgSVQurQxgA5LZk3Dsvgz2g==
X-Google-Smtp-Source: AGHT+IEIj1vS5MVYprDokhwZ6AIsmFX7Hyk7OB0z1ohQkNDbaDoool+pCm1v0mkiT6rf8e612agvcw==
X-Received: by 2002:a92:cd86:0:b0:3e5:40e5:bade with SMTP id e9e14a558f8ab-3e567367d43mr30922625ab.3.1755053115415;
        Tue, 12 Aug 2025 19:45:15 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50ae9bcfbf6sm3430829173.54.2025.08.12.19.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 19:45:14 -0700 (PDT)
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
Subject: [PATCH v12 1/7] dt-bindings: mfd: add support the SpacemiT P1 PMIC
Date: Tue, 12 Aug 2025 21:45:02 -0500
Message-ID: <20250813024509.2325988-2-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250813024509.2325988-1-elder@riscstar.com>
References: <20250813024509.2325988-1-elder@riscstar.com>
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


