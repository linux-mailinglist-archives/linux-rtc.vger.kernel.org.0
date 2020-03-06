Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B35CA17B779
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Mar 2020 08:35:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726300AbgCFHfF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 6 Mar 2020 02:35:05 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:47155 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726240AbgCFHfE (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 6 Mar 2020 02:35:04 -0500
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 2C671E0011;
        Fri,  6 Mar 2020 07:35:01 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] rtc: ds1305: switch to rtc_tm_to_time64
Date:   Fri,  6 Mar 2020 08:34:59 +0100
Message-Id: <20200306073459.57197-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200306073459.57197-1-alexandre.belloni@bootlin.com>
References: <20200306073459.57197-1-alexandre.belloni@bootlin.com>
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

Call the 64bit version of rtc_tm to time conversion.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-ds1305.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-ds1305.c b/drivers/rtc/rtc-ds1305.c
index ca55ebab24fb..a3d790889eea 100644
--- a/drivers/rtc/rtc-ds1305.c
+++ b/drivers/rtc/rtc-ds1305.c
@@ -325,17 +325,13 @@ static int ds1305_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
 	u8		buf[1 + DS1305_ALM_LEN];
 
 	/* convert desired alarm to time_t */
-	status = rtc_tm_to_time(&alm->time, &later);
-	if (status < 0)
-		return status;
+	later = rtc_tm_to_time64(&alm->time);
 
 	/* Read current time as time_t */
 	status = ds1305_get_time(dev, &tm);
 	if (status < 0)
 		return status;
-	status = rtc_tm_to_time(&tm, &now);
-	if (status < 0)
-		return status;
+	now = rtc_tm_to_time64(&tm);
 
 	/* make sure alarm fires within the next 24 hours */
 	if (later <= now)
-- 
2.24.1

