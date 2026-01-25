Return-Path: <linux-rtc+bounces-5860-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMpyIa00dmkQNgEAu9opvQ
	(envelope-from <linux-rtc+bounces-5860-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Jan 2026 16:20:13 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D80E381278
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Jan 2026 16:20:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6931B3006523
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Jan 2026 15:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38F9431A041;
	Sun, 25 Jan 2026 15:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hfGxJFvK"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980B419B5A3
	for <linux-rtc@vger.kernel.org>; Sun, 25 Jan 2026 15:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769354404; cv=none; b=seWFqBn+peo+VfW6Idsss1y5H71szmU2eurUv7PmPkl70BaXDimO5P2kaymzAL94aZHH4Q/uz7Kry9dO1W+OW/aVZZVQSBT0RdqAG6XeECEqNCpHes9GKrMOVeoE5Dt4ag2iOQm9PxpDqE3x7n3WlCjunfMXAOiFDVCdTr0wVFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769354404; c=relaxed/simple;
	bh=l9NQa79di/jjOBPV+OqER4b7B0YtHihmaNsEeJfrOXo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s2EvL0njk4GwsrfVvn1TDKmF+aIsHh8U/PmkIHWSu6/4IsBhCREGTW6NX5IsdIBPsX8bpdG6iigLTGt64/Zr8UCOcPiVd5QSlRzbVgVCGwqLo2FiHP304WLM2wswKRF22MmygHAmy2u01QhAO7QzYqO4Iw2N01qtdC23YvWKogE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hfGxJFvK; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42fb6ce71c7so3514773f8f.1
        for <linux-rtc@vger.kernel.org>; Sun, 25 Jan 2026 07:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769354401; x=1769959201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IlJduHNY4/ATTPZTxaM+BbgtP/PXXrqKo+1qMJ4eq2o=;
        b=hfGxJFvKDkitCXosV8Fc+Ymqc5h1TCFoYg/MnGJKcVSD6Pc0VCu0wVy9OJ827RJchC
         vadfoSCqD3dishqTy5YY9JrMjpyZhld3dfXbjAly5mU6edgtgzPsvYlYv98ChDYpz3QK
         7WWK4iR9J0+cUljGaiPKiyHS1qLseAJNl0/joKCNZISN4A1YJIo9n35LLCMJhz3f3k5g
         T2tEkponEErCaHRfSam3kqEZyjZFwDD3XAorNCZsDHNvPrn//7uscnbiveoSuhgJMP9D
         PVHBLDEduH6sUkld3iscpcZkAFRWwcK/lZxueRznx2PDKFqNQdeq4iz/GYyP6Qno3pah
         95BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769354401; x=1769959201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IlJduHNY4/ATTPZTxaM+BbgtP/PXXrqKo+1qMJ4eq2o=;
        b=ar3ZWbHIsn3OK7RNcNxyvpJwxJsfvtHQZNaGJeale/EFSwbJJsoMUHt6j1lP6q5m7t
         VWGUAnSDxnRm3sfx0pRTb0ECQR0OI8hkyz9QNCiaFJ7I7nCkHrcOg55ANeZSm8GKlvwj
         oVotyoOt5uWFtPm9ZBdcgnYAtURjZ7SzMcnKRcX9bxRfciCy+0e5dVSCaJEdbVNNQzNd
         A49FbJ0zq9AY3SHCIsQNzsnohwHz8NBeT7URfm5jCkrhuHqRWXMc6wFwlMs1tWLEKMZg
         HTxVG4RTZwiNi0S4Dt3h3zPl8VPo16mEAagOHF9Q3fOvV9s8HGvtuf4/nMmdIqlZvLJ3
         WGzA==
X-Forwarded-Encrypted: i=1; AJvYcCWGfYtiQiUQt4RHL7x/IYNbBtY+Nrjwh9aaCw2KpRxXeMRWX5iO9T1zM0pUyNfZ8JFhhOd5euC4YQI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKA+afDJQw5q63Xj5ruzR7B1+btCGxbxjwsuFoL0FB5FOq2+3G
	sV+8U+qK5xTetkQaATvnSGCC/Ns7jIHVztt6sGid0eACNKd95q/JjZeWeKvhHQ==
X-Gm-Gg: AZuq6aJJxnzDfxuzK7LdakmVcArmy6L190hasRPCdSIGLkvpWvXA3+NtB5+2WvgUh3w
	5cMuf8vJxXJ6BCJFn89kOcEXUyhnDA/yEnDgw2BBSN+hveJWWPhL0yQjtqoc1hPP1pAw6EGmFWI
	f46XXLzCtpRFBd/V1XeuK5HjrwxzFnkhmqr5skbGbaOgVetErTE9ryzGhQEegnxL/Y0oCbNZUUO
	qb+UV8pytET1qNEJe01L0QVFA82wtE7lZZJVqmBCWs7r0aPAYXEr8bIjsGT2N5iDeWoneLn6AWq
	e40eKphHX/uO2nf8a0fcanTIQA/JPlRfcWSuTPtf3tRPqv0xHFZr52t9d43oUw7tVWrBEa3JXqC
	ehEVMwJ9+qv/xLlg1bDRsWoeLohFspWF9sr3SLcARjfK1Xvk2dl/r1dGYtLkpGXjO3hiFuY8mbC
	LF
X-Received: by 2002:a05:600c:4f43:b0:477:a54a:acba with SMTP id 5b1f17b1804b1-4805cf5f2b9mr31969485e9.17.1769348592595;
        Sun, 25 Jan 2026 05:43:12 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c246ecsm22459688f8f.10.2026.01.25.05.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 05:43:12 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Tony Lindgren <tony@atomide.com>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH v1 01/10] dt-bindings: regulator: cpcap-regulator: convert to schema
Date: Sun, 25 Jan 2026 15:42:53 +0200
Message-ID: <20260125134302.45958-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260125134302.45958-1-clamor95@gmail.com>
References: <20260125134302.45958-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-5860-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,bootlin.com,atomide.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Queue-Id: D80E381278
X-Rspamd-Action: no action

Convert devicetree bindings for the Motorola CPCAP MFD regulator subnode
from TXT to YAML format. Main functionality preserved and added compatible
for CPCAP regulator set found in the Mot board.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/regulator/cpcap-regulator.txt    | 35 -------------
 .../regulator/motorola,cpcap-regulator.yaml   | 51 +++++++++++++++++++
 2 files changed, 51 insertions(+), 35 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/cpcap-regulator.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/motorola,cpcap-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/cpcap-regulator.txt b/Documentation/devicetree/bindings/regulator/cpcap-regulator.txt
deleted file mode 100644
index 36f5e2f5cc0f..000000000000
--- a/Documentation/devicetree/bindings/regulator/cpcap-regulator.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-Motorola CPCAP PMIC voltage regulators
-------------------------------------
-
-Requires node properties:
-- "compatible" value one of:
-    "motorola,cpcap-regulator"
-    "motorola,mapphone-cpcap-regulator"
-    "motorola,xoom-cpcap-regulator"
-
-Required regulator properties:
-- "regulator-name"
-- "regulator-enable-ramp-delay"
-- "regulator-min-microvolt"
-- "regulator-max-microvolt"
-
-Optional regulator properties:
-- "regulator-boot-on"
-
-See Documentation/devicetree/bindings/regulator/regulator.txt
-for more details about the regulator properties.
-
-Example:
-
-cpcap_regulator: regulator {
-	compatible = "motorola,cpcap-regulator";
-
-	cpcap_regulators: regulators {
-		sw5: SW5 {
-			regulator-min-microvolt = <5050000>;
-			regulator-max-microvolt = <5050000>;
-			regulator-enable-ramp-delay = <50000>;
-			regulator-boot-on;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/regulator/motorola,cpcap-regulator.yaml b/Documentation/devicetree/bindings/regulator/motorola,cpcap-regulator.yaml
new file mode 100644
index 000000000000..b73d32a86904
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/motorola,cpcap-regulator.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Motorola CPCAP PMIC regulators
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description:
+  This module is part of the Motorola CPCAP MFD device. For more details
+  see Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml. The
+  regulator controller is represented as a sub-node of the PMIC node
+  on the device tree.
+
+properties:
+  compatible:
+    enum:
+      - motorola,cpcap-regulator
+      - motorola,mapphone-cpcap-regulator
+      - motorola,mot-cpcap-regulator
+      - motorola,xoom-cpcap-regulator
+
+  regulators:
+    type: object
+
+    patternProperties:
+      "$[A-Z0-9]+^":
+        $ref: /schemas/regulator/regulator.yaml#
+        type: object
+        description:
+          Valid regulator names are SW1, SW2, SW3, SW4, SW5, VCAM, VCSI,
+          VDAC, VDIG, VFUSE, VHVIO, VSDIO, VPLL, VRF1, VRF2, VRFREF, VWLAN1,
+          VWLAN2, VSIM, VSIMCARD, VVIB, VUSB, VAUDIO
+
+        required:
+          - regulator-name
+          - regulator-enable-ramp-delay
+          - regulator-min-microvolt
+          - regulator-max-microvolt
+
+        unevaluatedProperties: false
+
+required:
+  - compatible
+
+additionalProperties: false
+
+...
-- 
2.51.0


