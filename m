Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92B962F0A4C
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Jan 2021 00:20:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727137AbhAJXTC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 10 Jan 2021 18:19:02 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:44501 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727171AbhAJXTB (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 10 Jan 2021 18:19:01 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 5A7B2FF80A;
        Sun, 10 Jan 2021 23:18:19 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 08/17] rtc: pcf85063: remove pcf85063_rtc_ops_alarm
Date:   Mon, 11 Jan 2021 00:17:43 +0100
Message-Id: <20210110231752.1418816-9-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210110231752.1418816-1-alexandre.belloni@bootlin.com>
References: <20210110231752.1418816-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Move the alarm callbacks in pcf85063_rtc_ops and use RTC_FEATURE_ALARM to
signal to the core whether alarms are available instead of having a
supplementary struct rtc_class_ops without alarm callbacks.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pcf85063.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
index e19cf2adbc35..f7e7c9eb0781 100644
--- a/drivers/rtc/rtc-pcf85063.c
+++ b/drivers/rtc/rtc-pcf85063.c
@@ -307,14 +307,6 @@ static int pcf85063_ioctl(struct device *dev, unsigned int cmd,
 }
 
 static const struct rtc_class_ops pcf85063_rtc_ops = {
-	.read_time	= pcf85063_rtc_read_time,
-	.set_time	= pcf85063_rtc_set_time,
-	.read_offset	= pcf85063_read_offset,
-	.set_offset	= pcf85063_set_offset,
-	.ioctl		= pcf85063_ioctl,
-};
-
-static const struct rtc_class_ops pcf85063_rtc_ops_alarm = {
 	.read_time	= pcf85063_rtc_read_time,
 	.set_time	= pcf85063_rtc_set_time,
 	.read_offset	= pcf85063_read_offset,
@@ -587,6 +579,7 @@ static int pcf85063_probe(struct i2c_client *client)
 	pcf85063->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
 	pcf85063->rtc->range_max = RTC_TIMESTAMP_END_2099;
 	pcf85063->rtc->uie_unsupported = 1;
+	clear_bit(RTC_FEATURE_ALARM, pcf85063->rtc->features);
 
 	if (config->has_alarms && client->irq > 0) {
 		err = devm_request_threaded_irq(&client->dev, client->irq,
@@ -597,7 +590,7 @@ static int pcf85063_probe(struct i2c_client *client)
 			dev_warn(&pcf85063->rtc->dev,
 				 "unable to request IRQ, alarms disabled\n");
 		} else {
-			pcf85063->rtc->ops = &pcf85063_rtc_ops_alarm;
+			set_bit(RTC_FEATURE_ALARM, pcf85063->rtc->features);
 			device_init_wakeup(&client->dev, true);
 			err = dev_pm_set_wake_irq(&client->dev, client->irq);
 			if (err)
-- 
2.29.2

