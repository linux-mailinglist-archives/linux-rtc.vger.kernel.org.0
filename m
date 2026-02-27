Return-Path: <linux-rtc+bounces-6086-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIbtB7HnoWlRxAQAu9opvQ
	(envelope-from <linux-rtc+bounces-6086-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 27 Feb 2026 19:51:29 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8331BC314
	for <lists+linux-rtc@lfdr.de>; Fri, 27 Feb 2026 19:51:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EA4C530185E5
	for <lists+linux-rtc@lfdr.de>; Fri, 27 Feb 2026 18:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D09F83A1E7E;
	Fri, 27 Feb 2026 18:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XHhVqIe/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAF73A1D01
	for <linux-rtc@vger.kernel.org>; Fri, 27 Feb 2026 18:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772218286; cv=none; b=cmpOo9sNbYQcCyhWhjoabk9LF80DbX10daYkQiMABufxoHv0yjdVFj5qg8U83PUIf8Uy2SljOmVQm5yDsrSGmNvrRoUdoIaJUT7KsvpDOCZU3IV7aGTVeGxrxoAUP5Ytfg9toJedCKAxCo0JcP11/trbmdNeg9RlOYsRImCgCKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772218286; c=relaxed/simple;
	bh=Fw+ygcshW+Ez5JeznJZyRzggAtAKnuqwFiwXyH5mzYc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DGwBH5wduleQ3/BsrMwBTyp3o/NfC5DWGxRnaHjc8pUho4c9wBYcykVhUJyitaA3woquSE57kws8AkLs16RQneix/zIe8KVjmI9BCM58q7i7sen78rO3aJr5b2ap6bKOnsDOsABnM5tOQNpdAoGSlyaQo4bPTBJ+XdHY1PNsq8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XHhVqIe/; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2aaf9191da3so14586435ad.2
        for <linux-rtc@vger.kernel.org>; Fri, 27 Feb 2026 10:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772218285; x=1772823085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b0jBv3hiCjWTiVXdoePC+mGdPZMAbToenOvNm0ORIlQ=;
        b=XHhVqIe/b8sYHaJW/Pssyx64cujjmrb83JEME/e2aT1aGmdxOw7Dxhc+gLp9EdXn67
         eK1+IKNopBPKRA4DtKKxE9/6+k+4ewXZPOt+qKjFb7huXXsUA6hZHTeuDjf6ZSrJ8R1C
         AR8nXbg9400dX5rBV2KqG4jNKQbg/tOgaVavleCqaIGpLeyZ19VPqR7R2UGVlHXHNGM6
         yYLCRb2G6tEmmKlBcjjjAE24kDCOysqrpuUiKmPjLEneiSMdd5kEAyNO+NOdjeA0Z51E
         aFh0Pm678hT8+kpf/X+119Vq3qkL+21NBOJqtLtuZ9YWlddhRI/k16c5ThKUO6H8MFBh
         ZGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772218285; x=1772823085;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b0jBv3hiCjWTiVXdoePC+mGdPZMAbToenOvNm0ORIlQ=;
        b=mdjPUNumfs3pppimzc36Hnc00zhVM681mfAMabaekRxu/ROyRsbB4W6G4e7H95DrUr
         865FUmJC2XDstr5N0qUEA5tbEeUVTEKW9NS6y/sgZe8QNkuF92Q+0mWxVi3MajsG3x3I
         LAL4iIKVtfnvQfLzgsHelFe5z2NCBSCYIreF+sj4x0OHj7Gr5inVpzlnNuLtvpi94DME
         ngd7cAxIMVZhA4pgoo08WyXAIJkgEH68AG7hBetDhLjrVAAHawWTMHaofJaZi/5d0fJ9
         Bo0J6CNNl7szCpYN3ZXRHLN1F7TNSsyA5eey8ob3MIU01owe2bwwzqiw0rM7lk+sUySA
         imfg==
X-Forwarded-Encrypted: i=1; AJvYcCUaq5otdMlPFTRe6a00pt3lu5iJz/pshTyl7ELUVWV1q0y8wmZfjadRk3D92Q/qTkpq6Xr+TkuDHlI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVlxIo0I4LwsEqpzcPynedr31F3t8GqRUUgM/fqOJ57YF4+dPp
	Nr92jmon7js42bN0ho0Gah2C3gGw0gbU8+b100vTFs36wnttIeUGZogg
X-Gm-Gg: ATEYQzwzLSRqtdI4pRR4yPv5kTErls+YYaRLbopMQYxv1H4lo1A4RvjDRDY4+60bH1v
	/WxpfhbdxciS8ScEM3kCtEvgA8PMeQWdIx3LkknlY11oc0U9Flc88ENqO+u26F72BpzeQb3D0u3
	pT809HJ7ldhkcyCZHFlzKJeNSSQxMSSZPnElqRy/6UHMsNW90f6bjBSJZvpw7c3U25DOwV6DWil
	yEWZ7BfymsPtiHHWV2UTaiQnIc78klIiWh/bROuuU6bSd9NFKEidtAWX2KD3N6r8HeFZWSzWB5r
	A/BECU6g/6NPTFEQSmMjUpZJReC5ADQc627pah5RM0vmihNaVh0qfs26jyUsSPqPAPqq40Gv/wa
	A4ekIedvkA9KD5nqKdpZzK3gWsJR3Lynjij1/RCClSwStsqlwVAtGlssRvBXTaaNQJNFOhSI4n6
	Dk2SkHDUoiXtIHVAKpdb9j8g0kZDIG/YbLKJk14yLTxIcAqMU7lB8X5g8B9TgJhxFKPIABxDN5E
	3QCUNp9Ef+HbYW9rKLYz8D/4j3Du+Fam/g9pgJ3iy86syzI
X-Received: by 2002:a17:902:d484:b0:2aa:e574:d7e8 with SMTP id d9443c01a7336-2ae2d14bb98mr34204495ad.0.1772218284845;
        Fri, 27 Feb 2026 10:51:24 -0800 (PST)
Received: from lorddaniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2405:201:31:d01f:5b61:73bd:9dd0:d660])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6a043dsm93368925ad.54.2026.02.27.10.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 10:51:24 -0800 (PST)
From: Piyush Patle <piyushpatle228@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] dt-bindings: rtc: isl12026: convert to YAML schema
Date: Sat, 28 Feb 2026 00:21:15 +0530
Message-Id: <20260227185115.174997-1-piyushpatle228@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6086-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url]
X-Rspamd-Queue-Id: BC8331BC314
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


