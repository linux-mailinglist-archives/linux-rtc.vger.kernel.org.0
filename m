Return-Path: <linux-rtc+bounces-6090-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNNDHOn2omm48QQAu9opvQ
	(envelope-from <linux-rtc+bounces-6090-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sat, 28 Feb 2026 15:08:41 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C85491C3721
	for <lists+linux-rtc@lfdr.de>; Sat, 28 Feb 2026 15:08:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBF2F305C6FA
	for <lists+linux-rtc@lfdr.de>; Sat, 28 Feb 2026 14:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63395310762;
	Sat, 28 Feb 2026 14:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/RJ9ICt"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24772C3268
	for <linux-rtc@vger.kernel.org>; Sat, 28 Feb 2026 14:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772287716; cv=none; b=oM9zMfnrQH7Yk5+c/2unfEs323gfcjch2l9Dj1PespXE/TLhZTo4/cuceQCjxKSLCddjNfdyVDWJNRdulbrxsEvoVz0g1Xt0rwjmkME+EfSpYTTSAKJ/KobSbJx7R+VBS6qPFxxLLcGoLebQRpj0spNQJ+O/X0QeIh+hGKhDk70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772287716; c=relaxed/simple;
	bh=4EDwurgwBRqay31Gf8tt43vcqSlor49bTP2erbGTyac=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gd2hJyQONH1SK8r2PCZCQGAmbXaahSNdIwWI1vuIwVdynJBX24KVezDFDTq2JMnY744ERu2MdVGcGzjztqybff7m1yoBIgm1436iZeJPPp7pYTESlbo6doDMH3PjHNokqwvThQW5hnCSFi7009ZcHGRlKi4fIs1yjeg+ivFtoIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/RJ9ICt; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-824a829f9bbso1421089b3a.0
        for <linux-rtc@vger.kernel.org>; Sat, 28 Feb 2026 06:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772287714; x=1772892514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6TSZFUxYm82d8AIBQNg1i5Gh8moFs187x7imTFk4zOU=;
        b=H/RJ9ICtYHJIJrT83vzNiz7pO4mswAQxG1j4JpbEQ4l+GsouioVr7fsF941AB6dV8W
         h8vpluQGscUnXAahpUjeQzNQDYAU/5ejCksy08g4r5TBGtfvGu1FIytq2tNdlzGlUtc7
         VJDc5x9TGMx8plgr9ROpuyMcmURsTm+4vT5GG5mp8l/d1BrzqhYbNzKwOHMzTkOzDXBC
         YAuQnEMx/9QPE5geqqZQANCNP5WEWYoFkVA2dTcsJh9xDBIxME432njDeqNRWz/QRaDJ
         6ww4W5Zci4fXFRF4oVbatAhqnk2FDRrlOda9cuinDBoDJU5Ah4xWc/HrT7GYQkDFt1xZ
         z5Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772287714; x=1772892514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6TSZFUxYm82d8AIBQNg1i5Gh8moFs187x7imTFk4zOU=;
        b=L4nZ2db8v/xySStjjEWfk5Z+M9CY7FdLuZY7b31+I+rnjbmAMQMRnutQI1c6x91/PM
         krghuuYVCMUo+sCBWlxuKESNbAzAfIlAoAfg6f9ipfoPwDKoFyBUkTrNKR7L7gvPAGTB
         qaRI2hfg3/4t1oMGT2Z2pWJasN2w0oFhuo18+eTXal3xBuhwUQsjREQo7No11wFv+4AV
         CTWiB0ZpTZQR7g6ZDLDmiJkrqcmBpz4p++fTJWot2ryzroZ/sF3tVsKnvoi6+rV6SXO5
         ormSmB/YtX+P5NrCrdHuyshAmJYEkPMoNj8dn+AsPnNwg2HlVicb4SvU20DfQv8DPLXQ
         aOnw==
X-Forwarded-Encrypted: i=1; AJvYcCVS1ExuNMe3nTeYBlD/bqHy7EYJFjpJpFrQ9Iv5yd8UITwYnGSEIoxdcUBOE/WxIJg37PZn1d8K+HU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7VlQ/z/hXWO3BKWB/ipbeRlQShV3MOGJr1OZcaoclTlfBU8ME
	SpfrAPVDB/FXL9mICLLFSmWJtDP/Xt1r4C/gM23timoOjdY8u4tMPvFE
X-Gm-Gg: ATEYQzx7EAK4ro4+M3gpgch51UyIetiSPaZVLIGxL0tI0VKxw2dyoVxiPJ3coJGkNVE
	3v0BjqNcOchJImfXqNQ7Y75HG8f1D0stD0ssyRw/zayPv2K1lGQ7+SHetS9/w6lCq9ZTWjjc7Iu
	cu2zHjnr6gV03s6pvh0E2AP4ag4L0qZe6bISsRda4mbyE1o2fVhJMyTJKT3IlwN3tlPUB+DK88G
	h5CwTplprUzF6XzRN8MOlmxmnROneWVR8qwsKSVrKlDNWrRcetveQ57E1MgNAQHK6bNJg4tKbKP
	VE+xu+z7bYd913XSPjV/bYcOMejylU8hdYY2wx2FooNQQVBlj0Gt70MoqTUfkOsY7ZOk2XJGB1j
	WALFeIN4zr3mX1UIVAxEnaYQaZzdbH8wGPedhAcI57H/rIFuRSsCAqJq8hsvw/NroMzpxKIMFh3
	JWZoUsjO0yFbLto5zXVQt593UThRhFYlrX+gFAIg60C8of/44iMzU4sdE+43p3GHI6kvgFQxTTx
	7C1nnPTaJzsD14vZ+vBKKZF2KSt8XQZWopS/g==
X-Received: by 2002:a05:6300:218f:b0:38b:eeb9:cbb5 with SMTP id adf61e73a8af0-395c3b0f6acmr6492400637.39.1772287714146;
        Sat, 28 Feb 2026 06:08:34 -0800 (PST)
Received: from lorddaniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2405:201:31:d01f:38e8:e688:575f:115f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35913430908sm4667245a91.11.2026.02.28.06.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 06:08:33 -0800 (PST)
From: Piyush Patle <piyushpatle228@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] dt-bindings: rtc: isl12026: convert to YAML schema
Date: Sat, 28 Feb 2026 19:38:25 +0530
Message-Id: <20260228140825.108205-1-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <1c104639-4286-464c-aaf5-82f80b903bbb@kernel.org>
References: <1c104639-4286-464c-aaf5-82f80b903bbb@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6090-lists,linux-rtc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[piyushpatle228@gmail.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,6f:email]
X-Rspamd-Queue-Id: C85491C3721
X-Rspamd-Action: no action

Convert the ISL12026 RTC binding from text format to YAML schema.
Remove the legacy text binding.

The new schema enables dtbs_check validation.

---

Changes in v3:
- Removed unsupported select section

Changes in v2:
- Fixed dt_binding_check warnings
- Improved example formatting

Changes in v4:
- Fixed Warnings and resent in-thread as requested

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
---
 .../devicetree/bindings/rtc/isil,isl12026.txt | 28 ---------
 .../bindings/rtc/isil,isl12026.yaml           | 59 +++++++++++++++++++
 2 files changed, 59 insertions(+), 28 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/isil,isl12026.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/isil,isl12026.yaml

diff --git a/Documentation/devicetree/bindings/rtc/isil,isl12026.txt b/Documentation/devicetree/bindings/rtc/isil,isl12026.txt
deleted file mode 100644
index 2e0be45193bb..000000000000
--- a/Documentation/devicetree/bindings/rtc/isil,isl12026.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-ISL12026 I2C RTC/EEPROM
-
-ISL12026 is an I2C RTC/EEPROM combination device.  The RTC and control
-registers respond at bus address 0x6f, and the EEPROM array responds
-at bus address 0x57.  The canonical "reg" value will be for the RTC portion.
-
-Required properties supported by the device:
-
- - "compatible": must be "isil,isl12026"
- - "reg": I2C bus address of the device (always 0x6f)
-
-Optional properties:
-
- - "isil,pwr-bsw": If present PWR.BSW bit must be set to the specified
-                   value for proper operation.
-
- - "isil,pwr-sbib": If present PWR.SBIB bit must be set to the specified
-                    value for proper operation.
-
-
-Example:
-
-	rtc@6f {
-		compatible = "isil,isl12026";
-		reg = <0x6f>;
-		isil,pwr-bsw = <0>;
-		isil,pwr-sbib = <1>;
-	}
diff --git a/Documentation/devicetree/bindings/rtc/isil,isl12026.yaml b/Documentation/devicetree/bindings/rtc/isil,isl12026.yaml
new file mode 100644
index 000000000000..152edce2ab41
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/isil,isl12026.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/isil,isl12026.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Intersil ISL12026 I2C RTC/EEPROM
+
+maintainers:
+  - Piyush Patle <piyushpatle228@gmail.com>
+
+description:
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
+    enum: [ 0, 1 ]
+    description:
+      Value written to the PWR.BSW bit for proper device operation.
+
+  isil,pwr-sbib:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [ 0, 1 ]
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


