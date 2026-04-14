Return-Path: <linux-rtc+bounces-6319-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGrqD8Lf3WkYkgkAu9opvQ
	(envelope-from <linux-rtc+bounces-6319-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Apr 2026 08:33:38 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D85FC3F5FB7
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Apr 2026 08:33:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EEBB930074BA
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Apr 2026 06:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 137ED36DA0B;
	Tue, 14 Apr 2026 06:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="FbMPxgOn"
X-Original-To: linux-rtc@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D7236C9EB;
	Tue, 14 Apr 2026 06:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776148414; cv=none; b=IO8IUn8iRPzi8Z1MwzHN9vbObPnNeFR0YIJK5C/oVTwLqf8Ac9CbTGnW+xy8t7e4dL0zAmF13JuLSn2pDmgKoB2qmtBXDl53ykemv/AlJ12+D72ZCM0e0vVvc6mJO9ATa/m9jEZVjjZM1HDwCJIhAdlqt+ZtAXbPqo8fZvrufZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776148414; c=relaxed/simple;
	bh=NcX7hGluxIqp7c6NT3Xls0q3uxsOGfFQd+lRKAyn+qo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K8GgHqjE56zR5gL77gDN8vb8n3+MhnMorA63KrPc333fmCkrs12ajTIqrAd7+k8+IsAJIUDoRimj7y86MBEJ2Eo/FLQQLe+CH2aAu6dRclLSxPu6vYsakkJrCHoHvguLvqmzq39t/ojOoiIokZ+q3VZCvW1Cy6OASbz4Rx1oC3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=FbMPxgOn; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4631925F15;
	Tue, 14 Apr 2026 08:33:29 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oH8w9u4VYGo6; Tue, 14 Apr 2026 08:33:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1776148408; bh=NcX7hGluxIqp7c6NT3Xls0q3uxsOGfFQd+lRKAyn+qo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=FbMPxgOngWkhPkqKvgTs/8vlGhf907/OGSkZk4nZSovg9Ju7iihngW79oaJg0Yyd3
	 xFMUb51pKp7GT/yxCXxf3FOBnBTB+2WQHxO0M1lQlxvJi+j6WSKQArmDI2elHADScd
	 E1It3yAe1/UAOevHodDLrBHGlVEhZOwBzWBO6INfpe9dam/WqDTJXM1fnbdIcq0KQx
	 JZrGLNBI+ESEyB7P/P/suol/UQYcCXRXq43rnWVCx3/ceyoZaODyxS7BlRymIldlU9
	 BTWoeUBasQLNOCHzAng2ORlp9PRjMvyNCPQxfnoGOeKTcp4D6VMIl4w2Kq/T3Uzb/3
	 x2ZRVhSKCpUsA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 14 Apr 2026 12:02:55 +0530
Subject: [PATCH v4 03/13] dt-bindings: extcon: document Samsung S2M series
 PMIC extcon device
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-s2mu005-pmic-v4-3-7fe7480577e6@disroot.org>
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
	TAGGED_FROM(0.00)[bounces-6319-lists,linux-rtc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[disroot.org:dkim,disroot.org:email,disroot.org:mid,devicetree.org:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D85FC3F5FB7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Certain Samsung S2M series PMICs have a MUIC device which reports
various cable states by measuring the ID-GND resistance with an internal
ADC. Document the devicetree schema for this device.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../bindings/extcon/samsung,s2mu005-muic.yaml      | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/extcon/samsung,s2mu005-muic.yaml b/Documentation/devicetree/bindings/extcon/samsung,s2mu005-muic.yaml
new file mode 100644
index 0000000000000..e047e8cbc264e
--- /dev/null
+++ b/Documentation/devicetree/bindings/extcon/samsung,s2mu005-muic.yaml
@@ -0,0 +1,39 @@
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
+
+required:
+  - compatible
+  - connector
+  - port
+
+additionalProperties: false

-- 
2.53.0


