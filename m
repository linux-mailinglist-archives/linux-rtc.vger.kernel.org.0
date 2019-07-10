Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BCF3645A5
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Jul 2019 13:13:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727110AbfGJLNu (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 10 Jul 2019 07:13:50 -0400
Received: from inva021.nxp.com ([92.121.34.21]:33052 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725956AbfGJLNu (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 10 Jul 2019 07:13:50 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 0D804200707;
        Wed, 10 Jul 2019 13:13:48 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 36D682006FF;
        Wed, 10 Jul 2019 13:13:43 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 0C92E402DB;
        Wed, 10 Jul 2019 19:13:36 +0800 (SGT)
From:   Biwen Li <biwen.li@nxp.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        leoyang.li@nxp.com
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        xiaobo.xie@nxp.com, jiafei.pan@nxp.com, ran.wang_1@nxp.com,
        Biwen Li <biwen.li@nxp.com>
Subject: [v2,2/2] Documentation: dt: binding: rtc: add binding for ftm alarm driver
Date:   Wed, 10 Jul 2019 19:04:24 +0800
Message-Id: <20190710110424.4254-2-biwen.li@nxp.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20190710110424.4254-1-biwen.li@nxp.com>
References: <20190710110424.4254-1-biwen.li@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The patch adds binding for ftm alarm driver

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
Change in v2:
    - replace ls1043a with ls1088a as example
    - add rcpm node and fsl,rcpm-wakeup property

 .../devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt  | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt

diff --git a/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt b/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
new file mode 100644
index 0000000..010984a
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
@@ -0,0 +1,40 @@
+Freescale FlexTimer Module (FTM) Alarm
+
+Note: The driver need work with RCPM driver to wake up system in sleep.
+
+Required properties:
+
+- compatible : Should be "fsl,ftm-alarm" or "fsl,<chip>-ftm-alarm", the
+	       supported chips include
+	       "fsl,ls1012a-ftm-alarm"
+	       "fsl,ls1021a-ftm-alarm"
+	       "fsl,ls1028a-ftm-alarm"
+	       "fsl,ls1043a-ftm-alarm"
+	       "fsl,ls1046a-ftm-alarm"
+	       "fsl,ls1088a-ftm-alarm"
+	       "fsl,ls208xa-ftm-alarm"
+- reg : Specifies base physical address and size of the register sets for the
+  FlexTimer Module and base physical address of IP Powerdown Exception Control
+  Register.
+- reg-names: names of the mapped memory regions listed in regs property.
+  should include the following entries:
+  "ftm":    Address of the register sets for FlexTimer Module
+- interrupts : Should be the FlexTimer Module interrupt.
+- fsl,rcpm-wakeup property and rcpm node : Please refer
+	Documentation/devicetree/bindings/soc/fsl/rcpm.txt
+- big-endian: If the host controller is big-endian mode, specify this property.
+  The default endian mode is little-endian.
+
+Example:
+rcpm: rcpm@1e34050 {
+	compatible = "fsl,ls1088a-rcpm", "fsl,qoriq-rcpm-2.1+";
+	reg = <0x0 0x1e34050 0x0 0x4>;
+	fsl,#rcpm-wakeup-cells = <1>;
+}
+
+ftm_alarm0: timer@2800000 {
+	compatible = "fsl,ftm-alarm";
+	reg = <0x0 0x2800000 0x0 0x10000>;
+	fsl,rcpm-wakeup = <&rcpm 0x0 0x4000>;
+	interrupts = <0 44 4>;
+}
-- 
2.7.4

