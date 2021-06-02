Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65A9B39832B
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Jun 2021 09:39:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231796AbhFBHks (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 2 Jun 2021 03:40:48 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2949 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231822AbhFBHko (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 2 Jun 2021 03:40:44 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Fw16F30pVz68Qp;
        Wed,  2 Jun 2021 15:35:49 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 2 Jun 2021 15:38:44 +0800
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
Subject: [PATCH 7/8] rtc: bq32k: use DEVICE_ATTR_RW macro
Date:   Wed, 2 Jun 2021 15:38:19 +0800
Message-ID: <20210602073820.11011-8-thunder.leizhen@huawei.com>
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
 drivers/rtc/rtc-bq32k.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/rtc/rtc-bq32k.c b/drivers/rtc/rtc-bq32k.c
index 2235c968842db76..83c799f59331bff 100644
--- a/drivers/rtc/rtc-bq32k.c
+++ b/drivers/rtc/rtc-bq32k.c
@@ -190,9 +190,9 @@ static int trickle_charger_of_init(struct device *dev, struct device_node *node)
 	return 0;
 }
 
-static ssize_t bq32k_sysfs_show_tricklecharge_bypass(struct device *dev,
-					       struct device_attribute *attr,
-					       char *buf)
+static ssize_t trickle_charge_bypass_show(struct device *dev,
+					  struct device_attribute *attr,
+					  char *buf)
 {
 	int reg, error;
 
@@ -203,9 +203,9 @@ static ssize_t bq32k_sysfs_show_tricklecharge_bypass(struct device *dev,
 	return sprintf(buf, "%d\n", (reg & BQ32K_TCFE) ? 1 : 0);
 }
 
-static ssize_t bq32k_sysfs_store_tricklecharge_bypass(struct device *dev,
-						struct device_attribute *attr,
-						const char *buf, size_t count)
+static ssize_t trickle_charge_bypass_store(struct device *dev,
+					   struct device_attribute *attr,
+					   const char *buf, size_t count)
 {
 	int reg, enable, error;
 
@@ -235,9 +235,7 @@ static ssize_t bq32k_sysfs_store_tricklecharge_bypass(struct device *dev,
 	return count;
 }
 
-static DEVICE_ATTR(trickle_charge_bypass, 0644,
-		   bq32k_sysfs_show_tricklecharge_bypass,
-		   bq32k_sysfs_store_tricklecharge_bypass);
+static DEVICE_ATTR_RW(trickle_charge_bypass);
 
 static int bq32k_sysfs_register(struct device *dev)
 {
-- 
2.26.0.106.g9fadedd


