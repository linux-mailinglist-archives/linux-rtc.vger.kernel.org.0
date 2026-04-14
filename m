Return-Path: <linux-rtc+bounces-6320-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FIkHsjf3WmDkgkAu9opvQ
	(envelope-from <linux-rtc+bounces-6320-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Apr 2026 08:33:44 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6493F5FE6
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Apr 2026 08:33:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C39AB3005AA4
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Apr 2026 06:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D843A36D9E6;
	Tue, 14 Apr 2026 06:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="g+ZQF0zv"
X-Original-To: linux-rtc@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C3232863D;
	Tue, 14 Apr 2026 06:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776148422; cv=none; b=sOgKn52Vn0BckbeX/u/c7DUX6zH6HnSy7vn4SHuIiaYhw0Kbvm+2kPBcfoiVHB9S4PRMNMAFJoEV3D72U+mGESQLwWxGVs/w22/Bo54OLO5k7UNBqKwbCuBuxVMDYLgdQ05iL2xtZQzlQJjgL7YaHo09DluvJZZkxckc9JuYmzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776148422; c=relaxed/simple;
	bh=amDGtZlZAyPAm2kay2Fu125lQem3gZDy2MoXtx8M9b8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ct975+2lXzuGu6X1mSUr6kBVKfhU8rQQLo1Kv3jxocmvBKJLYr3Y3Y+29oiHbFJeurZI7e6+pfv9YlbTk7UGz03nGqEGxIZY3GrvxzloXXpde+/yE1n6SVFWoldg88iWU/MpoaciAEYE7KqBTJXJVEn+OxvoClNDR8QKVwk95p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=g+ZQF0zv; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id EE23925F15;
	Tue, 14 Apr 2026 08:33:36 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZHKx2CvPxHyj; Tue, 14 Apr 2026 08:33:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1776148416; bh=amDGtZlZAyPAm2kay2Fu125lQem3gZDy2MoXtx8M9b8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=g+ZQF0zvfBStEFyWwo7pg1QwPsKHjXEMbjsOex6eOBi8LcQPDJn/v+bjI/vBEnUWN
	 u63jwMUdYZOQ8svwAqw2GFwR4oZr0UHdfW1xRuR7A+ZzfHKr23A/zLFOrQYZ2DQ2hg
	 t9FjP0WQkkWLnCN/ngXq7KD9HiniEGprl3KJ7ftF97v3oNOI2myt/o73AOS8U4UN0K
	 9YJf12mxSSM6OHXR0n4Mxkf4rUVT9UI1z+B9Mth5tOLU6TaAtUeT5WcOMrPf6Gx9cc
	 L2TpUdR2kgYfYQ41jN8SLW1c8RuyZwQeS1JvFnYrBNSGcC7Rbs1ERGUexb4aJIYMzx
	 rGR6f4UTozlnA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 14 Apr 2026 12:02:56 +0530
Subject: [PATCH v4 04/13] dt-bindings: power: supply: document Samsung S2M
 series PMIC charger device
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-s2mu005-pmic-v4-4-7fe7480577e6@disroot.org>
References: <20260414-s2mu005-pmic-v4-0-7fe7480577e6@disroot.org>
In-Reply-To: <20260414-s2mu005-pmic-v4-0-7fe7480577e6@disroot.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Sebastian Reichel <sre@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Nam Tran <trannamatk@gmail.com>, 
 =?utf-8?q?=C5=81ukasz_Lebiedzi=C5=84ski?= <kernel@lvkasz.us>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-doc@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6320-lists,linux-rtc=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,samsung.com,linaro.org,bootlin.com,lwn.net,linuxfoundation.org,gmail.com,lvkasz.us];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kauschluss@disroot.org,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[disroot.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,disroot.org:dkim,disroot.org:email,disroot.org:mid]
X-Rspamd-Queue-Id: 5B6493F5FE6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Certain Samsung S2M series PMICs have a battery charger device which,
among other things, manages power interfacing of the USB port. It may
supply power, as done in USB OTG operation mode, or it may accept power
and redirect it to the battery fuelgauge for charging. Document this
device.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../power/supply/samsung,s2mu005-charger.yaml      | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/supply/samsung,s2mu005-charger.yaml b/Documentation/devicetree/bindings/power/supply/samsung,s2mu005-charger.yaml
new file mode 100644
index 0000000000000..4ae45165b85fb
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/samsung,s2mu005-charger.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/supply/samsung,s2mu005-charger.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Battery Charger for Samsung S2M series PMICs
+
+maintainers:
+  - Kaustabh Chakraborty <kauschluss@disroot.org>
+
+description: |
+  The Samsung S2M series PMIC battery charger manages power interfacing
+  of the USB port. It may supply power, as done in USB OTG operation
+  mode, or it may accept power and redirect it to the battery fuelgauge
+  for charging.
+
+  This is a part of device tree bindings for S2M and S5M family of Power
+  Management IC (PMIC).
+
+  See also Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml for
+  additional information and example.
+
+allOf:
+  - $ref: power-supply.yaml#
+
+properties:
+  compatible:
+    enum:
+      - samsung,s2mu005-charger
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+
+required:
+  - compatible
+  - port
+
+unevaluatedProperties: false

-- 
2.53.0


