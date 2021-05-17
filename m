Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91638382A81
	for <lists+linux-rtc@lfdr.de>; Mon, 17 May 2021 13:04:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236584AbhEQLFq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 17 May 2021 07:05:46 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3782 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236514AbhEQLFq (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 17 May 2021 07:05:46 -0400
Received: from dggems706-chm.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FkGQN58p9zmhCW;
        Mon, 17 May 2021 19:01:00 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggems706-chm.china.huawei.com (10.3.19.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 17 May 2021 19:04:28 +0800
Received: from huawei.com (10.175.103.91) by dggpeml500017.china.huawei.com
 (7.185.36.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Mon, 17 May
 2021 19:04:27 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>
CC:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <rdunlap@infradead.org>
Subject: [PATCH -next resend] rtc: m41t80: correct function names in rtc-m41t80.c
Date:   Mon, 17 May 2021 19:06:41 +0800
Message-ID: <20210517110641.473386-1-yangyingliang@huawei.com>
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

Fix the following make W=1 kernel build warnings:

  drivers/rtc/rtc-m41t80.c:811: warning: expecting prototype for wdt_close(). Prototype was for wdt_release() instead
  drivers/rtc/rtc-m41t80.c:830: warning: expecting prototype for notify_sys(). Prototype was for wdt_notify_sys() instead

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/rtc/rtc-m41t80.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
index 89128fc29ccc..269ec4962db3 100644
--- a/drivers/rtc/rtc-m41t80.c
+++ b/drivers/rtc/rtc-m41t80.c
@@ -599,10 +599,8 @@ static unsigned long wdt_is_open;
 static int boot_flag;
 
 /**
- *	wdt_ping:
- *
- *	Reload counter one with the watchdog timeout. We don't bother reloading
- *	the cascade counter.
+ *	wdt_ping - Reload counter one with the watchdog timeout.
+ *	We don't bother reloading the cascade counter.
  */
 static void wdt_ping(void)
 {
@@ -638,9 +636,7 @@ static void wdt_ping(void)
 }
 
 /**
- *	wdt_disable:
- *
- *	disables watchdog.
+ *	wdt_disable - disables watchdog.
  */
 static void wdt_disable(void)
 {
@@ -677,7 +673,7 @@ static void wdt_disable(void)
 }
 
 /**
- *	wdt_write:
+ *	wdt_write - write to watchdog.
  *	@file: file handle to the watchdog
  *	@buf: buffer to write (unused as data does not matter here
  *	@count: count of bytes
@@ -703,7 +699,7 @@ static ssize_t wdt_read(struct file *file, char __user *buf,
 }
 
 /**
- *	wdt_ioctl:
+ *	wdt_ioctl - ioctl handler to set watchdog.
  *	@file: file handle to the device
  *	@cmd: watchdog command
  *	@arg: argument pointer
@@ -778,7 +774,7 @@ static long wdt_unlocked_ioctl(struct file *file, unsigned int cmd,
 }
 
 /**
- *	wdt_open:
+ *	wdt_open - open a watchdog.
  *	@inode: inode of device
  *	@file: file handle to device
  *
@@ -802,7 +798,7 @@ static int wdt_open(struct inode *inode, struct file *file)
 }
 
 /**
- *	wdt_close:
+ *	wdt_release - release a watchdog.
  *	@inode: inode to board
  *	@file: file handle to board
  *
@@ -815,7 +811,7 @@ static int wdt_release(struct inode *inode, struct file *file)
 }
 
 /**
- *	notify_sys:
+ *	wdt_notify_sys - notify to watchdog.
  *	@this: our notifier block
  *	@code: the event being reported
  *	@unused: unused
-- 
2.25.1

