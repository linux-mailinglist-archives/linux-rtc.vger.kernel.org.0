Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 267A12F0A4B
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Jan 2021 00:20:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727127AbhAJXTB (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 10 Jan 2021 18:19:01 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:40851 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727137AbhAJXTA (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 10 Jan 2021 18:19:00 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 79E4F20003;
        Sun, 10 Jan 2021 23:18:18 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 07/17] rtc: pcf2127: remove pcf2127_rtc_alrm_ops
Date:   Mon, 11 Jan 2021 00:17:42 +0100
Message-Id: <20210110231752.1418816-8-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210110231752.1418816-1-alexandre.belloni@bootlin.com>
References: <20210110231752.1418816-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Move the alarm callbacks in pcf2127_rtc_ops and use RTC_FEATURE_ALARM to
signal to the core whether alarms are available instead of having a
supplementary struct rtc_class_ops without alarm callbacks.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pcf2127.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 39a7b5116aa4..68160d857ac1 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -225,12 +225,6 @@ static int pcf2127_rtc_ioctl(struct device *dev,
 	}
 }
 
-static const struct rtc_class_ops pcf2127_rtc_ops = {
-	.ioctl		= pcf2127_rtc_ioctl,
-	.read_time	= pcf2127_rtc_read_time,
-	.set_time	= pcf2127_rtc_set_time,
-};
-
 static int pcf2127_nvmem_read(void *priv, unsigned int offset,
 			      void *val, size_t bytes)
 {
@@ -459,7 +453,7 @@ static irqreturn_t pcf2127_rtc_irq(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
-static const struct rtc_class_ops pcf2127_rtc_alrm_ops = {
+static const struct rtc_class_ops pcf2127_rtc_ops = {
 	.ioctl            = pcf2127_rtc_ioctl,
 	.read_time        = pcf2127_rtc_read_time,
 	.set_time         = pcf2127_rtc_set_time,
@@ -584,6 +578,7 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 	pcf2127->rtc->range_max = RTC_TIMESTAMP_END_2099;
 	pcf2127->rtc->set_start_time = true; /* Sets actual start to 1970 */
 	pcf2127->rtc->uie_unsupported = 1;
+	clear_bit(RTC_FEATURE_ALARM, pcf2127->rtc->features);
 
 	if (alarm_irq > 0) {
 		ret = devm_request_threaded_irq(dev, alarm_irq, NULL,
@@ -598,7 +593,7 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 
 	if (alarm_irq > 0 || device_property_read_bool(dev, "wakeup-source")) {
 		device_init_wakeup(dev, true);
-		pcf2127->rtc->ops = &pcf2127_rtc_alrm_ops;
+		set_bit(RTC_FEATURE_ALARM, pcf2127->rtc->features);
 	}
 
 	if (has_nvmem) {
-- 
2.29.2

