Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0611C774D7C
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Aug 2023 23:58:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230265AbjHHV6P (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 8 Aug 2023 17:58:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231633AbjHHV6F (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 8 Aug 2023 17:58:05 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3F093F190
        for <linux-rtc@vger.kernel.org>; Tue,  8 Aug 2023 09:42:16 -0700 (PDT)
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.57])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RKs2j1vwVzVk36;
        Tue,  8 Aug 2023 19:50:53 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.202) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 19:52:46 +0800
From:   Zhu Wang <wangzhu9@huawei.com>
To:     <andrew@lunn.ch>, <gregory.clement@bootlin.com>,
        <sebastian.hesselbarth@gmail.com>, <a.zummo@towertech.it>,
        <alexandre.belloni@bootlin.com>, <joel@jms.id.au>,
        <andrew@aj.id.au>, <nicolas.ferre@microchip.com>,
        <claudiu.beznea@tuxon.dev>, <avifishman70@gmail.com>,
        <tmaimon77@gmail.com>, <tali.perry1@gmail.com>,
        <venture@google.com>, <yuenn@google.com>,
        <benjaminfair@google.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-rtc@vger.kernel.org>, <linux-aspeed@lists.ozlabs.org>
CC:     <wangzhu9@huawei.com>
Subject: [PATCH -next 4/5] rtc: armada38x: remove redundant of_match_ptr()
Date:   Tue, 8 Aug 2023 19:52:12 +0800
Message-ID: <20230808115213.154377-5-wangzhu9@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230808115213.154377-1-wangzhu9@huawei.com>
References: <20230808115213.154377-1-wangzhu9@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.202]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500025.china.huawei.com (7.185.36.35)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The driver depends on CONFIG_OF, so it is not necessary to use
of_match_ptr() here. We remove of_match_ptr().

Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
---
 drivers/rtc/rtc-armada38x.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-armada38x.c b/drivers/rtc/rtc-armada38x.c
index b4139c200676..ef878b76dd7b 100644
--- a/drivers/rtc/rtc-armada38x.c
+++ b/drivers/rtc/rtc-armada38x.c
@@ -474,7 +474,6 @@ static const struct armada38x_rtc_data armada8k_data = {
 	.alarm = ALARM2,
 };
 
-#ifdef CONFIG_OF
 static const struct of_device_id armada38x_rtc_of_match_table[] = {
 	{
 		.compatible = "marvell,armada-380-rtc",
@@ -487,7 +486,6 @@ static const struct of_device_id armada38x_rtc_of_match_table[] = {
 	{}
 };
 MODULE_DEVICE_TABLE(of, armada38x_rtc_of_match_table);
-#endif
 
 static __init int armada38x_rtc_probe(struct platform_device *pdev)
 {
@@ -577,7 +575,7 @@ static struct platform_driver armada38x_rtc_driver = {
 	.driver		= {
 		.name	= "armada38x-rtc",
 		.pm	= &armada38x_rtc_pm_ops,
-		.of_match_table = of_match_ptr(armada38x_rtc_of_match_table),
+		.of_match_table = armada38x_rtc_of_match_table,
 	},
 };
 
-- 
2.17.1

