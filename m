Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A656937A0B1
	for <lists+linux-rtc@lfdr.de>; Tue, 11 May 2021 09:19:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbhEKHUz (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 11 May 2021 03:20:55 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:41536 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230343AbhEKHUz (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 11 May 2021 03:20:55 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14B7ALna151746;
        Tue, 11 May 2021 07:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=eP1PwzhAIrvlXsQZtEzk+wE318PF26VjA6mVgLMKE1c=;
 b=QkNYxOLftcx/YSVxlXAhfHr1Cjv6nK0/eiOAkJJUBdYI0AZY7NoxT5Dfz0p8Y1ZhvzXR
 1MTpxKG5g0aUEYHoi0gjWVgRW09pp/G/bpWK8YMaAwzMrT4Oxz5MV+upGXba970uBXWI
 0Ztoy6GhyVDcpFMhhbut6tHECUDGS0rTYVH2hRF8CuafeJpuUcKUkDnJjgYQorlL3rld
 u0+KzxYbiojDDZL3IG0upwC/VHabbYrzQG5Hgqx2DK/S9BgG5eC0nyxovU1wv4zNgm6t
 g5tFk8iuCToqgr45UPXIki/6unj0hi2JbQbJ54+sH0G9UL6cLGD8kWudizbu0W6DDYQv wA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 38djkmdnaa-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 11 May 2021 07:19:38 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14B7Ae3I171905;
        Tue, 11 May 2021 07:19:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3020.oracle.com with ESMTP id 38djf8kprw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 11 May 2021 07:19:38 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14B7Jbbi018550;
        Tue, 11 May 2021 07:19:37 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 38djf8kpr3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 11 May 2021 07:19:37 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 14B7JXJl014687;
        Tue, 11 May 2021 07:19:36 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 11 May 2021 00:19:32 -0700
Date:   Tue, 11 May 2021 10:19:26 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        "Kim, Milo" <Milo.Kim@ti.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] rtc: fix snprintf() checking in is_rtc_hctosys()
Message-ID: <YJov/pcGmhLi2pEl@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-GUID: 0nYgb_Re4wnEQ_R_YDXuSgcBS2L4nieV
X-Proofpoint-ORIG-GUID: 0nYgb_Re4wnEQ_R_YDXuSgcBS2L4nieV
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9980 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 priorityscore=1501
 suspectscore=0 clxscore=1011 bulkscore=0 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105110054
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The scnprintf() function silently truncates the printf() and returns
the number bytes that it was able to copy (not counting the NUL
terminator).  Thus, the highest value it can return here is
"NAME_SIZE - 1" and the overflow check is dead code.  Fix this by
using the snprintf() function which returns the number of bytes that
would have been copied if there was enough space and changing the
condition from "> NAME_SIZE" to ">= NAME_SIZE".

Fixes: 92589c986b33 ("rtc-proc: permit the /proc/driver/rtc device to use other devices")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/rtc/proc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/proc.c b/drivers/rtc/proc.c
index 73344598fc1b..cbcdbb19d848 100644
--- a/drivers/rtc/proc.c
+++ b/drivers/rtc/proc.c
@@ -23,8 +23,8 @@ static bool is_rtc_hctosys(struct rtc_device *rtc)
 	int size;
 	char name[NAME_SIZE];
 
-	size = scnprintf(name, NAME_SIZE, "rtc%d", rtc->id);
-	if (size > NAME_SIZE)
+	size = snprintf(name, NAME_SIZE, "rtc%d", rtc->id);
+	if (size >= NAME_SIZE)
 		return false;
 
 	return !strncmp(name, CONFIG_RTC_HCTOSYS_DEVICE, NAME_SIZE);
-- 
2.30.2

