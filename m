Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34BA5447681
	for <lists+linux-rtc@lfdr.de>; Sun,  7 Nov 2021 23:55:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236720AbhKGW5v (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 7 Nov 2021 17:57:51 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:44131 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236710AbhKGW5t (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 7 Nov 2021 17:57:49 -0500
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 6A8FD20009;
        Sun,  7 Nov 2021 22:55:05 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 05/12] rtc: ab-eoz9: support UIE when available
Date:   Sun,  7 Nov 2021 23:54:50 +0100
Message-Id: <20211107225458.111068-5-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211107225458.111068-1-alexandre.belloni@bootlin.com>
References: <20211107225458.111068-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The RTC actually supports UIE when an interrupt is available.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-ab-eoz9.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-ab-eoz9.c b/drivers/rtc/rtc-ab-eoz9.c
index 50ead6fce880..e188ab517f1e 100644
--- a/drivers/rtc/rtc-ab-eoz9.c
+++ b/drivers/rtc/rtc-ab-eoz9.c
@@ -534,7 +534,6 @@ static int abeoz9_probe(struct i2c_client *client,
 	data->rtc->ops = &rtc_ops;
 	data->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
 	data->rtc->range_max = RTC_TIMESTAMP_END_2099;
-	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, data->rtc->features);
 	clear_bit(RTC_FEATURE_ALARM, data->rtc->features);
 
 	if (client->irq > 0) {
@@ -546,6 +545,8 @@ static int abeoz9_probe(struct i2c_client *client,
 			dev_err(dev, "failed to request alarm irq\n");
 			return ret;
 		}
+	} else {
+		clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, data->rtc->features);
 	}
 
 	if (client->irq > 0 || device_property_read_bool(dev, "wakeup-source")) {
-- 
2.31.1

