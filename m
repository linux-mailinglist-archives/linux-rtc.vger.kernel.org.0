Return-Path: <linux-rtc+bounces-776-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A0C8711DE
	for <lists+linux-rtc@lfdr.de>; Tue,  5 Mar 2024 01:42:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3635283196
	for <lists+linux-rtc@lfdr.de>; Tue,  5 Mar 2024 00:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9689A63A5;
	Tue,  5 Mar 2024 00:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GgQquOTK"
X-Original-To: linux-rtc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31BE6110;
	Tue,  5 Mar 2024 00:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709599349; cv=none; b=VUqy6t+elninzs+LkTPq0a8XnA5/BUjubcDatc2K04eVzaL+TDLj/KRN3Y4cooDKApRLrk3K5dxlBQvQpBU0HFS30hx/yFuAzTNGZH9zJMQwbvsQjaiXZja5SDhRiFlMSBaF/v7MRm5Pg6fLcfiQD2xG6rX1vd8z2O3S94/x1j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709599349; c=relaxed/simple;
	bh=Rzwylfxb+NGWeodzRsbXv+dmdDIWpxb4CFfQrBk3xTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PLMzsEcH7WCCYKPPxObeABaSvDG3FNGDrr9v8Mh+DSzl2jzxOIATrcsTUcUZwXaIQgBZQAyO0z5wv8llcRMeGMCsKHKvsIQSe0FbfyAf7XEvJKiFI2VEsZo++FOOGEUjCPANCQH34Am5bLbJqJ+/nAjBWPTf7za6xT704E80U8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GgQquOTK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DE2AE182D;
	Tue,  5 Mar 2024 01:42:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1709599328;
	bh=Rzwylfxb+NGWeodzRsbXv+dmdDIWpxb4CFfQrBk3xTw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GgQquOTKtuQ5EImGF3su/o+k8bQbimNbNi5SMpk5nHqlAEQWvv0PviEt4+zoP2TGW
	 gZkU9mhHGGXhV2fWs1c3F3BgCVMrQUn9XQ9LS4bOoomGJuhVP/ckfPzeg+TB5ik7K/
	 C0ke9CHTcBLI1hJshVdd/LbbQLV68+uB1uh9NFoo=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: devicetree@vger.kernel.org,
	linux-rtc@vger.kernel.org
Cc: Valentin Raevsky <valentin@compulab.co.il>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Marek Vasut <marex@denx.de>,
	Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH 2/4] dt-bindings: rtc: abx80x: Convert text bindings to YAML
Date: Tue,  5 Mar 2024 02:42:19 +0200
Message-ID: <20240305004222.622-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240305004222.622-1-laurent.pinchart@ideasonboard.com>
References: <20240305004222.622-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the abx80x DT bindings to YAML schema. The existing properties
are kept without modification, and the interrupt property is added as it
is supported by the driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
If someone wants to volunteer as a maintainer, by all means, please fee
to replace me :-)
---
 .../bindings/rtc/abracon,abx80x.txt           | 31 -------
 .../bindings/rtc/abracon,abx80x.yaml          | 89 +++++++++++++++++++
 2 files changed, 89 insertions(+), 31 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/abracon,abx80x.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/abracon,abx80x.yaml

diff --git a/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt b/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt
deleted file mode 100644
index 2405e35a1bc0..000000000000
--- a/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt
+++ /dev/null
@@ -1,31 +0,0 @@
-Abracon ABX80X I2C ultra low power RTC/Alarm chip
-
-The Abracon ABX80X family consist of the ab0801, ab0803, ab0804, ab0805, ab1801,
-ab1803, ab1804 and ab1805. The ab0805 is the superset of ab080x and the ab1805
-is the superset of ab180x.
-
-Required properties:
-
- - "compatible": should one of:
-        "abracon,abx80x"
-        "abracon,ab0801"
-        "abracon,ab0803"
-        "abracon,ab0804"
-        "abracon,ab0805"
-        "abracon,ab1801"
-        "abracon,ab1803"
-        "abracon,ab1804"
-        "abracon,ab1805"
-        "microcrystal,rv1805"
-	Using "abracon,abx80x" will enable chip autodetection.
- - "reg": I2C bus address of the device
-
-Optional properties:
-
-The abx804 and abx805 have a trickle charger that is able to charge the
-connected battery or supercap. Both the following properties have to be defined
-and valid to enable charging:
-
- - "abracon,tc-diode": should be "standard" (0.6V) or "schottky" (0.3V)
- - "abracon,tc-resistor": should be <0>, <3>, <6> or <11>. 0 disables the output
-                          resistor, the other values are in kOhm.
diff --git a/Documentation/devicetree/bindings/rtc/abracon,abx80x.yaml b/Documentation/devicetree/bindings/rtc/abracon,abx80x.yaml
new file mode 100644
index 000000000000..02bee3038b0a
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/abracon,abx80x.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/abracon,abx80x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Abracon ABX80X I2C ultra low power RTC/alarm chip
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+
+description:
+  The Abracon ABX80X family consists of the ab0801, ab0803, ab0804, ab0805,
+  ab1801, ab1803, ab1804 and ab1805. The ab0805 is the superset of ab080x and
+  the ab1805 is the superset of ab180x.
+
+properties:
+  compatible:
+    enum:
+      - abracon,abx80x    # Enables chip auto-detection
+      - abracon,ab0801
+      - abracon,ab0803
+      - abracon,ab0804
+      - abracon,ab0805
+      - abracon,ab1801
+      - abracon,ab1803
+      - abracon,ab1804
+      - abracon,ab1805
+      - microcrystal,rv1805
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  abracon,tc-diode:
+    description:
+      Select the series diode configuration for the trickle charger, between a
+      standard diode (0.6V) and a Schottky diode (0.3V).
+    enum: [standard, schottky]
+
+  abracon,tc-resistor:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Select the series output resistor value for the tricker charger, in kOhm.
+    enum: [0, 3, 6, 11]
+
+dependentRequired:
+  abracon,tc-diode: ["abracon,tc-resistor"]
+  abracon,tc-resistor: ["abracon,tc-diode"]
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: rtc.yaml#
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              enum:
+                - abracon,ab0804
+                - abracon,ab1804
+                - abracon,ab0805
+                - abracon,ab1805
+    then:
+      properties:
+        abracon,tc-diode: false
+        abracon,tc-resistor: false
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        rtc@69 {
+            compatible = "abracon,ab1805";
+            reg = <0x69>;
+            abracon,tc-diode = "schottky";
+            abracon,tc-resistor = <3>;
+        };
+    };
+...
-- 
Regards,

Laurent Pinchart


