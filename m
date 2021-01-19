Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56BCB2FC303
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Jan 2021 23:09:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729576AbhASWIR (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 19 Jan 2021 17:08:17 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:48775 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729502AbhASWIN (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 19 Jan 2021 17:08:13 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 4ECF6E0002;
        Tue, 19 Jan 2021 22:07:06 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 13/14] rtc: rx8025: use rtc_lock/rtc_unlock
Date:   Tue, 19 Jan 2021 23:06:51 +0100
Message-Id: <20210119220653.677750-13-alexandre.belloni@bootlin.com>
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
 drivers/rtc/rtc-rx8025.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-rx8025.c b/drivers/rtc/rtc-rx8025.c
index a24f85893f90..c914091819ba 100644
--- a/drivers/rtc/rtc-rx8025.c
+++ b/drivers/rtc/rtc-rx8025.c
@@ -142,10 +142,9 @@ static irqreturn_t rx8025_handle_irq(int irq, void *dev_id)
 {
 	struct i2c_client *client = dev_id;
 	struct rx8025_data *rx8025 = i2c_get_clientdata(client);
-	struct mutex *lock = &rx8025->rtc->ops_lock;
 	int status;
 
-	mutex_lock(lock);
+	rtc_lock(rx8025->rtc);
 	status = rx8025_read_reg(client, RX8025_REG_CTRL2);
 	if (status < 0)
 		goto out;
@@ -170,7 +169,7 @@ static irqreturn_t rx8025_handle_irq(int irq, void *dev_id)
 	}
 
 out:
-	mutex_unlock(lock);
+	rtc_unlock(rx8025->rtc);
 
 	return IRQ_HANDLED;
 }
-- 
2.29.2

