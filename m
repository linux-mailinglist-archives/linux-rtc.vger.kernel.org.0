Return-Path: <linux-rtc+bounces-6399-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNiYKj566mkUzwIAu9opvQ
	(envelope-from <linux-rtc+bounces-6399-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 23 Apr 2026 21:59:58 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E76F5457163
	for <lists+linux-rtc@lfdr.de>; Thu, 23 Apr 2026 21:59:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 858B03030E99
	for <lists+linux-rtc@lfdr.de>; Thu, 23 Apr 2026 19:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13F4538422E;
	Thu, 23 Apr 2026 19:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="NElyZ6pj"
X-Original-To: linux-rtc@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878BC30FC27;
	Thu, 23 Apr 2026 19:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776973812; cv=none; b=iFqstCsjUVoDAl1Nklq9AYkhJtHOVcs7Xa6RFEPIDL9mQYpsTZtHzQc60yqAlLhx/jzwB5NltJ2hbddj57zTwsoJLgmzASE+7TrDljwBdYAH2KFta9qvtDFkqcI7BWDoYGkUpMMS0p9fRzQBgUtSZ3kjOFMvQgLVzsYMgkg3VjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776973812; c=relaxed/simple;
	bh=wG5aVvMxMI0cXNDURk14EaW5rpeeJXdYvxDtGL++Q0g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MYgE4++cFvyhP5adMqvEdX96ASzh+YZ5sc/+Bnpf1d9LttgFfp/Fm4SiY2k1DWGTN6F3CBXsl+LpmieH715Fn3sOwGHIJvHtusmu01rnFHeBCMZdsxpu+gHJnJZ8pQu53jE1bSKEG4UiObLisz49Ix/EKBSfVCCHCJQ6/FNLKBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=NElyZ6pj; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 34ED226DA5;
	Thu, 23 Apr 2026 21:50:09 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HApEscDIVU-H; Thu, 23 Apr 2026 21:50:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1776973808; bh=wG5aVvMxMI0cXNDURk14EaW5rpeeJXdYvxDtGL++Q0g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NElyZ6pj03bOT5FcS/NuhOQ5Fuwn1uTVjnm/xuGHCbMIxwHPHVcH5/UoPP0QqyALM
	 Z4b7/mNAefz1ctpR1mZNPICfK849+zS0bhPj+Z6EFECcnYaI/9aCnIl4DyqVrYJz4E
	 Q70Rxxz3+wSuA1qz4NxZL15Yo4lxC+sj22mMJOju9uyZQ10HOsWIs5wQseS33piaXL
	 c6a3Fuava/hawCEHd2Tb1B2TveZg0oGTBYCHJNeg4+8ZSvmQNkf0uHS6A7Xq8wxYgQ
	 xdktrc0rAJvAcGaovovw7EcnQT9heRfyGYowUYc03y5B7J9149vX3KHKqAKR5lnXqS
	 rXEpVsDjf9KJw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 24 Apr 2026 01:09:02 +0530
Subject: [PATCH v5 03/11] dt-bindings: mfd: add documentation for S2MU005
 PMIC
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-s2mu005-pmic-v5-3-fcbc9da5a004@disroot.org>
References: <20260424-s2mu005-pmic-v5-0-fcbc9da5a004@disroot.org>
In-Reply-To: <20260424-s2mu005-pmic-v5-0-fcbc9da5a004@disroot.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Sebastian Reichel <sre@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Nam Tran <trannamatk@gmail.com>, 
 =?utf-8?q?=C5=81ukasz_Lebiedzi=C5=84ski?= <kernel@lvkasz.us>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-doc@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6399-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[disroot.org:s=mail];
	FREEMAIL_TO(0.00)[kernel.org,samsung.com,linaro.org,bootlin.com,lwn.net,linuxfoundation.org,gmail.com,lvkasz.us];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[23];
	DMARC_POLICY_ALLOW(0.00)[disroot.org,reject];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[disroot.org:+];
	NEURAL_SPAM(0.00)[0.205];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kauschluss@disroot.org,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url,0.0.0.1:email,disroot.org:email,disroot.org:dkim,disroot.org:mid,3d:email]
X-Rspamd-Queue-Id: E76F5457163
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Samsung's S2MU005 PMIC includes subdevices for a charger, an MUIC (Micro
USB Interface Controller), and flash and RGB LED controllers.

Add the compatible and documentation for the S2MU005 PMIC. Also, add an
example for nodes for supported sub-devices, i.e. MUIC, flash LEDs, and
RGB LEDs. Charger sub-device uses the node of the parent.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../bindings/mfd/samsung,s2mu005-pmic.yaml         | 120 +++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mu005-pmic.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mu005-pmic.yaml
new file mode 100644
index 0000000000000..0e6afb7d2017b
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/samsung,s2mu005-pmic.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/samsung,s2mu005-pmic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S2MU005 Power Management IC
+
+maintainers:
+  - Kaustabh Chakraborty <kauschluss@disroot.org>
+
+description: |
+  The S2MU005 is a companion power management IC which includes subdevices for
+  a charger controller, an MUIC (Micro USB Interface Controller), and flash and
+  RGB LED controllers.
+
+allOf:
+  - $ref: /schemas/power/supply/power-supply.yaml#
+
+properties:
+  compatible:
+    const: samsung,s2mu005-pmic
+
+  flash:
+    $ref: /schemas/leds/samsung,s2mu005-flash.yaml
+    description:
+      Child node describing flash LEDs.
+
+  interrupts:
+    maxItems: 1
+
+  muic:
+    $ref: /schemas/extcon/samsung,s2mu005-muic.yaml#
+    description:
+      Child node describing MUIC device.
+
+  multi-led:
+    type: object
+
+    allOf:
+      - $ref: /schemas/leds/leds-class-multicolor.yaml#
+
+    properties:
+      compatible:
+        const: samsung,s2mu005-rgb
+
+    required:
+      - compatible
+
+    unevaluatedProperties: false
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/leds/common.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@3d {
+            compatible = "samsung,s2mu005-pmic";
+            reg = <0x3d>;
+            interrupt-parent = <&gpa2>;
+            interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
+
+            monitored-battery = <&battery>;
+
+            flash {
+                compatible = "samsung,s2mu005-flash";
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                led@0 {
+                    reg = <0>;
+                    color = <LED_COLOR_ID_WHITE>;
+                    function = LED_FUNCTION_FLASH;
+                };
+
+                led@1 {
+                    reg = <1>;
+                    color = <LED_COLOR_ID_WHITE>;
+                    function = LED_FUNCTION_FLASH;
+                    function-enumerator = <1>;
+                };
+            };
+
+            muic {
+                compatible = "samsung,s2mu005-muic";
+
+                connector {
+                    compatible = "usb-b-connector";
+                    label = "micro-USB";
+                    type = "micro";
+                };
+
+                port {
+                    muic_to_usb: endpoint {
+                        remote-endpoint = <&usb_to_muic>;
+                    };
+                };
+            };
+
+            multi-led {
+                compatible = "samsung,s2mu005-rgb";
+                color = <LED_COLOR_ID_RGB>;
+                function = LED_FUNCTION_INDICATOR;
+                linux,default-trigger = "pattern";
+            };
+        };
+    };

-- 
2.53.0


