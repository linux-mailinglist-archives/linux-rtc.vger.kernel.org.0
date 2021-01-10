Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E22712F0A53
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Jan 2021 00:20:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727381AbhAJXTM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 10 Jan 2021 18:19:12 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:35515 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727316AbhAJXTM (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 10 Jan 2021 18:19:12 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id D6C071BF209;
        Sun, 10 Jan 2021 23:18:29 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 17/17] rtc: tps65910: remove tps65910_rtc_ops_noirq
Date:   Mon, 11 Jan 2021 00:17:52 +0100
Message-Id: <20210110231752.1418816-18-alexandre.belloni@bootlin.com>
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
 drivers/rtc/rtc-tps65910.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/rtc/rtc-tps65910.c b/drivers/rtc/rtc-tps65910.c
index 2d87b62826a8..e1415a49f4ee 100644
--- a/drivers/rtc/rtc-tps65910.c
+++ b/drivers/rtc/rtc-tps65910.c
@@ -361,13 +361,6 @@ static const struct rtc_class_ops tps65910_rtc_ops = {
 	.set_offset	= tps65910_set_offset,
 };
 
-static const struct rtc_class_ops tps65910_rtc_ops_noirq = {
-	.read_time	= tps65910_rtc_read_time,
-	.set_time	= tps65910_rtc_set_time,
-	.read_offset	= tps65910_read_offset,
-	.set_offset	= tps65910_set_offset,
-};
-
 static int tps65910_rtc_probe(struct platform_device *pdev)
 {
 	struct tps65910 *tps65910 = NULL;
@@ -425,12 +418,12 @@ static int tps65910_rtc_probe(struct platform_device *pdev)
 		irq = -1;
 
 	tps_rtc->irq = irq;
-	if (irq != -1) {
+	if (irq != -1)
 		device_set_wakeup_capable(&pdev->dev, 1);
-		tps_rtc->rtc->ops = &tps65910_rtc_ops;
-	} else
-		tps_rtc->rtc->ops = &tps65910_rtc_ops_noirq;
+	else
+		clear_bit(RTC_FEATURE_ALARM, tps_rtc->rtc->features);
 
+	tps_rtc->rtc->ops = &tps65910_rtc_ops;
 	tps_rtc->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
 	tps_rtc->rtc->range_max = RTC_TIMESTAMP_END_2099;
 
-- 
2.29.2

