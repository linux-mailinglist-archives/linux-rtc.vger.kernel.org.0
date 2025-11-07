Return-Path: <linux-rtc+bounces-5294-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 59165C41C12
	for <lists+linux-rtc@lfdr.de>; Fri, 07 Nov 2025 22:15:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BE413500120
	for <lists+linux-rtc@lfdr.de>; Fri,  7 Nov 2025 21:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5A1734D4EA;
	Fri,  7 Nov 2025 21:07:23 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A10F833F8A9;
	Fri,  7 Nov 2025 21:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762549643; cv=none; b=CEixEblM/+zNiSkmRzShio0twYCMXI9chkPYLkqeMWSsoUvWcGkqMXnRcovwVIZOopfaHPwSS/qYSjgTupddmG6iHCqHsP7mJUZ4JXqcszrYQfoo3ue3ZmeGOSvfBeobQ8n5REZuHZLHVLe6AlkWrUhpVj184W89VasE6t5baDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762549643; c=relaxed/simple;
	bh=iJuZIOes2XAgT3eAh7sIRjtBrzNjl0r83lrWW4D16Qo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jdm9gWUnNGosxvG+0zn0pb+Vk6JDzEu6xZ5XF5jzzltqfGUx+Hi87mH1CT9ZZkJD1xrDNGMtg/ufw9iwBrDuhfa7WpVQD6Uuo8k6GT0xDl4z7vfAHp/49xPYkwJQZ/Ael+NEcu1kRKfgc2DkDjQb5gTPul8bqmYmQWJ7ok4769s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: N+ERxlYiTzuUkcF4DGdyHA==
X-CSE-MsgGUID: pwV2QVJpQSGwzRF4FRAJvg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 08 Nov 2025 06:07:15 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.93.123])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2A3D3400007A;
	Sat,  8 Nov 2025 06:07:11 +0900 (JST)
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
Subject: [PATCH v4 1/4] dt-bindings: rtc: renesas,rz-rtca3: Add RZ/V2H support
Date: Fri,  7 Nov 2025 21:07:03 +0000
Message-ID: <20251107210706.45044-2-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251107210706.45044-1-ovidiu.panait.rb@renesas.com>
References: <20251107210706.45044-1-ovidiu.panait.rb@renesas.com>
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
 .../bindings/rtc/renesas,rz-rtca3.yaml        | 46 +++++++++++++++++--
 1 file changed, 41 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml b/Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml
index e70eeb66aa64..ccb1638c35b9 100644
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
+            - const: rtest
+      required:
+        - reset-names
+
 additionalProperties: false
 
 examples:
@@ -81,4 +116,5 @@ examples:
         clock-names = "bus", "counter";
         power-domains = <&cpg>;
         resets = <&cpg R9A08G045_VBAT_BRESETN>;
+        reset-names = "vbattb";
     };
-- 
2.51.0


