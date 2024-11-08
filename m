Return-Path: <linux-rtc+bounces-2474-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4087F9C1637
	for <lists+linux-rtc@lfdr.de>; Fri,  8 Nov 2024 06:54:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6484E1C224EB
	for <lists+linux-rtc@lfdr.de>; Fri,  8 Nov 2024 05:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C789E1CFED1;
	Fri,  8 Nov 2024 05:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FH1CyNy6"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9103F1CF293;
	Fri,  8 Nov 2024 05:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731045290; cv=none; b=NWfMNAoU7nIwLCP1Uv8a4lKkEB1BA0euEexDBR2UywlYLMZrAQRxJGe4ccCvQzZGm0ULD+CWd89ekgI9otxrpBmiAnq4xJ4EXi7fndWBri4vDKCpMj5n/iUUvf8Ggct3Dd+zWcSPV5VkIQS4yKCtKph2Nz9xzlAwKJZB9vjlNW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731045290; c=relaxed/simple;
	bh=HJE0pA+74tCzliJNJXQ3Kg9jGHLW4xMEmX5HYgB7ZDs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Knsh7GD2TxODFt3ISCKsGozufdnL2nKzvJvh/ndEol05sTgmdTF0Q808tzdz+pY1J/9JgCb8jVj2RRCRU2l+iYZvz7DXy9nXkgg7vKtXIXy9l7XKOm8mIzMGb+YZn35UKq3ksrqZZEeFLO35jn3h5AJgZElkkeZkPVr2NM1J2B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FH1CyNy6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 17B40C4CED0;
	Fri,  8 Nov 2024 05:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731045290;
	bh=HJE0pA+74tCzliJNJXQ3Kg9jGHLW4xMEmX5HYgB7ZDs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FH1CyNy6+oSMCp4UOvd7VFGlx1KI0R+Wk/Mqo+xEgXrNwAkz1emwPxg0wWqn2KmzK
	 rcslwDzvK+DkI/3uj7wRwN/e6F6c1HLXYRgRgvY+0F+DjFz8EK4RXNHpuITVf74VI8
	 MxxGnlPhT3tqC0apACAL/p1IBSVGUbWUxF63V9HeUxaVZETmpWz4TJc0BC3E4/Z1e3
	 rARoP0P4ClExve+wKWNSW2kv081KQux9vVIHClEWl2CDNd0R26q5zLbkJFxbkoHN/d
	 Be87x6iBbQ/hlNkikCrh5jKwe6O+GNsePjbPFor7RgNPtn/Ua4KbPr1okSKUJGeZ4q
	 JnalI64EZsNCg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 079A0D5E134;
	Fri,  8 Nov 2024 05:54:50 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 08 Nov 2024 13:54:41 +0800
Subject: [PATCH v5 1/3] dt-bindings: rtc: Add Amlogic A4 and A5 RTC
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-rtc-v5-1-0194727c778b@amlogic.com>
References: <20241108-rtc-v5-0-0194727c778b@amlogic.com>
In-Reply-To: <20241108-rtc-v5-0-0194727c778b@amlogic.com>
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731045288; l=2146;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=SnfWHSIVk7X6HuExSpIoFJO0hQjcCpxtc5dtKXQKyis=;
 b=Q3892j42P21hB6EVcwdsGEr7eXmMcm8B7queUI3trZjJlX45iLaJOla/ummE+cV031mLJvHU+
 hUmZxgIURvzBl+8ln3Jf+15w92/71nCbmmUkrAoEVb0FHcoV4734Pjp
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Yiting Deng <yiting.deng@amlogic.com>

Add documentation describing the Amlogic A4(A113L2) and A5(A113X2) RTC.

Signed-off-by: Yiting Deng <yiting.deng@amlogic.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../devicetree/bindings/rtc/amlogic,a4-rtc.yaml    | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/amlogic,a4-rtc.yaml b/Documentation/devicetree/bindings/rtc/amlogic,a4-rtc.yaml
new file mode 100644
index 000000000000..5d3ac737abcb
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
+  - clocks
+  - clock-names
+  - interrupts
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
+            clocks = <&xtal_32k>, <&clkc_periphs 1>;
+            clock-names = "osc", "sys";
+            interrupts = <GIC_SPI 131 IRQ_TYPE_EDGE_RISING>;
+        };
+    };

-- 
2.37.1



