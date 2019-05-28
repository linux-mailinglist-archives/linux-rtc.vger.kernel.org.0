Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D2232D04E
	for <lists+linux-rtc@lfdr.de>; Tue, 28 May 2019 22:31:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726748AbfE1UbC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 28 May 2019 16:31:02 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:40041 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726492AbfE1UbC (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 28 May 2019 16:31:02 -0400
X-Originating-IP: 90.89.68.76
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id F0EE740008;
        Tue, 28 May 2019 20:30:58 +0000 (UTC)
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rtc@vger.kernel.org
Subject: [PATCH v2 05/11] dt-bindings: rtc: sun6i: Add the R40 RTC compatible
Date:   Tue, 28 May 2019 22:30:35 +0200
Message-Id: <543acf9aa96a6ef384fe99913335532e9730547e.1559075389.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <434446bc5541d7dfe5823874355c7db8c7e213fa.1559075389.git-series.maxime.ripard@bootlin.com>
References: <434446bc5541d7dfe5823874355c7db8c7e213fa.1559075389.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The R40 has a pretty different RTC compared to the other SoCs we've
encountered so far, the most important difference being that it now has
only a single interrupt, compared to the previous SoCs having two.

Let's add a compatible for that.

Acked-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
index f154bbba6a69..924622f39c44 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
@@ -19,9 +19,7 @@ properties:
       - const: allwinner,sun6i-a31-rtc
       - const: allwinner,sun8i-a23-rtc
       - const: allwinner,sun8i-h3-rtc
-      - items:
-          - const: allwinner,sun8i-r40-rtc
-          - const: allwinner,sun8i-h3-rtc
+      - const: allwinner,sun8i-r40-rtc
       - const: allwinner,sun8i-v3-rtc
       - const: allwinner,sun50i-h5-rtc
       - items:
@@ -32,6 +30,8 @@ properties:
     maxItems: 1
 
   interrupts:
+    minItems: 1
+    maxItems: 2
     items:
       - description: RTC Alarm 0
       - description: RTC Alarm 1
@@ -69,6 +69,7 @@ allOf:
           contains:
             enum:
               - allwinner,sun8i-a23-rtc
+              - allwinner,sun8i-r40-rtc
               - allwinner,sun8i-v3-rtc
 
     then:
@@ -91,6 +92,24 @@ allOf:
           minItems: 3
           maxItems: 3
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun8i-r40-rtc
+
+    then:
+      properties:
+        interrupts:
+          minItems: 1
+          maxItems: 1
+
+    else:
+      properties:
+        interrupts:
+          minItems: 2
+          maxItems: 2
+
 required:
   - "#clock-cells"
   - compatible
-- 
git-series 0.9.1
