Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 769F145AE0
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Jun 2019 12:48:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbfFNKrx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 14 Jun 2019 06:47:53 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37645 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726900AbfFNKrw (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 14 Jun 2019 06:47:52 -0400
Received: by mail-wr1-f68.google.com with SMTP id v14so2019888wrr.4;
        Fri, 14 Jun 2019 03:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ooBSZFxnR/dPszzxCle1YHB8FtLq/QjO6NDm1BiMKMA=;
        b=Zi3iP8QgPhFS+d20VAcHgPZje4xCDSoj4ulL3j6zP7udO3rmgY9nuQaiTybf+0j+k7
         nUaKP3b0XdOjClrC6233gAlczWV55HyU9oelRSIcWMuIsAHN891moqcV6uLq3QI0mhov
         SslNsSvfUOanCNVrS5b60TAunrLyWj2ZvDZ52LLS1U2NSatwb9kO3sXZOR5CRmD7FHy/
         vT+bkVC+4QkkEsSdqnNNFok4d9NLH3h3zEBBRHG7W3RFQC+2azkODoZ03VkMiIvyCwRM
         DTYp3lNScrZezb3zrkDVS0/fYEHjqn5XLAmxsqCjQkpWmgUEDOp4yj2xIUjEYhCBQpF8
         ZuzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ooBSZFxnR/dPszzxCle1YHB8FtLq/QjO6NDm1BiMKMA=;
        b=jz4XQ+u/jK8Hu6f/D3p8Uviu1VVzOI8HX3jQdXaRKPZZw2gGFlNCDSSglMuqU/+2+2
         Js3j+ZAh+hEuqsPli2Fn8UyV6hAt899xCHiC8QOn7MmADChTQ9YscU3Ieno0gY7SynQF
         zPhi/Btj2rMB196Uq0NnADh0JaoceQikqKfOiLDVglbsEHiCt/qYodBs5WNAKqAepFYR
         rCXyvEPRCjSawfSdYLP9jVHYe4W7jI98njbyDKN39qave6pn8H+x7e3q0fGvfrETbLup
         SfGJoCXjsJmAUpvNVYFR5PUgWJkKKrfkVkD94VPGasXhNm3JEMR016nRLjlns+PEFqLU
         bhlw==
X-Gm-Message-State: APjAAAVx22kHjTAtQN27x+q9ttthLRNgYsTadp43oXQckvzQhKmSv5sV
        65m1okrdK8GkKdZ7H70RmwM=
X-Google-Smtp-Source: APXvYqwY69ItL8/qEMLnYgZGPysaKgns2sbuPFe6dWMv8TZiqIdVRAF5PrZNCGjdD/8/+1NL0H7Yiw==
X-Received: by 2002:adf:fdc2:: with SMTP id i2mr14243116wrs.146.1560509270754;
        Fri, 14 Jun 2019 03:47:50 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id 11sm3223157wmd.23.2019.06.14.03.47.50
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 03:47:50 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] rtc: tegra: Implement suspend clock source
Date:   Fri, 14 Jun 2019 12:47:47 +0200
Message-Id: <20190614104747.19712-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190614104747.19712-1-thierry.reding@gmail.com>
References: <20190614104747.19712-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The suspend clock source for Tegra210 and earlier is currently
implemented in the Tegra timer driver. However, the suspend clock source
code accesses registers that are part of the RTC hardware block, so both
can step on each others' toes. In practice this isn't an issue, but
there is no reason why the RTC driver can't implement the clock source,
so move the code over to the tegra-rtc driver.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/clocksource/timer-tegra.c | 44 -------------------------------
 drivers/rtc/rtc-tegra.c           | 42 +++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+), 44 deletions(-)

diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/timer-tegra.c
index e6608141cccb..87eac618924d 100644
--- a/drivers/clocksource/timer-tegra.c
+++ b/drivers/clocksource/timer-tegra.c
@@ -21,10 +21,6 @@
 
 #include "timer-of.h"
 
-#define RTC_SECONDS		0x08
-#define RTC_SHADOW_SECONDS	0x0c
-#define RTC_MILLISECONDS	0x10
-
 #define TIMERUS_CNTR_1US	0x10
 #define TIMERUS_USEC_CFG	0x14
 #define TIMERUS_CNTR_FREEZE	0x4c
@@ -164,34 +160,6 @@ static struct delay_timer tegra_delay_timer = {
 };
 #endif
 
-static struct timer_of suspend_rtc_to = {
-	.flags = TIMER_OF_BASE | TIMER_OF_CLOCK,
-};
-
-/*
- * tegra_rtc_read - Reads the Tegra RTC registers
- * Care must be taken that this function is not called while the
- * tegra_rtc driver could be executing to avoid race conditions
- * on the RTC shadow register
- */
-static u64 tegra_rtc_read_ms(struct clocksource *cs)
-{
-	void __iomem *reg_base = timer_of_base(&suspend_rtc_to);
-
-	u32 ms = readl_relaxed(reg_base + RTC_MILLISECONDS);
-	u32 s = readl_relaxed(reg_base + RTC_SHADOW_SECONDS);
-
-	return (u64)s * MSEC_PER_SEC + ms;
-}
-
-static struct clocksource suspend_rtc_clocksource = {
-	.name	= "tegra_suspend_timer",
-	.rating	= 200,
-	.read	= tegra_rtc_read_ms,
-	.mask	= CLOCKSOURCE_MASK(32),
-	.flags	= CLOCK_SOURCE_IS_CONTINUOUS | CLOCK_SOURCE_SUSPEND_NONSTOP,
-};
-
 static inline unsigned int tegra_base_for_cpu(int cpu, bool tegra20)
 {
 	if (tegra20) {
@@ -385,15 +353,3 @@ static int __init tegra20_init_timer(struct device_node *np)
 	return tegra_init_timer(np, true, rating);
 }
 TIMER_OF_DECLARE(tegra20_timer, "nvidia,tegra20-timer", tegra20_init_timer);
-
-static int __init tegra20_init_rtc(struct device_node *np)
-{
-	int ret;
-
-	ret = timer_of_init(np, &suspend_rtc_to);
-	if (ret)
-		return ret;
-
-	return clocksource_register_hz(&suspend_rtc_clocksource, 1000);
-}
-TIMER_OF_DECLARE(tegra20_rtc, "nvidia,tegra20-rtc", tegra20_init_rtc);
diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
index 8fa1b3febf69..6da54264a27a 100644
--- a/drivers/rtc/rtc-tegra.c
+++ b/drivers/rtc/rtc-tegra.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/clocksource.h>
 #include <linux/delay.h>
 #include <linux/init.h>
 #include <linux/io.h>
@@ -52,8 +53,15 @@ struct tegra_rtc_info {
 	struct clk *clk;
 	int irq; /* alarm and periodic IRQ */
 	spinlock_t lock;
+
+	struct clocksource clksrc;
 };
 
+static struct tegra_rtc_info *to_tegra_rtc(struct clocksource *clksrc)
+{
+	return container_of(clksrc, struct tegra_rtc_info, clksrc);
+}
+
 /*
  * RTC hardware is busy when it is updating its values over AHB once every
  * eight 32 kHz clocks (~250 us). Outside of these updates the CPU is free to
@@ -268,6 +276,17 @@ static const struct rtc_class_ops tegra_rtc_ops = {
 	.alarm_irq_enable = tegra_rtc_alarm_irq_enable,
 };
 
+static u64 tegra_rtc_read_ms(struct clocksource *clksrc)
+{
+	struct tegra_rtc_info *info = to_tegra_rtc(clksrc);
+	u32 ms, s;
+
+	ms = readl_relaxed(info->base + TEGRA_RTC_REG_MILLI_SECONDS);
+	s = readl_relaxed(info->base + TEGRA_RTC_REG_SHADOW_SECONDS);
+
+	return (u64)s * MSEC_PER_SEC + ms;
+}
+
 static const struct of_device_id tegra_rtc_dt_match[] = {
 	{ .compatible = "nvidia,tegra20-rtc", },
 	{}
@@ -339,6 +358,28 @@ static int tegra_rtc_probe(struct platform_device *pdev)
 		goto disable_clk;
 	}
 
+	/*
+	 * The Tegra RTC is the only reliable clock source that persists
+	 * across an SC7 transition (VDD_CPU and VDD_CORE off) on Tegra210
+	 * and earlier. Starting with Tegra186, the ARM v8 architected timer
+	 * is in an always on power partition and its reference clock keeps
+	 * running during SC7. Therefore, we technically don't need to have
+	 * the RTC register as a clock source on Tegra186 and later, but it
+	 * doesn't hurt either, so we just register it unconditionally here.
+	 */
+	info->clksrc.name = "tegra_rtc";
+	info->clksrc.rating = 200;
+	info->clksrc.read = tegra_rtc_read_ms;
+	info->clksrc.mask = CLOCKSOURCE_MASK(32);
+	info->clksrc.flags = CLOCK_SOURCE_SUSPEND_NONSTOP |
+			     CLOCK_SOURCE_IS_CONTINUOUS;
+
+	ret = clocksource_register_hz(&info->clksrc, 1000);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register clock source: %d\n", ret);
+		goto disable_clk;
+	}
+
 	dev_notice(&pdev->dev, "Tegra internal Real Time Clock\n");
 
 	return 0;
@@ -352,6 +393,7 @@ static int tegra_rtc_remove(struct platform_device *pdev)
 {
 	struct tegra_rtc_info *info = platform_get_drvdata(pdev);
 
+	clocksource_unregister(&info->clksrc);
 	clk_disable_unprepare(info->clk);
 
 	return 0;
-- 
2.21.0

