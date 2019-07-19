Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73CDC6DEF0
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Jul 2019 06:32:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732370AbfGSEcD (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 19 Jul 2019 00:32:03 -0400
Received: from inva021.nxp.com ([92.121.34.21]:36012 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729286AbfGSEEL (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 19 Jul 2019 00:04:11 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 1E665200072;
        Fri, 19 Jul 2019 06:04:10 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id E16B2200146;
        Fri, 19 Jul 2019 06:04:03 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 28AE5402A9;
        Fri, 19 Jul 2019 12:03:56 +0800 (SGT)
From:   Biwen Li <biwen.li@nxp.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        leoyang.li@nxp.com, robh+dt@kernel.org
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        xiaobo.xie@nxp.com, jiafei.pan@nxp.com, ran.wang_1@nxp.com,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        Biwen Li <biwen.li@nxp.com>
Subject: [v6,2/2] dt-bindings: rtc: add bindings for FlexTimer Module
Date:   Fri, 19 Jul 2019 11:54:00 +0800
Message-Id: <20190719035400.9800-2-biwen.li@nxp.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20190719035400.9800-1-biwen.li@nxp.com>
References: <20190719035400.9800-1-biwen.li@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The patch adds bindings for FlexTimer Module

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
Change in v6:
    - correct subject
    - delete note
    - remove reg property about IP Powerdown exception register

Change in v5:
    - None

Change in v4:
    - add note about dts and kernel options
    - add aliases in example

Change in v3:
	- remove reg-names property
	- correct cells number

Change in v2:
	- replace ls1043a with ls1088a as example
	- add rcpm node and fsl,rcpm-wakeup property

 .../bindings/rtc/rtc-fsl-ftm-alarm.txt        | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt

diff --git a/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt b/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
new file mode 100644
index 000000000000..9291b022ffc7
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
@@ -0,0 +1,41 @@
+Freescale FlexTimer Module (FTM) Alarm
+
+Required properties:
+- compatible : Should be "fsl,<chip>-ftm-alarm", the
+	       supported chips include
+	       "fsl,ls1012a-ftm-alarm"
+	       "fsl,ls1021a-ftm-alarm"
+	       "fsl,ls1028a-ftm-alarm"
+	       "fsl,ls1043a-ftm-alarm"
+	       "fsl,ls1046a-ftm-alarm"
+	       "fsl,ls1088a-ftm-alarm"
+	       "fsl,ls208xa-ftm-alarm"
+- reg : Specifies base physical address and size of the register sets for the
+  FlexTimer Module.
+- interrupts : Should be the FlexTimer Module interrupt.
+- fsl,rcpm-wakeup property and rcpm node : Please refer
+	Documentation/devicetree/bindings/soc/fsl/rcpm.txt
+
+Optional properties:
+- big-endian: If the host controller is big-endian mode, specify this property.
+  The default endian mode is little-endian.
+
+Example:
+aliases {
+	...
+	rtc1 = ftm_alarm0; // Use FlexTimer Module as /dev/rtc1
+	...
+};
+
+rcpm: rcpm@1e34040 {
+	compatible = "fsl,ls1088a-rcpm", "fsl,qoriq-rcpm-2.1+";
+	reg = <0x0 0x1e34040 0x0 0x18>;
+	#fsl,rcpm-wakeup-cells = <6>;
+};
+
+ftm_alarm0: timer@2800000 {
+	compatible = "fsl,ls1088a-ftm-alarm";
+	reg = <0x0 0x2800000 0x0 0x10000>;
+	fsl,rcpm-wakeup = <&rcpm 0x0 0x0 0x0 0x0 0x4000 0x0>;
+	interrupts = <0 44 4>;
+};
-- 
2.17.1

