Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C034B39832D
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Jun 2021 09:39:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231846AbhFBHk6 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 2 Jun 2021 03:40:58 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:3339 "EHLO
        szxga08-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231826AbhFBHko (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 2 Jun 2021 03:40:44 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Fw14647J7z19Rl6;
        Wed,  2 Jun 2021 15:33:58 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 2 Jun 2021 15:38:41 +0800
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 2 Jun 2021 15:38:40 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Joshua Kinard <kumba@gentoo.org>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-rtc <linux-rtc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/8] rtc: x1205: use DEVICE_ATTR_RO macro
Date:   Wed, 2 Jun 2021 15:38:13 +0800
Message-ID: <20210602073820.11011-2-thunder.leizhen@huawei.com>
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
 drivers/rtc/rtc-x1205.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-x1205.c b/drivers/rtc/rtc-x1205.c
index d1d5a44d9122ad9..351e4725a7a5439 100644
--- a/drivers/rtc/rtc-x1205.c
+++ b/drivers/rtc/rtc-x1205.c
@@ -566,8 +566,8 @@ static const struct rtc_class_ops x1205_rtc_ops = {
 	.set_alarm	= x1205_rtc_set_alarm,
 };
 
-static ssize_t x1205_sysfs_show_atrim(struct device *dev,
-				struct device_attribute *attr, char *buf)
+static ssize_t atrim_show(struct device *dev,
+			  struct device_attribute *attr, char *buf)
 {
 	int err, atrim;
 
@@ -577,10 +577,10 @@ static ssize_t x1205_sysfs_show_atrim(struct device *dev,
 
 	return sprintf(buf, "%d.%02d pF\n", atrim / 1000, atrim % 1000);
 }
-static DEVICE_ATTR(atrim, S_IRUGO, x1205_sysfs_show_atrim, NULL);
+static DEVICE_ATTR_RO(atrim);
 
-static ssize_t x1205_sysfs_show_dtrim(struct device *dev,
-				struct device_attribute *attr, char *buf)
+static ssize_t dtrim_show(struct device *dev,
+			  struct device_attribute *attr, char *buf)
 {
 	int err, dtrim;
 
@@ -590,7 +590,7 @@ static ssize_t x1205_sysfs_show_dtrim(struct device *dev,
 
 	return sprintf(buf, "%d ppm\n", dtrim);
 }
-static DEVICE_ATTR(dtrim, S_IRUGO, x1205_sysfs_show_dtrim, NULL);
+static DEVICE_ATTR_RO(dtrim);
 
 static int x1205_sysfs_register(struct device *dev)
 {
-- 
2.26.0.106.g9fadedd


