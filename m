Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9D6D18572C
	for <lists+linux-rtc@lfdr.de>; Sun, 15 Mar 2020 02:32:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbgCOBcd (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 14 Mar 2020 21:32:33 -0400
Received: from inva020.nxp.com ([92.121.34.13]:60934 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725962AbgCOBcd (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sat, 14 Mar 2020 21:32:33 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id ABDD61A015F;
        Sun, 15 Mar 2020 01:54:20 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id ACE841A0170;
        Sun, 15 Mar 2020 01:54:17 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 27880402B1;
        Sun, 15 Mar 2020 08:54:14 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH] rtc: snvs: remove redundant error message
Date:   Sun, 15 Mar 2020 08:47:44 +0800
Message-Id: <1584233264-26025-1-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The RTC core already has error message for registration failure,
no need to have error message in the driver again.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/rtc/rtc-snvs.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/rtc/rtc-snvs.c b/drivers/rtc/rtc-snvs.c
index 319ed1d..36f4961 100644
--- a/drivers/rtc/rtc-snvs.c
+++ b/drivers/rtc/rtc-snvs.c
@@ -354,8 +354,6 @@ static int snvs_rtc_probe(struct platform_device *pdev)
 	data->rtc->ops = &snvs_rtc_ops;
 	data->rtc->range_max = U32_MAX;
 	ret = rtc_register_device(data->rtc);
-	if (ret)
-		dev_err(&pdev->dev, "failed to register rtc: %d\n", ret);
 
 	return ret;
 }
-- 
2.7.4

