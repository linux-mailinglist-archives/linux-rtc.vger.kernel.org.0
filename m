Return-Path: <linux-rtc+bounces-1914-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F1F973233
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Sep 2024 12:20:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 14B67B2AB28
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Sep 2024 10:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B780818C34B;
	Tue, 10 Sep 2024 10:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RPxe5kjF"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5F8144D1A;
	Tue, 10 Sep 2024 10:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725963260; cv=none; b=rPYoCNHljFr7Le/dgBhmbUhnKOs/vUn8Q3RTT3ILNUQsM3WcYvOmpNYAizsKOSbCp5hPwcp4bMu8yBR4Imh0t/bwUZhM1HAlxq06iawJB2WlxGlbJvYKPGfrgFGx/2I0pm1YHePYOw4RcWEWVSzYTyFerGsGCQbI4CkPr5QtxwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725963260; c=relaxed/simple;
	bh=KDsv3s5S2knS4s9lv8drKPwrJUJ8cTMP0GELKtXUN7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FhU6kAzw4sWUHHtXu369yieXp+clPSFfkxDQyYLsUZuxSNYrGhtBu8DOsEYqFiJpVuMwLAMYGEOJJ2EScK0y2gIhCAXoYq7p50E8ZfpCJ4wXTWurdyovYdP2+FUb6svRlIp3RnEsIVAGJ76T46sX3/e2Ydt6dTiVaPkHdFAHFoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RPxe5kjF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6ADDFC4CEC3;
	Tue, 10 Sep 2024 10:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725963260;
	bh=KDsv3s5S2knS4s9lv8drKPwrJUJ8cTMP0GELKtXUN7U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RPxe5kjFUoTcryIcIed+HVxDZ0RPRA4FQkW5camA4tc+fFnXN+em2/qrCWw8y2T3L
	 NlF5d9//sxB/jiDrcf/P0UEBMiR7behXr3r+5k0wP3ig9y5ECYDh+F+Xyn/TtTm3p/
	 5Rx5frmI/vO7E+DOgtQokNsn1LG3sEdOHumBpXKYSt/hars/cnr8Kj1bSGsaWhPj+X
	 TNKvyBnCxN02UlQIel+vSGD9E5Xw4/ti3ElpJJyRVkmY/JDyEDNr2bHi8Qn0cjzNtv
	 udK06wDqslxJ6U7rmMFr7xvARBeJU67mqpn+/26xIT+FYZOHxYkzAJUD4XIyRSbcd+
	 1VnR2i3G716uw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ADAAECE58D;
	Tue, 10 Sep 2024 10:14:20 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 10 Sep 2024 18:14:18 +0800
Subject: [PATCH v3 1/3] dt-bindings: rtc: Add Amlogic A4 and A5 RTC
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240910-rtc-v3-1-1fa077a69a20@amlogic.com>
References: <20240910-rtc-v3-0-1fa077a69a20@amlogic.com>
In-Reply-To: <20240910-rtc-v3-0-1fa077a69a20@amlogic.com>
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725963258; l=2094;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=RJlEl+9x/wxXWC6SJOp6Ssaq+XIiQ49flcxO3prFEIo=;
 b=lqlH6lI6Mbaz8YpxYz0TvJYx6HNMDygTItWswCe2gH4ekIPI9APVWGUrxlgDcFj2lr+EWy8WV
 ZTtRGI+e0jcD6hektMsVUGKIXJRU9RwY0rVIX3/vSUQEUVyHcpFOqJ5
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Yiting Deng <yiting.deng@amlogic.com>

Add documentation describing the Amlogic A4(A113L2) and A5(A113X2) RTC.

Signed-off-by: Yiting Deng <yiting.deng@amlogic.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../devicetree/bindings/rtc/amlogic,a4-rtc.yaml    | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/amlogic,a4-rtc.yaml b/Documentation/devicetree/bindings/rtc/amlogic,a4-rtc.yaml
new file mode 100644
index 000000000000..eee994753a12
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/amlogic,a4-rtc.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2024 Amlogic, Inc. All rights reserved
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/amlogic,a4-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic A4 and A5 RTC
+
+maintainers:
+  - Yiting Deng <yiting.deng@amlogic.com>
+  - Xianwei Zhao <xianwei.zhao@amlogic.com>
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    enum:
+      - amlogic,a4-rtc
+      - amlogic,a5-rtc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: RTC clock source, available 24M or 32K crystal
+          oscillator source. when using 24M, need to divide 24M into 32K.
+      - description: RTC module accesses the clock of the apb bus.
+
+  clock-names:
+    items:
+      - const: osc
+      - const: sys
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    apb {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        rtc@8e600 {
+            compatible = "amlogic,a4-rtc";
+            reg = <0x0 0x8e600 0x0 0x38>;
+            interrupts = <GIC_SPI 131 IRQ_TYPE_EDGE_RISING>;
+            clocks = <&xtal_32k>, <&clkc_periphs 1>;
+            clock-names = "osc", "sys";
+        };
+    };

-- 
2.37.1



