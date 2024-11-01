Return-Path: <linux-rtc+bounces-2413-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C219B8910
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Nov 2024 03:07:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 451C61C20AF6
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Nov 2024 02:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9C2F13BC11;
	Fri,  1 Nov 2024 02:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nbI2aEUo"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CF213A416;
	Fri,  1 Nov 2024 02:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730426819; cv=none; b=S9+ZJVvbcnCNdlIGnPhE/uEo7ny2jpb2DlCwrXTZ7LZTqIYOMDzVH28UNZitp0YtTnMxQcQjZ/5yMJSYgbivGLkWgtfY6oi4QKU1E8hz1BuADQP2eUQZbBaVHkKqoqH/zNDgEqr5fqftoshXMOmkjkWYX+yr4JaMk8LF7AHY0YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730426819; c=relaxed/simple;
	bh=HJE0pA+74tCzliJNJXQ3Kg9jGHLW4xMEmX5HYgB7ZDs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uUUctEX7pcgnuaJTq1CRsoxgZWg/QjfZPUXRq1Zl3ATe4EFr7GjqNqBJvq7wSkrb8hFmYbnN2B1sj1Ej/Y43Y27doARcMPoN7+c+EKfpby4mVfdL3Z9BocTcELCjboFyDjkvBxnldT/y1AFe9R1ZnnZSmz6QN/IzDuW5gbidF6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nbI2aEUo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 341CEC4CED0;
	Fri,  1 Nov 2024 02:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730426819;
	bh=HJE0pA+74tCzliJNJXQ3Kg9jGHLW4xMEmX5HYgB7ZDs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nbI2aEUosBSJv3GlQshLPt85YkkeNb6SNij+jUZN4zIcFc36rd4IwBWSP9iE6CqaV
	 8gxSwp2DfY4PcbLVDboPyXk0OL5GU1BPX4hVymqJ7ISLk60p5STpPRkZH8Yhh65eUs
	 yvP3tAiqV3b4f8ACjd3uIBuCe64gU9w+qlIK6Ix67pvgwbEovX9q9do92oibplJdhM
	 xxiB0cB1QhkfV7QhaHDM8JE9TmLWimQIQOVHmrBhETZekJQKhkFoLMdXg+QnGD/jp5
	 6eeuRoJRJZQBlR1JntSQmto0oYBbhvoQpLUdNmJLfgG2G2YE44X6tXBHCB9K23p8xR
	 XmCiHvLoIeWyA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25872E67493;
	Fri,  1 Nov 2024 02:06:59 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 01 Nov 2024 10:06:47 +0800
Subject: [PATCH RESEND v4 1/3] dt-bindings: rtc: Add Amlogic A4 and A5 RTC
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-rtc-v4-1-14e1ed486ed8@amlogic.com>
References: <20241101-rtc-v4-0-14e1ed486ed8@amlogic.com>
In-Reply-To: <20241101-rtc-v4-0-14e1ed486ed8@amlogic.com>
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730426817; l=2146;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=SnfWHSIVk7X6HuExSpIoFJO0hQjcCpxtc5dtKXQKyis=;
 b=nXxB8Wus/Y3aWjqRDZOyufw/qV8rYOBKCa/et3kx8ABYVdS1/qy+g4AEeXysSnib0Bw+6uNsD
 yC/KmSjzereDN5hXVziUBrIgQLqTvvOnyF9Xh3YuyiU8XkUQQwxNq7I
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



