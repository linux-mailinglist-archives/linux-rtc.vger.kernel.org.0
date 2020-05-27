Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F92C1E36AA
	for <lists+linux-rtc@lfdr.de>; Wed, 27 May 2020 05:47:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387423AbgE0Drq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 26 May 2020 23:47:46 -0400
Received: from inva021.nxp.com ([92.121.34.21]:33712 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728293AbgE0Dro (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 26 May 2020 23:47:44 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id CAD1B20035A;
        Wed, 27 May 2020 05:47:40 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 4BB88200448;
        Wed, 27 May 2020 05:47:36 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 58D004024F;
        Wed, 27 May 2020 11:47:30 +0800 (SGT)
From:   Biwen Li <biwen.li@oss.nxp.com>
To:     leoyang.li@nxp.com, robh+dt@kernel.org, mpe@ellerman.id.au,
        benh@kernel.crashing.org, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com
Cc:     devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        Biwen Li <biwen.li@nxp.com>
Subject: [v3 1/2] dts: ppc: t4240rdb: remove interrupts property
Date:   Wed, 27 May 2020 11:42:27 +0800
Message-Id: <20200527034228.23793-1-biwen.li@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Biwen Li <biwen.li@nxp.com>

Since the interrupt pin for RTC DS1374 is not connected
to the CPU on T4240RDB, remove the interrupt property
from the device tree.

This also fix the following warning for hwclock.util-linux:
$ hwclock.util-linux
hwclock.util-linux: select() to /dev/rtc0
to wait for clock tick timed out

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
 arch/powerpc/boot/dts/fsl/t4240rdb.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/boot/dts/fsl/t4240rdb.dts b/arch/powerpc/boot/dts/fsl/t4240rdb.dts
index a56a705d41f7..145896f2eef6 100644
--- a/arch/powerpc/boot/dts/fsl/t4240rdb.dts
+++ b/arch/powerpc/boot/dts/fsl/t4240rdb.dts
@@ -144,7 +144,6 @@
 			rtc@68 {
 				compatible = "dallas,ds1374";
 				reg = <0x68>;
-				interrupts = <0x1 0x1 0 0>;
 			};
 		};
 
-- 
2.17.1

