Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43678182519
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Mar 2020 23:40:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731341AbgCKWkC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 11 Mar 2020 18:40:02 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:36401 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729919AbgCKWkB (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 11 Mar 2020 18:40:01 -0400
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 720E8C0003;
        Wed, 11 Mar 2020 22:39:59 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] rtc: 88pm860x: stop setting a default time
Date:   Wed, 11 Mar 2020 23:39:52 +0100
Message-Id: <20200311223956.51352-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200311223956.51352-1-alexandre.belloni@bootlin.com>
References: <20200311223956.51352-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

It doesn't make sense to set the RTC to a default value at probe time. Let
the core handle invalid date and time.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-88pm860x.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/rtc/rtc-88pm860x.c b/drivers/rtc/rtc-88pm860x.c
index 1526402e126b..d6aca28905e3 100644
--- a/drivers/rtc/rtc-88pm860x.c
+++ b/drivers/rtc/rtc-88pm860x.c
@@ -360,19 +360,6 @@ static int pm860x_rtc_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "Failed to read initial time.\n");
 		return ret;
 	}
-	if ((tm.tm_year < 70) || (tm.tm_year > 138)) {
-		tm.tm_year = 70;
-		tm.tm_mon = 0;
-		tm.tm_mday = 1;
-		tm.tm_hour = 0;
-		tm.tm_min = 0;
-		tm.tm_sec = 0;
-		ret = pm860x_rtc_set_time(&pdev->dev, &tm);
-		if (ret < 0) {
-			dev_err(&pdev->dev, "Failed to set initial time.\n");
-			return ret;
-		}
-	}
 	rtc_tm_to_time(&tm, &ticks);
 	if (pm860x_rtc_dt_init(pdev, info)) {
 		if (pdata && pdata->sync) {
-- 
2.24.1

