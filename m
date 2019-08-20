Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95A7E96415
	for <lists+linux-rtc@lfdr.de>; Tue, 20 Aug 2019 17:19:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730544AbfHTPTq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 20 Aug 2019 11:19:46 -0400
Received: from vps.xff.cz ([195.181.215.36]:32812 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730426AbfHTPTh (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 20 Aug 2019 11:19:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1566314375; bh=ceJ7uYMyGuXnT+8w0JVBGUx4Cp8f10wjRMxOExNSRQo=;
        h=From:To:Cc:Subject:Date:References:From;
        b=BF2RGwVaIWjpS8lPMXdkn8hgNaIQ+mrzt5UHgcpqPhS+djX9Bx/ysx64+K0Ob3/vI
         xYCMBm6u47YOW9gP05BTXewRC6oYEGY23xF0r9+uNmlX9O5SyMIo7l7LTPrvkUeQKd
         sAsJBmMPvjAc8BkNp1fvwLL+6zW7c1Iy4j4cAyyA=
From:   megous@megous.com
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     Ondrej Jirman <megous@megous.com>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: [PATCH v2 1/3] dt-bindings: Add compatible for H6 RTC
Date:   Tue, 20 Aug 2019 17:19:32 +0200
Message-Id: <20190820151934.3860-2-megous@megous.com>
In-Reply-To: <20190820151934.3860-1-megous@megous.com>
References: <20190820151934.3860-1-megous@megous.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Ondrej Jirman <megous@megous.com>

RTC on H6 is similar to the one on H5 SoC, but incompatible in small
details. See the driver for description of differences. For example
H6 RTC needs to enable the external low speed oscillator. Add new
compatible for this RTC.

Signed-off-by: Ondrej Jirman <megous@megous.com>
---
 .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml       | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
index 924622f39c44..d7a57ec4a640 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
@@ -25,6 +25,7 @@ properties:
       - items:
           - const: allwinner,sun50i-a64-rtc
           - const: allwinner,sun8i-h3-rtc
+      - const: allwinner,sun50i-h6-rtc
 
   reg:
     maxItems: 1
@@ -92,6 +93,18 @@ allOf:
           minItems: 3
           maxItems: 3
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun50i-h6-rtc
+
+    then:
+      properties:
+        clock-output-names:
+          minItems: 3
+          maxItems: 3
+
   - if:
       properties:
         compatible:
-- 
2.22.1

