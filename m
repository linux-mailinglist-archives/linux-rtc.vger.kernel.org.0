Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4F33271CED
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Sep 2020 10:03:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgIUIDD (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 21 Sep 2020 04:03:03 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:13790 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726384AbgIUICl (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 21 Sep 2020 04:02:41 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id E3BE2F69C7EA94DCF0E9;
        Mon, 21 Sep 2020 16:02:34 +0800 (CST)
Received: from huawei.com (10.175.113.32) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Mon, 21 Sep 2020
 16:02:25 +0800
From:   Liu Shixin <liushixin2@huawei.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Liu Shixin <liushixin2@huawei.com>
Subject: [PATCH -next] rtc: rv8803: simplify the return expression of rv8803_nvram_write
Date:   Mon, 21 Sep 2020 16:24:49 +0800
Message-ID: <20200921082449.2591981-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.32]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Simplify the return expression.

Signed-off-by: Liu Shixin <liushixin2@huawei.com>
---
 drivers/rtc/rtc-rv8803.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index 93c3a6b627bd..c6d8e3425688 100644
--- a/drivers/rtc/rtc-rv8803.c
+++ b/drivers/rtc/rtc-rv8803.c
@@ -454,13 +454,7 @@ static int rv8803_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
 static int rv8803_nvram_write(void *priv, unsigned int offset, void *val,
 			      size_t bytes)
 {
-	int ret;
-
-	ret = rv8803_write_reg(priv, RV8803_RAM, *(u8 *)val);
-	if (ret)
-		return ret;
-
-	return 0;
+	return rv8803_write_reg(priv, RV8803_RAM, *(u8 *)val);
 }
 
 static int rv8803_nvram_read(void *priv, unsigned int offset,
-- 
2.25.1

