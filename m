Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AB622FC326
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Jan 2021 23:17:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728977AbhASWQw (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 19 Jan 2021 17:16:52 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:46123 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729497AbhASWIN (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 19 Jan 2021 17:08:13 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id AE11A40003;
        Tue, 19 Jan 2021 22:07:04 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 11/14] rtc: rv3029: use rtc_lock/rtc_unlock
Date:   Tue, 19 Jan 2021 23:06:49 +0100
Message-Id: <20210119220653.677750-11-alexandre.belloni@bootlin.com>
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
 drivers/rtc/rtc-rv3029c2.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-rv3029c2.c b/drivers/rtc/rtc-rv3029c2.c
index c1f4c0bba1e5..71102c7fbd7d 100644
--- a/drivers/rtc/rtc-rv3029c2.c
+++ b/drivers/rtc/rtc-rv3029c2.c
@@ -265,24 +265,23 @@ static irqreturn_t rv3029_handle_irq(int irq, void *dev_id)
 {
 	struct device *dev = dev_id;
 	struct rv3029_data *rv3029 = dev_get_drvdata(dev);
-	struct mutex *lock = &rv3029->rtc->ops_lock;
 	unsigned int flags, controls;
 	unsigned long events = 0;
 	int ret;
 
-	mutex_lock(lock);
+	rtc_lock(rv3029->rtc);
 
 	ret = regmap_read(rv3029->regmap, RV3029_IRQ_CTRL, &controls);
 	if (ret) {
 		dev_warn(dev, "Read IRQ Control Register error %d\n", ret);
-		mutex_unlock(lock);
+		rtc_unlock(rv3029->rtc);
 		return IRQ_NONE;
 	}
 
 	ret = regmap_read(rv3029->regmap, RV3029_IRQ_FLAGS, &flags);
 	if (ret) {
 		dev_warn(dev, "Read IRQ Flags Register error %d\n", ret);
-		mutex_unlock(lock);
+		rtc_unlock(rv3029->rtc);
 		return IRQ_NONE;
 	}
 
@@ -297,7 +296,7 @@ static irqreturn_t rv3029_handle_irq(int irq, void *dev_id)
 		regmap_write(rv3029->regmap, RV3029_IRQ_FLAGS, flags);
 		regmap_write(rv3029->regmap, RV3029_IRQ_CTRL, controls);
 	}
-	mutex_unlock(lock);
+	rtc_unlock(rv3029->rtc);
 
 	return IRQ_HANDLED;
 }
-- 
2.29.2

