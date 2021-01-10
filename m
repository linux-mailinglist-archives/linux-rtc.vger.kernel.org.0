Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BF602F0A52
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Jan 2021 00:20:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727362AbhAJXTL (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 10 Jan 2021 18:19:11 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:57529 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727302AbhAJXTK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 10 Jan 2021 18:19:10 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id C35296000C;
        Sun, 10 Jan 2021 23:18:28 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 16/17] rtc: rv8803: constify rv8803_rtc_ops
Date:   Mon, 11 Jan 2021 00:17:51 +0100
Message-Id: <20210110231752.1418816-17-alexandre.belloni@bootlin.com>
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
 drivers/rtc/rtc-rv8803.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index d4ea6db51b26..8821264e9385 100644
--- a/drivers/rtc/rtc-rv8803.c
+++ b/drivers/rtc/rtc-rv8803.c
@@ -471,10 +471,13 @@ static int rv8803_nvram_read(void *priv, unsigned int offset,
 	return 0;
 }
 
-static struct rtc_class_ops rv8803_rtc_ops = {
+static const struct rtc_class_ops rv8803_rtc_ops = {
 	.read_time = rv8803_get_time,
 	.set_time = rv8803_set_time,
 	.ioctl = rv8803_ioctl,
+	.read_alarm = rv8803_get_alarm,
+	.set_alarm = rv8803_set_alarm,
+	.alarm_irq_enable = rv8803_alarm_irq_enable,
 };
 
 static int rx8900_trickle_charger_init(struct rv8803_data *rv8803)
@@ -567,12 +570,10 @@ static int rv8803_probe(struct i2c_client *client,
 		if (err) {
 			dev_warn(&client->dev, "unable to request IRQ, alarms disabled\n");
 			client->irq = 0;
-		} else {
-			rv8803_rtc_ops.read_alarm = rv8803_get_alarm;
-			rv8803_rtc_ops.set_alarm = rv8803_set_alarm;
-			rv8803_rtc_ops.alarm_irq_enable = rv8803_alarm_irq_enable;
 		}
 	}
+	if (!client->irq)
+		clear_bit(RTC_FEATURE_ALARM, rv8803->rtc->features);
 
 	err = rv8803_write_reg(rv8803->client, RV8803_EXT, RV8803_EXT_WADA);
 	if (err)
-- 
2.29.2

