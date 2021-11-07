Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39FB044768A
	for <lists+linux-rtc@lfdr.de>; Sun,  7 Nov 2021 23:55:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236763AbhKGW56 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 7 Nov 2021 17:57:58 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:38423 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236758AbhKGW5z (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 7 Nov 2021 17:57:55 -0500
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id E1FE7100007;
        Sun,  7 Nov 2021 22:55:10 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 11/12] rtc: rx8025: use rtc_add_group
Date:   Sun,  7 Nov 2021 23:54:56 +0100
Message-Id: <20211107225458.111068-11-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211107225458.111068-1-alexandre.belloni@bootlin.com>
References: <20211107225458.111068-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Remove open coded sysfs registration by using rtc_add_group.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-rx8025.c | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/rtc/rtc-rx8025.c b/drivers/rtc/rtc-rx8025.c
index fcfdefe94a7c..c5b3814f8c8e 100644
--- a/drivers/rtc/rtc-rx8025.c
+++ b/drivers/rtc/rtc-rx8025.c
@@ -502,15 +502,14 @@ static DEVICE_ATTR(clock_adjust_ppb, S_IRUGO | S_IWUSR,
 		   rx8025_sysfs_show_clock_adjust,
 		   rx8025_sysfs_store_clock_adjust);
 
-static int rx8025_sysfs_register(struct device *dev)
-{
-	return device_create_file(dev, &dev_attr_clock_adjust_ppb);
-}
+static struct attribute *rx8025_attrs[] = {
+	&dev_attr_clock_adjust_ppb.attr,
+	NULL
+};
 
-static void rx8025_sysfs_unregister(struct device *dev)
-{
-	device_remove_file(dev, &dev_attr_clock_adjust_ppb);
-}
+static const struct attribute_group rx8025_attr_group = {
+	.attrs	= rx8025_attrs,
+};
 
 static int rx8025_probe(struct i2c_client *client,
 			const struct i2c_device_id *id)
@@ -562,18 +561,11 @@ static int rx8025_probe(struct i2c_client *client,
 	set_bit(RTC_FEATURE_ALARM_RES_MINUTE, rx8025->rtc->features);
 	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rx8025->rtc->features);
 
-	err = devm_rtc_register_device(rx8025->rtc);
+	err = rtc_add_group(rx8025->rtc, &rx8025_attr_group);
 	if (err)
 		return err;
 
-	err = rx8025_sysfs_register(&client->dev);
-	return err;
-}
-
-static int rx8025_remove(struct i2c_client *client)
-{
-	rx8025_sysfs_unregister(&client->dev);
-	return 0;
+	return devm_rtc_register_device(rx8025->rtc);
 }
 
 static struct i2c_driver rx8025_driver = {
@@ -581,7 +573,6 @@ static struct i2c_driver rx8025_driver = {
 		.name = "rtc-rx8025",
 	},
 	.probe		= rx8025_probe,
-	.remove		= rx8025_remove,
 	.id_table	= rx8025_id,
 };
 
-- 
2.31.1

