Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14DC21DAE97
	for <lists+linux-rtc@lfdr.de>; Wed, 20 May 2020 11:20:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726844AbgETJUp (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 20 May 2020 05:20:45 -0400
Received: from inva021.nxp.com ([92.121.34.21]:38756 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726436AbgETJUo (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 20 May 2020 05:20:44 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 1266A2000DD;
        Wed, 20 May 2020 11:20:43 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 8000E200257;
        Wed, 20 May 2020 11:20:38 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 86800402A6;
        Wed, 20 May 2020 17:20:32 +0800 (SGT)
From:   Biwen Li <biwen.li@oss.nxp.com>
To:     leoyang.li@nxp.com, robh+dt@kernel.org, mpe@ellerman.id.au,
        benh@kernel.crashing.org, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com
Cc:     devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        Biwen Li <biwen.li@nxp.com>
Subject: [v2 2/2] dts: ppc: t1024rdb: remove interrupts property
Date:   Wed, 20 May 2020 17:15:43 +0800
Message-Id: <20200520091543.44692-2-biwen.li@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200520091543.44692-1-biwen.li@oss.nxp.com>
References: <20200520091543.44692-1-biwen.li@oss.nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Biwen Li <biwen.li@nxp.com>

This removes interrupts property to drop warning as follows:
    - $ hwclock.util-linux
      hwclock.util-linux: select() to /dev/rtc0
      to wait for clock tick timed out

My case:
    - RTC ds1339s INT pin isn't connected to cpus INT pin on T1024RDB,
      then the RTC cannot inform cpu about alarm interrupt

How to fix it?
    - remove IRQ line

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
 arch/powerpc/boot/dts/fsl/t1024rdb.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/boot/dts/fsl/t1024rdb.dts b/arch/powerpc/boot/dts/fsl/t1024rdb.dts
index 645caff98ed1..605ceec66af3 100644
--- a/arch/powerpc/boot/dts/fsl/t1024rdb.dts
+++ b/arch/powerpc/boot/dts/fsl/t1024rdb.dts
@@ -161,7 +161,6 @@
 			rtc@68 {
 				compatible = "dallas,ds1339";
 				reg = <0x68>;
-				interrupts = <0x1 0x1 0 0>;
 			};
 		};
 
-- 
2.17.1

