Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8FAC17B0E5
	for <lists+linux-rtc@lfdr.de>; Thu,  5 Mar 2020 22:50:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726273AbgCEVue (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 5 Mar 2020 16:50:34 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:33677 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgCEVue (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 5 Mar 2020 16:50:34 -0500
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id EC38120008;
        Thu,  5 Mar 2020 21:50:31 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] rtc: davinci: remove useless 24h alarm handling
Date:   Thu,  5 Mar 2020 22:50:20 +0100
Message-Id: <20200305215022.32533-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200305215022.32533-1-alexandre.belloni@bootlin.com>
References: <20200305215022.32533-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The code handling invalid alarms meaning the alarm is in the next 24 hours
is not necessary since commit f8245c26886c ("rtc: remove "RTC_ALM_SET mode"
bugs") which actually predates this driver. Since then, .set_alarm is never
called with an invalid alarm and this handling is not necessary in the
driver.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-davinci.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/rtc/rtc-davinci.c b/drivers/rtc/rtc-davinci.c
index d620d147c604..3043ffea8f7c 100644
--- a/drivers/rtc/rtc-davinci.c
+++ b/drivers/rtc/rtc-davinci.c
@@ -413,27 +413,6 @@ static int davinci_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
 	unsigned long flags;
 	u16 days;
 
-	if (alm->time.tm_mday <= 0 && alm->time.tm_mon < 0
-	    && alm->time.tm_year < 0) {
-		struct rtc_time tm;
-		unsigned long now, then;
-
-		davinci_rtc_read_time(dev, &tm);
-		rtc_tm_to_time(&tm, &now);
-
-		alm->time.tm_mday = tm.tm_mday;
-		alm->time.tm_mon = tm.tm_mon;
-		alm->time.tm_year = tm.tm_year;
-		rtc_tm_to_time(&alm->time, &then);
-
-		if (then < now) {
-			rtc_time_to_tm(now + 24 * 60 * 60, &tm);
-			alm->time.tm_mday = tm.tm_mday;
-			alm->time.tm_mon = tm.tm_mon;
-			alm->time.tm_year = tm.tm_year;
-		}
-	}
-
 	if (convert2days(&days, &alm->time) < 0)
 		return -EINVAL;
 
-- 
2.24.1

