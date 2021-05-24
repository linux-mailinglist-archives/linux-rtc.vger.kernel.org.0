Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 271BC38E365
	for <lists+linux-rtc@lfdr.de>; Mon, 24 May 2021 11:34:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232422AbhEXJfe (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 24 May 2021 05:35:34 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:5748 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232396AbhEXJfd (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 24 May 2021 05:35:33 -0400
Received: from dggems703-chm.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FpX4g290GzmkWg;
        Mon, 24 May 2021 17:30:27 +0800 (CST)
Received: from dggpeml500023.china.huawei.com (7.185.36.114) by
 dggems703-chm.china.huawei.com (10.3.19.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 24 May 2021 17:34:02 +0800
Received: from localhost.localdomain (10.69.192.56) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 24 May 2021 17:34:01 +0800
From:   Shaokun Zhang <zhangshaokun@hisilicon.com>
To:     <linux-rtc@vger.kernel.org>
CC:     Shaokun Zhang <zhangshaokun@hisilicon.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] rtc: efi: Remove the repeated module alias
Date:   Mon, 24 May 2021 17:33:54 +0800
Message-ID: <1621848834-20857-1-git-send-email-zhangshaokun@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

'MODULE_ALIAS' is declared twice, cleanup one.

Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com> 
Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>
---
 drivers/rtc/rtc-efi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rtc/rtc-efi.c b/drivers/rtc/rtc-efi.c
index edb64debd173..138c5e0046c8 100644
--- a/drivers/rtc/rtc-efi.c
+++ b/drivers/rtc/rtc-efi.c
@@ -280,7 +280,6 @@ static struct platform_driver efi_rtc_driver = {
 
 module_platform_driver_probe(efi_rtc_driver, efi_rtc_probe);
 
-MODULE_ALIAS("platform:rtc-efi");
 MODULE_AUTHOR("dann frazier <dannf@dannf.org>");
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("EFI RTC driver");
-- 
2.7.4

