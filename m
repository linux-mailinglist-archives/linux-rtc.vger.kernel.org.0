Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 287722B730B
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Nov 2020 01:28:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727066AbgKRA1x (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 17 Nov 2020 19:27:53 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:45311 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbgKRA1x (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 17 Nov 2020 19:27:53 -0500
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id AB1ADFF802;
        Wed, 18 Nov 2020 00:27:51 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] rtc: pcf8523: set range
Date:   Wed, 18 Nov 2020 01:27:46 +0100
Message-Id: <20201118002747.1346504-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201118002747.1346504-1-alexandre.belloni@bootlin.com>
References: <20201118002747.1346504-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Set the th RTC range, it is a classic BCD RTC, considering 00 as a leap
year. Let the core handle range checking.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pcf8523.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/rtc/rtc-pcf8523.c b/drivers/rtc/rtc-pcf8523.c
index b525998cd70e..d5f913cb2ec9 100644
--- a/drivers/rtc/rtc-pcf8523.c
+++ b/drivers/rtc/rtc-pcf8523.c
@@ -226,17 +226,6 @@ static int pcf8523_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	u8 regs[8];
 	int err;
 
-	/*
-	 * The hardware can only store values between 0 and 99 in it's YEAR
-	 * register (with 99 overflowing to 0 on increment).
-	 * After 2100-02-28 we could start interpreting the year to be in the
-	 * interval [2100, 2199], but there is no path to switch in a smooth way
-	 * because the chip handles YEAR=0x00 (and the out-of-spec
-	 * YEAR=0xa0) as a leap year, but 2100 isn't.
-	 */
-	if (tm->tm_year < 100 || tm->tm_year >= 200)
-		return -EINVAL;
-
 	err = pcf8523_stop_rtc(client);
 	if (err < 0)
 		return err;
@@ -361,6 +350,8 @@ static int pcf8523_probe(struct i2c_client *client,
 		return PTR_ERR(rtc);
 
 	rtc->ops = &pcf8523_rtc_ops;
+	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	rtc->range_max = RTC_TIMESTAMP_END_2099;
 
 	return devm_rtc_register_device(rtc);
 }
-- 
2.28.0

