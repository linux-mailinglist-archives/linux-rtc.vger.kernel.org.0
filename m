Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E357388BBE
	for <lists+linux-rtc@lfdr.de>; Wed, 19 May 2021 12:42:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348276AbhESKnj (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 19 May 2021 06:43:39 -0400
Received: from foss.arm.com ([217.140.110.172]:58860 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348306AbhESKne (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 19 May 2021 06:43:34 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E8BCE143B;
        Wed, 19 May 2021 03:42:14 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B289E3F719;
        Wed, 19 May 2021 03:42:12 -0700 (PDT)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     Rob Herring <robh@kernel.org>, Icenowy Zheng <icenowy@aosc.io>,
        Samuel Holland <samuel@sholland.org>,
        Ondrej Jirman <megous@megous.com>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Subject: [PATCH v6 03/17] dt-bindings: rtc: sun6i: Add H616 compatible string
Date:   Wed, 19 May 2021 11:41:38 +0100
Message-Id: <20210519104152.21119-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210519104152.21119-1-andre.przywara@arm.com>
References: <20210519104152.21119-1-andre.przywara@arm.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Add the obvious compatible name to the existing RTC binding.
The actual RTC part of the device uses a different day/month/year
storage scheme, so it's not compatible with the previous devices.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml     | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
index b1b0ee769b71..178c955f88bf 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
@@ -26,6 +26,7 @@ properties:
           - const: allwinner,sun50i-a64-rtc
           - const: allwinner,sun8i-h3-rtc
       - const: allwinner,sun50i-h6-rtc
+      - const: allwinner,sun50i-h616-rtc
 
   reg:
     maxItems: 1
@@ -97,7 +98,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: allwinner,sun50i-h6-rtc
+            enum:
+              - allwinner,sun50i-h6-rtc
+              - allwinner,sun50i-h616-rtc
 
     then:
       properties:
-- 
2.17.5

