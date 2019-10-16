Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB525D9B0B
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Oct 2019 22:08:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733266AbfJPUIw (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 16 Oct 2019 16:08:52 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:45603 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731404AbfJPUIw (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 16 Oct 2019 16:08:52 -0400
X-Originating-IP: 86.202.229.42
Received: from localhost (lfbn-lyo-1-146-42.w86-202.abo.wanadoo.fr [86.202.229.42])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 185001BF204;
        Wed, 16 Oct 2019 20:08:50 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 1/2] rtc: s35390a: convert to devm_rtc_allocate_device
Date:   Wed, 16 Oct 2019 22:08:47 +0200
Message-Id: <20191016200848.30246-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This allows further improvement of the driver and removes the need to
forward declare s35390a_driver.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-s35390a.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-s35390a.c b/drivers/rtc/rtc-s35390a.c
index da34cfd70f95..66684b80028f 100644
--- a/drivers/rtc/rtc-s35390a.c
+++ b/drivers/rtc/rtc-s35390a.c
@@ -423,8 +423,6 @@ static const struct rtc_class_ops s35390a_rtc_ops = {
 	.ioctl          = s35390a_rtc_ioctl,
 };
 
-static struct i2c_driver s35390a_driver;
-
 static int s35390a_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
@@ -456,6 +454,10 @@ static int s35390a_probe(struct i2c_client *client,
 		}
 	}
 
+	s35390a->rtc = devm_rtc_allocate_device(dev);
+	if (IS_ERR(s35390a->rtc))
+		return PTR_ERR(s35390a->rtc);
+
 	err_read = s35390a_read_status(s35390a, &status1);
 	if (err_read < 0) {
 		dev_err(dev, "error resetting chip\n");
@@ -485,11 +487,7 @@ static int s35390a_probe(struct i2c_client *client,
 
 	device_set_wakeup_capable(dev, 1);
 
-	s35390a->rtc = devm_rtc_device_register(dev, s35390a_driver.driver.name,
-						&s35390a_rtc_ops, THIS_MODULE);
-
-	if (IS_ERR(s35390a->rtc))
-		return PTR_ERR(s35390a->rtc);
+	s35390a->rtc->ops = &s35390a_rtc_ops;
 
 	/* supports per-minute alarms only, therefore set uie_unsupported */
 	s35390a->rtc->uie_unsupported = 1;
@@ -497,7 +495,7 @@ static int s35390a_probe(struct i2c_client *client,
 	if (status1 & S35390A_FLAG_INT2)
 		rtc_update_irq(s35390a->rtc, 1, RTC_AF);
 
-	return 0;
+	return rtc_register_device(s35390a->rtc);
 }
 
 static struct i2c_driver s35390a_driver = {
-- 
2.21.0

