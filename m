Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47ECB269FFA
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Sep 2020 09:41:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726200AbgIOHlL (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 15 Sep 2020 03:41:11 -0400
Received: from inva021.nxp.com ([92.121.34.21]:47004 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726174AbgIOHk7 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 15 Sep 2020 03:40:59 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 9F317200513;
        Tue, 15 Sep 2020 09:40:54 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 8B7D5200705;
        Tue, 15 Sep 2020 09:40:50 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 1CC034029A;
        Tue, 15 Sep 2020 09:40:45 +0200 (CEST)
From:   Biwen Li <biwen.li@oss.nxp.com>
To:     alexandre.belloni@bootlin.com, leoyang.li@nxp.com,
        shawnguo@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jiafei.pan@nxp.com, linux-rtc@vger.kernel.org,
        Biwen Li <biwen.li@nxp.com>
Subject: [PATCH 4/5] arm64: dts : ls1088a-qds: remove useless property of rtc
Date:   Tue, 15 Sep 2020 15:32:12 +0800
Message-Id: <20200915073213.12779-4-biwen.li@oss.nxp.com>
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
 arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dts
index 5b2699fe4e5d..329a9428ae8b 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dts
@@ -90,8 +90,6 @@
 			rtc@51 {
 				compatible = "nxp,pcf2129";
 				reg = <0x51>;
-				/* IRQ10_B */
-				interrupts = <0 150 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
 			eeprom@56 {
-- 
2.17.1

