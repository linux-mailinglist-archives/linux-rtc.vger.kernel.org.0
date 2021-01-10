Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 394A02F0A58
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Jan 2021 00:20:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727235AbhAJXT2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 10 Jan 2021 18:19:28 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:44153 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727256AbhAJXTG (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 10 Jan 2021 18:19:06 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id DC80260008;
        Sun, 10 Jan 2021 23:18:23 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 12/17] rtc: opal: constify opal_rtc_ops
Date:   Mon, 11 Jan 2021 00:17:47 +0100
Message-Id: <20210110231752.1418816-13-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210110231752.1418816-1-alexandre.belloni@bootlin.com>
References: <20210110231752.1418816-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Use RTC_FEATURE_ALARM to signal to the core whether alarms are available
instead of changing the global struct rtc_class_ops, allowing to make it
const.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-opal.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-opal.c b/drivers/rtc/rtc-opal.c
index c586f695bdc9..f8f49a969c23 100644
--- a/drivers/rtc/rtc-opal.c
+++ b/drivers/rtc/rtc-opal.c
@@ -224,9 +224,12 @@ static int opal_tpo_alarm_irq_enable(struct device *dev, unsigned int enabled)
 	return enabled ? 0 : opal_set_tpo_time(dev, &alarm);
 }
 
-static struct rtc_class_ops opal_rtc_ops = {
+static const struct rtc_class_ops opal_rtc_ops = {
 	.read_time	= opal_get_rtc_time,
 	.set_time	= opal_set_rtc_time,
+	.read_alarm	= opal_get_tpo_time,
+	.set_alarm	= opal_set_tpo_time,
+	.alarm_irq_enable = opal_tpo_alarm_irq_enable,
 };
 
 static int opal_rtc_probe(struct platform_device *pdev)
@@ -239,12 +242,10 @@ static int opal_rtc_probe(struct platform_device *pdev)
 
 	if (pdev->dev.of_node &&
 	    (of_property_read_bool(pdev->dev.of_node, "wakeup-source") ||
-	     of_property_read_bool(pdev->dev.of_node, "has-tpo")/* legacy */)) {
+	     of_property_read_bool(pdev->dev.of_node, "has-tpo")/* legacy */))
 		device_set_wakeup_capable(&pdev->dev, true);
-		opal_rtc_ops.read_alarm	= opal_get_tpo_time;
-		opal_rtc_ops.set_alarm = opal_set_tpo_time;
-		opal_rtc_ops.alarm_irq_enable = opal_tpo_alarm_irq_enable;
-	}
+	else
+		clear_bit(RTC_FEATURE_ALARM, rtc->features);
 
 	rtc->ops = &opal_rtc_ops;
 	rtc->range_min = RTC_TIMESTAMP_BEGIN_0000;
-- 
2.29.2

