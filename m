Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F36CDDAFB
	for <lists+linux-rtc@lfdr.de>; Sat, 19 Oct 2019 22:49:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726136AbfJSUtt (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 19 Oct 2019 16:49:49 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:58351 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbfJSUtt (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 19 Oct 2019 16:49:49 -0400
X-Originating-IP: 86.202.229.42
Received: from localhost (lfbn-lyo-1-146-42.w86-202.abo.wanadoo.fr [86.202.229.42])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 854181C0009;
        Sat, 19 Oct 2019 20:49:47 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 9/9] rtc: ds1343: cleanup .remove
Date:   Sat, 19 Oct 2019 22:49:41 +0200
Message-Id: <20191019204941.6203-9-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191019204941.6203-1-alexandre.belloni@bootlin.com>
References: <20191019204941.6203-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

It is not necessary to call device_init_wakeup(dev, false) in .remove as
device_del will take care of that. It is also not necessary to
devm_free_irq. Finally, dev_pm_clear_wake_irq can be called
unconditionally.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-ds1343.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/rtc/rtc-ds1343.c b/drivers/rtc/rtc-ds1343.c
index 3e2957983703..73513688f6f7 100644
--- a/drivers/rtc/rtc-ds1343.c
+++ b/drivers/rtc/rtc-ds1343.c
@@ -437,15 +437,7 @@ static int ds1343_probe(struct spi_device *spi)
 
 static int ds1343_remove(struct spi_device *spi)
 {
-	struct ds1343_priv *priv = spi_get_drvdata(spi);
-
-	if (spi->irq) {
-		dev_pm_clear_wake_irq(&spi->dev);
-		device_init_wakeup(&spi->dev, false);
-		devm_free_irq(&spi->dev, spi->irq, priv);
-	}
-
-	spi_set_drvdata(spi, NULL);
+	dev_pm_clear_wake_irq(&spi->dev);
 
 	return 0;
 }
-- 
2.21.0

