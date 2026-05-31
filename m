Return-Path: <linux-rtc+bounces-6595-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBZPALxrHGoSNwkAu9opvQ
	(envelope-from <linux-rtc+bounces-6595-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 31 May 2026 19:11:24 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A426174BF
	for <lists+linux-rtc@lfdr.de>; Sun, 31 May 2026 19:11:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F136930131E7
	for <lists+linux-rtc@lfdr.de>; Sun, 31 May 2026 17:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4623921FA;
	Sun, 31 May 2026 17:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c+LpNkFU"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E116E2DCC08
	for <linux-rtc@vger.kernel.org>; Sun, 31 May 2026 17:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780247471; cv=none; b=N86bTmLF3MEtFaaCh4oY2d+wxfMrJa2mgOGApGywjJkzIxp9Aco6rXjFgJWkxDhPYbf/Vs7uSBXFwr5XcZ3gv2qScBvKr/K/xKetKUoD+vfaImxKA80JxT+4f1kf+vHD/tRe7xgq1Zx6xl3boAF30YmzIb5zFF2GoSPf1w97RFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780247471; c=relaxed/simple;
	bh=zZmnDGXA0rjd7t+4m0wzAeMbNljHZ9els6ULfCQTEQA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YbkK+pkCxWqfHNs+UNUo6l1QfXmg8cHrbPchanucGuj+h0i0gZk44o5Z2tNd2jycOduvcrWT4ZxqmAf5fCIuM/jP8yJYfvtqe8fVpfOHFhRL8JgxA0X0Kvt6RYbfx7+xlPS1tsYYIjWZjnZIHjWQ3TPh6HpA4eif0dFBAS6DOAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c+LpNkFU; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-36bb3551f6eso2321387a91.1
        for <linux-rtc@vger.kernel.org>; Sun, 31 May 2026 10:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780247469; x=1780852269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ws/VbADK0GzMeGV08WlLARgSCxKJf8L/Iez7FqjR8aU=;
        b=c+LpNkFUTMY5gRKY83Hs6iuVyqvdQu6ttgfJZjY/HrcNKfuqrPSk6XupNNoJspZl6g
         EPVBrk1KqH8UhrcvDKh9A41fMt9mU7XBRFXPX3XEEcT6IQweVktOS48hI/Z6iNiXfSm4
         UW+kzAdueAqn3QYCxo/RECAwOtCUHa2C/RWztBoRJ0ksU35kXdqrbBPh5A9mOrEgOTAB
         yqRTrrcRPremi4whR+lWXTuQmvqVAe0LPjopa7N/IwuZLsttPwwBfX/7fshE1Og1tNrc
         jiRKCDAUanzr6R7TG5DVr5uhZPswUs57hwbkCAi6H14SlZjuOZqhYwN06SY8DMVmW8qG
         bbCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780247469; x=1780852269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ws/VbADK0GzMeGV08WlLARgSCxKJf8L/Iez7FqjR8aU=;
        b=eVwUTBh5tOQtoea///gwvdO/MAPgLr+WmW2TMv8Y3nqXIbhRyMX7C65C8jXjrzXNZ4
         nw92MMVlVjqlX2hkXH4B/r5C1PJdUnuqRyePr1zNDSJtp+9z5zJjAMoRALt5+UbalX57
         xQ37XK/Ik3XFqiQhVBZ79xPK2DrbqgJ3aACi28VxiRFWbYeaW/n+t9UcvASx+Dz96uMb
         S299vItkEnwrAIUUBKpfYGerkloC3EST3zOK4xfnW+KKrryfkheh6Z4GVaYOCpsLGWDh
         r9Y17sCzCxuSz3kQIPLFfajganxjET0yJaQeQr+upjQ2BLE6pl0qIiQaJV+amfj2gRjb
         sTeQ==
X-Forwarded-Encrypted: i=1; AFNElJ8PV5JyxndWkKIp/HaqgALuYlKBa9+MIVnQvxY6wbBEBKdJ65hHhZjLahcU7v64C9eJoPLxIW5F8FI=@vger.kernel.org
X-Gm-Message-State: AOJu0YznJQoAEAn9Sx7HseNrPxmqz1IodxYmlHNLn6vOoW55IWCVsg/O
	8INWbWCwUXsC9svelqS047CzFVaoWjyGw/wQvkY5Ep/YDMuWGEYdIS8uI6zg3lr7
X-Gm-Gg: Acq92OEw5A+11zLsozzmT/i+V263tXSRfx6eHJM4ViOfZIKh7a5KxkAwHjnWOVFF29h
	th92z9sgpeQ8FoanXYfGeal1rRzjlHYEX+WGtDLRS1WHFd3phe8FK95MUBy7hk9pZWfFuQzzylR
	ZYdbViZHLCrTGrFcJL+4+8sg8tA17iChUvj4nzwvzZblSoE5AiE4ZNe80SJ1TafvgHTjtuLLPib
	9oH4LtPK9PVYGd8aCPopVpRBvuF4umzXRP1kWcEyPgmI4u8CbB0/wc3hjidaiv0dEsBBrWaG7eg
	ZX1zhgDMed7m7Y1PE8JMREOdvON2Zl0+diLxVNbJaB/R7g0CtlrREJDH24643k7vpg5k7+qT1RE
	5IKYYbUicEPeM0eYr6cCUcCK6m4WdcZ+rtRG/BXV8HFd/8PIDlCrmvtOC+63XZQFWGX0oDEvUYf
	DBPIVlcPxDvVVekhp6sMngOqFjL7wp6wWzJYlG9d5CvDqXr9SEmgy6DBNT4fJo
X-Received: by 2002:a05:6300:2204:b0:3b3:26aa:5462 with SMTP id adf61e73a8af0-3b427c15679mr8366825637.5.1780247468937;
        Sun, 31 May 2026 10:11:08 -0700 (PDT)
Received: from ultimate.. ([49.204.165.28])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85770b9e2esm7565285a12.0.2026.05.31.10.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 10:11:08 -0700 (PDT)
From: Udaya Kiran Challa <challauday369@gmail.com>
To: alchark@gmail.com,
	krzk@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Udaya Kiran Challa <challauday369@gmail.com>
Subject: [PATCH v5] dt-bindings: clock: via,vt8500: Convert to DT Schema
Date: Sun, 31 May 2026 22:39:55 +0530
Message-ID: <20260531171041.4149-1-challauday369@gmail.com>
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,brighamcampbell.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6595-lists,linux-rtc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[challauday369@gmail.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.204:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,0.0.0.200:email]
X-Rspamd-Queue-Id: 54A426174BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert the VIA/Wondermedia VT8500 and Wondermedia WM8xxx series SoCs clock
controller binding from the legacy text format to DT schema.

Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
---
Changelog:
Changes since v4:
- Remove schema select matching for via,vt8500-pmc
- Add dependentRequired validation for divisor-mask
- Fix maintainers list
- Add reg false condition for device clock
- Fix example validation against clocks child node

Link to v4:https://lore.kernel.org/all/20260524151110.21277-1-challauday369@gmail.com/

Changes since v3:
- Add schema select matching for via,vt8500-pmc
- Allow hyphen in node names under patternProperties
- Add dependentRequired validation for enable-reg/enable-bit
- Fix example validation against PMC schema

Link to v3:https://lore.kernel.org/all/20260524111813.39810-1-challauday369@gmail.com/

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
 .../bindings/clock/via,vt8500-clock.yaml      | 133 ++++++++++++++++++
 .../devicetree/bindings/clock/vt8500.txt      |  74 ----------
 2 files changed, 133 insertions(+), 74 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/via,vt8500-clock.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/vt8500.txt

diff --git a/Documentation/devicetree/bindings/clock/via,vt8500-clock.yaml b/Documentation/devicetree/bindings/clock/via,vt8500-clock.yaml
new file mode 100644
index 000000000000..e2e674d95654
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/via,vt8500-clock.yaml
@@ -0,0 +1,133 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/via,vt8500-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: VIA/Wondermedia VT8500 Clock Controller
+
+maintainers:
+  - Alexey Charkov <alchark@gmail.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
+
+description:
+  Clock controller bindings for VIA/Wondermedia VT8500 and Wondermedia WM8xxx
+  series SoCs.
+
+properties:
+  compatible:
+    enum:
+      - via,vt8500-pll-clock
+      - wm,wm8650-pll-clock
+      - wm,wm8750-pll-clock
+      - wm,wm8850-pll-clock
+      - via,vt8500-device-clock
+
+  reg:
+    description: Offset of the PLL register within the PMC register space.
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 0
+
+  clock-output-names:
+    maxItems: 1
+
+  enable-reg:
+    description: Offset of the clock enable register within the PMC register space.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  enable-bit:
+    description: Bit index controlling clock enable.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 31
+
+  divisor-reg:
+    description: Offset of the clock divisor register within the PMC register space.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  divisor-mask:
+    description: Bitmask describing the divisor field inside divisor-reg.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0x1f
+
+required:
+  - compatible
+  - clocks
+  - "#clock-cells"
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: via,vt8500-device-clock
+    then:
+      properties:
+        reg: false
+      anyOf:
+        - required:
+            - enable-reg
+            - enable-bit
+        - required:
+            - divisor-reg
+  - if:
+      properties:
+        compatible:
+          enum:
+            - via,vt8500-pll-clock
+            - wm,wm8650-pll-clock
+            - wm,wm8750-pll-clock
+            - wm,wm8850-pll-clock
+    then:
+      required:
+        - reg
+
+dependentRequired:
+  enable-reg:
+    - enable-bit
+  enable-bit:
+    - enable-reg
+  divisor-mask:
+    - divisor-reg
+
+additionalProperties: false
+
+examples:
+  - |
+    clocks {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ref25: clock-25000000 {
+            compatible = "fixed-clock";
+            clock-frequency = <25000000>;
+            #clock-cells = <0>;
+        };
+
+        plla: clock@200 {
+            compatible = "wm,wm8650-pll-clock";
+            reg = <0x200>;
+            clocks = <&ref25>;
+            #clock-cells = <0>;
+        };
+
+        pllb: clock@204 {
+            compatible = "wm,wm8650-pll-clock";
+            reg = <0x204>;
+            clocks = <&ref25>;
+            #clock-cells = <0>;
+        };
+
+        clksdhc: sdhc {
+            compatible = "via,vt8500-device-clock";
+            clocks = <&pllb>;
+            #clock-cells = <0>;
+            divisor-reg = <0x328>;
+            divisor-mask = <0x3f>;
+            enable-reg = <0x254>;
+            enable-bit = <18>;
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


