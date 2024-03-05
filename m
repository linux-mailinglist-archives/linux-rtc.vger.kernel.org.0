Return-Path: <linux-rtc+bounces-779-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B10D387179F
	for <lists+linux-rtc@lfdr.de>; Tue,  5 Mar 2024 09:09:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4191CB208B8
	for <lists+linux-rtc@lfdr.de>; Tue,  5 Mar 2024 08:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEDF87EF17;
	Tue,  5 Mar 2024 08:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="b7HR3ghh"
X-Original-To: linux-rtc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066176025A;
	Tue,  5 Mar 2024 08:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709626186; cv=none; b=fBRZWPRqUiCWYS1t1uGlqaZ0IbJK0/5oXTOU2UrgwKxac/Gb1fSZ65a7poJ70mMuJEs/cTp2X3pXHy7Q73wM5nyJgbeAviY9g33Vujem2T3cYJQis2ugfh7UIb4HkvXg0PTmJbcP6WZJXnH9sfaqfqWzd/YNMXALlOUZodopURg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709626186; c=relaxed/simple;
	bh=cbx1YV4oq31OL5ssAKQigwLQYNjphEBaXQ+yuVh3KAs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rX8LRHsk1fB45jP6YQGzPQRcL1AYEjYQgZCxfYkr3pL89sCNtB/ceKIzuNAHJQtMlao5G9ADmaHSqolzupqOVWwNVSdr9Z6FAucA4+CXVyWrhRSU7EtwkLEjeIOk5xv9PN2GbTEdftp3PyUCL9WqZYVwtCowlxtNyDg/XbJT+i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=b7HR3ghh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7A9EECC8;
	Tue,  5 Mar 2024 09:09:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1709626166;
	bh=cbx1YV4oq31OL5ssAKQigwLQYNjphEBaXQ+yuVh3KAs=;
	h=From:To:Cc:Subject:Date:From;
	b=b7HR3ghhq/yF4tYZE0uNV7E0Ih5vxF1lHhD4rUmVfxpm9ixMhqcikVcDsHygyiaH7
	 baQEdHK/VH5bys+46svCRaA2q7oyhy9/OMR6pjE3nI5+KzXKnrkn3ZtfghJj1UxnPI
	 WXDxBV4nVTOoQnu6n+jSk95s+qFYYkiTF3P69/nU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH] dt-bindings: rtc: abx80x: Improve checks on trickle charger constraints
Date: Tue,  5 Mar 2024 10:09:44 +0200
Message-ID: <20240305080944.17991-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The abracon,tc-diode and abracon,tc-resistor DT properties are only
valid for the ABx0804 and ABx0805. Furthermore, they must both be
present, or neither of them must be specified. Add rules to check this.

The generic abracon,abx08x compatible string doesn't indicate which chip
variant is used, but performs auto-detection at runtime. It must this
also allow the two above properties.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../bindings/rtc/abracon,abx80x.yaml          | 25 ++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/abracon,abx80x.yaml b/Documentation/devicetree/bindings/rtc/abracon,abx80x.yaml
index 58dbbca27deb..355b0598411a 100644
--- a/Documentation/devicetree/bindings/rtc/abracon,abx80x.yaml
+++ b/Documentation/devicetree/bindings/rtc/abracon,abx80x.yaml
@@ -9,9 +9,6 @@ title: Abracon ABX80X I2C ultra low power RTC/Alarm chip
 maintainers:
   - linux-rtc@vger.kernel.org
 
-allOf:
-  - $ref: rtc.yaml#
-
 properties:
   compatible:
     description:
@@ -55,10 +52,32 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum: [0, 3, 6, 11]
 
+dependentRequired:
+  abracon,tc-diode: ["abracon,tc-resistor"]
+  abracon,tc-resistor: ["abracon,tc-diode"]
+
 required:
   - compatible
   - reg
 
+allOf:
+  - $ref: rtc.yaml#
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              enum:
+                - abracon,abx80x
+                - abracon,ab0804
+                - abracon,ab1804
+                - abracon,ab0805
+                - abracon,ab1805
+    then:
+      properties:
+        abracon,tc-diode: false
+        abracon,tc-resistor: false
+
 unevaluatedProperties: false
 
 examples:
-- 
Regards,

Laurent Pinchart


