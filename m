Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F04209AFD9
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2019 14:46:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388656AbfHWMqO (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 23 Aug 2019 08:46:14 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:5209 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388016AbfHWMqO (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 23 Aug 2019 08:46:14 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id EFD9016D994DD546A2AB;
        Fri, 23 Aug 2019 20:46:10 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.439.0; Fri, 23 Aug 2019
 20:46:03 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <bruno.thomsen@gmail.com>, <linux@roeck-us.net>
CC:     <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] rtc: pcf2127: Fix build error without CONFIG_WATCHDOG_CORE
Date:   Fri, 23 Aug 2019 20:45:53 +0800
Message-ID: <20190823124553.19364-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

If WATCHDOG_CORE is not set, build fails:

drivers/rtc/rtc-pcf2127.o: In function `pcf2127_probe.isra.6':
drivers/rtc/rtc-pcf2127.c:478: undefined reference to `devm_watchdog_register_device'

Add WATCHDOG_CORE Kconfig dependency to fix this.

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: bbc597561ce1 ("rtc: pcf2127: add watchdog feature support")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/rtc/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 25af63d..9dce7dc 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -886,6 +886,8 @@ config RTC_DRV_DS3232_HWMON
 config RTC_DRV_PCF2127
 	tristate "NXP PCF2127"
 	depends on RTC_I2C_AND_SPI
+	depends on WATCHDOG
+	select WATCHDOG_CORE
 	help
 	  If you say yes here you get support for the NXP PCF2127/29 RTC
 	  chips with integrated quartz crystal for industrial applications.
-- 
2.7.4


