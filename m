Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 789874A36B2
	for <lists+linux-rtc@lfdr.de>; Sun, 30 Jan 2022 15:33:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355029AbiA3Ody (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 30 Jan 2022 09:33:54 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:35383 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355013AbiA3Odx (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 30 Jan 2022 09:33:53 -0500
Received: from quad ([82.142.10.94]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MfqCF-1mcweL3sr3-00gH3A; Sun, 30
 Jan 2022 15:33:41 +0100
From:   Laurent Vivier <laurent@vivier.eu>
To:     linux-kernel@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-rtc@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Stephen Boyd <sboyd@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v14 3/5] rtc: goldfish: use gf_ioread32()/gf_iowrite32()
Date:   Sun, 30 Jan 2022 15:33:31 +0100
Message-Id: <20220130143333.552646-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220130143333.552646-1-laurent@vivier.eu>
References: <20220130143333.552646-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:bHmWEvU7yiI++LjcKngpoRyqI5VDMjXRzezkehnKdQ4ueieLD5a
 2ZA1ZFW743lw6e83wXNuQbi+I4KjMxYfL1Fm0+BLHkc85F2pNPaVXRIoEcG0lTNaD1Ry6cl
 Flg3hqm9MzhWBAiLOwmnZRHn8xtgM8zjGnvGIFtrr0FXcm+hLitJLZUX9QHP6mFuIIhnFGX
 U1EkEhHARxOo3x9ZNah7Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:DZx8QAc2iRc=:ynJdKonDpWBeZJYXAhfsyv
 DmTLSDGBuXOinjlQsmw/nSTEehQpNdXodxzgLl5hGvspUGXk5E9P79B7i2C6vl//4WijtXbX8
 nRyuRUthtWVOHQtDKE3e/8142xIWetGaZB7b34dtg3dDZJGHkT7G4rNolVJKyeMA/VUQYFet1
 1juZsq6CW2gbN7IslwS4wWQFV7VL1Qhe37LPDKD59Y2mDlq9wu3yYtrfcI8EAZSgHotM73PKP
 C5QViIGYt3ekdm21kdLB1b7VoJHiT7L1Z64QxFfKR5wwoJWyyIWPvy9zX9L8zA6HcLcQUFi4Y
 NDRcVB+hBQYaxIeDm+PZ/eensQXNPUkOESttH5XvlZ99woU5rVvcShY5ULt93WR4mz6LerMJN
 UgMj56SM/679SdfpqWen7dA5uiNS129vrJ+0xAtyZFyFpGBIPaY7j0Xj0ier2D3XfE+tzL+Sp
 5UfMNas/uufdz2LWt/i2jPCpyhFG/EQ/+1JHeI2eMrun16LKkzpl2rXIkJ0HMIjeryiiOsOc4
 MSiippIu5BabMjJYXo8Now8wUtsdLyKJ+Kgs/AcZQyQp4fmB/zFdCSIjg6jn/e/tH6bEURUOA
 +x+V942YleGHUWuLOapjqkbReCUow1r3fFgNyEKjLON0EbzFHFl+im3frPYbqIitqIBXrZHwn
 mlvae6xMiHbMzvxncoy6PmZJcMSNaKhPXYwVT1rSO0BqfrF95y4+QmoNV6JZLlNl+F9g=
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

replace readl()/writel() by gf_ioread32()/gf_iowrite32()
as done for goldfish-tty.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 drivers/rtc/rtc-goldfish.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/rtc/rtc-goldfish.c b/drivers/rtc/rtc-goldfish.c
index 7ab95d052644..eb1929b0cbb6 100644
--- a/drivers/rtc/rtc-goldfish.c
+++ b/drivers/rtc/rtc-goldfish.c
@@ -10,6 +10,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/rtc.h>
+#include <linux/goldfish.h>
 
 #define TIMER_TIME_LOW		0x00	/* get low bits of current time  */
 					/*   and update TIMER_TIME_HIGH  */
@@ -41,8 +42,8 @@ static int goldfish_rtc_read_alarm(struct device *dev,
 	rtcdrv = dev_get_drvdata(dev);
 	base = rtcdrv->base;
 
-	rtc_alarm_low = readl(base + TIMER_ALARM_LOW);
-	rtc_alarm_high = readl(base + TIMER_ALARM_HIGH);
+	rtc_alarm_low = gf_ioread32(base + TIMER_ALARM_LOW);
+	rtc_alarm_high = gf_ioread32(base + TIMER_ALARM_HIGH);
 	rtc_alarm = (rtc_alarm_high << 32) | rtc_alarm_low;
 
 	do_div(rtc_alarm, NSEC_PER_SEC);
@@ -50,7 +51,7 @@ static int goldfish_rtc_read_alarm(struct device *dev,
 
 	rtc_time64_to_tm(rtc_alarm, &alrm->time);
 
-	if (readl(base + TIMER_ALARM_STATUS))
+	if (gf_ioread32(base + TIMER_ALARM_STATUS))
 		alrm->enabled = 1;
 	else
 		alrm->enabled = 0;
@@ -71,18 +72,18 @@ static int goldfish_rtc_set_alarm(struct device *dev,
 
 	if (alrm->enabled) {
 		rtc_alarm64 = rtc_tm_to_time64(&alrm->time) * NSEC_PER_SEC;
-		writel((rtc_alarm64 >> 32), base + TIMER_ALARM_HIGH);
-		writel(rtc_alarm64, base + TIMER_ALARM_LOW);
-		writel(1, base + TIMER_IRQ_ENABLED);
+		gf_iowrite32((rtc_alarm64 >> 32), base + TIMER_ALARM_HIGH);
+		gf_iowrite32(rtc_alarm64, base + TIMER_ALARM_LOW);
+		gf_iowrite32(1, base + TIMER_IRQ_ENABLED);
 	} else {
 		/*
 		 * if this function was called with enabled=0
 		 * then it could mean that the application is
 		 * trying to cancel an ongoing alarm
 		 */
-		rtc_status_reg = readl(base + TIMER_ALARM_STATUS);
+		rtc_status_reg = gf_ioread32(base + TIMER_ALARM_STATUS);
 		if (rtc_status_reg)
-			writel(1, base + TIMER_CLEAR_ALARM);
+			gf_iowrite32(1, base + TIMER_CLEAR_ALARM);
 	}
 
 	return 0;
@@ -98,9 +99,9 @@ static int goldfish_rtc_alarm_irq_enable(struct device *dev,
 	base = rtcdrv->base;
 
 	if (enabled)
-		writel(1, base + TIMER_IRQ_ENABLED);
+		gf_iowrite32(1, base + TIMER_IRQ_ENABLED);
 	else
-		writel(0, base + TIMER_IRQ_ENABLED);
+		gf_iowrite32(0, base + TIMER_IRQ_ENABLED);
 
 	return 0;
 }
@@ -110,7 +111,7 @@ static irqreturn_t goldfish_rtc_interrupt(int irq, void *dev_id)
 	struct goldfish_rtc *rtcdrv = dev_id;
 	void __iomem *base = rtcdrv->base;
 
-	writel(1, base + TIMER_CLEAR_INTERRUPT);
+	gf_iowrite32(1, base + TIMER_CLEAR_INTERRUPT);
 
 	rtc_update_irq(rtcdrv->rtc, 1, RTC_IRQF | RTC_AF);
 
@@ -128,8 +129,8 @@ static int goldfish_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	rtcdrv = dev_get_drvdata(dev);
 	base = rtcdrv->base;
 
-	time_low = readl(base + TIMER_TIME_LOW);
-	time_high = readl(base + TIMER_TIME_HIGH);
+	time_low = gf_ioread32(base + TIMER_TIME_LOW);
+	time_high = gf_ioread32(base + TIMER_TIME_HIGH);
 	time = (time_high << 32) | time_low;
 
 	do_div(time, NSEC_PER_SEC);
@@ -149,8 +150,8 @@ static int goldfish_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	base = rtcdrv->base;
 
 	now64 = rtc_tm_to_time64(tm) * NSEC_PER_SEC;
-	writel((now64 >> 32), base + TIMER_TIME_HIGH);
-	writel(now64, base + TIMER_TIME_LOW);
+	gf_iowrite32((now64 >> 32), base + TIMER_TIME_HIGH);
+	gf_iowrite32(now64, base + TIMER_TIME_LOW);
 
 	return 0;
 }
-- 
2.34.1

