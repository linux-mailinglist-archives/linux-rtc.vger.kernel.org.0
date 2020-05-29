Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C8DC1E75CC
	for <lists+linux-rtc@lfdr.de>; Fri, 29 May 2020 08:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725777AbgE2GP7 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 29 May 2020 02:15:59 -0400
Received: from inva020.nxp.com ([92.121.34.13]:53154 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725833AbgE2GP5 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 29 May 2020 02:15:57 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 805D61A0FC1;
        Fri, 29 May 2020 08:15:54 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 004DE1A00BE;
        Fri, 29 May 2020 08:15:50 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 6767D402A7;
        Fri, 29 May 2020 14:15:44 +0800 (SGT)
From:   Ran Wang <ran.wang_1@nxp.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>, Li Biwen <biwen.li@nxp.com>
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ran Wang <ran.wang_1@nxp.com>
Subject: [PATCH 1/2] dt-bindings: rtc: add wakeup-source for FlexTimer
Date:   Fri, 29 May 2020 14:10:34 +0800
Message-Id: <20200529061035.18912-1-ran.wang_1@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
---
 Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt b/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
index fffac74..d7c482c 100644
--- a/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
+++ b/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
@@ -20,6 +20,7 @@ Required properties:
 Optional properties:
 - big-endian: If the host controller is big-endian mode, specify this property.
   The default endian mode is little-endian.
+- wakeup-source: Enable it as a wakeup source
 
 Example:
 rcpm: rcpm@1e34040 {
@@ -32,5 +33,6 @@ ftm_alarm0: timer@2800000 {
 	compatible = "fsl,ls1088a-ftm-alarm";
 	reg = <0x0 0x2800000 0x0 0x10000>;
 	fsl,rcpm-wakeup = <&rcpm 0x0 0x0 0x0 0x0 0x4000 0x0>;
+	wakeup-source;
 	interrupts = <0 44 4>;
 };
-- 
2.7.4

