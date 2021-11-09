Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEF7A44B973
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Nov 2021 00:48:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229919AbhKIXus (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 9 Nov 2021 18:50:48 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:48377 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbhKIXur (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 9 Nov 2021 18:50:47 -0500
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 1D9271C0003;
        Tue,  9 Nov 2021 23:47:58 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Support Opensource <support.opensource@diasemi.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: da9063: switch to RTC_FEATURE_UPDATE_INTERRUPT
Date:   Wed, 10 Nov 2021 00:47:50 +0100
Message-Id: <20211109234750.107115-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Stop using uie_unsupported and clear RTC_FEATURE_UPDATE_INTERRUPT instead.
Also, let the core know that the alarm will truncate seconds as it only has
a minute resolution.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-da9063.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-da9063.c b/drivers/rtc/rtc-da9063.c
index d4b72a9fa2ba..54a5e244946b 100644
--- a/drivers/rtc/rtc-da9063.c
+++ b/drivers/rtc/rtc-da9063.c
@@ -475,12 +475,14 @@ static int da9063_rtc_probe(struct platform_device *pdev)
 	da9063_data_to_tm(data, &rtc->alarm_time, rtc);
 	rtc->rtc_sync = false;
 
-	/*
-	 * TODO: some models have alarms on a minute boundary but still support
-	 * real hardware interrupts. Add this once the core supports it.
-	 */
-	if (config->rtc_data_start != RTC_SEC)
-		rtc->rtc_dev->uie_unsupported = 1;
+	if (config->rtc_data_start != RTC_SEC) {
+		set_bit(RTC_FEATURE_ALARM_RES_MINUTE, rtc->rtc_dev->features);
+		/*
+		 * TODO: some models have alarms on a minute boundary but still
+		 * support real hardware interrupts.
+		 */
+		clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->rtc_dev->features);
+	}
 
 	irq_alarm = platform_get_irq_byname(pdev, "ALARM");
 	if (irq_alarm < 0)
-- 
2.31.1

