Return-Path: <linux-rtc+bounces-1663-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3834994755C
	for <lists+linux-rtc@lfdr.de>; Mon,  5 Aug 2024 08:39:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8AD8AB20C69
	for <lists+linux-rtc@lfdr.de>; Mon,  5 Aug 2024 06:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 271B614386C;
	Mon,  5 Aug 2024 06:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TS8qDyov"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8501E4B2;
	Mon,  5 Aug 2024 06:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722839967; cv=none; b=cMYNz+wOrfxEOi6GvPdkLIaG2XyVXkTHlokIT4NXkDDfOIlsq2pb5ljBc7BNE6wWNfka5oQ+xjdzbGQGQ8ipoH68AE9ourM8JEBS8FoNXvfXQvWdAW2s78YfemeeMu/oO5WTpImOpNMpwdiO90KaY8e6Pfy0UixsTCoX8Xmy+a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722839967; c=relaxed/simple;
	bh=bn0AatgpkDgkHcuUtx+tw+p/9a2qNxd7D4R5b72zfzw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QEA+VoDi1s8vsN5tVWvuL7eGqbGrzPtlOZqpW+dEL7yGhDUiBkpGGn6xf8zkydo/h9NdLsI/+78LWVHan6lLlHPDRu18O7P4o9xVJIPCs3ZnOafFSk5qkM/ZMtrw+jPbBz2UrVkRAmaEH7tvE5yZRZdhCuk9ytM+i9640EJr9C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TS8qDyov; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42816ca782dso68249145e9.2;
        Sun, 04 Aug 2024 23:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722839964; x=1723444764; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4z+UOba0eJ/ZXfIeErXsQjYD7+Z5Me9jIMp/Hk00nSM=;
        b=TS8qDyov+jhT8TnrHt0VH9wAUrDejwY2JRuDNFBA4oB7J7phbERta3oNGB+zzZKoK0
         mjBgQmigdlltAtMkfIGOMgBzK283l9vn3StUQYMm//eOArP3R1JsrYtvyH/orBh1uK6c
         2i5kyri9DlyJ1BMVHEOZFmy/zXB896psFrODAwXVqNQc6pr5xL+ZCs+2iCxvF0JcAl47
         7bHFR3PMz7F0iYoNeci3lzi0D+gHG+iBxYrYNc/BcZlZR5ujN7BqAk2H78i1YjJ7zZkN
         JZ/ehT1WMWZvbmwTyeVgzbKs4/qWya95DbT69G0E6brYkkkhuKfRrENkWZaR3kH9mm3G
         uLpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722839964; x=1723444764;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4z+UOba0eJ/ZXfIeErXsQjYD7+Z5Me9jIMp/Hk00nSM=;
        b=IleVAWK7kusFVK3PVh27wXnq14QAE11/e0ztdwjQjbCyZN+EqSPoumlUTJpJ4/vs6F
         r1u+FIZEEQ+pPtG67Rn1tWyhF9pEsHVJ6ThORfq3Ja0c3SLmOe3qR94nbBv6BkDwFiKT
         7QtXNtJPPw+7Xo2MVGWI0afzNbIk/yN/93fmtuBjROdHrMl69DQjYF/dMc+wtyK5rSOu
         8K1mTonxOSBaZkh2qGg0RGPSb8lvAf30r7T8jLmd/34Rql51x2ozJUCc3bDBUpdW8Dgr
         weZIuM6uFB2RUn0SwNEJJ4TyquU9LOYzs2N5vE6wi3cBvGxGocH5LAqnK4j5NF46dSAw
         Cx0g==
X-Forwarded-Encrypted: i=1; AJvYcCVnKaZ28THKH3nThXv2v0tAJ8rDHwvdyfmsFhjN3fxTS2PftSOVhxqNnDFoA/sQxBKusiEK6xYxIKGx5l+R0++6xXkG6+XfhKml2uu9FaJGzX8VrLgaz976PlycoBz26MAHkXueb1nozg==
X-Gm-Message-State: AOJu0YwLHbk9F3/Ffdlf6tN+sxJt1XfBUt3VtOqdWX3QptpyQKsXxXid
	x3GEtBrBJK1j43BbVJzPvMvA3VAHsbUgM1DEvXi9S8mILN7PEz3jf8lyfA==
X-Google-Smtp-Source: AGHT+IG/ZujxIH2LNQw66CFBbrvHSl0lK/dRB9AccVwO9ui5EgFWDEWE1uVDMfINMD02ngQ4M6Lk3A==
X-Received: by 2002:a05:600c:1c93:b0:426:5216:3247 with SMTP id 5b1f17b1804b1-428e6ae9f05mr71770275e9.6.1722839963358;
        Sun, 04 Aug 2024 23:39:23 -0700 (PDT)
Received: from standask-GA-A55M-S2HP (lu-nat-113-247.ehs.sk. [188.123.113.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428e6e9cd4esm122844085e9.44.2024.08.04.23.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 23:39:22 -0700 (PDT)
Date: Mon, 5 Aug 2024 08:39:21 +0200
From: Stanislav Jakubek <stano.jakubek@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Baolin Wang <baolin.wang7@gmail.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: rtc: sprd,sc2731-rtc: convert to YAML
Message-ID: <ZrBzmQI0IAL7LI3e@standask-GA-A55M-S2HP>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Convert the Spreadtrum SC2731 RTC bindings to DT schema.
Rename file to match compatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
---
Changes in V2:
  - add Krzystof's R-b
  - rebase on next-20240805

Link to V1: https://lore.kernel.org/lkml/ZolsyEC8eeJWNIb6@standask-GA-A55M-S2HP/

 .../bindings/rtc/sprd,sc2731-rtc.yaml         | 49 +++++++++++++++++++
 .../bindings/rtc/sprd,sc27xx-rtc.txt          | 26 ----------
 2 files changed, 49 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/sprd,sc2731-rtc.yaml
 delete mode 100644 Documentation/devicetree/bindings/rtc/sprd,sc27xx-rtc.txt

diff --git a/Documentation/devicetree/bindings/rtc/sprd,sc2731-rtc.yaml b/Documentation/devicetree/bindings/rtc/sprd,sc2731-rtc.yaml
new file mode 100644
index 000000000000..f3d20e976965
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/sprd,sc2731-rtc.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/sprd,sc2731-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Spreadtrum SC2731 Real Time Clock
+
+maintainers:
+  - Orson Zhai <orsonzhai@gmail.com>
+  - Baolin Wang <baolin.wang7@gmail.com>
+  - Chunyan Zhang <zhang.lyra@gmail.com>
+
+properties:
+  compatible:
+    const: sprd,sc2731-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+allOf:
+  - $ref: rtc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pmic {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      rtc@280 {
+        compatible = "sprd,sc2731-rtc";
+        reg = <0x280>;
+        interrupt-parent = <&sc2731_pmic>;
+        interrupts = <2 IRQ_TYPE_LEVEL_HIGH>;
+      };
+    };
+...
diff --git a/Documentation/devicetree/bindings/rtc/sprd,sc27xx-rtc.txt b/Documentation/devicetree/bindings/rtc/sprd,sc27xx-rtc.txt
deleted file mode 100644
index 1f5754299d31..000000000000
--- a/Documentation/devicetree/bindings/rtc/sprd,sc27xx-rtc.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-Spreadtrum SC27xx Real Time Clock
-
-Required properties:
-- compatible: should be "sprd,sc2731-rtc".
-- reg: address offset of rtc register.
-- interrupts: rtc alarm interrupt.
-
-Example:
-
-	sc2731_pmic: pmic@0 {
-		compatible = "sprd,sc2731";
-		reg = <0>;
-		spi-max-frequency = <26000000>;
-		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		rtc@280 {
-			compatible = "sprd,sc2731-rtc";
-			reg = <0x280>;
-			interrupt-parent = <&sc2731_pmic>;
-			interrupts = <2 IRQ_TYPE_LEVEL_HIGH>;
-		};
-	};
-- 
2.34.1


