Return-Path: <linux-rtc+bounces-2850-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B6EA072FE
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Jan 2025 11:26:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96835188AFA6
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Jan 2025 10:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93A572163AF;
	Thu,  9 Jan 2025 10:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IEQ55gq/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628D3215798;
	Thu,  9 Jan 2025 10:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736418229; cv=none; b=CkiB5dvMrh0rpsrdNqbth19xYTQtA01Z+nO7lk5eCumwgOuoq/XrQAcA5AqOC36D7Ji+vNwLbV+i9Mu7rpHA92W3WHIvBf1/u/V2TrSPAWsn1bt0dNO0eabRTfz2n3k23b74tVQv8NwytI8pRUuRXhQYR5xrrMok7XgIM1ekDGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736418229; c=relaxed/simple;
	bh=DelX21QKMIdxP+O/jvc4on2/htJfBru+mqcycYq84go=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vCICcK3BS1sIPkhc3qdedqHapKsuqk/iPdHzUrkcNwud+UYTEctlq9hybhjfogWtzNwpXmXrWhM6OMcmcd/ouMi3H01DgNX3pEmn64/s+Cc/c+ITKKfdv0CWqU9/TO69DTFIqb44J8tF3wyMWrV1nZMPe2ebv7NesQ1UgAJaJ2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IEQ55gq/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11DB7C4CEE2;
	Thu,  9 Jan 2025 10:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736418229;
	bh=DelX21QKMIdxP+O/jvc4on2/htJfBru+mqcycYq84go=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IEQ55gq/SE1fFkrpSyVWOHPkYHBI50f9lyBSdYhpeSrjwfYnFTVanGbYFGdhnKbWf
	 zUYMQ4tVSELxSG0s4Msmi0rD2VEvngSArmMOFuOt02NebwXn9IZDsW7bjBp0jpvNZX
	 31jlraSvgaRa5MQzfz0X50X75z3byMzUzSxXuc+ObPrQ4LydrDZ3Bsu7X8UrOt1TeX
	 fQpApJ+mldl8xZzDM7jVVaBbiS67LuEZvX8m5l/ND7H1WCxSvzgLJ/ujlscAfg7xyB
	 yJa8hKcTHPJyPn2zEECU6FsvzYZWWg74d7GobLvrZTFw2/U7Ix2sew+XH5+AfONLZ4
	 nd33eRQwgeKrw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 086C7E7719A;
	Thu,  9 Jan 2025 10:23:49 +0000 (UTC)
From: PavithraUdayakumar-adi via B4 Relay <devnull+pavithra.u.analog.com@kernel.org>
Date: Thu, 09 Jan 2025 15:59:57 +0530
Subject: [PATCH v3 1/2] dt-bindings: rtc: max31335: Add max31331 support
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-add_support_max31331_fix_3-v1-1-a74fac29bf49@analog.com>
References: <20250109-add_support_max31331_fix_3-v1-0-a74fac29bf49@analog.com>
In-Reply-To: <20250109-add_support_max31331_fix_3-v1-0-a74fac29bf49@analog.com>
To: Antoniu Miclaus <antoniu.miclaus@analog.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 PavithraUdayakumar-adi <pavithra.u@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736418610; l=1896;
 i=pavithra.u@analog.com; s=20241220; h=from:subject:message-id;
 bh=CSTscMKCGJQV0sJTo05LWTvBCwbI5QwOv/6bQjL/k98=;
 b=MVUREwDDBzAEkOP2qrqKCJPk/uE6DnHkF4z6YLsKaq6Z+Jgqphj2k94/7x4dqdB5PEK2kYBk6
 ZhfmV5059f4BbPHp4rZH9u3clqzeSOtNkOz5b7N0aQDwB+4Mu9NRLmY
X-Developer-Key: i=pavithra.u@analog.com; a=ed25519;
 pk=RIhZrdpg71GEnmwm1eNn95TYUMDJOKVsFd37Fv8xf1U=
X-Endpoint-Received: by B4 Relay for pavithra.u@analog.com/20241220 with
 auth_id=303
X-Original-From: PavithraUdayakumar-adi <pavithra.u@analog.com>
Reply-To: pavithra.u@analog.com

From: PavithraUdayakumar-adi <pavithra.u@analog.com>

MAX31331 is an ultra-low-power, I2C Real-Time Clock RTC with flexible
crystal support. While, MAX31335 offers higher precision, MEMS resonator,
and integrated temperature sensor. MAX31331 uses I2C address as 0x68
where as max31335 uses 0x69.

Changes: Added example for max31331 and modified the register address
for max31335.

Signed-off-by: PavithraUdayakumar-adi <pavithra.u@analog.com>
---
 .../devicetree/bindings/rtc/adi,max31335.yaml      | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/adi,max31335.yaml b/Documentation/devicetree/bindings/rtc/adi,max31335.yaml
index 0125cf6727cc3d9eb3e0253299904ee363ec40ca..f249313bc485d7a6154ce684726d6a950405ef0e 100644
--- a/Documentation/devicetree/bindings/rtc/adi,max31335.yaml
+++ b/Documentation/devicetree/bindings/rtc/adi,max31335.yaml
@@ -18,10 +18,13 @@ allOf:
 
 properties:
   compatible:
-    const: adi,max31335
+    enum:
+      - adi,max31331
+      - adi,max31335
 
   reg:
-    maxItems: 1
+    items:
+      - enum: [0x68, 0x69]
 
   interrupts:
     maxItems: 1
@@ -57,9 +60,9 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
 
-        rtc@68 {
+        rtc@69 {
             compatible = "adi,max31335";
-            reg = <0x68>;
+            reg = <0x69>;
             pinctrl-0 = <&rtc_nint_pins>;
             interrupts-extended = <&gpio1 16 IRQ_TYPE_LEVEL_HIGH>;
             aux-voltage-chargeable = <1>;
@@ -67,4 +70,15 @@ examples:
             adi,tc-diode = "schottky";
         };
     };
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        rtc@68 {
+            reg = <0x68>;
+            compatible = "adi,max31331";
+        };
+    };
 ...

-- 
2.25.1



