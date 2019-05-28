Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D1402D048
	for <lists+linux-rtc@lfdr.de>; Tue, 28 May 2019 22:30:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbfE1Uar (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 28 May 2019 16:30:47 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:51355 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726492AbfE1Uar (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 28 May 2019 16:30:47 -0400
X-Originating-IP: 90.89.68.76
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 1CFF640005;
        Tue, 28 May 2019 20:30:42 +0000 (UTC)
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rtc@vger.kernel.org
Subject: [PATCH v2 01/11] dt-bindings: rtc: Add YAML schemas for the generic RTC bindings
Date:   Tue, 28 May 2019 22:30:31 +0200
Message-Id: <434446bc5541d7dfe5823874355c7db8c7e213fa.1559075389.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The real time clocks have a bunch of generic properties that are needed in
a device tree. Add a YAML schemas for those.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 Documentation/devicetree/bindings/rtc/rtc.txt  | 34 +-------------
 Documentation/devicetree/bindings/rtc/rtc.yaml | 50 +++++++++++++++++++-
 2 files changed, 51 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/rtc.txt b/Documentation/devicetree/bindings/rtc/rtc.txt
index a97fc6a9a75e..4d6f81dccc68 100644
--- a/Documentation/devicetree/bindings/rtc/rtc.txt
+++ b/Documentation/devicetree/bindings/rtc/rtc.txt
@@ -1,36 +1,4 @@
-Generic device tree bindings for Real Time Clock devices
-========================================================
-
-This document describes generic bindings which can be used to describe Real Time
-Clock devices in a device tree.
-
-Required properties
--------------------
-
-- compatible : name of RTC device following generic names recommended practice.
-
-For other required properties e.g. to describe register sets,
-clocks, etc. check the binding documentation of the specific driver.
-
-Optional properties
--------------------
-
-- start-year : if provided, the default hardware range supported by the RTC is
-               shifted so the first usable year is the specified one.
-
-The following properties may not be supported by all drivers. However, if a
-driver wants to support one of the below features, it should adapt the bindings
-below.
-- trickle-resistor-ohms :   Selected resistor for trickle charger. Should be given
-                            if trickle charger should be enabled
-- trickle-diode-disable :   Do not use internal trickle charger diode Should be
-                            given if internal trickle charger diode should be
-                            disabled
-- wakeup-source :           Enables wake up of host system on alarm
-- quartz-load-femtofarads : The capacitive load of the quartz(x-tal),
-                            expressed in femto Farad (fF).
-                            The default value shall be listed (if optional),
-                            and likewise all valid values.
+This file has been moved to rtc.yaml.
 
 Trivial RTCs
 ------------
diff --git a/Documentation/devicetree/bindings/rtc/rtc.yaml b/Documentation/devicetree/bindings/rtc/rtc.yaml
new file mode 100644
index 000000000000..ee237b2ed66a
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/rtc.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RTC Generic Binding
+
+maintainers:
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+description: |
+  This document describes generic bindings which can be used to
+  describe Real Time Clock devices in a device tree.
+
+properties:
+  $nodename:
+    pattern: "^rtc(@.*|-[0-9a-f])*$"
+
+  quartz-load-femtofarads:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The capacitive load of the quartz(x-tal), expressed in femto
+      Farad (fF). The default value shall be listed (if optional),
+      and likewise all valid values.
+
+  start-year:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      If provided, the default hardware range supported by the RTC is
+      shifted so the first usable year is the specified one.
+
+  trickle-diode-disable:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Do not use internal trickle charger diode. Should be given if
+      internal trickle charger diode should be disabled.
+
+  trickle-resistor-ohms:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Selected resistor for trickle charger. Should be given
+      if trickle charger should be enabled.
+
+  wakeup-source:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Enables wake up of host system on alarm.
+
+...

base-commit: 531b0a360899269bd99a38ba9852a8ba46852bcd
-- 
git-series 0.9.1
