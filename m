Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E625D9B40
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Oct 2019 22:14:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394715AbfJPUOT (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 16 Oct 2019 16:14:19 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:52353 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394703AbfJPUOS (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 16 Oct 2019 16:14:18 -0400
Received: from localhost (lfbn-lyo-1-146-42.w86-202.abo.wanadoo.fr [86.202.229.42])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 1E25B240006;
        Wed, 16 Oct 2019 20:14:17 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 2/2] rtc: cros-ec: let the core handle rtc range
Date:   Wed, 16 Oct 2019 22:14:14 +0200
Message-Id: <20191016201414.30934-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191016201414.30934-1-alexandre.belloni@bootlin.com>
References: <20191016201414.30934-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Let the rtc core check the date/time against the RTC range.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-cros-ec.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-cros-ec.c b/drivers/rtc/rtc-cros-ec.c
index da209d00731e..d043d30f05bc 100644
--- a/drivers/rtc/rtc-cros-ec.c
+++ b/drivers/rtc/rtc-cros-ec.c
@@ -107,11 +107,7 @@ static int cros_ec_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	struct cros_ec_rtc *cros_ec_rtc = dev_get_drvdata(dev);
 	struct cros_ec_device *cros_ec = cros_ec_rtc->cros_ec;
 	int ret;
-	time64_t time;
-
-	time = rtc_tm_to_time64(tm);
-	if (time < 0 || time > U32_MAX)
-		return -EINVAL;
+	time64_t time = rtc_tm_to_time64(tm);
 
 	ret = cros_ec_rtc_set(cros_ec, EC_CMD_RTC_SET_VALUE, (u32)time);
 	if (ret < 0) {
@@ -348,12 +344,17 @@ static int cros_ec_rtc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	cros_ec_rtc->rtc = devm_rtc_device_register(&pdev->dev, DRV_NAME,
-						    &cros_ec_rtc_ops,
-						    THIS_MODULE);
+	cros_ec_rtc->rtc = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(cros_ec_rtc->rtc))
 		return PTR_ERR(cros_ec_rtc->rtc);
 
+	cros_ec_rtc->rtc->ops = &cros_ec_rtc_ops;
+	cros_ec_rtc->rtc->range_max = U32_MAX;
+
+	ret = rtc_register_device(cros_ec_rtc->rtc);
+	if (ret)
+		return ret;
+
 	/* Get RTC events from the EC. */
 	cros_ec_rtc->notifier.notifier_call = cros_ec_rtc_event;
 	ret = blocking_notifier_chain_register(&cros_ec->event_notifier,
-- 
2.21.0

