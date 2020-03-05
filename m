Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C57E917B0E7
	for <lists+linux-rtc@lfdr.de>; Thu,  5 Mar 2020 22:50:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726390AbgCEVuf (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 5 Mar 2020 16:50:35 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:36613 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726067AbgCEVue (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 5 Mar 2020 16:50:34 -0500
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id B2E56240006;
        Thu,  5 Mar 2020 21:50:32 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] rtc: davinci: let the core handle rtc range
Date:   Thu,  5 Mar 2020 22:50:21 +0100
Message-Id: <20200305215022.32533-3-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200305215022.32533-1-alexandre.belloni@bootlin.com>
References: <20200305215022.32533-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Let the core handle offsetting and windowing the RTC range.

This rtc has hours, minutes, seconds and 16bit days. As the driver has the
RTC epoch set to year 2000, this means that the end of the range is 2^16
days minus one second later. This is Sun Jun  6 23:59:59 UTC 2179. This
is better than the currently set year 2099.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-davinci.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-davinci.c b/drivers/rtc/rtc-davinci.c
index 3043ffea8f7c..55d826dafe1d 100644
--- a/drivers/rtc/rtc-davinci.c
+++ b/drivers/rtc/rtc-davinci.c
@@ -258,10 +258,6 @@ static int convert2days(u16 *days, struct rtc_time *tm)
 	int i;
 	*days = 0;
 
-	/* epoch == 1900 */
-	if (tm->tm_year < 100 || tm->tm_year > 199)
-		return -EINVAL;
-
 	for (i = 2000; i < 1900 + tm->tm_year; i++)
 		*days += rtc_year_days(1, 12, i);
 
@@ -313,8 +309,7 @@ static int davinci_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	u8 rtc_cctrl;
 	unsigned long flags;
 
-	if (convert2days(&days, tm) < 0)
-		return -EINVAL;
+	convert2days(&days, tm);
 
 	spin_lock_irqsave(&davinci_rtc_lock, flags);
 
@@ -413,8 +408,7 @@ static int davinci_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
 	unsigned long flags;
 	u16 days;
 
-	if (convert2days(&days, &alm->time) < 0)
-		return -EINVAL;
+	convert2days(&days, &alm->time);
 
 	spin_lock_irqsave(&davinci_rtc_lock, flags);
 
@@ -469,6 +463,8 @@ static int __init davinci_rtc_probe(struct platform_device *pdev)
 		return PTR_ERR(davinci_rtc->rtc);
 
 	davinci_rtc->rtc->ops = &davinci_rtc_ops;
+	davinci_rtc->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	davinci_rtc->rtc->range_max = RTC_TIMESTAMP_BEGIN_2000 + (1 << 16) * 86400ULL - 1;
 
 	rtcif_write(davinci_rtc, PRTCIF_INTFLG_RTCSS, PRTCIF_INTFLG);
 	rtcif_write(davinci_rtc, 0, PRTCIF_INTEN);
-- 
2.24.1

