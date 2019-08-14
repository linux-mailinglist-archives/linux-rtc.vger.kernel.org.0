Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD1828D6F2
	for <lists+linux-rtc@lfdr.de>; Wed, 14 Aug 2019 17:10:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728191AbfHNPKN (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 14 Aug 2019 11:10:13 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:53663 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728134AbfHNPKN (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 14 Aug 2019 11:10:13 -0400
Received: from localhost (alyon-656-1-672-152.w92-137.abo.wanadoo.fr [92.137.69.152])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 7C0E2100007;
        Wed, 14 Aug 2019 15:10:11 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v2 5/9] rtc: pcf2123: let the core handle range offsetting
Date:   Wed, 14 Aug 2019 17:09:58 +0200
Message-Id: <20190814151002.7324-5-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190814151002.7324-1-alexandre.belloni@bootlin.com>
References: <20190814151002.7324-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Set the RTC range properly and use the core windowing and offsetting to
(unfortunately) map back to a 1970-2069 range.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pcf2123.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-pcf2123.c b/drivers/rtc/rtc-pcf2123.c
index 7d79180a4292..ba37060f299e 100644
--- a/drivers/rtc/rtc-pcf2123.c
+++ b/drivers/rtc/rtc-pcf2123.c
@@ -194,9 +194,7 @@ static int pcf2123_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	tm->tm_mday = bcd2bin(rxbuf[3] & 0x3F);
 	tm->tm_wday = rxbuf[4] & 0x07;
 	tm->tm_mon = bcd2bin(rxbuf[5] & 0x1F) - 1; /* rtc mn 1-12 */
-	tm->tm_year = bcd2bin(rxbuf[6]);
-	if (tm->tm_year < 70)
-		tm->tm_year += 100;	/* assume we are in 1970...2069 */
+	tm->tm_year = bcd2bin(rxbuf[6]) + 100;
 
 	dev_dbg(dev, "%s: tm is %ptR\n", __func__, tm);
 
@@ -223,7 +221,7 @@ static int pcf2123_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	txbuf[3] = bin2bcd(tm->tm_mday & 0x3F);
 	txbuf[4] = tm->tm_wday & 0x07;
 	txbuf[5] = bin2bcd((tm->tm_mon + 1) & 0x1F); /* rtc mn 1-12 */
-	txbuf[6] = bin2bcd(tm->tm_year < 100 ? tm->tm_year : tm->tm_year - 100);
+	txbuf[6] = bin2bcd(tm->tm_year - 100);
 
 	ret = regmap_bulk_write(pcf2123->map, PCF2123_REG_SC, txbuf,
 				sizeof(txbuf));
@@ -431,6 +429,9 @@ static int pcf2123_probe(struct spi_device *spi)
 	 */
 	rtc->uie_unsupported = 1;
 	rtc->ops = &pcf2123_rtc_ops;
+	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	rtc->range_max = RTC_TIMESTAMP_END_2099;
+	rtc->set_start_time = true;
 
 	ret = rtc_register_device(rtc);
 	if (ret)
-- 
2.21.0

