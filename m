Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21E25D9B5C
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Oct 2019 22:16:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437073AbfJPUQf (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 16 Oct 2019 16:16:35 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:54765 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732607AbfJPUQe (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 16 Oct 2019 16:16:34 -0400
X-Originating-IP: 86.202.229.42
Received: from localhost (lfbn-lyo-1-146-42.w86-202.abo.wanadoo.fr [86.202.229.42])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id B53851BF205;
        Wed, 16 Oct 2019 20:16:30 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     Tony Prisk <linux@prisktech.co.nz>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 2/5] rtc: vt8500: remove useless label
Date:   Wed, 16 Oct 2019 22:16:23 +0200
Message-Id: <20191016201626.31309-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191016201626.31309-1-alexandre.belloni@bootlin.com>
References: <20191016201626.31309-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

err_return doesn't do anything special, simply return instead of goto.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-vt8500.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-vt8500.c b/drivers/rtc/rtc-vt8500.c
index 11859b95a9f5..f84e534a8793 100644
--- a/drivers/rtc/rtc-vt8500.c
+++ b/drivers/rtc/rtc-vt8500.c
@@ -225,10 +225,9 @@ static int vt8500_rtc_probe(struct platform_device *pdev)
 	vt8500_rtc->rtc = devm_rtc_device_register(&pdev->dev, "vt8500-rtc",
 					      &vt8500_rtc_ops, THIS_MODULE);
 	if (IS_ERR(vt8500_rtc->rtc)) {
-		ret = PTR_ERR(vt8500_rtc->rtc);
 		dev_err(&pdev->dev,
 			"Failed to register RTC device -> %d\n", ret);
-		goto err_return;
+		return PTR_ERR(vt8500_rtc->rtc);
 	}
 
 	ret = devm_request_irq(&pdev->dev, vt8500_rtc->irq_alarm,
@@ -236,13 +235,10 @@ static int vt8500_rtc_probe(struct platform_device *pdev)
 	if (ret < 0) {
 		dev_err(&pdev->dev, "can't get irq %i, err %d\n",
 			vt8500_rtc->irq_alarm, ret);
-		goto err_return;
+		return ret;
 	}
 
 	return 0;
-
-err_return:
-	return ret;
 }
 
 static int vt8500_rtc_remove(struct platform_device *pdev)
-- 
2.21.0

