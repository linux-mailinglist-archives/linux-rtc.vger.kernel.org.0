Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67CFE2351DE
	for <lists+linux-rtc@lfdr.de>; Sat,  1 Aug 2020 13:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728505AbgHALUx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 1 Aug 2020 07:20:53 -0400
Received: from m12-11.163.com ([220.181.12.11]:40237 "EHLO m12-11.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728255AbgHALUx (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sat, 1 Aug 2020 07:20:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=VNk9X
        ik9SMc0csDFfoH9bQWDIoWTBVI+M56W9UAHzSU=; b=CxYL0PNsttl4qnzp5xbgz
        5C8YlX6bxcD0qJ1+HKxgxMSamvrhkOshQ951k9Mmjbbu7jqFAK5eAhDWUiS336PC
        X+hOPAK4+Mi246G+3sd7S5pO4xjBx4jWDzvxZcZpqt97EQVtWkQsm4Roy5YC2sZ9
        jKwOOMyB6SzWcbv2+rguQk=
Received: from localhost.localdomain (unknown [58.33.79.182])
        by smtp7 (Coremail) with SMTP id C8CowADX1yv4TyVfDritBQ--.1816S2;
        Sat, 01 Aug 2020 19:20:30 +0800 (CST)
From:   Grant Feng <von81@163.com>
To:     von81@163.com, a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        linux-rtc@vger.kernel.org
Subject: [PATCH] rtc: interface:: 1969-12-31T23:59:59 is set as rtc_time if rtc_time is invalid in __rtc_read_time
Date:   Sat,  1 Aug 2020 19:20:07 +0800
Message-Id: <20200801112007.2148-1-von81@163.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C8CowADX1yv4TyVfDritBQ--.1816S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrurWfAFyfJrW7uF17GFW7Jwb_yoWkurc_Gr
        yxW3s5uw1DG3Z8ta40yw1fZrWkKFs5WF1xCa4DtFZrKr4UZa4YvFs8WF18ur18Xr47KF98
        JF1DJ34vqr1xKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8sqXDUUUUU==
X-Originating-IP: [58.33.79.182]
X-CM-SenderInfo: xyrqmii6rwjhhfrp/xtbBSR5zOlaD7nzD4gAAs4
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

1969-12-31T23:59:59 is an error more clear than Invalid argument

For example, when the RTC clock is not set, it will print a kernel
error log every time someone tries to read the clock:
        ~ # hwclock -r
        hwclock: RTC_RD_TIME: Invalid argument

It's clear and easy to understand what happened if print
1969-12-31T23:59:59 in this situation：
        ~ # hwclock -r
        Wed Dec 31 23:59:59 1969  0.000000 seconds

Signed-off-by: Grant Feng <von81@163.com>
---
 drivers/rtc/interface.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
index 794a4f036b99..e6b3f4163565 100644
--- a/drivers/rtc/interface.c
+++ b/drivers/rtc/interface.c
@@ -101,8 +101,20 @@ static int __rtc_read_time(struct rtc_device *rtc, struct rtc_time *tm)
 		rtc_add_offset(rtc, tm);
 
 		err = rtc_valid_tm(tm);
-		if (err < 0)
+		if (err < 0) {
 			dev_dbg(&rtc->dev, "read_time: rtc_time isn't valid\n");
+
+			tm->tm_sec = 59;
+			tm->tm_min = 59;
+			tm->tm_hour = 23;
+			tm->tm_mday = 31;
+			tm->tm_mon = 11;
+			tm->tm_year = 69;
+			tm->tm_wday = 3;
+			tm->tm_yday = 365;
+			tm->tm_isdst = 0;
+		}
+		err = 0;
 	}
 	return err;
 }
-- 
2.17.1


