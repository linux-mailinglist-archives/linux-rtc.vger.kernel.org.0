Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B85712F0A37
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Jan 2021 00:19:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727060AbhAJXSw (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 10 Jan 2021 18:18:52 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:41843 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726908AbhAJXSw (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 10 Jan 2021 18:18:52 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id E8FE740006;
        Sun, 10 Jan 2021 23:18:06 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 03/17] rtc: armada38x: remove armada38x_rtc_ops_noirq
Date:   Mon, 11 Jan 2021 00:17:38 +0100
Message-Id: <20210110231752.1418816-4-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210110231752.1418816-1-alexandre.belloni@bootlin.com>
References: <20210110231752.1418816-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Clear RTC_FEATURE_ALARM to signal that alarms are not available instead of
having a supplementary struct rtc_class_ops with a NULL .set_alarm.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-armada38x.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/rtc/rtc-armada38x.c b/drivers/rtc/rtc-armada38x.c
index 807a79c07f08..cc542e6b1d5b 100644
--- a/drivers/rtc/rtc-armada38x.c
+++ b/drivers/rtc/rtc-armada38x.c
@@ -458,14 +458,6 @@ static const struct rtc_class_ops armada38x_rtc_ops = {
 	.set_offset = armada38x_rtc_set_offset,
 };
 
-static const struct rtc_class_ops armada38x_rtc_ops_noirq = {
-	.read_time = armada38x_rtc_read_time,
-	.set_time = armada38x_rtc_set_time,
-	.read_alarm = armada38x_rtc_read_alarm,
-	.read_offset = armada38x_rtc_read_offset,
-	.set_offset = armada38x_rtc_set_offset,
-};
-
 static const struct armada38x_rtc_data armada38x_data = {
 	.update_mbus_timing = rtc_update_38x_mbus_timing_params,
 	.read_rtc_reg = read_rtc_register_38x_wa,
@@ -540,20 +532,15 @@ static __init int armada38x_rtc_probe(struct platform_device *pdev)
 	}
 	platform_set_drvdata(pdev, rtc);
 
-	if (rtc->irq != -1) {
+	if (rtc->irq != -1)
 		device_init_wakeup(&pdev->dev, 1);
-		rtc->rtc_dev->ops = &armada38x_rtc_ops;
-	} else {
-		/*
-		 * If there is no interrupt available then we can't
-		 * use the alarm
-		 */
-		rtc->rtc_dev->ops = &armada38x_rtc_ops_noirq;
-	}
+	else
+		clear_bit(RTC_FEATURE_ALARM, rtc->rtc_dev->features);
 
 	/* Update RTC-MBUS bridge timing parameters */
 	rtc->data->update_mbus_timing(rtc);
 
+	rtc->rtc_dev->ops = &armada38x_rtc_ops;
 	rtc->rtc_dev->range_max = U32_MAX;
 
 	return devm_rtc_register_device(rtc->rtc_dev);
-- 
2.29.2

