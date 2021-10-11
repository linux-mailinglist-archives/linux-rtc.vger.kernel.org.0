Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B684C42882A
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Oct 2021 09:55:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234639AbhJKH5U (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 11 Oct 2021 03:57:20 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:28914 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234570AbhJKH5S (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 11 Oct 2021 03:57:18 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HSWF63sD9zbn3s;
        Mon, 11 Oct 2021 15:50:50 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Mon, 11 Oct 2021 15:55:16 +0800
Received: from huawei.com (10.175.103.91) by dggpeml500017.china.huawei.com
 (7.185.36.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 11 Oct
 2021 15:55:16 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>
CC:     <alexandre.belloni@bootlin.com>, <a.zummo@towertech.it>
Subject: [PATCH 1/2] rtc: class: check return value when calling dev_set_name()
Date:   Mon, 11 Oct 2021 16:03:01 +0800
Message-ID: <20211011080302.1982894-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
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

BUG: kernel NULL pointer dereference, address: 0000000000000000
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD 0 P4D 0
Oops: 0000 [#1] SMP KASAN PTI
CPU: 2 PID: 925 Comm: 29 Not tainted 5.15.0-rc3-00111-gf5dad42ed4fe-dirty #487 5b4d17fc3275713934c1a9cb26349fbabf82adbf
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.13.0-1ubuntu1.1 04/01/2014
RIP: 0010:strcmp+0xc/0x20
Code: 17 48 83 c6 01 44 0f b6 46 ff 48 83 c1 01 44 88 41 ff 45 84 c0 75 e5 c3 c6 01 00 c3 66 90 31 c0 eb 08 48 83 c0 01 84 d2 74 0f <0f> b6 14 07 3a 14 06 74 ef 19 c0 83 c8 01 c3 31 c0 c3 66 90 48 85
RSP: 0018:ffffc900025af368 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 1ffff920004b5e6f RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff8ebcf680 RDI: 0000000000000000
RBP: ffff888014746000 R08: ffffed102097e3fa R09: ffffed102097e3fa
R10: ffff888104bf1fcb R11: ffffed102097e3f9 R12: ffff888014746040
R13: 0000000000000000 R14: 0000000000000000 R15: ffff8880147468c0
FS:  00007f783e6d5500(0000) GS:ffff888104a00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 0000000008cee002 CR4: 0000000000770ee0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
PKRU: 55555554
Call Trace:
 __devm_rtc_register_device.cold.7+0x16a/0x2df
 ? rtc_suspend+0x330/0x330
 ? irqentry_exit+0x32/0x80
 ? __sanitizer_cov_trace_pc+0x1d/0x50
 ? irqentry_exit+0x32/0x80
 ? trace_hardirqs_on+0x63/0x2d0
 ? rtc_ktime_to_tm+0x120/0x120
 ? tracer_hardirqs_on+0x36/0x530
 ? _raw_spin_unlock_irqrestore+0x4b/0x5d
 ? _raw_spin_unlock_irqrestore+0x54/0x5d
 ? __sanitizer_cov_trace_pc+0x1d/0x50
 ? write_comp_data+0x2a/0x90
 ? __sanitizer_cov_trace_pc+0x1d/0x50
 rv3029_probe+0x4b1/0x770 [rtc_rv3029c2]
 ? rv3029_hwmon_show_update_interval+0x160/0x160 [rtc_rv3029c2]
 ? write_comp_data+0x2a/0x90
 ? _raw_spin_unlock_irqrestore+0x4b/0x5d
 ? tracer_hardirqs_on+0x36/0x530
 ? rv3029_nvram_write+0x40/0x40 [rtc_rv3029c2]
 ? rv3029_set_time+0x350/0x350 [rtc_rv3029c2]
 ? __sanitizer_cov_trace_pc+0x1d/0x50
 rv3029_i2c_probe+0x141/0x180 [rtc_rv3029c2]
 ? rv3029_probe+0x770/0x770 [rtc_rv3029c2]
 i2c_device_probe+0xa07/0xbb0
 ? i2c_device_match+0x110/0x110
 really_probe+0x285/0xc30

If dev_set_name() fails, dev_name() is null, it causes null-ptr-deref,
we need check the return value of dev_set_name().

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/rtc/class.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/class.c b/drivers/rtc/class.c
index f77bc089eb6b..1f18c39a4b82 100644
--- a/drivers/rtc/class.c
+++ b/drivers/rtc/class.c
@@ -363,7 +363,9 @@ struct rtc_device *devm_rtc_allocate_device(struct device *dev)
 
 	rtc->id = id;
 	rtc->dev.parent = dev;
-	dev_set_name(&rtc->dev, "rtc%d", id);
+	err = dev_set_name(&rtc->dev, "rtc%d", id);
+	if (err)
+		return ERR_PTR(err);
 
 	err = devm_add_action_or_reset(dev, devm_rtc_release_device, rtc);
 	if (err)
-- 
2.25.1

