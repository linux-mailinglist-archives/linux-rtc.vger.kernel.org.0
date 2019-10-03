Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43823CB139
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Oct 2019 23:35:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731413AbfJCVfu (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 3 Oct 2019 17:35:50 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:41373 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730020AbfJCVfu (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 3 Oct 2019 17:35:50 -0400
X-Originating-IP: 86.202.229.42
Received: from localhost (lfbn-lyo-1-146-42.w86-202.abo.wanadoo.fr [86.202.229.42])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id AC2561C0003;
        Thu,  3 Oct 2019 21:35:48 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Lukasz Majewski <lukma@denx.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] rtc: m41t80: set range
Date:   Thu,  3 Oct 2019 23:35:44 +0200
Message-Id: <20191003213544.5359-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This is a standard BCD RTC that will fail in 2100. The century bits don't
help because 2100 will be considered a leap year while it is not.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-m41t80.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
index 5f46f85f814b..b813295a2eb5 100644
--- a/drivers/rtc/rtc-m41t80.c
+++ b/drivers/rtc/rtc-m41t80.c
@@ -235,9 +235,6 @@ static int m41t80_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	unsigned char buf[8];
 	int err, flags;
 
-	if (tm->tm_year < 100 || tm->tm_year > 199)
-		return -EINVAL;
-
 	buf[M41T80_REG_SSEC] = 0;
 	buf[M41T80_REG_SEC] = bin2bcd(tm->tm_sec);
 	buf[M41T80_REG_MIN] = bin2bcd(tm->tm_min);
@@ -925,6 +922,8 @@ static int m41t80_probe(struct i2c_client *client,
 	}
 
 	m41t80_data->rtc->ops = &m41t80_rtc_ops;
+	m41t80_data->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	m41t80_data->rtc->range_max = RTC_TIMESTAMP_END_2099;
 
 	if (client->irq <= 0) {
 		/* We cannot support UIE mode if we do not have an IRQ line */
-- 
2.21.0

