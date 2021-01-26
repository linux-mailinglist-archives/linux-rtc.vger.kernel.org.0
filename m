Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AEE8305CD4
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Jan 2021 14:19:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S313711AbhAZWlF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 26 Jan 2021 17:41:05 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:47651 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728370AbhAZWP1 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 26 Jan 2021 17:15:27 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 733E620003;
        Tue, 26 Jan 2021 22:14:37 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] rtc: rv3028: remove useless warning messages
Date:   Tue, 26 Jan 2021 23:14:34 +0100
Message-Id: <20210126221435.2152339-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210126221435.2152339-1-alexandre.belloni@bootlin.com>
References: <20210126221435.2152339-1-alexandre.belloni@bootlin.com>
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
index 4f8f6092097a..2ee2afa3fa66 100644
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

