Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5ADA76B81C
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jul 2019 10:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725948AbfGQIXc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 17 Jul 2019 04:23:32 -0400
Received: from inva020.nxp.com ([92.121.34.13]:47910 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725912AbfGQIXc (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 17 Jul 2019 04:23:32 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C20EF1A00A0;
        Wed, 17 Jul 2019 10:23:30 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 5D7E81A0085;
        Wed, 17 Jul 2019 10:23:25 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 7A458402C3;
        Wed, 17 Jul 2019 16:23:18 +0800 (SGT)
From:   Anson.Huang@nxp.com
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-rtc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH] rtc: imxdi: use devm_platform_ioremap_resource() to simplify code
Date:   Wed, 17 Jul 2019 16:14:11 +0800
Message-Id: <20190717081411.30622-1-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.9.5
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

Use the new helper devm_platform_ioremap_resource() which wraps the
platform_get_resource() and devm_ioremap_resource() together, to
simplify the code.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/rtc/rtc-imxdi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-imxdi.c b/drivers/rtc/rtc-imxdi.c
index 3f3d652..f21dc6b 100644
--- a/drivers/rtc/rtc-imxdi.c
+++ b/drivers/rtc/rtc-imxdi.c
@@ -740,7 +740,6 @@ static void dryice_work(struct work_struct *work)
  */
 static int __init dryice_rtc_probe(struct platform_device *pdev)
 {
-	struct resource *res;
 	struct imxdi_dev *imxdi;
 	int norm_irq, sec_irq;
 	int rc;
@@ -751,8 +750,7 @@ static int __init dryice_rtc_probe(struct platform_device *pdev)
 
 	imxdi->pdev = pdev;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	imxdi->ioaddr = devm_ioremap_resource(&pdev->dev, res);
+	imxdi->ioaddr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(imxdi->ioaddr))
 		return PTR_ERR(imxdi->ioaddr);
 
-- 
2.7.4

