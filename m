Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69A962FC301
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Jan 2021 23:09:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729514AbhASWIN (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 19 Jan 2021 17:08:13 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:58373 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729436AbhASWII (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 19 Jan 2021 17:08:08 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 41DF8C0002;
        Tue, 19 Jan 2021 22:07:02 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 08/14] rtc: m41t80: use rtc_lock/rtc_unlock
Date:   Tue, 19 Jan 2021 23:06:46 +0100
Message-Id: <20210119220653.677750-8-alexandre.belloni@bootlin.com>
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
 drivers/rtc/rtc-m41t80.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
index e3ddd660d68c..ee0c1be0354e 100644
--- a/drivers/rtc/rtc-m41t80.c
+++ b/drivers/rtc/rtc-m41t80.c
@@ -158,21 +158,20 @@ static irqreturn_t m41t80_handle_irq(int irq, void *dev_id)
 {
 	struct i2c_client *client = dev_id;
 	struct m41t80_data *m41t80 = i2c_get_clientdata(client);
-	struct mutex *lock = &m41t80->rtc->ops_lock;
 	unsigned long events = 0;
 	int flags, flags_afe;
 
-	mutex_lock(lock);
+	rtc_lock(m41t80->rtc);
 
 	flags_afe = i2c_smbus_read_byte_data(client, M41T80_REG_ALARM_MON);
 	if (flags_afe < 0) {
-		mutex_unlock(lock);
+		rtc_unlock(m41t80->rtc);
 		return IRQ_NONE;
 	}
 
 	flags = i2c_smbus_read_byte_data(client, M41T80_REG_FLAGS);
 	if (flags <= 0) {
-		mutex_unlock(lock);
+		rtc_unlock(m41t80->rtc);
 		return IRQ_NONE;
 	}
 
@@ -189,7 +188,7 @@ static irqreturn_t m41t80_handle_irq(int irq, void *dev_id)
 					  flags_afe);
 	}
 
-	mutex_unlock(lock);
+	rtc_unlock(m41t80->rtc);
 
 	return IRQ_HANDLED;
 }
-- 
2.29.2

