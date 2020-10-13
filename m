Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2215928D06D
	for <lists+linux-rtc@lfdr.de>; Tue, 13 Oct 2020 16:41:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388849AbgJMOlZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 13 Oct 2020 10:41:25 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:52763 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388821AbgJMOlY (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 13 Oct 2020 10:41:24 -0400
X-Originating-IP: 90.65.88.165
Received: from localhost (lfbn-lyo-1-1908-165.w90-65.abo.wanadoo.fr [90.65.88.165])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 4E3BA1C0003;
        Tue, 13 Oct 2020 14:41:22 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: rtc: add trickle-voltage-millivolt
Date:   Tue, 13 Oct 2020 16:41:08 +0200
Message-Id: <20201013144110.1942218-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Some RTCs have a trickle charge that is able to output different voltages
depending on the type of the connected auxiliary power (battery, supercap,
...). Add a property allowing to specify the necessary voltage.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---

changes in v3:
 - actually use -millivolt instead of -mV

 Documentation/devicetree/bindings/rtc/rtc.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/rtc.yaml b/Documentation/devicetree/bindings/rtc/rtc.yaml
index ee237b2ed66a..538f3f9b29a2 100644
--- a/Documentation/devicetree/bindings/rtc/rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/rtc.yaml
@@ -42,6 +42,12 @@ properties:
       Selected resistor for trickle charger. Should be given
       if trickle charger should be enabled.
 
+  trickle-voltage-millivolt:
+    description:
+      Selected voltage for trickle charger. Should be given
+      if trickle charger should be enabled and the trickle voltage is different
+      from the RTC main power supply.
+
   wakeup-source:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
-- 
2.26.2

