Return-Path: <linux-rtc+bounces-6723-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id acOaEuLMNmo+FAcAu9opvQ
	(envelope-from <linux-rtc+bounces-6723-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sat, 20 Jun 2026 19:24:50 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B96206A95CC
	for <lists+linux-rtc@lfdr.de>; Sat, 20 Jun 2026 19:24:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=SMwPyswu;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6723-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6723-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5C7BE300D613
	for <lists+linux-rtc@lfdr.de>; Sat, 20 Jun 2026 17:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0702C32B9B5;
	Sat, 20 Jun 2026 17:24:09 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD46930F7F7
	for <linux-rtc@vger.kernel.org>; Sat, 20 Jun 2026 17:24:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781976248; cv=none; b=mCObbUEwolCSNJZDcf5ZspvP3KLWsx4nQquPSceJwTmdElEoAwLmpaxUcXKdSZ1ZKlb+wJeP21T2Vnp7jWnx3BAHDPxNTdS1FLN0xJx1M+jDAsx6tQXs5S5i1WYo1anIihLtSBqZIDAYOJ1uVazBoSb4YNsGJIFm1QeZj65eWWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781976248; c=relaxed/simple;
	bh=OrG173MpmokmQwAQnBCzHM3/1E6eo3eaEAN1nJggyq0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iicWJB823LEEkjMs0CUF3+yzVcRgiSHSyER7U1bXe7ecDnE/FZUMWHYmAUwa/EMzKbMD8SsfET15Le+BrWgrGgnqgpHxGeVu2rFuWYV0Vpjc+wvk9yLZzjP9DjqLl4xwLpANwAFpC89iPqfedT9IpxAKzswRzd2ugW/9WfuiHL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SMwPyswu; arc=none smtp.client-ip=209.85.216.45
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-36b95eb4bb4so1884592a91.3
        for <linux-rtc@vger.kernel.org>; Sat, 20 Jun 2026 10:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781976247; x=1782581047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VjVcopPtCu5wMI8L2H0z+lagnebo1hucNi83hHVH/j0=;
        b=SMwPyswuMb4j1/r5qsBc/VBaGKeizc+7B4VAkw4IDmsUc4I3XHIir7ep4hPdb5F0+M
         fWYnPJ9geKF2UwKrCfGCcbV/bGZqw8LEyYiU/nrgmuO+T8hM8YQ1hFBQofWWhKa/+zCi
         OWcVpuxivH3j7BrmxyqzbrY9m67EcrT4nj0UfnD+aM9DE2PUUTHhRBCF68Kqb9lluez3
         8MXJXR57L14laQzxF03T1U5a1UBGvyoN0MIe1OVtnXu6n+PF/t5BK3R+/pXZw5Y56gj/
         haXiuoJTYRvGq/cq3Wuk6Ylmp3AS327zn9cQ3ByFddcZPGYgTH8YskGCbbH2uRHRT7e/
         Drvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781976247; x=1782581047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VjVcopPtCu5wMI8L2H0z+lagnebo1hucNi83hHVH/j0=;
        b=ht63LWcGs2AXyPnGZTuleqQPnluhvoxs1Xn/ThHSyAIoFhJp1hHbvqER3aRkYHvpxj
         KahAAKGoPc0BrkgcxRsCL0dLtIdxAdlOLnvscvZklHSyLe/rk5c7K2IXloYOJSLEMd6P
         v16itwHYdP5iES3dZihpBOvAZX7l4zf9raB5Hq2p05Al+aD4mN7YlQKJBrtlwNJnDvua
         Pf2HeYIoRoKiQiP94YC2PAIjv04EQzegjc9UGfOj4CiEGa7r682vrvmJrITxU0ymo1nX
         BpUDCqGCh+SRa2V5esyoiIox5gSnmsNjnr6MO45V1wvuhtCSsGh/zaE6+Sjbw3BBgorM
         mhXQ==
X-Forwarded-Encrypted: i=1; AHgh+RrsmZqEEyu9TADCZ8mw2D+Rb8+wkgWp35OABszUk226v0wpjv0eNaRVp9c5rJSvuGjEiJjCHjoWOyY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1lHz+7KOw1d+rzqGAdas48bvIDjOnNzhqo/BgASuL+a/uR2Q0
	Pd4VMp29O0Hg5cbaG1OOdHErtMoVTzDn4l71hlKNdyXQtRTJt0QKIJ6R
X-Gm-Gg: AfdE7ckGubvHI4w+2F3ywwPaq0pGQenODmkEXT1bEDKZkH3ie5HjXLKNppuSzQbcrJg
	iFj0zkQfUwfurKWWVj59J4cUg8hGJro8Q6uEDIdqqbRUatEUtxs0BRZbGy4JXYHQfOZevCqEEty
	1mhxFI30M7ogUiaQhEa0iBbf+RprIllHCpIBO8qjlv3VElehLSFlDnSIiDej/GIxAnM8uiPbbYZ
	HkzwpFl1Q8WMwffiD8BLvsvt9J78MZvF8qF2l1+1+9xg4ZTBqHkbd83GteBFJ/hXPs+UViwUkPN
	WcIsvwq1YBtG4wqK655lX8p8M5OBky987k96okDMD2Hkzvej7XSVqFJn2AdW1HhHz6jVVViGXdv
	7RKRtH5F4MGqLDmpz1q/RHOgUYB0qWk+c7GcG+cjYEgYR9zT5JfivrPbBL9Uz6U/KGcPPLMGqD6
	QZVVXTE5T08k1cjQWZC2s37AcupdbM+O7xfQ==
X-Received: by 2002:a17:90b:4b86:b0:36d:f28b:72e0 with SMTP id 98e67ed59e1d1-37d161465admr7528238a91.12.1781976246960;
        Sat, 20 Jun 2026 10:24:06 -0700 (PDT)
Received: from inhnjlux1020.ls.ege.ds ([2409:40f0:303b:e45d:521c:1231:d388:dc73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d15de5d3dsm6109920a91.10.2026.06.20.10.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 10:24:06 -0700 (PDT)
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
Subject: [PATCH] dt-bindings: watchdog: microchip,pic32mzda-wdt: Convert to DT schema
Date: Sat, 20 Jun 2026 22:53:54 +0530
Message-Id: <20260620172354.155565-1-challauday369@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,brighamcampbell.com,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6723-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:tsbogend@alpha.franken.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:skhan@linuxfoundation.org,m:me@brighamcampbell.com,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:challauday369@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[challauday369@gmail.com,linux-rtc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B96206A95CC

Convert Microchip PIC32 Watchdog Timer devicetree binding
from legacy text format to DT schema.

Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
---
 .../bindings/watchdog/microchip,pic32-wdt.txt | 18 --------
 .../watchdog/microchip,pic32mzda-wdt.yaml     | 44 +++++++++++++++++++
 2 files changed, 44 insertions(+), 18 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/microchip,pic32-wdt.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/microchip,pic32mzda-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/microchip,pic32-wdt.txt b/Documentation/devicetree/bindings/watchdog/microchip,pic32-wdt.txt
deleted file mode 100644
index f03a29a1b323..000000000000
--- a/Documentation/devicetree/bindings/watchdog/microchip,pic32-wdt.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-* Microchip PIC32 Watchdog Timer
-
-When enabled, the watchdog peripheral can be used to reset the device if the
-WDT is not cleared periodically in software.
-
-Required properties:
-- compatible: must be "microchip,pic32mzda-wdt".
-- reg: physical base address of the controller and length of memory mapped
-  region.
-- clocks: phandle of source clk. Should be <&rootclk LPRCCLK>.
-
-Example:
-
-	watchdog@1f800800 {
-		compatible = "microchip,pic32mzda-wdt";
-		reg = <0x1f800800 0x200>;
-		clocks = <&rootclk LPRCCLK>;
-	};
diff --git a/Documentation/devicetree/bindings/watchdog/microchip,pic32mzda-wdt.yaml b/Documentation/devicetree/bindings/watchdog/microchip,pic32mzda-wdt.yaml
new file mode 100644
index 000000000000..5d91a7e22f17
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/microchip,pic32mzda-wdt.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/microchip,pic32mzda-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip PIC32MZDA Watchdog Timer
+
+maintainers:
+  - Thomas Bogendoerfer <tsbogend@alpha.franken.de>
+
+description:
+  The PIC32 watchdog timer can be used to reset the device if software fails
+  to periodically service the watchdog.
+
+allOf:
+  - $ref: watchdog.yaml#
+
+properties:
+  compatible:
+    const: microchip,pic32mzda-wdt
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/microchip,pic32-clock.h>
+
+    watchdog@1f800800 {
+        compatible = "microchip,pic32mzda-wdt";
+        reg = <0x1f800800 0x200>;
+        clocks = <&rootclk REF2CLK>;
+       };
-- 
2.34.1


