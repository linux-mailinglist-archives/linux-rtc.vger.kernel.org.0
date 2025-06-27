Return-Path: <linux-rtc+bounces-4386-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C857AEB9B3
	for <lists+linux-rtc@lfdr.de>; Fri, 27 Jun 2025 16:23:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90287178383
	for <lists+linux-rtc@lfdr.de>; Fri, 27 Jun 2025 14:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDE8C2E2EFC;
	Fri, 27 Jun 2025 14:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="CLDl86Vh"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67DA2E2665
	for <linux-rtc@vger.kernel.org>; Fri, 27 Jun 2025 14:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751034197; cv=none; b=bOZU1IeldKNSmcXUrf8/ePp96OaMBU5njs+OBrIRElahwc59BF9bbRmPzpyAElIaJEV34tO2sCXlfttaJD2HcFUqSg4GMPDuUgfhlmrn45vza/YXwxKEFs79Ne+NVswzfqrsjn4rJQ3JW4TYVtyQKX5lb4KVYF7RL65ANM2z6Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751034197; c=relaxed/simple;
	bh=vOyqrRqZ0tqkG6pWDO83ynGQRzYnD7v6m7LspWqpQ1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bb8qqKjyqjTk1+u/wIcAkEm+k8ysqP0WHdj3UL9ijzayPaJWHavKZLAKnZuMlKZ1fZbd7OdBWWyBW2XXFI7LbW9E3tX7qnug15ux5+8wqZj7/PeyTuVmgrwzRz/MXMAerXPGf8uvUeGliRSizu2LE7d6WgPXyzALyBdu9zcRv94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=CLDl86Vh; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7d38ddc198eso236930585a.1
        for <linux-rtc@vger.kernel.org>; Fri, 27 Jun 2025 07:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751034194; x=1751638994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=riR2NvFzHSo1w0g4tV+4jS0ZXA7bNFeHnroyUa7Novo=;
        b=CLDl86VhZLgi0eSOm7N7Koi1Um2A1v1j7Ig0O5tqfNZ9INhIvHQO9lf9p0vpzzfga0
         CwuEFcNFMihg+/DkUuaz+0fFK+xx24uaedinXM3M2JSD5BKPeDjz/DOzPewUZQRneuzu
         W8r3bvhiSNpvSMCpTd1MeLGM0+VY0LLg8kxh6tWU/8HEO77sw9L1k6U2I5Efwt1OfM19
         w3BaaLaIElmLVrsKQl8IDXStfrZMXp/a2Q27lQ22jWHDVL38HCQx4lG5yTKeu8+nmIT9
         k5Vvt3zMvO1KGKEOXG/N6NBffo/JdtE40zt+qYzaWvE9fwC8Opd/MGHUbDl8JVoyw+MA
         ketQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034194; x=1751638994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=riR2NvFzHSo1w0g4tV+4jS0ZXA7bNFeHnroyUa7Novo=;
        b=D9I5MAJY798uZ9iK3FHzS0NzpUZh/dhVwN/HxwoSOg3zt21JYGrOFBaIwsUAUorBQr
         LviJ45s+IP90it4NcBZfAkd6b3sPHkupPmhN/d51royKrtetrZev19slobcbZNqr9c++
         gJk/TbhNY5f7Pf+qAanYA81FM+iYuhYNr8KigtkcJdkNty3LvaiGedDr/+0xTBDEirKI
         spY28UkNpYYKt1/n+G76ZFulBLqx+AUokL0fE0z8RIySzsoZeffUQzsA0eEsUe5KCbgT
         Tffnmr3VGCBlMRr+lPmFMBa9apPAJbMs7ekTbYM/zdXB9Uj74c+1DateKwa0wcf0ULf2
         xxsg==
X-Forwarded-Encrypted: i=1; AJvYcCW1umU/wLEsflz0ik7esc7NKO8kBYAuBVFdjq9s6BM5fhRWYrdfc8EsvTQOgJkLJQNziioxR/UUkpA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiW0D6ktSabIieMDrAF3lugnQe3keRaejZZ/HZFwC3obN29nRW
	q9iXJ1tBZSEsvnR2kOyxdKZ1BohaguI4R35PjbLy+zof9NP2bKElWW7gJrgIyqzZ2xk=
X-Gm-Gg: ASbGnctpv+mugWxQtjggFuGxxV4DE5nj8NrR+Ddn/gggKN+WCo07RStwmuD+6ep25Mq
	S9URhiUmPmEUgUvMw77xLzGa7KJQuLypnfQUePHa0TdmCw8nRq4pq95WEXGSe7ZKXJXfxFA67ME
	VAqAojM2tOtdCcEPLLkc1lCxpLcsxMGr1+1NJRrnVLrpPQmrSf5bTjkbqBHGIRIx1v7y2k9muJg
	kWeD2QGNWBqgMlU7QDzIvEDRqqjJZVwHWfA9prVM6CNsR9UEs/JLlV7m1OCP6B3dR64D1pZex5j
	XhY+M3j81Nd/vdg7sixhfjNTya7xpOlpW9t3tO2zhODxoTO4alo28KYyVWEpyVgEvE+xR1hOfDP
	464bTPdcQWrfrBAUnfgiJ2HxafuVWRMsa5XE=
X-Google-Smtp-Source: AGHT+IFt3w8KBQHmUinwLlL1S6ACJgjHlzpbWyZ0LJDc8hDP+5NLFg8sIB0fDMXq9nh17vsNn8bIaA==
X-Received: by 2002:a05:620a:2809:b0:7d2:18a1:ce0 with SMTP id af79cd13be357-7d4439c5607mr583492485a.49.1751034193763;
        Fri, 27 Jun 2025 07:23:13 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44323b4c4sm135708785a.106.2025.06.27.07.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:23:13 -0700 (PDT)
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
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/8] dt-bindings: mfd: add support the SpacemiT P1 PMIC
Date: Fri, 27 Jun 2025 09:23:00 -0500
Message-ID: <20250627142309.1444135-2-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250627142309.1444135-1-elder@riscstar.com>
References: <20250627142309.1444135-1-elder@riscstar.com>
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
v6: - Add Rob's reviewed-by tag

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
2.45.2


