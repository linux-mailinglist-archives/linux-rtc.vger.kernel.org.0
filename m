Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA1D817B342
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Mar 2020 01:58:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbgCFA6Q (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 5 Mar 2020 19:58:16 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:57303 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgCFA6Q (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 5 Mar 2020 19:58:16 -0500
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 96059200003;
        Fri,  6 Mar 2020 00:58:14 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] rtc: pl031: set range
Date:   Fri,  6 Mar 2020 01:58:08 +0100
Message-Id: <20200306005809.38530-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200306005809.38530-1-alexandre.belloni@bootlin.com>
References: <20200306005809.38530-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The PL031 and ST v1 RTC are 32bit seconds counters. STv2 is a BCD RTC
apparently going from 0000 to 9999, hopefully handling the leap days
properly until then.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pl031.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/rtc/rtc-pl031.c b/drivers/rtc/rtc-pl031.c
index 2e8e019a6e4c..07dc0f264100 100644
--- a/drivers/rtc/rtc-pl031.c
+++ b/drivers/rtc/rtc-pl031.c
@@ -80,6 +80,8 @@ struct pl031_vendor_data {
 	bool clockwatch;
 	bool st_weekday;
 	unsigned long irqflags;
+	time64_t range_min;
+	timeu64_t range_max;
 };
 
 struct pl031_local {
@@ -375,6 +377,8 @@ static int pl031_probe(struct amba_device *adev, const struct amba_id *id)
 		return PTR_ERR(ldata->rtc);
 
 	ldata->rtc->ops = ops;
+	ldata->rtc->range_min = vendor->range_min;
+	ldata->rtc->range_max = vendor->range_max;
 
 	ret = rtc_register_device(ldata->rtc);
 	if (ret)
@@ -405,6 +409,7 @@ static struct pl031_vendor_data arm_pl031 = {
 		.set_alarm = pl031_set_alarm,
 		.alarm_irq_enable = pl031_alarm_irq_enable,
 	},
+	.range_max = U32_MAX,
 };
 
 /* The First ST derivative */
@@ -418,6 +423,7 @@ static struct pl031_vendor_data stv1_pl031 = {
 	},
 	.clockwatch = true,
 	.st_weekday = true,
+	.range_max = U32_MAX,
 };
 
 /* And the second ST derivative */
@@ -438,6 +444,8 @@ static struct pl031_vendor_data stv2_pl031 = {
 	 * remove IRQF_COND_SUSPEND
 	 */
 	.irqflags = IRQF_SHARED | IRQF_COND_SUSPEND,
+	.range_min = RTC_TIMESTAMP_BEGIN_0000,
+	.range_max = RTC_TIMESTAMP_END_9999,
 };
 
 static const struct amba_id pl031_ids[] = {
-- 
2.24.1

