Return-Path: <linux-rtc+bounces-5984-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAiEE9ellmmTiQIAu9opvQ
	(envelope-from <linux-rtc+bounces-5984-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Feb 2026 06:55:35 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D7A15C3BB
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Feb 2026 06:55:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D20863055C8E
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Feb 2026 05:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B27FF2D12ED;
	Thu, 19 Feb 2026 05:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gob8dHpg"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729422D3A93
	for <linux-rtc@vger.kernel.org>; Thu, 19 Feb 2026 05:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771480285; cv=none; b=IgTaAJOo2+bD4NMdowvZLcVdoIPr5AGKon4F/j9V86ZqebyR4B23grt4Tr9Ko4fj577Df9GmmJgg3XlPwhf674qgcLbyI17pl/HWhIpxxdDPUZ8VrryDDC5WZa/8tumzo36gI9cUrt5KOZXWrp602rJ/0qHDrYcEgQK+V1QtozU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771480285; c=relaxed/simple;
	bh=htaF1Od6Lb+TxcS2/V/K7m5BHfTrBLHow3IXUGwFe9A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pqcGUNySYeq/eZ3CRwt2ggnYCA9fMUc2MF9SMuRMLnoeaK/FviQ0YVW1+OXu3rWgUocx/W3q1KIsxeX+xs6o5933Ch2r5jn9+VuZKM62F3wq21dKyB1rGNVKzip3IAuSo5/qSsUlx73hdMMbBkTD8RODOp0TamwPYKRORMh86Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gob8dHpg; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-354bc7c2c46so346977a91.0
        for <linux-rtc@vger.kernel.org>; Wed, 18 Feb 2026 21:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771480283; x=1772085083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oOT1TOzEwQYZq5JX0qTFAM3MCuWoZ9r71oq9P6+0W2k=;
        b=gob8dHpg9AFJwuxTdvp5jXp8dR9sdLLSosSqLFq4TQGzr0FcrvnrHwavfIMtZj9W6J
         2d9WZ+BWi39blSurBAa10CDD2hIdkIj3rew8+d+ZTcit463SBP3R/Ug8cw/yv0aO7Vz6
         xnUEmlkad5joZt4LyjN68OU/mxoeeM6vHCB5k5mb7G60iqViAZbXi7J67zGrD5cNsr0q
         twBwhB+Pm1ZrhklRg/2SKBFT0sizXeE5vw/Vlsxkk3GyWC/bGCTMAJe7uZOkmiXcAaLy
         HOssF0qqXp3Y8h6lswQ8H2JTNwQNQgZiqsVQJfWYBAj1UezEAAGw9oGguEEsEJqHD+ya
         goog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771480283; x=1772085083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOT1TOzEwQYZq5JX0qTFAM3MCuWoZ9r71oq9P6+0W2k=;
        b=v7cKriCJ2Cb8HEzcKrmujvXd6S+YJrYQD/Mf2P9CTwJ7o0U1tnprKj2BHaRQa1SOJv
         u8L3zBDxXc7UCXhWlT3c2ffyWkwV2MjMp9ifwKw/H0urHI76qKIGpuPwZjCpSNaybtWO
         pmTqgGfkXvWBNOF8ejSO3rRbn3kxFIJuH+TyOtwuRk7JSM/6jX+oAdhNMnkx0JhPF2/3
         AyIurnuYVTb7mbmj3ZjnVcRopMyrVuBJBKemKCVwCX0hoLg0rKQ6QTUJ7h00BonN6/i5
         JFW42JAYt2qqQ7U1xKa0M+lQAn/qUYQ2lNRlGilxUIjL4XXznknqBNyeuwO1kn3+EQqv
         HFEw==
X-Gm-Message-State: AOJu0YyCgHs54x6V4XB+BzrjgKF1ovBR2WX6CZU9ijKjDasc58J5+5Uu
	GRKixmFVE3OaaoKDao9v010dtPNkUImdF9VzBWzsP0PAzGglAGSpDNNL
X-Gm-Gg: AZuq6aKIDCgkMLQRXYM62e+VU/YsJAuwNrW/rHk2AX858Hzd/wbYzo93cOVNQvAStKC
	tVxy/VSl+ZyFGl+YnRcBqY7Yuiajp8uCB/8zD92leyA4ZfPmmfch+tCuX+pbjv056F+C7FwuWkn
	1sRcJXTpNpmgHxg4jF7oc0hWIFdunz5nv9r8jA6xNPLEfNT9LyVphlBmb7PjIgjHsfT4sQ7ZAks
	n5ao5TLoNoNxkaSFkkEvf1FBwWskO2b5JFmiWOMxCTjydR2nX3/FjzNindwtdrYStQ8GZgYpV55
	tDoT0CYStP4GXx+wK1+SnwnJ28kC5457DRIjrwnAR95RPG/u4iIySKdxUalcOXNIcJNPNe+S6il
	0VTvUmztaxTRvZqVoFmBoCRJc/vJFi+yA1HHcE3LIauVu7303Ps18vz0tn/5nbtdxAIcRWlJFi6
	iSiVVAH8pTsSbDhknfBx6itCIc6hlIabLxNyH9oj6HmwcCoC6Du2oBTAlWhv324ycD+va78Dk0P
	NxN7AdY1uO3VVYdRqviciLXl4PgF19s9ET+iw==
X-Received: by 2002:a17:90b:586f:b0:34c:a29d:992a with SMTP id 98e67ed59e1d1-356aada821dmr17081014a91.34.1771480282682;
        Wed, 18 Feb 2026 21:51:22 -0800 (PST)
Received: from lorddaniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2405:201:31:d01f:321d:fdd0:3c02:de61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3567e7d95d8sm26300755a91.2.2026.02.18.21.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 21:51:22 -0800 (PST)
From: Piyush Patle <piyushpatle228@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: rtc: isl12026: convert to YAML schema
Date: Thu, 19 Feb 2026 11:21:15 +0530
Message-Id: <20260219055115.195302-1-piyushpatle228@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-5984-lists,linux-rtc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url,6f:email]
X-Rspamd-Queue-Id: E4D7A15C3BB
X-Rspamd-Action: no action

Convert the ISL12026 RTC binding from text format to YAML schema.
Remove the legacy text binding.

The new schema enables dtbs_check validation.
---
Changes in v2:
- Fixed schema validation issues pointed out in review
- Improved example node formatting
- Removed redundant description text

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


