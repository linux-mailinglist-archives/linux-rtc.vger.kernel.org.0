Return-Path: <linux-rtc+bounces-6547-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJ3wANQ2DGoKaAUAu9opvQ
	(envelope-from <linux-rtc+bounces-6547-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 19 May 2026 12:09:24 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECA757BE80
	for <lists+linux-rtc@lfdr.de>; Tue, 19 May 2026 12:09:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 072AC30E582C
	for <lists+linux-rtc@lfdr.de>; Tue, 19 May 2026 09:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5189F39B49D;
	Tue, 19 May 2026 09:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qy7swvO6"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D583F6619
	for <linux-rtc@vger.kernel.org>; Tue, 19 May 2026 09:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779184783; cv=none; b=QAikS82CYFAhdDc5/c1kDqHsEc2KLK5vZc4tHczx47q7Z0zi8X+Fyb2pH1HvR3jK36dKlpr4v23lN7jdeRvBq7NkG9YEBgzyNFMRvjzyWZOfSgEyNzzTLGAV68XxHbFrR3l9DXocYkaZOQlPSBW1nrWm42MNE09L9HqO70EsbfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779184783; c=relaxed/simple;
	bh=jtI1geXzUQXWLm8pE2l6DFif0qRAqiIu7fohuGyDaI4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ulvg5gbaN11dSaU6aBwsiiLtpp72Lx/CQgiSvyCN7vaXK3mpA5b5oZWOOZeFE0UKFP/+gO+IBQ56KUQgVPtkBls4BGb0XJvUgWE3NIiJ2fjZhjd3tPhwQU8OtFKbfE9yKSb3sIfXAozcWDa1ZXAIFd8OSC8awb24wCm0PtnJu00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qy7swvO6; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2bd266f6fc0so15882855ad.2
        for <linux-rtc@vger.kernel.org>; Tue, 19 May 2026 02:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779184781; x=1779789581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gYcglXM9KzfiYfoBsPDSPF/vfmen4eIpWjxA71ahXH8=;
        b=qy7swvO6jMELFkejJI6CbNqfjj6NDmz6mrC9zE2evq3/XyXLtSuNqT009VHeaxkXHL
         qw7g2W8ks9p9DnrtE+SaXgPA41TKPshJssiGVG6gcQw4PlNsnUQKXuxyLFI7gYIi3Xwa
         oGQJPtPnB8ENWF/TfaT7EHO+Y2CTUrGjYkYQXjSN8PEwBtZ+UQMMLf0UUGyFZUyqTyVH
         RxZ6KRNnx0Jn2Ar2e16jiNVW7uINpgyT5xyWaRfw3CvnHyZ+Lv5k5E1ipfEBSB0rpu3o
         3Jyt6Xx0sXZri45KrZb2NrD5rbPuMD4gWT33v4A2PDyyYR9l/+vVX85Nd4ILR3UtBkLP
         haTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779184781; x=1779789581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gYcglXM9KzfiYfoBsPDSPF/vfmen4eIpWjxA71ahXH8=;
        b=BPScU/vtlOyAG6p/6PAQBuLfYtZ7qWvNwDPTnBnEyVRZ8B0ynPiw0hurTJhEmaMfdk
         bU4puiaJy8vZKUlIlgy9uM7wKbDoueBkP1uF/HChCH3t3dSzFWxX2u/6qWaRe4+3ZfnG
         Wy2qk6rRpmr1SHrEz4dOYwM/aVYBGaXShIfV3vYtf1nX28L+2Mr4Tt5BRIg/Jtv8rV4O
         vwQgOsOBZ/rhQyBvHTlLcpcacilQa0W6UIpCTwWgTOUMee5Xwv+lFP1LmPnZ0gbX+EUT
         y2bG/9NwYmzCcQzm7pWMkIUW3SJv6M+CBUC7aXUntWntM24olh2MwjByk939wazngQ2y
         49pg==
X-Gm-Message-State: AOJu0YzomHDLMOT2T2LDX71ry+kq+G3Hg2PjbWyPXLGwbeSDLt0CBU9o
	VvoOXTJCWEm6PnGBppTidc4lraHgWRE9TyYJeJMwEqQ/vpeLRQg669i0
X-Gm-Gg: Acq92OEqQ1chNeqwAY5bKBb84o9h+DI4WLd8Fyar4TCG+88GX7I4THgazPY3OB5ox9n
	5zoHUDtqRREjGuYECgyzRMVJnHpqXNuNH034azWbwso2Go3RsBuYqXjGK5WX50Sb898kW5RvujW
	lJ1fxL4um9G/mNggV1IEI1QnZK4lrQj2BM/4OihNY8Jpu/Z+D6wCB0GyY5vUOuG7aHswyYGuwG/
	LJUZhkhjew7NBxO+M76YgOUBxeEa7jGlCOzF0zLqiRFdCzdUZz4Ev9wW1UbOHZCpetdnzN6I1sB
	0i+PTTEW847lSP8zkZBwpc1x8eV4tlyXgBF4JseZK0y+h25MV2HOKQ79MtIjUGDYKrgAleRDcKh
	AbhSD9juozaSkY9/Q4cwffoijUaWKl1tVPrwMAn/KBYqi3w3NuW63Hge06sPfZMqARcezBrmb85
	gJAyogJa1UJYbK+KNtFL3ReuEeINRK6n1YRwHkf5XsCA==
X-Received: by 2002:a17:902:cf0f:b0:2bd:d7c5:9272 with SMTP id d9443c01a7336-2bdd7c5a144mr89237555ad.6.1779184780977;
        Tue, 19 May 2026 02:59:40 -0700 (PDT)
Received: from Tejas-Legion-7-16IRX9.. ([2401:4900:909c:a9f7:b613:edee:96b:45ff])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c0600a4sm168905445ad.30.2026.05.19.02.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 02:59:40 -0700 (PDT)
From: Teja Sai Charan B <tejaasaye@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Teja Sai Charan Bellamkonda <tejaasaye@gmail.com>
Subject: [PATCH] dt-bindings: rtc: Convert rtc-cmos binding to YAML
Date: Tue, 19 May 2026 15:29:29 +0530
Message-ID: <20260519095929.76011-1-tejaasaye@gmail.com>
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6547-lists,linux-rtc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tejaasaye@gmail.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,bootlin.com:email,0.0.0.70:email,devicetree.org:url]
X-Rspamd-Queue-Id: 6ECA757BE80
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Teja Sai Charan Bellamkonda <tejaasaye@gmail.com>

Convert the rtc-cmos devicetree bindings to dt schema.

Signed-off-by: Teja Sai Charan Bellamkonda <tejaasaye@gmail.com>
---
 .../devicetree/bindings/rtc/rtc-cmos.txt      | 27 ---------
 .../devicetree/bindings/rtc/rtc-cmos.yaml     | 55 +++++++++++++++++++
 2 files changed, 55 insertions(+), 27 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-cmos.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-cmos.yaml

diff --git a/Documentation/devicetree/bindings/rtc/rtc-cmos.txt b/Documentation/devicetree/bindings/rtc/rtc-cmos.txt
deleted file mode 100644
index 7d7b5f6bda65..000000000000
--- a/Documentation/devicetree/bindings/rtc/rtc-cmos.txt
+++ /dev/null
@@ -1,27 +0,0 @@
- Motorola mc146818 compatible RTC
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Required properties:
-  - compatible : "motorola,mc146818"
-  - reg : should contain registers location and length.
-
-Optional properties:
-  - interrupts : should contain interrupt.
-  - ctrl-reg : Contains the initial value of the control register also
-    called "Register B".
-  - freq-reg : Contains the initial value of the frequency register also
-    called "Register A".
-
-"Register A" and "B" are usually initialized by the firmware (BIOS for
-instance). If this is not done, it can be performed by the driver.
-
-ISA Example:
-
-	rtc@70 {
-	         compatible = "motorola,mc146818";
-	         interrupts = <8 3>;
-	         interrupt-parent = <&ioapic1>;
-	         ctrl-reg = <2>;
-	         freq-reg = <0x26>;
-	         reg = <1 0x70 2>;
-	 };
diff --git a/Documentation/devicetree/bindings/rtc/rtc-cmos.yaml b/Documentation/devicetree/bindings/rtc/rtc-cmos.yaml
new file mode 100644
index 000000000000..e368264ac483
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/rtc-cmos.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/rtc-cmos.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Motorola mc146818 compatible RTC
+
+maintainers:
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+properties:
+  compatible:
+    const: motorola,mc146818
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  ctrl-reg:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Initial value of the control register
+      (also known as Register B).
+
+  freq-reg:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Initial value of the frequency register
+      (also known as Register A).
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    bus {
+        #address-cells = <2>;
+        #size-cells = <1>;
+
+        rtc@70 {
+            compatible = "motorola,mc146818";
+            reg = <1 0x70 2>;
+
+            interrupts = <8 3>;
+
+            ctrl-reg = <2>;
+            freq-reg = <0x26>;
+        };
+    };
-- 
2.43.0


