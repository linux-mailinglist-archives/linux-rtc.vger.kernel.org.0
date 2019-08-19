Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26C9294CDE
	for <lists+linux-rtc@lfdr.de>; Mon, 19 Aug 2019 20:29:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728426AbfHSS1W (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 19 Aug 2019 14:27:22 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:52617 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728322AbfHSS1B (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 19 Aug 2019 14:27:01 -0400
X-Originating-IP: 90.65.161.137
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 09CF5FF803;
        Mon, 19 Aug 2019 18:26:58 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v3 3/9] rtc: pcf2123: implement .alarm_irq_enable
Date:   Mon, 19 Aug 2019 20:26:50 +0200
Message-Id: <20190819182656.29744-3-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190819182656.29744-1-alexandre.belloni@bootlin.com>
References: <20190819182656.29744-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Implement .alarm_irq_enable so it is possible to use RTC_ALM_SET,
RTC_AIE_ON and RTC_AIE_OFF.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pcf2123.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/rtc/rtc-pcf2123.c b/drivers/rtc/rtc-pcf2123.c
index 829d7a2dd950..809c35c8ba1a 100644
--- a/drivers/rtc/rtc-pcf2123.c
+++ b/drivers/rtc/rtc-pcf2123.c
@@ -238,6 +238,14 @@ static int pcf2123_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	return 0;
 }
 
+static int pcf2123_rtc_alarm_irq_enable(struct device *dev, unsigned int en)
+{
+	struct pcf2123_plat_data *pdata = dev_get_platdata(dev);
+
+	return regmap_update_bits(pdata->map, PCF2123_REG_CTRL2, CTRL2_AIE,
+				  en ? CTRL2_AIE : 0);
+}
+
 static int pcf2123_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
 {
 	struct pcf2123_plat_data *pdata = dev_get_platdata(dev);
@@ -295,15 +303,7 @@ static int pcf2123_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
 	if (ret)
 		return ret;
 
-	/* Enable alarm interrupt */
-	if (alm->enabled)	{
-		ret = regmap_update_bits(pdata->map, PCF2123_REG_CTRL2,
-						CTRL2_AIE, CTRL2_AIE);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
+	return pcf2123_rtc_alarm_irq_enable(dev, alm->enabled);
 }
 
 static irqreturn_t pcf2123_rtc_irq(int irq, void *dev)
@@ -372,6 +372,7 @@ static const struct rtc_class_ops pcf2123_rtc_ops = {
 	.set_offset	= pcf2123_set_offset,
 	.read_alarm	= pcf2123_rtc_read_alarm,
 	.set_alarm	= pcf2123_rtc_set_alarm,
+	.alarm_irq_enable = pcf2123_rtc_alarm_irq_enable,
 };
 
 static int pcf2123_probe(struct spi_device *spi)
-- 
2.21.0

