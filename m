Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8473429C2F
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Oct 2021 06:09:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229729AbhJLELK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 12 Oct 2021 00:11:10 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:13721 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbhJLELK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 12 Oct 2021 00:11:10 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HT2Dz6BLfzWZFj;
        Tue, 12 Oct 2021 12:07:31 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 12 Oct 2021 12:08:48 +0800
Received: from huawei.com (10.175.103.91) by dggpeml500017.china.huawei.com
 (7.185.36.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Tue, 12 Oct
 2021 12:08:48 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>
CC:     <alexandre.belloni@bootlin.com>, <a.zummo@towertech.it>
Subject: [PATCH v2] rtc: class: check return value when calling dev_set_name()
Date:   Tue, 12 Oct 2021 12:16:29 +0800
Message-ID: <20211012041629.2504158-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500017.china.huawei.com (7.185.36.243)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

I got a null-ptr-deref report when doing fault injection test:

BUG: kernel NULL pointer dereference, address: 0000000000000000
RIP: 0010:strcmp+0xc/0x20
Call Trace:
 __devm_rtc_register_device.cold.7+0x16a/0x2df
 rv3029_probe+0x4b1/0x770 [rtc_rv3029c2]
 rv3029_i2c_probe+0x141/0x180 [rtc_rv3029c2]
 i2c_device_probe+0xa07/0xbb0
 really_probe+0x285/0xc30

If dev_set_name() fails, dev_name() is null, it causes null-ptr-deref,
we need check the return value of dev_set_name().

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
v2:
  drop some unuseful backtrace in commit message.
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

