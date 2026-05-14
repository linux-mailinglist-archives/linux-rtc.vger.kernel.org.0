Return-Path: <linux-rtc+bounces-6500-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KE58OlcJBmpOeQIAu9opvQ
	(envelope-from <linux-rtc+bounces-6500-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 14 May 2026 19:41:43 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EFF54579A
	for <lists+linux-rtc@lfdr.de>; Thu, 14 May 2026 19:41:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB61D306D96F
	for <lists+linux-rtc@lfdr.de>; Thu, 14 May 2026 17:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10B2238734A;
	Thu, 14 May 2026 17:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tNS7kQUl"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB99332614
	for <linux-rtc@vger.kernel.org>; Thu, 14 May 2026 17:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778780354; cv=none; b=SB9RbTfqGPepV5lZve9rMLIQ9F6kY0ZSxF142TyQj91pz1oO0bOw6/2m6Nkx+uVTDzzAICg6Ztw8soM5nURiENXbZ4Qh50sPXRAYvA7yPh6lYJ2m0iIzBe5bUFzH8HBot8qIJcVLTDfv2cJYxCUZ3nac9RpVY8PY6qmrx2OdDNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778780354; c=relaxed/simple;
	bh=8qCAdLHW0851OwVJ51V1JECzXkY9eSPFZ4kSDfU9Vf4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JbJDWtq4sSkujNH4pCoBYgUGk7yF1QuZWyGzbu4a8xTFTTJURGQbV1PCHtfQ09aNEseq/Hap/NXxUoe7gbIPQ5dOB6MUJs++ivLpnJ3Npu/3iDRcSA3dwxW2nzzEUhrk/VLWpOrOz7jezyzpslpocS5icFlGVJA3RLBEBUX26fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tNS7kQUl; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2bccb978bd9so735945ad.0
        for <linux-rtc@vger.kernel.org>; Thu, 14 May 2026 10:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778780352; x=1779385152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SuVg/btevpEI3G6fDRzlICOaAv8x5JhKdoYPDB2ISDI=;
        b=tNS7kQUlmDyJ3JcoDrp6Ne0ACBrCOVhiYrrQtY5DC+RF78DA/OTcjnOra2y0KPlHIk
         rGLxyz6nBpJY/vDmpnPGdonpC650mVz7o7bqRX7dfqesKrIehkdzS4YOxoHXCwiKxv2J
         YoM7lZFn+W7wGtRP0IVHzF4tL6utacNAWqZ2nRZrVflHj2H+MPh85FsJ1nmFohnxavwu
         sNxtSODIFtY5ub56NiHMwQDrD7u5lR1aJFusv5LNcUIARP1YrDvilVwcwTEj0Ih/UgR1
         wUpEnOz0G6TkOzONyiVf+e52iuCYCtlKvI883KAHD0icr3ajFX3qfxZPFN7IimgufQLN
         WxHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778780352; x=1779385152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SuVg/btevpEI3G6fDRzlICOaAv8x5JhKdoYPDB2ISDI=;
        b=m0UM0yH5Gmpncuo0i7HccZtXdpSA+aivsqmMqsdoBcoiKMQ0B33lYx69fziskApNB9
         RNptgjuRDmftfUeE0i0Dz9Cn14GI1D8yDRStotPYyf0+QI6kO55Fhvu2fGkJsfLPAgxF
         UGqxOj+frZpyF+8MqGeJZ6vfB4UxXRzRi9buD0uXHiwxJwwgN80Zhj8Ap4YQ75oM7N6X
         3ocjyyUfNmvpUIKSAWtt2FX4QGzAr3kXxIPhjuJKWpXBF5VAHebPiDnwJwsW+fgExeWc
         EKrTftZ1ltYqjQE9ogjvmLYJo8LdT94nIggkDdIidKujnJPn/4HJLw/mXQtb2xzOTov4
         d4Bw==
X-Forwarded-Encrypted: i=1; AFNElJ9Bbg3H6YhJcCIYlVL4klYPvcBEYWHksWhVLpP3V/iuiiGCXzFKfV1wgPJy5NI1Ij/KKWwREuCsQ64=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjB0sfstjuZdhQ5cUIFySe8ql0FNZk5+Z3RyvRUTTJYBUuwc/f
	Ij07GvqTcZc9Cz20E7SlKuS7ogGw++1JTjDim6t2/upksznQ0aB+GuO8
X-Gm-Gg: Acq92OHPRMXBD38T4Tsoqsj/aTt2aRoQyQUfD3XnEKtis50xJN3Ri20H0cYaaa7fCTv
	EHyMmG4Ns+5ILEXSGkcnXAyC3wdEZRYjn3sNqsMOy9KrYcChF2xdZti6kuTGEgRUAjx9by257pr
	TycbL9LU6kZ8VHNDbXZwZwhRzf+NhkVYvmpODB0GzWohiNLRssfmoMBqzn+ThewJ9uyH5Vb47hu
	ELA44IDbJElfWCODoxFhgsof/QwqSQrQrqNeNkzpfZeDar55BgeahR4M1Z+ebY5LCAV0mU+5Vg9
	Q0Hl9ADUq/GOxSUNpS/H/NDlNih2D75jz+neI3ULW006YyFgSksugY5qgyyx8dlmWvy5De3q84c
	xKtfpzKLZ1RFK4n6NN+h9yU7urMoiPoUbzwzAu2gKtgfe9Yn1dyA/LvqUEOW/tolsbh+dKrNC/3
	WNS2c8li1Z7YExgkuqGLa0rvXbz3QU6l4Jqr6YJA==
X-Received: by 2002:a17:903:2c08:b0:2bc:8e7d:3dce with SMTP id d9443c01a7336-2bd52b54312mr40934675ad.27.1778780351727;
        Thu, 14 May 2026 10:39:11 -0700 (PDT)
Received: from ultimate.. ([58.84.61.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5f2cesm33273585ad.14.2026.05.14.10.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 10:39:11 -0700 (PDT)
From: Udaya Kiran Challa <challauday369@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Udaya Kiran Challa <challauday369@gmail.com>
Subject: [PATCH v5] dt-bindings: rtc: epson,rx6110: Convert to DT Schema
Date: Thu, 14 May 2026 23:03:32 +0530
Message-ID: <20260514173851.25088-1-challauday369@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 48EFF54579A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,brighamcampbell.com,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6500-lists,linux-rtc=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[challauday369@gmail.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url,bootlin.com:email,0.0.0.3:email,0.0.0.32:email]
X-Rspamd-Action: no action

Convert the Epson RX6110 Real Time Clock devicetree binding
from the legacy text format to DT schema.

Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
---
Changelog:

Changes since v4:
- Replace conditional SPI mode properties with dependencies
- Simplify description formatting and wrap lines at 80 chars

Link to v4:https://lore.kernel.org/all/20260509185735.21557-1-challauday369@gmail.com/

Changes since v3:
- Add conditional validation for SPI mode properties using anyOf

Link to v3:https://lore.kernel.org/all/20260509181909.21871-1-challauday369@gmail.com/

Changes since v2:
- Reference rtc.yaml for common RTC properties
- Add conditional validation for SPI mode properties

Link to v2:https://lore.kernel.org/all/20260509095713.5818-1-challauday369@gmail.com/

Changes since v1:
- Reuse common SPI peripheral properties
- Drop redundant SPI-specific comment
- Remove unused labels from examples

Link to v1:https://lore.kernel.org/all/20260504183728.27412-1-challauday369@gmail.com/
---
 .../devicetree/bindings/rtc/epson,rx6110.txt  | 39 -----------
 .../devicetree/bindings/rtc/epson,rx6110.yaml | 68 +++++++++++++++++++
 2 files changed, 68 insertions(+), 39 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/epson,rx6110.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/epson,rx6110.yaml

diff --git a/Documentation/devicetree/bindings/rtc/epson,rx6110.txt b/Documentation/devicetree/bindings/rtc/epson,rx6110.txt
deleted file mode 100644
index 3dc313e01f77..000000000000
--- a/Documentation/devicetree/bindings/rtc/epson,rx6110.txt
+++ /dev/null
@@ -1,39 +0,0 @@
-Epson RX6110 Real Time Clock
-============================
-
-The Epson RX6110 can be used with SPI or I2C busses. The kind of
-bus depends on the SPISEL pin and can not be configured via software.
-
-I2C mode
---------
-
-Required properties:
-  - compatible: should be: "epson,rx6110"
-  - reg : the I2C address of the device for I2C
-
-Example:
-
-	rtc: rtc@32 {
-		compatible = "epson,rx6110"
-		reg = <0x32>;
-	};
-
-SPI mode
---------
-
-Required properties:
-  - compatible: should be: "epson,rx6110"
-  - reg: chip select number
-  - spi-cs-high: RX6110 needs chipselect high
-  - spi-cpha: RX6110 works with SPI shifted clock phase
-  - spi-cpol: RX6110 works with SPI inverse clock polarity
-
-Example:
-
-	rtc: rtc@3 {
-		compatible = "epson,rx6110"
-		reg = <3>
-		spi-cs-high;
-		spi-cpha;
-		spi-cpol;
-	};
diff --git a/Documentation/devicetree/bindings/rtc/epson,rx6110.yaml b/Documentation/devicetree/bindings/rtc/epson,rx6110.yaml
new file mode 100644
index 000000000000..55086ac7d1e2
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/epson,rx6110.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/epson,rx6110.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Epson RX6110 Real Time Clock
+
+description:
+  The Epson RX6110 can be used with SPI or I2C busses. The kind of bus depends
+  on the SPISEL pin and cannot be configured via software.
+
+maintainers:
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+allOf:
+  - $ref: rtc.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    const: epson,rx6110
+
+  reg:
+    maxItems: 1
+
+  spi-cs-high: true
+  spi-cpha: true
+  spi-cpol: true
+
+required:
+  - compatible
+  - reg
+
+dependencies:
+  spi-cs-high: [ spi-cpha, spi-cpol ]
+  spi-cpha: [ spi-cs-high, spi-cpol ]
+  spi-cpol: [ spi-cs-high, spi-cpha ]
+
+unevaluatedProperties: false
+
+examples:
+  # I2C mode
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      rtc@32 {
+        compatible = "epson,rx6110";
+        reg = <0x32>;
+      };
+    };
+
+  # SPI mode
+  - |
+    spi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      rtc@3 {
+        compatible = "epson,rx6110";
+        reg = <3>;
+        spi-cs-high;
+        spi-cpha;
+        spi-cpol;
+      };
+    };
-- 
2.43.0


