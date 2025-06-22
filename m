Return-Path: <linux-rtc+bounces-4327-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F7DAE2E2D
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Jun 2025 05:30:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D416617490B
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Jun 2025 03:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27A87155322;
	Sun, 22 Jun 2025 03:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="dK8umRRx"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E23E136352
	for <linux-rtc@vger.kernel.org>; Sun, 22 Jun 2025 03:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750562991; cv=none; b=N3/FDWwdFY80cqPxohGXg6+0Hyl4AYQ6jMs1HUOKGP2DYL3lc/Pvskb84YAiL+Jg9hun3Ub3h44Dy5Goo/cnPrBx78SHV17RMDhJveyxoDawogg2T8TnuKL4tmm5NzamTjxDl1Jq7z5gfhwu8cdzXT11kkM3wiahVmzzfMTyC4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750562991; c=relaxed/simple;
	bh=hMn6z2AZyzcbL/cGMK7HwRD4mhVABvJkOEyvUbzSheE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=szCygMgvXeaTVUKNJLKNNNeZEbyY1M+ltNtL/IsMZ3SaYhtpI5nr0NyUaF8q4dKb1EiKBDnPPlLtLNEdwPSKDhSk1rvxA6r9ONHotRWhwxnio407oDq4NZkCyU+mXTmukAzei9iUHgGJuB5zrnre+64B5JHdnpRHSr3plK17974=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=dK8umRRx; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7d3f1bd7121so302769585a.3
        for <linux-rtc@vger.kernel.org>; Sat, 21 Jun 2025 20:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750562987; x=1751167787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=onUZmipuuggYzLIHkuYvhE+eJtHfnxxJxJfL7IX4aE0=;
        b=dK8umRRxtzwfWzRRoaiIREkAsUWFKFFf7sIlWt9G5RUzLpTyME7FZPb3jMS7BcGGTD
         E1XhcgR198DjSEZT0wPMUR2QIxGjLcmyzk37RGkFseKK9JIkLS3m3wNTMLfg9wXlyuVN
         ZJSvATQi+aOhMtHCsrSecoYZ057JGLz+RgeSUYJaJNBpIneKQg2Z5cI3ja/i67rje/cu
         GRO22twOMhezBYOiowPy3HI2Ow0ZBp03pI9KjlnT4u78Wp2uRjtZyskMZEYyCvi0nTnJ
         p7IkCzQtp/drBpd7RlH2Oi2OaT9szy83aQ/6S9OAKkc594YSvqS6TVhgj8YboRtZ8BMC
         krSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750562987; x=1751167787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=onUZmipuuggYzLIHkuYvhE+eJtHfnxxJxJfL7IX4aE0=;
        b=ExqFqyjaAu6MoqRd9xF2HmhNJzibYf1Dco0cSyPTDTCNMqwB65qG4SZ62gg6o2fWVg
         lKU36NgJWG5oChkJA58vnzi7rEVhiOj8tS07M+TOlCLHCCMFgCHFlwW9BZBjnmuPed3b
         oFJ9ziaGbIY3CVM9X+lTgIvgbNMuTAOHzvzS0qtoqiStGGtPcswRuVRtNDI0jAEEyr5E
         NexEl2PwoAwxcNC4sfxomYcs3c+VOLG+96cxusKBj/uIHomMMWmT2HnIdBxdGTvn2tPl
         VzTbzUbIHzFr0LG9CuNlmaaSmmxNh2QIXn9IAUveKrBzOiKgkq0qWCYOIZEiwWJjhaVI
         RyhA==
X-Forwarded-Encrypted: i=1; AJvYcCWpTS0Va1lfLg80/Ex3O3WEv18kbi19eE4EAQ4t9I+5+1jtGjN7ED2YIFOXZdVslQNiSbrReYuef3U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFQpA4UJbWKgC6vasFagB3Zb19lizc+606r9AqQMyg52tnYnp7
	4+CaFCFJqvZun6Mfdy1XkdkBcOQcoO1PmWjMPgVpc6XRp4GejAhvh83i0KIjzpkjiXg=
X-Gm-Gg: ASbGncuIM6Fip9FGjABarToqFtIqmVlCovY2olUOpypagZ80Hpkcb/co5MLVHk+dkpK
	eAL1T1CVCodqVKtvQiI6FIyJMLmlDDHWP18wORZbZgnDu6m6rRKENJIVKaPL/v4ZtDbOgU8l/kq
	TS/OPcpKpkOv+t+hyz6GPyR+2QEBMdzaCsQZKUsPdyDDHxz2i00/iudk5wrqb6MbfOTpkYwWIDi
	y3bk2oX+xeyTQrbW457TDA7fuQ1ZHgUHExOdyzlZLEfwsuUMZnrpmmsa+JTfnxcGIRQMsi3D/Z9
	HGxcZhzzOzUiltJ6D5EN1wVP6RyBAWlrny2sH/Ty5kbK42I68qJ063Z2yXHBclu3sWJAz4L5xku
	u93/4ZU5WuH58+TUz61XUItqoC8vhwxBuD+M=
X-Google-Smtp-Source: AGHT+IGgC0s5tLXnKubHAjilc/vdE9TsS2rxF7dNnxQoxPszakpBCgqiPMG6aQ5v+WXvEF2OTx3kZA==
X-Received: by 2002:a05:620a:3726:b0:7c3:d7ef:f7f5 with SMTP id af79cd13be357-7d3f98e8ce4mr1234323785a.18.1750562987233;
        Sat, 21 Jun 2025 20:29:47 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd0945183dsm30014526d6.44.2025.06.21.20.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 20:29:46 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	alexandre.belloni@bootlin.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	wangruikang@iscas.ac.cn,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-rtc@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 1/7] dt-bindings: mfd: add support the SpacemiT P1 PMIC
Date: Sat, 21 Jun 2025 22:29:33 -0500
Message-ID: <20250622032941.3768912-2-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250622032941.3768912-1-elder@riscstar.com>
References: <20250622032941.3768912-1-elder@riscstar.com>
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
2.45.2


