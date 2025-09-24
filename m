Return-Path: <linux-rtc+bounces-5021-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C294BB9C5B4
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Sep 2025 00:29:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7DE981785B7
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Sep 2025 22:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA0C229346F;
	Wed, 24 Sep 2025 22:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gR1WleYa"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895C0288537;
	Wed, 24 Sep 2025 22:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758752944; cv=none; b=cTdOCnnG/2P2J5TxwVVCoPwYT9sYFdGz7OJgpF+R1r4TdgMDfH/OcQ4a/vpsqQNySs//yM1IDD/GwWTCfmxseb5PEY+5ddT+bhhTmiUQIsBAyFDLUfmLB6iLIIksykSxx6U9WwBpvoT1jDpy55HsocI2ggjttTlWkiXMy1nf4U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758752944; c=relaxed/simple;
	bh=pOStskuDi/MjVer77gor4oUQ123eaaQS1w5P2rBDn64=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AwitwOzS/rmygODcMpV9SwygybWDT3qNk+nklG8IvcK+pan802TZD+67rckW5Nj4Fvm9j7ZOSsx7t1QgqhAtiJnE9XVhGwYjIYyrDFI4T+Jss3YI0qOuQrA8fajwC5MvT3g2l+AefEC/14pEj58m8yOIYQDGKWRi7kneOHP4qGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gR1WleYa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 440A9C4CEE7;
	Wed, 24 Sep 2025 22:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758752944;
	bh=pOStskuDi/MjVer77gor4oUQ123eaaQS1w5P2rBDn64=;
	h=From:To:Cc:Subject:Date:From;
	b=gR1WleYaqEt7eT2uXL8ThM7U7drxkZ+Db7AmpBoihB+YBj+0Vf8X5T3mNFuV9RI77
	 9CXfz6I4nXWYJbSg9L3svbglh3bx3bSSY0fskR4FJf5QDyD4Rk3Gtqrcr3U3V5scG7
	 TUKBvc90PnAGSZBRTGcJdyRLtwpJXft+dht+CPZ+NMG0AJFvHIIMGtHXW/6/TdKGlI
	 ZsgpE8VwvjveiwFGnRegAYg4F9OUCEhC7rJO4IX5PFi3/9+UjByCmV6i5nqgNfnjGX
	 EStXjWvC72WoQrW2Hf8o5fp/B+YBhgodqN0TO+vXAu045EiUgJtWV7BDZJexxXcOiz
	 A7zJXCL3TbJnA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Khuong Dinh <khuong@os.amperecomputing.com>
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: rtc: Convert apm,xgene-rtc to DT schema
Date: Wed, 24 Sep 2025 17:28:46 -0500
Message-ID: <20250924222848.2949235-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the APM XGene RTC binding to DT schema format. It's a
straight-forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/rtc/apm,xgene-rtc.yaml           | 45 +++++++++++++++++++
 .../devicetree/bindings/rtc/xgene-rtc.txt     | 28 ------------
 2 files changed, 45 insertions(+), 28 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/apm,xgene-rtc.yaml
 delete mode 100644 Documentation/devicetree/bindings/rtc/xgene-rtc.txt

diff --git a/Documentation/devicetree/bindings/rtc/apm,xgene-rtc.yaml b/Documentation/devicetree/bindings/rtc/apm,xgene-rtc.yaml
new file mode 100644
index 000000000000..b8f46536fd5a
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/apm,xgene-rtc.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/apm,xgene-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: APM X-Gene Real Time Clock
+
+maintainers:
+  - Khuong Dinh <khuong@os.amperecomputing.com>
+
+properties:
+  compatible:
+    const: apm,xgene-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - '#clock-cells'
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    rtc@10510000 {
+        compatible = "apm,xgene-rtc";
+        reg = <0x10510000 0x400>;
+        interrupts = <0x0 0x46 0x4>;
+        #clock-cells = <1>;
+        clocks = <&rtcclk 0>;
+    };
diff --git a/Documentation/devicetree/bindings/rtc/xgene-rtc.txt b/Documentation/devicetree/bindings/rtc/xgene-rtc.txt
deleted file mode 100644
index fd195c358446..000000000000
--- a/Documentation/devicetree/bindings/rtc/xgene-rtc.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-* APM X-Gene Real Time Clock
-
-RTC controller for the APM X-Gene Real Time Clock
-
-Required properties:
-- compatible : Should be "apm,xgene-rtc"
-- reg: physical base address of the controller and length of memory mapped
-  region.
-- interrupts: IRQ line for the RTC.
-- #clock-cells: Should be 1.
-- clocks: Reference to the clock entry.
-
-Example:
-
-rtcclk: rtcclk {
-	compatible = "fixed-clock";
-	#clock-cells = <1>;
-	clock-frequency = <100000000>;
-	clock-output-names = "rtcclk";
-};
-
-rtc: rtc@10510000 {
-	compatible = "apm,xgene-rtc";
-	reg = <0x0 0x10510000 0x0 0x400>;
-	interrupts = <0x0 0x46 0x4>;
-	#clock-cells = <1>;
-	clocks = <&rtcclk 0>;
-};
-- 
2.51.0


