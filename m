Return-Path: <linux-rtc+bounces-6568-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id PF82CZLeEmq14wYAu9opvQ
	(envelope-from <linux-rtc+bounces-6568-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 24 May 2026 13:18:42 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF745C22D1
	for <lists+linux-rtc@lfdr.de>; Sun, 24 May 2026 13:18:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6080330034BE
	for <lists+linux-rtc@lfdr.de>; Sun, 24 May 2026 11:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E98B3914E1;
	Sun, 24 May 2026 11:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZrHWjKA9"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8CDEEB3
	for <linux-rtc@vger.kernel.org>; Sun, 24 May 2026 11:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779621516; cv=none; b=KIYdpiYc59nySrPOdA7AJnXZqwap7s9yP4bNMeoMei7Klzi/1+euHuLNtoobnZzCjYu7vhOypdiqfKaEnghY7/nVOADCRGsmwY5VPKJL/2F0JOOsSPsOn4LXn+7WlV4eurNrFhFUNEElExDxu46nA7T3PC554ZGSoPfVdu+AbUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779621516; c=relaxed/simple;
	bh=CHATorjyQpgQ/fhEozlEM6x0MvgyFf4iyz8arn020Bo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uujyO0YG4Te+R2DUvSwuBSWP2pJ2DczYbKmH/u821hrd3+I1oR9EQAoGVh/IIqXXG/B1vgmpLhz8IUylqUXtVBuY2hXJSWlwOKwwZI+oMpse4KaIavF6Cnm/XDf1jlM6ooezPCTN9Aki8EMsNIKQwrjVnBC7ZTX/vDtImL8mFCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZrHWjKA9; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c8021c8c42fso3623401a12.3
        for <linux-rtc@vger.kernel.org>; Sun, 24 May 2026 04:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779621514; x=1780226314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eU0+SkmrbUn90zbLT84Dxx/HgkuMHPwIrdZYYepcKqU=;
        b=ZrHWjKA9BwRbj9bEcm1x9qa+gzTHiwKOKsEa5KAEOmhQN5dBLsbVybvUZkDzKo2j32
         tUchYF9eNy7xC4ka9vZdi7/Who1fbWu4b4rmGgv1g2350zK1PadDduBCsSuJcUufom5X
         8P2pK6Fo4dMFsKAzjORQrKorJ/HVVc3pQsNORBxhsqYlbUSFqz64U1JM9rTzuhIgJnw/
         4QYutgz36K2TIMa1/HKc+STha5fUUagY91bosARauOC+ayO6759GLDXU2iROqcUrc9uI
         pOGVPEmvAO/hwbDpS1O/XgUa3gCbIq8fMsSaDYGLpwTcqnHCoUQ2q9W1/u34SGd+sciu
         QTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779621514; x=1780226314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eU0+SkmrbUn90zbLT84Dxx/HgkuMHPwIrdZYYepcKqU=;
        b=JwatQZ8UvJz75+WkIEqalNeH+FfGSGX5PDyaW23dHgS6ZXdBpGyimocVsZE32bZCfc
         +FQJO1/Qdbrc5k6AbqaxFTUOgtnPOeK7j8U1JNsbqWd6IKvj+BkhUwpCcSvNsI/M4J+h
         6hv87AG5wcuo+Rb+hiEqMt7gx4ORlAMm1HCF/CXPB3dilBFP3fPK33JcxzanZinJJSN0
         zEUsTHdl1opLJu13402Bkr47UFHxHEZ4C86EH/0mAkg/iTmaq5IpTtFhxD3rEinD8kf5
         zQh9T86CObsJWAaKsOXYtLaAEh/5lQWKdx37Fr5YVouwBu9DRMdLr8EFdn9NEAwTr+4q
         Gy7A==
X-Forwarded-Encrypted: i=1; AFNElJ91jWAlHd0vE+sNS31ITzJjc6noYmcdFizmBs01OUzpN2/jve2uZc40EOlG+R2LV0KzOFc3JQ0LaKU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw25x6aJgwmeYpLtJ2AZJj0+C5NIy7ZVaBPoIQ824Szhd2okUq4
	IfqDNVY1eFvGc4MXCKJhZCx8AIZne4Z49f63iRLHKGAzxInmKfhz4UME
X-Gm-Gg: Acq92OGs2DY6yjOw2FovJCVwYCJGzOZNR52JCRHbX44ywCaGlqKi7P3caEjpy3kic3m
	qhgjBhjZ0j/zdAi0nnvEt/vcuimhrMrhSA/zECOONZ3wdFjf4FLwwQ84dsYrVETmMK7wnvSo8k2
	lm45l7Ke81PLZsbVqSHoWV2Grqwg+lHsmeeuzhP37UuJdJ3m8kGEvXHzuZGp/FBOzd7nj3jnABp
	YwEDsmUp2J/nmgNF3mIZwXHSwaXoeItHUjzuzFSFRGfHTC61chEJnMYaLttCbg2KspY2kF7uSjF
	7wnOIwlTjB/tltJM1l+stvK1yqk62nHVWrhYPENbORhnd8HEEiZBtfBwSzjLpNVW752dbx40PeH
	wuk6NBiVCdFQPKaNUyCdH+O2w1UmYKF8K7mhc5EXbGMUSCKETvYbvyM8axnnk8MhREOQE1O7EJ9
	VnQiUwbeKOkEO9luKuP745wiNdnbIyFIObkMdstacrXsm6BQTU
X-Received: by 2002:a17:902:d48e:b0:2ba:5a20:1d94 with SMTP id d9443c01a7336-2beb059944cmr114950745ad.13.1779621514232;
        Sun, 24 May 2026 04:18:34 -0700 (PDT)
Received: from ultimate.. ([58.84.60.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56958c8sm62453205ad.13.2026.05.24.04.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 04:18:33 -0700 (PDT)
From: Udaya Kiran Challa <challauday369@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Udaya Kiran Challa <challauday369@gmail.com>
Subject: [PATCH v3] dt-bindings: clock: via,vt8500: Convert to DT Schema
Date: Sun, 24 May 2026 16:47:57 +0530
Message-ID: <20260524111813.39810-1-challauday369@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,brighamcampbell.com,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6568-lists,linux-rtc=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[challauday369@gmail.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,0.0.0.200:email,d8130000:email,baylibre.com:email,devicetree.org:url]
X-Rspamd-Queue-Id: 0EF745C22D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert the VIA/Wondermedia VT8500 and Wondermedia WM8xxx series SoCs clock
controller binding from the legacy text format to DT schema.

Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
---
Changelog:
Changes since v2:
- Drop redundant description for clocks
- Disable reg property for device clocks
- Fix schema hierarchy to match actual DTS structure

Link to v2:https://lore.kernel.org/all/20260521170810.19702-1-challauday369@gmail.com/

Changes since v1:
- Add default value for divisor-mask
- Add required properties compatible and model
- Fix example node name
- Update example size cells and reg value

Link to v1:https://lore.kernel.org/all/20260520025131.17772-1-challauday369@gmail.com/
---
 .../bindings/clock/via,vt8500-clock.yaml      | 179 ++++++++++++++++++
 .../devicetree/bindings/clock/vt8500.txt      |  74 --------
 2 files changed, 179 insertions(+), 74 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/via,vt8500-clock.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/vt8500.txt

diff --git a/Documentation/devicetree/bindings/clock/via,vt8500-clock.yaml b/Documentation/devicetree/bindings/clock/via,vt8500-clock.yaml
new file mode 100644
index 000000000000..035925969655
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/via,vt8500-clock.yaml
@@ -0,0 +1,179 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/via,vt8500-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: VIA/Wondermedia VT8500 Clock Controller
+
+maintainers:
+  - Michael Turquette <mturquette@baylibre.com>
+  - Stephen Boyd <sboyd@kernel.org>
+
+description:
+  Clock controller bindings for VIA/Wondermedia VT8500 and Wondermedia WM8xxx
+  series SoCs.
+
+properties:
+  clocks:
+    type: object
+    additionalProperties: true
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+
+    patternProperties:
+      "^[a-z0-9]+(@[0-9a-f]+)?$":
+        type: object
+
+        properties:
+          compatible:
+            enum:
+              - via,vt8500-pll-clock
+              - wm,wm8650-pll-clock
+              - wm,wm8750-pll-clock
+              - wm,wm8850-pll-clock
+              - via,vt8500-device-clock
+
+          reg:
+            maxItems: 1
+            description:
+              Offset of the PLL register within the PMC register space.
+
+          clocks:
+            maxItems: 1
+
+          "#clock-cells":
+            const: 0
+
+          enable-reg:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description:
+              Offset of the clock enable register within the PMC
+              register space.
+
+          enable-bit:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            maximum: 31
+            description:
+              Bit index controlling clock enable.
+
+          divisor-reg:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description:
+              Offset of the clock divisor register within the PMC
+              register space.
+
+          divisor-mask:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            default: 0x1f
+            description:
+              Bitmask describing the divisor field inside divisor-reg.
+
+        required:
+          - compatible
+          - "#clock-cells"
+
+        allOf:
+          - if:
+              properties:
+                compatible:
+                  enum:
+                    - via,vt8500-pll-clock
+                    - wm,wm8650-pll-clock
+                    - wm,wm8750-pll-clock
+                    - wm,wm8850-pll-clock
+            then:
+              required:
+                - reg
+                - clocks
+
+          - if:
+              properties:
+                compatible:
+                  const: via,vt8500-device-clock
+            then:
+              properties:
+                reg: false
+
+              required:
+                - clocks
+
+              anyOf:
+                - required:
+                    - enable-reg
+                    - enable-bit
+
+                - required:
+                    - divisor-reg
+
+        additionalProperties: false
+
+required:
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    pmc@d8130000 {
+        compatible = "via,vt8500-pmc";
+        reg = <0xd8130000 0x1000>;
+
+        clocks {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ref24: clock-24000000 {
+                compatible = "fixed-clock";
+                #clock-cells = <0>;
+                clock-frequency = <24000000>;
+            };
+
+            ref25: clock-25000000 {
+                compatible = "fixed-clock";
+                #clock-cells = <0>;
+                clock-frequency = <25000000>;
+            };
+
+            plla: clock@200 {
+                compatible = "wm,wm8650-pll-clock";
+                #clock-cells = <0>;
+                clocks = <&ref25>;
+                reg = <0x200>;
+            };
+
+            clkarm: arm {
+                compatible = "via,vt8500-device-clock";
+                #clock-cells = <0>;
+                clocks = <&plla>;
+                divisor-reg = <0x300>;
+            };
+
+            clkuart0: uart0 {
+                compatible = "via,vt8500-device-clock";
+                #clock-cells = <0>;
+                clocks = <&ref24>;
+                enable-reg = <0x250>;
+                enable-bit = <1>;
+            };
+
+            clksdhc: sdhc {
+                compatible = "via,vt8500-device-clock";
+                #clock-cells = <0>;
+                clocks = <&plla>;
+                divisor-reg = <0x328>;
+                divisor-mask = <0x3f>;
+                enable-reg = <0x254>;
+                enable-bit = <18>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/clock/vt8500.txt b/Documentation/devicetree/bindings/clock/vt8500.txt
deleted file mode 100644
index 91d71cc0314a..000000000000
--- a/Documentation/devicetree/bindings/clock/vt8500.txt
+++ /dev/null
@@ -1,74 +0,0 @@
-Device Tree Clock bindings for arch-vt8500
-
-This binding uses the common clock binding[1].
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-Required properties:
-- compatible : shall be one of the following:
-	"via,vt8500-pll-clock" - for a VT8500/WM8505 PLL clock
-	"wm,wm8650-pll-clock" - for a WM8650 PLL clock
-	"wm,wm8750-pll-clock" - for a WM8750 PLL clock
-	"wm,wm8850-pll-clock" - for a WM8850 PLL clock
-	"via,vt8500-device-clock" - for a VT/WM device clock
-
-Required properties for PLL clocks:
-- reg : shall be the control register offset from PMC base for the pll clock.
-- clocks : shall be the input parent clock phandle for the clock. This should
-	be the reference clock.
-- #clock-cells : from common clock binding; shall be set to 0.
-
-Required properties for device clocks:
-- clocks : shall be the input parent clock phandle for the clock. This should
-	be a pll output.
-- #clock-cells : from common clock binding; shall be set to 0.
-
-
-Device Clocks
-
-Device clocks are required to have one or both of the following sets of
-properties:
-
-
-Gated device clocks:
-
-Required properties:
-- enable-reg : shall be the register offset from PMC base for the enable
-	register.
-- enable-bit : shall be the bit within enable-reg to enable/disable the clock.
-
-
-Divisor device clocks:
-
-Required property:
-- divisor-reg : shall be the register offset from PMC base for the divisor
-	register.
-Optional property:
-- divisor-mask : shall be the mask for the divisor register. Defaults to 0x1f
-	if not specified.
-
-
-For example:
-
-ref25: ref25M {
-	#clock-cells = <0>;
-	compatible = "fixed-clock";
-	clock-frequency = <25000000>;
-};
-
-plla: plla {
-	#clock-cells = <0>;
-	compatible = "wm,wm8650-pll-clock";
-	clocks = <&ref25>;
-	reg = <0x200>;
-};
-
-sdhc: sdhc {
-	#clock-cells = <0>;
-	compatible = "via,vt8500-device-clock";
-	clocks = <&pllb>;
-	divisor-reg = <0x328>;
-	divisor-mask = <0x3f>;
-	enable-reg = <0x254>;
-	enable-bit = <18>;
-};
-- 
2.43.0


