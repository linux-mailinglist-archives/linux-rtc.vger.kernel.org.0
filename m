Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C8442541F7
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Aug 2020 11:23:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728471AbgH0JXP (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 27 Aug 2020 05:23:15 -0400
Received: from inva021.nxp.com ([92.121.34.21]:42866 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728509AbgH0JXM (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 27 Aug 2020 05:23:12 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id BA2D0200B27;
        Thu, 27 Aug 2020 11:23:10 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 9386B20004A;
        Thu, 27 Aug 2020 11:23:07 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 5EE33402D2;
        Thu, 27 Aug 2020 11:23:03 +0200 (CEST)
From:   Qiang Zhao <qiang.zhao@nxp.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        robh+dt@kernel.org
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Zhao Qiang <qiang.zhao@nxp.com>
Subject: [PATCH 3/3] arm64: dts: lx2160a: Add "no-watchdog" property to pcf2127
Date:   Thu, 27 Aug 2020 17:14:41 +0800
Message-Id: <20200827091441.12972-3-qiang.zhao@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200827091441.12972-1-qiang.zhao@nxp.com>
References: <20200827091441.12972-1-qiang.zhao@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Zhao Qiang <qiang.zhao@nxp.com>

pcf2127 on lx2160a are not used as watchdog.

Signed-off-by: Zhao Qiang <qiang.zhao@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
index 2ec43c6..4d14c91 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
@@ -149,6 +149,7 @@
 		reg = <0x51>;
 		// IRQ10_B
 		interrupts = <0 150 0x4>;
+		no-watchdog;
 	};
 };
 
-- 
2.7.4

