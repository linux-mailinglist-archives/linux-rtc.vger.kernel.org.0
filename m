Return-Path: <linux-rtc+bounces-2824-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE6BA0049A
	for <lists+linux-rtc@lfdr.de>; Fri,  3 Jan 2025 07:58:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEF5318839FE
	for <lists+linux-rtc@lfdr.de>; Fri,  3 Jan 2025 06:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 481DA1B6CF6;
	Fri,  3 Jan 2025 06:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iYW/xYdK"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1199319D8BB;
	Fri,  3 Jan 2025 06:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735887477; cv=none; b=Um2q/mJzXjlCs26RO8v30YtR9hSsOBIYl8LJAscu5IktG/4Wk8Lk7qlFENsuKivCilSijcLkPf5scVcNyQvC7p3eCdFJWD25udOYDIbo1xn+NS+RNNNzhNO2NJkuj82ztOHBANAVaKPDSD+9Nm9BOJbhz1IQTTQEMN840L8LM0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735887477; c=relaxed/simple;
	bh=puBApgEkbpNE9ewZ6Vqcb8dkHH6IOVeVLeu43j7JphI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B9mO4CeVjtM7MUedBWFs6CYzQdvSsDju25pMRSmOw9ifmaXayFetDa2OrhPDQr75ucm7O/qqMKg+hx7eztPRFbGkse1AAvu7XCo4IfCQyEG58Goy4bQPhPxK1r9inDxWUIu0CSYbZZrwUMlTsLwwltKwhI7Sdis/yQf4vCf6c6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iYW/xYdK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4E37C4CEDC;
	Fri,  3 Jan 2025 06:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735887476;
	bh=puBApgEkbpNE9ewZ6Vqcb8dkHH6IOVeVLeu43j7JphI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iYW/xYdKWJnqx8Dd0VqU05lpw9Vg2lfh+ccOy70RNJ0l11XzTpaljnIpo50Sg7Tyj
	 bnHW/jXZSq927Q6kqQnPQuG4/dg4ire8Sh/OVLz/L98BQF33MqGZ5fmnR1m/1ewgfP
	 b3NLsMknZBeb+jZtXCSVlTd2m/wUwXHwRRbyRSnpicOfv4wqzAqenmz2Swc85c3/dR
	 x7f3oMg6zrZxf4kWsxtFtO9ofqkIGzdHtPGZbPqMqlZHrvCy43wWeD9UXn6uqhhfmu
	 UDJX3XsFSp1UOa2dqHI3bUw/gIhH4IKpIgGtTjJk8HLJefliOXR2pt7WTTt9n/W9kg
	 gxz4ZJa5IdWAA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 975F6E7718F;
	Fri,  3 Jan 2025 06:57:56 +0000 (UTC)
From: PavithraUdayakumar-adi via B4 Relay <devnull+pavithra.u.analog.com@kernel.org>
Date: Fri, 03 Jan 2025 12:34:19 +0530
Subject: [PATCH v2 1/2] dtbindings:rtc:max31335:Add max31331 support
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250103-add_support_max31331_fix-v1-1-8ff3c7a81734@analog.com>
References: <20250103-add_support_max31331_fix-v1-0-8ff3c7a81734@analog.com>
In-Reply-To: <20250103-add_support_max31331_fix-v1-0-8ff3c7a81734@analog.com>
To: Antoniu Miclaus <antoniu.miclaus@analog.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 PavithraUdayakumar-adi <pavithra.u@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735887863; l=1825;
 i=pavithra.u@analog.com; s=20241220; h=from:subject:message-id;
 bh=SV+d5UQrPERXNNuAfmb0jc/f8Kg97z5CNfrIJM6WaU0=;
 b=jKZKwRwrfwRQfOulh/SzXa4ZTW/bP9nBhYN3nM1L5AwcNF/YIgnZiWYz57BDM2g3GYlJx4yCn
 YpxUaoKnYL7CF+5B4HVRA4TDwUQYngkb7S22PO/bC97ZyLrwm25g8jk
X-Developer-Key: i=pavithra.u@analog.com; a=ed25519;
 pk=RIhZrdpg71GEnmwm1eNn95TYUMDJOKVsFd37Fv8xf1U=
X-Endpoint-Received: by B4 Relay for pavithra.u@analog.com/20241220 with
 auth_id=303
X-Original-From: PavithraUdayakumar-adi <pavithra.u@analog.com>
Reply-To: pavithra.u@analog.com

From: PavithraUdayakumar-adi <pavithra.u@analog.com>

Add support to max31331 RTC chip in adi,max31335.yaml

Signed-off-by: PavithraUdayakumar-adi <pavithra.u@analog.com>
---
 .../devicetree/bindings/rtc/adi,max31335.yaml      | 32 ++++++++++++++++++----
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/adi,max31335.yaml b/Documentation/devicetree/bindings/rtc/adi,max31335.yaml
index 0125cf6727cc3d9eb3e0253299904ee363ec40ca..6953553d98afd42ed9b79bac476657ffc8ec9210 100644
--- a/Documentation/devicetree/bindings/rtc/adi,max31335.yaml
+++ b/Documentation/devicetree/bindings/rtc/adi,max31335.yaml
@@ -13,15 +13,15 @@ description:
   Analog Devices MAX31335 I2C RTC ±2ppm Automotive Real-Time Clock with
   Integrated MEMS Resonator.
 
-allOf:
-  - $ref: rtc.yaml#
-
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
@@ -50,6 +50,26 @@ required:
 
 unevaluatedProperties: false
 
+allOf:
+  - $ref: rtc.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - adi,max31335
+    then:
+      properties:
+        reg:
+          items:
+            - const: 0x69
+    else:
+      properties:
+        reg:
+          items:
+            - const: 0x68
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
@@ -58,7 +78,7 @@ examples:
         #size-cells = <0>;
 
         rtc@68 {
-            compatible = "adi,max31335";
+            compatible = "adi,max31331";
             reg = <0x68>;
             pinctrl-0 = <&rtc_nint_pins>;
             interrupts-extended = <&gpio1 16 IRQ_TYPE_LEVEL_HIGH>;

-- 
2.25.1



