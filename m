Return-Path: <linux-rtc+bounces-5113-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E460BF52B8
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Oct 2025 10:08:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 379054243CD
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Oct 2025 08:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D3D2E9EB2;
	Tue, 21 Oct 2025 08:07:25 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E651C2EB843;
	Tue, 21 Oct 2025 08:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761034045; cv=none; b=gwwa/wniRXxuac6qciDK4e+VqiwXJarZBXR7xJ0Zv5VhGgpTqbi/BQXQckohVNdSdRfrHEkSvAJK/oq+orZVT2oLBZBJPMpnd+NkEptMT8WxouL5KdVXD7/J+yLx2oOSYSF+JSz8XVSXQab9QQduJ1JCks03NFnbxD/EWMdw72Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761034045; c=relaxed/simple;
	bh=xWpuFNQAF/zxn0+syvpJzxjJDX69VD2sKWEPBDXOaKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M9lL9UaAo1acy2KXNgkxZf40qtCJcGeQpP7OozQkebEe+YBevDh8/PhD8Ia4GcJb/GYh+4/uMhEd3cFiHW2CxyjjR/H2cfAxToDikFod08U57sZtonnw2g/IR05IWl6Hi5rDJIikLyZglv75LiT9MYAUW3MIZvRcZflqW5ntrf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: xo/54YYqT0y8vKuJzrU0EA==
X-CSE-MsgGUID: QpZCW1kDQ6icE6YFDW02LQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 21 Oct 2025 17:07:22 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.145])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id F38C44141CAF;
	Tue, 21 Oct 2025 17:07:17 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: claudiu.beznea.uj@bp.renesas.com,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 2/6] dt-bindings: rtc: renesas,rz-rtca3: Add RZ/V2H support
Date: Tue, 21 Oct 2025 08:07:01 +0000
Message-ID: <20251021080705.18116-3-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251021080705.18116-1-ovidiu.panait.rb@renesas.com>
References: <20251021080705.18116-1-ovidiu.panait.rb@renesas.com>
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
v2 changes:
- Added "reset-names" property and made it required for RZ/V2H.

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


