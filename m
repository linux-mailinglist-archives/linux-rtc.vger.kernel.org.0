Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FE71398333
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Jun 2021 09:39:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231839AbhFBHlC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 2 Jun 2021 03:41:02 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:3341 "EHLO
        szxga08-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231834AbhFBHko (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 2 Jun 2021 03:40:44 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Fw1484r63z19RJy;
        Wed,  2 Jun 2021 15:34:00 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 2 Jun 2021 15:38:43 +0800
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
Subject: [PATCH 5/8] rtc: ds1685: use DEVICE_ATTR_RO macro
Date:   Wed, 2 Jun 2021 15:38:17 +0800
Message-ID: <20210602073820.11011-6-thunder.leizhen@huawei.com>
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

Use DEVICE_ATTR_RO macro helper instead of plain DEVICE_ATTR, which makes
the code a bit shorter and easier to read.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/rtc/rtc-ds1685.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/rtc/rtc-ds1685.c b/drivers/rtc/rtc-ds1685.c
index 75db7ab654a5ae1..60209320c7ac9ca 100644
--- a/drivers/rtc/rtc-ds1685.c
+++ b/drivers/rtc/rtc-ds1685.c
@@ -975,14 +975,13 @@ static int ds1685_nvram_write(void *priv, unsigned int pos, void *val,
 /* SysFS interface */
 
 /**
- * ds1685_rtc_sysfs_battery_show - sysfs file for main battery status.
+ * battery_show - sysfs file for main battery status.
  * @dev: pointer to device structure.
  * @attr: pointer to device_attribute structure.
  * @buf: pointer to char array to hold the output.
  */
-static ssize_t
-ds1685_rtc_sysfs_battery_show(struct device *dev,
-			      struct device_attribute *attr, char *buf)
+static ssize_t battery_show(struct device *dev,
+			    struct device_attribute *attr, char *buf)
 {
 	struct ds1685_priv *rtc = dev_get_drvdata(dev->parent);
 	u8 ctrld;
@@ -992,17 +991,16 @@ ds1685_rtc_sysfs_battery_show(struct device *dev,
 	return sprintf(buf, "%s\n",
 			(ctrld & RTC_CTRL_D_VRT) ? "ok" : "not ok or N/A");
 }
-static DEVICE_ATTR(battery, S_IRUGO, ds1685_rtc_sysfs_battery_show, NULL);
+static DEVICE_ATTR_RO(battery);
 
 /**
- * ds1685_rtc_sysfs_auxbatt_show - sysfs file for aux battery status.
+ * auxbatt_show - sysfs file for aux battery status.
  * @dev: pointer to device structure.
  * @attr: pointer to device_attribute structure.
  * @buf: pointer to char array to hold the output.
  */
-static ssize_t
-ds1685_rtc_sysfs_auxbatt_show(struct device *dev,
-			      struct device_attribute *attr, char *buf)
+static ssize_t auxbatt_show(struct device *dev,
+			    struct device_attribute *attr, char *buf)
 {
 	struct ds1685_priv *rtc = dev_get_drvdata(dev->parent);
 	u8 ctrl4a;
@@ -1014,17 +1012,16 @@ ds1685_rtc_sysfs_auxbatt_show(struct device *dev,
 	return sprintf(buf, "%s\n",
 			(ctrl4a & RTC_CTRL_4A_VRT2) ? "ok" : "not ok or N/A");
 }
-static DEVICE_ATTR(auxbatt, S_IRUGO, ds1685_rtc_sysfs_auxbatt_show, NULL);
+static DEVICE_ATTR_RO(auxbatt);
 
 /**
- * ds1685_rtc_sysfs_serial_show - sysfs file for silicon serial number.
+ * serial_show - sysfs file for silicon serial number.
  * @dev: pointer to device structure.
  * @attr: pointer to device_attribute structure.
  * @buf: pointer to char array to hold the output.
  */
-static ssize_t
-ds1685_rtc_sysfs_serial_show(struct device *dev,
-			     struct device_attribute *attr, char *buf)
+static ssize_t serial_show(struct device *dev,
+			   struct device_attribute *attr, char *buf)
 {
 	struct ds1685_priv *rtc = dev_get_drvdata(dev->parent);
 	u8 ssn[8];
@@ -1035,7 +1032,7 @@ ds1685_rtc_sysfs_serial_show(struct device *dev,
 
 	return sprintf(buf, "%8phC\n", ssn);
 }
-static DEVICE_ATTR(serial, S_IRUGO, ds1685_rtc_sysfs_serial_show, NULL);
+static DEVICE_ATTR_RO(serial);
 
 /*
  * struct ds1685_rtc_sysfs_misc_attrs - list for misc RTC features.
-- 
2.26.0.106.g9fadedd


