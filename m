Return-Path: <linux-rtc+bounces-6088-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDwaGg/qomlG8AQAu9opvQ
	(envelope-from <linux-rtc+bounces-6088-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sat, 28 Feb 2026 14:13:51 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A231C32BB
	for <lists+linux-rtc@lfdr.de>; Sat, 28 Feb 2026 14:13:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56EC9307D612
	for <lists+linux-rtc@lfdr.de>; Sat, 28 Feb 2026 13:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0D1843E4AB;
	Sat, 28 Feb 2026 13:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RyIzCvaL"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E09429831
	for <linux-rtc@vger.kernel.org>; Sat, 28 Feb 2026 13:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772284400; cv=none; b=TH3tH07WNwy13GshzgEZny2/5ZxzGF0KaOmfjGjn8v6Cv7L7lXNXZkq78Zj8lysyySMSJcfCnITlhdoWOQ41O5VJpXlsxWZzS14lAYGyvXNs4joS8t2RaSbaoP8eLimM/JIz6rvXBpiyUNnY+h7xtZqbErkoxAa/52Xlt9gkncU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772284400; c=relaxed/simple;
	bh=vpPZDNWyaRiIeiEZ6dBWdMfSdrhuE1MFqlDWuu8feTg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FlSgtXPygFpeQCOoBcZMAVtJzdyxJN/KAt4h/2r0sQqATgLz2OPajEcQjI/VuOo0RzejPvSjr9zrua5j6Z36Zi3qfmu5KJz3Tyl6nE7IFvdu5eCbqzfTFvNzysEHHZlwEebrtGrDyQhQUvEuSLDT23IJBtowItal8LbjhN9AchY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RyIzCvaL; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ad9a9be502so20783015ad.0
        for <linux-rtc@vger.kernel.org>; Sat, 28 Feb 2026 05:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772284399; x=1772889199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e+OXOGPWktoMpqTrgoZHnGiYGl+B7CZqSTFyHXnY8iM=;
        b=RyIzCvaLJNGNV2dhAyqGOrb18eHaT5svJePZTIOMi3nXvYnjuRl0oJuG2nCTC1/YmE
         sH2CEWxGg26EQZ9WqOs9XfwV9Y9ILXE3c4Kp8rqWuN/Fl4freq347DUtRMBkzB0CWAxg
         xDyLFrYvi2smrw9FFBPelPhfkccdO94osGkJhDeX/znX/cOVST8KFo4KWzpVYffxmQOX
         D5mRdnjMP1G3G2Bunbc3+9rTX7XQlOkbERGp7Dl3v2yOruzoJ4ZvgvoTP6BQuIKJsgsu
         UVHIOjJOQUdGAphXbsnydWHn5PovJkJM5BM3eoV4pQ4CgbSRrNNQ9amGbOn9c2eGSIn5
         jESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772284399; x=1772889199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e+OXOGPWktoMpqTrgoZHnGiYGl+B7CZqSTFyHXnY8iM=;
        b=uWVEqdLNN6xPH+7RFEYjuuw7NXR3Qdoa8+5nLh1wjzbt7EBvzA07i02SbpvidayqXS
         WHal4EFesdmU3ej3GqbK+l8QnvyGTQQAGzNJt8otd65bznoGjAWmpeCV/rmN6kokcEAX
         Zn0//UOo+snG3OWfTfWkqybqyt8lNACH9p5LXHtu+NE9eagCRuOHXBU8/4oXzESREqJy
         dtnmM8vwd/WkanBY6ZfPJiswa8vgWws+mPDqAfjH3keNgsTl+Av0L81mIcm/k5oVN8Hi
         7aDjB3DjcmdMwTVxojVYdPOCUZFE1ClAXLJnZ83DRESOnUHFMk5D1cXvLr+UvBAqmrw2
         EpnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoiXOJ4l/LH+DOAr0DiT8Oxq4YFKv3jOPa8ENVvicoAHjHHe/ZTs9/8dWQsKovdu4vMaMnqLkDoy8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/uTq+h5XxxbUI/BuvKWPLqbluvByeiyEuOe6QNc4y8Oj2TCZ1
	4HnA6JVMwJr3Yd2tPwRLnk4ruvI2Gh3IgqcEvZVM2jIYvZL2VBhC+14I
X-Gm-Gg: ATEYQzx2TBicElAn/IjoFj4JXR7Q06MLuQ2NkXnGmVfQO7BL8fYquP9kqR5Hxd96qsZ
	RzJbvbrWEShX89WCv5J+GGMKv3+fHiRpzXb4awnqYymk/jENaHSXgq0KoMghtlMrNEq8tTkqMFv
	ipoTZPxO7FtuXnUSgKkbzCs00P9fXcd9F3MrFMY//PRD3P2uTRsXi3Ac0oxNO3UdDrEQDooqqSC
	ZjYHslOC26j+WMJX8103chnws2hql6Ko71kl0mT7/bOT4T8mKUfuHtl374yBSOTDXedLEMg1HsK
	VMq19JD7oT62Ol5Wmx4eAxHqIfj2/BLduMDFvT/rI/rrG6l0Kavt0OutX9blOJLcSUgb5s48Y0y
	q5A51jD0HMx2xKqeVRju/1yTZy57WC8v88/mj2wiSoXOx7+JRAx/R0ocMYLm43G9f1xH+qrPgPI
	Q6U4lfUd9Oztc0DxyvLLnzSJZlZJVknZaC/aR3mIWX6raNq+2S+M66d1Dd8wM2vtF1230YwbSwb
	cuIdPgz+Ue62Ow2IA3zbTid0c1+fHgp4uyttDyxfrCE0kW9
X-Received: by 2002:a17:903:2b04:b0:2a9:62ce:1c12 with SMTP id d9443c01a7336-2ae2e4da12bmr73263415ad.53.1772284398824;
        Sat, 28 Feb 2026 05:13:18 -0800 (PST)
Received: from lorddaniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2405:201:31:d01f:38e8:e688:575f:115f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6f3436sm133656725ad.88.2026.02.28.05.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 05:13:18 -0800 (PST)
From: Piyush Patle <piyushpatle228@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] dt-bindings: rtc: isl12026: convert to YAML schema
Date: Sat, 28 Feb 2026 18:43:11 +0530
Message-Id: <20260228131311.37169-1-piyushpatle228@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6088-lists,linux-rtc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C0A231C32BB
X-Rspamd-Action: no action

Convert the ISL12026 RTC binding from text format to YAML schema.
Remove the legacy text binding.

The new schema enables dtbs_check validation.

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>

---

Changes in v3:
- Removed unsupported select section

Changes in v2:
- Fixed dt_binding_check warnings
- Improved example formatting

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


