Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 374E21755D2
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Mar 2020 09:20:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727335AbgCBITK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 2 Mar 2020 03:19:10 -0500
Received: from inva021.nxp.com ([92.121.34.21]:55258 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727154AbgCBITJ (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 2 Mar 2020 03:19:09 -0500
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 5FE37200F19;
        Mon,  2 Mar 2020 09:19:07 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 66FDC200F07;
        Mon,  2 Mar 2020 09:19:04 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 6A026402A7;
        Mon,  2 Mar 2020 16:19:00 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH] rtc: snvs: Improve Kconfig dependency
Date:   Mon,  2 Mar 2020 16:13:05 +0800
Message-Id: <1583136785-4973-1-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

i.MX SNVS RTC should depend on ARCH_MXC or COMPILE_TEST.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/rtc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 34c8b6c..acaf6f98 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1761,6 +1761,7 @@ config RTC_DRV_MXC_V2
 config RTC_DRV_SNVS
 	tristate "Freescale SNVS RTC support"
 	select REGMAP_MMIO
+	depends on ARCH_MXC || COMPILE_TEST
 	depends on HAS_IOMEM
 	depends on OF
 	help
-- 
2.7.4

