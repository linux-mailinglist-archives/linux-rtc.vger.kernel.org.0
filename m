Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74C913A7CBA
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Jun 2021 13:07:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230500AbhFOLJT (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 15 Jun 2021 07:09:19 -0400
Received: from foss.arm.com ([217.140.110.172]:60488 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230350AbhFOLJP (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 15 Jun 2021 07:09:15 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B87712FC;
        Tue, 15 Jun 2021 04:07:11 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3174A3F719;
        Tue, 15 Jun 2021 04:07:09 -0700 (PDT)
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
Subject: [PATCH v7 05/19] rtc: sun6i: Add support for broken-down alarm registers
Date:   Tue, 15 Jun 2021 12:06:22 +0100
Message-Id: <20210615110636.23403-6-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210615110636.23403-1-andre.przywara@arm.com>
References: <20210615110636.23403-1-andre.przywara@arm.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Newer versions of the Allwinner RTC, for instance as found in the H616
SoC, not only store the current day as a linear number, but also change
the way the alarm is handled: There are now two registers, that
explicitly store the wakeup time, in the same format as the current
time.

Add support for that variant by writing the requested wakeup time
directly into the registers, instead of programming the seconds left, as
the old SoCs required.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/rtc/rtc-sun6i.c | 60 +++++++++++++++++++++++++++--------------
 1 file changed, 40 insertions(+), 20 deletions(-)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index e4fc6e4f2bfb..54bd47fb0a5f 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -48,7 +48,8 @@
 
 /* Alarm 0 (counter) */
 #define SUN6I_ALRM_COUNTER			0x0020
-#define SUN6I_ALRM_CUR_VAL			0x0024
+/* This holds the remaining alarm seconds on older SoCs (current value) */
+#define SUN6I_ALRM_COUNTER_HMS			0x0024
 #define SUN6I_ALRM_EN				0x0028
 #define SUN6I_ALRM_EN_CNT_EN			BIT(0)
 #define SUN6I_ALRM_IRQ_EN			0x002c
@@ -523,36 +524,55 @@ static int sun6i_rtc_setalarm(struct device *dev, struct rtc_wkalrm *wkalrm)
 	struct sun6i_rtc_dev *chip = dev_get_drvdata(dev);
 	struct rtc_time *alrm_tm = &wkalrm->time;
 	struct rtc_time tm_now;
-	unsigned long time_now = 0;
 	unsigned long time_set = 0;
-	unsigned long time_gap = 0;
+	unsigned long counter_val, counter_val_hms;
 	int ret = 0;
 
-	ret = sun6i_rtc_gettime(dev, &tm_now);
-	if (ret < 0) {
-		dev_err(dev, "Error in getting time\n");
-		return -EINVAL;
-	}
-
 	time_set = rtc_tm_to_time64(alrm_tm);
-	time_now = rtc_tm_to_time64(&tm_now);
-	if (time_set <= time_now) {
-		dev_err(dev, "Date to set in the past\n");
-		return -EINVAL;
-	}
-
-	time_gap = time_set - time_now;
 
-	if (time_gap > U32_MAX) {
-		dev_err(dev, "Date too far in the future\n");
-		return -EINVAL;
+	if (chip->flags & RTC_LINEAR_DAY) {
+		/*
+		 * The alarm registers hold the actual alarm time, encoded
+		 * in the same way (linear day + HMS) as the current time.
+		 */
+		counter_val_hms = SUN6I_TIME_SET_SEC_VALUE(alrm_tm->tm_sec)  |
+				  SUN6I_TIME_SET_MIN_VALUE(alrm_tm->tm_min)  |
+				  SUN6I_TIME_SET_HOUR_VALUE(alrm_tm->tm_hour);
+		counter_val = mktime64(alrm_tm->tm_year + 1900, alrm_tm->tm_mon,
+				       alrm_tm->tm_mday, 0, 0, 0) / SEC_PER_DAY;
+	} else {
+		/* The alarm register holds the number of seconds left. */
+		unsigned long time_now;
+
+		ret = sun6i_rtc_gettime(dev, &tm_now);
+		if (ret < 0) {
+			dev_err(dev, "Error in getting time\n");
+			return -EINVAL;
+		}
+
+		time_now = rtc_tm_to_time64(&tm_now);
+		if (time_set <= time_now) {
+			dev_err(dev, "Date to set in the past\n");
+			return -EINVAL;
+		}
+
+		counter_val = time_set - time_now;
+
+		if (counter_val > U32_MAX) {
+			dev_err(dev, "Date too far in the future\n");
+			return -EINVAL;
+		}
 	}
 
 	sun6i_rtc_setaie(0, chip);
 	writel(0, chip->base + SUN6I_ALRM_COUNTER);
+	if (chip->flags & RTC_LINEAR_DAY)
+		writel(0, chip->base + SUN6I_ALRM_COUNTER_HMS);
 	usleep_range(100, 300);
 
-	writel(time_gap, chip->base + SUN6I_ALRM_COUNTER);
+	writel(counter_val, chip->base + SUN6I_ALRM_COUNTER);
+	if (chip->flags & RTC_LINEAR_DAY)
+		writel(counter_val_hms, chip->base + SUN6I_ALRM_COUNTER_HMS);
 	chip->alarm = time_set;
 
 	sun6i_rtc_setaie(wkalrm->enabled, chip);
-- 
2.17.5

