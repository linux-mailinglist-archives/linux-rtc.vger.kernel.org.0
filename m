Return-Path: <linux-rtc+bounces-5097-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3072BEE1DD
	for <lists+linux-rtc@lfdr.de>; Sun, 19 Oct 2025 11:22:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 854D8189E4CB
	for <lists+linux-rtc@lfdr.de>; Sun, 19 Oct 2025 09:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CC972E2661;
	Sun, 19 Oct 2025 09:21:30 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 024272E06E4;
	Sun, 19 Oct 2025 09:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760865690; cv=none; b=qq0K3LMYXhw6qZeHpYV3mSig83d6MnQKTaZJnqkV5c/p6+g8i5m5/iWDJPJGWuEtXyH5livpAjDddS3TvXzPaRyl/2PFlHxk0x7yITngm40XYKJbhMEu1c/vDg19DmMOBXfhMvJ0WieM19AVfyMDulkeMYvgjpdYT6X9R8DFzmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760865690; c=relaxed/simple;
	bh=Q9kDYSoPbFF62KFfxS3E7WYBeOeSXy6UVimjBbt94qQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GWXtXTdUt4csz1y9VssBQ163zDKAAcQVNB1KHYJCK8Ut8Xq0OH23wiqmWm5gZDNYcl6GzvJZYJvpTjsb2+XgXzt3aktlTNEtJG6mF0G6WhtX25yog2PwvtW0uKLLhOVD0BhefBjXya16E/s7xIQbanM+clx8H9gFl9i63PSh/MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: XfI5M+1RSkS65je0rvCtDw==
X-CSE-MsgGUID: lMeuP9ajQY641W6Hc9cyRQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 19 Oct 2025 18:21:23 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.5])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id D9BAA4162513;
	Sun, 19 Oct 2025 18:21:18 +0900 (JST)
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
Subject: [PATCH 2/6] dt-bindings: rtc: renesas,rz-rtca3: Add RZ/V2H support
Date: Sun, 19 Oct 2025 09:21:02 +0000
Message-ID: <20251019092106.5737-3-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251019092106.5737-1-ovidiu.panait.rb@renesas.com>
References: <20251019092106.5737-1-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Renesas RZ/V2H RTC IP is based on the same RTCA3 IP as RZ/G3S
(r9a08g045), with the following differences:
- it lacks the time capture functionality
- the maximum supported periodic interrupt frequency is 128Hz instead
  of 256Hz
- it requires two reset lines instead of one

Add new compatible string "renesas,r9a09g057-rtca3" for RZ/V2H and update
the binding so that "resets" may have either one or two entries, depending
on the compatible string.

Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
 .../bindings/rtc/renesas,rz-rtca3.yaml        | 33 ++++++++++++++++---
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml b/Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml
index e70eeb66aa64..39a5c2483374 100644
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
@@ -48,8 +46,8 @@ properties:
     maxItems: 1
 
   resets:
-    items:
-      - description: VBATTB module reset
+    minItems: 1
+    maxItems: 2
 
 required:
   - compatible
@@ -61,6 +59,31 @@ required:
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
+
 additionalProperties: false
 
 examples:
-- 
2.51.0


