Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78EBD10C203
	for <lists+linux-rtc@lfdr.de>; Thu, 28 Nov 2019 02:56:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727778AbfK1B4o (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 27 Nov 2019 20:56:44 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:34751 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728314AbfK1B4o (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 27 Nov 2019 20:56:44 -0500
Received: by mail-qk1-f195.google.com with SMTP id d202so13066530qkb.1
        for <linux-rtc@vger.kernel.org>; Wed, 27 Nov 2019 17:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b2jYTzYvu9z5ZwqgHAwAUH8/t7GKlVKRUe0t8gvRT4s=;
        b=WMQk1wcotonBxesVr1jPeLviq5Kqjgc2743hcQv+ak6MLZ5aQjt2s/i9JANUyLsosx
         h3+0Il/Vo9F6GuvgsZcCWChYk8K/+igpMxwsV7ByhISfH83GYUyfiUQLOYlpw51UZ1nb
         OiuOsdTjwt2+pSHLQRZdhDzAr0R5eOZXQ7w63xc7BtS6rpW2d2aJ2CJlrOhwf28kLTUT
         xNZg8YP1Pb2huhXhO/dc+X+Y3zFwj2abCJHfMZivQkRAVdFUAxC05u/CrBjPMhsVs7F1
         5aEXWHRIbKXOLoEatiEu0RJ8YUIJzcwIdb9D5/8dSzEy8ciioW/k19l50XjwcsHNOXqE
         jBcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b2jYTzYvu9z5ZwqgHAwAUH8/t7GKlVKRUe0t8gvRT4s=;
        b=ktJhU/2rGs7Ad5He3yfrTNbx4FTXz3/0o4639+gYn7DXgdROkILlmQrwaQH7t2oddS
         OIDJSH9UlzdlMmPy/ehyZRy6iCdOD6M1S9KfvJv06QXKdxR88r53QgyV0qIts18YIegL
         CfnTQbjnCbcnluPv9Q1eDbN2eIVxCE6MwCIqYXOSX5fEr4tAK9WqD343lLvUj3MoGZ4W
         12vla8xFfKpzLNVk+BG0aXJRoGc/EvjWnJlKxrwwI2XVzUsjey8Ly2MIhnWTKaKTN68S
         wXQ59jkUmYSgYxddeL6hgAOs4W98q+dRQBmoUn9z6SNXpszjvclWs3RHcbehjwb/QCIb
         0BLw==
X-Gm-Message-State: APjAAAWhWUvkSWoNv2RKm88zRvdhYstnUz6wJOB6MzArdtD2xLQZ1Q/W
        I9AvqvWrhcgDmBtrC8qU+jw=
X-Google-Smtp-Source: APXvYqxelwQD9vMWVDVpiYb3kP485fSZ5vWM+doeFmO2cREbczEBCxlWZlbX/msvjwqycSjpTqLnhw==
X-Received: by 2002:a37:a845:: with SMTP id r66mr7862594qke.0.1574906203353;
        Wed, 27 Nov 2019 17:56:43 -0800 (PST)
Received: from jfddesk.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.gmail.com with ESMTPSA id m27sm9064572qta.21.2019.11.27.17.56.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Nov 2019 17:56:42 -0800 (PST)
From:   Jean-Francois Dagenais <jeff.dagenais@gmail.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     git@xilinx.com, linux-rtc@vger.kernel.org, michal.simek@xilinx.com,
        champagne.guillaume.c@gmail.com, maxime.roussinbelanger@gmail.com,
        Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Subject: [PATCH 2/2] rtc: zynqmp: fix invalid read_time before 1 second
Date:   Wed, 27 Nov 2019 20:56:13 -0500
Message-Id: <20191128015613.10003-2-jeff.dagenais@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191128015613.10003-1-jeff.dagenais@gmail.com>
References: <20191128015613.10003-1-jeff.dagenais@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

When reaching the read_time implementation before 1 second has elapsed
since power on, SEC bit from status register is not yet set. read_time
incorrectly assumes that there is a pending set_time not yet reflected
in CURRENT_TIME and proceeds to use SET_TIME_READ (RTC_SET_TM_RD in the
code). This register contains garbage at this moment and this is
returned as the current time.

Here we switch to using the SEC interrupt to signal the pending set time
operation. The old ISR is renamed xlnx_rtc_alarm_interrupt and a new one
xlnx_rtc_sec_interrupt is created to handle disabling the SEC interrupt
once the pending write is known to be complete.

read_time now detects whether a pending write exists or not using the
interrupt mask (!interrupt enabled). The interrupt is only enabled when
actually performing a set_time.

Signed-off-by: Guillaume Champagne <champagne.guillaume.c@gmail.com>
Signed-off-by: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Tested-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
---
 drivers/rtc/rtc-zynqmp.c | 69 +++++++++++++++++++++++++++++-----------
 1 file changed, 50 insertions(+), 19 deletions(-)

diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
index cb78900ec1f5..9fec89c4f573 100644
--- a/drivers/rtc/rtc-zynqmp.c
+++ b/drivers/rtc/rtc-zynqmp.c
@@ -13,6 +13,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/rtc.h>
+#include <linux/spinlock.h>
 
 /* RTC Registers */
 #define RTC_SET_TM_WR		0x00
@@ -45,6 +46,7 @@ struct xlnx_rtc_dev {
 	int			alarm_irq;
 	int			sec_irq;
 	int			calibval;
+	spinlock_t		lock;
 };
 
 static int xlnx_rtc_set_time(struct device *dev, struct rtc_time *tm)
@@ -59,6 +61,8 @@ static int xlnx_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	 */
 	new_time = rtc_tm_to_time64(tm) + 1;
 
+	spin_lock_irq(&xrtcdev->lock);
+
 	/*
 	 * Writing into calibration register will clear the Tick Counter and
 	 * force the next second to be signaled exactly in 1 second period
@@ -68,32 +72,32 @@ static int xlnx_rtc_set_time(struct device *dev, struct rtc_time *tm)
 
 	writel(new_time, xrtcdev->reg_base + RTC_SET_TM_WR);
 
-	/*
-	 * Clear the rtc interrupt status register after setting the
-	 * time. During a read_time function, the code should read the
-	 * RTC_INT_STATUS register and if bit 0 is still 0, it means
-	 * that one second has not elapsed yet since RTC was set and
-	 * the current time should be read from SET_TIME_READ register;
-	 * otherwise, CURRENT_TIME register is read to report the time
-	 */
+	/* Clear sec interrupt status */
 	writel(RTC_INT_SEC, xrtcdev->reg_base + RTC_INT_STS);
 
+	/* Now enable sec interrupt. This ensures our isr will get called, but
+	 * also signals the read_time function that a SET time is pending, in
+	 * which case time should be read from SET_TIME_READ instead of
+	 * CURRENT_TIME registers.
+	 */
+	writel(RTC_INT_SEC, xrtcdev->reg_base + RTC_INT_EN);
+
+	spin_unlock_irq(&xrtcdev->lock);
+
 	return 0;
 }
 
 static int xlnx_rtc_read_time(struct device *dev, struct rtc_time *tm)
 {
-	u32 status;
+	u32 int_mask;
 	unsigned long read_time;
 	struct xlnx_rtc_dev *xrtcdev = dev_get_drvdata(dev);
 
-	status = readl(xrtcdev->reg_base + RTC_INT_STS);
+	spin_lock_irq(&xrtcdev->lock);
+	int_mask = readl(xrtcdev->reg_base + RTC_INT_MASK);
 
-	if (status & RTC_INT_SEC) {
-		/*
-		 * RTC has updated the CURRENT_TIME with the time written into
-		 * SET_TIME_WRITE register.
-		 */
+	if (int_mask & RTC_INT_SEC) {
+		/* No set_time pending, use the CURRENT_TIME register */
 		read_time = readl(xrtcdev->reg_base + RTC_CUR_TM);
 	} else {
 		/*
@@ -105,6 +109,9 @@ static int xlnx_rtc_read_time(struct device *dev, struct rtc_time *tm)
 		 */
 		read_time = readl(xrtcdev->reg_base + RTC_SET_TM_RD) - 1;
 	}
+
+	spin_unlock_irq(&xrtcdev->lock);
+
 	rtc_time64_to_tm(read_time, tm);
 
 	return 0;
@@ -173,14 +180,36 @@ static const struct rtc_class_ops xlnx_rtc_ops = {
 	.alarm_irq_enable = xlnx_rtc_alarm_irq_enable,
 };
 
-static irqreturn_t xlnx_rtc_interrupt(int irq, void *id)
+static irqreturn_t xlnx_rtc_sec_interrupt(int irq, void *id)
+{
+	struct xlnx_rtc_dev *xrtcdev = (struct xlnx_rtc_dev *)id;
+	unsigned int status;
+
+	status = readl(xrtcdev->reg_base + RTC_INT_STS);
+	/* Check if interrupt asserted */
+	if (!(status & RTC_INT_SEC))
+		return IRQ_NONE;
+
+	/* Clear RTC_INT_SEC interrupt only */
+	writel(RTC_INT_SEC, xrtcdev->reg_base + RTC_INT_STS);
+
+	spin_lock(&xrtcdev->lock);
+
+	writel(RTC_INT_SEC, xrtcdev->reg_base + RTC_INT_DIS);
+
+	spin_unlock(&xrtcdev->lock);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t xlnx_rtc_alarm_interrupt(int irq, void *id)
 {
 	struct xlnx_rtc_dev *xrtcdev = (struct xlnx_rtc_dev *)id;
 	unsigned int status;
 
 	status = readl(xrtcdev->reg_base + RTC_INT_STS);
 	/* Check if interrupt asserted */
-	if (!(status & (RTC_INT_SEC | RTC_INT_ALRM)))
+	if (!(status & RTC_INT_ALRM))
 		return IRQ_NONE;
 
 	/* Clear RTC_INT_ALRM interrupt only */
@@ -202,6 +231,8 @@ static int xlnx_rtc_probe(struct platform_device *pdev)
 	if (!xrtcdev)
 		return -ENOMEM;
 
+	spin_lock_init(&xrtcdev->lock);
+
 	platform_set_drvdata(pdev, xrtcdev);
 
 	xrtcdev->rtc = devm_rtc_allocate_device(&pdev->dev);
@@ -221,7 +252,7 @@ static int xlnx_rtc_probe(struct platform_device *pdev)
 	if (xrtcdev->alarm_irq < 0)
 		return xrtcdev->alarm_irq;
 	ret = devm_request_irq(&pdev->dev, xrtcdev->alarm_irq,
-			       xlnx_rtc_interrupt, 0,
+			       xlnx_rtc_alarm_interrupt, 0,
 			       dev_name(&pdev->dev), xrtcdev);
 	if (ret) {
 		dev_err(&pdev->dev, "request irq failed\n");
@@ -232,7 +263,7 @@ static int xlnx_rtc_probe(struct platform_device *pdev)
 	if (xrtcdev->sec_irq < 0)
 		return xrtcdev->sec_irq;
 	ret = devm_request_irq(&pdev->dev, xrtcdev->sec_irq,
-			       xlnx_rtc_interrupt, 0,
+			       xlnx_rtc_sec_interrupt, 0,
 			       dev_name(&pdev->dev), xrtcdev);
 	if (ret) {
 		dev_err(&pdev->dev, "request irq failed\n");
-- 
2.23.0

