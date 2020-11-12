Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CA4A2B013E
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Nov 2020 09:34:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725966AbgKLIeH (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 12 Nov 2020 03:34:07 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:8071 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725941AbgKLIeH (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 12 Nov 2020 03:34:07 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CWvyQ5yndzLxkj;
        Thu, 12 Nov 2020 16:33:50 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Thu, 12 Nov 2020
 16:33:57 +0800
From:   Zheng Liang <zhengliang6@huawei.com>
To:     <linus.walleij@linaro.org>
CC:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-rtc@vger.kernel.org>, <wangli74@huawei.com>,
        <fangwei1@huawei.com>, <zhengliang6@huawei.com>
Subject: [PATCH] rtc: pl031: fix resource leak in pl031_probe
Date:   Thu, 12 Nov 2020 17:31:39 +0800
Message-ID: <20201112093139.32566-1-zhengliang6@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

When devm_rtc_allocate_device is failed in pl031_probe, it should release
mem regions with device.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zheng Liang <zhengliang6@huawei.com>
---
 drivers/rtc/rtc-pl031.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-pl031.c b/drivers/rtc/rtc-pl031.c
index c6b89273feba..d4b2ab786126 100644
--- a/drivers/rtc/rtc-pl031.c
+++ b/drivers/rtc/rtc-pl031.c
@@ -361,8 +361,10 @@ static int pl031_probe(struct amba_device *adev, const struct amba_id *id)
 
 	device_init_wakeup(&adev->dev, true);
 	ldata->rtc = devm_rtc_allocate_device(&adev->dev);
-	if (IS_ERR(ldata->rtc))
-		return PTR_ERR(ldata->rtc);
+	if (IS_ERR(ldata->rtc)) {
+		ret = PTR_ERR(ldata->rtc);
+		goto out;
+	}
 
 	ldata->rtc->ops = ops;
 	ldata->rtc->range_min = vendor->range_min;
-- 
2.17.1

