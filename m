Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76D822F0A4E
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Jan 2021 00:20:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727251AbhAJXTF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 10 Jan 2021 18:19:05 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:52663 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727190AbhAJXTE (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 10 Jan 2021 18:19:04 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 0659B20007;
        Sun, 10 Jan 2021 23:18:22 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 11/17] rtc: m41t80: constify m41t80_rtc_ops
Date:   Mon, 11 Jan 2021 00:17:46 +0100
Message-Id: <20210110231752.1418816-12-alexandre.belloni@bootlin.com>
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
 drivers/rtc/rtc-m41t80.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
index 160dcf68e64e..e3ddd660d68c 100644
--- a/drivers/rtc/rtc-m41t80.c
+++ b/drivers/rtc/rtc-m41t80.c
@@ -397,10 +397,13 @@ static int m41t80_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	return 0;
 }
 
-static struct rtc_class_ops m41t80_rtc_ops = {
+static const struct rtc_class_ops m41t80_rtc_ops = {
 	.read_time = m41t80_rtc_read_time,
 	.set_time = m41t80_rtc_set_time,
 	.proc = m41t80_rtc_proc,
+	.read_alarm = m41t80_read_alarm,
+	.set_alarm = m41t80_set_alarm,
+	.alarm_irq_enable = m41t80_alarm_irq_enable,
 };
 
 #ifdef CONFIG_PM_SLEEP
@@ -913,13 +916,10 @@ static int m41t80_probe(struct i2c_client *client,
 			wakeup_source = false;
 		}
 	}
-	if (client->irq > 0 || wakeup_source) {
-		m41t80_rtc_ops.read_alarm = m41t80_read_alarm;
-		m41t80_rtc_ops.set_alarm = m41t80_set_alarm;
-		m41t80_rtc_ops.alarm_irq_enable = m41t80_alarm_irq_enable;
-		/* Enable the wakealarm */
+	if (client->irq > 0 || wakeup_source)
 		device_init_wakeup(&client->dev, true);
-	}
+	else
+		clear_bit(RTC_FEATURE_ALARM, m41t80_data->rtc->features);
 
 	m41t80_data->rtc->ops = &m41t80_rtc_ops;
 	m41t80_data->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
-- 
2.29.2

