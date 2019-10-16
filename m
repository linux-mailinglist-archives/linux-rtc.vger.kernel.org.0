Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15D6CD9B60
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Oct 2019 22:16:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437095AbfJPUQi (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 16 Oct 2019 16:16:38 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:36909 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437071AbfJPUQi (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 16 Oct 2019 16:16:38 -0400
X-Originating-IP: 86.202.229.42
Received: from localhost (lfbn-lyo-1-146-42.w86-202.abo.wanadoo.fr [86.202.229.42])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 9BC1140002;
        Wed, 16 Oct 2019 20:16:34 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     Tony Prisk <linux@prisktech.co.nz>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 5/5] rtc: vt8500: let the core handle rtc range
Date:   Wed, 16 Oct 2019 22:16:26 +0200
Message-Id: <20191016201626.31309-5-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191016201626.31309-1-alexandre.belloni@bootlin.com>
References: <20191016201626.31309-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Let the rtc core check the date/time against the RTC range.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-vt8500.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-vt8500.c b/drivers/rtc/rtc-vt8500.c
index 0761478861f8..e2588625025f 100644
--- a/drivers/rtc/rtc-vt8500.c
+++ b/drivers/rtc/rtc-vt8500.c
@@ -122,12 +122,6 @@ static int vt8500_rtc_set_time(struct device *dev, struct rtc_time *tm)
 {
 	struct vt8500_rtc *vt8500_rtc = dev_get_drvdata(dev);
 
-	if (tm->tm_year < 100) {
-		dev_warn(dev, "Only years 2000-2199 are supported by the "
-			      "hardware!\n");
-		return -EINVAL;
-	}
-
 	writel((bin2bcd(tm->tm_year % 100) << DATE_YEAR_S)
 		| (bin2bcd(tm->tm_mon + 1) << DATE_MONTH_S)
 		| (bin2bcd(tm->tm_mday))
@@ -227,6 +221,8 @@ static int vt8500_rtc_probe(struct platform_device *pdev)
 		return PTR_ERR(vt8500_rtc->rtc);
 
 	vt8500_rtc->rtc->ops = &vt8500_rtc_ops;
+	vt8500_rtc->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	vt8500_rtc->rtc->range_max = RTC_TIMESTAMP_END_2199;
 
 	ret = devm_request_irq(&pdev->dev, vt8500_rtc->irq_alarm,
 				vt8500_rtc_irq, 0, "rtc alarm", vt8500_rtc);
-- 
2.21.0

