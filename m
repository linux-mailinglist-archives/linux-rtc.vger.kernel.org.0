Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ABC42F0A4D
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Jan 2021 00:20:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727265AbhAJXTF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 10 Jan 2021 18:19:05 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:49517 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727235AbhAJXTE (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 10 Jan 2021 18:19:04 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 41E16E000B;
        Sun, 10 Jan 2021 23:18:21 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 10/17] rtc: pcf85363: drop a struct rtc_class_ops
Date:   Mon, 11 Jan 2021 00:17:45 +0100
Message-Id: <20210110231752.1418816-11-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210110231752.1418816-1-alexandre.belloni@bootlin.com>
References: <20210110231752.1418816-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Merge both struct rtc_class_ops in a single one and use RTC_FEATURE_ALARM
to signal to the core whether alarms are available.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pcf85363.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-pcf85363.c b/drivers/rtc/rtc-pcf85363.c
index a574c8d15a5c..8c2dcbac0d7b 100644
--- a/drivers/rtc/rtc-pcf85363.c
+++ b/drivers/rtc/rtc-pcf85363.c
@@ -285,11 +285,6 @@ static irqreturn_t pcf85363_rtc_handle_irq(int irq, void *dev_id)
 static const struct rtc_class_ops rtc_ops = {
 	.read_time	= pcf85363_rtc_read_time,
 	.set_time	= pcf85363_rtc_set_time,
-};
-
-static const struct rtc_class_ops rtc_ops_alarm = {
-	.read_time	= pcf85363_rtc_read_time,
-	.set_time	= pcf85363_rtc_set_time,
 	.read_alarm	= pcf85363_rtc_read_alarm,
 	.set_alarm	= pcf85363_rtc_set_alarm,
 	.alarm_irq_enable = pcf85363_rtc_alarm_irq_enable,
@@ -403,6 +398,7 @@ static int pcf85363_probe(struct i2c_client *client,
 	pcf85363->rtc->ops = &rtc_ops;
 	pcf85363->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
 	pcf85363->rtc->range_max = RTC_TIMESTAMP_END_2099;
+	clear_bit(RTC_FEATURE_ALARM, pcf85363->rtc->features);
 
 	if (client->irq > 0) {
 		regmap_write(pcf85363->regmap, CTRL_FLAGS, 0);
@@ -415,7 +411,7 @@ static int pcf85363_probe(struct i2c_client *client,
 		if (ret)
 			dev_warn(&client->dev, "unable to request IRQ, alarms disabled\n");
 		else
-			pcf85363->rtc->ops = &rtc_ops_alarm;
+			set_bit(RTC_FEATURE_ALARM, pcf85363->rtc->features);
 	}
 
 	ret = devm_rtc_register_device(pcf85363->rtc);
-- 
2.29.2

