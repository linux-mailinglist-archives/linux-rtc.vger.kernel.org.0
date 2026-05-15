Return-Path: <linux-rtc+bounces-6506-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OfKC4D4BmpUpwIAu9opvQ
	(envelope-from <linux-rtc+bounces-6506-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 15 May 2026 12:42:08 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C245454D899
	for <lists+linux-rtc@lfdr.de>; Fri, 15 May 2026 12:42:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6C12230098B8
	for <lists+linux-rtc@lfdr.de>; Fri, 15 May 2026 10:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D95644CF4E;
	Fri, 15 May 2026 10:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="MuWTruGK"
X-Original-To: linux-rtc@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D473890E0;
	Fri, 15 May 2026 10:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778841609; cv=none; b=nDE1kSEXbMr+G5g86GUAhTcGwv/4IQ73TftzpIWWwWU8iFpP2jMFfh2b0TbRWeU9Y2UmQeFsWZHUZ7Oq/SYP7kk380CFEn6KjtqRh42PNlxCEWcRQWDTSPZnfkGvUU7gDJWlp1ziBQ0DRo4SnwSA4g6pHBoQSA97IR3FTmYtxzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778841609; c=relaxed/simple;
	bh=wG5aVvMxMI0cXNDURk14EaW5rpeeJXdYvxDtGL++Q0g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Eh7k0mBo0xRTN+f9NpHvFFPHfLzTN346/YIcjNrsC4/5CI9TU0Ds9z1DRoYOtWrgd2vhYTY5TUPknChvoK9WuGZgsFe5PR686+HxcX31o7KTV2L/OReu27jnvIR2JrAy2QNIkEs2Ln/8TP4Y+7DaXfUj0O+u1rC7mJKcwT9ZB/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=MuWTruGK; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A2D732714A;
	Fri, 15 May 2026 12:40:06 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xhyRysfAmaWC; Fri, 15 May 2026 12:40:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1778841605; bh=wG5aVvMxMI0cXNDURk14EaW5rpeeJXdYvxDtGL++Q0g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MuWTruGKQ5K66fHas5rrP27spRSBetT/DBPXqE18Op0mEfy6VOnZSWoAnvEAXP0b7
	 W40cfXrT5m0nC10rk3Cyvv9d3rVBKKrrAj46l6EDD9VhqqK20NRTI3U8xsanbBOKon
	 d1ooH/PFQ0qP0LWJp8maa/62zelRLtt10HUTiMcaCUGXEkhfeL2642rQjUDCW7gJ5r
	 J5J8FUecCcTL8xDs//7gdSTF0LT8z85sy7JySu52qD6CUPT9PNUYIFgJ2/bkdjKh2a
	 Jh0i6M1WTC8KT1M20rS3LdrQkpyJx1cbKvKvSIdXqurGL/aKoSD+B1pCjplooddDmn
	 1mCQTCgciJFRA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 15 May 2026 16:08:59 +0530
Subject: [PATCH v6 03/11] dt-bindings: mfd: add documentation for S2MU005
 PMIC
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-s2mu005-pmic-v6-3-1979106992d4@disroot.org>
References: <20260515-s2mu005-pmic-v6-0-1979106992d4@disroot.org>
In-Reply-To: <20260515-s2mu005-pmic-v6-0-1979106992d4@disroot.org>
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
X-Rspamd-Queue-Id: C245454D899
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6506-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,samsung.com,linaro.org,bootlin.com,lwn.net,linuxfoundation.org,gmail.com,lvkasz.us];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[disroot.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kauschluss@disroot.org,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

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


