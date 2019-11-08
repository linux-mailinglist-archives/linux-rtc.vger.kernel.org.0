Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40E23FDBEA
	for <lists+linux-rtc@lfdr.de>; Fri, 15 Nov 2019 12:03:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726983AbfKOLDA (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 15 Nov 2019 06:03:00 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:49821 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726521AbfKOLDA (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 15 Nov 2019 06:03:00 -0500
X-Originating-IP: 90.66.177.178
Received: from localhost (lfbn-1-2888-178.w90-66.abo.wanadoo.fr [90.66.177.178])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 2B7026000A
        for <linux-rtc@vger.kernel.org>; Fri, 15 Nov 2019 11:02:58 +0000 (UTC)
Received: from spool.mail.gandi.net (spool4.mail.gandi.net [217.70.178.213])
        by nmboxes159.sd4.0x35.net (Postfix) with ESMTP id 976DF4192F
        for <alexandre.belloni@bootlin.com>; Fri,  8 Nov 2019 22:41:02 +0000 (UTC)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
        by spool.mail.gandi.net (Postfix) with ESMTPS id 7778B780425
        for <alexandre.belloni@bootlin.com>; Fri,  8 Nov 2019 22:41:02 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 436B91A03DF;
        Fri,  8 Nov 2019 23:41:01 +0100 (CET)
Received: from smtp.na-rdc02.nxp.com (usphx01srsp001v.us-phx01.nxp.com [134.27.49.11])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 0A32A1A03CA;
        Fri,  8 Nov 2019 23:41:01 +0100 (CET)
Received: from right.am.freescale.net (right.am.freescale.net [10.81.116.70])
        by usphx01srsp001v.us-phx01.nxp.com (Postfix) with ESMTP id 2D4F140CB6;
        Fri,  8 Nov 2019 15:41:00 -0700 (MST)
From:   Li Yang <leoyang.li@nxp.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        YueHaibing <yuehaibing@huawei.com>
Cc:     linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-arm-kernel@lists.infradead.org,
        lkml <linux-kernel@vger.kernel.org>, Biwen Li <biwen.li@nxp.com>,
        Li Yang <leoyang.li@nxp.com>
Subject: [PATCH] rtc: fsl-ftm-alarm: remove select FSL_RCPM and default y from Kconfig
Date:   Fri,  8 Nov 2019 16:40:56 -0600
Message-Id: <1573252856-11759-1-git-send-email-leoyang.li@nxp.com>
X-Mailer: git-send-email 1.9.0
X-Virus-Scanned: ClamAV using ClamSMTP
Received-SPF: pass (spool4: domain of nxp.com designates 92.121.34.13 as permitted sender) client-ip=92.121.34.13; envelope-from=leoyang.li@nxp.com; helo=inva020.nxp.com;
X-TUID: Ph8swgQ7LkUY
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The Flextimer alarm is primarily used as a wakeup source for system
power management.  But it shouldn't select the power management driver
as they don't really have dependency of each other.

Also remove the default y as it is not a critical feature for the
systems.

Signed-off-by: Li Yang <leoyang.li@nxp.com>
---
 drivers/rtc/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 1adf9f815652..b33b80243143 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1337,8 +1337,6 @@ config RTC_DRV_IMXDI
 config RTC_DRV_FSL_FTM_ALARM
 	tristate "Freescale FlexTimer alarm timer"
 	depends on ARCH_LAYERSCAPE || SOC_LS1021A
-	select FSL_RCPM
-	default y
 	help
 	   For the FlexTimer in LS1012A, LS1021A, LS1028A, LS1043A, LS1046A,
 	   LS1088A, LS208xA, we can use FTM as the wakeup source.
-- 
2.17.1

