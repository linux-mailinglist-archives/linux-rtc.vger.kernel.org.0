Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27C27388BC0
	for <lists+linux-rtc@lfdr.de>; Wed, 19 May 2021 12:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232768AbhESKnl (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 19 May 2021 06:43:41 -0400
Received: from foss.arm.com ([217.140.110.172]:58890 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348367AbhESKng (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 19 May 2021 06:43:36 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4809314BF;
        Wed, 19 May 2021 03:42:17 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2CABC3F792;
        Wed, 19 May 2021 03:42:15 -0700 (PDT)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     Rob Herring <robh@kernel.org>, Icenowy Zheng <icenowy@aosc.io>,
        Samuel Holland <samuel@sholland.org>,
        Ondrej Jirman <megous@megous.com>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Subject: [PATCH v6 04/17] rtc: sun6i: Add support for linear day storage
Date:   Wed, 19 May 2021 11:41:39 +0100
Message-Id: <20210519104152.21119-5-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210519104152.21119-1-andre.przywara@arm.com>
References: <20210519104152.21119-1-andre.przywara@arm.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Newer versions of the Allwinner RTC, as for instance found in the H616
SoC, no longer store a broken-down day/month/year representation in the
RTC_DAY_REG, but just a linear day number.
The user manual does not give any indication about the expected epoch
time of this day count, but the BSP kernel uses the UNIX epoch, which
allows easy support due to existing conversion functions in the kernel.

Allow tagging a compatible string with a flag, and use that to mark
those new RTCs. Then convert between a UNIX day number (converted into
seconds) and the broken-down day representation using mktime64() and
time64_to_tm() in the set_time/get_time functions.

That enables support for the RTC in those new chips.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/rtc/rtc-sun6i.c | 58 +++++++++++++++++++++++++++++------------
 1 file changed, 41 insertions(+), 17 deletions(-)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index adec1b14a8de..0228e9dfd969 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -133,12 +133,15 @@ struct sun6i_rtc_clk_data {
 	unsigned int has_auto_swt : 1;
 };
 
+#define RTC_LINEAR_DAY	BIT(0)
+
 struct sun6i_rtc_dev {
 	struct rtc_device *rtc;
 	const struct sun6i_rtc_clk_data *data;
 	void __iomem *base;
 	int irq;
 	unsigned long alarm;
+	unsigned long flags;
 
 	struct clk_hw hw;
 	struct clk_hw *int_osc;
@@ -471,17 +474,30 @@ static int sun6i_rtc_gettime(struct device *dev, struct rtc_time *rtc_tm)
 	rtc_tm->tm_min  = SUN6I_TIME_GET_MIN_VALUE(time);
 	rtc_tm->tm_hour = SUN6I_TIME_GET_HOUR_VALUE(time);
 
-	rtc_tm->tm_mday = SUN6I_DATE_GET_DAY_VALUE(date);
-	rtc_tm->tm_mon  = SUN6I_DATE_GET_MON_VALUE(date);
-	rtc_tm->tm_year = SUN6I_DATE_GET_YEAR_VALUE(date);
-
-	rtc_tm->tm_mon  -= 1;
-
-	/*
-	 * switch from (data_year->min)-relative offset to
-	 * a (1900)-relative one
-	 */
-	rtc_tm->tm_year += SUN6I_YEAR_OFF;
+	if (chip->flags & RTC_LINEAR_DAY) {
+		struct tm tm;
+
+		/*
+		 * Newer chips store a linear day number, the manual
+		 * does not mandate any epoch base. The BSP driver uses
+		 * the UNIX epoch, let's just copy that, as it's the
+		 * easiest anyway.
+		 */
+		time64_to_tm((date & 0xffff) * 3600ULL * 24, 0, &tm);
+		rtc_tm->tm_mday = tm.tm_mday;
+		rtc_tm->tm_mon  = tm.tm_mon;
+		rtc_tm->tm_year = tm.tm_year;
+	} else {
+		rtc_tm->tm_mday = SUN6I_DATE_GET_DAY_VALUE(date);
+		rtc_tm->tm_mon  = SUN6I_DATE_GET_MON_VALUE(date) - 1;
+		rtc_tm->tm_year = SUN6I_DATE_GET_YEAR_VALUE(date);
+
+		/*
+		 * switch from (data_year->min)-relative offset to
+		 * a (1900)-relative one
+		 */
+		rtc_tm->tm_year += SUN6I_YEAR_OFF;
+	}
 
 	return 0;
 }
@@ -571,15 +587,21 @@ static int sun6i_rtc_settime(struct device *dev, struct rtc_time *rtc_tm)
 	u32 date = 0;
 	u32 time = 0;
 
-	rtc_tm->tm_year -= SUN6I_YEAR_OFF;
 	rtc_tm->tm_mon += 1;
 
-	date = SUN6I_DATE_SET_DAY_VALUE(rtc_tm->tm_mday) |
-		SUN6I_DATE_SET_MON_VALUE(rtc_tm->tm_mon)  |
-		SUN6I_DATE_SET_YEAR_VALUE(rtc_tm->tm_year);
+	if (chip->flags & RTC_LINEAR_DAY) {
+		date = mktime64(rtc_tm->tm_year + 1900, rtc_tm->tm_mon,
+				rtc_tm->tm_mday, 0, 0, 0) / (3600ULL * 24);
+	} else {
+		rtc_tm->tm_year -= SUN6I_YEAR_OFF;
+
+		date = SUN6I_DATE_SET_DAY_VALUE(rtc_tm->tm_mday) |
+			SUN6I_DATE_SET_MON_VALUE(rtc_tm->tm_mon)  |
+			SUN6I_DATE_SET_YEAR_VALUE(rtc_tm->tm_year);
 
-	if (is_leap_year(rtc_tm->tm_year + SUN6I_YEAR_MIN))
-		date |= SUN6I_LEAP_SET_VALUE(1);
+		if (is_leap_year(rtc_tm->tm_year + SUN6I_YEAR_MIN))
+			date |= SUN6I_LEAP_SET_VALUE(1);
+	}
 
 	time = SUN6I_TIME_SET_SEC_VALUE(rtc_tm->tm_sec)  |
 		SUN6I_TIME_SET_MIN_VALUE(rtc_tm->tm_min)  |
@@ -678,6 +700,8 @@ static int sun6i_rtc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, chip);
 
+	chip->flags = (unsigned long)of_device_get_match_data(&pdev->dev);
+
 	chip->irq = platform_get_irq(pdev, 0);
 	if (chip->irq < 0)
 		return chip->irq;
-- 
2.17.5

