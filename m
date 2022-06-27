Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4345955E03E
	for <lists+linux-rtc@lfdr.de>; Tue, 28 Jun 2022 15:31:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232429AbiF0HZ5 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 27 Jun 2022 03:25:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230096AbiF0HZz (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 27 Jun 2022 03:25:55 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CE595F99;
        Mon, 27 Jun 2022 00:25:53 -0700 (PDT)
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.57])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LWfNg3BB3zkWfn;
        Mon, 27 Jun 2022 15:24:03 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 27 Jun 2022 15:25:51 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 27 Jun
 2022 15:25:51 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>
CC:     <alexandre.belloni@bootlin.com>, <a.zummo@towertech.it>,
        <s.hauer@pengutronix.de>, <a.fatoum@pengutronix.de>
Subject: [PATCH -next] rtc: rv8803: fix missing unlock on error in rv8803_set_time()
Date:   Mon, 27 Jun 2022 15:35:49 +0800
Message-ID: <20220627073549.3976620-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Add the missing unlock before return from function rv8803_set_time()
in the error handling case.

Fixes: c27fee16fab1 ("rtc: rv8803: re-initialize all Epson RX8803 registers on voltage loss")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/rtc/rtc-rv8803.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index fe1247e771b9..3527a0521e9b 100644
--- a/drivers/rtc/rtc-rv8803.c
+++ b/drivers/rtc/rtc-rv8803.c
@@ -315,8 +315,10 @@ static int rv8803_set_time(struct device *dev, struct rtc_time *tm)
 
 	if (flags & RV8803_FLAG_V2F) {
 		ret = rv8803_regs_reset(rv8803);
-		if (ret)
+		if (ret) {
+			mutex_unlock(&rv8803->flags_lock);
 			return ret;
+		}
 	}
 
 	ret = rv8803_write_reg(rv8803->client, RV8803_FLAG,
-- 
2.25.1

