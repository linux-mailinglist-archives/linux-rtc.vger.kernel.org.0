Return-Path: <linux-rtc+bounces-6488-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gcPpIkAF/2lB1QAAu9opvQ
	(envelope-from <linux-rtc+bounces-6488-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sat, 09 May 2026 11:58:24 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C71B34FF10C
	for <lists+linux-rtc@lfdr.de>; Sat, 09 May 2026 11:58:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C535A3011BDA
	for <lists+linux-rtc@lfdr.de>; Sat,  9 May 2026 09:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5517339C64C;
	Sat,  9 May 2026 09:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V/pnS9rC"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA60A38E124
	for <linux-rtc@vger.kernel.org>; Sat,  9 May 2026 09:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778320701; cv=none; b=h/nj/vR4Lg7AG+sUWFAIkVeRgts2JlCQHJZU9ak04k4FVMcLD91wtgq2nYtxw9S6XUbV4LK3ZKSkvUljbvtlkDZe5aXSpCTzoQz9oO3bIi76ZiqV8C4nzZqu2Y8liNC003kuEdG/hhkOO2vL0XxvfqezG5MeqmC1quonxca0ytA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778320701; c=relaxed/simple;
	bh=OSgeigJrC/LmOWDzFokC2wzqJC4CmOLy+39xvEvBcu8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iP31e8ZHqo6d/WCjGwCfvH4xiLcCgtpYvcbhr7VG0rv4cxC8HVNQ2oP7V2wyQ+6IBe2O3Nbyco3Z6CiJxjVmmDzyUIVye68kllLqI3Cpe6pdelOSDuH0Jj4vVKNaoRnagYcPLGSBhm/pRCKCTm6L1Msu0LXWhxnBls2AITh1dNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V/pnS9rC; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c70e27e2b74so1067034a12.0
        for <linux-rtc@vger.kernel.org>; Sat, 09 May 2026 02:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778320699; x=1778925499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BGnEaNywaaQdrKkMOeCsl1nlp6Rj/8u/91oXFsfmlSA=;
        b=V/pnS9rCmd9xZnlfR3WdAzetEpTI6s6CNnltiLtC8WBSST//VxYwgS/AJoKFAowATa
         1wFq01CiUmgpfalHMQ69+Or6203W9xsdwo3BFQojmo1uL3GWfxxDd7GWMgxEHoWhff2q
         pddSzCwyat2DXSNA6U71EvQUEdsKL8GdKAGa8o8JAywrSD143Qt9nAAcbFkaR3vFM8SI
         DXTQCJcVWA3xGUfL9oCA3cLbJm4iDzKKkX4/svwfpnb6oNuNEl1m7FUU8jyf0XMBdyJj
         /aieB4oScdM5dpYx8jyXLSM3TnO6sP3h/U0gouTKm04NumwRmXPqgflZkE6icimV8Wd2
         /pWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778320699; x=1778925499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BGnEaNywaaQdrKkMOeCsl1nlp6Rj/8u/91oXFsfmlSA=;
        b=gNuciHx59MYYFfynNEa2wBN97rV8P8yNPVKVmE7WDpn7LPrx2SkJA6qSti6IQM0Ycg
         xqv7wDXJhNCVbupolpGU+wPdJ+gZSjblwmPsezSIonzSyDL7/2KWMfk/6dEqaZEG0EKX
         W0hWRJy5kAxvwGMSLdq9jMM6WkGSPAWuGRNXHjXeCI8Btz6cvvP6wLXyryrChsl1gUZU
         Cemx0on2BsfVQSTKRySp0U5W+RdRIRmdWPgtenkbjbg8jSEJ4EXLnl4hLZAdjHpqPsXs
         +avtCKPLkeUIGMv5LfTWni4+oG+tmZPsQABtD8aW02g38f1+6X4kEtSrcES/3K0uvkdA
         4YzQ==
X-Forwarded-Encrypted: i=1; AFNElJ88I6IaGGG32+fh40YdOAxBDIDviW9j1Ov4Zb79xDioe92U8FieaE/QmPRu1ojMgTBJgmZ/Chxs+04=@vger.kernel.org
X-Gm-Message-State: AOJu0YxT+AdUvVvyKHK58uhy9dDMKNetjT3PUoYyZWs+GQinK1UPSs56
	i010FtiPwWCcGtWtll3TmGhNN9PAezLSOgoL0G1FUi01YQsre+fZpmUw
X-Gm-Gg: Acq92OHmF54kD/63l9LIFoAaLomiNTUxshIH5xl8NLk3UN1YGF0MEdy0yAYYOa2iz45
	Y2m78QxWOwDepT9OURWlzCHNWLZXm0Sv6L5OqyDqg4h4CiEtMxesa6nC9Ok+FxMFRqHcBPKI4Ga
	+/sVf6+5oAi0UO30gIGbAFZz/8x5b1Ed/ifnWjryHAi8RwJfSygyoqRvVtas4m/Ya7qwBkIZ3lj
	OYO4XkwFyOuw1GL3bnDIk076i221e6y/+Pxnmxw66qASIKFDjq7q9dC+X7Ng4fx1M7OFXus2yB0
	Hv4UXaW2zw2sVxrWps2fyF79T5bXNKgVI9Gv4IzGEsUq8381txtGLB8Yn2/XHVqW2JBrLA7BRXq
	PCl/loxZRCjesnURR4k9mNFr6GBpSnPK4i9P+YFh6IF8O/pbPifHek4dgLvHf5p9e4s9ROyjAk3
	vZ7dGfV/7YyvHQH4N7NMf8ea9qfpwgZMyGKk0XKg==
X-Received: by 2002:a05:6a20:3c90:b0:3a1:90fd:dcd6 with SMTP id adf61e73a8af0-3aab16e9e2bmr7224406637.31.1778320699201;
        Sat, 09 May 2026 02:58:19 -0700 (PDT)
Received: from ultimate.. ([58.84.60.186])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c826767be55sm4045885a12.1.2026.05.09.02.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 02:58:18 -0700 (PDT)
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
Subject: [PATCH v2] dt-bindings: rtc: epson,rx6110: Convert to DT Schema
Date: Sat,  9 May 2026 15:17:41 +0530
Message-ID: <20260509095713.5818-1-challauday369@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C71B34FF10C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,brighamcampbell.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6488-lists,linux-rtc=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[challauday369@gmail.com,linux-rtc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.988];
	DBL_PROHIBIT(0.00)[0.0.0.32:email];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:email,0.0.0.3:email]
X-Rspamd-Action: no action

Convert the Epson RX6110 Real Time Clock devicetree binding
from the legacy text format to DT schema.

Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
---
Changelog:
Changes since v1:
- Reuse common SPI peripheral properties
- Drop redundant SPI-specific comment
- Remove unused labels from examples

Link to v1:https://lore.kernel.org/all/20260504183728.27412-1-challauday369@gmail.com/
---
 .../devicetree/bindings/rtc/epson,rx6110.txt  | 39 ------------
 .../devicetree/bindings/rtc/epson,rx6110.yaml | 62 +++++++++++++++++++
 2 files changed, 62 insertions(+), 39 deletions(-)
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
index 000000000000..b51d39ef75e4
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/epson,rx6110.yaml
@@ -0,0 +1,62 @@
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
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    const: epson,rx6110
+
+  reg:
+    maxItems: 1
+
+  spi-cpha: true
+  spi-cpol: true
+
+required:
+  - compatible
+  - reg
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


