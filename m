Return-Path: <linux-rtc+bounces-1833-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A69E96947B
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Sep 2024 09:02:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A50C0B23444
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Sep 2024 07:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9279D200109;
	Tue,  3 Sep 2024 07:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SZdE1RcB"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A381D6196;
	Tue,  3 Sep 2024 07:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725346847; cv=none; b=J6luc9VqBEGfLdSAbLFDIhXiEYgO7KhuVJej3ZYV6R9LyN0YlzwSLMN43krPX1NySXjhewsaMNdsW0sgpC41x/qLM6xI2oXqo9nMuX+p8wapO+O3wD/Kby/t/kfqRxyxQ8BE+aYrqIi6n8uqPu/Gq0bIdEydsD67gGZe48Cf/ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725346847; c=relaxed/simple;
	bh=9lC0b/hC6Itnw/Lz1IKa8Nfwz/BjMlUk+OvIfGmqruQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hC8jG/k2LVx02o7DQnKUIR0R0/94hGW/zI4F6k3incbUSu9e84fKOBZuJBTCvuk4c7QgTR+OX1zkBOrYw0drKezz0Ym6TslT+nRKxGbNoBlASb2owDXLo4UCCoP+j32AkpFBZ3x0dBYiP7xxy0cgU5c9a5EttuoZIonVr8k5Zn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SZdE1RcB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 087B5C4CEC6;
	Tue,  3 Sep 2024 07:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725346847;
	bh=9lC0b/hC6Itnw/Lz1IKa8Nfwz/BjMlUk+OvIfGmqruQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SZdE1RcBQ+eamILjh1zF49paf8hKKzY0kADnAub8DzDMVoX8m+d3tiKjII/dNmyei
	 RLcD66nOBbOyUwmxbrlNvQ+N0kLeJEpTotTSv69rDJ2jKJte82xc7lBJy/a5/TR2P2
	 IFY9QDfcXdYpnikEvhnaxcTPdbblTi0cW3VA2CGxAQ7YacTEJOX9S3PeGdV99rWyOb
	 9FPY8DmwYt3qoTfnTW8jGhTaW6CBzj9mMrne3htgh7Xqbic+X5iyfWdII5wacw/A0w
	 fHd3lhgEiX5jaVjGKYuLIOnevU35bokvc8LdkQR0CzESaXRozCQBCaxSQ67mEqDrg0
	 sW3i8wra6rqeg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E909DCD342E;
	Tue,  3 Sep 2024 07:00:46 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 03 Sep 2024 15:00:45 +0800
Subject: [PATCH v2 1/3] dt-bindings: rtc: Add Amlogic A4 and A5 rtc
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-rtc-v2-1-05da5755b8d9@amlogic.com>
References: <20240903-rtc-v2-0-05da5755b8d9@amlogic.com>
In-Reply-To: <20240903-rtc-v2-0-05da5755b8d9@amlogic.com>
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725346845; l=2215;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=6EOnWaPKquIIloeXnJxYL8qcuh/homZJSOyDiv+sQAI=;
 b=c5sxbiBQLtdl3PtkTuITSGLV8md0Cj2hMnZUzjO5fG4hot1b0Q2H7lO+bTCW8iB88qbs3PoSN
 8YlvLQKBrwVDjIGNmtDLpj1/58DMflSjiLEcIUXb9cRXDGvHyXR9W6f
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Yiting Deng <yiting.deng@amlogic.com>

Add documentation describing the Amlogic A4(A113L2) and A5(A113X2)
rtc controller.

Signed-off-by: Yiting Deng <yiting.deng@amlogic.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../bindings/rtc/amlogic,amlogic-rtc.yaml          | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/amlogic,amlogic-rtc.yaml b/Documentation/devicetree/bindings/rtc/amlogic,amlogic-rtc.yaml
new file mode 100644
index 000000000000..128c60b623e1
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



