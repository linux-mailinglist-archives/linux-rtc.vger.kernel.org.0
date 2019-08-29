Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3677FA28E4
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2019 23:26:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727926AbfH2V0L (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 29 Aug 2019 17:26:11 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:45881 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726944AbfH2VZ6 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 29 Aug 2019 17:25:58 -0400
X-Originating-IP: 90.65.161.137
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 3873C1C0004;
        Thu, 29 Aug 2019 21:25:57 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 3/5] rtc: pcf8563: convert to devm_rtc_allocate_device
Date:   Thu, 29 Aug 2019 23:25:45 +0200
Message-Id: <20190829212547.19185-3-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829212547.19185-1-alexandre.belloni@bootlin.com>
References: <20190829212547.19185-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This allows further improvement of the driver.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pcf8563.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-pcf8563.c b/drivers/rtc/rtc-pcf8563.c
index 1b452da75eb8..0e375e19c149 100644
--- a/drivers/rtc/rtc-pcf8563.c
+++ b/drivers/rtc/rtc-pcf8563.c
@@ -591,13 +591,14 @@ static int pcf8563_probe(struct i2c_client *client,
 		return err;
 	}
 
-	pcf8563->rtc = devm_rtc_device_register(&client->dev,
-				pcf8563_driver.driver.name,
-				&pcf8563_rtc_ops, THIS_MODULE);
-
+	pcf8563->rtc = devm_rtc_allocate_device(&client->dev);
 	if (IS_ERR(pcf8563->rtc))
 		return PTR_ERR(pcf8563->rtc);
 
+	pcf8563->rtc->ops = &pcf8563_rtc_ops;
+	/* the pcf8563 alarm only supports a minute accuracy */
+	pcf8563->rtc->uie_unsupported = 1;
+
 	if (client->irq > 0) {
 		err = devm_request_threaded_irq(&client->dev, client->irq,
 				NULL, pcf8563_irq,
@@ -608,17 +609,17 @@ static int pcf8563_probe(struct i2c_client *client,
 								client->irq);
 			return err;
 		}
-
 	}
 
+	err = rtc_register_device(pcf8563->rtc);
+	if (err)
+		return err;
+
 #ifdef CONFIG_COMMON_CLK
 	/* register clk in common clk framework */
 	pcf8563_clkout_register_clk(pcf8563);
 #endif
 
-	/* the pcf8563 alarm only supports a minute accuracy */
-	pcf8563->rtc->uie_unsupported = 1;
-
 	return 0;
 }
 
-- 
2.21.0

