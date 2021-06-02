Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D68CB398334
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Jun 2021 09:39:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231877AbhFBHlC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 2 Jun 2021 03:41:02 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:3382 "EHLO
        szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231838AbhFBHko (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 2 Jun 2021 03:40:44 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Fw15H44YKz64ls;
        Wed,  2 Jun 2021 15:34:59 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 2 Jun 2021 15:38:43 +0800
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 2 Jun 2021 15:38:43 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Joshua Kinard <kumba@gentoo.org>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-rtc <linux-rtc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 6/8] rtc: ds1343: use DEVICE_ATTR_* macro
Date:   Wed, 2 Jun 2021 15:38:18 +0800
Message-ID: <20210602073820.11011-7-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20210602073820.11011-1-thunder.leizhen@huawei.com>
References: <20210602073820.11011-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.174.177.72]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Use DEVICE_ATTR_* macro helper instead of plain DEVICE_ATTR, which makes
the code a bit shorter and easier to read.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/rtc/rtc-ds1343.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/rtc/rtc-ds1343.c b/drivers/rtc/rtc-ds1343.c
index f14ed6c96437b44..ffabb8b69e6d8e6 100644
--- a/drivers/rtc/rtc-ds1343.c
+++ b/drivers/rtc/rtc-ds1343.c
@@ -80,8 +80,8 @@ struct ds1343_priv {
 	int irq;
 };
 
-static ssize_t ds1343_show_glitchfilter(struct device *dev,
-				struct device_attribute *attr, char *buf)
+static ssize_t glitch_filter_show(struct device *dev,
+				  struct device_attribute *attr, char *buf)
 {
 	struct ds1343_priv *priv = dev_get_drvdata(dev->parent);
 	int glitch_filt_status, data;
@@ -99,9 +99,9 @@ static ssize_t ds1343_show_glitchfilter(struct device *dev,
 		return sprintf(buf, "disabled\n");
 }
 
-static ssize_t ds1343_store_glitchfilter(struct device *dev,
-					struct device_attribute *attr,
-					const char *buf, size_t count)
+static ssize_t glitch_filter_store(struct device *dev,
+				   struct device_attribute *attr,
+				   const char *buf, size_t count)
 {
 	struct ds1343_priv *priv = dev_get_drvdata(dev->parent);
 	int data = 0;
@@ -120,8 +120,7 @@ static ssize_t ds1343_store_glitchfilter(struct device *dev,
 	return count;
 }
 
-static DEVICE_ATTR(glitch_filter, S_IRUGO | S_IWUSR, ds1343_show_glitchfilter,
-			ds1343_store_glitchfilter);
+static DEVICE_ATTR_RW(glitch_filter);
 
 static int ds1343_nvram_write(void *priv, unsigned int off, void *val,
 			      size_t bytes)
@@ -139,8 +138,8 @@ static int ds1343_nvram_read(void *priv, unsigned int off, void *val,
 	return regmap_bulk_read(ds1343->map, DS1343_NVRAM + off, val, bytes);
 }
 
-static ssize_t ds1343_show_tricklecharger(struct device *dev,
-				struct device_attribute *attr, char *buf)
+static ssize_t trickle_charger_show(struct device *dev,
+				    struct device_attribute *attr, char *buf)
 {
 	struct ds1343_priv *priv = dev_get_drvdata(dev->parent);
 	int res, data;
@@ -183,7 +182,7 @@ static ssize_t ds1343_show_tricklecharger(struct device *dev,
 	return sprintf(buf, "%s %s\n", diodes, resistors);
 }
 
-static DEVICE_ATTR(trickle_charger, S_IRUGO, ds1343_show_tricklecharger, NULL);
+static DEVICE_ATTR_RO(trickle_charger);
 
 static struct attribute *ds1343_attrs[] = {
 	&dev_attr_glitch_filter.attr,
-- 
2.26.0.106.g9fadedd


