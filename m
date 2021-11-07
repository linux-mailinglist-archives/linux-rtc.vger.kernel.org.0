Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E46D1447683
	for <lists+linux-rtc@lfdr.de>; Sun,  7 Nov 2021 23:55:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236726AbhKGW5w (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 7 Nov 2021 17:57:52 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:49375 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236716AbhKGW5v (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 7 Nov 2021 17:57:51 -0500
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 7D1C2100006;
        Sun,  7 Nov 2021 22:55:06 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 06/12] rtc: ab8500: let the core handle the alarm resolution
Date:   Sun,  7 Nov 2021 23:54:51 +0100
Message-Id: <20211107225458.111068-6-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211107225458.111068-1-alexandre.belloni@bootlin.com>
References: <20211107225458.111068-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Tell the RTC core UIE are not supported because the resolution of the alarm
is a minute.

Note that this is in fact also fixing how the resolution is reported as the
previous test was simply ensuring the alarm was more than a minute in the
future while the register has a minute resolution.
This would be ok if the alarm was a countdown but ab8500_rtc_read_alarm
suggests otherwise and the AB8500 datasheet states that the RTC
documentation is not public.

Finally, the comment is wrong and what makes the UIE emulation work is
uie_unsupported being set.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-ab8500.c | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/drivers/rtc/rtc-ab8500.c b/drivers/rtc/rtc-ab8500.c
index b40048871295..ea33e149d545 100644
--- a/drivers/rtc/rtc-ab8500.c
+++ b/drivers/rtc/rtc-ab8500.c
@@ -184,25 +184,9 @@ static int ab8500_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 {
 	int retval, i;
 	unsigned char buf[ARRAY_SIZE(ab8500_rtc_alarm_regs)];
-	unsigned long mins, secs = 0, cursec = 0;
-	struct rtc_time curtm;
+	unsigned long mins;
 
-	/* Get the number of seconds since 1970 */
-	secs = rtc_tm_to_time64(&alarm->time);
-
-	/*
-	 * Check whether alarm is set less than 1min.
-	 * Since our RTC doesn't support alarm resolution less than 1min,
-	 * return -EINVAL, so UIE EMUL can take it up, incase of UIE_ON
-	 */
-	ab8500_rtc_read_time(dev, &curtm); /* Read current time */
-	cursec = rtc_tm_to_time64(&curtm);
-	if ((secs - cursec) < 59) {
-		dev_dbg(dev, "Alarm less than 1 minute not supported\r\n");
-		return -EINVAL;
-	}
-
-	mins = secs / 60;
+	mins = (unsigned long)rtc_tm_to_time64(&alarm->time) / 60;
 
 	buf[2] = mins & 0xFF;
 	buf[1] = (mins >> 8) & 0xFF;
@@ -394,7 +378,8 @@ static int ab8500_rtc_probe(struct platform_device *pdev)
 	dev_pm_set_wake_irq(&pdev->dev, irq);
 	platform_set_drvdata(pdev, rtc);
 
-	rtc->uie_unsupported = 1;
+	set_bit(RTC_FEATURE_ALARM_RES_MINUTE, rtc->features);
+	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->features);
 
 	rtc->range_max = (1ULL << 24) * 60 - 1; // 24-bit minutes + 59 secs
 	rtc->start_secs = RTC_TIMESTAMP_BEGIN_2000;
-- 
2.31.1

