Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55A6E12CADD
	for <lists+linux-rtc@lfdr.de>; Sun, 29 Dec 2019 21:45:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbfL2Upa (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 29 Dec 2019 15:45:30 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:55195 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726444AbfL2Up3 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 29 Dec 2019 15:45:29 -0500
X-Originating-IP: 92.184.100.83
Received: from localhost (unknown [92.184.100.83])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 897D9E0003;
        Sun, 29 Dec 2019 20:45:27 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     Nicolas Ferre <nicolas.ferre@microchip.com>,
        Eugen.Hristev@microchip.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 7/9] rtc: at91rm9200: add correction support
Date:   Sun, 29 Dec 2019 21:44:19 +0100
Message-Id: <20191229204421.337612-7-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191229204421.337612-1-alexandre.belloni@bootlin.com>
References: <20191229204421.337612-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The sama5d4 and sama5d2 RTCs are able to correct for imprecise crystals, up
to 1953 ppm.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-at91rm9200.c | 95 ++++++++++++++++++++++++++++++++++--
 1 file changed, 91 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-at91rm9200.c b/drivers/rtc/rtc-at91rm9200.c
index 5e811e04cb21..fe4823e1fd60 100644
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
 
+#define AT91_RTC_CORR_STEP		1526
+#define AT91_RTC_CORR_STEP_HIGH		30516
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
@@ -293,6 +301,66 @@ static int at91_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
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
+	if (mr & AT91_RTC_NEGPPM)
+		val = -val;
+
+	if (mr & AT91_RTC_HIGHPPM)
+		*offset = val * AT91_RTC_CORR_STEP_HIGH;
+	else
+		*offset = val * AT91_RTC_CORR_STEP;
+
+	return 0;
+}
+
+static int at91_rtc_setoffset(struct device *dev, long offset)
+{
+	long mode0, mode1, error0, error1;
+	u32 mr;
+	
+
+	if (offset > AT91_RTC_CORR_STEP_HIGH * 128)
+		return -ERANGE;
+	if (offset < AT91_RTC_CORR_STEP_HIGH * -128)
+		return -ERANGE;
+
+	mr = at91_rtc_read(AT91_RTC_MR);
+	mr &= ~(AT91_RTC_NEGPPM | AT91_RTC_CORRECTION | AT91_RTC_HIGHPPM);
+
+	if (offset < 0) {
+		mr |= AT91_RTC_NEGPPM;
+		offset = -offset;
+	}
+
+	mode0 = DIV_ROUND_CLOSEST(offset, AT91_RTC_CORR_STEP);
+	mode1 = DIV_ROUND_CLOSEST(offset, AT91_RTC_CORR_STEP_HIGH);
+
+	error0 = abs(offset - (mode0 * AT91_RTC_CORR_STEP));
+	error1 = abs(offset - (mode1 * AT91_RTC_CORR_STEP_HIGH));
+
+	if (mode0 > 128 || error0 > error1) {
+		mr |= AT91_RTC_HIGHPPM;
+		mr |= FIELD_PREP(AT91_RTC_CORRECTION, mode1 - 1);
+	} else {
+		mr |= FIELD_PREP(AT91_RTC_CORRECTION, mode0 - 1);
+	}
+
+	at91_rtc_write(AT91_RTC_MR, mr);
+
+	return 0;
+}
+
 /*
  * IRQ handler for the RTC
  */
@@ -343,6 +411,10 @@ static const struct at91_rtc_config at91sam9x5_config = {
 	.use_shadow_imr	= true,
 };
 
+static const struct at91_rtc_config sama5d4_config = {
+	.has_correction = true,
+};
+
 static const struct of_device_id at91_rtc_dt_ids[] = {
 	{
 		.compatible = "atmel,at91rm9200-rtc",
@@ -352,10 +424,10 @@ static const struct of_device_id at91_rtc_dt_ids[] = {
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
@@ -370,6 +442,16 @@ static const struct rtc_class_ops at91_rtc_ops = {
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
@@ -416,7 +498,8 @@ static int __init at91_rtc_probe(struct platform_device *pdev)
 	}
 
 	at91_rtc_write(AT91_RTC_CR, 0);
-	at91_rtc_write(AT91_RTC_MR, 0);		/* 24 hour mode */
+	at91_rtc_write(AT91_RTC_MR,
+		       at91_rtc_read(AT91_RTC_MR) & ~AT91_RTC_HRMOD);
 
 	/* Disable all interrupts */
 	at91_rtc_write_idr(AT91_RTC_ACKUPD | AT91_RTC_ALARM |
@@ -437,7 +520,11 @@ static int __init at91_rtc_probe(struct platform_device *pdev)
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
2.23.0

