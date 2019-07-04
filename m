Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD52D5F50D
	for <lists+linux-rtc@lfdr.de>; Thu,  4 Jul 2019 10:58:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727046AbfGDI6t (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 4 Jul 2019 04:58:49 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:8697 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726993AbfGDI6t (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 4 Jul 2019 04:58:49 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 4984561B4B33713A367F;
        Thu,  4 Jul 2019 16:58:42 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Thu, 4 Jul 2019
 16:58:34 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <Dylan.Howey@tennantco.com>, <ravi23ganiga@gmail.com>
CC:     <linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH] rtc: pcf2123: Fix build error
Date:   Thu, 4 Jul 2019 16:55:42 +0800
Message-ID: <20190704085542.48180-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

If REGMAP_SPI is m and RTC_DRV_PCF2123 is y,

drivers/rtc/rtc-pcf2123.o: In function `pcf2123_probe':
rtc-pcf2123.c:(.text+0xb2b): undefined reference to `__devm_regmap_init_spi'

Select REGMAP_SPI as RTC_DRV_DS1347 driver does.

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: 790d033933b8 ("rtc: pcf2123: port to regmap")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/rtc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 3bfc04a..e72f65b 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -820,6 +820,7 @@ config RTC_DRV_MAX6902
 
 config RTC_DRV_PCF2123
 	tristate "NXP PCF2123"
+	select REGMAP_SPI
 	help
 	  If you say yes here you get support for the NXP PCF2123
 	  RTC chip.
-- 
2.7.4


