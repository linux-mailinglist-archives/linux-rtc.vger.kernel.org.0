Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A798623E47
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Nov 2022 10:09:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbiKJJJi (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 10 Nov 2022 04:09:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229700AbiKJJJg (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 10 Nov 2022 04:09:36 -0500
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00F32BC26
        for <linux-rtc@vger.kernel.org>; Thu, 10 Nov 2022 01:09:34 -0800 (PST)
Received: from kwepemi500016.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4N7GCM5RWzzpWQ4;
        Thu, 10 Nov 2022 17:05:51 +0800 (CST)
Received: from huawei.com (10.175.100.227) by kwepemi500016.china.huawei.com
 (7.221.188.220) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 10 Nov
 2022 17:09:32 +0800
From:   Shang XiaoJing <shangxiaojing@huawei.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <yangyingliang@huawei.com>, <linux-rtc@vger.kernel.org>
CC:     <shangxiaojing@huawei.com>
Subject: [PATCH] rtc: class: Fix potential memleak in devm_rtc_allocate_device()
Date:   Thu, 10 Nov 2022 17:08:10 +0800
Message-ID: <20221110090810.11225-1-shangxiaojing@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.100.227]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500016.china.huawei.com (7.221.188.220)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

devm_rtc_allocate_device() will alloc a rtc_device first, and then run
dev_set_name(). If dev_set_name() failed, the rtc_device will memleak.
Move devm_add_action_or_reset() in front of dev_set_name() to prevent
memleak.

unreferenced object 0xffff888110a53000 (size 2048):
  comm "python3", pid 470, jiffies 4296078308 (age 58.882s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 08 30 a5 10 81 88 ff ff  .........0......
    08 30 a5 10 81 88 ff ff 00 00 00 00 00 00 00 00  .0..............
  backtrace:
    [<000000004aac0364>] kmalloc_trace+0x21/0x110
    [<000000000ff02202>] devm_rtc_allocate_device+0xd4/0x400
    [<000000001bdf5639>] devm_rtc_device_register+0x1a/0x80
    [<00000000351bf81c>] rx4581_probe+0xdd/0x110 [rtc_rx4581]
    [<00000000f0eba0ae>] spi_probe+0xde/0x130
    [<00000000bff89ee8>] really_probe+0x175/0x3f0
    [<00000000128e8d84>] __driver_probe_device+0xe6/0x170
    [<00000000ee5bf913>] device_driver_attach+0x32/0x80
    [<00000000f3f28f92>] bind_store+0x10b/0x1a0
    [<000000009ff812d8>] drv_attr_store+0x49/0x70
    [<000000008139c323>] sysfs_kf_write+0x8d/0xb0
    [<00000000b6146e01>] kernfs_fop_write_iter+0x214/0x2d0
    [<00000000ecbe3895>] vfs_write+0x61a/0x7d0
    [<00000000aa2196ea>] ksys_write+0xc8/0x190
    [<0000000046a600f5>] do_syscall_64+0x37/0x90
    [<00000000541a336f>] entry_SYSCALL_64_after_hwframe+0x63/0xcd

Fixes: 24d23181e43d ("rtc: class: check return value when calling dev_set_name()")
Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>
---
 drivers/rtc/class.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/class.c b/drivers/rtc/class.c
index e48223c00c67..e5b7b48cffac 100644
--- a/drivers/rtc/class.c
+++ b/drivers/rtc/class.c
@@ -374,11 +374,11 @@ struct rtc_device *devm_rtc_allocate_device(struct device *dev)
 
 	rtc->id = id;
 	rtc->dev.parent = dev;
-	err = dev_set_name(&rtc->dev, "rtc%d", id);
+	err = devm_add_action_or_reset(dev, devm_rtc_release_device, rtc);
 	if (err)
 		return ERR_PTR(err);
 
-	err = devm_add_action_or_reset(dev, devm_rtc_release_device, rtc);
+	err = dev_set_name(&rtc->dev, "rtc%d", id);
 	if (err)
 		return ERR_PTR(err);
 
-- 
2.17.1

