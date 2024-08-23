Return-Path: <linux-rtc+bounces-1708-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DDA95C90F
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2024 11:19:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A76B1C2325B
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2024 09:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E840014B082;
	Fri, 23 Aug 2024 09:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="agGWn2aO"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9079145B05;
	Fri, 23 Aug 2024 09:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724404787; cv=none; b=X/us9+LlhorhymXPFgRhDKZ14ERWDGZc3Oj0SZ5pktXAo1LYX9eQMFoXrsBz31tIPIGZhTesZfARSqjx0YgvOUqHNfhDR5iOOr6GTjCyw9KEb/IMAilTAf+vAwkArZ0EdterIoduWHoV1QLyIB7K6hKn6aglZA4t5Ui3lnDAF14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724404787; c=relaxed/simple;
	bh=4tFRUr6pC6/XXpYh11KENxGWfRrFHffWmB1w9kduv2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HLjqcMXTR5HzTGIf82poG3DjBB9EtbIpQSMRLT0PIr+Pg+yOolDa8r3G5faRlyBWujZ9L6HqdWfT6tZCXMJmok4mQCNTkB3pDZNAPKIcZzItgoAEfe6f+0k4vqWwIiCOVaQ2Wo/UEbtZen/vaQ76EOnoR9HN7STcvwikvv7D8A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=agGWn2aO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54287C4AF0B;
	Fri, 23 Aug 2024 09:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724404787;
	bh=4tFRUr6pC6/XXpYh11KENxGWfRrFHffWmB1w9kduv2k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=agGWn2aOlO3V1Yc/uSYbaee0W82ReHFO7fXfzpsiQYex2jkOCotR3W5sRKhJPeQ7w
	 vG301xgNgm3RVAS9IaDoVnK+0TPG5gxl2dAvczC2Sbt+OI8vygA4aBIDCIJrGF8KWC
	 +MNHarTgljIOkH3+tetALV26MMoNLcp1Mz/dUAfnbABMQaTtH37cYFTZrprLDNsTya
	 XZuaKUzmb3tYmKdVPGBSS2HocvBNKykuUWYztUGodPwJ4WNbcYiiPkfJxzCemc98qk
	 hyIwUUI2yPpgoT7MbAedlJKimmvDwD/dkOonMZpygHHYQaio3WlGdAdU3N6pvcnzf+
	 wR2TKCte9PDFA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 440E3C52D7C;
	Fri, 23 Aug 2024 09:19:47 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 23 Aug 2024 17:19:44 +0800
Subject: [PATCH 1/3] dt-bindings: rtc: Add Amlogic A311L2 and A113X2 rtc
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-rtc-v1-1-6f70381da283@amlogic.com>
References: <20240823-rtc-v1-0-6f70381da283@amlogic.com>
In-Reply-To: <20240823-rtc-v1-0-6f70381da283@amlogic.com>
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724404784; l=2235;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=OuCbmduzBkZkzatxp6faWcdgmpE7uNtqHqmhQseAr7Q=;
 b=dISvZXk6kBMEY4QicOnnOG4EnavSgL5tgiaHxWNMtJlC1IK0M9ZC0Mk+6UrV4a7/RyGGtpizi
 z4qtwKvsNUkAOFXsKzzFCrFp6FYHRWi5RFa1J56cuPfkpYnyDwPdSfZ
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Yiting Deng <yiting.deng@amlogic.com>

Add documentation describing the Amlogic A113L2 and A113X2 rtc controller.

Signed-off-by: Yiting Deng <yiting.deng@amlogic.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../bindings/rtc/amlogic,amlogic-rtc.yaml          | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/amlogic,amlogic-rtc.yaml b/Documentation/devicetree/bindings/rtc/amlogic,amlogic-rtc.yaml
new file mode 100644
index 000000000000..fa3d7838022e
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/amlogic,amlogic-rtc.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2024 Amlogic, Inc. All rights reserved
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/amlogic,amlogic-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Real Time Clock controller include a4, a5
+
+maintainers:
+  - Yiting Deng <yiting.deng@amlogic.com>
+  - Xianwei Zhao <xianwei.zhao@amlogic.com>
+
+description:
+  The Amlogic new chips used RTC module.
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
+      - const: rtc_osc
+      - const: rtc_sys_clk
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - interrupts
+  - reg
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
+        rtc: rtc@8e600 {
+            compatible = "amlogic,a4-rtc";
+            interrupts = <GIC_SPI 131 IRQ_TYPE_EDGE_RISING>;
+            reg = <0x0 0x8e600 0x0 0x38>;
+            clocks = <&xtal_32k>, <&clkc_periphs 1>;
+            clock-names = "rtc_osc", "rtc_sys_clk";
+        };
+    };

-- 
2.37.1



