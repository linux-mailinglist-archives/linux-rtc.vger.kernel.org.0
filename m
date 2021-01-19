Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0DC52FC342
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Jan 2021 23:22:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729771AbhASWWN (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 19 Jan 2021 17:22:13 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:42479 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729427AbhASWIH (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 19 Jan 2021 17:08:07 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 6FFD620009;
        Tue, 19 Jan 2021 22:07:01 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 07/14] rtc: hym8563: use rtc_lock/rtc_unlock
Date:   Tue, 19 Jan 2021 23:06:45 +0100
Message-Id: <20210119220653.677750-7-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119220653.677750-1-alexandre.belloni@bootlin.com>
References: <20210119220653.677750-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Avoid accessing directly rtc->ops_lock and use the RTC core helpers.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-hym8563.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-hym8563.c b/drivers/rtc/rtc-hym8563.c
index 24e0095be058..0751cae27285 100644
--- a/drivers/rtc/rtc-hym8563.c
+++ b/drivers/rtc/rtc-hym8563.c
@@ -428,10 +428,9 @@ static irqreturn_t hym8563_irq(int irq, void *dev_id)
 {
 	struct hym8563 *hym8563 = (struct hym8563 *)dev_id;
 	struct i2c_client *client = hym8563->client;
-	struct mutex *lock = &hym8563->rtc->ops_lock;
 	int data, ret;
 
-	mutex_lock(lock);
+	rtc_lock(hym8563->rtc);
 
 	/* Clear the alarm flag */
 
@@ -451,7 +450,7 @@ static irqreturn_t hym8563_irq(int irq, void *dev_id)
 	}
 
 out:
-	mutex_unlock(lock);
+	rtc_unlock(hym8563->rtc);
 	return IRQ_HANDLED;
 }
 
-- 
2.29.2

