Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 248AA17B33C
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Mar 2020 01:57:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbgCFA5g (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 5 Mar 2020 19:57:36 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:55323 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726413AbgCFA5f (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 5 Mar 2020 19:57:35 -0500
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id C74AB240005;
        Fri,  6 Mar 2020 00:57:33 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] rtc: pl030: remove useless invalid alarm handling
Date:   Fri,  6 Mar 2020 01:57:29 +0100
Message-Id: <20200306005730.38268-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200306005730.38268-1-alexandre.belloni@bootlin.com>
References: <20200306005730.38268-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The core will never pass an invalid alarm to .set_alarm, it is not
necessary to check for its validity.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pl030.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-pl030.c b/drivers/rtc/rtc-pl030.c
index 30aa813f96c0..55776e8fa87c 100644
--- a/drivers/rtc/rtc-pl030.c
+++ b/drivers/rtc/rtc-pl030.c
@@ -46,12 +46,7 @@ static int pl030_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	unsigned long time;
 	int ret;
 
-	/*
-	 * At the moment, we can only deal with non-wildcarded alarm times.
-	 */
-	ret = rtc_valid_tm(&alrm->time);
-	if (ret == 0)
-		ret = rtc_tm_to_time(&alrm->time, &time);
+	ret = rtc_tm_to_time(&alrm->time, &time);
 	if (ret == 0)
 		writel(time, rtc->base + RTC_MR);
 	return ret;
-- 
2.24.1

