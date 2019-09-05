Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0ED5A9AE2
	for <lists+linux-rtc@lfdr.de>; Thu,  5 Sep 2019 08:46:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731248AbfIEGqc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 5 Sep 2019 02:46:32 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:6679 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726097AbfIEGqY (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 5 Sep 2019 02:46:24 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 6D03CDB8DBB710AB9656;
        Thu,  5 Sep 2019 14:46:21 +0800 (CST)
Received: from linux-ibm.site (10.175.102.37) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.439.0; Thu, 5 Sep 2019 14:46:13 +0800
From:   zhong jiang <zhongjiang@huawei.com>
To:     <tony@atomide.com>, <udeep.dutt@intel.com>,
        <ashutosh.dixit@intel.com>, <gregkh@linuxfoundation.org>,
        <kishon@ti.com>, <jonathanh@nvidia.com>, <a.zummo@towertech.it>,
        <alexandre.belloni@bootlin.com>
CC:     <zhongjiang@huawei.com>, <linux-kernel@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, <arnd@arndb.de>,
        <lorenzo.pieralisi@arm.com>
Subject: [PATCH 3/4] phy: tegra: Use PTR_ERR_OR_ZERO rather than its implementation
Date:   Thu, 5 Sep 2019 14:43:14 +0800
Message-ID: <1567665795-5901-4-git-send-email-zhongjiang@huawei.com>
X-Mailer: git-send-email 1.7.12.4
In-Reply-To: <1567665795-5901-1-git-send-email-zhongjiang@huawei.com>
References: <1567665795-5901-1-git-send-email-zhongjiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.102.37]
X-CFilter-Loop: Reflected
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

PTR_ERR_OR_ZERO contains if(IS_ERR(...)) + PTR_ERR. It is better to
use it directly. hence just replace it.

Signed-off-by: zhong jiang <zhongjiang@huawei.com>
---
 drivers/phy/tegra/phy-tegra194-p2u.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/phy/tegra/phy-tegra194-p2u.c b/drivers/phy/tegra/phy-tegra194-p2u.c
index 7042bed..40bc550 100644
--- a/drivers/phy/tegra/phy-tegra194-p2u.c
+++ b/drivers/phy/tegra/phy-tegra194-p2u.c
@@ -92,10 +92,8 @@ static int tegra_p2u_probe(struct platform_device *pdev)
 	phy_set_drvdata(generic_phy, phy);
 
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
-	if (IS_ERR(phy_provider))
-		return PTR_ERR(phy_provider);
 
-	return 0;
+	return PTR_ERR_OR_ZERO(phy_provider);
 }
 
 static const struct of_device_id tegra_p2u_id_table[] = {
-- 
1.7.12.4

