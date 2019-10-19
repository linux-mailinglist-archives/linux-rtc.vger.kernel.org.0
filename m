Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C790DDB08
	for <lists+linux-rtc@lfdr.de>; Sat, 19 Oct 2019 22:50:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726541AbfJSUuM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 19 Oct 2019 16:50:12 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:56831 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726146AbfJSUtr (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 19 Oct 2019 16:49:47 -0400
Received: from localhost (lfbn-lyo-1-146-42.w86-202.abo.wanadoo.fr [86.202.229.42])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 29F64240003;
        Sat, 19 Oct 2019 20:49:45 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 4/9] rtc: ds1343: use rtc_add_group
Date:   Sat, 19 Oct 2019 22:49:36 +0200
Message-Id: <20191019204941.6203-4-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191019204941.6203-1-alexandre.belloni@bootlin.com>
References: <20191019204941.6203-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Use rtc_add_group to add the sysfs group in a race free manner.
This has the side effect of moving the files to their proper location.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-ds1343.c | 47 ++++++++++++++--------------------------
 1 file changed, 16 insertions(+), 31 deletions(-)

diff --git a/drivers/rtc/rtc-ds1343.c b/drivers/rtc/rtc-ds1343.c
index 8a4f1fbb57fd..ec8d1e82d7ac 100644
--- a/drivers/rtc/rtc-ds1343.c
+++ b/drivers/rtc/rtc-ds1343.c
@@ -90,7 +90,7 @@ struct ds1343_priv {
 static ssize_t ds1343_show_glitchfilter(struct device *dev,
 				struct device_attribute *attr, char *buf)
 {
-	struct ds1343_priv *priv = dev_get_drvdata(dev);
+	struct ds1343_priv *priv = dev_get_drvdata(dev->parent);
 	int glitch_filt_status, data;
 
 	regmap_read(priv->map, DS1343_CONTROL_REG, &data);
@@ -107,7 +107,7 @@ static ssize_t ds1343_store_glitchfilter(struct device *dev,
 					struct device_attribute *attr,
 					const char *buf, size_t count)
 {
-	struct ds1343_priv *priv = dev_get_drvdata(dev);
+	struct ds1343_priv *priv = dev_get_drvdata(dev->parent);
 	int data;
 
 	regmap_read(priv->map, DS1343_CONTROL_REG, &data);
@@ -148,7 +148,7 @@ static int ds1343_nvram_read(void *priv, unsigned int off, void *val,
 static ssize_t ds1343_show_tricklecharger(struct device *dev,
 				struct device_attribute *attr, char *buf)
 {
-	struct ds1343_priv *priv = dev_get_drvdata(dev);
+	struct ds1343_priv *priv = dev_get_drvdata(dev->parent);
 	int data;
 	char *diodes = "disabled", *resistors = " ";
 
@@ -189,28 +189,15 @@ static ssize_t ds1343_show_tricklecharger(struct device *dev,
 
 static DEVICE_ATTR(trickle_charger, S_IRUGO, ds1343_show_tricklecharger, NULL);
 
-static int ds1343_sysfs_register(struct device *dev)
-{
-	int err;
-
-	err = device_create_file(dev, &dev_attr_glitch_filter);
-	if (err)
-		return err;
-
-	err = device_create_file(dev, &dev_attr_trickle_charger);
-	if (!err)
-		return 0;
-
-	device_remove_file(dev, &dev_attr_glitch_filter);
-
-	return err;
-}
+static struct attribute *ds1343_attrs[] = {
+	&dev_attr_glitch_filter.attr,
+	&dev_attr_trickle_charger.attr,
+	NULL
+};
 
-static void ds1343_sysfs_unregister(struct device *dev)
-{
-	device_remove_file(dev, &dev_attr_glitch_filter);
-	device_remove_file(dev, &dev_attr_trickle_charger);
-}
+static const struct attribute_group ds1343_attr_group = {
+	.attrs  = ds1343_attrs,
+};
 
 static int ds1343_read_time(struct device *dev, struct rtc_time *dt)
 {
@@ -474,6 +461,11 @@ static int ds1343_probe(struct spi_device *spi)
 	priv->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
 	priv->rtc->range_max = RTC_TIMESTAMP_END_2099;
 
+	res = rtc_add_group(priv->rtc, &ds1343_attr_group);
+	if (res)
+		dev_err(&spi->dev,
+			"unable to create sysfs entries for rtc ds1343\n");
+
 	res = rtc_register_device(priv->rtc);
 	if (res)
 		return res;
@@ -497,11 +489,6 @@ static int ds1343_probe(struct spi_device *spi)
 		}
 	}
 
-	res = ds1343_sysfs_register(&spi->dev);
-	if (res)
-		dev_err(&spi->dev,
-			"unable to create sysfs entries for rtc ds1343\n");
-
 	return 0;
 }
 
@@ -521,8 +508,6 @@ static int ds1343_remove(struct spi_device *spi)
 
 	spi_set_drvdata(spi, NULL);
 
-	ds1343_sysfs_unregister(&spi->dev);
-
 	return 0;
 }
 
-- 
2.21.0

