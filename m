Return-Path: <linux-rtc+bounces-4672-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE03AB23386
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Aug 2025 20:29:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F3651B62095
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Aug 2025 18:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E50072FD1DC;
	Tue, 12 Aug 2025 18:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DZ7ogL+q"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB58C1EF38C;
	Tue, 12 Aug 2025 18:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755023129; cv=none; b=rIqvfnzgAnyFOy9/Mn6JfUV0r+dF6illpxzxVoAHb1Vze28LS6LUtbR74/i79xAZtwcmMky7k0UPc1T53E6B5b6bXhcrVDkbhb5EiSbCeMb2fqCmXlzLbt2e/8I+E+lfa0LHh40FFy24W6LIojgJg711rx/SgMMJnGE5mHLBwfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755023129; c=relaxed/simple;
	bh=dp8uCVb8LD0lYnS4gp/nmqX07iPx3Lp8CElZzc5oZ9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W6IOBh4jX8ziidDvkUAmqJjyrFxmoauXOGMM7WYzwQzXHluz2n8klRcKGPRsQLtUslO+pYmKJ3hyOeJoP5CpawPsW9cN2C85B4UqdgOZEmc7M1mjWt6uWWUNHmOhnMaChIOHEdAIZXKDfgbLtqMtyI9DQ6domskjk8izLEDlzLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DZ7ogL+q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 798D5C4CEF0;
	Tue, 12 Aug 2025 18:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755023129;
	bh=dp8uCVb8LD0lYnS4gp/nmqX07iPx3Lp8CElZzc5oZ9w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DZ7ogL+qgE00dLCMdHJEe+tUmi2xnlLw9iFhMilVpyw6QenSDCCMzRXsWQ9mOPqDg
	 piZ8FnQEOz3w4WkGtOHodhyFKynAfbbghB4CeaCfBngYKrUiJ9STmfSCBSoij5A7vI
	 jDq0B0iGDtWoVl1hriGB+BXFVWXiQL6NqnIgHV7RijZQipmHkPUdmLGx3weujXCXyR
	 a7Jb8FH6U6pOCzfDnaKSdnKFBA2jbqIQ9doilM3sH5BkG6y6bdiiYUFRKfEAxQGvHh
	 NX8b/k1rKvSc+/7XquExUS4lk8xp701ytWb2rDCJxPPrVozFT96ZmZl054/HxsUD/M
	 52RRJqW6nEV0A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AB0BCA0EDB;
	Tue, 12 Aug 2025 18:25:29 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Tue, 12 Aug 2025 18:25:15 +0000
Subject: [PATCH 1/3] dt-bindings: rtc: Add Apple SMC RTC
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-wip-smc-rtc-v1-1-66a8e96dad60@kernel.org>
References: <20250812-wip-smc-rtc-v1-0-66a8e96dad60@kernel.org>
In-Reply-To: <20250812-wip-smc-rtc-v1-0-66a8e96dad60@kernel.org>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, Sven Peter <sven@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3344; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=dp8uCVb8LD0lYnS4gp/nmqX07iPx3Lp8CElZzc5oZ9w=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ8bsduEX7/Z6lM9Yvq0o43917LSnIVejivfbfJKYYiL3I
 DHj2H3hjlIWBjEOBlkxRZbt++1Nnzx8I7h006X3MHNYmUCGMHBxCsBEfr5m+F922LHmQ1id1jnz
 NrO9PLN+27Wcc3OO+3byXuD98xt/cX5gZLihr9tVlH6LWe/itZ8H+MU2ZCzZoTvlrlWRXotlvpb
 re14A
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

Apple Silicon Macs (M1, etc.) have an RTC that is part of the PMU IC,
but most of the PMU functionality is abstracted out by the SMC.
An additional RTC offset stored inside NVMEM is required to compute
the current date/time.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 .../devicetree/bindings/mfd/apple,smc.yaml         |  9 ++++++
 .../devicetree/bindings/rtc/apple,smc-rtc.yaml     | 35 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 3 files changed, 45 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
index 8a10e270d421ecd703848f64af597de351fcfd74..38f077867bdeedba8a486a63e366e9c943a75681 100644
--- a/Documentation/devicetree/bindings/mfd/apple,smc.yaml
+++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
@@ -41,6 +41,9 @@ properties:
   reboot:
     $ref: /schemas/power/reset/apple,smc-reboot.yaml
 
+  rtc:
+    $ref: /schemas/rtc/apple,smc-rtc.yaml
+
 additionalProperties: false
 
 required:
@@ -75,5 +78,11 @@ examples:
           nvmem-cell-names = "shutdown_flag", "boot_stage",
                              "boot_error_count", "panic_count";
         };
+
+        rtc {
+          compatible = "apple,smc-rtc";
+          nvmem-cells = <&rtc_offset>;
+          nvmem-cell-names = "rtc_offset";
+       };
       };
     };
diff --git a/Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml b/Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..607b610665a28b3ea2e86bd90cb5f3f28ebac726
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/apple,smc-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple SMC RTC
+
+description:
+  Apple Silicon Macs (M1, etc.) have an RTC that is part of the PMU IC,
+  but most of the PMU functionality is abstracted out by the SMC.
+  An additional RTC offset stored inside NVMEM is required to compute
+  the current date/time.
+
+maintainers:
+  - Sven Peter <sven@kernel.org>
+
+properties:
+  compatible:
+    const: apple,smc-rtc
+
+  nvmem-cells:
+    items:
+      - description: 48bit RTC offset, specified in 32768 (2^15) Hz clock ticks
+
+  nvmem-cell-names:
+    items:
+      - const: rtc_offset
+
+required:
+  - compatible
+  - nvmem-cells
+  - nvmem-cell-names
+
+additionalProperties: false
diff --git a/MAINTAINERS b/MAINTAINERS
index fe168477caa45799dfe07de2f54de6d6a1ce0615..aaef8634985b35f54de1123ebb4176602066d177 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2397,6 +2397,7 @@ F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 F:	Documentation/devicetree/bindings/power/apple*
 F:	Documentation/devicetree/bindings/power/reset/apple,smc-reboot.yaml
 F:	Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
+F:	Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml
 F:	Documentation/devicetree/bindings/spi/apple,spi.yaml
 F:	Documentation/devicetree/bindings/spmi/apple,spmi.yaml
 F:	Documentation/devicetree/bindings/watchdog/apple,wdt.yaml

-- 
2.34.1



