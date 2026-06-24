Return-Path: <linux-rtc+bounces-6732-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0pRZIKF1O2rmYAgAu9opvQ
	(envelope-from <linux-rtc+bounces-6732-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 08:13:53 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C999D6BBB32
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 08:13:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Qd3FhYL9;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6732-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6732-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF0A23020022
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 06:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60B0738642C;
	Wed, 24 Jun 2026 06:13:40 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE0E3845D3
	for <linux-rtc@vger.kernel.org>; Wed, 24 Jun 2026 06:13:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782281620; cv=none; b=KjeYCYS/3hrGbLorKSfVe0TX9XNv9kSKxGZVVUMx6yEjIXugHfYYBz2P7jIH+sujiXG+/HIuqBK9lbJ79fVCCPdd77/cTRhgjVLoJvOJrG3EoSJ4jTz0bm2KQ3o3wSOn7Ro1iF2h8v/TPUu4GqtmQmxtmXAdiOb9oVgkE++GpEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782281620; c=relaxed/simple;
	bh=j+d4xrnJaVFkzypOS1j/scfN+uggwAM1LR+uNFYvsbI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DBKun+mVefz+QRiVy/4at9zfjRMIspqy1GjRhSUkC0sf3b+pNZUygr5i0LT2ufccBuKKC47p+LY4pVW/tthO2O8C/hdG604cGSTKpylVEAaqrbn7PB38kvqGevTFzYTtJJRSGgV18TI5VHWsITlHO/PSMyZkgf3hBz3/JSgELoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qd3FhYL9; arc=none smtp.client-ip=209.85.216.43
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-37da8b5540bso475647a91.0
        for <linux-rtc@vger.kernel.org>; Tue, 23 Jun 2026 23:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782281617; x=1782886417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jV9/q9Pny0iZFgzb8Zwu+6SPPjjVLms6uiZrPqFj04c=;
        b=Qd3FhYL945iCYe0TtY66Op8TdPXjti/KrVlvw+FJAYTB3FRmo8adoXet3xVvXfIp/5
         WWTHtWU8Ij2uDnD3XMq1dm3aq70kcw6CgM7uz2AO9bkK3DzZ/fBDuHRD3yVs995AR91Q
         w6XU0m9tM9hof+mjMt+4bbnmHa4NX77fJGKWBao8tqJfPxfxn5KKPtLkJApxA15JfgHF
         ONZSvzKHCUOtUNPqbyATICtNeVsKNCLYbmKfPRNUlXmGMBXz9baxCoCM9NpdxKxMxzkN
         nbW0FEVrXqrl1DjqmbHYYuekOalIJ0SP5RiuN2cyhhUyof7vkEhlKTKSIJ0RK637DAbo
         S+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782281617; x=1782886417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jV9/q9Pny0iZFgzb8Zwu+6SPPjjVLms6uiZrPqFj04c=;
        b=IS0nyU30MTbCfkp2NUDuhUGMc4B2KvNJCK9xJwGhLBeKYlKRrBdCXH+oBO32d9ygyg
         YJf7MLKchU1ci6YA4vPG/NMuvtQ6e/4j6/zg/NrKCqGSIW91VYoZOoaBeLBLXYM4/CzH
         UpKDGNrRA8zX/A+afK9QgQF5UXu4PTBzgelXpq+HDquFzxpvUCX2Gs+k7Bn75l22HxdM
         y9soXIkNfMmZvIvYmN1Qt2aKZ8KCyd5Zx5lUULt9aTM1GLomv3JDE6QJqbW2W9c058Gq
         cwm1g3K/rtCT/1slRBEuUdg2rV4+KRMqo6w5tYLR4tftpUO18tR44NeZ59P/IXdvshu1
         JSpQ==
X-Forwarded-Encrypted: i=1; AHgh+RpkPddNOzAdr/R7szgQwbDg8+exLxo3WHs+eTMvwwGSqAN92hwMpvTymEUUakS4vhpCW78Eb0NzWZc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl3g7a0s7P/u0ib1ohSfoSKzhoyrEkIoqrVYPqpGAaIQlQUtVo
	CfHGKNc2vlozoy59exOoXNObFBVlWH+Bot1TtE88WjvbrxZk7EnGSSRc
X-Gm-Gg: AfdE7clJdXsVn2eYuVogcnPnUbSsB1BDz5982tNKXS/6L6wXVtA8Wba+jG9UhuRcxGB
	t907Lh4vbPM6FRMQ/wz2KEo5952AKbixALbajT9t3W5VbJtVWAkGmx2RPSDi98p+U93pz3SyhJ1
	UZ7VAGGQ7fHA9xjtobJY6gZsLptBBIqfIbbscBNK7oY9a7WQsng9+7Flu7SvV/bs/ln+PJj7pQQ
	UJX5mY3wFCfR/YL+OZQf8n8rYpK0h3jCI0nz9uqRos15ZF8G0k+B6ugIPpd+KzBImBsrOKCQKe7
	tjHCAXLmm3bYK1iGi1b2XXextvaV8Dmj7ypDs5nGeYRxwcZqXq/YhDnume1sEXwdfa4/JFnSpBV
	rqE1D3pfmZqlu1qeOZjg5oWVPUefqERs6XPB5NKdwjafumI4Ou/0cbIlahDZRvI572sEFWp+3Sb
	16Blvxf0Ww/RpLTGmPHef1nZ4vJtY5ROQ=
X-Received: by 2002:a17:903:1b2e:b0:2c0:a3dd:4e76 with SMTP id d9443c01a7336-2c7e151c2f3mr23997485ad.28.1782281617419;
        Tue, 23 Jun 2026 23:13:37 -0700 (PDT)
Received: from inhnjlux1020.ls.ege.ds ([103.28.245.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c74469913esm124643625ad.82.2026.06.23.23.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 23:13:36 -0700 (PDT)
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
Subject: [PATCH] spi: dt-bindings: microchip,pic32mzda-sqi: Convert to DT schema
Date: Wed, 24 Jun 2026 11:43:29 +0530
Message-Id: <20260624061329.130468-1-challauday369@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-6732-lists,linux-rtc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,devicetree.org:url,franken.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C999D6BBB32

Convert Microchip PIC32 Quad SPI controller devicetree binding
from legacy text format to DT schema.

Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
---
 .../bindings/spi/microchip,pic32mzda-sqi.yaml | 53 +++++++++++++++++++
 .../devicetree/bindings/spi/sqi-pic32.txt     | 18 -------
 2 files changed, 53 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/microchip,pic32mzda-sqi.yaml
 delete mode 100644 Documentation/devicetree/bindings/spi/sqi-pic32.txt

diff --git a/Documentation/devicetree/bindings/spi/microchip,pic32mzda-sqi.yaml b/Documentation/devicetree/bindings/spi/microchip,pic32mzda-sqi.yaml
new file mode 100644
index 000000000000..39f06b61e894
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/microchip,pic32mzda-sqi.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/microchip,pic32mzda-sqi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip PIC32MZDA Quad SPI controller
+
+maintainers:
+  - Thomas Bogendoerfer <tsbogend@alpha.franken.de>
+
+allOf:
+  - $ref: spi-controller.yaml#
+
+properties:
+  compatible:
+    const: microchip,pic32mzda-sqi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: spi_ck
+      - const: reg_ck
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/microchip,pic32-clock.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    sqi1: spi@1f8e2000 {
+        compatible = "microchip,pic32mzda-sqi";
+        reg = <0x1f8e2000 0x200>;
+        interrupts = <169 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&rootclk REF2CLK>, <&rootclk PB5CLK>;
+        clock-names = "spi_ck", "reg_ck";
+    };
diff --git a/Documentation/devicetree/bindings/spi/sqi-pic32.txt b/Documentation/devicetree/bindings/spi/sqi-pic32.txt
deleted file mode 100644
index c82d021bce50..000000000000
--- a/Documentation/devicetree/bindings/spi/sqi-pic32.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-Microchip PIC32 Quad SPI controller
------------------------------------
-Required properties:
-- compatible: Should be "microchip,pic32mzda-sqi".
-- reg: Address and length of SQI controller register space.
-- interrupts: Should contain SQI interrupt.
-- clocks: Should contain phandle of two clocks in sequence, one that drives
-          clock on SPI bus and other that drives SQI controller.
-- clock-names: Should be "spi_ck" and "reg_ck" in order.
-
-Example:
-	sqi1: spi@1f8e2000 {
-		compatible = "microchip,pic32mzda-sqi";
-		reg = <0x1f8e2000 0x200>;
-		clocks = <&rootclk REF2CLK>, <&rootclk PB5CLK>;
-		clock-names = "spi_ck", "reg_ck";
-		interrupts = <169 IRQ_TYPE_LEVEL_HIGH>;
-	};
-- 
2.34.1


