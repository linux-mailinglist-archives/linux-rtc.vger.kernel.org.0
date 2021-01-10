Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E6452F0A49
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Jan 2021 00:20:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727158AbhAJXTA (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 10 Jan 2021 18:19:00 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:60811 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727127AbhAJXS7 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 10 Jan 2021 18:18:59 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 8745260006;
        Sun, 10 Jan 2021 23:18:17 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 06/17] rtc: m48t59: remove m48t02_rtc_ops
Date:   Mon, 11 Jan 2021 00:17:41 +0100
Message-Id: <20210110231752.1418816-7-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210110231752.1418816-1-alexandre.belloni@bootlin.com>
References: <20210110231752.1418816-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Clear RTC_FEATURE_ALARM to signal that alarms are not available instead of
having a supplementary struct rtc_class_ops without alarm callbacks.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-m48t59.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/rtc/rtc-m48t59.c b/drivers/rtc/rtc-m48t59.c
index 5f5898d3b055..1d2e99a70fce 100644
--- a/drivers/rtc/rtc-m48t59.c
+++ b/drivers/rtc/rtc-m48t59.c
@@ -313,11 +313,6 @@ static const struct rtc_class_ops m48t59_rtc_ops = {
 	.alarm_irq_enable = m48t59_rtc_alarm_irq_enable,
 };
 
-static const struct rtc_class_ops m48t02_rtc_ops = {
-	.read_time	= m48t59_rtc_read_time,
-	.set_time	= m48t59_rtc_set_time,
-};
-
 static int m48t59_nvram_read(void *priv, unsigned int offset, void *val,
 			     size_t size)
 {
@@ -366,7 +361,6 @@ static int m48t59_rtc_probe(struct platform_device *pdev)
 	struct m48t59_private *m48t59 = NULL;
 	struct resource *res;
 	int ret = -ENOMEM;
-	const struct rtc_class_ops *ops;
 	struct nvmem_config nvmem_cfg = {
 		.name = "m48t59-",
 		.word_size = 1,
@@ -438,17 +432,21 @@ static int m48t59_rtc_probe(struct platform_device *pdev)
 		if (ret)
 			return ret;
 	}
+
+	m48t59->rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(m48t59->rtc))
+		return PTR_ERR(m48t59->rtc);
+
 	switch (pdata->type) {
 	case M48T59RTC_TYPE_M48T59:
-		ops = &m48t59_rtc_ops;
 		pdata->offset = 0x1ff0;
 		break;
 	case M48T59RTC_TYPE_M48T02:
-		ops = &m48t02_rtc_ops;
+		clear_bit(RTC_FEATURE_ALARM, m48t59->rtc->features);
 		pdata->offset = 0x7f0;
 		break;
 	case M48T59RTC_TYPE_M48T08:
-		ops = &m48t02_rtc_ops;
+		clear_bit(RTC_FEATURE_ALARM, m48t59->rtc->features);
 		pdata->offset = 0x1ff0;
 		break;
 	default:
@@ -459,11 +457,7 @@ static int m48t59_rtc_probe(struct platform_device *pdev)
 	spin_lock_init(&m48t59->lock);
 	platform_set_drvdata(pdev, m48t59);
 
-	m48t59->rtc = devm_rtc_allocate_device(&pdev->dev);
-	if (IS_ERR(m48t59->rtc))
-		return PTR_ERR(m48t59->rtc);
-
-	m48t59->rtc->ops = ops;
+	m48t59->rtc->ops = &m48t59_rtc_ops;
 
 	nvmem_cfg.size = pdata->offset;
 	ret = devm_rtc_nvmem_register(m48t59->rtc, &nvmem_cfg);
-- 
2.29.2

