Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2725A382393
	for <lists+linux-rtc@lfdr.de>; Mon, 17 May 2021 06:56:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbhEQE5f (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 17 May 2021 00:57:35 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3704 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229625AbhEQE5d (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 17 May 2021 00:57:33 -0400
Received: from dggems701-chm.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Fk6GK5bXbz16QrV;
        Mon, 17 May 2021 12:53:29 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggems701-chm.china.huawei.com (10.3.19.178) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 17 May 2021 12:56:13 +0800
Received: from huawei.com (10.175.103.91) by dggpeml500017.china.huawei.com
 (7.185.36.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Mon, 17 May
 2021 12:56:13 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>
CC:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>
Subject: [PATCH -next] rtc: m41t80: correct function names in rtc-m41t80.c
Date:   Mon, 17 May 2021 12:58:31 +0800
Message-ID: <20210517045831.3461507-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
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
 drivers/rtc/rtc-m41t80.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
index 89128fc29ccc..79512d1c828e 100644
--- a/drivers/rtc/rtc-m41t80.c
+++ b/drivers/rtc/rtc-m41t80.c
@@ -802,7 +802,7 @@ static int wdt_open(struct inode *inode, struct file *file)
 }
 
 /**
- *	wdt_close:
+ *	wdt_release:
  *	@inode: inode to board
  *	@file: file handle to board
  *
@@ -815,7 +815,7 @@ static int wdt_release(struct inode *inode, struct file *file)
 }
 
 /**
- *	notify_sys:
+ *	wdt_notify_sys:
  *	@this: our notifier block
  *	@code: the event being reported
  *	@unused: unused
-- 
2.25.1

