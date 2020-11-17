Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06C402B70D7
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Nov 2020 22:22:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbgKQVWU (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 17 Nov 2020 16:22:20 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:50137 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726035AbgKQVWT (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 17 Nov 2020 16:22:19 -0500
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 56F93FF802;
        Tue, 17 Nov 2020 21:22:17 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: sc27xx: Always read normal alarm
Date:   Tue, 17 Nov 2020 22:22:01 +0100
Message-Id: <20201117212201.1288608-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The RTC core only reads the alarm from the hardware at boot time, to know
whether an alarm was already set before booting. It keeps track of all the
alarms after that so there is no need to ever read the auxiliary alarm.

Commit 3822d1bb0df1 ("rtc: sc27xx: Always read normal alarm when
registering RTC device") already effectively removed the capability to read
the auxiliary alarm a .read_alarm is always called with rtc->registered set
to false.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-sc27xx.c | 38 ++------------------------------------
 1 file changed, 2 insertions(+), 36 deletions(-)

diff --git a/drivers/rtc/rtc-sc27xx.c b/drivers/rtc/rtc-sc27xx.c
index 6e65f68ea86d..a953bc0a5a5b 100644
--- a/drivers/rtc/rtc-sc27xx.c
+++ b/drivers/rtc/rtc-sc27xx.c
@@ -299,33 +299,6 @@ static int sprd_rtc_set_secs(struct sprd_rtc *rtc, enum sprd_rtc_reg_types type,
 			    sts_mask);
 }
 
-static int sprd_rtc_read_aux_alarm(struct device *dev, struct rtc_wkalrm *alrm)
-{
-	struct sprd_rtc *rtc = dev_get_drvdata(dev);
-	time64_t secs;
-	u32 val;
-	int ret;
-
-	ret = sprd_rtc_get_secs(rtc, SPRD_RTC_AUX_ALARM, &secs);
-	if (ret)
-		return ret;
-
-	rtc_time64_to_tm(secs, &alrm->time);
-
-	ret = regmap_read(rtc->regmap, rtc->base + SPRD_RTC_INT_EN, &val);
-	if (ret)
-		return ret;
-
-	alrm->enabled = !!(val & SPRD_RTC_AUXALM_EN);
-
-	ret = regmap_read(rtc->regmap, rtc->base + SPRD_RTC_INT_RAW_STS, &val);
-	if (ret)
-		return ret;
-
-	alrm->pending = !!(val & SPRD_RTC_AUXALM_EN);
-	return 0;
-}
-
 static int sprd_rtc_set_aux_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 {
 	struct sprd_rtc *rtc = dev_get_drvdata(dev);
@@ -415,16 +388,9 @@ static int sprd_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	u32 val;
 
 	/*
-	 * Before RTC device is registered, it will check to see if there is an
-	 * alarm already set in RTC hardware, and we always read the normal
-	 * alarm at this time.
-	 *
-	 * Or if aie_timer is enabled, we should get the normal alarm time.
-	 * Otherwise we should get auxiliary alarm time.
+	 * The RTC core checks to see if there is an alarm already set in RTC
+	 * hardware, and we always read the normal alarm at this time.
 	 */
-	if (rtc->rtc && rtc->rtc->registered && rtc->rtc->aie_timer.enabled == 0)
-		return sprd_rtc_read_aux_alarm(dev, alrm);
-
 	ret = sprd_rtc_get_secs(rtc, SPRD_RTC_ALARM, &secs);
 	if (ret)
 		return ret;
-- 
2.28.0

