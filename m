Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07AA22AAE34
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Nov 2020 00:20:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728016AbgKHXUN (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 8 Nov 2020 18:20:13 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:34753 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727949AbgKHXUN (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 8 Nov 2020 18:20:13 -0500
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 646B2C0007;
        Sun,  8 Nov 2020 23:20:09 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>
Cc:     linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: at91rm9200: add correction support
Date:   Mon,  9 Nov 2020 00:20:00 +0100
Message-Id: <20201108232001.1580128-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The sama5d4 and sama5d2 RTCs are able to correct for imprecise crystals, up
to 1953 ppm.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-at91rm9200.c | 103 +++++++++++++++++++++++++++++++++--
 1 file changed, 99 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-at91rm9200.c b/drivers/rtc/rtc-at91rm9200.c
index 5e811e04cb21..1eea187d9850 100644
--- a/drivers/rtc/rtc-at91rm9200.c
+++ b/drivers/rtc/rtc-at91rm9200.c
@@ -36,6 +36,10 @@
 #define		AT91_RTC_UPDCAL		BIT(1)		/* Update Request Calendar Register */
 
 #define	AT91_RTC_MR		0x04			/* Mode Register */
+#define		AT91_RTC_HRMOD		BIT(0)		/* 12/24 hour mode */
+#define		AT91_RTC_NEGPPM		BIT(4)		/* Negative PPM correction */
+#define		AT91_RTC_CORRECTION	GENMASK(14, 8)	/* Slow clock correction */
+#define		AT91_RTC_HIGHPPM	BIT(15)		/* High PPM correction */
 
 #define	AT91_RTC_TIMR		0x08			/* Time Register */
 #define		AT91_RTC_SEC		GENMASK(6, 0)	/* Current Second */
@@ -77,6 +81,9 @@
 #define		AT91_RTC_NVTIMALR	BIT(2)		/* Non valid Time Alarm */
 #define		AT91_RTC_NVCALALR	BIT(3)		/* Non valid Calendar Alarm */
 
+#define AT91_RTC_CORR_DIVIDEND		3906000
+#define AT91_RTC_CORR_LOW_RATIO		20
+
 #define at91_rtc_read(field) \
 	readl_relaxed(at91_rtc_regs + field)
 #define at91_rtc_write(field, val) \
@@ -84,6 +91,7 @@
 
 struct at91_rtc_config {
 	bool use_shadow_imr;
+	bool has_correction;
 };
 
 static const struct at91_rtc_config *at91_rtc_config;
@@ -293,6 +301,75 @@ static int at91_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
 	return 0;
 }
 
+static int at91_rtc_readoffset(struct device *dev, long *offset)
+{
+	u32 mr = at91_rtc_read(AT91_RTC_MR);
+	long val = FIELD_GET(AT91_RTC_CORRECTION, mr);
+
+	if (!val) {
+		*offset = 0;
+		return 0;
+	}
+
+	val++;
+
+	if (!(mr & AT91_RTC_NEGPPM))
+		val = -val;
+
+	if (!(mr & AT91_RTC_HIGHPPM))
+		val *= AT91_RTC_CORR_LOW_RATIO;
+
+	*offset = DIV_ROUND_CLOSEST(AT91_RTC_CORR_DIVIDEND, val);
+
+	return 0;
+}
+
+static int at91_rtc_setoffset(struct device *dev, long offset)
+{
+	long corr;
+	u32 mr;
+
+	if (offset > AT91_RTC_CORR_DIVIDEND / 2)
+		return -ERANGE;
+	if (offset < -AT91_RTC_CORR_DIVIDEND / 2)
+		return -ERANGE;
+
+	mr = at91_rtc_read(AT91_RTC_MR);
+	mr &= ~(AT91_RTC_NEGPPM | AT91_RTC_CORRECTION | AT91_RTC_HIGHPPM);
+
+	if (offset > 0)
+		mr |= AT91_RTC_NEGPPM;
+	else
+		offset = -offset;
+
+	/* offset less than 764 ppb, disable correction*/
+	if (offset < 764) {
+		at91_rtc_write(AT91_RTC_MR, mr & ~AT91_RTC_NEGPPM);
+
+		return 0;
+	}
+
+	/*
+	 * 29208 ppb is the perfect cutoff between low range and high range
+	 * low range values are never better than high range value after that.
+	 */
+	if (offset < 29208) {
+		corr = DIV_ROUND_CLOSEST(AT91_RTC_CORR_DIVIDEND, offset * AT91_RTC_CORR_LOW_RATIO);
+	} else {
+		corr = DIV_ROUND_CLOSEST(AT91_RTC_CORR_DIVIDEND, offset);
+		mr |= AT91_RTC_HIGHPPM;
+	}
+
+	if (corr > 128)
+		corr = 128;
+
+	mr |= FIELD_PREP(AT91_RTC_CORRECTION, corr - 1);
+
+	at91_rtc_write(AT91_RTC_MR, mr);
+
+	return 0;
+}
+
 /*
  * IRQ handler for the RTC
  */
@@ -343,6 +420,10 @@ static const struct at91_rtc_config at91sam9x5_config = {
 	.use_shadow_imr	= true,
 };
 
+static const struct at91_rtc_config sama5d4_config = {
+	.has_correction = true,
+};
+
 static const struct of_device_id at91_rtc_dt_ids[] = {
 	{
 		.compatible = "atmel,at91rm9200-rtc",
@@ -352,10 +433,10 @@ static const struct of_device_id at91_rtc_dt_ids[] = {
 		.data = &at91sam9x5_config,
 	}, {
 		.compatible = "atmel,sama5d4-rtc",
-		.data = &at91rm9200_config,
+		.data = &sama5d4_config,
 	}, {
 		.compatible = "atmel,sama5d2-rtc",
-		.data = &at91rm9200_config,
+		.data = &sama5d4_config,
 	}, {
 		/* sentinel */
 	}
@@ -370,6 +451,16 @@ static const struct rtc_class_ops at91_rtc_ops = {
 	.alarm_irq_enable = at91_rtc_alarm_irq_enable,
 };
 
+static const struct rtc_class_ops sama5d4_rtc_ops = {
+	.read_time	= at91_rtc_readtime,
+	.set_time	= at91_rtc_settime,
+	.read_alarm	= at91_rtc_readalarm,
+	.set_alarm	= at91_rtc_setalarm,
+	.alarm_irq_enable = at91_rtc_alarm_irq_enable,
+	.set_offset	= at91_rtc_setoffset,
+	.read_offset	= at91_rtc_readoffset,
+};
+
 /*
  * Initialize and install RTC driver
  */
@@ -416,7 +507,7 @@ static int __init at91_rtc_probe(struct platform_device *pdev)
 	}
 
 	at91_rtc_write(AT91_RTC_CR, 0);
-	at91_rtc_write(AT91_RTC_MR, 0);		/* 24 hour mode */
+	at91_rtc_write(AT91_RTC_MR, at91_rtc_read(AT91_RTC_MR) & ~AT91_RTC_HRMOD);
 
 	/* Disable all interrupts */
 	at91_rtc_write_idr(AT91_RTC_ACKUPD | AT91_RTC_ALARM |
@@ -437,7 +528,11 @@ static int __init at91_rtc_probe(struct platform_device *pdev)
 	if (!device_can_wakeup(&pdev->dev))
 		device_init_wakeup(&pdev->dev, 1);
 
-	rtc->ops = &at91_rtc_ops;
+	if (at91_rtc_config->has_correction)
+		rtc->ops = &sama5d4_rtc_ops;
+	else
+		rtc->ops = &at91_rtc_ops;
+
 	rtc->range_min = RTC_TIMESTAMP_BEGIN_1900;
 	rtc->range_max = RTC_TIMESTAMP_END_2099;
 	ret = rtc_register_device(rtc);
-- 
2.28.0

