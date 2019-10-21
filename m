Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10B68DF22D
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Oct 2019 17:58:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727680AbfJUP6J (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 21 Oct 2019 11:58:09 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:52941 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726332AbfJUP6J (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 21 Oct 2019 11:58:09 -0400
X-Originating-IP: 86.207.98.53
Received: from localhost (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id BA5186000C;
        Mon, 21 Oct 2019 15:58:07 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 1/4] rtc: ab-b5ze-s3: remove .remove
Date:   Mon, 21 Oct 2019 17:58:03 +0200
Message-Id: <20191021155806.3625-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

dpm_sysfs_remove() and device_pm_remove() are already called by
device_del() on device removal so there is no need to call
device_init_wakeup(dev, false) from the driver and it allows to remove the
.remove callback.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-ab-b5ze-s3.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/rtc/rtc-ab-b5ze-s3.c b/drivers/rtc/rtc-ab-b5ze-s3.c
index cdad6f00debf..811fe2005488 100644
--- a/drivers/rtc/rtc-ab-b5ze-s3.c
+++ b/drivers/rtc/rtc-ab-b5ze-s3.c
@@ -900,16 +900,6 @@ static int abb5zes3_probe(struct i2c_client *client,
 	return ret;
 }
 
-static int abb5zes3_remove(struct i2c_client *client)
-{
-	struct abb5zes3_rtc_data *rtc_data = dev_get_drvdata(&client->dev);
-
-	if (rtc_data->irq > 0)
-		device_init_wakeup(&client->dev, false);
-
-	return 0;
-}
-
 #ifdef CONFIG_PM_SLEEP
 static int abb5zes3_rtc_suspend(struct device *dev)
 {
@@ -956,7 +946,6 @@ static struct i2c_driver abb5zes3_driver = {
 		.of_match_table = of_match_ptr(abb5zes3_dt_match),
 	},
 	.probe	  = abb5zes3_probe,
-	.remove	  = abb5zes3_remove,
 	.id_table = abb5zes3_id,
 };
 module_i2c_driver(abb5zes3_driver);
-- 
2.21.0

