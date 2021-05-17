Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0349F382395
	for <lists+linux-rtc@lfdr.de>; Mon, 17 May 2021 06:56:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231887AbhEQE6B (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 17 May 2021 00:58:01 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2983 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229625AbhEQE6B (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 17 May 2021 00:58:01 -0400
Received: from dggems702-chm.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Fk6G42c6czQpGp;
        Mon, 17 May 2021 12:53:16 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggems702-chm.china.huawei.com (10.3.19.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 17 May 2021 12:56:44 +0800
Received: from huawei.com (10.175.103.91) by dggpeml500017.china.huawei.com
 (7.185.36.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Mon, 17 May
 2021 12:56:43 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>
CC:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>
Subject: [PATCH -next] rtc: sysfs: Correct function name hctosys_show()
Date:   Mon, 17 May 2021 12:59:01 +0800
Message-ID: <20210517045901.3461800-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500017.china.huawei.com (7.185.36.243)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Fix the following make W=1 kernel build warning:

  drivers/rtc/sysfs.c:115: warning: expecting prototype for rtc_sysfs_show_hctosys(). Prototype was for hctosys_show() instead

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/rtc/sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/sysfs.c b/drivers/rtc/sysfs.c
index 74026f67fdfb..00f1945bcb7e 100644
--- a/drivers/rtc/sysfs.c
+++ b/drivers/rtc/sysfs.c
@@ -102,7 +102,7 @@ max_user_freq_store(struct device *dev, struct device_attribute *attr,
 static DEVICE_ATTR_RW(max_user_freq);
 
 /**
- * rtc_sysfs_show_hctosys - indicate if the given RTC set the system time
+ * hctosys_show - indicate if the given RTC set the system time
  * @dev: The device that the attribute belongs to.
  * @attr: The attribute being read.
  * @buf: The result buffer.
-- 
2.25.1

