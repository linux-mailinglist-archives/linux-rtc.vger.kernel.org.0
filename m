Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD3942F0A3F
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Jan 2021 00:19:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727230AbhAJXTD (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 10 Jan 2021 18:19:03 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:41127 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727190AbhAJXTC (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 10 Jan 2021 18:19:02 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 47308FF80B;
        Sun, 10 Jan 2021 23:18:20 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 09/17] rtc: rx8010: drop a struct rtc_class_ops
Date:   Mon, 11 Jan 2021 00:17:44 +0100
Message-Id: <20210110231752.1418816-10-alexandre.belloni@bootlin.com>
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
 drivers/rtc/rtc-rx8010.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/rtc/rtc-rx8010.c b/drivers/rtc/rtc-rx8010.c
index 8340ab47a059..1a05e4654290 100644
--- a/drivers/rtc/rtc-rx8010.c
+++ b/drivers/rtc/rtc-rx8010.c
@@ -354,13 +354,7 @@ static int rx8010_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
 	}
 }
 
-static const struct rtc_class_ops rx8010_rtc_ops_default = {
-	.read_time = rx8010_get_time,
-	.set_time = rx8010_set_time,
-	.ioctl = rx8010_ioctl,
-};
-
-static const struct rtc_class_ops rx8010_rtc_ops_alarm = {
+static const struct rtc_class_ops rx8010_rtc_ops = {
 	.read_time = rx8010_get_time,
 	.set_time = rx8010_set_time,
 	.ioctl = rx8010_ioctl,
@@ -409,12 +403,11 @@ static int rx8010_probe(struct i2c_client *client)
 			dev_err(dev, "unable to request IRQ\n");
 			return err;
 		}
-
-		rx8010->rtc->ops = &rx8010_rtc_ops_alarm;
 	} else {
-		rx8010->rtc->ops = &rx8010_rtc_ops_default;
+		clear_bit(RTC_FEATURE_ALARM, rx8010->rtc->features);
 	}
 
+	rx8010->rtc->ops = &rx8010_rtc_ops;
 	rx8010->rtc->max_user_freq = 1;
 	rx8010->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
 	rx8010->rtc->range_max = RTC_TIMESTAMP_END_2099;
-- 
2.29.2

