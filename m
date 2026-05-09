Return-Path: <linux-rtc+bounces-6491-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id TL+SE+qD/2lz7QAAu9opvQ
	(envelope-from <linux-rtc+bounces-6491-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sat, 09 May 2026 20:58:50 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F0B5010FF
	for <lists+linux-rtc@lfdr.de>; Sat, 09 May 2026 20:58:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 79D3C300D72E
	for <lists+linux-rtc@lfdr.de>; Sat,  9 May 2026 18:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0BE23C65FF;
	Sat,  9 May 2026 18:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XjNnrrP7"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6823C276F
	for <linux-rtc@vger.kernel.org>; Sat,  9 May 2026 18:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778353123; cv=none; b=N5j35GWZKumkwTqTIjKyZTLmqO486UhD53pJAZdRRP4DZCiY7Y0mayqdA53U2GeQXaMj/chUCUIGww/UlZWj4tF68ITduCjN5Yfbw33Df0+RmqyTnU0oj3YlgBqYTy06lIUrXS+hTychaQcaSaGXRzhjro3rxT+I/U2hqB2Jbvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778353123; c=relaxed/simple;
	bh=hqGFzcRAEPnMTd/jfO+lOHuetEfMmFQ2/+xsz4yB2YY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PI+mbpPPDUUe7dN1dpPY9l7LLKysv24rQEk6r8Dt5yTPfRvUuVTfOAjdP1GTSAFTv+pSIcGmF/y6Wdc/A1Erc0PGHLkqf7Cx5Wet04u0YFqNDSjdniWgX+hWN3yeKFZ/i3oADK4bbtfBxYyjzlOJd9D2Z4jsAXEA0W+YpTsM+NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XjNnrrP7; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-36536771300so2941879a91.1
        for <linux-rtc@vger.kernel.org>; Sat, 09 May 2026 11:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778353122; x=1778957922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pp6CLbJl76WQm15M0o32CAsBSD/I1ik0M5zbpMwsEQw=;
        b=XjNnrrP7zWRN8bZyZZcuSLDENd8015p+z8zAtL8+MU7nPkw3AmhI71yQ7kpk32y8Nd
         HXG+tA6xU31Na1F3O/4oXPUnSMvCOOZFZUsW6F1vDA8yD9zA1TE8fj+Uj/BI440+tHZw
         4WUnwjy2xkM5hD1fwMzbLQR/S28Qtl4JVEpelTLjqq5gYwZ3K7sXgSdCQprgU1ak1szW
         QHMCR+vjc7rwxrlJUN551LZI8xkd4EDs8AoJgo8iBOI5T9mCjQqyMnnmxL9/rR5/ptCC
         XwNc6WfXbs/dEZWITe3EltuqrUbz6hitP1pwtRPimNTxZiOI1FtOXIP7iPuXQnk+WRTo
         nERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778353122; x=1778957922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pp6CLbJl76WQm15M0o32CAsBSD/I1ik0M5zbpMwsEQw=;
        b=nYkGPac0u5gpqByqiAGsS4lGfEivhciGPLOxj2EdH7y0tl7GLUYMUvaSq18wOBrlkz
         TU4sVBtnvET7OWHCY6L+2cnvhotYiK+l+B4/IG9WB6qarEtXAp9LN1KvCPM9aWbYImPq
         GDUvmpEBLAm2IEwuanBx/t3JbdEU8QlxpBVFrhFYvdxJlVsl4rRQxk50+karbedjDYz2
         5vEeUpnUqJ5XzTbJRjHBO/XtMlI6ehXp6eO23+TGQPBdr7dXAZ8ZHMFmVxzQlvCGQjJe
         RTaQZwomV0vffdhZTpZZgdr0R7ZBdqUPQW2hFL4yQSYO3MLtAx/fwPRSYKznIOqBC3ZO
         cRGA==
X-Forwarded-Encrypted: i=1; AFNElJ/mPAy7u+jFfv0tc++6dkxNuT/VqbjNznV/3Eg0f5FIH93271v0E3D1UPpg1OTgK6g7zVWQ5Y1iqns=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEil/fWACym2PKTfmRzD6tTjIuASZ+pT32JMext2DFq5kBbWBv
	rEfU61+Wa3pQMJrmQ0WNL8c0CX1sQSB3zXOhV+0LxUDbpsbs5r9r+2K3
X-Gm-Gg: Acq92OEbBOyGluAvF7wB4yQ+0Sdp0HoN4wvDFmChPJPdtogqQdfjg+WU8bz8+Ozuekp
	hsofM0EqVo+K+n4szNQF3OjLxP48/V3O9gUThXKJ0IM3NYzZ6z/nUkL3P85M6/b/KvUfLN+58GH
	yWCzxp2+anyBSPTjZ03NDT4HuFk8JWfCv4T49N3Bxtycy0VClNVrW15A85zscMzZl6Bto26QJlf
	TV3Zt+rrARQHDR5Pq0AlBQoZzRTPMcQUfaw7rT/sotPa29AgVlv8sNDu0mQLWZMEOoYUx6Autxv
	MJhChJtrlaY4zdMSNHZj7887XtkRgFOJcnPHWkl2UpCkLbDDLuLV2MJLVRxDARJ1S005hVwW4QU
	2cgVZC9OnYbBDUWFt8VvDnmLH+FXpwBNjnOGgRtLk5UdgRoXxerm8hsEfb4D4SMqeP1Oxh5/lXH
	MajGqFaiUACH8rB8PS2W/BD4dhuWcgQV8EzcvQy4+KtQuHUw==
X-Received: by 2002:a17:90b:37ce:b0:35e:579a:7e9a with SMTP id 98e67ed59e1d1-366053f7f37mr10321916a91.7.1778353121682;
        Sat, 09 May 2026 11:58:41 -0700 (PDT)
Received: from ultimate.. ([58.84.60.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d628474dsm2703647a91.8.2026.05.09.11.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 11:58:40 -0700 (PDT)
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
Subject: [PATCH v4] dt-bindings: rtc: epson,rx6110: Convert to DT Schema
Date: Sun, 10 May 2026 00:26:39 +0530
Message-ID: <20260509185735.21557-1-challauday369@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A5F0B5010FF
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
	TAGGED_FROM(0.00)[bounces-6491-lists,linux-rtc=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[challauday369@gmail.com,linux-rtc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.994];
	DBL_PROHIBIT(0.00)[0.0.0.3:email];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,bootlin.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.32:email]
X-Rspamd-Action: no action

Convert the Epson RX6110 Real Time Clock devicetree binding
from the legacy text format to DT schema.

Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
---
Changelog:
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
index 000000000000..3466f74736d2
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
+  anyOf:
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


