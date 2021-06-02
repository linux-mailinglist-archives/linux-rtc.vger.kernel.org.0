Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E89B398330
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Jun 2021 09:39:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231822AbhFBHlB (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 2 Jun 2021 03:41:01 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2948 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231819AbhFBHko (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 2 Jun 2021 03:40:44 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Fw16B2q7zz685g;
        Wed,  2 Jun 2021 15:35:46 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 2 Jun 2021 15:38:42 +0800
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 2 Jun 2021 15:38:42 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Joshua Kinard <kumba@gentoo.org>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-rtc <linux-rtc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 4/8] rtc: isl1208: use DEVICE_ATTR_* macro
Date:   Wed, 2 Jun 2021 15:38:16 +0800
Message-ID: <20210602073820.11011-5-thunder.leizhen@huawei.com>
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
 drivers/rtc/rtc-isl1208.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/rtc/rtc-isl1208.c b/drivers/rtc/rtc-isl1208.c
index 182dfa605515572..1e0069ab9769647 100644
--- a/drivers/rtc/rtc-isl1208.c
+++ b/drivers/rtc/rtc-isl1208.c
@@ -654,9 +654,8 @@ static const struct rtc_class_ops isl1208_rtc_ops = {
 
 /* sysfs interface */
 
-static ssize_t
-isl1208_sysfs_show_atrim(struct device *dev,
-			 struct device_attribute *attr, char *buf)
+static ssize_t atrim_show(struct device *dev,
+			  struct device_attribute *attr, char *buf)
 {
 	int atr = isl1208_i2c_get_atr(to_i2c_client(dev->parent));
 	if (atr < 0)
@@ -665,11 +664,10 @@ isl1208_sysfs_show_atrim(struct device *dev,
 	return sprintf(buf, "%d.%.2d pF\n", atr >> 2, (atr & 0x3) * 25);
 }
 
-static DEVICE_ATTR(atrim, S_IRUGO, isl1208_sysfs_show_atrim, NULL);
+static DEVICE_ATTR_RO(atrim);
 
-static ssize_t
-isl1208_sysfs_show_dtrim(struct device *dev,
-			 struct device_attribute *attr, char *buf)
+static ssize_t dtrim_show(struct device *dev,
+			  struct device_attribute *attr, char *buf)
 {
 	int dtr = isl1208_i2c_get_dtr(to_i2c_client(dev->parent));
 	if (dtr < 0)
@@ -678,11 +676,10 @@ isl1208_sysfs_show_dtrim(struct device *dev,
 	return sprintf(buf, "%d ppm\n", dtr - 100);
 }
 
-static DEVICE_ATTR(dtrim, S_IRUGO, isl1208_sysfs_show_dtrim, NULL);
+static DEVICE_ATTR_RO(dtrim);
 
-static ssize_t
-isl1208_sysfs_show_usr(struct device *dev,
-		       struct device_attribute *attr, char *buf)
+static ssize_t usr_show(struct device *dev,
+			struct device_attribute *attr, char *buf)
 {
 	int usr = isl1208_i2c_get_usr(to_i2c_client(dev->parent));
 	if (usr < 0)
@@ -691,10 +688,9 @@ isl1208_sysfs_show_usr(struct device *dev,
 	return sprintf(buf, "0x%.4x\n", usr);
 }
 
-static ssize_t
-isl1208_sysfs_store_usr(struct device *dev,
-			struct device_attribute *attr,
-			const char *buf, size_t count)
+static ssize_t usr_store(struct device *dev,
+			 struct device_attribute *attr,
+			 const char *buf, size_t count)
 {
 	int usr = -1;
 
@@ -715,8 +711,7 @@ isl1208_sysfs_store_usr(struct device *dev,
 	return count;
 }
 
-static DEVICE_ATTR(usr, S_IRUGO | S_IWUSR, isl1208_sysfs_show_usr,
-		   isl1208_sysfs_store_usr);
+static DEVICE_ATTR_RW(usr);
 
 static struct attribute *isl1208_rtc_attrs[] = {
 	&dev_attr_atrim.attr,
-- 
2.26.0.106.g9fadedd


