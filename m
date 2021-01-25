Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 478EB302EBC
	for <lists+linux-rtc@lfdr.de>; Mon, 25 Jan 2021 23:15:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732105AbhAYWO5 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 25 Jan 2021 17:14:57 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:38517 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732125AbhAYWO4 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 25 Jan 2021 17:14:56 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id A10D0E0002;
        Mon, 25 Jan 2021 22:14:08 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] rtc: ac100: use rtc_lock/rtc_unlock
Date:   Mon, 25 Jan 2021 23:14:02 +0100
Message-Id: <20210125221402.1958484-1-alexandre.belloni@bootlin.com>
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
 drivers/rtc/rtc-ac100.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-ac100.c b/drivers/rtc/rtc-ac100.c
index 1ddbef99e38f..66783cb5e711 100644
--- a/drivers/rtc/rtc-ac100.c
+++ b/drivers/rtc/rtc-ac100.c
@@ -528,7 +528,7 @@ static irqreturn_t ac100_rtc_irq(int irq, void *data)
 	unsigned int val = 0;
 	int ret;
 
-	mutex_lock(&chip->rtc->ops_lock);
+	rtc_lock(chip->rtc);
 
 	/* read status */
 	ret = regmap_read(regmap, AC100_ALM_INT_STA, &val);
@@ -551,7 +551,7 @@ static irqreturn_t ac100_rtc_irq(int irq, void *data)
 	}
 
 out:
-	mutex_unlock(&chip->rtc->ops_lock);
+	rtc_unlock(chip->rtc);
 	return IRQ_HANDLED;
 }
 
-- 
2.29.2

