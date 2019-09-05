Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F0E3A9ADF
	for <lists+linux-rtc@lfdr.de>; Thu,  5 Sep 2019 08:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731190AbfIEGqY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 5 Sep 2019 02:46:24 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:35678 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726120AbfIEGqX (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 5 Sep 2019 02:46:23 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id A5A599B3E27DF3E625FB;
        Thu,  5 Sep 2019 14:46:21 +0800 (CST)
Received: from linux-ibm.site (10.175.102.37) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.439.0; Thu, 5 Sep 2019 14:46:12 +0800
From:   zhong jiang <zhongjiang@huawei.com>
To:     <tony@atomide.com>, <udeep.dutt@intel.com>,
        <ashutosh.dixit@intel.com>, <gregkh@linuxfoundation.org>,
        <kishon@ti.com>, <jonathanh@nvidia.com>, <a.zummo@towertech.it>,
        <alexandre.belloni@bootlin.com>
CC:     <zhongjiang@huawei.com>, <linux-kernel@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, <arnd@arndb.de>,
        <lorenzo.pieralisi@arm.com>
Subject: [PATCH 2/4] misc: mic: Use PTR_ERR_OR_ZERO rather than its implementation
Date:   Thu, 5 Sep 2019 14:43:13 +0800
Message-ID: <1567665795-5901-3-git-send-email-zhongjiang@huawei.com>
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
 drivers/misc/mic/scif/scif_epd.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/mic/scif/scif_epd.h b/drivers/misc/mic/scif/scif_epd.h
index d3837f8..0b9dfe1 100644
--- a/drivers/misc/mic/scif/scif_epd.h
+++ b/drivers/misc/mic/scif/scif_epd.h
@@ -156,9 +156,8 @@ static inline int scif_verify_epd(struct scif_endpt *ep)
 static inline int scif_anon_inode_getfile(scif_epd_t epd)
 {
 	epd->anon = anon_inode_getfile("scif", &scif_anon_fops, NULL, 0);
-	if (IS_ERR(epd->anon))
-		return PTR_ERR(epd->anon);
-	return 0;
+
+	return PTR_ERR_OR_ZERO(epd->anon);
 }
 
 static inline void scif_anon_inode_fput(scif_epd_t epd)
-- 
1.7.12.4

