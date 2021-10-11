Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D3F042882B
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Oct 2021 09:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234683AbhJKH5V (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 11 Oct 2021 03:57:21 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:24234 "EHLO
        szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234611AbhJKH5U (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 11 Oct 2021 03:57:20 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4HSWK049Y1zQj8D;
        Mon, 11 Oct 2021 15:54:12 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Mon, 11 Oct 2021 15:55:17 +0800
Received: from huawei.com (10.175.103.91) by dggpeml500017.china.huawei.com
 (7.185.36.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 11 Oct
 2021 15:55:16 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>
CC:     <alexandre.belloni@bootlin.com>, <a.zummo@towertech.it>
Subject: [PATCH 2/2] rtc: class: return error code when cdev_device_add() failed
Date:   Mon, 11 Oct 2021 16:03:02 +0800
Message-ID: <20211011080302.1982894-2-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211011080302.1982894-1-yangyingliang@huawei.com>
References: <20211011080302.1982894-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500017.china.huawei.com (7.185.36.243)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

I got a null-ptr-deref report when doing fault injection test:

general protection fault, probably for non-canonical address 0xdffffc0000000022: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000110-0x0000000000000117]
CPU: 1 PID: 1028 Comm: 33 Not tainted 5.15.0-rc3-00111-gf5dad42ed4fe-dirty #481 2a70b3e6ca240b8638beac7ef491cce6183bbec7
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.13.0-1ubuntu1.1 04/01/2014
RIP: 0010:device_del+0x132/0xdc0
Code: 48 c1 ea 03 80 3c 02 00 0f 85 4f 0c 00 00 48 b8 00 00 00 00 00 fc ff df 4c 8b 7b 48 4d 8d a7 10 01 00 00 4c 89 e2 48 c1 ea 03 <0f> b6 04 02 84 c0 74 06 0f 8e 7f 0a 00 00 45 0f b6 b7 10 01 00 00
RSP: 0018:ffffc90002e876b8 EFLAGS: 00010206
RAX: dffffc0000000000 RBX: ffff88801eb84000 RCX: ffffffff97227644
RDX: 0000000000000022 RSI: ffff8880146a0000 RDI: 0000000000000002
RBP: ffff88801eb84120 R08: fffffbfff349a60d R09: fffffbfff349a60d
R10: ffffc90002e876b8 R11: fffffbfff349a60c R12: 0000000000000110
R13: 0000000000000001 R14: ffffc90002e87848 R15: 0000000000000000
FS:  00007fa514973500(0000) GS:ffff888104600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fa51474ccb0 CR3: 000000002bcb0001 CR4: 0000000000770ee0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
PKRU: 55555554
Call Trace:
 ? write_comp_data+0x2a/0x90
 ? cleanup_glue_dir+0x260/0x260
 ? is_rtc_hctosys.isra.0+0xb9/0xf0
 ? rtc_proc_show+0x440/0x440
 ? rcu_read_lock_held_common+0xe/0xa0
 ? rcu_read_lock_sched_held+0x62/0xe0
 cdev_device_del+0x1a/0x80
 devm_rtc_unregister_device+0x37/0x80
 release_nodes+0xc3/0x3b0

If cdev_device_add() fails, 'dev->p' is not set, it causes
null-ptr-deref when calling cdev_device_del(), return error
code when cdev_device_add() failed to fix this.

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: 3068a254d5519 ("rtc: introduce new registration method")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/rtc/class.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/class.c b/drivers/rtc/class.c
index 1f18c39a4b82..76422faee05b 100644
--- a/drivers/rtc/class.c
+++ b/drivers/rtc/class.c
@@ -399,12 +399,14 @@ int __devm_rtc_register_device(struct module *owner, struct rtc_device *rtc)
 	rtc_dev_prepare(rtc);
 
 	err = cdev_device_add(&rtc->char_dev, &rtc->dev);
-	if (err)
+	if (err) {
 		dev_warn(rtc->dev.parent, "failed to add char device %d:%d\n",
 			 MAJOR(rtc->dev.devt), rtc->id);
-	else
+		return err;
+	} else {
 		dev_dbg(rtc->dev.parent, "char device (%d:%d)\n",
 			MAJOR(rtc->dev.devt), rtc->id);
+	}
 
 	rtc_proc_add_device(rtc);
 
-- 
2.25.1

