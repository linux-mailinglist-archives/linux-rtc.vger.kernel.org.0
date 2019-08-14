Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3A208D6E7
	for <lists+linux-rtc@lfdr.de>; Wed, 14 Aug 2019 17:10:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728170AbfHNPKM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 14 Aug 2019 11:10:12 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:42589 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728132AbfHNPKM (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 14 Aug 2019 11:10:12 -0400
X-Originating-IP: 92.137.69.152
Received: from localhost (alyon-656-1-672-152.w92-137.abo.wanadoo.fr [92.137.69.152])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id DCE1E1BF204;
        Wed, 14 Aug 2019 15:10:10 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v2 4/9] rtc: pcf2123: convert to devm_rtc_allocate_device
Date:   Wed, 14 Aug 2019 17:09:57 +0200
Message-Id: <20190814151002.7324-4-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190814151002.7324-1-alexandre.belloni@bootlin.com>
References: <20190814151002.7324-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This allows further improvement of the driver. Also remove the unecessary
error string as the core will already display error messages.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pcf2123.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-pcf2123.c b/drivers/rtc/rtc-pcf2123.c
index 2e2a14134346..7d79180a4292 100644
--- a/drivers/rtc/rtc-pcf2123.c
+++ b/drivers/rtc/rtc-pcf2123.c
@@ -407,17 +407,12 @@ static int pcf2123_probe(struct spi_device *spi)
 			(spi->max_speed_hz + 500) / 1000);
 
 	/* Finalize the initialization */
-	rtc = devm_rtc_device_register(&spi->dev, pcf2123_driver.driver.name,
-			&pcf2123_rtc_ops, THIS_MODULE);
-
-	if (IS_ERR(rtc)) {
-		dev_err(&spi->dev, "failed to register.\n");
+	rtc = devm_rtc_allocate_device(&spi->dev);
+	if (IS_ERR(rtc))
 		return PTR_ERR(rtc);
-	}
 
 	pcf2123->rtc = rtc;
 
-
 	/* Register alarm irq */
 	if (spi->irq > 0) {
 		ret = devm_request_threaded_irq(&spi->dev, spi->irq, NULL,
@@ -434,7 +429,12 @@ static int pcf2123_probe(struct spi_device *spi)
 	 * support to this driver to generate interrupts more than once
 	 * per minute.
 	 */
-	pcf2123->rtc->uie_unsupported = 1;
+	rtc->uie_unsupported = 1;
+	rtc->ops = &pcf2123_rtc_ops;
+
+	ret = rtc_register_device(rtc);
+	if (ret)
+		return ret;
 
 	return 0;
 }
-- 
2.21.0

