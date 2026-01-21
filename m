Return-Path: <linux-rtc+bounces-5813-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IICYCFS0cGndZAAAu9opvQ
	(envelope-from <linux-rtc+bounces-5813-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Jan 2026 12:11:16 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E4455C27
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Jan 2026 12:11:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 94245685B06
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Jan 2026 11:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 497A73D3010;
	Wed, 21 Jan 2026 11:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="pChYFRql"
X-Original-To: linux-rtc@vger.kernel.org
Received: from sender4-op-o16.zoho.com (sender4-op-o16.zoho.com [136.143.188.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8708A322C6D;
	Wed, 21 Jan 2026 11:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768993433; cv=pass; b=hSppgHFfGpfuRJzklR1osR0AJinUHCPp0ZSRIyBRc02hwEK5g4cawEItB/or5NXb+sJBtAaSE70Y5rNuHqNeddbSCKKRGoNqpdOForUkdd8a1ebWgS2sFjzAhB2bCAu++rCp7W0OTzRo8b/fgkoh9GavVMlbAeh3UV7CJ164jys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768993433; c=relaxed/simple;
	bh=FwhOWdAgFS7+1O1ZbgLX/1vXBMUsUQ0bukUjcITrw1g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mpP8UBQ00njghWUo5hUQYc75SGTB4PjHcTic0SRNe3etG+HoHv8rSFPUZ6K4ySJ2KYl+/Kz0uLaoCjnry8Pkb9xwb75nJ4hL+JVwt0lKW20FeJn5PcUah9jm3GMKM4twrfA8Gt2KP+b49tivawJmnoG3HFfGHkVwrAFY/w1e5uQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=pChYFRql; arc=pass smtp.client-ip=136.143.188.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
ARC-Seal: i=1; a=rsa-sha256; t=1768993411; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jMX5cUVOd6K11rH+ruCUDSkyR1Bahv+y4wCNnUtdJtfnPzPTdHSVWp6vCtytGaNH5F8LpJsbn1sNYDRXnps7+qMmZm11LKS7/7zf4Xmo4lLCpAMVhAT06NnfXEEPV9qyxvZQKR4VT+wWqOBREXXz1v/TactnXGpxec4ZCTE3qkk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768993411; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Wy04XAmCKMPl7NSQXKqkGhuam6Urng2cs2pZpGeZnEw=; 
	b=U6Z2QUsbWQ/5Ia1uzbqgkG1ZjNt6uT6e9NNeGb1wbFwFp3asMqtgHfBJGcWmnhcWzqlAzWzdDKJLptrCvl5nIxGj3vaw7tRArDOoc+EVFxYynP0KRinS6ZoKxXn7PsY8rxq7lFanRLt5BL9Biqyi4FHbtfWLLyrP7RN/d4sZgPY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768993411;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Wy04XAmCKMPl7NSQXKqkGhuam6Urng2cs2pZpGeZnEw=;
	b=pChYFRqlT8PNsDosS1Hc3NkVL/6iHYsE7XTwMtI55pusKLZ2sT9w1+b4JHPuwfEk
	ZU31ZxS9nQY3m5WnxFZqWWW42etIQkFlTckMBIfw6niNlZpHSN5pJsNllkCNh8KjA4P
	5EXAHGxJWqjM92AgA5KAvdY6cmZw1mxTo6mZmNMQ=
Received: by mx.zohomail.com with SMTPS id 1768993407771767.779557047111;
	Wed, 21 Jan 2026 03:03:27 -0800 (PST)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Wed, 21 Jan 2026 18:59:07 +0800
Subject: [PATCH 1/7] dt-bindings: rtc: sun6i: Add Allwinner A733 support
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-a733-rtc-v1-1-d359437f23a7@pigmoral.tech>
References: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech>
In-Reply-To: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768993386; l=3681;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=FwhOWdAgFS7+1O1ZbgLX/1vXBMUsUQ0bukUjcITrw1g=;
 b=0ke5sPzNYqFQyETLieeUmRmQylGENypMyuQeatPZiHgBSQaGCkg7KqpCR6pWwix6YSup66/g3
 nQ7yVRAvF7zCq+LE3B9kfLdmj8zStNvm+WkGSSqTGOObZEmYG4XAyU4
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=3vU0qIPJAH8blXmLyqBhKx+nLOjcLwwYhZXelEpw7h4=
X-ZohoMailClient: External
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[pigmoral.tech:s=zmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[baylibre.com,kernel.org,gmail.com,sholland.org,bootlin.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[pigmoral.tech];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-5813-lists,linux-rtc=lfdr.de];
	DKIM_TRACE(0.00)[pigmoral.tech:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[junhui.liu@pigmoral.tech,linux-rtc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,pigmoral.tech:email,pigmoral.tech:dkim,pigmoral.tech:mid]
X-Rspamd-Queue-Id: B4E4455C27
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The RTC module in the Allwinner A733 SoC is functionally compatible with
the sun6i RTC, but its internal Clock Control Unit (CCU) has significant
changes.

The A733 supports selecting the oscillator between three frequencies:
19.2MHz, 24MHz, and 26MHz. The RTC CCU relies on hardware to detect
which frequency is actually used on the board. By defining all three
frequencies as fixed-clocks in the device tree, the driver can identify
the hardware-detected frequency and expose it to the rest of the system.

Additionally, the A733 RTC CCU provides several new DCXO gate clocks for
specific modules, including SerDes, HDMI, and UFS.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml      | 38 ++++++++++++++++++++--
 include/dt-bindings/clock/sun60i-a733-rtc.h        | 16 +++++++++
 2 files changed, 52 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
index 9df5cdb6f63f..b18431955783 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
@@ -26,6 +26,7 @@ properties:
           - allwinner,sun50i-h6-rtc
           - allwinner,sun50i-h616-rtc
           - allwinner,sun50i-r329-rtc
+          - allwinner,sun60i-a733-rtc
       - items:
           - const: allwinner,sun50i-a64-rtc
           - const: allwinner,sun8i-h3-rtc
@@ -46,11 +47,11 @@ properties:
 
   clocks:
     minItems: 1
-    maxItems: 4
+    maxItems: 6
 
   clock-names:
     minItems: 1
-    maxItems: 4
+    maxItems: 6
 
   clock-output-names:
     minItems: 1
@@ -156,6 +157,38 @@ allOf:
         - clocks
         - clock-names
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun60i-a733-rtc
+
+    then:
+      properties:
+        clocks:
+          minItems: 5
+          items:
+            - description: Bus clock for register access
+            - description: 19.2 MHz oscillator
+            - description: 24 MHz oscillator
+            - description: 26 MHz oscillator
+            - description: AHB parent for internal SPI clock
+            - description: External 32768 Hz oscillator
+
+        clock-names:
+          minItems: 5
+          items:
+            - const: bus
+            - const: osc19M
+            - const: osc24M
+            - const: osc26M
+            - const: ahb
+            - const: ext-osc32k
+
+      required:
+        - clocks
+        - clock-names
+
   - if:
       properties:
         compatible:
@@ -164,6 +197,7 @@ allOf:
               - allwinner,sun8i-r40-rtc
               - allwinner,sun50i-h616-rtc
               - allwinner,sun50i-r329-rtc
+              - allwinner,sun60i-a733-rtc
 
     then:
       properties:
diff --git a/include/dt-bindings/clock/sun60i-a733-rtc.h b/include/dt-bindings/clock/sun60i-a733-rtc.h
new file mode 100644
index 000000000000..8a2b5facad73
--- /dev/null
+++ b/include/dt-bindings/clock/sun60i-a733-rtc.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
+
+#ifndef _DT_BINDINGS_CLK_SUN60I_A733_RTC_H_
+#define _DT_BINDINGS_CLK_SUN60I_A733_RTC_H_
+
+#define CLK_IOSC		0
+#define CLK_OSC32K		1
+#define CLK_HOSC		2
+#define CLK_RTC_32K		3
+#define CLK_OSC32K_FANOUT	4
+#define CLK_HOSC_SERDES1	5
+#define CLK_HOSC_SERDES0	6
+#define CLK_HOSC_HDMI		7
+#define CLK_HOSC_UFS		8
+
+#endif /* _DT_BINDINGS_CLK_SUN60I_A733_RTC_H_ */

-- 
2.52.0


