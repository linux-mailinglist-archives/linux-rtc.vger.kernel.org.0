Return-Path: <linux-rtc+bounces-6318-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4O1MMEHg3WmDkgkAu9opvQ
	(envelope-from <linux-rtc+bounces-6318-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Apr 2026 08:35:45 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC933F60F7
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Apr 2026 08:35:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35B743009B2E
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Apr 2026 06:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3978536C582;
	Tue, 14 Apr 2026 06:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="NnCGT8SD"
X-Original-To: linux-rtc@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9397630215A;
	Tue, 14 Apr 2026 06:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776148405; cv=none; b=eW57W/4n78r1OunwqqZg2Jd8u+z9saswzWpOvxiciS32LduF/z/IXQ9F8dq5Mc7QSjJaf3BwQvMja5m2utqG1yM2eZb4mZgmyqzrbCbiJDIx8LImavGfKWg3HRMC3HeaS61RNBAgW7Z+zOrMXMVY+49pxLOaK1oulstJCIaxXFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776148405; c=relaxed/simple;
	bh=8T95U2NjfpE9/lMDbO20IOthIFirorsSd/sZcss4e7Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H7R0pgg+e7eNUoTW2xBtSWtA3F5Rx5I6KEvJZiAVqvZ5tR33qWTuqI/+PkUYji9aVBbbYAskEQXdJTHnbPNvZg8GpnJIHexsfXhrOP34S2ZrGee7uvBe9Ru7wiFeP8+WeOugssSwcbmRhF9FrcGSDkpxPOuF3oqkUXMfoc0USw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=NnCGT8SD; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A4B4725F15;
	Tue, 14 Apr 2026 08:33:21 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7L5axfLCGBP7; Tue, 14 Apr 2026 08:33:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1776148400; bh=8T95U2NjfpE9/lMDbO20IOthIFirorsSd/sZcss4e7Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NnCGT8SDOd+ejUEU8fmmuB1eg9QJh/IJgAKYOAY8b5xdL6MTIElr+uHfqLOL9aRgA
	 e81rr9GO/QEgDqjPxvKKH/TQRH6KE1RTE5CgbkWk1SHG2vRish+YgmJB8CQPlVVCP7
	 3LYmkOf8sLrWjEUlyWAsHiAqmDB3zdW3wkjnemGMJPU/7YKVYFKbY+NpbI4z1iqHzs
	 MEe2d5xkCLVv+ArIT+sDxrHVTDSYZEKNM47yET85pf5LA/qA9tHgzwokolYhS9K+VY
	 ucG0bOO1s5c+MIxQJD1dp0i/HUTALTZ5AQIOt8G9zytAtZnXMSwmEiJzpLeoEpf1xC
	 wa7bgtY6cOL/g==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 14 Apr 2026 12:02:54 +0530
Subject: [PATCH v4 02/13] dt-bindings: leds: document Samsung S2M series
 PMIC RGB LED device
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-s2mu005-pmic-v4-2-7fe7480577e6@disroot.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6318-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[disroot.org:dkim,disroot.org:email,disroot.org:mid,devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2BC933F60F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Certain Samsung S2M series PMICs have a three-channel LED device with
independent brightness control for each channel, typically used as
status indicators in mobile phones. Document the devicetree schema for
this device.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../bindings/leds/samsung,s2mu005-rgb.yaml         | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/samsung,s2mu005-rgb.yaml b/Documentation/devicetree/bindings/leds/samsung,s2mu005-rgb.yaml
new file mode 100644
index 0000000000000..6806b6d869ff7
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/samsung,s2mu005-rgb.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/samsung,s2mu005-rgb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RGB LED Controller for Samsung S2M series PMICs
+
+maintainers:
+  - Kaustabh Chakraborty <kauschluss@disroot.org>
+
+description: |
+  The Samsung S2M series PMIC RGB LED is a three-channel LED device with
+  8-bit brightness control for each channel, typically used as status
+  indicators in mobile phones.
+
+  This is a part of device tree bindings for S2M and S5M family of Power
+  Management IC (PMIC).
+
+  See also Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml for
+  additional information and example.
+
+allOf:
+  - $ref: common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - samsung,s2mu005-rgb
+
+required:
+  - compatible
+
+unevaluatedProperties: false

-- 
2.53.0


