Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D554B17B782
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Mar 2020 08:36:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725927AbgCFHgA (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 6 Mar 2020 02:36:00 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:51451 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725869AbgCFHf4 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 6 Mar 2020 02:35:56 -0500
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id D6CE3240003;
        Fri,  6 Mar 2020 07:35:54 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Support Opensource <support.opensource@diasemi.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] rtc: da9052: switch to rtc_time64_to_tm/rtc_tm_to_time64
Date:   Fri,  6 Mar 2020 08:35:47 +0100
Message-Id: <20200306073548.57579-3-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200306073548.57579-1-alexandre.belloni@bootlin.com>
References: <20200306073548.57579-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: yes
X-Spam-Level: **************************
X-GND-Spam-Score: 400
X-GND-Status: SPAM
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Call the 64bit versions of rtc_tm time conversion.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-da9052.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-da9052.c b/drivers/rtc/rtc-da9052.c
index 27cde834a1b8..1c567f86ee30 100644
--- a/drivers/rtc/rtc-da9052.c
+++ b/drivers/rtc/rtc-da9052.c
@@ -103,13 +103,11 @@ static int da9052_set_alarm(struct da9052_rtc *rtc, struct rtc_time *rtc_tm)
 	int ret;
 	uint8_t v[3];
 
-	ret = rtc_tm_to_time(rtc_tm, &alm_time);
-	if (ret != 0)
-		return ret;
+	alm_time = rtc_tm_to_time64(rtc_tm);
 
 	if (rtc_tm->tm_sec > 0) {
 		alm_time += 60 - rtc_tm->tm_sec;
-		rtc_time_to_tm(alm_time, rtc_tm);
+		rtc_time64_to_tm(alm_time, rtc_tm);
 	}
 	BUG_ON(rtc_tm->tm_sec); /* it will cause repeated irqs if not zero */
 
-- 
2.24.1

