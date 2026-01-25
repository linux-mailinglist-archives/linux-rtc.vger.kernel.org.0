Return-Path: <linux-rtc+bounces-5861-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id suIrFz01dmmTNgEAu9opvQ
	(envelope-from <linux-rtc+bounces-5861-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Jan 2026 16:22:37 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7FB81298
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Jan 2026 16:22:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABE4130022AD
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Jan 2026 15:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53117318BB9;
	Sun, 25 Jan 2026 15:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lq5rv2lI"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDA327B353
	for <linux-rtc@vger.kernel.org>; Sun, 25 Jan 2026 15:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769354553; cv=none; b=K/E2F4inOqoaPtmR+5JIdU0k9bC2cAHqnN9UbVNdcHupuP4H3gSW9d4BZi2n0cpNkxSPlr74YTFqDpFwKaLPN6dJQCywGzhEgGJixLnTaA2RNv3d4yiqWKbsq+ShKAQIEQzL8ESSqu9nhA0Ufgf3W1iOe3o4FBdJ1OGYstiUTys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769354553; c=relaxed/simple;
	bh=wqWg7lGHql4NrKUKo63XZDMBk154NcJUP3KwEEnKR3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lDxYYceQ6V/n1d+aKIk5ara9VjUhq6ldkSOxJhrxhelufWi4/NXInbgAC4rakL9KmQRQrFSq1jsRLmDxRDpWe8aSh62t+CJ5AWXiGI6OGFOUbHw5vpGBLXqxzk1U0yXmOCoKbk06D8IWDbvJEVqJyp6K05FE5Q62RwQ+9OhsUzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lq5rv2lI; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-64b92abe63aso7737875a12.0
        for <linux-rtc@vger.kernel.org>; Sun, 25 Jan 2026 07:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769354550; x=1769959350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SizrNCMj0rXj5dH31XiLWqtHZ0EndKNEJUxL43/ep/U=;
        b=Lq5rv2lITeUVd1QWKzLspSuK5RMavETnBDvw2F+8Bl9pxzFdkaq5F2q7yTnmXY9zS5
         w9b5eLkE423kZAlDrIGpKjnryHhvjVfmgaUiIRGfVP2A2VkyQclk0vMsZD7J86rjSxxN
         rK+3daFknrr+N932cQRiA3kqmj/TyXtjzAN5xCGmmQ4HyJaOD45J5rJBCek4Gq0bZbp3
         6ZJ0S9zn3FJ0EUUKs1XMJYuaaivvl7IuO1lyILNczK6+H8SkALLmZY35QRSL0p7OjvTO
         GevJtcMugrz4ipSW29C1tw2Rh0MNjEvrilspnEpX5ogY2ecdTUkSuB9T2TgEL+70VKSk
         Cu6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769354550; x=1769959350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SizrNCMj0rXj5dH31XiLWqtHZ0EndKNEJUxL43/ep/U=;
        b=DWzJMn7IFgdKtynu6MNGjSoip+2bL2AGO0zMEI1utKFBTp2kb+MMcRYn4a5JntoS4W
         /R9MJOzBaY/SlPD1HU5iYmv5KNS3Bd/01w73diyfGmSsZcUXOsPX12R4R0zQxHnfIYrO
         UgLw2lLg3XZy1oN4TMf1u78NgJ3+/e3GVBT9L/zyGD3q5MkamOGgSiKAdj0hVNWfMX8D
         uTL6BbonECvpLL1sqicwLdWbo6iK5g/BXRMlj0IZN/PgS+bx+/PM4vN3iNHj5Qm4NsD5
         nWeiFhp7td3aa+NWv18xfDSaQvuFaQzH30FnCWJM3ySM0vkHJZMc0Jvwy6ohECdmJkW+
         Wt6g==
X-Forwarded-Encrypted: i=1; AJvYcCVjQwIGFhBbnEUYksnO0Yx2aqTo4VxOYVHFGN0KVU0NA/e5HqsV9Jav9mH4ajPfbD20Tm38QXj+bRU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQX5klaue4dBMOLUNRPhgTFOm6TYOYuhCOKJs+L297NTFdnEG8
	QfyvYCAgaQ/GEz1L9IHAcPFuAQdgXLNMcEmM+U0RagBzD2/D6aWD2MGr
X-Gm-Gg: AZuq6aILPrVIgKCTV6XCeE1Vlsng5dBt87iDjJlgXRN5Ffn9fpjVsQb93gTqsEvq8Pe
	V/hHfEn7YYP9Vg6RBF7FDeltAvwnRyFcJPY13MBrPGaAoS6UENefi2iNg1UG+cKV5dP4dQpokRe
	qLVXJthe4AumUAxTsiIEWQW3UODQ751EYBGBdR8YUM+4pTAPZQgok5Fzvr3DbGm/k/ilbtSiC8F
	Hz/UEUH2sGvtgNJWqiN86G0ToU0bfFEr7XRw6JfN8GsPhtUnX+v5GsAA4t5vFzXxFDG/pKIwZvx
	N16tgip7bDnXVjY0V45HMlxVkjD5nGXbkyB4iZ2iVzlMT1GbhvHFPwcheg04m+02WfZSk0nzaq4
	TjNk48+kzP4UJdPWhEAhRedKr1W4445KgqjSv7yyLK0CaPZHC9HS39EJVGOSAyfAUczphUSZaiH
	+7
X-Received: by 2002:a05:6000:186a:b0:435:729b:c390 with SMTP id ffacd0b85a97d-435ca39bb3fmr2499194f8f.47.1769348601406;
        Sun, 25 Jan 2026 05:43:21 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c246ecsm22459688f8f.10.2026.01.25.05.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 05:43:21 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Tony Lindgren <tony@atomide.com>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH v1 08/10] dt-bindings: mfg: motorola-cpcap: convert to schema
Date: Sun, 25 Jan 2026 15:43:00 +0200
Message-ID: <20260125134302.45958-9-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260125134302.45958-1-clamor95@gmail.com>
References: <20260125134302.45958-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-5861-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,bootlin.com,atomide.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.1:email]
X-Rspamd-Queue-Id: 5E7FB81298
X-Rspamd-Action: no action

Convert devicetree bindings for the Motorola CPCAP MFD from TXT to YAML.
Audio codec bindings adjusted with common ports node for port@0 and
port@1. Added compatible for Mot board CPCAP. Other bindings remain the
same.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/mfd/motorola,cpcap.yaml          | 389 ++++++++++++++++++
 .../bindings/mfd/motorola-cpcap.txt           |  78 ----
 2 files changed, 389 insertions(+), 78 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/motorola-cpcap.txt

diff --git a/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml b/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
new file mode 100644
index 000000000000..f75f884c7b3e
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
@@ -0,0 +1,389 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/motorola,cpcap.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Motorola CPCAP PMIC MFD
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    enum:
+      - motorola,cpcap
+      - st,6556002
+      - motorola,mapphone-cpcap
+      - motorola,mot-cpcap
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  spi-max-frequency:
+    maximum: 8000000
+
+  spi-cs-high: true
+
+  adc:
+    $ref: /schemas/iio/adc/motorola,cpcap-adc.yaml
+
+  audio-codec:
+    type: object
+
+    properties:
+      interrupts:
+        items:
+          - description: headset detect interrupt
+          - description: microphone bias 2 detect interrupt
+
+      interrupt-names:
+        items:
+          - const: hs
+          - const: mb2
+
+      "#sound-dai-cells":
+        const: 1
+
+      ports:
+        $ref: /schemas/graph.yaml#/properties/ports
+        description: The audio-codec provides two DAIs. The first one is
+          connected to the Stereo HiFi DAC and the second one is connected
+          to the Voice DAC.
+
+    required:
+      - interrupts
+      - interrupt-names
+      - "#sound-dai-cells"
+
+  battery:
+    $ref: /schemas/power/supply/cpcap-battery.yaml
+
+  charger:
+    $ref: /schemas/power/supply/cpcap-charger.yaml
+
+  key-power:
+    $ref: /schemas/input/motorola,cpcap-pwrbutton.yaml
+
+  phy:
+    $ref: /schemas/phy/motorola,cpcap-usb-phy.yaml
+
+  regulator:
+    $ref: /schemas/regulator/motorola,cpcap-regulator.yaml
+
+  rtc:
+    $ref: /schemas/rtc/motorola,cpcap-rtc.yaml
+
+patternProperties:
+  "^led(-[a-z]+)?$":
+    $ref: /schemas/leds/motorola,cpcap-leds.yaml
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/input/linux-event-codes.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        cpcap: pmic@0 {
+            compatible = "motorola,cpcap";
+            reg = <0>; /* cs0 */
+
+            interrupt-parent = <&gpio1>;
+            interrupts = <7 IRQ_TYPE_EDGE_RISING>;
+
+            interrupt-controller;
+            #interrupt-cells = <2>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            spi-max-frequency = <3000000>;
+            spi-cs-high;
+
+            cpcap_adc: adc {
+                compatible = "motorola,cpcap-adc";
+
+                interrupt-parent = <&cpcap>;
+                interrupts = <8 IRQ_TYPE_NONE>;
+                interrupt-names = "adcdone";
+
+                #io-channel-cells = <1>;
+            };
+
+            cpcap_audio: audio-codec {
+                interrupt-parent = <&cpcap>;
+                interrupts = <9 IRQ_TYPE_NONE>, <10 IRQ_TYPE_NONE>;
+                interrupt-names = "hs", "mb2";
+
+                #sound-dai-cells = <1>;
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    /* HiFi */
+                    port@0 {
+                        reg = <0>;
+                        cpcap_audio_codec0: endpoint {
+                        };
+                    };
+
+                    /* Voice */
+                    port@1 {
+                        reg = <1>;
+                        cpcap_audio_codec1: endpoint {
+                        };
+                    };
+                };
+            };
+
+            cpcap_battery: battery {
+                compatible = "motorola,cpcap-battery";
+
+                interrupt-parent = <&cpcap>;
+                interrupts = <6 IRQ_TYPE_NONE>, <5 IRQ_TYPE_NONE>,
+                             <3 IRQ_TYPE_NONE>, <20 IRQ_TYPE_NONE>,
+                             <54 IRQ_TYPE_NONE>, <57 IRQ_TYPE_NONE>;
+                interrupt-names = "eol", "lowbph", "lowbpl",
+                                  "chrgcurr1", "battdetb", "cccal";
+
+                io-channels = <&cpcap_adc 0>, <&cpcap_adc 1>,
+                              <&cpcap_adc 5>, <&cpcap_adc 6>;
+                io-channel-names = "battdetb", "battp",
+                                   "chg_isense", "batti";
+                power-supplies = <&cpcap_charger>;
+            };
+
+            cpcap_charger: charger {
+                compatible = "motorola,mapphone-cpcap-charger";
+
+                interrupt-parent = <&cpcap>;
+                interrupts = <13 IRQ_TYPE_NONE>, <12 IRQ_TYPE_NONE>,
+                             <29 IRQ_TYPE_NONE>, <28 IRQ_TYPE_NONE>,
+                             <22 IRQ_TYPE_NONE>, <21 IRQ_TYPE_NONE>,
+                             <20 IRQ_TYPE_NONE>, <19 IRQ_TYPE_NONE>,
+                             <54 IRQ_TYPE_NONE>;
+                interrupt-names = "chrg_det", "rvrs_chrg", "chrg_se1b",
+                                  "se0conn", "rvrs_mode", "chrgcurr2",
+                                  "chrgcurr1", "vbusvld", "battdetb";
+
+                mode-gpios = <&gpio3 29 GPIO_ACTIVE_LOW>,
+                             <&gpio3 23 GPIO_ACTIVE_LOW>;
+
+                io-channels = <&cpcap_adc 0>, <&cpcap_adc 1>,
+                              <&cpcap_adc 2>, <&cpcap_adc 5>,
+                              <&cpcap_adc 6>;
+                io-channel-names = "battdetb", "battp",
+                                   "vbus", "chg_isense",
+                                   "batti";
+            };
+
+            key-power {
+                compatible = "motorola,cpcap-pwrbutton";
+
+                interrupt-parent = <&cpcap>;
+                interrupts = <23 IRQ_TYPE_NONE>;
+            };
+
+            led-red {
+                compatible = "motorola,cpcap-led-red";
+                vdd-supply = <&vdd_led>;
+                label = "status-led::red";
+            };
+
+            led-green {
+                compatible = "motorola,cpcap-led-green";
+                vdd-supply = <&vdd_led>;
+                label = "status-led::green";
+            };
+
+            led-blue {
+                compatible = "motorola,cpcap-led-blue";
+                vdd-supply = <&vdd_led>;
+                label = "status-led::blue";
+            };
+
+            cpcap_usb2_phy: phy {
+                compatible = "motorola,mapphone-cpcap-usb-phy";
+
+                pinctrl-0 = <&usb_gpio_mux_sel1>, <&usb_gpio_mux_sel2>;
+                pinctrl-1 = <&usb_ulpi_pins>;
+                pinctrl-2 = <&usb_utmi_pins>;
+                pinctrl-3 = <&uart3_pins>;
+                pinctrl-names = "default", "ulpi", "utmi", "uart";
+                #phy-cells = <0>;
+
+                interrupts-extended =
+                    <&cpcap 15 IRQ_TYPE_NONE>, <&cpcap 14 IRQ_TYPE_NONE>,
+                    <&cpcap 28 IRQ_TYPE_NONE>, <&cpcap 19 IRQ_TYPE_NONE>,
+                    <&cpcap 18 IRQ_TYPE_NONE>, <&cpcap 17 IRQ_TYPE_NONE>,
+                    <&cpcap 16 IRQ_TYPE_NONE>, <&cpcap 49 IRQ_TYPE_NONE>,
+                    <&cpcap 48 IRQ_TYPE_NONE>;
+                interrupt-names = "id_ground", "id_float", "se0conn",
+                                  "vbusvld", "sessvld", "sessend",
+                                  "se1", "dm", "dp";
+
+                mode-gpios = <&gpio2 28 GPIO_ACTIVE_HIGH>,
+                             <&gpio1 0 GPIO_ACTIVE_HIGH>;
+
+                io-channels = <&cpcap_adc 2>, <&cpcap_adc 7>;
+                io-channel-names = "vbus", "id";
+
+                vusb-supply = <&avdd_usb>;
+            };
+
+            regulator {
+                compatible = "motorola,cpcap-regulator";
+
+                regulators {
+                    vdd_cpu: SW1 {
+                        regulator-name = "vdd_cpu";
+                        regulator-min-microvolt = <750000>;
+                        regulator-max-microvolt = <1125000>;
+                        regulator-enable-ramp-delay = <1500>;
+                        regulator-always-on;
+                        regulator-boot-on;
+                    };
+
+                    vdd_core: SW2 {
+                        regulator-name = "vdd_core";
+                        regulator-min-microvolt = <950000>;
+                        regulator-max-microvolt = <1300000>;
+                        regulator-enable-ramp-delay = <1500>;
+                        regulator-always-on;
+                        regulator-boot-on;
+                    };
+
+                    vdd_1v8_vio: SW3 {
+                        regulator-name = "vdd_1v8_vio";
+                        regulator-min-microvolt = <1800000>;
+                        regulator-max-microvolt = <1800000>;
+                        regulator-enable-ramp-delay = <0>;
+                        regulator-always-on;
+                        regulator-boot-on;
+                    };
+
+                    vdd_aon: SW4 {
+                        regulator-name = "vdd_aon";
+                        regulator-min-microvolt = <950000>;
+                        regulator-max-microvolt = <1300000>;
+                        regulator-enable-ramp-delay = <1500>;
+                        regulator-always-on;
+                        regulator-boot-on;
+                    };
+
+                    vdd_led: SW5 {
+                        regulator-name = "vdd_led";
+                        regulator-min-microvolt = <5050000>;
+                        regulator-max-microvolt = <5050000>;
+                        regulator-enable-ramp-delay = <1500>;
+                        regulator-boot-on;
+                    };
+
+                    vdd_hvio: VHVIO {
+                        regulator-name = "vdd_hvio";
+                        regulator-min-microvolt = <2775000>;
+                        regulator-max-microvolt = <2775000>;
+                        regulator-enable-ramp-delay = <1000>;
+                    };
+
+                    vcore_emmc: VSDIO {
+                        regulator-name = "vcore_emmc";
+                        regulator-min-microvolt = <1500000>;
+                        regulator-max-microvolt = <3000000>;
+                        regulator-enable-ramp-delay = <1000>;
+                        regulator-always-on;
+                        regulator-boot-on;
+                    };
+
+                    avdd_dsi_csi: VCSI {
+                        regulator-name = "avdd_dsi_csi";
+                        regulator-min-microvolt = <1200000>;
+                        regulator-max-microvolt = <1200000>;
+                        regulator-enable-ramp-delay = <1000>;
+                        regulator-boot-on;
+                    };
+
+                    avdd_3v3_periph: VWLAN2 {
+                        regulator-name = "avdd_3v3_periph";
+                        regulator-min-microvolt = <2775000>;
+                        regulator-max-microvolt = <3300000>;
+                        regulator-enable-ramp-delay = <1000>;
+                        regulator-boot-on;
+                    };
+
+                    vddio_usd: VSIMCARD {
+                        regulator-name = "vddio_usd";
+                        regulator-min-microvolt = <1800000>;
+                        regulator-max-microvolt = <2900000>;
+                        regulator-enable-ramp-delay = <1000>;
+                        regulator-boot-on;
+                    };
+
+                    vdd_haptic: VVIB {
+                        regulator-name = "vdd_haptic";
+                        regulator-min-microvolt = <1300000>;
+                        regulator-max-microvolt = <3000000>;
+                        regulator-enable-ramp-delay = <1000>;
+                    };
+
+                    avdd_usb: VUSB {
+                        regulator-name = "avdd_usb";
+                        regulator-min-microvolt = <3300000>;
+                        regulator-max-microvolt = <3300000>;
+                        regulator-enable-ramp-delay = <1000>;
+                        regulator-always-on;
+                        regulator-boot-on;
+                    };
+
+                    VAUDIO {
+                        regulator-name = "vdd_audio";
+                        regulator-min-microvolt = <2775000>;
+                        regulator-max-microvolt = <2775000>;
+                        regulator-enable-ramp-delay = <1000>;
+                        regulator-always-on;
+                        regulator-boot-on;
+                    };
+                };
+            };
+
+            cpcap_rtc: rtc {
+                compatible = "motorola,cpcap-rtc";
+
+                interrupt-parent = <&cpcap>;
+                interrupts = <39 IRQ_TYPE_NONE>, <26 IRQ_TYPE_NONE>;
+            };
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/mfd/motorola-cpcap.txt b/Documentation/devicetree/bindings/mfd/motorola-cpcap.txt
deleted file mode 100644
index 18c3fc26ca93..000000000000
--- a/Documentation/devicetree/bindings/mfd/motorola-cpcap.txt
+++ /dev/null
@@ -1,78 +0,0 @@
-Motorola CPCAP PMIC device tree binding
-
-Required properties:
-- compatible		: One or both of "motorola,cpcap" or "ste,6556002"
-- reg			: SPI chip select
-- interrupts		: The interrupt line the device is connected to
-- interrupt-controller	: Marks the device node as an interrupt controller
-- #interrupt-cells	: The number of cells to describe an IRQ, should be 2
-- #address-cells	: Child device offset number of cells, should be 1
-- #size-cells		: Child device size number of cells, should be 0
-- spi-max-frequency	: Typically set to 3000000
-- spi-cs-high		: SPI chip select direction
-
-Optional subnodes:
-
-The sub-functions of CPCAP get their own node with their own compatible values,
-which are described in the following files:
-
-- Documentation/devicetree/bindings/power/supply/cpcap-battery.yaml
-- Documentation/devicetree/bindings/power/supply/cpcap-charger.yaml
-- Documentation/devicetree/bindings/regulator/cpcap-regulator.txt
-- Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml
-- Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
-- Documentation/devicetree/bindings/rtc/cpcap-rtc.txt
-- Documentation/devicetree/bindings/leds/leds-cpcap.txt
-- Documentation/devicetree/bindings/iio/adc/motorola,cpcap-adc.yaml
-
-The only exception is the audio codec. Instead of a compatible value its
-node must be named "audio-codec".
-
-Required properties for the audio-codec subnode:
-
-- #sound-dai-cells = <1>;
-- interrupts		: should contain jack detection interrupts, with headset
-			  detect interrupt matching "hs" and microphone bias 2
-			  detect interrupt matching "mb2" in interrupt-names.
-- interrupt-names	: Contains "hs", "mb2"
-
-The audio-codec provides two DAIs. The first one is connected to the
-Stereo HiFi DAC and the second one is connected to the Voice DAC.
-
-Example:
-
-&mcspi1 {
-	cpcap: pmic@0 {
-		compatible = "motorola,cpcap", "ste,6556002";
-		reg = <0>;	/* cs0 */
-		interrupt-parent = <&gpio1>;
-		interrupts = <7 IRQ_TYPE_EDGE_RISING>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		spi-max-frequency = <3000000>;
-		spi-cs-high;
-
-		audio-codec {
-			#sound-dai-cells = <1>;
-			interrupts-extended = <&cpcap 9 0>, <&cpcap 10 0>;
-			interrupt-names = "hs", "mb2";
-
-			/* HiFi */
-			port@0 {
-				endpoint {
-					remote-endpoint = <&cpu_dai1>;
-				};
-			};
-
-			/* Voice */
-			port@1 {
-				endpoint {
-					remote-endpoint = <&cpu_dai2>;
-				};
-			};
-		};
-	};
-};
-
-- 
2.51.0


