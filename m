Return-Path: <linux-rtc+bounces-6321-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKFnHonj3WnDkwkAu9opvQ
	(envelope-from <linux-rtc+bounces-6321-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Apr 2026 08:49:45 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2223F63FA
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Apr 2026 08:49:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF3B43051D32
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Apr 2026 06:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E04936C9DF;
	Tue, 14 Apr 2026 06:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Pyy77qfe"
X-Original-To: linux-rtc@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDE432863D;
	Tue, 14 Apr 2026 06:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776148427; cv=none; b=D7p/ntFnT83O5KgCLSt61oYOarYGPoT2qWCJN7mri/5XMoXfXdQO1VQB/b5nma9bFowyzUQcSrMD3BOYjmI2e2ghhyEgdnfR14XQJYfmRVyEA2OO9S2LUyhmawm22LTF36ExrCEuMGDvk0t9kPhCpZFJWuM/xFjdZlCUnb7Lt6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776148427; c=relaxed/simple;
	bh=2qwRVJP+lQH9EugQffm+Xt/mUkGuhfh68ma2J9APgaU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jX77ul80seyR4EB+GiuMOBFeLbGIqYw4AP/S2RpHlxw2YAZlrx6KCJlw4Gl9Xqi7k2xOZ5mV1ffkPtTKeyUsCot6JWlMsXytgji1lWYAi8gEXaFYBPOefhFe5C85b6WdhjVYDlzfNasliiiKdwNU28wFfcljcjvOXAJxlhSGbvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Pyy77qfe; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 638D225F15;
	Tue, 14 Apr 2026 08:33:44 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sOWCI78pXA_j; Tue, 14 Apr 2026 08:33:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1776148423; bh=2qwRVJP+lQH9EugQffm+Xt/mUkGuhfh68ma2J9APgaU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Pyy77qfe6HA+fDuy5eqoq30ojh7j1fZJf8CPsNOqtp3XwFXl5nHaDOL8ufN/1CIhV
	 akrSQT6gFE0OP3a65E3dBMIm2HkjGQsPL3CyQgWJRB0JH1yCy8zIGlQWhchulxIeu0
	 JJc6NdaR4ir/13EdhJ/B1Z9ErHfudsoI7SCvfVWVd6xLqISg3u8ohtCZgC5GPnYunq
	 bOx+dh4VZUHHz9G6bm6sB2zMyJ9Kf5eHCDwRM5TsCNZ+kjhgK+EWyeBySsFXTQQhmZ
	 Sn7e1o3PgeM1GoGDbC1UmC+Jte64Z/G6JYT469KOtlEK41IThMqWSZJUT3QfOoNM/e
	 voIXlwb3FGITw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 14 Apr 2026 12:02:57 +0530
Subject: [PATCH v4 05/13] dt-bindings: mfd: s2mps11: add documentation for
 S2MU005 PMIC
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-s2mu005-pmic-v4-5-7fe7480577e6@disroot.org>
References: <20260414-s2mu005-pmic-v4-0-7fe7480577e6@disroot.org>
In-Reply-To: <20260414-s2mu005-pmic-v4-0-7fe7480577e6@disroot.org>
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
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-6321-lists,linux-rtc=lfdr.de];
	R_DKIM_ALLOW(0.00)[disroot.org:s=mail];
	FREEMAIL_TO(0.00)[kernel.org,samsung.com,linaro.org,bootlin.com,lwn.net,linuxfoundation.org,gmail.com,lvkasz.us];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[23];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[disroot.org,reject];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.086];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kauschluss@disroot.org,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[disroot.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[3d:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.1:email,0.0.0.0:email,disroot.org:dkim,disroot.org:email,disroot.org:mid]
X-Rspamd-Queue-Id: CF2223F63FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Samsung's S2MU005 PMIC includes subdevices for a charger, an MUIC (Micro
USB Interface Controller), and flash and RGB LED controllers.

Since regulators are not supported by this device, unmark this property
as required and instead set this in a per-device basis for ones which
need it.

Add the compatible and documentation for the S2MU005 PMIC. Also, add an
example for nodes for supported sub-devices, i.e. charger, extcon,
flash, and rgb.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../devicetree/bindings/mfd/samsung,s2mps11.yaml   | 121 ++++++++++++++++++++-
 1 file changed, 120 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
index ac5d0c149796b..d3d305b9aa765 100644
--- a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
+++ b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
@@ -26,12 +26,28 @@ properties:
       - samsung,s2mps15-pmic
       - samsung,s2mpu02-pmic
       - samsung,s2mpu05-pmic
+      - samsung,s2mu005-pmic
 
   clocks:
     $ref: /schemas/clock/samsung,s2mps11.yaml
     description:
       Child node describing clock provider.
 
+  charger:
+    $ref: /schemas/power/supply/samsung,s2mu005-charger.yaml
+    description:
+      Child node describing battery charger device.
+
+  extcon:
+    $ref: /schemas/extcon/samsung,s2mu005-muic.yaml
+    description:
+      Child node describing extcon device.
+
+  flash:
+    $ref: /schemas/leds/samsung,s2mu005-flash.yaml
+    description:
+      Child node describing flash LEDs.
+
   interrupts:
     maxItems: 1
 
@@ -43,6 +59,11 @@ properties:
     description:
       List of child nodes that specify the regulators.
 
+  rgb:
+    $ref: /schemas/leds/samsung,s2mu005-rgb.yaml
+    description:
+      Child node describing RGB LEDs.
+
   samsung,s2mps11-acokb-ground:
     description: |
       Indicates that ACOKB pin of S2MPS11 PMIC is connected to the ground so
@@ -63,7 +84,6 @@ properties:
 required:
   - compatible
   - reg
-  - regulators
 
 additionalProperties: false
 
@@ -78,6 +98,8 @@ allOf:
         regulators:
           $ref: /schemas/regulator/samsung,s2mps11.yaml
         samsung,s2mps11-wrstbi-ground: false
+      required:
+        - regulators
 
   - if:
       properties:
@@ -89,6 +111,8 @@ allOf:
         regulators:
           $ref: /schemas/regulator/samsung,s2mps13.yaml
         samsung,s2mps11-acokb-ground: false
+      required:
+        - regulators
 
   - if:
       properties:
@@ -101,6 +125,8 @@ allOf:
           $ref: /schemas/regulator/samsung,s2mps14.yaml
         samsung,s2mps11-acokb-ground: false
         samsung,s2mps11-wrstbi-ground: false
+      required:
+        - regulators
 
   - if:
       properties:
@@ -113,6 +139,8 @@ allOf:
           $ref: /schemas/regulator/samsung,s2mps15.yaml
         samsung,s2mps11-acokb-ground: false
         samsung,s2mps11-wrstbi-ground: false
+      required:
+        - regulators
 
   - if:
       properties:
@@ -125,6 +153,8 @@ allOf:
           $ref: /schemas/regulator/samsung,s2mpu02.yaml
         samsung,s2mps11-acokb-ground: false
         samsung,s2mps11-wrstbi-ground: false
+      required:
+        - regulators
 
   - if:
       properties:
@@ -137,6 +167,18 @@ allOf:
           $ref: /schemas/regulator/samsung,s2mpu05.yaml
         samsung,s2mps11-acokb-ground: false
         samsung,s2mps11-wrstbi-ground: false
+      required:
+        - regulators
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,s2mu005-pmic
+    then:
+      properties:
+        samsung,s2mps11-acokb-ground: false
+        samsung,s2mps11-wrstbi-ground: false
 
 examples:
   - |
@@ -278,3 +320,80 @@ examples:
             };
         };
     };
+
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
+            charger {
+                compatible = "samsung,s2mu005-charger";
+                monitored-battery = <&battery>;
+
+                port {
+                    charger_to_muic: endpoint {
+                        remote-endpoint = <&muic_to_charger>;
+                    };
+                };
+            };
+
+            extcon {
+                compatible = "samsung,s2mu005-muic";
+
+                connector {
+                    compatible = "usb-b-connector";
+                    label = "micro-USB";
+                    type = "micro";
+                };
+
+                port {
+                    muic_to_charger: endpoint@0 {
+                        reg = <0>;
+                        remote-endpoint = <&charger_to_muic>;
+                    };
+
+                    muic_to_usb: endpoint@1 {
+                        reg = <1>;
+                        remote-endpoint = <&usb_to_muic>;
+                    };
+                };
+            };
+
+            flash {
+                compatible = "samsung,s2mu005-flash";
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                led@0 {
+                    reg = <0>;
+                    label = "back-cam:white:flash";
+                    color = <LED_COLOR_ID_WHITE>;
+                    function = LED_FUNCTION_FLASH;
+                };
+
+                led@1 {
+                    reg = <1>;
+                    label = "front-cam:white:flash";
+                    color = <LED_COLOR_ID_WHITE>;
+                    function = LED_FUNCTION_FLASH;
+                };
+            };
+
+            rgb {
+                compatible = "samsung,s2mu005-rgb";
+                label = "notification:rgb:indicator";
+                color = <LED_COLOR_ID_RGB>;
+                function = LED_FUNCTION_INDICATOR;
+                linux,default-trigger = "pattern";
+            };
+        };
+    };

-- 
2.53.0


