Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06AA917B771
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Mar 2020 08:34:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725927AbgCFHeO (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 6 Mar 2020 02:34:14 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:33007 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725869AbgCFHeO (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 6 Mar 2020 02:34:14 -0500
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id EACAEE000E;
        Fri,  6 Mar 2020 07:34:11 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] rtc: ds1374: fix possible race condition
Date:   Fri,  6 Mar 2020 08:34:01 +0100
Message-Id: <20200306073404.56921-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: yes
X-Spam-Level: **************************
X-GND-Spam-Score: 400
X-GND-Status: SPAM
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The RTC IRQ is requested before the struct rtc_device is allocated,
this may lead to a NULL pointer dereference in the IRQ handler.

To fix this issue, allocating the rtc_device struct before requesting
the RTC IRQ using devm_rtc_allocate_device, and use rtc_register_device
to register the RTC device.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-ds1374.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-ds1374.c b/drivers/rtc/rtc-ds1374.c
index 6e9ddcd03992..cb18a11a3c76 100644
--- a/drivers/rtc/rtc-ds1374.c
+++ b/drivers/rtc/rtc-ds1374.c
@@ -620,6 +620,10 @@ static int ds1374_probe(struct i2c_client *client,
 	if (!ds1374)
 		return -ENOMEM;
 
+	ds1374->rtc = devm_rtc_allocate_device(&client->dev);
+	if (IS_ERR(ds1374->rtc))
+		return PTR_ERR(ds1374->rtc);
+
 	ds1374->client = client;
 	i2c_set_clientdata(client, ds1374);
 
@@ -641,12 +645,11 @@ static int ds1374_probe(struct i2c_client *client,
 		device_set_wakeup_capable(&client->dev, 1);
 	}
 
-	ds1374->rtc = devm_rtc_device_register(&client->dev, client->name,
-						&ds1374_rtc_ops, THIS_MODULE);
-	if (IS_ERR(ds1374->rtc)) {
-		dev_err(&client->dev, "unable to register the class device\n");
-		return PTR_ERR(ds1374->rtc);
-	}
+	ds1374->rtc->ops = &ds1374_rtc_ops;
+
+	ret = rtc_register_device(ds1374->rtc);
+	if (ret)
+		return ret;
 
 #ifdef CONFIG_RTC_DRV_DS1374_WDT
 	save_client = client;
-- 
2.24.1

