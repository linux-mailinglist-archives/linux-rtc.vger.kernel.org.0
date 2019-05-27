Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 177B32B1E8
	for <lists+linux-rtc@lfdr.de>; Mon, 27 May 2019 12:14:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726627AbfE0KOM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 27 May 2019 06:14:12 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52237 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726620AbfE0KOM (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 27 May 2019 06:14:12 -0400
Received: by mail-wm1-f68.google.com with SMTP id y3so15601514wmm.2;
        Mon, 27 May 2019 03:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TmuYH51kzX8mKy0P2eI2D4NQvUxDN5Th1TImaHd5Vlk=;
        b=nG+M5cDzzgD/LnBxKTqFEUV55qjnBB/M/89etXpJP6P8qM6ahhQ/pOK01u/4nodxli
         uemRHW63gIKlKqOlf9qOrQVtI6ztx8hZJoYdpmw1hFDEwMapsoQ2u0SW2fdtHiNklRgX
         AF9buwaMNasC9SQ72QnCJlWj3d8w6QqZrLvCk0fq/O1lubbOHT1REsE1MjayiOAYbtCx
         e3YWwpyc6VmJZWSGF51dXxx1FoRBh0gGa41ZsXK+wD8y+5gPUDChBQ4tlfnWq8b4nilZ
         2Q4qWk6MZBOEKXVc5v9uwU8OeivWlWWyHXMn2gd0CG5kFoP1pAm1ZucWQkliyRIUByHh
         C7zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TmuYH51kzX8mKy0P2eI2D4NQvUxDN5Th1TImaHd5Vlk=;
        b=b12s2qLINjRpAXVxwIHH0Df+UviAGs9QCVWy7WpLIZ2dqJRmn/nO44J5RXxNIndHhc
         F/Dt9MyfSqRRsTwmE5vqqv79iqat7C+qefsSZnsoGcaDbQ101j0lpa56ATnkhsC8R0zy
         VoqPDc2zAXJvYvp0Lx7rwXninlwhOzwJgQyJMR9uhw4KrccfKdiaRXonC+LutoRmx2Do
         KfUpS6aWO/4vPqt9porg4yThygeGtmaQqatCSVxWA+X8ppdT//sYuHRimy2DrnY29ujf
         XsLejLKEVwjeS48xb4BgM9cwiq7fpLho0g6+YSr8Om1JUxYKakTulnGKuf61N9v/Ky90
         WEYQ==
X-Gm-Message-State: APjAAAUCrtvk/hmxTb+gyIY2FCyV8JxiuEM2aJ/Il3NpjutjdHQQYPVs
        +KPpC23OnixGVRW7Rv+BUt4fhBzu
X-Google-Smtp-Source: APXvYqzD6UBtc9yL8dMXvYFrjG5NdEoXVV640n9rRg7FfiBokmTBpykdgawjZ8yY3hQUiVT7L/96QA==
X-Received: by 2002:a7b:c549:: with SMTP id j9mr25453110wmk.114.1558952048566;
        Mon, 27 May 2019 03:14:08 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id h14sm7324163wro.3.2019.05.27.03.14.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 May 2019 03:14:07 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Kartik Kartik <kkartik@nvidia.com>, linux-rtc@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] rtc: tegra: checkpatch and miscellaneous cleanups
Date:   Mon, 27 May 2019 12:13:57 +0200
Message-Id: <20190527101359.5898-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190527101359.5898-1-thierry.reding@gmail.com>
References: <20190527101359.5898-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This set of changes fixes some checkpatch warnings as well as a number
of punctuation and padding inconsistencies.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/rtc/rtc-tegra.c | 154 +++++++++++++++++++++-------------------
 1 file changed, 79 insertions(+), 75 deletions(-)

diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
index f0ce76865434..a67c9d8be4f6 100644
--- a/drivers/rtc/rtc-tegra.c
+++ b/drivers/rtc/rtc-tegra.c
@@ -18,10 +18,10 @@
 #include <linux/rtc.h>
 #include <linux/slab.h>
 
-/* set to 1 = busy every eight 32kHz clocks during copy of sec+msec to AHB */
+/* Set to 1 = busy every eight 32 kHz clocks during copy of sec+msec to AHB. */
 #define TEGRA_RTC_REG_BUSY			0x004
 #define TEGRA_RTC_REG_SECONDS			0x008
-/* when msec is read, the seconds are buffered into shadow seconds. */
+/* When msec is read, the seconds are buffered into shadow seconds. */
 #define TEGRA_RTC_REG_SHADOW_SECONDS		0x00c
 #define TEGRA_RTC_REG_MILLI_SECONDS		0x010
 #define TEGRA_RTC_REG_SECONDS_ALARM0		0x014
@@ -46,44 +46,48 @@
 #define TEGRA_RTC_INTR_STATUS_SEC_ALARM0	(1<<0)
 
 struct tegra_rtc_info {
-	struct platform_device	*pdev;
-	struct rtc_device	*rtc_dev;
-	void __iomem		*rtc_base; /* NULL if not initialized. */
-	struct clk		*clk;
-	int			tegra_rtc_irq; /* alarm and periodic irq */
-	spinlock_t		tegra_rtc_lock;
+	struct platform_device *pdev;
+	struct rtc_device *rtc_dev;
+	void __iomem *rtc_base; /* NULL if not initialized */
+	struct clk *clk;
+	int tegra_rtc_irq; /* alarm and periodic IRQ */
+	spinlock_t tegra_rtc_lock;
 };
 
-/* RTC hardware is busy when it is updating its values over AHB once
- * every eight 32kHz clocks (~250uS).
- * outside of these updates the CPU is free to write.
- * CPU is always free to read.
+/*
+ * RTC hardware is busy when it is updating its values over AHB once every
+ * eight 32 kHz clocks (~250 us). Outside of these updates the CPU is free to
+ * write. CPU is always free to read.
  */
 static inline u32 tegra_rtc_check_busy(struct tegra_rtc_info *info)
 {
 	return readl(info->rtc_base + TEGRA_RTC_REG_BUSY) & 1;
 }
 
-/* Wait for hardware to be ready for writing.
- * This function tries to maximize the amount of time before the next update.
- * It does this by waiting for the RTC to become busy with its periodic update,
- * then returning once the RTC first becomes not busy.
+/*
+ * Wait for hardware to be ready for writing. This function tries to maximize
+ * the amount of time before the next update. It does this by waiting for the
+ * RTC to become busy with its periodic update, then returning once the RTC
+ * first becomes not busy.
+ *
  * This periodic update (where the seconds and milliseconds are copied to the
- * AHB side) occurs every eight 32kHz clocks (~250uS).
- * The behavior of this function allows us to make some assumptions without
- * introducing a race, because 250uS is plenty of time to read/write a value.
+ * AHB side) occurs every eight 32 kHz clocks (~250 us). The behavior of this
+ * function allows us to make some assumptions without introducing a race,
+ * because 250 us is plenty of time to read/write a value.
  */
 static int tegra_rtc_wait_while_busy(struct device *dev)
 {
 	struct tegra_rtc_info *info = dev_get_drvdata(dev);
+	int retries = 500; /* ~490 us is the worst case, ~250 us is best */
 
-	int retries = 500; /* ~490 us is the worst case, ~250 us is best. */
-
-	/* first wait for the RTC to become busy. this is when it
-	 * posts its updated seconds+msec registers to AHB side. */
+	/*
+	 * First wait for the RTC to become busy. This is when it posts its
+	 * updated seconds+msec registers to AHB side.
+	 */
 	while (tegra_rtc_check_busy(info)) {
 		if (!retries--)
 			goto retry_failed;
+
 		udelay(1);
 	}
 
@@ -91,7 +95,7 @@ static int tegra_rtc_wait_while_busy(struct device *dev)
 	return 0;
 
 retry_failed:
-	dev_err(dev, "write failed:retry count exceeded.\n");
+	dev_err(dev, "write failed: retry count exceeded\n");
 	return -ETIMEDOUT;
 }
 
@@ -101,8 +105,10 @@ static int tegra_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	unsigned long sec, msec;
 	unsigned long sl_irq_flags;
 
-	/* RTC hardware copies seconds to shadow seconds when a read
-	 * of milliseconds occurs. use a lock to keep other threads out. */
+	/*
+	 * RTC hardware copies seconds to shadow seconds when a read of
+	 * milliseconds occurs. use a lock to keep other threads out.
+	 */
 	spin_lock_irqsave(&info->tegra_rtc_lock, sl_irq_flags);
 
 	msec = readl(info->rtc_base + TEGRA_RTC_REG_MILLI_SECONDS);
@@ -112,7 +118,7 @@ static int tegra_rtc_read_time(struct device *dev, struct rtc_time *tm)
 
 	rtc_time64_to_tm(sec, tm);
 
-	dev_vdbg(dev, "time read as %lu. %ptR\n", sec, tm);
+	dev_vdbg(dev, "time read as %u, %ptR\n", sec, tm);
 
 	return 0;
 }
@@ -123,18 +129,18 @@ static int tegra_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	unsigned long sec;
 	int ret;
 
-	/* convert tm to seconds. */
+	/* convert tm to seconds */
 	sec = rtc_tm_to_time64(tm);
 
-	dev_vdbg(dev, "time set to %lu. %ptR\n", sec, tm);
+	dev_vdbg(dev, "time set to %u, %ptR\n", sec, tm);
 
-	/* seconds only written if wait succeeded. */
+	/* seconds only written if wait succeeded */
 	ret = tegra_rtc_wait_while_busy(dev);
 	if (!ret)
 		writel(sec, info->rtc_base + TEGRA_RTC_REG_SECONDS);
 
 	dev_vdbg(dev, "time read back as %d\n",
-		readl(info->rtc_base + TEGRA_RTC_REG_SECONDS));
+		 readl(info->rtc_base + TEGRA_RTC_REG_SECONDS));
 
 	return ret;
 }
@@ -143,15 +149,15 @@ static int tegra_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 {
 	struct tegra_rtc_info *info = dev_get_drvdata(dev);
 	unsigned long sec;
-	unsigned tmp;
+	unsigned int tmp;
 
 	sec = readl(info->rtc_base + TEGRA_RTC_REG_SECONDS_ALARM0);
 
 	if (sec == 0) {
-		/* alarm is disabled. */
+		/* alarm is disabled */
 		alarm->enabled = 0;
 	} else {
-		/* alarm is enabled. */
+		/* alarm is enabled */
 		alarm->enabled = 1;
 		rtc_time64_to_tm(sec, &alarm->time);
 	}
@@ -165,13 +171,13 @@ static int tegra_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 static int tegra_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
 {
 	struct tegra_rtc_info *info = dev_get_drvdata(dev);
-	unsigned status;
 	unsigned long sl_irq_flags;
+	unsigned int status;
 
 	tegra_rtc_wait_while_busy(dev);
 	spin_lock_irqsave(&info->tegra_rtc_lock, sl_irq_flags);
 
-	/* read the original value, and OR in the flag. */
+	/* read the original value, and OR in the flag */
 	status = readl(info->rtc_base + TEGRA_RTC_REG_INTR_MASK);
 	if (enabled)
 		status |= TEGRA_RTC_INTR_MASK_SEC_ALARM0; /* set it */
@@ -198,14 +204,14 @@ static int tegra_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 	tegra_rtc_wait_while_busy(dev);
 	writel(sec, info->rtc_base + TEGRA_RTC_REG_SECONDS_ALARM0);
 	dev_vdbg(dev, "alarm read back as %d\n",
-		readl(info->rtc_base + TEGRA_RTC_REG_SECONDS_ALARM0));
+		 readl(info->rtc_base + TEGRA_RTC_REG_SECONDS_ALARM0));
 
 	/* if successfully written and alarm is enabled ... */
 	if (sec) {
 		tegra_rtc_alarm_irq_enable(dev, 1);
-		dev_vdbg(dev, "alarm set as %lu. %ptR\n", sec, &alarm->time);
+		dev_vdbg(dev, "alarm set as %u, %ptR\n", sec, &alarm->time);
 	} else {
-		/* disable alarm if 0 or write error. */
+		/* disable alarm if 0 or write error */
 		dev_vdbg(dev, "alarm disabled\n");
 		tegra_rtc_alarm_irq_enable(dev, 0);
 	}
@@ -228,25 +234,26 @@ static irqreturn_t tegra_rtc_irq_handler(int irq, void *data)
 	struct device *dev = data;
 	struct tegra_rtc_info *info = dev_get_drvdata(dev);
 	unsigned long events = 0;
-	unsigned status;
 	unsigned long sl_irq_flags;
+	unsigned int status;
 
 	status = readl(info->rtc_base + TEGRA_RTC_REG_INTR_STATUS);
 	if (status) {
-		/* clear the interrupt masks and status on any irq. */
+		/* clear the interrupt masks and status on any IRQ */
 		tegra_rtc_wait_while_busy(dev);
+
 		spin_lock_irqsave(&info->tegra_rtc_lock, sl_irq_flags);
 		writel(0, info->rtc_base + TEGRA_RTC_REG_INTR_MASK);
 		writel(status, info->rtc_base + TEGRA_RTC_REG_INTR_STATUS);
 		spin_unlock_irqrestore(&info->tegra_rtc_lock, sl_irq_flags);
 	}
 
-	/* check if Alarm */
-	if ((status & TEGRA_RTC_INTR_STATUS_SEC_ALARM0))
+	/* check if alarm */
+	if (status & TEGRA_RTC_INTR_STATUS_SEC_ALARM0)
 		events |= RTC_IRQF | RTC_AF;
 
-	/* check if Periodic */
-	if ((status & TEGRA_RTC_INTR_STATUS_SEC_CDN_ALARM))
+	/* check if periodic */
+	if (status & TEGRA_RTC_INTR_STATUS_SEC_CDN_ALARM)
 		events |= RTC_IRQF | RTC_PF;
 
 	rtc_update_irq(info->rtc_dev, 1, events);
@@ -255,11 +262,11 @@ static irqreturn_t tegra_rtc_irq_handler(int irq, void *data)
 }
 
 static const struct rtc_class_ops tegra_rtc_ops = {
-	.read_time	= tegra_rtc_read_time,
-	.set_time	= tegra_rtc_set_time,
-	.read_alarm	= tegra_rtc_read_alarm,
-	.set_alarm	= tegra_rtc_set_alarm,
-	.proc		= tegra_rtc_proc,
+	.read_time = tegra_rtc_read_time,
+	.set_time = tegra_rtc_set_time,
+	.read_alarm = tegra_rtc_read_alarm,
+	.set_alarm = tegra_rtc_set_alarm,
+	.proc = tegra_rtc_proc,
 	.alarm_irq_enable = tegra_rtc_alarm_irq_enable,
 };
 
@@ -275,8 +282,7 @@ static int __init tegra_rtc_probe(struct platform_device *pdev)
 	struct resource *res;
 	int ret;
 
-	info = devm_kzalloc(&pdev->dev, sizeof(struct tegra_rtc_info),
-		GFP_KERNEL);
+	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
 	if (!info)
 		return -ENOMEM;
 
@@ -308,13 +314,13 @@ static int __init tegra_rtc_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	/* set context info. */
+	/* set context info */
 	info->pdev = pdev;
 	spin_lock_init(&info->tegra_rtc_lock);
 
 	platform_set_drvdata(pdev, info);
 
-	/* clear out the hardware. */
+	/* clear out the hardware */
 	writel(0, info->rtc_base + TEGRA_RTC_REG_SECONDS_ALARM0);
 	writel(0xffffffff, info->rtc_base + TEGRA_RTC_REG_INTR_STATUS);
 	writel(0, info->rtc_base + TEGRA_RTC_REG_INTR_MASK);
@@ -322,19 +328,16 @@ static int __init tegra_rtc_probe(struct platform_device *pdev)
 	device_init_wakeup(&pdev->dev, 1);
 
 	ret = devm_request_irq(&pdev->dev, info->tegra_rtc_irq,
-			tegra_rtc_irq_handler, IRQF_TRIGGER_HIGH,
-			dev_name(&pdev->dev), &pdev->dev);
+			       tegra_rtc_irq_handler, IRQF_TRIGGER_HIGH,
+			       dev_name(&pdev->dev), &pdev->dev);
 	if (ret) {
-		dev_err(&pdev->dev,
-			"Unable to request interrupt for device (err=%d).\n",
-			ret);
+		dev_err(&pdev->dev, "failed to request interrupt: %d\n", ret);
 		goto disable_clk;
 	}
 
 	ret = rtc_register_device(info->rtc_dev);
 	if (ret) {
-		dev_err(&pdev->dev, "Unable to register device (err=%d).\n",
-			ret);
+		dev_err(&pdev->dev, "failed to register device: %d\n", ret);
 		goto disable_clk;
 	}
 
@@ -363,18 +366,18 @@ static int tegra_rtc_suspend(struct device *dev)
 
 	tegra_rtc_wait_while_busy(dev);
 
-	/* only use ALARM0 as a wake source. */
+	/* only use ALARM0 as a wake source */
 	writel(0xffffffff, info->rtc_base + TEGRA_RTC_REG_INTR_STATUS);
 	writel(TEGRA_RTC_INTR_STATUS_SEC_ALARM0,
 		info->rtc_base + TEGRA_RTC_REG_INTR_MASK);
 
 	dev_vdbg(dev, "alarm sec = %d\n",
-		readl(info->rtc_base + TEGRA_RTC_REG_SECONDS_ALARM0));
+		 readl(info->rtc_base + TEGRA_RTC_REG_SECONDS_ALARM0));
 
-	dev_vdbg(dev, "Suspend (device_may_wakeup=%d) irq:%d\n",
-		device_may_wakeup(dev), info->tegra_rtc_irq);
+	dev_vdbg(dev, "Suspend (device_may_wakeup=%d) IRQ:%d\n",
+		 device_may_wakeup(dev), info->tegra_rtc_irq);
 
-	/* leave the alarms on as a wake source. */
+	/* leave the alarms on as a wake source */
 	if (device_may_wakeup(dev))
 		enable_irq_wake(info->tegra_rtc_irq);
 
@@ -386,8 +389,9 @@ static int tegra_rtc_resume(struct device *dev)
 	struct tegra_rtc_info *info = dev_get_drvdata(dev);
 
 	dev_vdbg(dev, "Resume (device_may_wakeup=%d)\n",
-		device_may_wakeup(dev));
-	/* alarms were left on as a wake source, turn them off. */
+		 device_may_wakeup(dev));
+
+	/* alarms were left on as a wake source, turn them off */
 	if (device_may_wakeup(dev))
 		disable_irq_wake(info->tegra_rtc_irq);
 
@@ -399,18 +403,17 @@ static SIMPLE_DEV_PM_OPS(tegra_rtc_pm_ops, tegra_rtc_suspend, tegra_rtc_resume);
 
 static void tegra_rtc_shutdown(struct platform_device *pdev)
 {
-	dev_vdbg(&pdev->dev, "disabling interrupts.\n");
+	dev_vdbg(&pdev->dev, "disabling interrupts\n");
 	tegra_rtc_alarm_irq_enable(&pdev->dev, 0);
 }
 
-MODULE_ALIAS("platform:tegra_rtc");
 static struct platform_driver tegra_rtc_driver = {
-	.remove		= tegra_rtc_remove,
-	.shutdown	= tegra_rtc_shutdown,
-	.driver		= {
-		.name	= "tegra_rtc",
+	.remove = tegra_rtc_remove,
+	.shutdown = tegra_rtc_shutdown,
+	.driver = {
+		.name = "tegra_rtc",
 		.of_match_table = tegra_rtc_dt_match,
-		.pm	= &tegra_rtc_pm_ops,
+		.pm = &tegra_rtc_pm_ops,
 	},
 };
 
@@ -418,4 +421,5 @@ module_platform_driver_probe(tegra_rtc_driver, tegra_rtc_probe);
 
 MODULE_AUTHOR("Jon Mayo <jmayo@nvidia.com>");
 MODULE_DESCRIPTION("driver for Tegra internal RTC");
+MODULE_ALIAS("platform:tegra_rtc");
 MODULE_LICENSE("GPL");
-- 
2.21.0

