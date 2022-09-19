Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D3DC5BC456
	for <lists+linux-rtc@lfdr.de>; Mon, 19 Sep 2022 10:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229847AbiISIbQ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 19 Sep 2022 04:31:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229995AbiISIbO (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 19 Sep 2022 04:31:14 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFECF2127A
        for <linux-rtc@vger.kernel.org>; Mon, 19 Sep 2022 01:31:12 -0700 (PDT)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MWHny3mRzzMn4D;
        Mon, 19 Sep 2022 16:26:30 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 19 Sep 2022 16:31:10 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 19 Sep
 2022 16:31:10 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-rtc@vger.kernel.org>
CC:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <yangyingliang@huawei.com>
Subject: [PATCH -next] rtc: s3c: Switch to use dev_err_probe() helper
Date:   Mon, 19 Sep 2022 16:38:12 +0800
Message-ID: <20220919083812.755082-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

In the probe path, dev_err() can be replace with dev_err_probe()
which will check if error code is -EPROBE_DEFER and prints the
error name.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/rtc/rtc-s3c.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index db529733c9c4..8fc5efde3e0b 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -429,14 +429,9 @@ static int s3c_rtc_probe(struct platform_device *pdev)
 		return PTR_ERR(info->base);
 
 	info->rtc_clk = devm_clk_get(&pdev->dev, "rtc");
-	if (IS_ERR(info->rtc_clk)) {
-		ret = PTR_ERR(info->rtc_clk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "failed to find rtc clock\n");
-		else
-			dev_dbg(&pdev->dev, "probe deferred due to missing rtc clk\n");
-		return ret;
-	}
+	if (IS_ERR(info->rtc_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(info->rtc_clk),
+				     "failed to find rtc clock\n");
 	ret = clk_prepare_enable(info->rtc_clk);
 	if (ret)
 		return ret;
-- 
2.25.1

