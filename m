Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 684E3E9C5F
	for <lists+linux-rtc@lfdr.de>; Wed, 30 Oct 2019 14:33:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbfJ3Ndx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 30 Oct 2019 09:33:53 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:5656 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726209AbfJ3Ndx (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 30 Oct 2019 09:33:53 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 173E567D5D6D97417690;
        Wed, 30 Oct 2019 21:33:48 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Wed, 30 Oct 2019
 21:33:40 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>
CC:     <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] rtc: fsl-ftm-alarm: Fix build error without PM_SLEEP
Date:   Wed, 30 Oct 2019 21:32:56 +0800
Message-ID: <20191030133256.14612-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

When do randbuild, Kconfig warning this:

WARNING: unmet direct dependencies detected for FSL_RCPM
  Depends on [n]: PM_SLEEP [=y] && (ARM || ARM64)
  Selected by [y]:
  - RTC_DRV_FSL_FTM_ALARM [=y] && RTC_CLASS [=y] && (ARCH_LAYERSCAPE || SOC_LS1021A || COMPILE_TEST [=y])

Add PM_SLEEP dependency to fix this.

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: e1c2feb1efa2 ("rtc: fsl-ftm-alarm: allow COMPILE_TEST")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/rtc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 4185b0d..2bbf8ae 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1326,6 +1326,7 @@ config RTC_DRV_IMXDI
 config RTC_DRV_FSL_FTM_ALARM
 	tristate "Freescale FlexTimer alarm timer"
 	depends on ARCH_LAYERSCAPE || SOC_LS1021A || COMPILE_TEST
+	depends on PM_SLEEP
 	select FSL_RCPM
 	default y
 	help
-- 
2.7.4


