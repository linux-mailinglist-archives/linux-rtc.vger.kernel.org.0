Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6A3D2FC31C
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Jan 2021 23:17:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728456AbhASWIK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 19 Jan 2021 17:08:10 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:50035 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729409AbhASWIH (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 19 Jan 2021 17:08:07 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id AB8B060003;
        Tue, 19 Jan 2021 22:07:00 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 06/14] rtc: ds3232: use rtc_lock/rtc_unlock
Date:   Tue, 19 Jan 2021 23:06:44 +0100
Message-Id: <20210119220653.677750-6-alexandre.belloni@bootlin.com>
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
 drivers/rtc/rtc-ds3232.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-ds3232.c b/drivers/rtc/rtc-ds3232.c
index 16b89035d135..535e4a88fbb6 100644
--- a/drivers/rtc/rtc-ds3232.c
+++ b/drivers/rtc/rtc-ds3232.c
@@ -406,11 +406,10 @@ static irqreturn_t ds3232_irq(int irq, void *dev_id)
 {
 	struct device *dev = dev_id;
 	struct ds3232 *ds3232 = dev_get_drvdata(dev);
-	struct mutex *lock = &ds3232->rtc->ops_lock;
 	int ret;
 	int stat, control;
 
-	mutex_lock(lock);
+	rtc_lock(ds3232->rtc);
 
 	ret = regmap_read(ds3232->regmap, DS3232_REG_SR, &stat);
 	if (ret)
@@ -448,7 +447,7 @@ static irqreturn_t ds3232_irq(int irq, void *dev_id)
 	}
 
 unlock:
-	mutex_unlock(lock);
+	rtc_unlock(ds3232->rtc);
 
 	return IRQ_HANDLED;
 }
-- 
2.29.2

