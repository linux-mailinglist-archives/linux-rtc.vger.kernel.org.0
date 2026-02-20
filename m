Return-Path: <linux-rtc+bounces-5986-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJFeGa8fmGn0AgMAu9opvQ
	(envelope-from <linux-rtc+bounces-5986-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 20 Feb 2026 09:47:43 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06622165E67
	for <lists+linux-rtc@lfdr.de>; Fri, 20 Feb 2026 09:47:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63F64301ABA1
	for <lists+linux-rtc@lfdr.de>; Fri, 20 Feb 2026 08:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EF0D3101BD;
	Fri, 20 Feb 2026 08:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g1pdBVQd"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0764D30C36C
	for <linux-rtc@vger.kernel.org>; Fri, 20 Feb 2026 08:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771577253; cv=none; b=cX1WRMgc4pUh8AeOTonZg7c9we/QG6jv2gmtKGysL4H04Dp8JQmTEUiOAzoLyHoVWJVF9jOMqOedemIkSswpMJUTwYaiBYufDUIDGKk4a1vE1WGZDPsLQkAfd8luPAivboGNPFhVaFiTptC4ETjhRqJlAAROa8d3VqKxLhTQqHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771577253; c=relaxed/simple;
	bh=Fu7ePUeb+RpZ9sblQ9IzyxfjeLVJUnddvEnsWte7gwY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EJHK4thRcqoSrcDRaf2J0VAEE0eV11WOctaMtenkGOrrgVfM0ynVtFy/iCfRNzLCWZ52jAMzaoYHeAWPZSll+IG0yquV29uVkPq0G2efugDj7dzEME4SVZzFCWnWgQzsv+7fQ0qrpRHOZpsoac7S9JhWFLGTGCXqrmpUEPiakMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g1pdBVQd; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-824ba8f0acaso1218298b3a.1
        for <linux-rtc@vger.kernel.org>; Fri, 20 Feb 2026 00:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771577250; x=1772182050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Ci6XUCxuK1b6ZmUVm0ZGP3mULvV4ek/HU+siPXSf10=;
        b=g1pdBVQd4txFXAfWjJrTeRwR9MdjsLXjKtZHTrDXC5mxooipp6HMOfRZxsVmIvgQr/
         aIIGOsYYmDi8WgBkAZKlunC/pTgwfEE3Ofc2m/I5b24+ZxNIMOAjdWzMkKwmYs/vSPW2
         qB8zdAVtuKtCmclaMjb/kGyol0JunKW2JRyf7xhbF4wN60yggX1c5q/ypDH+8AlqJAXQ
         xiErkX/kX648csiev+4BA45ktT1WR9FMbpBvriMNFmXvu48ngqrvblCIsdA0AO8vT6jf
         0Ii+qbl6AKj/OSB23nnu02PNG+4DN4YehULD5wM9wTY2JvIVbHhKB//fqto1H2J3+JkZ
         0tJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771577250; x=1772182050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3Ci6XUCxuK1b6ZmUVm0ZGP3mULvV4ek/HU+siPXSf10=;
        b=jpkhocDIO9lQ1kcsLyvLG4oqY7gSVxvAklYr0+jPIFGd7a8Esy7iftKsDeed6vdqwG
         2eWrYWm7CWBv8yvgNq8aF3S0HoMYLCeHHoh1hXp702MQgb4ZeFnljHNkixf6ArRNweAa
         kCocjlUZMeeYTGFfxw7tXILZSR4mfu0DywVSx6J+hKZpwLWoS7GQ7ryk0RZox6qeGo4t
         wGB82v4gEL+WwPNs4LIR+wPUr4Xm3rwBCbBB3jQa0mzbrwP7jydfPer4RSQa0eVKKu4q
         czsAyYUXKf1eGlel+HEjAY5EcJivTZl2IXTdN39yCuNNBa8yi1ccuj4orgMi2jyJEFlO
         XTOg==
X-Forwarded-Encrypted: i=1; AJvYcCVDiH3pWk0IFFDnpbEttMu4yxvB/VbT+JZ9VOU2AvuX5HQjVBn9pfADtjXAJOEUzNjje8j+Hu4zE1w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxey2oi+rj43uYlrGmDaN30RKq3eXpTskJ9Um9RAmn5AOV6GgyQ
	uFMDAlHeagKXn3AasoK96c9GD/ckGf9evLO9j+YSLVZzWkt7JyxfikIC
X-Gm-Gg: AZuq6aL2YC23adJXUvexHC3kbvnNmr3YdLkvNs4XTJc9bVYbhSlluwFfbOi2Xr5tiF6
	sdKkuSbWMwqNvvQwyiPgieM6yjzfNL1kGIK5EMRfyZDMi6c5zILxvYik6VgO1Ao5CuDPxza0l5r
	+6S196ClRAyZFfstmMQEse/M1uHyQxXrHtbgKQKz+yZtWPwUM+CcBGORv7yraUZsqQg/7amILhf
	Dr/SGzpng28CzTVrfvwbp8utt0+2udLZUuotraCUgnibh6e7mR3QwD5C7iPpgZ44dftxS+spk0P
	p0GrYVGrb0qR68NljH1fLXR2U33EJise4og2D8uoJ713qiULRMQXuTbz6juWKVL32lKVocki7n7
	NghOISq/Snip88PW5Y3LMn0pkHlRnhAH654UrzAEOsd8UBnxLeqy+MY9mKMl5c8Q/eD9bBRxfd0
	LcF6qzf6G0mztRp0bSYsu39MOzECiA5sLTa0Q61wYodfUeZpsTNWGQqBPV/xMGKFy0up8pRT4sy
	/oJtwlVb289IqPIumSIh/E02e8vR/yCmx3OZJ8ZCynS0RWuXEWMTxmKVk0=
X-Received: by 2002:a05:6a00:2e1d:b0:81b:abcd:7e27 with SMTP id d2e1a72fcca58-826d074a7d3mr1102609b3a.20.1771577250408;
        Fri, 20 Feb 2026 00:47:30 -0800 (PST)
Received: from lorddaniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.www.tendawifi.com ([103.47.105.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6a29f0asm28976456b3a.9.2026.02.20.00.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 00:47:29 -0800 (PST)
From: Piyush Patle <piyushpatle228@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] dt-bindings: rtc: isl12026: convert to YAML schema
Date: Fri, 20 Feb 2026 14:17:23 +0530
Message-Id: <20260220084723.171639-1-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260220-vigorous-holistic-platypus-6ebebd@quoll>
References: <20260220-vigorous-holistic-platypus-6ebebd@quoll>
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
	TAGGED_FROM(0.00)[bounces-5986-lists,linux-rtc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Queue-Id: 06622165E67
X-Rspamd-Action: no action

Convert the ISL12026 RTC binding from text format to YAML schema.
Remove the legacy text binding.

The new schema enables dtbs_check validation.
---
Changes in v2:
- Fixed schema validation issues pointed out in review
- Improved example node formatting
- Removed redundant description text

---
Changes in v3:
- Dropped unnecessary block scalar ('|') in description
- Removed unsupported select section to match existing RTC bindings
- Aligned schema structure with other RTC YAML bindings
- Fixed YAML formatting and dt_binding_check errors

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
---
 .../devicetree/bindings/rtc/isil,isl12026.txt | 28 --------
 .../bindings/rtc/isil,isl12026.yaml           | 64 +++++++++++++++++++
 2 files changed, 64 insertions(+), 28 deletions(-)
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
index 000000000000..a6822605fd72
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/isil,isl12026.yaml
@@ -0,0 +1,64 @@
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
+description: |
+  The ISL12026 is a combination RTC and EEPROM device connected via I2C.
+  The RTC and control registers respond at address 0x6f, while the EEPROM
+  array responds at address 0x57. The "reg" property refers to the RTC
+  portion of the device.
+
+select:
+  properties:
+    compatible:
+      const: isil,isl12026
+  required:
+    - compatible
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


