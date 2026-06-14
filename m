Return-Path: <linux-rtc+bounces-6646-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vr00MP/pLmpQ6AQAu9opvQ
	(envelope-from <linux-rtc+bounces-6646-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 14 Jun 2026 19:50:55 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 26377681D1C
	for <lists+linux-rtc@lfdr.de>; Sun, 14 Jun 2026 19:50:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=bNkimD8N;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6646-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6646-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF44A300EF40
	for <lists+linux-rtc@lfdr.de>; Sun, 14 Jun 2026 17:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E905D3A3821;
	Sun, 14 Jun 2026 17:50:40 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1933D31714B
	for <linux-rtc@vger.kernel.org>; Sun, 14 Jun 2026 17:50:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781459440; cv=none; b=LYEa6XrmAiYEeq+zDCkeK/fOns+/yyiAIXpzVukv+Px8ufxzRq9IeuYI+qCmsnUDj1EPAE6mNhsr2bYllLXlXnACRVq7GtKar5NuuseYei2tx5v4M3MnWPogQP29O2qarLLsTh1gzlCWTyxjSNML8oR21tT8oOFLBM1Rid5xuHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781459440; c=relaxed/simple;
	bh=mZqoP8B2KhwXFXwkQ80xxlpxRKflgVCHXYzMoDnt1o8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rz+VOvVh1t/aoQFd2fLeNmK4qmKOUsVXtD7fxF5BzniCg7HbyNlxZDcMf3Y1UnIw0IPYSRkO9gnj1O84wvST/1wArg/4Cunys9ja0rhLLgOeKTLuz8ulmoAG+5zEJWX/KvjJXleCqcSq/tYi91qSVIdS54j96t8a7dGvmfXB7ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bNkimD8N; arc=none smtp.client-ip=209.85.215.177
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c855599a77aso1165194a12.0
        for <linux-rtc@vger.kernel.org>; Sun, 14 Jun 2026 10:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781459437; x=1782064237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+hcsnUGTB2wQ326+1MHHf35X3iGgQO7l4/OOgtUgNTs=;
        b=bNkimD8Nx3B4/PL9gctOq4FWQ82/V0kMgaDOcauG0IS+ngFob/pvgeWzfEIjkuwE0N
         d3JRsRVKOwt3dNz0MTG+nYJiquA3616cluXLnzIV5HIRJMoJVsEw9J5v8dw8kvI9pMad
         Sd0R4QuYseJDdxpv6Oy9Vl/cGhwtBrQVz/2wxRf2uA+rnYgdzLXucbEuqHFMHkfH23t4
         2JZ6U6+LLdBmS83PPiLRp4wRFCajtgxZl6enIMhvbCD/dVh72AZ1r5iiRQGdOZ7ZTibd
         JzYZU/hqrL9O1/Jn3YVbjrENJH1OdPOot/8yK52YCrhk0c2fwWeqAWO6Cr3eUvhPoN7C
         +GhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781459437; x=1782064237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+hcsnUGTB2wQ326+1MHHf35X3iGgQO7l4/OOgtUgNTs=;
        b=d7tOq0t/wfbx5YBDfedcx6urCFctNwWdJ4oaoptRxGDy/G3a5YU2vLkQgJoPiI1oiO
         iaQ+sDzI8+fyC6GVsutmJqroYiPTIf0mn2lPvriV3mdE2nfN+mtvLtzoZFXp02JguvGC
         gDg/TvfqG3EOGYvA/d6DyloHh1kFEhfqAfVUehmmqDsolA4zANBVgZMA5P2rOYWcik4k
         FgpNu/dRj89myBIpw4pWQIyCdmv7h2NgIF8oXvDzZWNR9/Q1gA8hslryappNKpRQII1g
         htd0ZOZduDgUjuNCt//AygNxmy3ZTHzxwl7KEV8ko9/sjDI2skYjQ3uY/VVubWJdRZPR
         PrLA==
X-Forwarded-Encrypted: i=1; AFNElJ8sdHXsvMjMNnq8weDnjAW6aqPGBTJb+L42bXxOqoFGARHzILFjf0HPNNnc7P17tuY20iPcc3Pvkaw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoyonqqWO1WbhtFWT/KwrOFbt/9NPiaxYWMI4MuAkGldadzgLt
	jEOjcDYtFR1sV6YGwWF9XIiXjpZnqGjsaVdvfkEoWnEIUIqGqyrnqi0e
X-Gm-Gg: Acq92OFj9WRwvVCqapC74K7ydJsBpdyTYUTaQ2/CZr3z1/2vIArCDEumQH8a6oQFdS7
	JpQnw1MUI+q0u+5Kkt2jR4CEGFBfrfzRhLJmXpfEs0bO6FhlqLc2fBCcnQ4jEX0CxOYt1IItcyv
	2TTQGqDUxBqltqB4RDNe8My0gKFDm1KgeriC/ohcI0Hikk/zuJ74PRW0fZnYoNeRDc70/Nocmxf
	ehkrg4Fq6hMmXrJJ56tPaaScIKuXJfMgjCSa5kL60ijVwSN9miU1e7QTTuPIqU/2fkNEm16V6kS
	g+pP+rBQiZ/S3R8Cs6vMZGM553Qfm01grtb+KJ5saKW247CJrs1qYGKzf2SS9Uo58ivoRB6BaKN
	GnSzA5v7UIeVsj55LnQc50MMlOIyO2DA8cVENBa4y3XjWFT+QQKiJjywBbvWAsVIDg5WwUqFXcf
	+O2rMWHUHX9S9wFqdBpyYSYhGt6t4GdlYdEeiliXYcWktuayeaRFs=
X-Received: by 2002:a05:6a21:6196:b0:39f:2dd0:65d5 with SMTP id adf61e73a8af0-3b784025ba5mr13380372637.39.1781459437403;
        Sun, 14 Jun 2026 10:50:37 -0700 (PDT)
Received: from inhnjlux1020.ls.ege.ds ([49.204.164.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866325e477sm6517913a12.10.2026.06.14.10.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 10:50:36 -0700 (PDT)
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
Subject: [PATCH] dt-bindings: spi: microchip,pic32: Convert to DT schema
Date: Sun, 14 Jun 2026 23:20:05 +0530
Message-Id: <20260614175005.435826-1-challauday369@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,brighamcampbell.com,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6646-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:tsbogend@alpha.franken.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:skhan@linuxfoundation.org,m:me@brighamcampbell.com,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:challauday369@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[challauday369@gmail.com,linux-rtc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,franken.de:email,vger.kernel.org:from_smtp,devicetree.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 26377681D1C

Convert Microchip PIC32 SPI controller devicetree binding
from legacy text format to DT schema.

Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
---
 .../bindings/spi/microchip,pic32-spi.yaml     | 78 +++++++++++++++++++
 .../bindings/spi/microchip,spi-pic32.txt      | 34 --------
 2 files changed, 78 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/microchip,pic32-spi.yaml
 delete mode 100644 Documentation/devicetree/bindings/spi/microchip,spi-pic32.txt

diff --git a/Documentation/devicetree/bindings/spi/microchip,pic32-spi.yaml b/Documentation/devicetree/bindings/spi/microchip,pic32-spi.yaml
new file mode 100644
index 000000000000..97a381b2065f
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/microchip,pic32-spi.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/microchip,pic32-spi.yaml#
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


