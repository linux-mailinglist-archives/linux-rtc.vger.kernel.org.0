Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEAE028F947
	for <lists+linux-rtc@lfdr.de>; Thu, 15 Oct 2020 21:11:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388672AbgJOTLu (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 15 Oct 2020 15:11:50 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:56101 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388608AbgJOTLs (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 15 Oct 2020 15:11:48 -0400
X-Originating-IP: 90.65.88.165
Received: from localhost (lfbn-lyo-1-1908-165.w90-65.abo.wanadoo.fr [90.65.88.165])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 4D865E0002;
        Thu, 15 Oct 2020 19:11:45 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] rtc: r9701: set range
Date:   Thu, 15 Oct 2020 21:11:35 +0200
Message-Id: <20201015191135.471249-6-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201015191135.471249-1-alexandre.belloni@bootlin.com>
References: <20201015191135.471249-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Set range and remove the set_time check. This is a classic BCD RTC.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-r9701.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-r9701.c b/drivers/rtc/rtc-r9701.c
index 9165c180b0e6..7ceb968f0e44 100644
--- a/drivers/rtc/rtc-r9701.c
+++ b/drivers/rtc/rtc-r9701.c
@@ -88,11 +88,7 @@ static int r9701_get_datetime(struct device *dev, struct rtc_time *dt)
 
 static int r9701_set_datetime(struct device *dev, struct rtc_time *dt)
 {
-	int ret, year;
-
-	year = dt->tm_year + 1900;
-	if (year >= 2100 || year < 2000)
-		return -EINVAL;
+	int ret;
 
 	ret = write_reg(dev, RHRCNT, bin2bcd(dt->tm_hour));
 	ret = ret ? ret : write_reg(dev, RMINCNT, bin2bcd(dt->tm_min));
@@ -128,6 +124,8 @@ static int r9701_probe(struct spi_device *spi)
 
 	spi_set_drvdata(spi, rtc);
 	rtc->ops = &r9701_rtc_ops;
+	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	rtc->range_max = RTC_TIMESTAMP_END_2099;
 
 	return rtc_register_device(rtc);
 }
-- 
2.26.2

