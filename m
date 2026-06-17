Return-Path: <linux-rtc+bounces-6694-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fvSJF5tzMmqz0AUAu9opvQ
	(envelope-from <linux-rtc+bounces-6694-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 12:14:51 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C83EB69858D
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 12:14:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=p1cCfdDG;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6694-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6694-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 34F963048614
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 10:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 219F33D3CF0;
	Wed, 17 Jun 2026 10:10:21 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11EE2EEE68
	for <linux-rtc@vger.kernel.org>; Wed, 17 Jun 2026 10:10:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781691021; cv=none; b=cGvx8IeC6CV1H8GLuJOccY5YA33ajJTkDxqD32Bhp0gVJKUYL1rmvBCHZLAdcttwRoqsycyQYB5h2AvKDMmcMw92yoHukFN628TgnkuwMex6b52RvFUKPGbbS5aL0DrgS5JaNRWTLQjUs/minusNIMqT5qsfcqo0J0YZ4uG4nBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781691021; c=relaxed/simple;
	bh=oo2RMmYDDGAoMzh4h5N1TaRg09MMeeFSF6+LCAZqaPE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hdCOW48pfzNtouxgknIEBwcA7IQKNxb6lk8LJu1GFOHjSf8o3+XGT+Cj89hOGxS4RhbRPr/vqwUEKJcnwI3vbdXc1e4wz49OI62yW1wwoWENmOSYQ1UV1+78382cVhHJxQEHK6MJxCMmzZybpS2mqKmeDq77aGnmPQW40TWCG4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p1cCfdDG; arc=none smtp.client-ip=209.85.210.176
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8423efad617so3422982b3a.0
        for <linux-rtc@vger.kernel.org>; Wed, 17 Jun 2026 03:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781691019; x=1782295819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GfxOJ/wQsZ6xNUFAjtEqeEErjs+UMQ+M9yh0ZUlY/kE=;
        b=p1cCfdDGhI0uuxbfvfNS9SKgAQVtuZ5l/eWoFl5jqLFDCk3wX5oncea8UiUDIDBbeH
         +MUIpdAjEroin1G4UssdeQo26qOwY+x/KxRlaR8pYMq9lVl1xfV3QLiMALKYUqvdCJFP
         ZciuO6ahVbab9e0cuxEu7YkcXOhVg8EMtKFQBtweyg4hs37gkXgQiSoE2u3m9z9cpyl5
         rRGuxziJOjD3mH8lfch/kure/fphUAzuHBFai2ijH/fIxkdo1mYwVIAdu0NNsRdHHCpg
         tfhuqv4S6SAaB3Jn/iUoQKsy9cYxmsDKpDzslF/zGl5VFwAyJDfSQnI5w00As9V4Zdkg
         OWyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781691019; x=1782295819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GfxOJ/wQsZ6xNUFAjtEqeEErjs+UMQ+M9yh0ZUlY/kE=;
        b=FCAaMAuokj+F/3E9lzkB2uBPk03t2+nAoaLB/6sHWPwxqF2Rpj3Hla9VFKdBXBskIx
         G8hsbN/0r4nqRDUQo6WMbj/pMtcAkjyKesO1XyLvQACrMfBS3bgyqS4U2AjCSTX1QII4
         Drdqj+2Whnoezw9vgE4Pqa7SGKxtJswEQknJ/HvIhdFeuwI/QLUx+9ZwFrYNYBsi+R3w
         XxYWNDqy5qTyhyKukCj7oJW0VGJ0vNBlRQmGpLj5lmgh2eJEf2BP4JfynL2E5P3eoq7h
         8nqtpkmSk0lFbS6Q9sRw1vMQ6vT5Xs0Q+r7RTRn1x8L60LH+6wxB/tU6wtIsxd8RceB8
         Blrw==
X-Forwarded-Encrypted: i=1; AFNElJ+mti4U3FLvcz141rMIoPqFq4lXMePl4HSx48wOUu6/cbJip6+BIVDA5kTSn3bFHZ+V+siJv/Xn5zg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsQExnOxp7bmg+wxZQJ8tWLHF0DkX4Cu7XVVArmnioqXbV59eU
	enkfC9b/VrwtpET5mQlWrofGFRU3AKuFVOj3EQBOlEwDCvWoDuzBGaCQAWEQnv/J
X-Gm-Gg: Acq92OEzGBy3t652+pCURtGhEfBxkV9xTV+za/tbZdWEL5uMLL2cuyr35VWuVzd7OAQ
	ip67fKWs7dOwggIUMMTyufFGp5VN/cf+I2xSiFnkHLooUeFuw6WjY4Or+kMfxz6rD5IBLRH+ove
	41du+rSipXA47TfWIf/RY0FFxoI28kQUhCg42v5q7/fdGnLwjtPNi72tE+EgaZfjbiN1Je/Jjz/
	sKNACFSVr1G1hefB4H9fgd0D6i/j5Dca1khZaBTg2mmtV/j4NNs3zBDH25gmbhze+DXF4gvtEg3
	KTmIWF20B/L3shRpE3qL9QnBQN63MWZeO21Tl9Is1IfnmGgAxC2lv4d3700AHJTL83tk/3gnJ6B
	Hxo3Cv/T3TZCwxMZNvJ8cKDMZosFODBqNVFWgahJ1iyIISlBXLHOxa8JCSzh5fx4+DdS1Odew/z
	6/OMx8G2SULD46N8OJnxyyxjp6Zm6Lxw==
X-Received: by 2002:a05:6a00:17a9:b0:842:6004:3fd9 with SMTP id d2e1a72fcca58-84524556a81mr3266186b3a.29.1781691019007;
        Wed, 17 Jun 2026 03:10:19 -0700 (PDT)
Received: from inhnjlux1020.ls.ege.ds ([49.204.164.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b011288sm14026257b3a.44.2026.06.17.03.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:10:18 -0700 (PDT)
From: Udaya Kiran Challa <challauday369@gmail.com>
To: tsbogend@alpha.franken.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Udaya Kiran Challa <challauday369@gmail.com>
Subject: [PATCH v3] spi: dt-bindings: microchip,pic32mzda-spi: Convert to DT schema
Date: Wed, 17 Jun 2026 15:40:09 +0530
Message-Id: <20260617101009.148851-1-challauday369@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,brighamcampbell.com,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6694-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:tsbogend@alpha.franken.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:skhan@linuxfoundation.org,m:me@brighamcampbell.com,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:challauday369@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[challauday369@gmail.com,linux-rtc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[challauday369@gmail.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C83EB69858D

Convert Microchip PIC32 SPI controller devicetree binding
from legacy text format to DT schema.

Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
---
Changelog:
Changes since v2:
- Add cs-gpios to required property

Link to v2: https://lore.kernel.org/all/20260615115311.515404-1-challauday369@gmail.com/

Changes since v1:
- Rename schema file to microchip,pic32mzda-spi.yaml
- Update subject prefix to match SPI DT binding conventions

Link to v1:https://lore.kernel.org/all/20260614175005.435826-1-challauday369@gmail.com/
---
 .../bindings/spi/microchip,pic32mzda-spi.yaml | 82 +++++++++++++++++++
 .../bindings/spi/microchip,spi-pic32.txt      | 34 --------
 2 files changed, 82 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/microchip,pic32mzda-spi.yaml
 delete mode 100644 Documentation/devicetree/bindings/spi/microchip,spi-pic32.txt

diff --git a/Documentation/devicetree/bindings/spi/microchip,pic32mzda-spi.yaml b/Documentation/devicetree/bindings/spi/microchip,pic32mzda-spi.yaml
new file mode 100644
index 000000000000..4669b521fa1f
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/microchip,pic32mzda-spi.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/microchip,pic32mzda-spi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip PIC32MZDA SPI Controller
+
+maintainers:
+  - Thomas Bogendoerfer <tsbogend@alpha.franken.de>
+
+allOf:
+  - $ref: spi-controller.yaml#
+
+properties:
+  compatible:
+    const: microchip,pic32mzda-spi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Fault interrupt
+      - description: Receive interrupt
+      - description: Transmit interrupt
+
+  interrupt-names:
+    items:
+      - const: fault
+      - const: rx
+      - const: tx
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: mck0
+
+  cs-gpios:
+    maxItems: 1
+
+  dmas:
+    items:
+      - description: RX DMA channel
+      - description: TX DMA channel
+
+  dma-names:
+    items:
+      - const: spi-rx
+      - const: spi-tx
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - cs-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi@1f821000 {
+        compatible = "microchip,pic32mzda-spi";
+        reg = <0x1f821000 0x200>;
+        interrupts = <109 IRQ_TYPE_LEVEL_HIGH>,
+                     <110 IRQ_TYPE_LEVEL_HIGH>,
+                     <111 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "fault", "rx", "tx";
+        clocks = <&PBCLK2>;
+        clock-names = "mck0";
+        cs-gpios = <&gpio3 4 GPIO_ACTIVE_LOW>;
+        dmas = <&dma 134>, <&dma 135>;
+        dma-names = "spi-rx", "spi-tx";
+    };
diff --git a/Documentation/devicetree/bindings/spi/microchip,spi-pic32.txt b/Documentation/devicetree/bindings/spi/microchip,spi-pic32.txt
deleted file mode 100644
index 79de379f4dc0..000000000000
--- a/Documentation/devicetree/bindings/spi/microchip,spi-pic32.txt
+++ /dev/null
@@ -1,34 +0,0 @@
-Microchip PIC32 SPI Master controller
-
-Required properties:
-- compatible: Should be "microchip,pic32mzda-spi".
-- reg: Address and length of register space for the device.
-- interrupts: Should contain all three spi interrupts in sequence
-              of <fault-irq>, <receive-irq>, <transmit-irq>.
-- interrupt-names: Should be "fault", "rx", "tx" in order.
-- clocks: Phandle of the clock generating SPI clock on the bus.
-- clock-names: Should be "mck0".
-- cs-gpios: Specifies the gpio pins to be used for chipselects.
-            See: Documentation/devicetree/bindings/spi/spi-bus.txt
-
-Optional properties:
-- dmas: Two or more DMA channel specifiers following the convention outlined
-        in Documentation/devicetree/bindings/dma/dma.txt
-- dma-names: Names for the dma channels. There must be at least one channel
-             named "spi-tx" for transmit and named "spi-rx" for receive.
-
-Example:
-
-spi1: spi@1f821000 {
-        compatible = "microchip,pic32mzda-spi";
-        reg = <0x1f821000 0x200>;
-        interrupts = <109 IRQ_TYPE_LEVEL_HIGH>,
-                     <110 IRQ_TYPE_LEVEL_HIGH>,
-                     <111 IRQ_TYPE_LEVEL_HIGH>;
-        interrupt-names = "fault", "rx", "tx";
-        clocks = <&PBCLK2>;
-        clock-names = "mck0";
-        cs-gpios = <&gpio3 4 GPIO_ACTIVE_LOW>;
-        dmas = <&dma 134>, <&dma 135>;
-        dma-names = "spi-rx", "spi-tx";
-};
-- 
2.34.1


