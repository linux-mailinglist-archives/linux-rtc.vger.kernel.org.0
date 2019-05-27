Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C77D72B1EB
	for <lists+linux-rtc@lfdr.de>; Mon, 27 May 2019 12:14:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726747AbfE0KON (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 27 May 2019 06:14:13 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42655 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbfE0KOM (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 27 May 2019 06:14:12 -0400
Received: by mail-wr1-f65.google.com with SMTP id l2so16350028wrb.9;
        Mon, 27 May 2019 03:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CkdQbOhWlgYxxNnXAykjjSfHQvYq2DhZItkrLI9WQsc=;
        b=GMEAxT60CsHl2Lr6CAv6qHhUX1O9mRPAJWrbfMEY7eTRMWcvnN01EH2oiczaZsjGwz
         loniueVXJXw8U4HcbSbSr+44Hu4UTjfmPY7jLKtFO2lX5YnR82eUtarHt4Ox7orLtsJ2
         tBCdHeFwFOqtHIHgy5InfTO+rhVRLNw2+t4xTBwWPudub66XPxElGPR16qwoxBEMDk8E
         Ytuf+vhgVwqU2MqO4V0CX7NCNZrTGbMPtE5FtsYOExYGEPml+USz4wLGAXKHVQxjwtct
         Wa2bseWe5K6TwJPSygbZGdeLbNiNVut3xQgHwlDiW1eDKF9uqeqBRlnA4eftw8tQdCqU
         Q4vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CkdQbOhWlgYxxNnXAykjjSfHQvYq2DhZItkrLI9WQsc=;
        b=pnhCsgJz46qHmHrgJhhySNbbnhlnDIXqhCsMlgMJRWovmOwfCxFUKaKGhEJ1dFSpit
         hoy+7OnPZjEmR3jxu3O6buEaMXNPaF4gemecBEPjFhe/QC4z7+mPj5uKtfJI5QEd9uhk
         NttAdtMsXa9UTuNJ4uCEVibF0aYhjye1xsrd4hY56bZ+y0TX15Y7ne1oCs9TV0TWm2uu
         9d7WR+t/HwEL1Crv2yw9OYBVD6VJs9kvHTIxbPnmLC95WM11CSdHUpK2qd7h34eDvLf1
         Npz2YUgMPXqixjYVFqj3oYSDrw+1HD0kVo98tBRqNHp5xMv/17M5zulYwgur18LUY0My
         8V+Q==
X-Gm-Message-State: APjAAAWTgu/Q0qu3qzORrdPKhrdXUwafxK1ijJ03G/j+a4yXyjz1cwrb
        UbHnL9lLG9wqn1XfpqnMmRmSEwMr
X-Google-Smtp-Source: APXvYqx6nyjryY1B0WuUAmcJylxn+vB0gEz1gLWmXg97hBkC1fe+dXWG55Mi7+WE4xuSUH+Q4mcmpw==
X-Received: by 2002:adf:8bc5:: with SMTP id w5mr31672229wra.132.1558952050164;
        Mon, 27 May 2019 03:14:10 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id s10sm8901565wrt.66.2019.05.27.03.14.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 May 2019 03:14:09 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Kartik Kartik <kkartik@nvidia.com>, linux-rtc@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] rtc: tegra: Use consistent variable names and types
Date:   Mon, 27 May 2019 12:13:58 +0200
Message-Id: <20190527101359.5898-3-thierry.reding@gmail.com>
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

Many of the variables have redundant prefixes or suffixes. Drop all of
them where not necessary for context. Also make sure to use data types
consistently. For instance, values read from 32-bit register accessors
should be stored in u32.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/rtc/rtc-tegra.c | 118 ++++++++++++++++++++--------------------
 1 file changed, 58 insertions(+), 60 deletions(-)

diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
index a67c9d8be4f6..b68ba2dd1d36 100644
--- a/drivers/rtc/rtc-tegra.c
+++ b/drivers/rtc/rtc-tegra.c
@@ -47,11 +47,11 @@
 
 struct tegra_rtc_info {
 	struct platform_device *pdev;
-	struct rtc_device *rtc_dev;
-	void __iomem *rtc_base; /* NULL if not initialized */
+	struct rtc_device *rtc;
+	void __iomem *base; /* NULL if not initialized */
 	struct clk *clk;
-	int tegra_rtc_irq; /* alarm and periodic IRQ */
-	spinlock_t tegra_rtc_lock;
+	int irq; /* alarm and periodic IRQ */
+	spinlock_t lock;
 };
 
 /*
@@ -61,7 +61,7 @@ struct tegra_rtc_info {
  */
 static inline u32 tegra_rtc_check_busy(struct tegra_rtc_info *info)
 {
-	return readl(info->rtc_base + TEGRA_RTC_REG_BUSY) & 1;
+	return readl(info->base + TEGRA_RTC_REG_BUSY) & 1;
 }
 
 /*
@@ -102,19 +102,19 @@ static int tegra_rtc_wait_while_busy(struct device *dev)
 static int tegra_rtc_read_time(struct device *dev, struct rtc_time *tm)
 {
 	struct tegra_rtc_info *info = dev_get_drvdata(dev);
-	unsigned long sec, msec;
-	unsigned long sl_irq_flags;
+	unsigned long flags;
+	u32 sec, msec;
 
 	/*
 	 * RTC hardware copies seconds to shadow seconds when a read of
 	 * milliseconds occurs. use a lock to keep other threads out.
 	 */
-	spin_lock_irqsave(&info->tegra_rtc_lock, sl_irq_flags);
+	spin_lock_irqsave(&info->lock, flags);
 
-	msec = readl(info->rtc_base + TEGRA_RTC_REG_MILLI_SECONDS);
-	sec = readl(info->rtc_base + TEGRA_RTC_REG_SHADOW_SECONDS);
+	msec = readl(info->base + TEGRA_RTC_REG_MILLI_SECONDS);
+	sec = readl(info->base + TEGRA_RTC_REG_SHADOW_SECONDS);
 
-	spin_unlock_irqrestore(&info->tegra_rtc_lock, sl_irq_flags);
+	spin_unlock_irqrestore(&info->lock, flags);
 
 	rtc_time64_to_tm(sec, tm);
 
@@ -126,7 +126,7 @@ static int tegra_rtc_read_time(struct device *dev, struct rtc_time *tm)
 static int tegra_rtc_set_time(struct device *dev, struct rtc_time *tm)
 {
 	struct tegra_rtc_info *info = dev_get_drvdata(dev);
-	unsigned long sec;
+	u32 sec;
 	int ret;
 
 	/* convert tm to seconds */
@@ -137,10 +137,10 @@ static int tegra_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	/* seconds only written if wait succeeded */
 	ret = tegra_rtc_wait_while_busy(dev);
 	if (!ret)
-		writel(sec, info->rtc_base + TEGRA_RTC_REG_SECONDS);
+		writel(sec, info->base + TEGRA_RTC_REG_SECONDS);
 
 	dev_vdbg(dev, "time read back as %d\n",
-		 readl(info->rtc_base + TEGRA_RTC_REG_SECONDS));
+		 readl(info->base + TEGRA_RTC_REG_SECONDS));
 
 	return ret;
 }
@@ -148,10 +148,9 @@ static int tegra_rtc_set_time(struct device *dev, struct rtc_time *tm)
 static int tegra_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 {
 	struct tegra_rtc_info *info = dev_get_drvdata(dev);
-	unsigned long sec;
-	unsigned int tmp;
+	u32 sec, value;
 
-	sec = readl(info->rtc_base + TEGRA_RTC_REG_SECONDS_ALARM0);
+	sec = readl(info->base + TEGRA_RTC_REG_SECONDS_ALARM0);
 
 	if (sec == 0) {
 		/* alarm is disabled */
@@ -162,8 +161,8 @@ static int tegra_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 		rtc_time64_to_tm(sec, &alarm->time);
 	}
 
-	tmp = readl(info->rtc_base + TEGRA_RTC_REG_INTR_STATUS);
-	alarm->pending = (tmp & TEGRA_RTC_INTR_STATUS_SEC_ALARM0) != 0;
+	value = readl(info->base + TEGRA_RTC_REG_INTR_STATUS);
+	alarm->pending = (value & TEGRA_RTC_INTR_STATUS_SEC_ALARM0) != 0;
 
 	return 0;
 }
@@ -171,22 +170,22 @@ static int tegra_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 static int tegra_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
 {
 	struct tegra_rtc_info *info = dev_get_drvdata(dev);
-	unsigned long sl_irq_flags;
-	unsigned int status;
+	unsigned long flags;
+	u32 status;
 
 	tegra_rtc_wait_while_busy(dev);
-	spin_lock_irqsave(&info->tegra_rtc_lock, sl_irq_flags);
+	spin_lock_irqsave(&info->lock, flags);
 
 	/* read the original value, and OR in the flag */
-	status = readl(info->rtc_base + TEGRA_RTC_REG_INTR_MASK);
+	status = readl(info->base + TEGRA_RTC_REG_INTR_MASK);
 	if (enabled)
 		status |= TEGRA_RTC_INTR_MASK_SEC_ALARM0; /* set it */
 	else
 		status &= ~TEGRA_RTC_INTR_MASK_SEC_ALARM0; /* clear it */
 
-	writel(status, info->rtc_base + TEGRA_RTC_REG_INTR_MASK);
+	writel(status, info->base + TEGRA_RTC_REG_INTR_MASK);
 
-	spin_unlock_irqrestore(&info->tegra_rtc_lock, sl_irq_flags);
+	spin_unlock_irqrestore(&info->lock, flags);
 
 	return 0;
 }
@@ -194,7 +193,7 @@ static int tegra_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
 static int tegra_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 {
 	struct tegra_rtc_info *info = dev_get_drvdata(dev);
-	unsigned long sec;
+	u32 sec;
 
 	if (alarm->enabled)
 		sec = rtc_tm_to_time64(&alarm->time);
@@ -202,9 +201,9 @@ static int tegra_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 		sec = 0;
 
 	tegra_rtc_wait_while_busy(dev);
-	writel(sec, info->rtc_base + TEGRA_RTC_REG_SECONDS_ALARM0);
+	writel(sec, info->base + TEGRA_RTC_REG_SECONDS_ALARM0);
 	dev_vdbg(dev, "alarm read back as %d\n",
-		 readl(info->rtc_base + TEGRA_RTC_REG_SECONDS_ALARM0));
+		 readl(info->base + TEGRA_RTC_REG_SECONDS_ALARM0));
 
 	/* if successfully written and alarm is enabled ... */
 	if (sec) {
@@ -233,19 +232,18 @@ static irqreturn_t tegra_rtc_irq_handler(int irq, void *data)
 {
 	struct device *dev = data;
 	struct tegra_rtc_info *info = dev_get_drvdata(dev);
-	unsigned long events = 0;
-	unsigned long sl_irq_flags;
-	unsigned int status;
+	unsigned long events = 0, flags;
+	u32 status;
 
-	status = readl(info->rtc_base + TEGRA_RTC_REG_INTR_STATUS);
+	status = readl(info->base + TEGRA_RTC_REG_INTR_STATUS);
 	if (status) {
 		/* clear the interrupt masks and status on any IRQ */
 		tegra_rtc_wait_while_busy(dev);
 
-		spin_lock_irqsave(&info->tegra_rtc_lock, sl_irq_flags);
-		writel(0, info->rtc_base + TEGRA_RTC_REG_INTR_MASK);
-		writel(status, info->rtc_base + TEGRA_RTC_REG_INTR_STATUS);
-		spin_unlock_irqrestore(&info->tegra_rtc_lock, sl_irq_flags);
+		spin_lock_irqsave(&info->lock, flags);
+		writel(0, info->base + TEGRA_RTC_REG_INTR_MASK);
+		writel(status, info->base + TEGRA_RTC_REG_INTR_STATUS);
+		spin_unlock_irqrestore(&info->lock, flags);
 	}
 
 	/* check if alarm */
@@ -256,7 +254,7 @@ static irqreturn_t tegra_rtc_irq_handler(int irq, void *data)
 	if (status & TEGRA_RTC_INTR_STATUS_SEC_CDN_ALARM)
 		events |= RTC_IRQF | RTC_PF;
 
-	rtc_update_irq(info->rtc_dev, 1, events);
+	rtc_update_irq(info->rtc, 1, events);
 
 	return IRQ_HANDLED;
 }
@@ -287,9 +285,9 @@ static int __init tegra_rtc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	info->rtc_base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(info->rtc_base))
-		return PTR_ERR(info->rtc_base);
+	info->base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(info->base))
+		return PTR_ERR(info->base);
 
 	ret = platform_get_irq(pdev, 0);
 	if (ret <= 0) {
@@ -297,14 +295,14 @@ static int __init tegra_rtc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	info->tegra_rtc_irq = ret;
+	info->irq = ret;
 
-	info->rtc_dev = devm_rtc_allocate_device(&pdev->dev);
-	if (IS_ERR(info->rtc_dev))
-		return PTR_ERR(info->rtc_dev);
+	info->rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(info->rtc))
+		return PTR_ERR(info->rtc);
 
-	info->rtc_dev->ops = &tegra_rtc_ops;
-	info->rtc_dev->range_max = U32_MAX;
+	info->rtc->ops = &tegra_rtc_ops;
+	info->rtc->range_max = U32_MAX;
 
 	info->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(info->clk))
@@ -316,26 +314,26 @@ static int __init tegra_rtc_probe(struct platform_device *pdev)
 
 	/* set context info */
 	info->pdev = pdev;
-	spin_lock_init(&info->tegra_rtc_lock);
+	spin_lock_init(&info->lock);
 
 	platform_set_drvdata(pdev, info);
 
 	/* clear out the hardware */
-	writel(0, info->rtc_base + TEGRA_RTC_REG_SECONDS_ALARM0);
-	writel(0xffffffff, info->rtc_base + TEGRA_RTC_REG_INTR_STATUS);
-	writel(0, info->rtc_base + TEGRA_RTC_REG_INTR_MASK);
+	writel(0, info->base + TEGRA_RTC_REG_SECONDS_ALARM0);
+	writel(0xffffffff, info->base + TEGRA_RTC_REG_INTR_STATUS);
+	writel(0, info->base + TEGRA_RTC_REG_INTR_MASK);
 
 	device_init_wakeup(&pdev->dev, 1);
 
-	ret = devm_request_irq(&pdev->dev, info->tegra_rtc_irq,
-			       tegra_rtc_irq_handler, IRQF_TRIGGER_HIGH,
-			       dev_name(&pdev->dev), &pdev->dev);
+	ret = devm_request_irq(&pdev->dev, info->irq, tegra_rtc_irq_handler,
+			       IRQF_TRIGGER_HIGH, dev_name(&pdev->dev),
+			       &pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to request interrupt: %d\n", ret);
 		goto disable_clk;
 	}
 
-	ret = rtc_register_device(info->rtc_dev);
+	ret = rtc_register_device(info->rtc);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register device: %d\n", ret);
 		goto disable_clk;
@@ -367,19 +365,19 @@ static int tegra_rtc_suspend(struct device *dev)
 	tegra_rtc_wait_while_busy(dev);
 
 	/* only use ALARM0 as a wake source */
-	writel(0xffffffff, info->rtc_base + TEGRA_RTC_REG_INTR_STATUS);
+	writel(0xffffffff, info->base + TEGRA_RTC_REG_INTR_STATUS);
 	writel(TEGRA_RTC_INTR_STATUS_SEC_ALARM0,
-		info->rtc_base + TEGRA_RTC_REG_INTR_MASK);
+	       info->base + TEGRA_RTC_REG_INTR_MASK);
 
 	dev_vdbg(dev, "alarm sec = %d\n",
-		 readl(info->rtc_base + TEGRA_RTC_REG_SECONDS_ALARM0));
+		 readl(info->base + TEGRA_RTC_REG_SECONDS_ALARM0));
 
 	dev_vdbg(dev, "Suspend (device_may_wakeup=%d) IRQ:%d\n",
-		 device_may_wakeup(dev), info->tegra_rtc_irq);
+		 device_may_wakeup(dev), info->irq);
 
 	/* leave the alarms on as a wake source */
 	if (device_may_wakeup(dev))
-		enable_irq_wake(info->tegra_rtc_irq);
+		enable_irq_wake(info->irq);
 
 	return 0;
 }
@@ -393,7 +391,7 @@ static int tegra_rtc_resume(struct device *dev)
 
 	/* alarms were left on as a wake source, turn them off */
 	if (device_may_wakeup(dev))
-		disable_irq_wake(info->tegra_rtc_irq);
+		disable_irq_wake(info->irq);
 
 	return 0;
 }
-- 
2.21.0

