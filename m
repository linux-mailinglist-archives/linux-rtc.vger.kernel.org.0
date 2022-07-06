Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 105965687CB
	for <lists+linux-rtc@lfdr.de>; Wed,  6 Jul 2022 14:08:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233056AbiGFMIE (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 6 Jul 2022 08:08:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232410AbiGFMID (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 6 Jul 2022 08:08:03 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 461E129C9A;
        Wed,  6 Jul 2022 05:08:02 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.92,249,1650898800"; 
   d="scan'208";a="126935580"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 06 Jul 2022 21:08:01 +0900
Received: from localhost.localdomain (unknown [10.226.93.24])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9248A40065CD;
        Wed,  6 Jul 2022 21:07:58 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Michel Pollet <michel.pollet@bp.renesas.com>,
        linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH] rtc: rzn1: Fix RTC_RD_TIME: Invalid argument
Date:   Wed,  6 Jul 2022 13:07:56 +0100
Message-Id: <20220706120756.777378-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.9 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This patch fixes the issue RTC_RD_TIME: Invalid argument with the below
use case.

Steps to reproduce:
------------------
date -s "2022-12-31 23:59:55";hwclock -w
hwclock; sleep 10; hwclock

Original result:
---------------
Sat Dec 31 23:59:55 UTC 2022
Sat Dec 31 23:59:56 2022  0.000000 seconds
hwclock: RTC_RD_TIME: Invalid argument

Result after the fix:
--------------------
Sat Dec 31 23:59:55 UTC 2022
Sat Dec 31 23:59:56 2022  0.000000 seconds
Sun Jan  1 00:00:06 2023  0.000000 seconds

Fixes: deeb4b5393e1 ("rtc: rzn1: Add new RTC driver")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
This patch fix is based on [1]
[1] https://github.com/renesas-rz/rzn1_linux/blob/rzn1-stable-v4.19/drivers/rtc/rtc-rzn1.c
---
 drivers/rtc/rtc-rzn1.c | 47 ++++++++++++++++++++++++++++--------------
 1 file changed, 32 insertions(+), 15 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index ac788799c8e3..0f99b4fd3c4b 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -88,6 +88,35 @@ static unsigned int rzn1_rtc_tm_to_wday(struct rtc_time *tm)
 	return (days + 4) % 7;
 }
 
+static void bcd2tm(struct rtc_time *tm)
+{
+	tm->tm_sec = bcd2bin(tm->tm_sec);
+	tm->tm_min = bcd2bin(tm->tm_min);
+	tm->tm_hour = bcd2bin(tm->tm_hour);
+	tm->tm_wday = bcd2bin(tm->tm_wday);
+	tm->tm_mday = bcd2bin(tm->tm_mday);
+	tm->tm_mon = bcd2bin(tm->tm_mon) - 1;
+	/* epoch == 1900 */
+	tm->tm_year = bcd2bin(tm->tm_year) + 100;
+}
+
+static int tm2bcd(struct rtc_time *tm)
+{
+	if (rtc_valid_tm(tm) != 0)
+		return -EINVAL;
+
+	tm->tm_sec = bin2bcd(tm->tm_sec);
+	tm->tm_min = bin2bcd(tm->tm_min);
+	tm->tm_hour = bin2bcd(tm->tm_hour);
+	tm->tm_wday = bin2bcd(rzn1_rtc_tm_to_wday(tm));
+	tm->tm_mday = bin2bcd(tm->tm_mday);
+	tm->tm_mon = bin2bcd(tm->tm_mon + 1);
+	/* epoch == 1900 */
+	tm->tm_year = bin2bcd(tm->tm_year - 100);
+
+	return 0;
+}
+
 static int rzn1_rtc_read_time(struct device *dev, struct rtc_time *tm)
 {
 	struct rzn1_rtc *rtc = dev_get_drvdata(dev);
@@ -106,14 +135,7 @@ static int rzn1_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	if (tm->tm_sec != secs)
 		rzn1_rtc_get_time_snapshot(rtc, tm);
 
-	tm->tm_sec = bcd2bin(tm->tm_sec);
-	tm->tm_min = bcd2bin(tm->tm_min);
-	tm->tm_hour = bcd2bin(tm->tm_hour);
-	tm->tm_wday = bcd2bin(tm->tm_wday);
-	tm->tm_mday = bcd2bin(tm->tm_mday);
-	tm->tm_mon = bcd2bin(tm->tm_mon);
-	tm->tm_year = bcd2bin(tm->tm_year);
-
+	bcd2tm(tm);
 	return 0;
 }
 
@@ -123,13 +145,8 @@ static int rzn1_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	u32 val;
 	int ret;
 
-	tm->tm_sec = bin2bcd(tm->tm_sec);
-	tm->tm_min = bin2bcd(tm->tm_min);
-	tm->tm_hour = bin2bcd(tm->tm_hour);
-	tm->tm_wday = bin2bcd(rzn1_rtc_tm_to_wday(tm));
-	tm->tm_mday = bin2bcd(tm->tm_mday);
-	tm->tm_mon = bin2bcd(tm->tm_mon);
-	tm->tm_year = bin2bcd(tm->tm_year);
+	if (tm2bcd(tm) < 0)
+		return -EINVAL;
 
 	val = readl(rtc->base + RZN1_RTC_CTL2);
 	if (!(val & RZN1_RTC_CTL2_STOPPED)) {
-- 
2.25.1

