Return-Path: <linux-rtc+bounces-5980-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PNsJQANlmmNZQIAu9opvQ
	(envelope-from <linux-rtc+bounces-5980-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Feb 2026 20:03:28 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3878C158DE0
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Feb 2026 20:03:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 318A4302C5FD
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Feb 2026 19:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 127AD346781;
	Wed, 18 Feb 2026 19:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YkQM8PB4"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C5F2F5479
	for <linux-rtc@vger.kernel.org>; Wed, 18 Feb 2026 19:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771441345; cv=none; b=kmmX0aLOsuk7V7dy9k3tSggUulos3eu/zL9UetKEUOLDJPoPlotvs0PYFH0X9++y1NVuufypeejHAKOKO7m+mnd2zmMZES9jAwL/uaMINehdTCQAtloGL5MbUj2GJg6k/I2nPiknQ5A45Zsa0NglXKPebNIdI8k3iEbtdqhwZ1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771441345; c=relaxed/simple;
	bh=cm6d+Fg+VP3Rd5tjT1b8fJy5kUEu9F5lJGDT35qu9vI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uJkxq3RdR+qCBpwUtseIp0FYYjZQ/B4vdgtqRTtmxzOkgntRd6sNdN2+R1lm1apwZZ4vCMw3Ny4IiG3/KAGdIbYsU2lK2ZA0M6qQIqKPkMw1tOHAPYJJxa7hjgNiE6AQmlcRCApLcO1bY/zVqwjj9hV9x7WNM9yt4koePHywab0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YkQM8PB4; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2aaf9191da3so608765ad.2
        for <linux-rtc@vger.kernel.org>; Wed, 18 Feb 2026 11:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771441342; x=1772046142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f1dEATHF2WkVqMtvh8xVHN7g8sVFpJdMQjOLJjAqxBU=;
        b=YkQM8PB49x3+lzuVtYRf2HnGUDD8d8dMHrvV1QruwxHfsPdaG/NWAm652lls+tdHZ3
         AL58BlcltHJO9PnFG20BbK3cqUfUPVZE+OjNv1RwHVwlNCNULFM2tUq2GbCSq2VjSzXX
         0dm23LByXltx/MYjKmCXrL7bsW/nJ7pmrvN//6MbTW+abVy5JUnpp8vs2QQdvKQvdpTZ
         L0JJhQ/4zitV32Xo25znYj3t2XhzifA/UwW1xB3DogiIFSUWYNIgTcSGu7N0I/IQ10Rw
         dlM8QlL2kuvlkaqYYf+WMnrV4i8xA382XccetYPhmpgqbWq9teUizmc0cLzz0VbZMRdH
         sRnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771441342; x=1772046142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f1dEATHF2WkVqMtvh8xVHN7g8sVFpJdMQjOLJjAqxBU=;
        b=E+riwVoBgpMwalRknQxtvM6j0OuPFn/fbmSQL6rCXguIf6rptt27bHsBjzJGXH+VlK
         O67/XdwxQa2EYSLuXhS6M3F6guMtA6U42bPn4otj/e2euwt/bYfl0BndP7uO8g3I0UTO
         TnYzjpFmFfOJbgW2RBfCgsnFho+BnHKsl8Z9I1DJXkmGUQgHoK96/osmitqucWP9Aw5K
         k79lNzO7RRHIS14pbVO/MeIwGIrtx9HohHgce+aDlAp+9f3GV8ASKu5oeSyUVvaO7w23
         eDPBZTeBuvWBUzlEdMVUlhoqGCQUopREBJ70C1aEaoGM/+CP7v6jgj0hycUo7lKzvKIE
         ds2w==
X-Forwarded-Encrypted: i=1; AJvYcCXUBB8B1RKsejYAi4/diE3e0vuPUICaJhKOn0nbCS4TSI8uHMiP85cDf7Z2qDPxQdCBL/50UnvnQfM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy41erLJmOD4VrLBk8Kc3PpKR6tq1MrxL1PMMgjDRXnAdhR2ytS
	wojNLnz97MRLPayEUwPvWzDEH3NcagAOsfjpJYOnENm+IcHnEyKT9Ydy
X-Gm-Gg: AZuq6aJR+5U1oemRmfDF2WOscnSSiU2/mz3mSZVdMYG8Ds6At/F29XZuKI+HONc8Oje
	g6nhcoIcYMnwhxT8MLoql9VmlJoM1r/jr8Z/vov4HUVAQWq2cMYJjy/dWYEaiXbb0gWm7Qhk8fc
	OrrfcjtZMV5JnfvAVfD71tiGn+ba//Epqsi4WL73PjkETImE9h9tzBq0tmakArHaNAI5MFona1M
	B2nCHd14W35nNfR6ayTOIASHuntBcYw3P1mIPTKlEjxtU4/Twv7QVX143i+j2ZRG2nymJLuTWpa
	4TQWUhBH524EU985HObTYol1kQSq+eInuSMIqo7H6Ywxl7pDABr4ku9DY55ETat5BhFO/t5JK+C
	t09BfsE2CAs9UBIan3KRWHyq22Gm+ZUcMTzvsR0zBfBk2d/AWt5yee6NYwGig0hNIN05vGNzTYh
	QsWdFAnIg3LDtW3cDTkS+prg2onfgDKwsIozybTx7NC0FVvXqCZ53Q3ZxcQ1mPoGdd1QJJJwxvM
	+7/ufLD1nEr+uSfuHExPkLE+L1KXmxgHHPtAA==
X-Received: by 2002:a17:902:d486:b0:295:b46f:a6c2 with SMTP id d9443c01a7336-2ad50f4e4famr27163345ad.37.1771441341565;
        Wed, 18 Feb 2026 11:02:21 -0800 (PST)
Received: from lorddaniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2405:201:31:d01f:77a5:d08d:18e3:2f36])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a713ac9sm137396275ad.26.2026.02.18.11.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 11:02:20 -0800 (PST)
From: Piyush Patle <piyushpatle228@gmail.com>
To: alexandre.belloni@bootlin.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: rtc: isl12026: convert to YAML schema
Date: Thu, 19 Feb 2026 00:32:13 +0530
Message-Id: <20260218190213.429892-1-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5980-lists,linux-rtc=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[piyushpatle228@gmail.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[6f:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3878C158DE0
X-Rspamd-Action: no action

Convert the ISL12026 RTC binding to DT schema format.

The binding was previously documented in text format.
This converts it to YAML and enables dtbs_check validation.

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
---
 .../bindings/rtc/isil,isl12026.yaml           | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/isil,isl12026.yaml

diff --git a/Documentation/devicetree/bindings/rtc/isil,isl12026.yaml b/Documentation/devicetree/bindings/rtc/isil,isl12026.yaml
new file mode 100644
index 000000000000..5f0ac73b1fde
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/isil,isl12026.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/rtc/isil,isl12026.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Intersil ISL12026 I2C RTC/EEPROM
+
+maintainers:
+  - Piyush Patle piyushpatle228@gmail.com
+
+description: |
+  The ISL12026 is a combination RTC and EEPROM device connected via I2C.
+  The RTC and control registers respond at address 0x6f, while the EEPROM
+  array responds at address 0x57. The "reg" property refers to the RTC
+  portion of the device.
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    const: isil,isl12026
+
+  reg:
+    maxItems: 1
+    description: I2C address of the RTC portion (must be 0x6f)
+
+  isil,pwr-bsw:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Value written to the PWR.BSW bit for proper device operation.
+
+  isil,pwr-sbib:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Value written to the PWR.SBIB bit for proper device operation.
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        rtc@6f {
+            compatible = "isil,isl12026";
+            reg = <0x6f>;
+            isil,pwr-bsw = <0>;
+            isil,pwr-sbib = <1>;
+        };
+    };
-- 
2.34.1


