Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03FB9A6168
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Sep 2019 08:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726844AbfICG3H (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 3 Sep 2019 02:29:07 -0400
Received: from inva020.nxp.com ([92.121.34.13]:46958 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726053AbfICG3H (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 3 Sep 2019 02:29:07 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 0FC0B1A02B3;
        Tue,  3 Sep 2019 08:29:04 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 764581A0050;
        Tue,  3 Sep 2019 08:28:59 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 8A3D9402B7;
        Tue,  3 Sep 2019 14:28:53 +0800 (SGT)
From:   Biwen Li <biwen.li@nxp.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        robh+dt@kernel.org, mark.rutland@arm.com, leoyang.li@nxp.com
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Biwen Li <biwen.li@nxp.com>,
        Martin Fuzzey <mfuzzey@parkeon.com>
Subject: [v3,1/2] dt-bindings: rtc: pcf85263/pcf85363: add some properties
Date:   Tue,  3 Sep 2019 14:18:52 +0800
Message-Id: <20190903061853.19793-1-biwen.li@nxp.com>
X-Mailer: git-send-email 2.9.5
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Add some properties for pcf85263/pcf85363 as follows:
  - interrupt-output-pin: string type
  - quartz-load-femtofarads: integer type
  - nxp,quartz-drive-strength: integer type
  - nxp,quartz-low-jitter: bool type
  - wakeup-source: bool type

Signed-off-by: Martin Fuzzey <mfuzzey@parkeon.com>
Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
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

 .../devicetree/bindings/rtc/pcf85363.txt      | 29 +++++++++++++++++++
 include/dt-bindings/rtc/pcf85363.h            | 15 ++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 include/dt-bindings/rtc/pcf85363.h

diff --git a/Documentation/devicetree/bindings/rtc/pcf85363.txt b/Documentation/devicetree/bindings/rtc/pcf85363.txt
index 94adc1cf93d9..588f688b30d1 100644
--- a/Documentation/devicetree/bindings/rtc/pcf85363.txt
+++ b/Documentation/devicetree/bindings/rtc/pcf85363.txt
@@ -8,10 +8,39 @@ Required properties:
 Optional properties:
 - interrupts: IRQ line for the RTC (not implemented).
 
+- interrupt-output-pin: The interrupt output pin must be
+  "INTA" or "INTB", default value is "INTA"
+
+- quartz-load-femtofarads: The internal capacitor to select for the quartz:
+	PCF85263_QUARTZCAP_7pF		[0]
+	PCF85263_QUARTZCAP_6pF		[1]
+	PCF85263_QUARTZCAP_12p5pF	[2] DEFAULT
+
+- nxp,quartz-drive-strength: Drive strength for the quartz:
+	PCF85263_QUARTZDRIVE_100ko	[0] DEFAULT
+	PCF85263_QUARTZDRIVE_60ko	[1]
+	PCF85263_QUARTZDRIVE_500ko	[2]
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
+
+	interrupt-parent = <&gpio1>;
+	interrupts = <18 IRQ_TYPE_EDGE_FALLING>;
+
+	#include <dt-bindings/rtc/pcf85363.h>
+	wakeup-source;
+	interrupt-output-pin = "INTA";
+	quartz-load-femtofarads = <PCF85363_QUARTZCAP_12p5pF>;
+	nxp,quartz-drive-strength = <PCF85363_QUARTZDRIVE_60ko>;
+	nxp,quartz-low-jitter;
 };
 
diff --git a/include/dt-bindings/rtc/pcf85363.h b/include/dt-bindings/rtc/pcf85363.h
new file mode 100644
index 000000000000..f71b151bc481
--- /dev/null
+++ b/include/dt-bindings/rtc/pcf85363.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _DT_BINDINGS_RTC_PCF85363_H
+#define _DT_BINDINGS_RTC_PCF85363_H
+
+/* Quartz capacitance */
+#define PCF85363_QUARTZCAP_7pF		0
+#define PCF85363_QUARTZCAP_6pF		1
+#define PCF85363_QUARTZCAP_12p5pF	2
+
+/* Quartz drive strength */
+#define PCF85363_QUARTZDRIVE_100ko	0
+#define PCF85363_QUARTZDRIVE_60ko	1
+#define PCF85363_QUARTZDRIVE_500ko	2
+
+#endif /* _DT_BINDINGS_RTC_PCF85363_H */
-- 
2.17.1

