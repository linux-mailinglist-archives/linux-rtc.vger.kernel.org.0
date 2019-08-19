Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A453194CD2
	for <lists+linux-rtc@lfdr.de>; Mon, 19 Aug 2019 20:29:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728358AbfHSS1D (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 19 Aug 2019 14:27:03 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:40671 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728351AbfHSS1D (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 19 Aug 2019 14:27:03 -0400
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 4D869100004;
        Mon, 19 Aug 2019 18:27:01 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v3 8/9] rtc: pcf2123: let the core handle range offsetting
Date:   Mon, 19 Aug 2019 20:26:55 +0200
Message-Id: <20190819182656.29744-8-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190819182656.29744-1-alexandre.belloni@bootlin.com>
References: <20190819182656.29744-1-alexandre.belloni@bootlin.com>
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
index fd326fd2932e..bda4b1687318 100644
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
@@ -432,6 +430,9 @@ static int pcf2123_probe(struct spi_device *spi)
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

