Return-Path: <linux-rtc+bounces-6461-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2F96KmTo+GkJ3AIAu9opvQ
	(envelope-from <linux-rtc+bounces-6461-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 04 May 2026 20:41:40 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B534C2B2C
	for <lists+linux-rtc@lfdr.de>; Mon, 04 May 2026 20:41:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ED53F3063968
	for <lists+linux-rtc@lfdr.de>; Mon,  4 May 2026 18:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C475D3E6399;
	Mon,  4 May 2026 18:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4GrXtUH"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D733E5EE0
	for <linux-rtc@vger.kernel.org>; Mon,  4 May 2026 18:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777919928; cv=none; b=l/n+tqV9FmmD4D3aOgG/5QS75QrihXP2nxn13maCrjht3oGjqaCzCOULB8HDhMELgzHMMkT0ivg22lt6w3OUJ9wjnbqRH8flnwwIYKgkQH2q6wk5s2f8HyUVjAZszRxqCfdylJxJ8jSqQKtz5GYPdLKIUJQdzHp2b4r1ys5GJ3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777919928; c=relaxed/simple;
	bh=cqrHsnBNkdOUMEzGFgAyYwYIEH5nri0S1YhnbLjXb+E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sdWWj1bjBljvDTfh48SzJdShc26vvFnHXxQTJe/i29MlyGiv/rXUOXNVTt6gmdR19thtvuzowi2pRe9j6DarSyg/MWzTXLeF9WP2VlASEGY2VhLGZgc96QqDfsZT6NAH/ttULZey8Tm4cQZJrLYb7Tv8l/aMuIS0MWiMARRuxvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h4GrXtUH; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2b4583f0a1aso26971825ad.3
        for <linux-rtc@vger.kernel.org>; Mon, 04 May 2026 11:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777919927; x=1778524727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cu8NsIgkchVnkYXO/Xn6hCZcZRxaV6y1Wg1XrlN0f/s=;
        b=h4GrXtUH2MWxTYhAIbhU3lLSqXAQyVnGl3Q8HCG3VD4S8sEvxIuEr3dCrGWrtsFsBO
         gjBu2JdtbSnXQrHQLDo4rjUaVDA8TTQ/Zf9+EQNut6NHHUb/iIryenIJ8FK8LBsXCt12
         tBj/5z1Xm2QnjfL2xF8f8alaBuebULuJ/090k8L9eMJ6yqnkuwD1Q0KHf3uGjx04uBID
         Lv5AlvesKPiIa5dTzRnrr/iN9vG1UqNa/syq60ohC8kn5wz4j2C35ywKcPm54ieB70RN
         7Luu6EZJeD0WvEGvd6kVihxQ47586eWihWSdgd22hA/rpkCio2Zce7Da6X05uOO56CQ4
         ciGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777919927; x=1778524727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cu8NsIgkchVnkYXO/Xn6hCZcZRxaV6y1Wg1XrlN0f/s=;
        b=jTB2IIbuzrOnQHm1m4AfXtLTr8m3G7NlsCFymBmEuCbFgg3327krgpjJoLZMURizMF
         zjSzqo1y1PsZFRCGMFQi7g2B1my0guqwE22vxiNDQrm1hyR3EomZNlsysT+y3sSlrQsT
         i4Atdf47awsRBmLPOHk93YjVXqi5JsV7myDGWfZGWsFRWkCvoMHU2b3IHQa3Ej2OefRt
         rcvZUi5HRLGGzZ+0sLcSB19ewqAc523rX7ak8dLITCh+syC/w3k1QJqeVgbkOReSUKEA
         dOb/zt0Dn28BLXTy51LdyRqVl766SZGPPMTi8mBLucUUnyMdCPqrRLJbuQoB4aHiC1K7
         VB1w==
X-Forwarded-Encrypted: i=1; AFNElJ8/cP6rxa0KkE38/Z6hrR6p+OWyLF3IDZXBQlCOv7wadzSjUnxbzogLaF5FhJ9T0uucdnaeONhogWY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpLaIsWsSpBpgbuH+rUl1e9EEeUtsBZZzvED98AEiFeEjatR41
	ePoOU2FOOnGg0DMpnKYJAdF/9uifxKiYUTEXe5KYuIS5OIgTyidCr5GH
X-Gm-Gg: AeBDietCxdG79w4RACGGob1781vnnBexeRg9qDZaa36DDCTJBHEymr8DDXBFEQtvq7T
	wX+NIKxwwqZZCBtK+SVWO9x4rB57dgTQ56rAZNoVmr6Y4rQG44bpG+IU8wz2qTf3LYbF/igeUdA
	uFB4Ys4eY0qlggbWZYhjlCZI6x3jrjKr32Mjs5FBcxjO14AIqnLKK4UDemQXsK08LWLjLCzl6o+
	eZBn7yE8Fm2IFe45jcSssNitn9e1RGvIKzgydbyTnZtTBhyxzPccLJEDWjfGe5L47QqQg/MFyVt
	MehTo79R0mmbLB3JvyXQkzq68G78zEVSAZGfM00l7aFXYXUQytuTua+O3sSVdKa38Bi3bxuErHu
	Tj8934k9Ob8uuR5veP7W+R5UCEJMGhWDIv+/ab7HKWJ0R6fsBKwyaz2UUQ/Ido7dicLfKJRt8D+
	oxqklqjIIJXRqLRA0dF/tktly4S6PKajXnkdqt4Bf8SIafYGZn
X-Received: by 2002:a17:903:2c8:b0:2b2:d09c:c07c with SMTP id d9443c01a7336-2b9f285243cmr100855555ad.36.1777919926292;
        Mon, 04 May 2026 11:38:46 -0700 (PDT)
Received: from ultimate.. ([58.84.60.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae4fd16sm139392735ad.69.2026.05.04.11.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 11:38:45 -0700 (PDT)
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
Subject: [PATCH] dt-bindings: rtc: epson,rx6110: Convert to DT Schema
Date: Tue,  5 May 2026 00:07:28 +0530
Message-ID: <20260504183728.27412-1-challauday369@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 04B534C2B2C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,brighamcampbell.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6461-lists,linux-rtc=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[challauday369@gmail.com,linux-rtc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.992];
	DBL_PROHIBIT(0.00)[0.0.0.3:email,0.0.0.32:email];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,devicetree.org:url,bootlin.com:email]

Convert the Epson RX6110 Real Time Clock devicetree binding
from the legacy text format to DT schema.

Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
---
 .../devicetree/bindings/rtc/epson,rx6110.txt  | 39 -----------
 .../devicetree/bindings/rtc/epson,rx6110.yaml | 69 +++++++++++++++++++
 2 files changed, 69 insertions(+), 39 deletions(-)
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
index 000000000000..32d15a014f91
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/epson,rx6110.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/epson,rx6110.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Epson RX6110 Real Time Clock
+
+description: |
+  The Epson RX6110 can be used with SPI or I2C busses.
+  The kind of bus depends on the SPISEL pin and can not be
+  configured via software.
+
+maintainers:
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+properties:
+  compatible:
+    const: epson,rx6110
+
+  reg:
+    maxItems: 1
+
+  # SPI-specific properties
+  spi-cs-high:
+    type: boolean
+    description: RX6110 needs chipselect high
+
+  spi-cpha:
+    type: boolean
+    description: RX6110 works with SPI shifted clock phase
+
+  spi-cpol:
+    type: boolean
+    description: RX6110 works with SPI inverse clock polarity
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  # I2C mode
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      rtc1: rtc@32 {
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
+      rtc2: rtc@3 {
+        compatible = "epson,rx6110";
+        reg = <3>;
+        spi-cs-high;
+        spi-cpha;
+        spi-cpol;
+      };
+    };
-- 
2.43.0


