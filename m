Return-Path: <linux-rtc+bounces-6490-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mrwbBc16/2nW6wAAu9opvQ
	(envelope-from <linux-rtc+bounces-6490-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sat, 09 May 2026 20:19:57 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 403F3500F32
	for <lists+linux-rtc@lfdr.de>; Sat, 09 May 2026 20:19:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B3113008D23
	for <lists+linux-rtc@lfdr.de>; Sat,  9 May 2026 18:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DC413822BF;
	Sat,  9 May 2026 18:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X319pr1C"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053BF2E88BD
	for <linux-rtc@vger.kernel.org>; Sat,  9 May 2026 18:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778350794; cv=none; b=cE3vys73yir3S0uY7V5c2m+64dnIZThbOileWYSPCKuemCIfQQShugtLClks0bRWUwJGRveFoLPffIQ8/rElTHzTHFgWpLa0XuUFgYhG/SncPBkxHUu+15wuq+0u88yThs8oD8hKyn0KxuJRVKX69XTCXBlKWU02ouSmzXsLkpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778350794; c=relaxed/simple;
	bh=czzcavk29id9M4UhdT5VweJ32WxTo3MgrbsazJMzg0M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ahS71shc+Hw1qIRHeFgb0mrPv7/Ca9rEVRkloBBpuKJJ4q5AleqNezzeq+kUuj6KcK2D5WsEjA4Ay7l64FE3sTofsCpqcPrDfb0elWIPOYD+4zkCSqFaLcdj/ND4vc00jqzrxq4s4+UUp2bma28tShLGnqsmYYCUiDJFIPVY1Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X319pr1C; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-367d88b9940so313158a91.1
        for <linux-rtc@vger.kernel.org>; Sat, 09 May 2026 11:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778350792; x=1778955592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=frOdwOepJTp+ZENuZWChoJcmDuk9+nILW6mXjQtPtmw=;
        b=X319pr1CNBcamLZ2TfgHkdXcXfU6V+1eWBcEdGe+9QsY6wl3fmFsBvnpi+MAgLHHtp
         zfCaZmFcprbAOO+pfPbKQ/fdU+UJuiKH+aRBznjs+nvwM2CQNeF763oiyJuxw0NekBLM
         B+96vRgGnTTJEuAmtazWWMGoU98bYra36YVbCFKhoo4RfCET5VYfToZB+rwNVca5ul9r
         axjWgtkhBd+Ng16RCxRGBVCbycNHWJICpxiPXORrbMKtEg9fQp06+FhKFtsqKrR+39Z9
         +ByF2Kb7mhnBbCQ+8mqwSVmfa3LBZdDSS5P7NFRPwklI3pBEefS1eu4NONVFEhtb3veQ
         40Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778350792; x=1778955592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=frOdwOepJTp+ZENuZWChoJcmDuk9+nILW6mXjQtPtmw=;
        b=YtQKPmgWdmHUBMQPCTZR2s4DDFWBag6ycaP9sKLTWGkvI/odt6MjmHHaiKPUYywjSd
         Rzaqjaglp3A2A56qEBbB6akgbFS7wneZ2fD/GbG9k2Mfh8N/yrzWtIfhp5YIKP6wRhdN
         w71pp1OkspyFkoUg56FiwWwpv7YEBe468yIe2yKRHlXiXWAne03UuM3XricK4+YjOd1c
         0Q+Ux1EIr7Ee06FBTt/RcIn4C1PTKdcetfS0cMIao1pEGhIwwdjHUF5YeUmyUC9YlQXY
         ANy43Lsg4k2tx790unUSvsseXHbtp4gD4359+y7FWGSa+56NfFiOphw2TvhVySgLyhPB
         j9mw==
X-Forwarded-Encrypted: i=1; AFNElJ/bX7spYWfbK8HYMVfOJgz6i2g1CZ9CkZ87O6sEgv+rLdvh6GztbqMae4MoAwzpBZf/dqvbqUp1Wzc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQDsQYZMjiO2+gi/FOkZYwKnltZIeUSw24QBQlE+KzMARklrXr
	vfRqkyH2qF1HoRc4mDPVbAVyGGTvzhaLMMor6/cbCSMxx1VL/dnyFLOC
X-Gm-Gg: Acq92OGut9wmXDUs2roYQlPmALsKN0wNWO1zGzYuyPFBORttua4lOXSnI3vIXYQVbMa
	WRHL5d++0Q9PfeipIwrxxhS8pIkrC/xu9H2+B3ToUV0npiT6aqXjeGXB6WW1fh2DpZWXgAXyM6K
	K2mEK0lH8UfXmJFXio5FUkPp70tUlTXM18QzXh9f8IJRUUDgzV9zhoIlpEpbpX8393poyZhrxSa
	gbARAoErom8O8HnflTt372p9+o/89+9h89UjGaITr9AjgrUmadVRhH70pjcz6hIkayC4xzsb8FY
	lbsLTE22vFcpL2orBK2o1uiUHlyedLspGnq/BwOpdhHa+Jm47ZRPDoTxpsE79DpG8c7t18fG+0W
	ekFNQLq4Ko/8WL6aibbOJIOr1oQyrmCi5G2ri71L2/Mz9Qq+NIa5C2I220mNRc+lAAhN/5ycC4H
	NQjwK7LcxC5OIlkTnLjdEVOgVBfcU6cN0ScrE=
X-Received: by 2002:a17:90b:1c0a:b0:366:479e:63a5 with SMTP id 98e67ed59e1d1-3664c8db251mr8171762a91.2.1778350792243;
        Sat, 09 May 2026 11:19:52 -0700 (PDT)
Received: from ultimate.. ([58.84.60.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d63bad27sm3414683a91.10.2026.05.09.11.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 11:19:51 -0700 (PDT)
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
Subject: [PATCH v3] dt-bindings: rtc: epson,rx6110: Convert to DT Schema
Date: Sat,  9 May 2026 23:48:08 +0530
Message-ID: <20260509181909.21871-1-challauday369@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 403F3500F32
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
	TAGGED_FROM(0.00)[bounces-6490-lists,linux-rtc=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[challauday369@gmail.com,linux-rtc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.989];
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
 .../devicetree/bindings/rtc/epson,rx6110.txt  | 39 ---------
 .../devicetree/bindings/rtc/epson,rx6110.yaml | 79 +++++++++++++++++++
 2 files changed, 79 insertions(+), 39 deletions(-)
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
index 000000000000..09578de45d8d
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/epson,rx6110.yaml
@@ -0,0 +1,79 @@
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
+if:
+  oneOf:
+    - required:
+        - spi-cs-high
+    - required:
+        - spi-cpha
+    - required:
+        - spi-cpol
+
+then:
+  required:
+    - spi-cs-high
+    - spi-cpha
+    - spi-cpol
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


