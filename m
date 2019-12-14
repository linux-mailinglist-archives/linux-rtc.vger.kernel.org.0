Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA5DC11F4B8
	for <lists+linux-rtc@lfdr.de>; Sat, 14 Dec 2019 23:13:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727128AbfLNWLG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 14 Dec 2019 17:11:06 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:43475 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727110AbfLNWKb (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 14 Dec 2019 17:10:31 -0500
Received: from localhost (lfbn-lyo-1-1913-102.w90-65.abo.wanadoo.fr [90.65.92.102])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 6E073100003;
        Sat, 14 Dec 2019 22:10:29 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 08/16] rtc: rv3029: simplify rv3029_set_alarm
Date:   Sat, 14 Dec 2019 23:10:14 +0100
Message-Id: <20191214221022.622482-9-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191214221022.622482-1-alexandre.belloni@bootlin.com>
References: <20191214221022.622482-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

It is unecessay to test alarm->enabled before calling
rv3029_alarm_irq_enable.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-rv3029c2.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/rtc/rtc-rv3029c2.c b/drivers/rtc/rtc-rv3029c2.c
index 468542e98294..d41be87be4c5 100644
--- a/drivers/rtc/rtc-rv3029c2.c
+++ b/drivers/rtc/rtc-rv3029c2.c
@@ -440,19 +440,7 @@ static int rv3029_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 	if (ret < 0)
 		return ret;
 
-	if (alarm->enabled) {
-		/* enable AIE irq */
-		ret = rv3029_alarm_irq_enable(dev, 1);
-		if (ret)
-			return ret;
-	} else {
-		/* disable AIE irq */
-		ret = rv3029_alarm_irq_enable(dev, 0);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
+	return rv3029_alarm_irq_enable(dev, alarm->enabled);
 }
 
 static int rv3029_set_time(struct device *dev, struct rtc_time *tm)
-- 
2.23.0

