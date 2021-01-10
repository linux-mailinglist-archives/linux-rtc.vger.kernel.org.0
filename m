Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A983D2F0A39
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Jan 2021 00:19:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727098AbhAJXS4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 10 Jan 2021 18:18:56 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:36935 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726908AbhAJXS4 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 10 Jan 2021 18:18:56 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 1F4F0FF804;
        Sun, 10 Jan 2021 23:18:11 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 04/17] rtc: cmos: remove cmos_rtc_ops_no_alarm
Date:   Mon, 11 Jan 2021 00:17:39 +0100
Message-Id: <20210110231752.1418816-5-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210110231752.1418816-1-alexandre.belloni@bootlin.com>
References: <20210110231752.1418816-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Clear RTC_FEATURE_ALARM to signal that alarms are not available instead of
having a supplementary struct rtc_class_ops with a NULL .set_alarm.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-cmos.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
index 51e80bc70d42..c3746e249f5a 100644
--- a/drivers/rtc/rtc-cmos.c
+++ b/drivers/rtc/rtc-cmos.c
@@ -574,12 +574,6 @@ static const struct rtc_class_ops cmos_rtc_ops = {
 	.alarm_irq_enable	= cmos_alarm_irq_enable,
 };
 
-static const struct rtc_class_ops cmos_rtc_ops_no_alarm = {
-	.read_time		= cmos_read_time,
-	.set_time		= cmos_set_time,
-	.proc			= cmos_procfs,
-};
-
 /*----------------------------------------------------------------*/
 
 /*
@@ -857,12 +851,12 @@ cmos_do_probe(struct device *dev, struct resource *ports, int rtc_irq)
 			dev_dbg(dev, "IRQ %d is already in use\n", rtc_irq);
 			goto cleanup1;
 		}
-
-		cmos_rtc.rtc->ops = &cmos_rtc_ops;
 	} else {
-		cmos_rtc.rtc->ops = &cmos_rtc_ops_no_alarm;
+		clear_bit(RTC_FEATURE_ALARM, cmos_rtc.rtc->features);
 	}
 
+	cmos_rtc.rtc->ops = &cmos_rtc_ops;
+
 	retval = devm_rtc_register_device(cmos_rtc.rtc);
 	if (retval)
 		goto cleanup2;
-- 
2.29.2

