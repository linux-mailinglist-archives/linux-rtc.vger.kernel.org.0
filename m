Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D3352B3DA
	for <lists+linux-rtc@lfdr.de>; Mon, 27 May 2019 14:01:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726946AbfE0MBA (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 27 May 2019 08:01:00 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:38817 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726977AbfE0MBA (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 27 May 2019 08:01:00 -0400
Received: from localhost (aaubervilliers-681-1-27-134.w90-88.abo.wanadoo.fr [90.88.147.134])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 6942C240006;
        Mon, 27 May 2019 12:00:55 +0000 (UTC)
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rtc@vger.kernel.org
Subject: [PATCH 05/10] dt-bindings: rtc: sun6i: Add the R40 RTC compatible
Date:   Mon, 27 May 2019 14:00:37 +0200
Message-Id: <8be02c659fe4191dbf1d3c8dcb1ded8ff92e2dda.1558958381.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <290402405a34506997fd2fab2c4c1486dbe6b7e5.1558958381.git-series.maxime.ripard@bootlin.com>
References: <290402405a34506997fd2fab2c4c1486dbe6b7e5.1558958381.git-series.maxime.ripard@bootlin.com>
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

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
index 942ddfc1689d..924622f39c44 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
@@ -19,6 +19,7 @@ properties:
       - const: allwinner,sun6i-a31-rtc
       - const: allwinner,sun8i-a23-rtc
       - const: allwinner,sun8i-h3-rtc
+      - const: allwinner,sun8i-r40-rtc
       - const: allwinner,sun8i-v3-rtc
       - const: allwinner,sun50i-h5-rtc
       - items:
@@ -29,6 +30,8 @@ properties:
     maxItems: 1
 
   interrupts:
+    minItems: 1
+    maxItems: 2
     items:
       - description: RTC Alarm 0
       - description: RTC Alarm 1
@@ -66,6 +69,7 @@ allOf:
           contains:
             enum:
               - allwinner,sun8i-a23-rtc
+              - allwinner,sun8i-r40-rtc
               - allwinner,sun8i-v3-rtc
 
     then:
@@ -88,6 +92,24 @@ allOf:
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
