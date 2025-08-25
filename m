Return-Path: <linux-rtc+bounces-4756-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC857B3487E
	for <lists+linux-rtc@lfdr.de>; Mon, 25 Aug 2025 19:21:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 779D61A81443
	for <lists+linux-rtc@lfdr.de>; Mon, 25 Aug 2025 17:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C38C302CB5;
	Mon, 25 Aug 2025 17:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="VuCApZpS"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B173002AA
	for <linux-rtc@vger.kernel.org>; Mon, 25 Aug 2025 17:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756142468; cv=none; b=l36dy2txWtOmKERUWQZrFGW9mXWnLAXbOQbfOVIOFIY5z/1dAHHwRDD6Ql80wrOfEPaK0y7GupLR0FhJtx0g6axIE9XXnZ/19+Dyi0Q59xk1uBb4djbOpXz4BLz8kFcLRussSgJnhfrletkKrwG7QFx9NyiPfy0c94PLn5ai1AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756142468; c=relaxed/simple;
	bh=aevVzKjUd0a80xeiBDUHuCUKYX/2tnRSDd9e11O0KpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N7sVSG2A7TWuzsVQ6sK12zKUyhbXY12Cx1Su30OAaVTTD1/nsvHBtz9PKb/Vhkd622IwfPykI5B3BEc+NSCahau36sFMKJCQivDTyf50wvgr3Z5s7+9vOW0VEl4sv5llENCSdXspimA7bAgsEgnY04imVceQFZkX9Bz5lhy9seI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=VuCApZpS; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-8844ee2cb61so124350139f.2
        for <linux-rtc@vger.kernel.org>; Mon, 25 Aug 2025 10:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1756142464; x=1756747264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dYY6dLm3K5+01OXDQO8emoD1CldXvYvk8MiFXHZCE9A=;
        b=VuCApZpS9KHe3c1/XYHvZ5V89HUpS9vSXiEiCpMAmOfQcaKvyMQ8xQIGF07IQthPto
         KyRqiLFALr4HoCwz+KpZoCGpPsXYKb1vBXl3GeNlzycUYdH/9B5KGlRjGp8bMbM4huqv
         3XllBsTJB22GjesGHGcCGiEOGFBu5STw6myyOXySdzl+qc580SBJTMUMOA4z8z6nSLeB
         h2q7eym4hnkRDEXCmKS4uKc+GYhcminoGlVCVZNqI0TVPP/BcQfwW2uljC33W/JPmv7r
         ytdG2GuF5LyXxowEOSRIyp2FxUq9/WDZQz9xaLiTxtNal8i2O6lpjmWsxDzk6x0hdlza
         gNUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756142464; x=1756747264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dYY6dLm3K5+01OXDQO8emoD1CldXvYvk8MiFXHZCE9A=;
        b=gSuDLpjcqN8XYEnEQiMeL9rJvFC3zIWSgkQrDDX455r9gRFqCyY6HOnDSJpN6Er3Ee
         BGCqBg7kxLkCoDBzOnANBTNjADtCinDDBV9/8ocsyYvz6Gs6sYtvBJSCaENMWXm05ogJ
         EJjsZyeZlIHmw/JpIp8ucLNc1Zb0wTeHVfAc0ueOizXP+Sy26h0SOmOn3hepAu2APu5U
         hNv/Hg95DT0mJWN9buplSmfQXpCGolr6V20+shDtOSOZV3lSYZQMwwGZRGsLOvMWwRZS
         EiPje0Gu5R303G9+b4Z/rTAum87b2rkISjRrHsFkCwxo6SvqCK6XampdhIsgG+/abkC1
         BT8g==
X-Forwarded-Encrypted: i=1; AJvYcCWCacG0FO7sqI4x3x5N2lZyWQOHInsWxPfh2ky70TDHp1eWwS9b9+NiHp2J+D67RCYdm21/tQ6vMCU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1XL8ePMRVyWyrkhDdxdWgZWWOK9HCqKcQw54V+EdemdxMt2m/
	6RlIRqKradeghElAq4n3D3RCyYBbE7CEVRyuEf0PTlIBWgMll5zSOoUsZNCAvXcgO5I=
X-Gm-Gg: ASbGnctPH3tqV4q2ayHqQYe3kK1gRPadm0vyOpbpWJdqBAbqhzINxur1BAxXhgcUydo
	g0D6UbLuSGrJ5eFz8/hWubtOvvVStxqINbfQestWdgwA8SbvkKWcFIPUv77Cbc6+NTrTWQ+9ai6
	hRXmSmsS6pcdrPR/ZyCOliAgncGBN1QlBOUHkP1D2CAGmCu38CPULlMhJcSH5Vx97+wGHqX2e2m
	ppfyLDGuR2Z/6LbLHQubLteWUTF3HsfO2Lyxgvrrkgzoib8XDFQExdSLvIiR6DumHyH7GiVCxjn
	LUBKdavnvTr0R2qhqKu/W8arRT0UmeVli7pfJC7Yo5Wg7VKT3dHw3XAKGiZh7pyzrmMtBa/Tq/C
	1COrUgRHuCL3TiYEvxm30Enj1mhyBHQyHhc5n2vPHn87rvAuEDxqtEuJM0fgF5aCeBhVDscl7Wm
	G0
X-Google-Smtp-Source: AGHT+IGBXlU1oq7Hq3Hx+zyfwUPdCk2dB9M48YVwvfYPzgOuu9eQp5VooSY0xSGbyY2yI7LdGuyEug==
X-Received: by 2002:a05:6602:29c7:b0:886:c53c:9171 with SMTP id ca18e2360f4ac-886c53c9338mr1220679439f.17.1756142464463;
        Mon, 25 Aug 2025 10:21:04 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-886e60c4737sm76275439f.26.2025.08.25.10.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 10:21:04 -0700 (PDT)
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
Subject: [PATCH v13 1/7] dt-bindings: mfd: add support the SpacemiT P1 PMIC
Date: Mon, 25 Aug 2025 12:20:50 -0500
Message-ID: <20250825172057.163883-2-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250825172057.163883-1-elder@riscstar.com>
References: <20250825172057.163883-1-elder@riscstar.com>
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
Acked-by: Troy Mitchell <troymitchell988@gmail.com>
---
v13: - Update Troy Mitchell's e-mail address in "spacemit,p1.yaml"
     - Add Troy Mitchell's Acked-by

 .../devicetree/bindings/mfd/spacemit,p1.yaml  | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml

diff --git a/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
new file mode 100644
index 0000000000000..c6593ac6ef6ad
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
+  - Troy Mitchell <troy.mitchell@linux.spacemit.com>
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


