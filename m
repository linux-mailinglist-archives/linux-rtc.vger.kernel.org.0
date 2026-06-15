Return-Path: <linux-rtc+bounces-6656-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jKdcMBvoL2pBIwUAu9opvQ
	(envelope-from <linux-rtc+bounces-6656-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 13:55:07 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9CD685DA6
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 13:55:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Zv9EGHh9;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6656-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6656-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A955F30550BE
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 11:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A4583E557B;
	Mon, 15 Jun 2026 11:53:24 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA9C37D10F
	for <linux-rtc@vger.kernel.org>; Mon, 15 Jun 2026 11:53:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781524404; cv=none; b=iVebWzA6G60tCwZhJhy9vc/SVg65kcM6ZBnisBbyMblpkOGLIVyq3Qc160hVGrn8Gb78PLdIvHB19I99OAMIzMtK0f6ud0yI2ieeVQ5lAlwevJc3sAyEhYk1Wy5Zsvv8VHbQubHbWauzjHrfM44Mdy6iaIkXshV4N1Y7exYO6xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781524404; c=relaxed/simple;
	bh=qNfWhApLIn68knz8jFgKCbSfs3M9muAtHyTZokIKFsM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rFf4K/b4XQAYYUIXUxb0qtgjB3aiYZtgfg6JRkfE0+6eVTihqf5fbMFa26lLsohF4Fmm/3sXfjucNJSbqrTReiLG8S04Ho2RhP6hNoJcJA+4/uE7N3YAZ9gRd5bqgOC45J5B7Lyc5am0zbagy6F9sJHYho/KIwxc4qYiaCS0+b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zv9EGHh9; arc=none smtp.client-ip=209.85.215.174
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c858014845aso1254307a12.1
        for <linux-rtc@vger.kernel.org>; Mon, 15 Jun 2026 04:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781524402; x=1782129202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3hx1U56gKBEpPZcX4BqQywBeXTuW2Sbo3tnS/H99bS0=;
        b=Zv9EGHh9Gs3zCl1bQcpSlZqj6WEW5fAhsDhIssDfjIY2rV1Mn3nEKG3/N34sxcP7Z8
         WhoBd/D53XMF5akt4lHmQ9sRW9DoMnNnTM7PzANvm4fYSdQacO9KoMlqIoOGnQnVgf3u
         5ZrPQMJvA53xktWW0prK8/CFL4KfUr6LMTN+hHxAn4TBun55v5drUK8UgnoWfIIODrO/
         3L9LMbWKVlCHoPJRaW+eXI56jQx1/04dnfgCQrIgOforlunTNqPYQ/HDavQtCazdokwE
         GDplaB+8E7U2aIBz1IhbSHTprXFxxmy2xIpuN2fcBm+JDlTFCcdywPU9w7gSfxwuUqGr
         JEig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781524402; x=1782129202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3hx1U56gKBEpPZcX4BqQywBeXTuW2Sbo3tnS/H99bS0=;
        b=oRXo8Y7kae/tHackWrltSgDT/JF9awMfhx+610YC71aSKQ5cTxqwjvxwT09fFo6gsI
         GumEfrfJbgMManKdrH1o08GogarUdaRJAwDC6FoF4R9UGC1ZPCmqdFAUXwusAdV4WgAH
         pGMHj/LUX2Uhf3zbifAc8Ij7xcY15uihh6LisDgJ0loH6pksXN+Na3GBvIAxGaGw/xBP
         7zGDOEYsGM1hxIO77KvAr8MevTPzWRHzvdE8heb3TXvruaZtAb9tsn6h5qc9eV+zREwd
         aLjPQGjo2xG4BTZzA274M4CgBndtZ7+knLLLLTEt14n5f86PbMB88YdQj12WoE/bipzW
         36ZQ==
X-Forwarded-Encrypted: i=1; AFNElJ+XJjs+9YohL+AsL1bZkrPNsSvIPPHJPfoA562SYxtCkReCoIcJPvqEJrc2kH+Yq3mRYWoWm/v9118=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIXjrtkbL9J0uxzV10kKnUcHWixUZ3mZ5pDfSwp8JFU7sjkian
	BZXgp8//Syksd0l3pXILyx6Gi7Ksy2CeiJq06xrlGzFNabUC0KGNSFaV
X-Gm-Gg: Acq92OF2UyTq+9KfRRakUFzJlHOv9Ibd5HX7PGI024T8CiFHzExjkBgZ6q53jDyoM9w
	Gm/zShXN2n0no3fPf81QF1umUDH2splc6yLC7mH5c5JT07p1udTMq4sYNkYlaAS0fIq1UMTmO1V
	fGO/+QVZwvC5wzM95VcNPy7cc8I5Gqc7ha9FT5w/9RzC52z8FB/CIzLP4YJ8eVJbo64EqG/G/5a
	7TuXe6QF35FqEYEkKEiiqt4Bm33zEb0JQYAtMlrhQ8/AHpQ/D5l6n5zfsMhuShlFDSKDM2mBOzF
	2ZnCeNRKuB9aXMRTs3j/F2+tbW2hbBRDRwLGyEFJ8MmQ3S1f7EiWqmkjKMaAPl5AzXpUiyew/zg
	PmCOyAGanYKZgNvSj4FCuIKG8PkuI76R2TztoQIsBBGDhgbQ0ZJ97xa44pLuU/5Kfvfv6kz1j/c
	pP0nxvdZWxYcdS/NLOzloChs0En/JYuCaOcoHBrZqXOy8qhVdcewOj
X-Received: by 2002:a05:6a21:458b:b0:38e:92f6:9ab1 with SMTP id adf61e73a8af0-3b78588b46fmr11919000637.22.1781524401875;
        Mon, 15 Jun 2026 04:53:21 -0700 (PDT)
Received: from inhnjlux1020.ls.ege.ds ([117.231.200.47])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c86651adc16sm8242645a12.31.2026.06.15.04.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 04:53:21 -0700 (PDT)
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
Subject: [PATCH v2] spi: dt-bindings: microchip,pic32mzda-spi: Convert to DT schema
Date: Mon, 15 Jun 2026 17:23:11 +0530
Message-Id: <20260615115311.515404-1-challauday369@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,brighamcampbell.com,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6656-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:tsbogend@alpha.franken.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:skhan@linuxfoundation.org,m:me@brighamcampbell.com,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:challauday369@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[challauday369@gmail.com,linux-rtc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,franken.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1C9CD685DA6

Convert Microchip PIC32 SPI controller devicetree binding
from legacy text format to DT schema.

Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
---
Changelog:
Changes since v1:
- Rename schema file to microchip,pic32mzda-spi.yaml
- Update subject prefix to match SPI DT binding conventions

Link to v1: https://lore.kernel.org/all/20260614175005.435826-1-challauday369@gmail.com/
---
 .../bindings/spi/microchip,pic32mzda-spi.yaml | 78 +++++++++++++++++++
 .../bindings/spi/microchip,spi-pic32.txt      | 34 --------
 2 files changed, 78 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/microchip,pic32mzda-spi.yaml
 delete mode 100644 Documentation/devicetree/bindings/spi/microchip,spi-pic32.txt

diff --git a/Documentation/devicetree/bindings/spi/microchip,pic32mzda-spi.yaml b/Documentation/devicetree/bindings/spi/microchip,pic32mzda-spi.yaml
new file mode 100644
index 000000000000..a0a182cdccbd
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/microchip,pic32mzda-spi.yaml
@@ -0,0 +1,78 @@
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


