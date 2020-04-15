Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0F571AB23E
	for <lists+linux-rtc@lfdr.de>; Wed, 15 Apr 2020 22:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441981AbgDOUCm (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 15 Apr 2020 16:02:42 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:48229 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436756AbgDOUCj (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 15 Apr 2020 16:02:39 -0400
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id D7FF0C0007;
        Wed, 15 Apr 2020 20:02:35 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: 88pm860x: remove useless range check
Date:   Wed, 15 Apr 2020 22:02:26 +0200
Message-Id: <20200415200226.157361-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Because the core is now checking the RTC range, it is unnecessary to check
it again in .set_time/

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-88pm860x.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/rtc/rtc-88pm860x.c b/drivers/rtc/rtc-88pm860x.c
index cc9b14ef90f1..c90457d001e9 100644
--- a/drivers/rtc/rtc-88pm860x.c
+++ b/drivers/rtc/rtc-88pm860x.c
@@ -106,12 +106,6 @@ static int pm860x_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	unsigned char buf[4];
 	unsigned long ticks, base, data;
 
-	if (tm->tm_year > 206) {
-		dev_dbg(info->dev, "Set time %d out of range. "
-			"Please set time between 1970 to 2106.\n",
-			1900 + tm->tm_year);
-		return -EINVAL;
-	}
 	ticks = rtc_tm_to_time64(tm);
 
 	/* load 32-bit read-only counter */
-- 
2.25.2

