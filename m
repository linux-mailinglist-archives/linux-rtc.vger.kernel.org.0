Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 030E02B3D2
	for <lists+linux-rtc@lfdr.de>; Mon, 27 May 2019 14:00:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbfE0MAz (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 27 May 2019 08:00:55 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:54345 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbfE0MAz (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 27 May 2019 08:00:55 -0400
Received: from localhost (aaubervilliers-681-1-27-134.w90-88.abo.wanadoo.fr [90.88.147.134])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 40B5720000F;
        Mon, 27 May 2019 12:00:47 +0000 (UTC)
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rtc@vger.kernel.org
Subject: [PATCH 02/10] dt-bindings: rtc: Add YAML schemas for the generic RTC bindings
Date:   Mon, 27 May 2019 14:00:34 +0200
Message-Id: <3220382f2eb8ba3cda1388882b2f4b53f75414e6.1558958381.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <290402405a34506997fd2fab2c4c1486dbe6b7e5.1558958381.git-series.maxime.ripard@bootlin.com>
References: <290402405a34506997fd2fab2c4c1486dbe6b7e5.1558958381.git-series.maxime.ripard@bootlin.com>
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
index 234bd2af1830..b8d36fce5e2d 100644
--- a/Documentation/devicetree/bindings/rtc/rtc.txt
+++ b/Documentation/devicetree/bindings/rtc/rtc.txt
@@ -1,33 +1 @@
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
-- 
git-series 0.9.1
