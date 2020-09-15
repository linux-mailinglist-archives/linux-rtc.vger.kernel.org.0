Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC36D269FF9
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Sep 2020 09:41:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726191AbgIOHlG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 15 Sep 2020 03:41:06 -0400
Received: from inva020.nxp.com ([92.121.34.13]:38166 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726139AbgIOHk7 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 15 Sep 2020 03:40:59 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C0CAB1A0801;
        Tue, 15 Sep 2020 09:40:55 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 9F6F91A07A8;
        Tue, 15 Sep 2020 09:40:51 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 305D84030D;
        Tue, 15 Sep 2020 09:40:46 +0200 (CEST)
From:   Biwen Li <biwen.li@oss.nxp.com>
To:     alexandre.belloni@bootlin.com, leoyang.li@nxp.com,
        shawnguo@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jiafei.pan@nxp.com, linux-rtc@vger.kernel.org,
        Biwen Li <biwen.li@nxp.com>
Subject: [PATCH 5/5] arm64: dts: ls1046a-qds: remove useless property of rtc
Date:   Tue, 15 Sep 2020 15:32:13 +0800
Message-Id: <20200915073213.12779-5-biwen.li@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200915073213.12779-1-biwen.li@oss.nxp.com>
References: <20200915073213.12779-1-biwen.li@oss.nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Biwen Li <biwen.li@nxp.com>

Remove useless property interrupts of rtc

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
index 35fa10a5d594..f13a45bdf4e9 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
@@ -122,8 +122,6 @@
 			rtc@51 {
 				compatible = "nxp,pcf2129";
 				reg = <0x51>;
-				/* IRQ10_B */
-				interrupts = <0 150 0x4>;
 			};
 
 			eeprom@56 {
-- 
2.17.1

