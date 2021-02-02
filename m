Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 354C830BD04
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Feb 2021 12:28:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231416AbhBBL1P (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 2 Feb 2021 06:27:15 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:38039 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230518AbhBBL0x (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 2 Feb 2021 06:26:53 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id B7FD82000C;
        Tue,  2 Feb 2021 11:26:01 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] rtc: rv3028: remove useless warning messages
Date:   Tue,  2 Feb 2021 12:25:55 +0100
Message-Id: <20210202112555.3611729-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202112555.3611729-1-alexandre.belloni@bootlin.com>
References: <20210202112555.3611729-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Remove voltage low messages as userspace has a proper way to get the
information and react on it.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-rv3028.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/rtc/rtc-rv3028.c b/drivers/rtc/rtc-rv3028.c
index 6d07f8261c69..0c48d980d06a 100644
--- a/drivers/rtc/rtc-rv3028.c
+++ b/drivers/rtc/rtc-rv3028.c
@@ -265,9 +265,6 @@ static irqreturn_t rv3028_handle_irq(int irq, void *dev_id)
 		return IRQ_NONE;
 	}
 
-	if (status & RV3028_STATUS_PORF)
-		dev_warn(&rv3028->rtc->dev, "Voltage low, data loss detected.\n");
-
 	status &= ~RV3028_STATUS_PORF;
 
 	if (status & RV3028_STATUS_TF) {
@@ -313,10 +310,8 @@ static int rv3028_get_time(struct device *dev, struct rtc_time *tm)
 	if (ret < 0)
 		return ret;
 
-	if (status & RV3028_STATUS_PORF) {
-		dev_warn(dev, "Voltage low, data is invalid.\n");
+	if (status & RV3028_STATUS_PORF)
 		return -EINVAL;
-	}
 
 	ret = regmap_bulk_read(rv3028->regmap, RV3028_SEC, date, sizeof(date));
 	if (ret)
@@ -828,9 +823,6 @@ static int rv3028_probe(struct i2c_client *client)
 	if (ret < 0)
 		return ret;
 
-	if (status & RV3028_STATUS_PORF)
-		dev_warn(&client->dev, "Voltage low, data loss detected.\n");
-
 	if (status & RV3028_STATUS_AF)
 		dev_warn(&client->dev, "An alarm may have been missed.\n");
 
-- 
2.29.2

