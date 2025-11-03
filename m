Return-Path: <linux-rtc+bounces-5242-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DA7C2B9AA
	for <lists+linux-rtc@lfdr.de>; Mon, 03 Nov 2025 13:19:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9BEDB34966B
	for <lists+linux-rtc@lfdr.de>; Mon,  3 Nov 2025 12:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19F3830C355;
	Mon,  3 Nov 2025 12:19:08 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE4EA30AD0F;
	Mon,  3 Nov 2025 12:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762172347; cv=none; b=JHQEwxBoiBkaG/a15X65TUJsKDPm48qoTGtStax8ricC9O9r7POP2ltnRwTyw1CwNxAAfGYsJBMqyr5ojEIZ7focPIEMKeZHs5fWCq8JjAdHm388NSTf0YmNkDwG/QVG6o5sO6Oi8/DW7ul5D7z91+lWORkchFdEhNvES5YHNwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762172347; c=relaxed/simple;
	bh=MZxXnUc/0o2RY71WOOo2pgfb2vgQeecbNlSWJTqdZ6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wgw6h4+GN1iMAAqFoiikJY1bQWi9pnrYEQ/qJOms23e380vJ8AAUcA6nDbBzUANaJjnMQcnTwhpYhPzgrkPGsk2pONdrn/9SZzhfZkRlC7XVY6FyWgfesdLs8KAvcyM3Far0Phg9UDYtdBUbkMMyJIB9yYpjKEt4IIH9Ejyj9+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: DJsFk1fVQMu+E3eITq5qJA==
X-CSE-MsgGUID: AffQwQz0TRW9HXJLaMoXOQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 03 Nov 2025 21:18:58 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.152])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 04F6440065BE;
	Mon,  3 Nov 2025 21:18:54 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: claudiu.beznea.uj@bp.renesas.com,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] dt-bindings: rtc: renesas,rz-rtca3: Add RZ/V2H support
Date: Mon,  3 Nov 2025 12:18:45 +0000
Message-ID: <20251103121848.6539-2-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251103121848.6539-1-ovidiu.panait.rb@renesas.com>
References: <20251103121848.6539-1-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Renesas RZ/V2H RTC IP is based on the same RTCA3 IP as RZ/G3S
(r9a08g045), with the following differences:
- It lacks the time capture functionality
- The maximum supported periodic interrupt frequency is 128Hz instead
  of 256Hz
- It requires two reset lines instead of one

Add new compatible string "renesas,r9a09g057-rtca3" for RZ/V2H and update
the binding accordingly:
- Allow "resets" to contain one or two entries depending on the SoC.
- Add "reset-names" property, but make it required only for RZ/V2H.

Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
 .../bindings/rtc/renesas,rz-rtca3.yaml        | 45 ++++++++++++++++---
 1 file changed, 40 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml b/Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml
index e70eeb66aa64..2569cb494481 100644
--- a/Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml
+++ b/Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml
@@ -9,14 +9,12 @@ title: Renesas RTCA-3 Real Time Clock
 maintainers:
   - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
 
-allOf:
-  - $ref: rtc.yaml#
-
 properties:
   compatible:
     items:
       - enum:
           - renesas,r9a08g045-rtca3 # RZ/G3S
+          - renesas,r9a09g057-rtca3 # RZ/V2H
       - const: renesas,rz-rtca3
 
   reg:
@@ -48,8 +46,12 @@ properties:
     maxItems: 1
 
   resets:
-    items:
-      - description: VBATTB module reset
+    minItems: 1
+    maxItems: 2
+
+  reset-names:
+    minItems: 1
+    maxItems: 2
 
 required:
   - compatible
@@ -61,6 +63,39 @@ required:
   - power-domains
   - resets
 
+allOf:
+  - $ref: rtc.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a08g045-rtca3
+    then:
+      properties:
+        resets:
+          items:
+            - description: VBATTB module reset
+        reset-names:
+          const: vbattb
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g057-rtca3
+    then:
+      properties:
+        resets:
+          items:
+            - description: RTC reset
+            - description: Reset for the RTEST registers
+        reset-names:
+          items:
+            - const: rtc
+            - const: rtc_rtest
+      required:
+        - reset-names
+
 additionalProperties: false
 
 examples:
-- 
2.51.0


