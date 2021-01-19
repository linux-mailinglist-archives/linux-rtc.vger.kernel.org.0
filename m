Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EC4A2FC325
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Jan 2021 23:17:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728482AbhASWQY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 19 Jan 2021 17:16:24 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:56539 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728404AbhASWIL (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 19 Jan 2021 17:08:11 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 73A9760009;
        Tue, 19 Jan 2021 22:07:05 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 12/14] rtc: rx8010: use rtc_lock/rtc_unlock
Date:   Tue, 19 Jan 2021 23:06:50 +0100
Message-Id: <20210119220653.677750-12-alexandre.belloni@bootlin.com>
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
 drivers/rtc/rtc-rx8010.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-rx8010.c b/drivers/rtc/rtc-rx8010.c
index 1a05e4654290..95e751c8048e 100644
--- a/drivers/rtc/rtc-rx8010.c
+++ b/drivers/rtc/rtc-rx8010.c
@@ -73,11 +73,11 @@ static irqreturn_t rx8010_irq_1_handler(int irq, void *dev_id)
 	struct rx8010_data *rx8010 = i2c_get_clientdata(client);
 	int flagreg, err;
 
-	mutex_lock(&rx8010->rtc->ops_lock);
+	rtc_lock(rx8010->rtc);
 
 	err = regmap_read(rx8010->regs, RX8010_FLAG, &flagreg);
 	if (err) {
-		mutex_unlock(&rx8010->rtc->ops_lock);
+		rtc_unlock(rx8010->rtc);
 		return IRQ_NONE;
 	}
 
@@ -100,7 +100,7 @@ static irqreturn_t rx8010_irq_1_handler(int irq, void *dev_id)
 	}
 
 	err = regmap_write(rx8010->regs, RX8010_FLAG, flagreg);
-	mutex_unlock(&rx8010->rtc->ops_lock);
+	rtc_unlock(rx8010->rtc);
 	return err ? IRQ_NONE : IRQ_HANDLED;
 }
 
-- 
2.29.2

