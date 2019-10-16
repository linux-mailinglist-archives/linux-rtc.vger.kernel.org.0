Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9035BD9B5F
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Oct 2019 22:16:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732607AbfJPUQg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 16 Oct 2019 16:16:36 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:34417 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437071AbfJPUQf (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 16 Oct 2019 16:16:35 -0400
X-Originating-IP: 86.202.229.42
Received: from localhost (lfbn-lyo-1-146-42.w86-202.abo.wanadoo.fr [86.202.229.42])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 1569E1BF207;
        Wed, 16 Oct 2019 20:16:34 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     Tony Prisk <linux@prisktech.co.nz>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 4/5] rtc: vt8500: convert to devm_rtc_allocate_device
Date:   Wed, 16 Oct 2019 22:16:25 +0200
Message-Id: <20191016201626.31309-4-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191016201626.31309-1-alexandre.belloni@bootlin.com>
References: <20191016201626.31309-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This allows further improvement of the driver.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-vt8500.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-vt8500.c b/drivers/rtc/rtc-vt8500.c
index c2ab394912bb..0761478861f8 100644
--- a/drivers/rtc/rtc-vt8500.c
+++ b/drivers/rtc/rtc-vt8500.c
@@ -222,11 +222,12 @@ static int vt8500_rtc_probe(struct platform_device *pdev)
 	writel(VT8500_RTC_CR_ENABLE,
 	       vt8500_rtc->regbase + VT8500_RTC_CR);
 
-	vt8500_rtc->rtc = devm_rtc_device_register(&pdev->dev, "vt8500-rtc",
-					      &vt8500_rtc_ops, THIS_MODULE);
+	vt8500_rtc->rtc = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(vt8500_rtc->rtc))
 		return PTR_ERR(vt8500_rtc->rtc);
 
+	vt8500_rtc->rtc->ops = &vt8500_rtc_ops;
+
 	ret = devm_request_irq(&pdev->dev, vt8500_rtc->irq_alarm,
 				vt8500_rtc_irq, 0, "rtc alarm", vt8500_rtc);
 	if (ret < 0) {
@@ -235,7 +236,7 @@ static int vt8500_rtc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	return 0;
+	return rtc_register_device(vt8500_rtc->rtc);
 }
 
 static int vt8500_rtc_remove(struct platform_device *pdev)
-- 
2.21.0

