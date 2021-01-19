Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 605882FC31D
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Jan 2021 23:17:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729580AbhASWIO (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 19 Jan 2021 17:08:14 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:13287 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729322AbhASWIH (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 19 Jan 2021 17:08:07 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id D2413240006;
        Tue, 19 Jan 2021 22:06:58 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 04/14] rtc: ds1307: use rtc_lock/rtc_unlock
Date:   Tue, 19 Jan 2021 23:06:42 +0100
Message-Id: <20210119220653.677750-4-alexandre.belloni@bootlin.com>
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
 drivers/rtc/rtc-ds1307.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index 183cf7c01364..cd8e438bc9c4 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -558,11 +558,10 @@ static u8 do_trickle_setup_rx8130(struct ds1307 *ds1307, u32 ohms, bool diode)
 static irqreturn_t rx8130_irq(int irq, void *dev_id)
 {
 	struct ds1307           *ds1307 = dev_id;
-	struct mutex            *lock = &ds1307->rtc->ops_lock;
 	u8 ctl[3];
 	int ret;
 
-	mutex_lock(lock);
+	rtc_lock(ds1307->rtc);
 
 	/* Read control registers. */
 	ret = regmap_bulk_read(ds1307->regmap, RX8130_REG_EXTENSION, ctl,
@@ -582,7 +581,7 @@ static irqreturn_t rx8130_irq(int irq, void *dev_id)
 	rtc_update_irq(ds1307->rtc, 1, RTC_AF | RTC_IRQF);
 
 out:
-	mutex_unlock(lock);
+	rtc_unlock(ds1307->rtc);
 
 	return IRQ_HANDLED;
 }
-- 
2.29.2

