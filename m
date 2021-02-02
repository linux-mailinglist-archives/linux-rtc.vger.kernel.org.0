Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E71FF30BD36
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Feb 2021 12:36:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231394AbhBBLeA (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 2 Feb 2021 06:34:00 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:60985 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230033AbhBBLad (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 2 Feb 2021 06:30:33 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 4857A60008;
        Tue,  2 Feb 2021 11:29:46 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 1/2] rtc: s3c: stop setting bogus time
Date:   Tue,  2 Feb 2021 12:29:33 +0100
Message-Id: <20210202112934.3612726-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

It doesn't make sense to set the RTC to a default value at probe time. Let
the core handle invalid date and time.

Also, this is basically dead code since commit 22652ba72453 ("rtc: stop
validating rtc_time in .read_time")

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-s3c.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index fab326ba9cec..f07b0c43aafe 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -382,7 +382,6 @@ static int s3c_rtc_remove(struct platform_device *pdev)
 static int s3c_rtc_probe(struct platform_device *pdev)
 {
 	struct s3c_rtc *info = NULL;
-	struct rtc_time rtc_tm;
 	int ret;
 
 	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
@@ -448,20 +447,6 @@ static int s3c_rtc_probe(struct platform_device *pdev)
 
 	device_init_wakeup(&pdev->dev, 1);
 
-	/* Check RTC Time */
-	if (s3c_rtc_gettime(&pdev->dev, &rtc_tm)) {
-		rtc_tm.tm_year	= 100;
-		rtc_tm.tm_mon	= 0;
-		rtc_tm.tm_mday	= 1;
-		rtc_tm.tm_hour	= 0;
-		rtc_tm.tm_min	= 0;
-		rtc_tm.tm_sec	= 0;
-
-		s3c_rtc_settime(&pdev->dev, &rtc_tm);
-
-		dev_warn(&pdev->dev, "warning: invalid RTC value so initializing it\n");
-	}
-
 	/* register RTC and exit */
 	info->rtc = devm_rtc_device_register(&pdev->dev, "s3c", &s3c_rtcops,
 					     THIS_MODULE);
-- 
2.29.2

