Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D671D3DCE5A
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Aug 2021 02:40:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232201AbhHBAlD (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 1 Aug 2021 20:41:03 -0400
Received: from foss.arm.com ([217.140.110.172]:57194 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232166AbhHBAlA (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sun, 1 Aug 2021 20:41:00 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5758D6E;
        Sun,  1 Aug 2021 17:40:51 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC91F3F66F;
        Sun,  1 Aug 2021 17:40:49 -0700 (PDT)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     Rob Herring <robh@kernel.org>, Icenowy Zheng <icenowy@aosc.io>,
        Samuel Holland <samuel@sholland.org>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        Ondrej Jirman <megous@megous.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Subject: [PATCH v9 04/11] rtc: sun6i: Add support for linear day storage
Date:   Mon,  2 Aug 2021 01:39:45 +0100
Message-Id: <20210802003952.19942-5-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210802003952.19942-1-andre.przywara@arm.com>
References: <20210802003952.19942-1-andre.przywara@arm.com>
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

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/rtc/rtc-sun6i.c | 69 +++++++++++++++++++++++++++--------------
 1 file changed, 46 insertions(+), 23 deletions(-)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index c551ebf0ac00..a980d4e7408d 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -110,6 +110,8 @@
 #define SUN6I_YEAR_MIN				1970
 #define SUN6I_YEAR_OFF				(SUN6I_YEAR_MIN - 1900)
 
+#define SECS_PER_DAY				(24 * 3600ULL)
+
 /*
  * There are other differences between models, including:
  *
@@ -133,12 +135,15 @@ struct sun6i_rtc_clk_data {
 	unsigned int has_auto_swt : 1;
 };
 
+#define RTC_LINEAR_DAY	BIT(0)
+
 struct sun6i_rtc_dev {
 	struct rtc_device *rtc;
 	const struct sun6i_rtc_clk_data *data;
 	void __iomem *base;
 	int irq;
 	time64_t alarm;
+	unsigned long flags;
 
 	struct clk_hw hw;
 	struct clk_hw *int_osc;
@@ -467,22 +472,30 @@ static int sun6i_rtc_gettime(struct device *dev, struct rtc_time *rtc_tm)
 	} while ((date != readl(chip->base + SUN6I_RTC_YMD)) ||
 		 (time != readl(chip->base + SUN6I_RTC_HMS)));
 
+	if (chip->flags & RTC_LINEAR_DAY) {
+		/*
+		 * Newer chips store a linear day number, the manual
+		 * does not mandate any epoch base. The BSP driver uses
+		 * the UNIX epoch, let's just copy that, as it's the
+		 * easiest anyway.
+		 */
+		rtc_time64_to_tm((date & 0xffff) * SECS_PER_DAY, rtc_tm);
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
+
 	rtc_tm->tm_sec  = SUN6I_TIME_GET_SEC_VALUE(time);
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
-
 	return 0;
 }
 
@@ -567,20 +580,25 @@ static int sun6i_rtc_settime(struct device *dev, struct rtc_time *rtc_tm)
 	u32 date = 0;
 	u32 time = 0;
 
-	rtc_tm->tm_year -= SUN6I_YEAR_OFF;
-	rtc_tm->tm_mon += 1;
-
-	date = SUN6I_DATE_SET_DAY_VALUE(rtc_tm->tm_mday) |
-		SUN6I_DATE_SET_MON_VALUE(rtc_tm->tm_mon)  |
-		SUN6I_DATE_SET_YEAR_VALUE(rtc_tm->tm_year);
-
-	if (is_leap_year(rtc_tm->tm_year + SUN6I_YEAR_MIN))
-		date |= SUN6I_LEAP_SET_VALUE(1);
-
 	time = SUN6I_TIME_SET_SEC_VALUE(rtc_tm->tm_sec)  |
 		SUN6I_TIME_SET_MIN_VALUE(rtc_tm->tm_min)  |
 		SUN6I_TIME_SET_HOUR_VALUE(rtc_tm->tm_hour);
 
+	if (chip->flags & RTC_LINEAR_DAY) {
+		/* The division will cut off the H:M:S part of rtc_tm. */
+		date = div_u64(rtc_tm_to_time64(rtc_tm), SECS_PER_DAY);
+	} else {
+		rtc_tm->tm_year -= SUN6I_YEAR_OFF;
+		rtc_tm->tm_mon += 1;
+
+		date = SUN6I_DATE_SET_DAY_VALUE(rtc_tm->tm_mday) |
+			SUN6I_DATE_SET_MON_VALUE(rtc_tm->tm_mon)  |
+			SUN6I_DATE_SET_YEAR_VALUE(rtc_tm->tm_year);
+
+		if (is_leap_year(rtc_tm->tm_year + SUN6I_YEAR_MIN))
+			date |= SUN6I_LEAP_SET_VALUE(1);
+	}
+
 	/* Check whether registers are writable */
 	if (sun6i_rtc_wait(chip, SUN6I_LOSC_CTRL,
 			   SUN6I_LOSC_CTRL_ACC_MASK, 50)) {
@@ -674,6 +692,8 @@ static int sun6i_rtc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, chip);
 
+	chip->flags = (unsigned long)of_device_get_match_data(&pdev->dev);
+
 	chip->irq = platform_get_irq(pdev, 0);
 	if (chip->irq < 0)
 		return chip->irq;
@@ -720,7 +740,10 @@ static int sun6i_rtc_probe(struct platform_device *pdev)
 		return PTR_ERR(chip->rtc);
 
 	chip->rtc->ops = &sun6i_rtc_ops;
-	chip->rtc->range_max = 2019686399LL; /* 2033-12-31 23:59:59 */
+	if (chip->flags & RTC_LINEAR_DAY)
+		chip->rtc->range_max = (65536 * SECS_PER_DAY) - 1;
+	else
+		chip->rtc->range_max = 2019686399LL; /* 2033-12-31 23:59:59 */
 
 	ret = devm_rtc_register_device(chip->rtc);
 	if (ret)
-- 
2.17.6

