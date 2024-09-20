Return-Path: <linux-rtc+bounces-2035-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BE597D012
	for <lists+linux-rtc@lfdr.de>; Fri, 20 Sep 2024 05:11:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 077D928490B
	for <lists+linux-rtc@lfdr.de>; Fri, 20 Sep 2024 03:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 393F718E3F;
	Fri, 20 Sep 2024 03:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GpCyFeT0"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0383A111AD;
	Fri, 20 Sep 2024 03:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726801859; cv=none; b=J0toYd+gXQ3Edd5Ukc0mjeqnK9Yopkztw6vL2PLjRJ2Y75ZaiBsFg2eN2Ii4LYK37+YAAxHRSGeE9XIT76P4L3A91EdDm0TYUypgMA9dZXiKVlHFKdydkewps8iPtT7W1Cr2NqQa0rk7eXaNkt42+7dCwL1UA16VkD87/kz9TYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726801859; c=relaxed/simple;
	bh=HJE0pA+74tCzliJNJXQ3Kg9jGHLW4xMEmX5HYgB7ZDs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c8vuH8bvxthvl6aOaApWmxPz8GF7v/ng1tDGzlUnkGmZqTI93C8n4mlJSNQLmLlpdG0lwBxZHaCeRGvBR+M9wp9/FFltx5jBCNhLpmy6BdfO+IB2Srke5K1fKxuV6IW+tUVCC50Xit1H+EPyURzruVMGZrlohUDKb0J+VnPGvhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GpCyFeT0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7C05CC4CEC4;
	Fri, 20 Sep 2024 03:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726801858;
	bh=HJE0pA+74tCzliJNJXQ3Kg9jGHLW4xMEmX5HYgB7ZDs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GpCyFeT0Njy25bxTaAj5qA0kdLg2zuRssqoet0Kmxa2+Y5eBBFB44pGhcwNEBedoM
	 8sXD4AvNNd6VQBfGXhC6UydZmjSxt0xGyZxUTKYK5vQN5EDK6dhM1OeGdckv41Tdey
	 xUeoN9JUzNhzqzaEDsBXh/zILgPveP/Xsi1OKLtBQKPvmK4tHbx78tayMHg3Uom20B
	 jSthFJadlyZsf7lbOOydkHExFaAv2VlpcDAfX+/b7bIEtJGuxr1k8xSZNZm2SAAuJ2
	 DK0hvJpwTktEHRViwbMgDTo0hOdaCGeTDgyiUEO+lBKy6HeJZ6SYEdZqAGEPUKJ4UB
	 mxC4naBJtSVzg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66F91CE8D58;
	Fri, 20 Sep 2024 03:10:58 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 20 Sep 2024 11:10:56 +0800
Subject: [PATCH v4 1/3] dt-bindings: rtc: Add Amlogic A4 and A5 RTC
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240920-rtc-v4-1-91ae5fb4e3d5@amlogic.com>
References: <20240920-rtc-v4-0-91ae5fb4e3d5@amlogic.com>
In-Reply-To: <20240920-rtc-v4-0-91ae5fb4e3d5@amlogic.com>
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726801856; l=2146;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=SnfWHSIVk7X6HuExSpIoFJO0hQjcCpxtc5dtKXQKyis=;
 b=QpFHhWsoRfcbLg2Negz2IytFhJILY4X90vPmFkKkmJ9D7HTUYRkBZWwoCMb3Z27IHK7ylIVvT
 TUcHcg0I1xXD1AlChDVtVOtIPPz+nEKpCTILcCOfaHshVEmDaOzwyXy
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



