Return-Path: <linux-rtc+bounces-6524-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qpsaDJqSB2pV9QIAu9opvQ
	(envelope-from <linux-rtc+bounces-6524-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 15 May 2026 23:39:38 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9B3558421
	for <lists+linux-rtc@lfdr.de>; Fri, 15 May 2026 23:39:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8542B301A2BC
	for <lists+linux-rtc@lfdr.de>; Fri, 15 May 2026 21:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBF1D3EDE4E;
	Fri, 15 May 2026 21:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="BHcb9GKL"
X-Original-To: linux-rtc@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4133EDE64;
	Fri, 15 May 2026 21:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778881166; cv=none; b=CgbVKshqfkuEjRjEH+yGbnsABEOiOvZHMzb2/E9iSCBdKhb6CdCTGAoKQsK7vqXD9OtWx7XEtwpkt79QbZtDLPZ/EbT4/SOo2pNE4GdWYdQaxpYggOy1I9Puywzd6agHJNKt2mmhO/9JUg98z+XEChT8dGOea9vCToRYk50VQzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778881166; c=relaxed/simple;
	bh=tyz+dMQdBOXx+s7FpuqwafggFacsjWeZCAqnFbNtxEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qkCuXM7kAMscnOUcCeupijOarWB7ZANqTsIFkzxarV9v9Y1LwMwBdapQfSBba2Ji4elqU35sIjvoDPpoVv64RhTrdd6mQ+dtp0bpWUtH/QhG8VNPgQpNLuxR67RV+40RGaJAdcOiURCKiySHwSImHcmftTe/NjBD6RLXWwqyycA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=BHcb9GKL; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4CC7E27239;
	Fri, 15 May 2026 23:39:20 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c__ZGMkxBDrE; Fri, 15 May 2026 23:39:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1778881159; bh=tyz+dMQdBOXx+s7FpuqwafggFacsjWeZCAqnFbNtxEk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BHcb9GKLGknJI+PT4OjFOJvrUf7ErMvXlPGt02gvadnDi1R3vdaZJ7rH/KcVpS5SZ
	 aS7yreeHxJn7XnQ/zUP1cweOspq8u2mG22t4ABXf3d322Q0xQMQWruFMNEdJObHntr
	 N+4VlovLFfF/kkQwyep3aKD8k5Z/qrOGzw/vpHaTWrKcmDyX33at7LKoGhGj2Rnel0
	 EH4eYWkv+kpMUr3JAmexgxhEtvrF7HsPSqI8RJN9zEbe1ryOj6EvUQT0jwBVMluHul
	 iEDwk5JvYu9luFl6WNBuC+FSRvJl2FgsWUjEA+vRRxzFc3sBEBHD6uGLT9g6TqsVDc
	 +meifWbmCQZtQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sat, 16 May 2026 03:08:34 +0530
Subject: [PATCH v7 02/10] dt-bindings: extcon: document Samsung S2M series
 PMIC extcon device
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-s2mu005-pmic-v7-2-73f9702fb461@disroot.org>
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
 Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Rspamd-Queue-Id: 7D9B3558421
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
	TAGGED_FROM(0.00)[bounces-6524-lists,linux-rtc=lfdr.de];
	URIBL_MULTI_FAIL(0.00)[microchip.com:server fail,tor.lore.kernel.org:server fail,devicetree.org:server fail,qualcomm.com:server fail,disroot.org:server fail];
	FREEMAIL_TO(0.00)[kernel.org,samsung.com,linaro.org,bootlin.com,lwn.net,linuxfoundation.org,gmail.com,lvkasz.us,protonmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,microchip.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,devicetree.org:url,disroot.org:email,disroot.org:mid,disroot.org:dkim]
X-Rspamd-Action: no action

Certain Samsung S2M series PMICs have a MUIC device which reports
various cable states by measuring the ID-GND resistance with an internal
ADC. Document the devicetree schema for this device.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../bindings/extcon/samsung,s2mu005-muic.yaml      | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/Documentation/devicetree/bindings/extcon/samsung,s2mu005-muic.yaml b/Documentation/devicetree/bindings/extcon/samsung,s2mu005-muic.yaml
new file mode 100644
index 0000000000000..0a320d5e2a352
--- /dev/null
+++ b/Documentation/devicetree/bindings/extcon/samsung,s2mu005-muic.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/extcon/samsung,s2mu005-muic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MUIC Device for Samsung S2M series PMICs
+
+maintainers:
+  - Kaustabh Chakraborty <kauschluss@disroot.org>
+
+description: |
+  The Samsung S2M series PMIC MUIC device is a USB port accessory
+  detector. It reports multiple states depending on the ID-GND
+  resistance measured by an internal ADC.
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
+      - samsung,s2mu005-muic
+
+  connector:
+    $ref: /schemas/connector/usb-connector.yaml#
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: Port connecting to the USB controller or PHY.
+
+required:
+  - compatible
+  - connector
+  - port
+
+additionalProperties: false

-- 
2.53.0


