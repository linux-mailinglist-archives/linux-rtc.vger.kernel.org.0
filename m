Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C0673D3C89
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Jul 2021 17:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235620AbhGWO6w (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 23 Jul 2021 10:58:52 -0400
Received: from foss.arm.com ([217.140.110.172]:47646 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235611AbhGWO6t (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 23 Jul 2021 10:58:49 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4086C142F;
        Fri, 23 Jul 2021 08:39:22 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2CC893F73D;
        Fri, 23 Jul 2021 08:39:20 -0700 (PDT)
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
Subject: [PATCH v8 03/11] rtc: sun6i: Fix time overflow handling
Date:   Fri, 23 Jul 2021 16:38:30 +0100
Message-Id: <20210723153838.6785-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210723153838.6785-1-andre.przywara@arm.com>
References: <20210723153838.6785-1-andre.przywara@arm.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Using "unsigned long" for UNIX timestamps is never a good idea, and
comparing the value of such a variable against U32_MAX does not do
anything useful on 32-bit systems.

Use the proper time64_t type when dealing with timestamps, and avoid
cutting down the time range unnecessarily. This also fixes the flawed
check for the alarm time being too far into the future.

The check for this condition is actually somewhat theoretical, as the
RTC counts till 2033 only anyways, and 2^32 seconds from now is not
before the year 2157 - at which point I hope nobody will be using this
hardware anymore.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/rtc/rtc-sun6i.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index adec1b14a8de..c551ebf0ac00 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -138,7 +138,7 @@ struct sun6i_rtc_dev {
 	const struct sun6i_rtc_clk_data *data;
 	void __iomem *base;
 	int irq;
-	unsigned long alarm;
+	time64_t alarm;
 
 	struct clk_hw hw;
 	struct clk_hw *int_osc;
@@ -510,10 +510,8 @@ static int sun6i_rtc_setalarm(struct device *dev, struct rtc_wkalrm *wkalrm)
 	struct sun6i_rtc_dev *chip = dev_get_drvdata(dev);
 	struct rtc_time *alrm_tm = &wkalrm->time;
 	struct rtc_time tm_now;
-	unsigned long time_now = 0;
-	unsigned long time_set = 0;
-	unsigned long time_gap = 0;
-	int ret = 0;
+	time64_t time_now, time_set;
+	int ret;
 
 	ret = sun6i_rtc_gettime(dev, &tm_now);
 	if (ret < 0) {
@@ -528,9 +526,7 @@ static int sun6i_rtc_setalarm(struct device *dev, struct rtc_wkalrm *wkalrm)
 		return -EINVAL;
 	}
 
-	time_gap = time_set - time_now;
-
-	if (time_gap > U32_MAX) {
+	if ((time_set - time_now) > U32_MAX) {
 		dev_err(dev, "Date too far in the future\n");
 		return -EINVAL;
 	}
@@ -539,7 +535,7 @@ static int sun6i_rtc_setalarm(struct device *dev, struct rtc_wkalrm *wkalrm)
 	writel(0, chip->base + SUN6I_ALRM_COUNTER);
 	usleep_range(100, 300);
 
-	writel(time_gap, chip->base + SUN6I_ALRM_COUNTER);
+	writel(time_set - time_now, chip->base + SUN6I_ALRM_COUNTER);
 	chip->alarm = time_set;
 
 	sun6i_rtc_setaie(wkalrm->enabled, chip);
-- 
2.17.6

