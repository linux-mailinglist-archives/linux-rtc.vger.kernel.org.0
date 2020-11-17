Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 057632B7011
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Nov 2020 21:31:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726158AbgKQUaz (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 17 Nov 2020 15:30:55 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:52377 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbgKQUar (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 17 Nov 2020 15:30:47 -0500
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 4C663240005;
        Tue, 17 Nov 2020 20:30:45 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Fabio Estevam <festevam@gmail.com>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: mxc: use of_device_get_match_data
Date:   Tue, 17 Nov 2020 21:30:35 +0100
Message-Id: <20201117203035.1280099-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Use of_device_get_match_data to simplify mxc_rtc_probe.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-mxc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-mxc.c b/drivers/rtc/rtc-mxc.c
index 018bfa952d66..0d253ce3a8f5 100644
--- a/drivers/rtc/rtc-mxc.c
+++ b/drivers/rtc/rtc-mxc.c
@@ -307,14 +307,12 @@ static int mxc_rtc_probe(struct platform_device *pdev)
 	u32 reg;
 	unsigned long rate;
 	int ret;
-	const struct of_device_id *of_id;
 
 	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
 	if (!pdata)
 		return -ENOMEM;
 
-	of_id = of_match_device(imx_rtc_dt_ids, &pdev->dev);
-	pdata->devtype = (enum imx_rtc_type)of_id->data;
+	pdata->devtype = (enum imx_rtc_type)of_device_get_match_data(&pdev->dev);
 
 	pdata->ioaddr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pdata->ioaddr))
-- 
2.28.0

