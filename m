Return-Path: <linux-rtc+bounces-6551-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKcNCs4hDWpptgUAu9opvQ
	(envelope-from <linux-rtc+bounces-6551-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 20 May 2026 04:51:58 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB677586F7B
	for <lists+linux-rtc@lfdr.de>; Wed, 20 May 2026 04:51:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 327E6302CE5B
	for <lists+linux-rtc@lfdr.de>; Wed, 20 May 2026 02:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8905E30BF5C;
	Wed, 20 May 2026 02:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HY4atRlT"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5562F39B8
	for <linux-rtc@vger.kernel.org>; Wed, 20 May 2026 02:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779245515; cv=none; b=VuLgJ+ab8FREEtTf8IlHVvyXH4iGtHyYC2O/Oqb3+DSBe1NpGSZYBDs0mhNFe2lBTPs0aAiXpjUxssxx36gUxWWWryICY5dSlKjAZ6gjH+XJ8Hk0ZEHuj3O2NYd+bmNCp9LqOsJtVVHGymtI33a3SpD2318AmzE+c12a8jxz7do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779245515; c=relaxed/simple;
	bh=IfW1mk1oO65qfqGh1XWmKHmZoIBL9vQ6FHuE2MESpaM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lfgRc9QiU5mRZV8brAmCZadQtbq98aDKL0fJifucIHhtTnmOmyosIgJ8JqM5iHLxJD8uL30XCeFUBktvTB8w3z2mzBl5Sozrw6pwFN75ob+N1fnZM/pXmHuk0MMUTijI7h4yjW73vJAmneZieRLEQpbdLWAiQWJxVVCiqNLXsPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HY4atRlT; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-36622412e97so3092596a91.2
        for <linux-rtc@vger.kernel.org>; Tue, 19 May 2026 19:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779245513; x=1779850313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jx43HXyXFoFdaLMUvboXe6TnzGo/7OAUQHqaJ3dkRtk=;
        b=HY4atRlTShWO9Nn4DbMBDCbKUe/Dq7YugjKhWI9HrqZ1KkSo5PhuelF3ZoNMaVwjqp
         yiZwwqZ5kpUyk45a3IWvTpPUJk3IMZ4wd3RtzNZPAO0MKx2k0c8hc165mPvh3TMD56Z4
         KUUaHvLnc3bPOHfiKIP2GMi+iodNt03NwFBcYe3KmaYSj5YrRTsBNFdaHa7ySLNmqnQQ
         uU3dy5KkAhJbcieBtuNyueXUrVCBDTASWSAIsZ7KWmV0XOtSY2BSvBHi0mjM8B0ibWJG
         fuph15BkPVrkCnQQScBCDYaJbK2ixrkAmq3N+NiwEnVjLmPwEhuBNLZRtAc4MFkF+9/P
         dlHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779245513; x=1779850313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jx43HXyXFoFdaLMUvboXe6TnzGo/7OAUQHqaJ3dkRtk=;
        b=QikvGNwLBjxdiWv7ltAo2p78wh1c9C8SoTXv2AFtGs44+waXTkSz6XoESvs1aprvX1
         iyi3n+WPdA5i4mwnztwSChgUuKXJi7U5vHts59SvScFYUzCUwX0Px8VmiyHFv+S1aOEI
         65GIbTwlbsZGNv+1O4g2XoAsXQH9qak5gYJt+d8+MJLhNvcHPx43SU/vUVacRNWiLJ1W
         liBXM3bUBxwhHH/rPcaMooEdE8upf7SatP3TMM48A0mzR47nxJl7enVtwVu7ugRQ8v4n
         o15AwQqD2ddfbIlI2SocA++xOvqIdJ1wdO5N21lKGRR+o6nr5gpXzIh6DTNVdVagYL2R
         2z8g==
X-Forwarded-Encrypted: i=1; AFNElJ+iXWoqf2VmYw9QtP8MtU5/ZZkq4nIR71txNiHcR95foAw3vLs0M5MUho9PFfw+bSqcdXXEXNIKnb0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCoIk+oenrugqYoKzDF2nmHflAgL908Pw1xARlO2Nwb3y3MLAB
	bidzdFJ0zVP1SkUvCmY/iib7eRTvHHE+daHKB7iszPRY0DCVUjqvVlUb
X-Gm-Gg: Acq92OFgipct4DmJI1M+T9ojuTeK2fbwoRjJT0a7FEzImGrDLhT/HHks7cX8R8k2unK
	KmEqQo3R/HCTqQ2Pj1Lpi1gXJGw3xOrx91abmDJXKeLLanzUAeMs0VTZKqAUVDB3z9Muwz+Lwni
	bovVrn+BZ55kPAget49iQTeAQOzVKSl9GMgfhxVxIK1cBfq8C8CfYLThYDbFy1T7RPF62fit4Ka
	cIBUIiPgS+qUKY4EqN4cnf4MS9tOoNhmkhodZ7kac0gv+Q/jnAk5cAyI5JNBa66GoZmim3Jedn1
	wxVdDPrCpE6NGdxsHpfnYqVNV+wZSRriklT85Tsao0R1L9eReeMeAAiTvfmsdeS2LiHvjXEMBDD
	g4xk33QJuik1PkC+AUXM65362hLr8WqcIDmQwnzFxQF46Q1wmD64NoOVZcMAIRX67wCDUdTzHsC
	n8yn4Uo+qUCndApcL6vKxI3vJvyFJdhXgPh6OFxTwp713AGoWX
X-Received: by 2002:a17:903:1b4e:b0:2b0:c59f:3b58 with SMTP id d9443c01a7336-2bd7e7b58a8mr239228905ad.9.1779245513328;
        Tue, 19 May 2026 19:51:53 -0700 (PDT)
Received: from ultimate.. ([58.84.62.111])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe7270sm198267065ad.50.2026.05.19.19.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 19:51:52 -0700 (PDT)
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
Subject: [PATCH] dt-bindings: clock: via,vt8500: Convert to DT Schema
Date: Wed, 20 May 2026 08:18:53 +0530
Message-ID: <20260520025131.17772-1-challauday369@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,brighamcampbell.com,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6551-lists,linux-rtc=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[challauday369@gmail.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,0.0.0.200:email,baylibre.com:email]
X-Rspamd-Queue-Id: BB677586F7B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert the VIA/Wondermedia VT8500 and Wondermedia WM8xxx series SoCs clock
controller binding from the legacy text format to DT schema.

Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
---
 .../bindings/clock/via,vt8500-clock.yaml      | 122 ++++++++++++++++++
 .../devicetree/bindings/clock/vt8500.txt      |  74 -----------
 2 files changed, 122 insertions(+), 74 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/via,vt8500-clock.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/vt8500.txt

diff --git a/Documentation/devicetree/bindings/clock/via,vt8500-clock.yaml b/Documentation/devicetree/bindings/clock/via,vt8500-clock.yaml
new file mode 100644
index 000000000000..9c312d11a6a7
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/via,vt8500-clock.yaml
@@ -0,0 +1,122 @@
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
+description: |
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
+    maxItems: 1
+    description:
+      Offset of the PLL register within the PMC register space.
+
+  clocks:
+    maxItems: 1
+    description:
+      Parent reference clock.
+
+  "#clock-cells":
+    const: 0
+
+  enable-reg:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Offset of the clock enable register within the PMC register space.
+
+  enable-bit:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 31
+    description:
+      Bit index controlling clock enable.
+
+  divisor-reg:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Offset of the clock divisor register within the PMC register space.
+
+  divisor-mask:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Bitmask describing the divisor field inside divisor-reg.
+
+required:
+  - compatible
+  - "#clock-cells"
+
+allOf:
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
+        - clocks
+
+  - if:
+      properties:
+        compatible:
+          const: via,vt8500-device-clock
+    then:
+      required:
+        - clocks
+      anyOf:
+        - required:
+            - enable-reg
+            - enable-bit
+        - required:
+            - divisor-reg
+
+additionalProperties: false
+
+examples:
+  - |
+    / {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ref25: ref25M {
+            compatible = "fixed-clock";
+            #clock-cells = <0>;
+            clock-frequency = <25000000>;
+        };
+
+        plla: clock@200 {
+            compatible = "wm,wm8650-pll-clock";
+            reg = <0x200>;
+            clocks = <&ref25>;
+            #clock-cells = <0>;
+        };
+
+        clksdhc: clock {
+            compatible = "via,vt8500-device-clock";
+            clocks = <&plla>;
+            divisor-reg = <0x328>;
+            divisor-mask = <0x3f>;
+            enable-reg = <0x254>;
+            enable-bit = <18>;
+            #clock-cells = <0>;
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


