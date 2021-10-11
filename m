Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E940428D97
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Oct 2021 15:13:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235534AbhJKNP3 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 11 Oct 2021 09:15:29 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:13719 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231538AbhJKNP1 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 11 Oct 2021 09:15:27 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HSfMV6DbvzWZ7G;
        Mon, 11 Oct 2021 21:11:50 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Mon, 11 Oct 2021 21:13:25 +0800
Received: from huawei.com (10.175.103.91) by dggpeml500017.china.huawei.com
 (7.185.36.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 11 Oct
 2021 21:13:25 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>
CC:     <alexandre.belloni@bootlin.com>, <a.zummo@towertech.it>
Subject: [PATCH] rtc: class: don't call cdev_device_del() when cdev_device_add() failed
Date:   Mon, 11 Oct 2021 21:21:14 +0800
Message-ID: <20211011132114.3663509-1-yangyingliang@huawei.com>
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

I got a null-ptr-deref report when doing fault injection test:

general protection fault, probably for non-canonical address 0xdffffc0000000022: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000110-0x0000000000000117]
RIP: 0010:device_del+0x132/0xdc0
Call Trace:
 cdev_device_del+0x1a/0x80
 devm_rtc_unregister_device+0x37/0x80
 release_nodes+0xc3/0x3b0

If cdev_device_add() fails, 'dev->p' is not set, it causes
null-ptr-deref when calling cdev_device_del(). Registering
character device is optional, we don't return error code
here, so introduce a new flag 'RTC_NO_CDEV' to indicate
if it has character device, cdev_device_del() is called
when this bit is not set.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/rtc/class.c | 9 ++++++---
 include/linux/rtc.h | 1 +
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/class.c b/drivers/rtc/class.c
index 1f18c39a4b82..dbccd71589b9 100644
--- a/drivers/rtc/class.c
+++ b/drivers/rtc/class.c
@@ -334,7 +334,8 @@ static void devm_rtc_unregister_device(void *data)
 	 * letting any rtc_class_open() users access it again
 	 */
 	rtc_proc_del_device(rtc);
-	cdev_device_del(&rtc->char_dev, &rtc->dev);
+	if (!test_bit(RTC_NO_CDEV, &rtc->flags))
+		cdev_device_del(&rtc->char_dev, &rtc->dev);
 	rtc->ops = NULL;
 	mutex_unlock(&rtc->ops_lock);
 }
@@ -399,12 +400,14 @@ int __devm_rtc_register_device(struct module *owner, struct rtc_device *rtc)
 	rtc_dev_prepare(rtc);
 
 	err = cdev_device_add(&rtc->char_dev, &rtc->dev);
-	if (err)
+	if (err) {
+		set_bit(RTC_NO_CDEV, &rtc->flags);
 		dev_warn(rtc->dev.parent, "failed to add char device %d:%d\n",
 			 MAJOR(rtc->dev.devt), rtc->id);
-	else
+	} else {
 		dev_dbg(rtc->dev.parent, "char device (%d:%d)\n",
 			MAJOR(rtc->dev.devt), rtc->id);
+	}
 
 	rtc_proc_add_device(rtc);
 
diff --git a/include/linux/rtc.h b/include/linux/rtc.h
index bd611e26291d..354e0843ab17 100644
--- a/include/linux/rtc.h
+++ b/include/linux/rtc.h
@@ -80,6 +80,7 @@ struct rtc_timer {
 
 /* flags */
 #define RTC_DEV_BUSY 0
+#define RTC_NO_CDEV  1
 
 struct rtc_device {
 	struct device dev;
-- 
2.25.1

