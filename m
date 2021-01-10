Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E83892F0A51
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Jan 2021 00:20:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727334AbhAJXTK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 10 Jan 2021 18:19:10 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:52181 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727316AbhAJXTJ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 10 Jan 2021 18:19:09 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id E43EC6000B;
        Sun, 10 Jan 2021 23:18:27 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 15/17] rtc: rv3032: constify rv3032_rtc_ops
Date:   Mon, 11 Jan 2021 00:17:50 +0100
Message-Id: <20210110231752.1418816-16-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210110231752.1418816-1-alexandre.belloni@bootlin.com>
References: <20210110231752.1418816-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Use RTC_FEATURE_ALARM to signal to the core whether alarms are available
instead of changing the global struct rtc_class_ops, allowing to make it
const.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-rv3032.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-rv3032.c b/drivers/rtc/rtc-rv3032.c
index c9bcea727757..5161016bce00 100644
--- a/drivers/rtc/rtc-rv3032.c
+++ b/drivers/rtc/rtc-rv3032.c
@@ -804,12 +804,15 @@ static void rv3032_hwmon_register(struct device *dev)
 	devm_hwmon_device_register_with_info(dev, "rv3032", rv3032, &rv3032_hwmon_chip_info, NULL);
 }
 
-static struct rtc_class_ops rv3032_rtc_ops = {
+static const struct rtc_class_ops rv3032_rtc_ops = {
 	.read_time = rv3032_get_time,
 	.set_time = rv3032_set_time,
 	.read_offset = rv3032_read_offset,
 	.set_offset = rv3032_set_offset,
 	.ioctl = rv3032_ioctl,
+	.read_alarm = rv3032_get_alarm,
+	.set_alarm = rv3032_set_alarm,
+	.alarm_irq_enable = rv3032_alarm_irq_enable,
 };
 
 static const struct regmap_config regmap_config = {
@@ -868,12 +871,10 @@ static int rv3032_probe(struct i2c_client *client)
 		if (ret) {
 			dev_warn(&client->dev, "unable to request IRQ, alarms disabled\n");
 			client->irq = 0;
-		} else {
-			rv3032_rtc_ops.read_alarm = rv3032_get_alarm;
-			rv3032_rtc_ops.set_alarm = rv3032_set_alarm;
-			rv3032_rtc_ops.alarm_irq_enable = rv3032_alarm_irq_enable;
 		}
 	}
+	if (!client->irq)
+		clear_bit(RTC_FEATURE_ALARM, rv3032->rtc->features);
 
 	ret = regmap_update_bits(rv3032->regmap, RV3032_CTRL1,
 				 RV3032_CTRL1_WADA, RV3032_CTRL1_WADA);
-- 
2.29.2

