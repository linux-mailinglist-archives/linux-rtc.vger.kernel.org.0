Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECA552958C6
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Oct 2020 09:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505091AbgJVHFY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 22 Oct 2020 03:05:24 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:57186 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439993AbgJVHFY (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 22 Oct 2020 03:05:24 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09M6mwVP131191;
        Thu, 22 Oct 2020 07:04:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=RXOU3zvWfW6xab1fti7HmRR297bFjvzAB5qDkslhVPI=;
 b=OG4pbvYSs5DMUqABM1KJiLmgSTbHyI6ZojLAoFFhk041T3p5SzIep2RN9JD38o+JvglV
 OwOnmnqttq6vQtAyHWIevV8/trnd387Em7gDuNO2dNjGKDUKuzspT2BjiZAGi6mSKypM
 WUQhcEkhdaTKiCFn76XsYCJLVEo9oyhAvrBvuIf2nKXcT4OdEmpzrGF3ihyAJgzI+vUE
 egBMcUz4N1KsaUcPFhn0hiPEQIn94r8Xj02b8M6HZ/+sbLfe0OfWdVF9gXh109bLVpMz
 tMXXz3AN/F1spDes45urvMf1rHiYss9mf5rTnpT5E1+Uz3zDuDaBryj/cU7ayuNgszG5 Xg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2130.oracle.com with ESMTP id 347p4b4ae9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 22 Oct 2020 07:04:59 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09M6o8Zg047205;
        Thu, 22 Oct 2020 07:04:59 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3030.oracle.com with ESMTP id 348a6q985k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 22 Oct 2020 07:04:59 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 09M74wYk009204;
        Thu, 22 Oct 2020 07:04:58 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 22 Oct 2020 00:04:57 -0700
Date:   Thu, 22 Oct 2020 10:04:51 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] rtc: pcf2127: fix pcf2127_nvmem_read/write() returns
Message-ID: <20201022070451.GA2817669@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9781 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010220044
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9781 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 priorityscore=1501
 clxscore=1011 malwarescore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010220044
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

These functions should return zero on success.  Non-zero returns are
treated as error.  On some paths, this doesn't matter but in
nvmem_cell_read() a non-zero return would be passed to ERR_PTR() and
lead to an Oops.

Fixes: d6c3029f32f7 ("rtc: pcf2127: add support for accessing internal static RAM")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/rtc/rtc-pcf2127.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 07a5630ec841..4d9711d51f8f 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -243,10 +243,8 @@ static int pcf2127_nvmem_read(void *priv, unsigned int offset,
 	if (ret)
 		return ret;
 
-	ret = regmap_bulk_read(pcf2127->regmap, PCF2127_REG_RAM_RD_CMD,
-			       val, bytes);
-
-	return ret ?: bytes;
+	return regmap_bulk_read(pcf2127->regmap, PCF2127_REG_RAM_RD_CMD,
+				val, bytes);
 }
 
 static int pcf2127_nvmem_write(void *priv, unsigned int offset,
@@ -261,10 +259,8 @@ static int pcf2127_nvmem_write(void *priv, unsigned int offset,
 	if (ret)
 		return ret;
 
-	ret = regmap_bulk_write(pcf2127->regmap, PCF2127_REG_RAM_WRT_CMD,
-				val, bytes);
-
-	return ret ?: bytes;
+	return regmap_bulk_write(pcf2127->regmap, PCF2127_REG_RAM_WRT_CMD,
+				 val, bytes);
 }
 
 /* watchdog driver */
-- 
2.28.0

