Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70FB22F0A50
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Jan 2021 00:20:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727311AbhAJXTI (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 10 Jan 2021 18:19:08 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:59805 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727302AbhAJXTI (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 10 Jan 2021 18:19:08 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id A9EAE240003;
        Sun, 10 Jan 2021 23:18:25 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 13/17] rtc: rv3028: constify rv3028_rtc_ops
Date:   Mon, 11 Jan 2021 00:17:48 +0100
Message-Id: <20210110231752.1418816-14-alexandre.belloni@bootlin.com>
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
 drivers/rtc/rtc-rv3028.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-rv3028.c b/drivers/rtc/rtc-rv3028.c
index 979407a51c7a..2004f8c5397f 100644
--- a/drivers/rtc/rtc-rv3028.c
+++ b/drivers/rtc/rtc-rv3028.c
@@ -770,9 +770,12 @@ static int rv3028_clkout_register_clk(struct rv3028_data *rv3028,
 }
 #endif
 
-static struct rtc_class_ops rv3028_rtc_ops = {
+static const struct rtc_class_ops rv3028_rtc_ops = {
 	.read_time = rv3028_get_time,
 	.set_time = rv3028_set_time,
+	.read_alarm = rv3028_get_alarm,
+	.set_alarm = rv3028_set_alarm,
+	.alarm_irq_enable = rv3028_alarm_irq_enable,
 	.read_offset = rv3028_read_offset,
 	.set_offset = rv3028_set_offset,
 	.ioctl = rv3028_ioctl,
@@ -841,12 +844,10 @@ static int rv3028_probe(struct i2c_client *client)
 		if (ret) {
 			dev_warn(&client->dev, "unable to request IRQ, alarms disabled\n");
 			client->irq = 0;
-		} else {
-			rv3028_rtc_ops.read_alarm = rv3028_get_alarm;
-			rv3028_rtc_ops.set_alarm = rv3028_set_alarm;
-			rv3028_rtc_ops.alarm_irq_enable = rv3028_alarm_irq_enable;
 		}
 	}
+	if (!client->irq)
+		clear_bit(RTC_FEATURE_ALARM, rv3028->rtc->features);
 
 	ret = regmap_update_bits(rv3028->regmap, RV3028_CTRL1,
 				 RV3028_CTRL1_WADA, RV3028_CTRL1_WADA);
-- 
2.29.2

