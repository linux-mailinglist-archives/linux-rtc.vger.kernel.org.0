Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C77A21CA2F6
	for <lists+linux-rtc@lfdr.de>; Fri,  8 May 2020 07:54:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbgEHFyJ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 8 May 2020 01:54:09 -0400
Received: from inva020.nxp.com ([92.121.34.13]:50702 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725896AbgEHFyJ (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 8 May 2020 01:54:09 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B4BDA1A1312;
        Fri,  8 May 2020 07:54:07 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 2947D1A13CA;
        Fri,  8 May 2020 07:54:03 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 36EF1402DB;
        Fri,  8 May 2020 13:53:57 +0800 (SGT)
From:   Biwen Li <biwen.li@oss.nxp.com>
To:     leoyang.li@nxp.com, robh+dt@kernel.org, mpe@ellerman.id.au,
        benh@kernel.crashing.org, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com
Cc:     devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        Biwen Li <biwen.li@nxp.com>
Subject: [PATCH 2/3] dts: ppc: t4240rdb: add uie_unsupported property to drop warning
Date:   Fri,  8 May 2020 13:49:24 +0800
Message-Id: <20200508054925.48237-2-biwen.li@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200508054925.48237-1-biwen.li@oss.nxp.com>
References: <20200508054925.48237-1-biwen.li@oss.nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Biwen Li <biwen.li@nxp.com>

This adds uie_unsupported property to drop warning as follows:
    - $ hwclock.util-linux
      hwclock.util-linux: select() to /dev/rtc0
      to wait for clock tick timed out

My case:
    - RTC ds1374's INT pin is connected to VCC on T4240RDB,
      then the RTC cannot inform cpu about the alarm interrupt

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
 arch/powerpc/boot/dts/fsl/t4240rdb.dts | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/boot/dts/fsl/t4240rdb.dts b/arch/powerpc/boot/dts/fsl/t4240rdb.dts
index a56a705d41f7..ccdd10202e56 100644
--- a/arch/powerpc/boot/dts/fsl/t4240rdb.dts
+++ b/arch/powerpc/boot/dts/fsl/t4240rdb.dts
@@ -144,7 +144,11 @@
 			rtc@68 {
 				compatible = "dallas,ds1374";
 				reg = <0x68>;
-				interrupts = <0x1 0x1 0 0>;
+				// The ds1374's INT pin isn't
+				// connected to cpu's INT pin,
+				// so the rtc cannot synchronize
+				// clock tick per second.
+				uie_unsupported;
 			};
 		};
 
-- 
2.17.1

