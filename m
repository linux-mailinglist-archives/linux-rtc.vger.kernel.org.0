Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78342247E95
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Aug 2020 08:43:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726535AbgHRGnk (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 18 Aug 2020 02:43:40 -0400
Received: from inva020.nxp.com ([92.121.34.13]:40264 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726365AbgHRGnj (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 18 Aug 2020 02:43:39 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id DFCE61A00E8;
        Tue, 18 Aug 2020 08:43:37 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 363781A1047;
        Tue, 18 Aug 2020 08:43:35 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 7AC41402AD;
        Tue, 18 Aug 2020 08:43:31 +0200 (CEST)
From:   Ran Wang <ran.wang_1@nxp.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peng Ma <peng.ma@nxp.com>, Ran Wang <ran.wang_1@nxp.com>
Subject: [PATCH] rtc: fsl-ftm-alarm: update acpi device id
Date:   Tue, 18 Aug 2020 14:36:09 +0800
Message-Id: <20200818063609.39859-1-ran.wang_1@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Peng Ma <peng.ma@nxp.com>

Original device id would conflict with crypto driver, change it.

Signed-off-by: Peng Ma <peng.ma@nxp.com>
Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
---
 drivers/rtc/rtc-fsl-ftm-alarm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-fsl-ftm-alarm.c b/drivers/rtc/rtc-fsl-ftm-alarm.c
index 68f0a18..48d3b38 100644
--- a/drivers/rtc/rtc-fsl-ftm-alarm.c
+++ b/drivers/rtc/rtc-fsl-ftm-alarm.c
@@ -3,7 +3,7 @@
  * Freescale FlexTimer Module (FTM) alarm device driver.
  *
  * Copyright 2014 Freescale Semiconductor, Inc.
- * Copyright 2019 NXP
+ * Copyright 2019-2020 NXP
  *
  */
 
@@ -312,7 +312,7 @@ static const struct of_device_id ftm_rtc_match[] = {
 };
 
 static const struct acpi_device_id ftm_imx_acpi_ids[] = {
-	{"NXP0011",},
+	{"NXP0014",},
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, ftm_imx_acpi_ids);
-- 
2.7.4

