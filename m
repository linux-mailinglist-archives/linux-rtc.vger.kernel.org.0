Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9538728F943
	for <lists+linux-rtc@lfdr.de>; Thu, 15 Oct 2020 21:11:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729760AbgJOTLo (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 15 Oct 2020 15:11:44 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:37935 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730186AbgJOTLo (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 15 Oct 2020 15:11:44 -0400
X-Originating-IP: 90.65.88.165
Received: from localhost (lfbn-lyo-1-1908-165.w90-65.abo.wanadoo.fr [90.65.88.165])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id EB7091BF203;
        Thu, 15 Oct 2020 19:11:41 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] rtc: r9701: stop setting a default time
Date:   Thu, 15 Oct 2020 21:11:31 +0200
Message-Id: <20201015191135.471249-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201015191135.471249-1-alexandre.belloni@bootlin.com>
References: <20201015191135.471249-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

It doesn't make sense to set the RTC to a default value at probe time. Let
the core handle invalid date and time.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-r9701.c | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/drivers/rtc/rtc-r9701.c b/drivers/rtc/rtc-r9701.c
index eb00879f7c9a..f8f7044ff808 100644
--- a/drivers/rtc/rtc-r9701.c
+++ b/drivers/rtc/rtc-r9701.c
@@ -115,7 +115,6 @@ static const struct rtc_class_ops r9701_rtc_ops = {
 static int r9701_probe(struct spi_device *spi)
 {
 	struct rtc_device *rtc;
-	struct rtc_time dt;
 	unsigned char tmp;
 	int res;
 
@@ -126,27 +125,6 @@ static int r9701_probe(struct spi_device *spi)
 		return -ENODEV;
 	}
 
-	/*
-	 * The device seems to be present. Now check if the registers
-	 * contain invalid values. If so, try to write a default date:
-	 * 2000/1/1 00:00:00
-	 */
-	if (r9701_get_datetime(&spi->dev, &dt)) {
-		dev_info(&spi->dev, "trying to repair invalid date/time\n");
-		dt.tm_sec  = 0;
-		dt.tm_min  = 0;
-		dt.tm_hour = 0;
-		dt.tm_mday = 1;
-		dt.tm_mon  = 0;
-		dt.tm_year = 100;
-
-		if (r9701_set_datetime(&spi->dev, &dt) ||
-				r9701_get_datetime(&spi->dev, &dt)) {
-			dev_err(&spi->dev, "cannot repair RTC register\n");
-			return -ENODEV;
-		}
-	}
-
 	rtc = devm_rtc_device_register(&spi->dev, "r9701",
 				&r9701_rtc_ops, THIS_MODULE);
 	if (IS_ERR(rtc))
-- 
2.26.2

