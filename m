Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2D4D1C6CE6
	for <lists+linux-rtc@lfdr.de>; Wed,  6 May 2020 11:28:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728918AbgEFJ2D (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 6 May 2020 05:28:03 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:57872 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728865AbgEFJ2D (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 6 May 2020 05:28:03 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 138D8403536E6741DD6F;
        Wed,  6 May 2020 17:27:59 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Wed, 6 May 2020 17:27:51 +0800
From:   Samuel Zou <zou_wei@huawei.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>
CC:     <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Samuel Zou <zou_wei@huawei.com>
Subject: [PATCH -next] rtc: pcf8523: Use PTR_ERR_OR_ZERO() to simplify code
Date:   Wed, 6 May 2020 17:34:00 +0800
Message-ID: <1588757640-39044-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Fixes coccicheck warning:

drivers/rtc/rtc-pcf8523.c:361:1-3: WARNING: PTR_ERR_OR_ZERO can be used

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Samuel Zou <zou_wei@huawei.com>
---
 drivers/rtc/rtc-pcf8523.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-pcf8523.c b/drivers/rtc/rtc-pcf8523.c
index 47e0f41..da8889a 100644
--- a/drivers/rtc/rtc-pcf8523.c
+++ b/drivers/rtc/rtc-pcf8523.c
@@ -358,10 +358,8 @@ static int pcf8523_probe(struct i2c_client *client,
 
 	rtc = devm_rtc_device_register(&client->dev, DRIVER_NAME,
 				       &pcf8523_rtc_ops, THIS_MODULE);
-	if (IS_ERR(rtc))
-		return PTR_ERR(rtc);
 
-	return 0;
+	return PTR_ERR_OR_ZERO(rtc);
 }
 
 static const struct i2c_device_id pcf8523_id[] = {
-- 
2.6.2

