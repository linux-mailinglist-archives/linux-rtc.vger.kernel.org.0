Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B21E2D04D
	for <lists+linux-rtc@lfdr.de>; Tue, 28 May 2019 22:30:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727161AbfE1Ua5 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 28 May 2019 16:30:57 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:49521 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726492AbfE1Ua5 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 28 May 2019 16:30:57 -0400
X-Originating-IP: 90.89.68.76
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 3E831E000C;
        Tue, 28 May 2019 20:30:45 +0000 (UTC)
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rtc@vger.kernel.org
Subject: [PATCH v2 02/11] dt-bindings: rtc: Move trivial RTC over to a schemas of their own
Date:   Tue, 28 May 2019 22:30:32 +0200
Message-Id: <938b66b5c5d3b6b6cf95b39a16884852ed8d19b6.1559075389.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <434446bc5541d7dfe5823874355c7db8c7e213fa.1559075389.git-series.maxime.ripard@bootlin.com>
References: <434446bc5541d7dfe5823874355c7db8c7e213fa.1559075389.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The RTC generic bindings has a bunch of devices that have a pretty simple
binding, with just compatible, reg and optional interrupts properties.

This is exactly what the trivial devices YAML schema has been created for,
except that they can also have the start-year property, but not any other
generic RTC property.

Let's create a schema with those constraints.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

---
Changes from v1:
  - Move from trivial-devices to trivial-rtc
---
 Documentation/devicetree/bindings/rtc/rtc.txt          | 39 +-----
 Documentation/devicetree/bindings/rtc/trivial-rtc.yaml | 92 +++++++++++-
 2 files changed, 92 insertions(+), 39 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/trivial-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/rtc.txt b/Documentation/devicetree/bindings/rtc/rtc.txt
index 4d6f81dccc68..b8d36fce5e2d 100644
--- a/Documentation/devicetree/bindings/rtc/rtc.txt
+++ b/Documentation/devicetree/bindings/rtc/rtc.txt
@@ -1,40 +1 @@
 This file has been moved to rtc.yaml.
-
-Trivial RTCs
-------------
-
-This is a list of trivial RTC devices that have simple device tree
-bindings, consisting only of a compatible field, an address and
-possibly an interrupt line.
-
-
-Compatible		Vendor / Chip
-==========		=============
-abracon,abb5zes3	AB-RTCMC-32.768kHz-B5ZE-S3: Real Time Clock/Calendar Module with I2C Interface
-abracon,abeoz9		AB-RTCMC-32.768kHz-EOZ9: Real Time Clock/Calendar Module with I2C Interface
-dallas,ds1374		I2C, 32-Bit Binary Counter Watchdog RTC with Trickle Charger and Reset Input/Output
-dallas,ds1672		Dallas DS1672 Real-time Clock
-dallas,ds3232		Extremely Accurate I²C RTC with Integrated Crystal and SRAM
-epson,rx8010		I2C-BUS INTERFACE REAL TIME CLOCK MODULE
-epson,rx8571		I2C-BUS INTERFACE REAL TIME CLOCK MODULE with Battery Backed RAM
-epson,rx8581		I2C-BUS INTERFACE REAL TIME CLOCK MODULE
-emmicro,em3027		EM Microelectronic EM3027 Real-time Clock
-isil,isl1208		Intersil ISL1208 Low Power RTC with Battery Backed SRAM
-isil,isl1218		Intersil ISL1218 Low Power RTC with Battery Backed SRAM
-isil,isl12022		Intersil ISL12022 Real-time Clock
-microcrystal,rv3028	Real Time Clock Module with I2C-Bus
-microcrystal,rv3029	Real Time Clock Module with I2C-Bus
-microcrystal,rv8523	Real Time Clock
-nxp,pcf2127		Real-time clock
-nxp,pcf2129		Real-time clock
-nxp,pcf8563		Real-time clock/calendar
-pericom,pt7c4338	Real-time Clock Module
-ricoh,r2025sd		I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
-ricoh,r2221tl		I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
-ricoh,rs5c372a		I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
-ricoh,rs5c372b		I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
-ricoh,rv5c386		I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
-ricoh,rv5c387a		I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
-sii,s35390a		2-wire CMOS real-time clock
-whwave,sd3078		I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
-xircom,x1205		Xircom X1205 I2C RTC
diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
new file mode 100644
index 000000000000..0c12ce9a9b45
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Trivial RTCs
+
+maintainers:
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+description: |
+  This is a list of trivial RTC devices that have simple device tree
+  bindings, consisting only of a compatible field, an address and
+  possibly an interrupt line.
+
+allOf:
+  - $ref: "rtc.yaml#"
+
+properties:
+  compatible:
+    enum:
+      # AB-RTCMC-32.768kHz-B5ZE-S3: Real Time Clock/Calendar Module with I2C Interface
+      - abracon,abb5zes3
+      # AB-RTCMC-32.768kHz-EOZ9: Real Time Clock/Calendar Module with I2C Interface
+      - abracon,abeoz9
+      # I2C, 32-Bit Binary Counter Watchdog RTC with Trickle Charger and Reset Input/Output
+      - dallas,ds1374
+      # Dallas DS1672 Real-time Clock
+      - dallas,ds1672
+      # Extremely Accurate I²C RTC with Integrated Crystal and SRAM
+      - dallas,ds3232
+      # I2C-BUS INTERFACE REAL TIME CLOCK MODULE
+      - epson,rx8010
+      # I2C-BUS INTERFACE REAL TIME CLOCK MODULE with Battery Backed RAM
+      - epson,rx8571
+      # I2C-BUS INTERFACE REAL TIME CLOCK MODULE
+      - epson,rx8581
+      # Intersil ISL1208 Low Power RTC with Battery Backed SRAM
+      - isil,isl1208
+      # Intersil ISL1218 Low Power RTC with Battery Backed SRAM
+      - isil,isl1218
+      # Intersil ISL12022 Real-time Clock
+      - isil,isl12022
+      # Real Time Clock Module with I2C-Bus
+      - microcrystal,rv3028
+      # Real Time Clock Module with I2C-Bus
+      - microcrystal,rv3029
+      # Real Time Clock
+      - microcrystal,rv8523
+      # Real-time clock
+      - nxp,pcf2127
+      # Real-time clock
+      - nxp,pcf2129
+      # Real-time clock/calendar
+      - nxp,pcf8563
+      # Real-time Clock Module
+      - pericom,pt7c4338
+      # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
+      - ricoh,r2025sd
+      # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
+      - ricoh,r2221tl
+      # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
+      - ricoh,rs5c372a
+      # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
+      - ricoh,rs5c372b
+      # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
+      - ricoh,rv5c386
+      # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
+      - ricoh,rv5c387a
+      # 2-wire CMOS real-time clock
+      - sii,s35390a
+      # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
+      - whwave,sd3078
+      # Xircom X1205 I2C RTC
+      - xircom,x1205
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  start-year: true
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+...
-- 
git-series 0.9.1
