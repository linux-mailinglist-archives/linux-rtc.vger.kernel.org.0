Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA8DA2541EA
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Aug 2020 11:22:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727897AbgH0JWd (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 27 Aug 2020 05:22:33 -0400
Received: from inva020.nxp.com ([92.121.34.13]:54416 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727772AbgH0JW2 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 27 Aug 2020 05:22:28 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 037431A0C3D;
        Thu, 27 Aug 2020 11:22:27 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id E7E081A0455;
        Thu, 27 Aug 2020 11:22:23 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id B3E99402EB;
        Thu, 27 Aug 2020 11:22:19 +0200 (CEST)
From:   Qiang Zhao <qiang.zhao@nxp.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        robh+dt@kernel.org
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Zhao Qiang <qiang.zhao@nxp.com>
Subject: [PATCH 1/3] dt-bindings: rtc-2127: Add bindings for nxp,rtc-2127.txt
Date:   Thu, 27 Aug 2020 17:14:39 +0800
Message-Id: <20200827091441.12972-1-qiang.zhao@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Zhao Qiang <qiang.zhao@nxp.com>

Add bindings for nxp,rtc-2127

Signed-off-by: Zhao Qiang <qiang.zhao@nxp.com>
---
 Documentation/devicetree/bindings/rtc/nxp,rtc-2127.txt | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/nxp,rtc-2127.txt

diff --git a/Documentation/devicetree/bindings/rtc/nxp,rtc-2127.txt b/Documentation/devicetree/bindings/rtc/nxp,rtc-2127.txt
new file mode 100644
index 0000000..c822e10
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/nxp,rtc-2127.txt
@@ -0,0 +1,18 @@
+NXP PCF2127 SPI Real Time Clock
+
+Required properties:
+- compatible: should be: "nxp,pcf2127"
+                      or "nxp,pcf2129"
+- reg: should be the SPI slave chipselect address
+
+Optional properties:
+- no-watchdog: PCF2127 is not used as watchdog
+
+Example:
+
+pcf2127: rtc@51 {
+	compatible = "nxp,pcf2127";
+	reg = <0x51>;
+	interrupts = <0 150 0x4>;
+	no-watchdog;
+};
-- 
2.7.4

