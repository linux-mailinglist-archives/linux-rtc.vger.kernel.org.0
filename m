Return-Path: <linux-rtc+bounces-6567-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NNQBG7aEmoU4wYAu9opvQ
	(envelope-from <linux-rtc+bounces-6567-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 24 May 2026 13:01:02 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1D55C224A
	for <lists+linux-rtc@lfdr.de>; Sun, 24 May 2026 13:01:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E5E530036F6
	for <lists+linux-rtc@lfdr.de>; Sun, 24 May 2026 11:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B4B031E84A;
	Sun, 24 May 2026 11:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aMXWfRg3"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C33E2DF142
	for <linux-rtc@vger.kernel.org>; Sun, 24 May 2026 11:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779620459; cv=none; b=lp0fb8kXIO9ZEKE5csoLEBIZR+U/+BPt6M2kxVVfDafoftKWsLqX1mb1OxCuqfES7yA8TzyMw0OcRtCzgSYWC1jV7wcrAnA6pxj4R46AbFFUGsM8vNiw9cMMsRWcVs4kxqV6S7kUM00kO//EDP7ltX6ILD/BhvSB22RlD2WBvsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779620459; c=relaxed/simple;
	bh=sWQOh4l4puXE/Xqjx4bJ4VS+WIF1L+pwK8QQ1Y4yu/M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kb+4U09KisYH+JEue5PpiMkY9NYkq+Q369VmHbm5ZDR2q8sWBWIwpjyN9GsFMrrZttV63QAyOMP9a6dVeo9qTuAmIU+7/KIkP994A81uDt+Q5Hi0/7Hgtmz2SrbYJRM7PlO4KnaiU4CvtFhc7T7oPp4p0HIfsClBen1Nkqm39D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aMXWfRg3; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3665a90bcd3so9565079a91.1
        for <linux-rtc@vger.kernel.org>; Sun, 24 May 2026 04:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779620457; x=1780225257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PVpHywYEV08yQtd4cipuOyW3xe6a75cgM/PkwquU8rE=;
        b=aMXWfRg3z0Ne3C2BM4EIYFCJBCz9TaUJra3PhPW/Jld8d9beytFG8arr4ktNJD5i72
         s3PdreTZH7gO/cy3FMh2wAIaoq6T80GKfAKc9y6mRfm2r9oq9ss3Wo8W9+MJYi3XSHIJ
         UgHE8UCvP2uC3QubhGay6FIhGEF0j1c+Teu3wYrNmuQ86VpcSxwkFUJ01KsiA1dNtYzJ
         Qb4XDp3BpRvs0wnEi0871j0yqZC+iPhcEru+ZQ1TjW6Iv2QALOPGdwFzNh5QPCyYNGA7
         7Qy0fmga2CZqEpbXmar+psRthewN2FnHWBIRbd18d/YdZBEM+WmBb2xTw2d8EughJkYY
         XEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779620457; x=1780225257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVpHywYEV08yQtd4cipuOyW3xe6a75cgM/PkwquU8rE=;
        b=nSfbxCfr4BNUSPQ2hlceFjfyaRmefV4a1zDkqp5qTxzLYyecg+/xj/fGGzM73ndrTN
         WDRYrULvgJDtiZ5eQ3Rdh8mQ7c+FeYz2aSiX7zEGnbQipLHO/aSemeZtQVGy5nEeN2Y6
         ozVN8JIPCuLxOS0QsIVs7T1Nn+wMI7OxKQUlQLOCQA7E0dVkYE4LdNQQ1FwfvLA+FxK0
         mizqaPPfIzLRz/w2LnvTLoKs6QLpHgBWt4Yp+veo1Pd26/GM7IR2XRV5tXpQrtEF6n/E
         omm+8D84JmFGCQqH1NFWsUmeO0YMvK+EGZwMDTUv0g9EH7Xh04LEMTsCpBlCJHAxJVOa
         y0Sw==
X-Forwarded-Encrypted: i=1; AFNElJ/mXBKrxjKIJxrItNVhBgXSW4nl2eJu4PoiuSRcgjmYf2DaZNM2VD4kf80h9pfoClRPP9zl78ULDac=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/W7P196nPSXQjHBzmdfxC6HQnsA3BcMh70dwKjwn6gIacM/Gp
	Zwm0omvuxWFyC7Yxx+xYOZzX0ESfLJ4MxJlHBzb+mPBh/eMwqIkphSot6r2aKij8
X-Gm-Gg: Acq92OGuRAAy6TAg6JJuCKzc2wVHvRkm8KUE5Guipop9r/HgzZr/w8n2QAJFlcbQ5j1
	SxZf1K/eCVGeLI1oNal0RDWkRWt51gnWYiAzrby6bPnhu4pZZbOHYTlC262ZR6UkmrKTY7EI227
	jP+Gs4alHQZHbuUhMsPuoiOhozwMxk/urPrN4KYq3peKLIQ6FeLD9XFe2HH8im0lwDRqDXiKghm
	W/Yb2vw+MDwGtpDrdaxdP0xCFrBgmDbZxuNIoyFSPvLPCygSLSK686SbG6OphKqVKCfn4zxh+Gh
	G59b0ck8N6c1TsDqc9mkOfWetXk4jYEhAkJSAJxi3BfEQBbVr9ClB1KEP/2IdBkSS82xXYMX3f/
	AFEMCK3xpxzOxemAVkUPkgrAzCx9RJuaDHypOFKNKO3W0exSnHRYpW+9BIe1YzXu6SputD8uqwh
	sQvw6AAH6N6VExXw84KozUwke5p1j++qJ8gpuaYvE+R5yebUma
X-Received: by 2002:a17:90b:2f8e:b0:366:1172:597e with SMTP id 98e67ed59e1d1-36a67472642mr9787268a91.9.1779620457338;
        Sun, 24 May 2026 04:00:57 -0700 (PDT)
Received: from ultimate.. ([58.84.60.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a6772f486sm3726745a91.2.2026.05.24.04.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 04:00:56 -0700 (PDT)
From: Udaya Kiran Challa <challauday369@gmail.com>
To: linux@prisktech.co.nz,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Udaya Kiran Challa <challauday369@gmail.com>
Subject: [PATCH] dt-bindings: arm: vt8500: via,vt8500-pmc: Convert to DT Schema
Date: Sun, 24 May 2026 16:30:09 +0530
Message-ID: <20260524110047.37590-1-challauday369@gmail.com>
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,brighamcampbell.com,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6567-lists,linux-rtc=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[challauday369@gmail.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,devicetree.org:url,d8130000:email,prisktech.co.nz:email]
X-Rspamd-Queue-Id: 6A1D55C224A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert the VIA/Wondermedia VT8500 Power Management controller binding
from the legacy text format to DT schema.

Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
---
 .../bindings/arm/vt8500/via,vt8500-pmc.txt    | 13 -------
 .../bindings/arm/vt8500/via,vt8500-pmc.yaml   | 38 +++++++++++++++++++
 2 files changed, 38 insertions(+), 13 deletions(-)
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
index 000000000000..ac603fd4efec
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/vt8500/via,vt8500-pmc.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/vt8500/via,vt8500-pmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: VIA/Wondermedia VT8500 Power Management Controller
+
+maintainers:
+  - Tony Prisk <linux@prisktech.co.nz>
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
+    };
-- 
2.43.0


