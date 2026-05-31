Return-Path: <linux-rtc+bounces-6596-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBUYNuxsHGpMNwkAu9opvQ
	(envelope-from <linux-rtc+bounces-6596-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 31 May 2026 19:16:28 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F376174FB
	for <lists+linux-rtc@lfdr.de>; Sun, 31 May 2026 19:16:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2FF61300E3F6
	for <lists+linux-rtc@lfdr.de>; Sun, 31 May 2026 17:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C8FD391846;
	Sun, 31 May 2026 17:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B1XsS8Mp"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6762367CF
	for <linux-rtc@vger.kernel.org>; Sun, 31 May 2026 17:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780247786; cv=none; b=UrgIbNHd6rlNHL2Aih/6pX5uWp8pdTeL2Wf/OuwCQpfiYQvcfLGltpn4GQdz2ESc2VLR//1M63BOqhuMvwmkHJ/WRkZC/ksUW6voEHO+Iw4VMWYPZJUkQCRdrQ3Ztd/JHkBZsatVQOJEv0j2Sv/ICnXw5xBqXXhdRZohBf65n4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780247786; c=relaxed/simple;
	bh=2fCWX69Y+kcB+ia8WCX2rKTJNvzIUwiQE4WEQWpIuWg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P9BqCZu0Jqs0CzZBqVmGcCtvum59uLgp34QLP9aivzzt/cUOIepmSgvhyGusLrK9NqQs37SSNz+Ge6XQXia3NdtTnf3IEYi77cEuJCpE6G+fMOv4qhdHSd5knB3JXQOcu4Q4BmwTbJZc1p1/6zgtLEXEJ5Y1aamf5xoVFkHU3No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B1XsS8Mp; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84230ab8857so360786b3a.1
        for <linux-rtc@vger.kernel.org>; Sun, 31 May 2026 10:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780247784; x=1780852584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3lyQO707I/P8tVPbDfsBBqk4+MihDYNubj9hUMQ7LGg=;
        b=B1XsS8MpxLlJBQYsUe+CUiO0WKp9DfqdCn5aUKXitJsAvPECd+ExfJBNVMzWVeAvu+
         JDaYc17eGGBpnqQYPkkG2T+GxLHg4u+OQpzvd1pVcJrEYpmL+4N3LaJI/6OK+lRVZ17C
         5Jg4+f8ltz3fnnUjPm/s0S4MoVXxYn8ZcqtG3LWdBg205BCl13uyIWQPpm34fLp0EK4c
         0ffeM/DJgK7h2vl1sKv9a3mpX2257PTP1bO58k8L5ELbRMwCXGWPF/VpJG8oLxww0gIc
         02pBRNtmOUXaymwGGrVPjQtlHAGefHpFYPeS+XdRVNQUkhbY+KHIN/Rxy+Ngm7j2XjlS
         n0Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780247784; x=1780852584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3lyQO707I/P8tVPbDfsBBqk4+MihDYNubj9hUMQ7LGg=;
        b=IihW6WeDVM0swBuAzunVd5La7I4avxsd6eaDG5/xmqx+tx1r0jOljMz8EzTdsi0YKn
         /r9runF20SS5BmXA212IQigaDGgg/0gEn8vcIp980horBUHaEDaKkOAMZ360cWCulHi/
         vnki4Wl/I5AF/2yP19z9FL00N6lAcuo/QP7D/S6DJw0do4Phok1PkpOhPx3ByKuLAldi
         Qygfrfg3z2B0FonTfR3g3wkdOxQuEjL4q5fwS3W9JYYC4TabO6Nqj4wxA30j67oIf9EI
         J6yAGxSu9+FiVIsuq3cxT+zAlryBpYr5s9k6yUJP2Rzn/vhZxx0bbSJm+2Jo/7tAc0Da
         iJcA==
X-Forwarded-Encrypted: i=1; AFNElJ/gDdv4TPwKM3cWajNblb3dAgmj8YatcwJeEc9nMJiQGluDgAAlZKBagDYW0ozvNyltNPhjRf9Ri1I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxViq+QlQs6OHvz1qimHeXGP2NgmZi3WI7XqJCoHGSrZjPu9AuG
	rUbnV7lL12kZK2U3oKH9ibWrhqzSlpynoqn+yYV/bYjZF2HKHCLlU3jS
X-Gm-Gg: Acq92OGORNK3DctZA0n02G9s4y10O+dHtNWSLefXZYHZYsDgiIR+Uvy0KbJDyj8MTNG
	nZqnv4B115fNPgAQzFQnlYInXj/DTzBPl5aj868ZgBg52dvvLyYT+eJbw7wRruMPwhvK2YoqC3M
	doA7ryIyTvJpJZ2iZ1EzTobhYF/kJFdu4wSpJpGVjAf/w2aZCbsORwA6jeJ6rSYUTFsk82MrxXg
	O4/okbP4yWa7k/cSZEbS84pX9JG7eka+oXj94wG508iIvB+36VF9sBYzgqfIh9IMAlB9Q9QTqNw
	MAkoJMuW7F00MmwN9w51zzbww5Q8kltI/7v4gtX3mkVFznMgTWMMXJCC5V370KDdhC/42yg/daT
	PrZCwl/04HnKc7FgL/ixTvNnwO3RhLTC3D9ORVtliwvB4byejNp+PqgGKqefh33DRVDNzW5LDRQ
	KnReW7aDNCLNi0s18RR3AFD5cdc4uNQG1BFLjEzxBpl9ubtpPogA==
X-Received: by 2002:a05:6a00:3d01:b0:82c:24d5:63e6 with SMTP id d2e1a72fcca58-84225362440mr7143283b3a.15.1780247784363;
        Sun, 31 May 2026 10:16:24 -0700 (PDT)
Received: from ultimate.. ([49.204.165.28])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214b2ae2esm7905937b3a.15.2026.05.31.10.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 10:16:23 -0700 (PDT)
From: Udaya Kiran Challa <challauday369@gmail.com>
To: alchark@gmail.com,
	krzk@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Udaya Kiran Challa <challauday369@gmail.com>
Subject: [PATCH v2] dt-bindings: arm: vt8500: via,vt8500-pmc: Convert to DT Schema
Date: Sun, 31 May 2026 22:45:55 +0530
Message-ID: <20260531171612.4536-1-challauday369@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FREEMAIL_CC(0.00)[linuxfoundation.org,brighamcampbell.com,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6596-lists,linux-rtc=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[challauday369@gmail.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url]
X-Rspamd-Queue-Id: 47F376174FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert the VIA/Wondermedia VT8500 Power Management controller binding
from the legacy text format to DT schema.

Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
---
Changelog:
Changes since v1:
- Make child node binding constrained
- Fix example to include the clock container node
- Fix maintainers list

Link to v1:https://lore.kernel.org/all/20260524110047.37590-1-challauday369@gmail.com/
---
 .../bindings/arm/vt8500/via,vt8500-pmc.txt    | 13 -----
 .../bindings/arm/vt8500/via,vt8500-pmc.yaml   | 53 +++++++++++++++++++
 2 files changed, 53 insertions(+), 13 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/vt8500/via,vt8500-pmc.txt
 create mode 100644 Documentation/devicetree/bindings/arm/vt8500/via,vt8500-pmc.yaml

diff --git a/Documentation/devicetree/bindings/arm/vt8500/via,vt8500-pmc.txt b/Documentation/devicetree/bindings/arm/vt8500/via,vt8500-pmc.txt
deleted file mode 100644
index 521b9c7de933..000000000000
--- a/Documentation/devicetree/bindings/arm/vt8500/via,vt8500-pmc.txt
+++ /dev/null
@@ -1,13 +0,0 @@
-VIA/Wondermedia VT8500 Power Management Controller
------------------------------------------------------
-
-Required properties:
-- compatible : "via,vt8500-pmc"
-- reg : Should contain 1 register ranges(address and length)
-
-Example:
-
-	pmc@d8130000 {
-		compatible = "via,vt8500-pmc";
-		reg = <0xd8130000 0x1000>;
-	};
diff --git a/Documentation/devicetree/bindings/arm/vt8500/via,vt8500-pmc.yaml b/Documentation/devicetree/bindings/arm/vt8500/via,vt8500-pmc.yaml
new file mode 100644
index 000000000000..e340281e5726
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/vt8500/via,vt8500-pmc.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/vt8500/via,vt8500-pmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: VIA/Wondermedia VT8500 Power Management Controller
+
+maintainers:
+  - Alexey Charkov <alchark@gmail.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
+
+description:
+  The VIA/Wondermedia Power Management Controller provides register access for
+  clock and power management functions on VT8500 and WM8xxx series SoCs.
+
+properties:
+  compatible:
+    const: via,vt8500-pmc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    type: object
+    description: Container node for VT8500/WM8xxx clock provider nodes.
+    properties:
+      "#address-cells":
+        const: 1
+      "#size-cells":
+        const: 0
+    required:
+      - "#address-cells"
+      - "#size-cells"
+    additionalProperties: true
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pmc@d8130000 {
+        compatible = "via,vt8500-pmc";
+        reg = <0xd8130000 0x1000>;
+
+        clocks {
+            #address-cells = <1>;
+            #size-cells = <0>;
+        };
+    };
-- 
2.43.0


