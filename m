Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86779774884
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Aug 2023 21:34:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236452AbjHHTeb (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 8 Aug 2023 15:34:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235198AbjHHTeR (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 8 Aug 2023 15:34:17 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 979AE268EB
        for <linux-rtc@vger.kernel.org>; Tue,  8 Aug 2023 10:49:26 -0700 (PDT)
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RKs0s4dXxztQr4;
        Tue,  8 Aug 2023 19:49:17 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.202) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 19:52:45 +0800
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
Subject: [PATCH -next 3/5] rtc: nct3018y: remove redundant of_match_ptr()
Date:   Tue, 8 Aug 2023 19:52:11 +0800
Message-ID: <20230808115213.154377-4-wangzhu9@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230808115213.154377-1-wangzhu9@huawei.com>
References: <20230808115213.154377-1-wangzhu9@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.202]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500025.china.huawei.com (7.185.36.35)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The driver depends on CONFIG_OF, so it is not necessary to use
of_match_ptr() here. We remove of_match_ptr().

Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
---
 drivers/rtc/rtc-nct3018y.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-nct3018y.c b/drivers/rtc/rtc-nct3018y.c
index a4e3f924837e..ed4e606be8e5 100644
--- a/drivers/rtc/rtc-nct3018y.c
+++ b/drivers/rtc/rtc-nct3018y.c
@@ -538,7 +538,7 @@ MODULE_DEVICE_TABLE(of, nct3018y_of_match);
 static struct i2c_driver nct3018y_driver = {
 	.driver		= {
 		.name	= "rtc-nct3018y",
-		.of_match_table = of_match_ptr(nct3018y_of_match),
+		.of_match_table = nct3018y_of_match,
 	},
 	.probe		= nct3018y_probe,
 	.id_table	= nct3018y_id,
-- 
2.17.1

