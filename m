Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DC3340C403
	for <lists+linux-rtc@lfdr.de>; Wed, 15 Sep 2021 12:53:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232433AbhIOKzO (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 15 Sep 2021 06:55:14 -0400
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:16930 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232424AbhIOKzN (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 15 Sep 2021 06:55:13 -0400
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18F6E8jL016676;
        Wed, 15 Sep 2021 06:53:44 -0400
Received: from nwd2mta4.analog.com ([137.71.173.58])
        by mx0a-00128a01.pphosted.com with ESMTP id 3b301k37v0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 15 Sep 2021 06:53:44 -0400
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
        by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 18FArhVH055847
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 15 Sep 2021 06:53:43 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.858.5; Wed, 15 Sep 2021
 06:53:42 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.858.5 via Frontend
 Transport; Wed, 15 Sep 2021 06:53:42 -0400
Received: from ramonaalexandra-Precision-5520.ad.analog.com ([10.48.65.154])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 18FAreYZ004967;
        Wed, 15 Sep 2021 06:53:41 -0400
From:   Ramona Alexandra Nechita <ramona.nechita@analog.com>
To:     <linux-rtc@vger.kernel.org>
CC:     <alexandre.belloni@bootlin.com>, <a.zummo@towertech.it>,
        <linux-kernel@vger.kernel.org>,
        Ramona Alexandra Nechita <ramona.nechita@analog.com>
Subject: [PATCH] rtc: Specified all the parts for DS1216
Date:   Wed, 15 Sep 2021 13:53:09 +0300
Message-ID: <20210915105309.17225-1-ramona.nechita@analog.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: mhIO9EN1ImmEVZBJGu3bEcs94Q6XF3hn
X-Proofpoint-GUID: mhIO9EN1ImmEVZBJGu3bEcs94Q6XF3hn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-15_02,2021-09-15_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 clxscore=1011 suspectscore=0
 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109150070
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Included the parts supported in the description (B/C/D/E/F/H).

Signed-off-by: Ramona Alexandra Nechita <ramona.nechita@analog.com>
---
 drivers/rtc/Kconfig      | 2 +-
 drivers/rtc/rtc-ds1216.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 1adf9f815652..0be9a34e75c8 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -966,7 +966,7 @@ config RTC_DRV_VRTC
 	updates are done via IPC calls to the system controller FW.
 
 config RTC_DRV_DS1216
-	tristate "Dallas DS1216"
+	tristate "Dallas DS1216B/C/D/E/F/H"
 	depends on SNI_RM
 	help
 	  If you say yes here you get support for the Dallas DS1216 RTC chips.
diff --git a/drivers/rtc/rtc-ds1216.c b/drivers/rtc/rtc-ds1216.c
index b225bcfef50b..ea276260d962 100644
--- a/drivers/rtc/rtc-ds1216.c
+++ b/drivers/rtc/rtc-ds1216.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Dallas DS1216 RTC driver
+ * Dallas DS1216B/C/D/E/F/H RTC driver
  *
  * Copyright (c) 2007 Thomas Bogendoerfer
  *
-- 
2.25.1

