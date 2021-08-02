Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFEE43DCE55
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Aug 2021 02:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232093AbhHBAk4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 1 Aug 2021 20:40:56 -0400
Received: from foss.arm.com ([217.140.110.172]:57132 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232069AbhHBAkz (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sun, 1 Aug 2021 20:40:55 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3365AD6E;
        Sun,  1 Aug 2021 17:40:47 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F0CB33F66F;
        Sun,  1 Aug 2021 17:40:44 -0700 (PDT)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     Rob Herring <robh@kernel.org>, Icenowy Zheng <icenowy@aosc.io>,
        Samuel Holland <samuel@sholland.org>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        Ondrej Jirman <megous@megous.com>, devicetree@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Subject: [PATCH v9 02/11] dt-bindings: rtc: sun6i: Add H616 compatible string
Date:   Mon,  2 Aug 2021 01:39:43 +0100
Message-Id: <20210802003952.19942-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210802003952.19942-1-andre.przywara@arm.com>
References: <20210802003952.19942-1-andre.przywara@arm.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Add the obvious compatible name to the existing RTC binding.
The actual RTC part of the device uses a different day/month/year
storage scheme, so it's not compatible with the previous devices.
Also the clock part is quite different, as there is no external 32K LOSC
oscillator input.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml      | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
index beeb90e55727..d8a6500e5840 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
@@ -26,6 +26,7 @@ properties:
           - const: allwinner,sun50i-a64-rtc
           - const: allwinner,sun8i-h3-rtc
       - const: allwinner,sun50i-h6-rtc
+      - const: allwinner,sun50i-h616-rtc
 
   reg:
     maxItems: 1
@@ -104,6 +105,19 @@ allOf:
           minItems: 3
           maxItems: 3
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun50i-h616-rtc
+
+    then:
+      properties:
+        clock-output-names:
+          minItems: 3
+          maxItems: 3
+        clocks: false
+
   - if:
       properties:
         compatible:
-- 
2.17.6

