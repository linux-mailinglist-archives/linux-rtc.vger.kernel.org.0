Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 222A626E3C3
	for <lists+linux-rtc@lfdr.de>; Thu, 17 Sep 2020 20:34:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbgIQSez (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 17 Sep 2020 14:34:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726514AbgIQSc5 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 17 Sep 2020 14:32:57 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76DDCC06178A
        for <linux-rtc@vger.kernel.org>; Thu, 17 Sep 2020 11:32:56 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7] helo=dude.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <bst@pengutronix.de>)
        id 1kIyiE-0004GR-Ng; Thu, 17 Sep 2020 20:32:54 +0200
From:   Bastian Krause <bst@pengutronix.de>
To:     linux-rtc@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Arnaud Ebalard <arno@natisbad.org>,
        Marek Vasut <marex@denx.de>, kernel@pengutronix.de,
        Bastian Krause <bst@pengutronix.de>
Subject: [PATCH v2 1/8] dt-bindings: rtc: let aux-voltage-chargeable supersede trickle-diode-disable
Date:   Thu, 17 Sep 2020 20:32:39 +0200
Message-Id: <20200917183246.19446-2-bst@pengutronix.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200917183246.19446-1-bst@pengutronix.de>
References: <20200917183246.19446-1-bst@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: bst@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Some RTCs can be equipped with a chargeable battery or supercap.
Every RTC allowing this whose driver's implement it are charged by
default. To disable this the trickle-diode-disable flag exists.

If a driver did not support charging and some time later one wants to
add that feature, there is currently no way to do it without breaking
dt backwards compatibility. RTCs on boards without the
trickle-diode-disable flag in their device tree would suddenly charge
their battery/supercap which is a change in behavior.

Change that by introducing aux-voltage-chargeable, not as a flag but as
a uint32 enum allowing to set "do not charge" (0) or "charge" (1). This
dt property is optional, so we can now distinguish these cases.

Care must be taken to support the old behavior for device trees without
aux-voltage-chargeable nonetheless to stay compatible.

Signed-off-by: Bastian Krause <bst@pengutronix.de>
---
Changes since v1:
- fixed dt_binding_check error by adding " |" after "description:"

v1 notes:
In a previous series aux-voltage-chargeable was added as a ds1307 dt
property. Discussions lead to turning that into a generic rtc dt
property:
https://lore.kernel.org/linux-rtc/98fa7181-3ebe-d7c3-cfac-fee841c81e15@pengutronix.de/T/
---
 Documentation/devicetree/bindings/rtc/rtc.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/rtc.yaml b/Documentation/devicetree/bindings/rtc/rtc.yaml
index ee237b2ed66a..6b8a11325691 100644
--- a/Documentation/devicetree/bindings/rtc/rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/rtc.yaml
@@ -17,6 +17,15 @@ properties:
   $nodename:
     pattern: "^rtc(@.*|-[0-9a-f])*$"
 
+  aux-voltage-chargeable:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    description: |
+      Tells whether the battery/supercap of the RTC (if any) is
+      chargeable or not:
+      0: not chargeable
+      1: chargeable
+
   quartz-load-femtofarads:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
@@ -35,6 +44,7 @@ properties:
     description:
       Do not use internal trickle charger diode. Should be given if
       internal trickle charger diode should be disabled.
+    deprecated: true
 
   trickle-resistor-ohms:
     $ref: /schemas/types.yaml#/definitions/uint32
-- 
2.28.0

