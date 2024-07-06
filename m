Return-Path: <linux-rtc+bounces-1448-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F219294B5
	for <lists+linux-rtc@lfdr.de>; Sat,  6 Jul 2024 18:12:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEF201F22C9B
	for <lists+linux-rtc@lfdr.de>; Sat,  6 Jul 2024 16:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AC7613AD29;
	Sat,  6 Jul 2024 16:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZlEYqkc"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD8D6A357;
	Sat,  6 Jul 2024 16:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720282318; cv=none; b=F2am5vpgaygLT+47aimfwO4kpRo6wkoLuliB+3KiPY1bFQvzVc8kTBKiWfPumBWYujutU9oCnzeg5WDESzaJYLiFb53lFijvOf0lt4Ygre9avSn2QSRv4KSDM355CExEgTC4R0Cfi26X9L0oC3hWBh1wsddDFzhCqyO6WHKuEZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720282318; c=relaxed/simple;
	bh=hx7hu1VppO7Lceczk4LBvMp0grQA3KyUAjS2JOTWiHA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D2K6YAT0GocMyNnbQnbwmEnuh0qdaFSDut0fViUWIdnLwDWZBZb+BTV8AKuZ/gjx6lyXQ1UxF4yA+HJRDgMGB17pFExdZDOaTPbyuoE98F8jswy2jJKXyuzprWBDCLeGYaE2I1KUW6AHd/moO23K3oIKvcUEk1FUpiEaDTU0kWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gZlEYqkc; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42641dec7c3so15905875e9.0;
        Sat, 06 Jul 2024 09:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720282315; x=1720887115; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BTB8Xon6KPoe3db5OQQTjTGvBHSB1yuS1b9hsPygqLE=;
        b=gZlEYqkcYrpvphzL369WxBi7PuPiAudY5lTNaiok9I5xtdyTdUUUrOYJsNRPai1Iuq
         d3GxJbqoL50vaGq6TmtbaF51vLb2DraqiQdiwdwFnhSCs0GqY7WT1i0bV8dXwXQ0Gg6d
         +xPIeOBg6LmKGYQYQyerNxiWJYKGimAcup3iPeNMyqyU1RAzpkD7WED/u5tb1vGzKjeL
         F3gb9JsE+ZJ3zZqGKOI2w8Pmdz3a0X1t0WZmhP194jBVje4vq+thdbDuEMcfUKzv8Jnt
         yROtQt/WEYH2MNwVW1SsBc7ZTSeXqlSOxlhan9xzLHDbxQNDWqetEOPi/cEQi8EN49aT
         2yAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720282315; x=1720887115;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BTB8Xon6KPoe3db5OQQTjTGvBHSB1yuS1b9hsPygqLE=;
        b=BqBVDTdu4ig7JwVfNehCtTdOFXY+MGUFlcVlUfHYnpdW/KMf8hBnAAme3i4DNu+fjV
         3yJrGY6r3K0JIi0SCD2XpoPRT+IiDlhe/JA0TBEJ159PjD+QQntOfxsDfvAR4LOHOlDj
         nHgs/eQT9a2KgLQU90eG1k9/xdyBynH9pmb2KVlxOPmtXiv7zFxnODQ9gTYBic3rVR4x
         96rN8Ja19qHiN+/euECr1VyQyasvG9jBVdYD2D0mAIqvM4bRAzIDWWWLyvERVNZdyf5y
         TErjEHjmulfCQSbJl3QXAJnFQVdMUTKCU5LBL97a9j8lh4c9l4zg6TSIPJ1/t7QMv8f4
         T8lA==
X-Forwarded-Encrypted: i=1; AJvYcCVISFRjaRehszfpqFFKNbKoLDaPBErvr3q1SEFSnF3Fbq2tpfCzzddUxUe1gRlBRZRdCt2fXOHwhp7IJrXWoRWZpES9RYw2hhdoxVTOcjBjQH9u/1GWtC9PH8zh7swWqTNv+9646D2/Dw==
X-Gm-Message-State: AOJu0Yy3zpYECLPM4N92QNB4N8EyGpIKD+yG2xbM1fFo9ukMJXek4r1A
	59lJgMEDlUBhGWf8bQ7iUGIZ8AEXTVL0J8h7qaM/DBJ4qVEJP2H9
X-Google-Smtp-Source: AGHT+IE8na9QX/RTxi1AT0cEX8PHZn2T/lH8IJzOK6lmzb1OjJrAo99AnmrH8u/7T4uTpxPsTi1ZfA==
X-Received: by 2002:a5d:658e:0:b0:367:880f:5d4e with SMTP id ffacd0b85a97d-3679dd34ca9mr5207671f8f.39.1720282314870;
        Sat, 06 Jul 2024 09:11:54 -0700 (PDT)
Received: from standask-GA-A55M-S2HP (lu-nat-113-247.ehs.sk. [188.123.113.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a043a16sm23911430f8f.0.2024.07.06.09.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 09:11:54 -0700 (PDT)
Date: Sat, 6 Jul 2024 18:11:52 +0200
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
Subject: [PATCH] dt-bindings: rtc: sprd,sc2731-rtc: convert to YAML
Message-ID: <ZolsyEC8eeJWNIb6@standask-GA-A55M-S2HP>
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

Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
---
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


