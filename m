Return-Path: <linux-rtc+bounces-6731-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F/1UCeZxO2roXwgAu9opvQ
	(envelope-from <linux-rtc+bounces-6731-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 07:57:58 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CE76BBA4B
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 07:57:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=UwQFkaVE;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6731-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6731-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9683A30CDAAB
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 05:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF04632E743;
	Wed, 24 Jun 2026 05:57:02 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD3832AABA
	for <linux-rtc@vger.kernel.org>; Wed, 24 Jun 2026 05:57:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782280622; cv=none; b=YgdrELG/4BeGJOqEqc+41M+mWCuHTlLJKyq51rghx2u6k10vAYn2aS9/3Q7HqTodZg2zKw57XtejPzFEfCxlxDETGWlsMZzP4X7ksuwrpFhKsAyv5lpVSWu2MtcJx2CWMREtQBVU8l8XVnWsXspcsLaSL5A42jUnxaYCbSFxUbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782280622; c=relaxed/simple;
	bh=2Oa3gWUqiv60AmEEbko4WvF89zBxld/jaKyNngfmtjg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ekeySXc7bR48pog/EKL8nri7IBDv7oA47S9U0B+Uh+d6zIFSMs1H8crmeVEpG4KtqKt4l4sricxfRijBWY3YlfrSs6y8XeR8G8ZbM7/5U+Ap2B/s1RPOqzsbkhI1EpCVONxumRnwP7JU6j4i8JJwIGfANEsgGDN/KVUgwHq3/6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UwQFkaVE; arc=none smtp.client-ip=209.85.215.182
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c89370405aaso239716a12.0
        for <linux-rtc@vger.kernel.org>; Tue, 23 Jun 2026 22:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782280620; x=1782885420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7vTuRJJKfRZ8rcgDCBsBsq6iRcx2SeEj6L1B+EwY0TA=;
        b=UwQFkaVE7FwHguWEzb46w5730UEpo/Jc1pMq/wlNl/IQqNrtsuEen6t5FZGzpghAoV
         ilmhZsOI0i/1vMFV/itfXESmGCP8kx0ZPp7uIoAL683hhzd06q+U4hbaZDH6pEvmtvHB
         sb/2ho+SDoGoe3rnxRGNaTUlWqGhGchWraEJ7g9cVE/JVAJxZSiUSo9jG57RVbiiGMnD
         1HIj11Vu9+47eIeEURerA0mkg5oWl1CYBo/vwg5HrkkvumfHeM9msV/znAvarY1cTmaL
         H/nGIU4ogSWOrsOZrLFVulvanwkMgtxoS/nCXWJqVI0lKBO0t2ccT97BF8HxKTKy7Tqd
         ARyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782280620; x=1782885420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7vTuRJJKfRZ8rcgDCBsBsq6iRcx2SeEj6L1B+EwY0TA=;
        b=fzoBseJv1fYW1JIyVD7nHVh6PzYknGOjRKiUHYCUs2wI0Wwp9rci6rXQITI3HK/LTU
         SE2XDNNZMEWiDS7oGWK4/LMX9tKu+rAUTb9mqOlzVTjKPNPLl3RCGznh7xBvAxLOM3xs
         F7/aV4/7/O1p0ggwnYqP3qGqcXx49WHuBkenE7jb11DU9TxN47BABR0TO6e+6pTNAtcm
         3jeFz/tOXgEw2evmFJCmio032KZ4ARdOqSkO7wtADttoKqEvwA1W3BVIIbalHriPb4bD
         P8zW6WWJBO0iaHuAy62sps5koqMcO01uY5Gwo8fgzFklbZCXvaFIwPrEzhqn/f+hAlTI
         EZ2w==
X-Forwarded-Encrypted: i=1; AFNElJ8II1i5d6WhjX3iRPgDgEeatBYHPSr8kXnA3jbdD/i+Oa82KtBse6MKPcny2KoBft3dlsQPMEutW6I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtL2KvnYd7n+fNDmkJgBkPl2dueTOYDwsxFAOqV54GWhDBH/IV
	sOW2ZzBVlk0y4Owe9Ym21vC7EiI0Sg2nY4nO3vY7ec3ZgTkyvVOZB5Lu
X-Gm-Gg: AfdE7cm46dOcRe8TMDWcIKQ3luJMU0R/ymYYJEs9hg0FN/aviLvt0BIXmdo2KlXoTQn
	e7fOqDqLGc9y1Len1uCtKnGIwch30gX9wsWmrgK1usd2QM3ytPIqjl98EaDQiMJa69DGrRaFDa+
	tzk8oV+ZZqY9UtwW5GMBH8B/lBAQCn/quOClqoM7qhXI155XxwxA8qsejrCz37SC0dfwfQI5ec0
	Hj/KMdegesnwtHBKrxRivU9sZeeQ8RWPItvnctTzZuaroGhFRNx7Krj461A9gQ1NNDCKClUoPYW
	2uyhxv94Jet61tTnVdVQakSBOBbPGbQLfy3+BZb1H87G85BCcINvyFlgXEjuYybMZzHcnW030qQ
	gDZjNursQA4OSOJURItVmjC3jbO/dbKkWcbM+HHuxvdjp/R3+wgVvwfinqg92iUYYpgNN1le/VN
	A7371G0TKvIiD1aBUz4HBy9ERonIjSexY=
X-Received: by 2002:a05:6a21:69b:b0:3bb:106d:77be with SMTP id adf61e73a8af0-3bd1527d66bmr8223822637.44.1782280619978;
        Tue, 23 Jun 2026 22:56:59 -0700 (PDT)
Received: from inhnjlux1020.ls.ege.ds ([103.28.245.138])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c91e65bab0bsm524110a12.27.2026.06.23.22.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 22:56:58 -0700 (PDT)
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
	Udaya Kiran Challa <challauday369@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: watchdog: microchip,pic32mzda-wdt: Convert to DT schema
Date: Wed, 24 Jun 2026 11:26:48 +0530
Message-Id: <20260624055648.127399-1-challauday369@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,brighamcampbell.com,vger.kernel.org,gmail.com,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6731-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:tsbogend@alpha.franken.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:skhan@linuxfoundation.org,m:me@brighamcampbell.com,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:challauday369@gmail.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[challauday369@gmail.com,linux-rtc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B3CE76BBA4B

Convert Microchip PIC32 Watchdog Timer devicetree binding
from legacy text format to DT schema.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
---
Changelog:

Changes since v1:
- Fix example indentation
- Correct example clock specifier from REF2CLK to LPRCCLK

Link to v1:https://lore.kernel.org/all/20260620172354.155565-1-challauday369@gmail.com/
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
index 000000000000..a5dd633c3e78
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
+        clocks = <&rootclk LPRCCLK>;
+    };
-- 
2.34.1


