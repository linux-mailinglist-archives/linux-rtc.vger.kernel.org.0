Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B82EC39832E
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Jun 2021 09:39:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231860AbhFBHk7 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 2 Jun 2021 03:40:59 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:3340 "EHLO
        szxga08-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231827AbhFBHko (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 2 Jun 2021 03:40:44 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Fw1470qgcz19S48;
        Wed,  2 Jun 2021 15:33:59 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 2 Jun 2021 15:38:41 +0800
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 2 Jun 2021 15:38:41 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Joshua Kinard <kumba@gentoo.org>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-rtc <linux-rtc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 2/8] rtc: rx8025: use DEVICE_ATTR_RW macro
Date:   Wed, 2 Jun 2021 15:38:14 +0800
Message-ID: <20210602073820.11011-3-thunder.leizhen@huawei.com>
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
 drivers/rtc/rtc-rx8025.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/rtc/rtc-rx8025.c b/drivers/rtc/rtc-rx8025.c
index c914091819ba7da..73973886db4441d 100644
--- a/drivers/rtc/rtc-rx8025.c
+++ b/drivers/rtc/rtc-rx8025.c
@@ -458,9 +458,9 @@ static int rx8025_set_clock_adjust(struct device *dev, int adj)
 	return 0;
 }
 
-static ssize_t rx8025_sysfs_show_clock_adjust(struct device *dev,
-					      struct device_attribute *attr,
-					      char *buf)
+static ssize_t clock_adjust_ppb_show(struct device *dev,
+				     struct device_attribute *attr,
+				     char *buf)
 {
 	int err, adj;
 
@@ -471,9 +471,9 @@ static ssize_t rx8025_sysfs_show_clock_adjust(struct device *dev,
 	return sprintf(buf, "%d\n", adj);
 }
 
-static ssize_t rx8025_sysfs_store_clock_adjust(struct device *dev,
-					       struct device_attribute *attr,
-					       const char *buf, size_t count)
+static ssize_t clock_adjust_ppb_store(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buf, size_t count)
 {
 	int adj, err;
 
@@ -485,9 +485,7 @@ static ssize_t rx8025_sysfs_store_clock_adjust(struct device *dev,
 	return err ? err : count;
 }
 
-static DEVICE_ATTR(clock_adjust_ppb, S_IRUGO | S_IWUSR,
-		   rx8025_sysfs_show_clock_adjust,
-		   rx8025_sysfs_store_clock_adjust);
+static DEVICE_ATTR_RW(clock_adjust_ppb);
 
 static int rx8025_sysfs_register(struct device *dev)
 {
-- 
2.26.0.106.g9fadedd


