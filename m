Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AD841A0A26
	for <lists+linux-rtc@lfdr.de>; Tue,  7 Apr 2020 11:31:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726716AbgDGJb2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 7 Apr 2020 05:31:28 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:51544 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725883AbgDGJb2 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 7 Apr 2020 05:31:28 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0379RkfL037022;
        Tue, 7 Apr 2020 09:31:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=absFtblFlPxOF3hmormLh9Zp7rTAbuEhM/1Okv4DNkc=;
 b=B4AHxfdB4XCwggGOwicCWkDRSpQ/eJmZNEUDVnvi7StE4ML+S9DCig55Hb/DlYHYgNQ4
 KcEe8BDeRFL5z1zX8wp5ki9zujmPhuoGbpI+qcnkiEAfZt5Hfr7jUcnrALrI1U2NuTq+
 wkIOkVdAbNuJxdZDWyZnEkyFQcghyXqyHP0HYDu/IKDBajL2AWFqhIh/mnccNQJPhI0z
 LYqoLf14WM3aPVO8yr1Sey7Mg5rlUpSIExaKT0AXGSuZvpdeb4IZuiU0sHPBrYhVwfXs
 DSZHG71TEY7EaFOGzTy3Y02eK+7+Ak7qZOyv018dklwbMCls9ybtARQEViripbfY2+8C oA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 306j6mbr52-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 07 Apr 2020 09:31:03 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0379Qdqi144575;
        Tue, 7 Apr 2020 09:29:03 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3030.oracle.com with ESMTP id 3073srqu15-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 07 Apr 2020 09:29:03 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0379SxpX027473;
        Tue, 7 Apr 2020 09:29:00 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 07 Apr 2020 02:28:59 -0700
Date:   Tue, 7 Apr 2020 12:28:52 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Andreas Kemnade <andreas@kemnade.info>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Lee Jones <lee.jones@linaro.org>, linux-rtc@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] rtc: rc5t619: Fix an ERR_PTR vs NULL check
Message-ID: <20200407092852.GI68494@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9583 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 spamscore=0
 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004070080
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9583 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 mlxscore=0 phishscore=0 adultscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004070080
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The devm_kzalloc() function returns NULL on error, it doesn't return
error pointers so this check doesn't work.

Fixes: 540d1e15393d ("rtc: rc5t619: Add Ricoh RC5T619 RTC driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/rtc/rtc-rc5t619.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-rc5t619.c b/drivers/rtc/rtc-rc5t619.c
index 24e386ecbc7e..dd1a20977478 100644
--- a/drivers/rtc/rtc-rc5t619.c
+++ b/drivers/rtc/rtc-rc5t619.c
@@ -356,10 +356,8 @@ static int rc5t619_rtc_probe(struct platform_device *pdev)
 	int err;
 
 	rtc = devm_kzalloc(dev, sizeof(*rtc), GFP_KERNEL);
-	if (IS_ERR(rtc)) {
-		err = PTR_ERR(rtc);
+	if (!rtc)
 		return -ENOMEM;
-	}
 
 	rtc->rn5t618 = rn5t618;
 
-- 
2.25.1

