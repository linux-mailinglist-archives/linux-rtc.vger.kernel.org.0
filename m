Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BBD1398332
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Jun 2021 09:39:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231872AbhFBHlC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 2 Jun 2021 03:41:02 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2844 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231825AbhFBHko (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 2 Jun 2021 03:40:44 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Fw14B0dJGzWmQH;
        Wed,  2 Jun 2021 15:34:02 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 2 Jun 2021 15:38:44 +0800
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 2 Jun 2021 15:38:44 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Joshua Kinard <kumba@gentoo.org>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-rtc <linux-rtc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 8/8] rtc: ab8500: use DEVICE_ATTR_RW macro
Date:   Wed, 2 Jun 2021 15:38:20 +0800
Message-ID: <20210602073820.11011-9-thunder.leizhen@huawei.com>
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

Use DEVICE_ATTR_RW macro helper instead of plain DEVICE_ATTR, which makes
the code a bit shorter and easier to read.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/rtc/rtc-ab8500.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-ab8500.c b/drivers/rtc/rtc-ab8500.c
index b40048871295d12..540a1a5d42d0b57 100644
--- a/drivers/rtc/rtc-ab8500.c
+++ b/drivers/rtc/rtc-ab8500.c
@@ -274,9 +274,9 @@ static int ab8500_rtc_get_calibration(struct device *dev, int *calibration)
 	return retval;
 }
 
-static ssize_t ab8500_sysfs_store_rtc_calibration(struct device *dev,
-				struct device_attribute *attr,
-				const char *buf, size_t count)
+static ssize_t rtc_calibration_store(struct device *dev,
+				     struct device_attribute *attr,
+				     const char *buf, size_t count)
 {
 	int retval;
 	int calibration = 0;
@@ -291,8 +291,8 @@ static ssize_t ab8500_sysfs_store_rtc_calibration(struct device *dev,
 	return retval ? retval : count;
 }
 
-static ssize_t ab8500_sysfs_show_rtc_calibration(struct device *dev,
-				struct device_attribute *attr, char *buf)
+static ssize_t rtc_calibration_show(struct device *dev,
+				    struct device_attribute *attr, char *buf)
 {
 	int  retval = 0;
 	int  calibration = 0;
@@ -307,9 +307,7 @@ static ssize_t ab8500_sysfs_show_rtc_calibration(struct device *dev,
 	return sprintf(buf, "%d\n", calibration);
 }
 
-static DEVICE_ATTR(rtc_calibration, S_IRUGO | S_IWUSR,
-		   ab8500_sysfs_show_rtc_calibration,
-		   ab8500_sysfs_store_rtc_calibration);
+static DEVICE_ATTR_RW(rtc_calibration);
 
 static struct attribute *ab8500_rtc_attrs[] = {
 	&dev_attr_rtc_calibration.attr,
-- 
2.26.0.106.g9fadedd


