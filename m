Return-Path: <linux-rtc+bounces-6523-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GECbB4KSB2pU9AIAu9opvQ
	(envelope-from <linux-rtc+bounces-6523-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 15 May 2026 23:39:14 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9192B5583C1
	for <lists+linux-rtc@lfdr.de>; Fri, 15 May 2026 23:39:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9879F300F788
	for <lists+linux-rtc@lfdr.de>; Fri, 15 May 2026 21:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 835983ED5D9;
	Fri, 15 May 2026 21:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="PlK41xGT"
X-Original-To: linux-rtc@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC9E405C21;
	Fri, 15 May 2026 21:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778881151; cv=none; b=HeE/kkqp3OfpT5HR5IvYPjLqJCGGwaKF0U8FU2ylHt4w/s3Q6wutLUTYEZ+w5PBMTpiW2IKkwzxdYMMPIZ+EPfXCIgAXr1xRFf0s5vFNuDNUBCuPPjDfnTq0Qm3MNeTGYtQV3PLWpmI8geMJVuM/cgGfQaft12kkae2E4uw+vnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778881151; c=relaxed/simple;
	bh=yhg5gVajDM6Da2FgjY3mvjRRBtWbHEv5TqLXfC/zzJU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eECedBIpDpskQC0i8IrztX7d9fzefCRunnZtfeYbGSygXRWlOBSB3kWNYFLfZBoiblRtkHqSElYr16qnftrvumzODY/UEUQZ8ZDgYM71vOUfdgdXviYnHzuELR8bNMhq27gtfGdWyaDuwMP7HJM3sMXQncc/W8a6e3UrPcipu/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=PlK41xGT; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id CA273267F0;
	Fri, 15 May 2026 23:39:08 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dVPhHa64jfOy; Fri, 15 May 2026 23:39:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1778881147; bh=yhg5gVajDM6Da2FgjY3mvjRRBtWbHEv5TqLXfC/zzJU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=PlK41xGTTvKtrUUMPRuDOa/yDKNgeTAm+ma+J+apZk82WsbX2iNTxeTETqcsOh9tT
	 g2+my75FzXPUurlP09e1W3LE+CPIxQLjPhmp9dnjmnF8dNHuxxM837wjg1VJl/xmHZ
	 HMF9UMNt/U4DnqjYO3JBxRxRLi1k9SMb/8QhAXowL0wUovWaKETm5k6JkjaGXBEPBd
	 +dcIWkJF9Xxu4xPNYdImvf08II3HyEzcmA5piAmsd9jStsfC6vnd10u5jiK2o67CNa
	 l4XXB7AZ/jOByoo3TPTW2zROlgmoa5Ts65fdru2eYnyr3i/Er5d/W3GMqnM0JpukLB
	 z5cCTKkAi1ycA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sat, 16 May 2026 03:08:33 +0530
Subject: [PATCH v7 01/10] dt-bindings: leds: document Samsung S2M series
 PMIC flash LED device
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-s2mu005-pmic-v7-1-73f9702fb461@disroot.org>
References: <20260516-s2mu005-pmic-v7-0-73f9702fb461@disroot.org>
In-Reply-To: <20260516-s2mu005-pmic-v7-0-73f9702fb461@disroot.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Sebastian Reichel <sre@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Nam Tran <trannamatk@gmail.com>, 
 =?utf-8?q?=C5=81ukasz_Lebiedzi=C5=84ski?= <kernel@lvkasz.us>, 
 Yassine Oudjana <y.oudjana@protonmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-doc@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Rspamd-Queue-Id: 9192B5583C1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6523-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,samsung.com,linaro.org,bootlin.com,lwn.net,linuxfoundation.org,gmail.com,lvkasz.us,protonmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[disroot.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kauschluss@disroot.org,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Action: no action

Certain Samsung S2M series PMICs have a flash LED controller with
two LED channels, and with torch and flash control modes. Document the
devicetree schema for the device.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../bindings/leds/samsung,s2mu005-flash.yaml       | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/samsung,s2mu005-flash.yaml b/Documentation/devicetree/bindings/leds/samsung,s2mu005-flash.yaml
new file mode 100644
index 0000000000000..36051ab20509f
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/samsung,s2mu005-flash.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/samsung,s2mu005-flash.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Flash and Torch LED Controller for Samsung S2M series PMICs
+
+maintainers:
+  - Kaustabh Chakraborty <kauschluss@disroot.org>
+
+description: |
+  The Samsung S2M series PMIC flash LED has two led channels (typically
+  as back and front camera flashes), with support for both torch and
+  flash modes.
+
+  This is a part of device tree bindings for S2M and S5M family of Power
+  Management IC (PMIC).
+
+  See also Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml for
+  additional information and example.
+
+properties:
+  compatible:
+    enum:
+      - samsung,s2mu005-flash
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^led@[0-1]$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        enum: [0, 1]
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false

-- 
2.53.0


