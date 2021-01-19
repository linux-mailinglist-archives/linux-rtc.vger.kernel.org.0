Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5FD32FC302
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Jan 2021 23:09:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729544AbhASWIN (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 19 Jan 2021 17:08:13 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:59329 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729246AbhASWIH (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 19 Jan 2021 17:08:07 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 585C320004;
        Tue, 19 Jan 2021 22:06:56 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 01/14] rtc: ac100: use rtc_lock/rtc_unlock
Date:   Tue, 19 Jan 2021 23:06:39 +0100
Message-Id: <20210119220653.677750-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Avoid accessing directly rtc->ops_lock and use the RTC core helpers.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-ac100.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-ac100.c b/drivers/rtc/rtc-ac100.c
index 1ddbef99e38f..92f690542ad2 100644
--- a/drivers/rtc/rtc-ac100.c
+++ b/drivers/rtc/rtc-ac100.c
@@ -528,7 +528,7 @@ static irqreturn_t ac100_rtc_irq(int irq, void *data)
 	unsigned int val = 0;
 	int ret;
 
-	mutex_lock(&chip->rtc->ops_lock);
+	rtc_lock(&chip->rtc);
 
 	/* read status */
 	ret = regmap_read(regmap, AC100_ALM_INT_STA, &val);
@@ -551,7 +551,7 @@ static irqreturn_t ac100_rtc_irq(int irq, void *data)
 	}
 
 out:
-	mutex_unlock(&chip->rtc->ops_lock);
+	rtc_unlock(&chip->rtc);
 	return IRQ_HANDLED;
 }
 
-- 
2.29.2

