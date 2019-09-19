Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 209BFB7153
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Sep 2019 03:56:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387851AbfISB4S (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 18 Sep 2019 21:56:18 -0400
Received: from inva021.nxp.com ([92.121.34.21]:52356 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387690AbfISB4R (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 18 Sep 2019 21:56:17 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id D2EAA20016B;
        Thu, 19 Sep 2019 03:56:14 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 824A4200019;
        Thu, 19 Sep 2019 03:56:09 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 7C7A9402CA;
        Thu, 19 Sep 2019 09:56:03 +0800 (SGT)
From:   Biwen Li <biwen.li@nxp.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        robh+dt@kernel.org, mark.rutland@arm.com, leoyang.li@nxp.com
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Biwen Li <biwen.li@nxp.com>,
        Martin Fuzzey <mfuzzey@parkeon.com>
Subject: [v5,1/2] dt-bindings: rtc: pcf85263/pcf85363: add some properties
Date:   Thu, 19 Sep 2019 09:45:19 +0800
Message-Id: <20190919014520.15500-1-biwen.li@nxp.com>
X-Mailer: git-send-email 2.9.5
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Add some properties for pcf85263/pcf85363 as follows:
  - nxp,rtc-interrupt-type: integer type
  - nxp,rtc-interrupt-output-pin: string type
  - quartz-load-femtofarads: integer type
  - quartz-drive-strength-ohms: integer type
  - nxp,quartz-low-jitter: bool type
  - wakeup-source: bool type

Signed-off-by: Martin Fuzzey <mfuzzey@parkeon.com>
Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
Change in v5:
	- Replace nxp,quartz-drive-strength with
	  quartz-drive-strength-ohms
	- Select ohm unit for quartz drive strength

Change in v4:
	- Drop robust defines in include/dt-bindings/rtc/pcf85363.h
	- Add nxp,rtc-interrupt-type property
	- Replace interrupt-output-pin with nxp,rtc-interrupt-output-pin

Change in v3:
	- None

Change in v2:
	- Replace properties name
	  quartz-load-capacitance -> quartz-load-femtofarads
	  quartz-drive-strength -> nxp,quartz-drive-strength
	  quartz-low-jitter -> nxp,quartz-low-jitter
	- Replace drive strength name
	  PCF85263_QUARTZDRIVE_NORMAL -> PCF85263_QUARTZDRIVE_100ko
	  PCF85263_QUARTZDRIVE_LOW -> PCF85263_QUARTZDRIVE_60ko
	  PCF85263_QUARTZDRIVE_HIGH -> PCF85263_QUARTZDRIVE_500ko
	- Set default interrupt-output-pin as "INTA"

 .../devicetree/bindings/rtc/pcf85363.txt      | 44 ++++++++++++++++++-
 include/dt-bindings/rtc/pcf85363.h            | 14 ++++++
 2 files changed, 57 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/rtc/pcf85363.h

diff --git a/Documentation/devicetree/bindings/rtc/pcf85363.txt b/Documentation/devicetree/bindings/rtc/pcf85363.txt
index 94adc1cf93d9..7f907581d5db 100644
--- a/Documentation/devicetree/bindings/rtc/pcf85363.txt
+++ b/Documentation/devicetree/bindings/rtc/pcf85363.txt
@@ -8,10 +8,52 @@ Required properties:
 Optional properties:
 - interrupts: IRQ line for the RTC (not implemented).
 
+- nxp,rtc-interrupt-type: integer property, represent the interrupt's
+  type. Valid values are
+  INT_PIE(periodic interrupt enable),
+  INT_OIE(offset correction interrupt enable),
+  INT_A1IE(alarm1 interrupt enable),
+  INT_A2IE(alarm2 interrupt enable),
+  INT_TSRIE(timestamp register interrupt enable)
+  INT_BSIE(battery switch interrupt enable),
+  INT_WDIE(WatchDog interrupt enable,and
+  compose these values such as: INT_A1IE | INT_A2IE,
+  but currently only support INT_A1IE, default value is INT_A1IE.
+  The property and property nxp,rtc-interrupt-output-pin
+  work together to generate some interrupts on some pins.
+
+- nxp,rtc-interrupt-output-pin: The interrupt output pin must be
+  "INTA" or "INTB", default value is "INTA". The property and property
+  nxp,rtc-interrupt-type work together to generate some interrupts on
+  some pins.
+
+- quartz-load-femtofarads: The internal capacitor to select for the quartz,
+  expressed in femto Farad (fF). Valid values are 6000, 7000 and 12500.
+  Default value is 12500fF.
+
+- quartz-drive-strength-ohms: Drive strength for the quartz,
+  expressed in ohm, Valid values are 60000, 100000 and 500000.
+  Default value is 100000 ohm.
+
+- nxp,quartz-low-jitter: Boolean property, if present enables low jitter mode
+  which reduces jitter at the cost of increased power consumption.
+
+- wakeup-source: Boolean property, Please refer to
+  Documentation/devicetree/bindings/power/wakeup-source.txt
+
 Example:
 
 pcf85363: pcf85363@51 {
 	compatible = "nxp,pcf85363";
 	reg = <0x51>;
-};
 
+	interrupt-parent = <&gpio1>;
+	interrupts = <18 IRQ_TYPE_EDGE_FALLING>;
+
+	wakeup-source;
+	nxp,rtc-interrupt-output-pin = "INTA";
+	nxp,rtc-interrupt-type = <INT_A1IE>;
+	quartz-load-femtofarads = <12500>;
+	quartz-drive-strength-ohms = <60000>;
+	nxp,quartz-low-jitter;
+};
diff --git a/include/dt-bindings/rtc/pcf85363.h b/include/dt-bindings/rtc/pcf85363.h
new file mode 100644
index 000000000000..6340bf2da8f5
--- /dev/null
+++ b/include/dt-bindings/rtc/pcf85363.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _DT_BINDINGS_RTC_PCF85363_H
+#define _DT_BINDINGS_RTC_PCF85363_H
+
+/* Interrupt type */
+#define INT_WDIE	(1 << 0)
+#define INT_BSIE	(1 << 1)
+#define INT_TSRIE	(1 << 2)
+#define INT_A2IE	(1 << 3)
+#define INT_A1IE	(1 << 4)
+#define INT_OIE		(1 << 5)
+#define INT_PIE		(1 << 6)
+
+#endif /* _DT_BINDINGS_RTC_PCF85363_H */
-- 
2.17.1

