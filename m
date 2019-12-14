Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C139D11F4BC
	for <lists+linux-rtc@lfdr.de>; Sat, 14 Dec 2019 23:13:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727357AbfLNWLG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 14 Dec 2019 17:11:06 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:41871 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726803AbfLNWKb (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 14 Dec 2019 17:10:31 -0500
Received: from localhost (lfbn-lyo-1-1913-102.w90-65.abo.wanadoo.fr [90.65.92.102])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 420E3100008;
        Sat, 14 Dec 2019 22:10:30 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 10/16] rtc: rv3029: add RTC_VL_READ and RTC_VL_CLEAR support
Date:   Sat, 14 Dec 2019 23:10:16 +0100
Message-Id: <20191214221022.622482-11-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191214221022.622482-1-alexandre.belloni@bootlin.com>
References: <20191214221022.622482-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The RV3029 can report three different conditions: power on, voltage dropped
and data is lost and voltage is low and temperature compensation has
stopped. The first two conditions amount to the same status, the RTC data
is invalid.

VLOW1 has to be cleared manually to resume temperature compensation, this
is achieved using RTC_VL_CLEAR.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-rv3029c2.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/rtc/rtc-rv3029c2.c b/drivers/rtc/rtc-rv3029c2.c
index f327a7713e04..6ae96baa111a 100644
--- a/drivers/rtc/rtc-rv3029c2.c
+++ b/drivers/rtc/rtc-rv3029c2.c
@@ -459,6 +459,35 @@ static int rv3029_set_time(struct device *dev, struct rtc_time *tm)
 				  RV3029_STATUS_PON, 0);
 }
 
+static int rv3029_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
+{
+	struct rv3029_data *rv3029 = dev_get_drvdata(dev);
+	unsigned long vl = 0;
+	int sr, ret = 0;
+
+	switch (cmd) {
+	case RTC_VL_READ:
+		ret = regmap_read(rv3029->regmap, RV3029_STATUS, &sr);
+		if (ret < 0)
+			return ret;
+
+		if (sr & RV3029_STATUS_VLOW1)
+			vl = RTC_VL_ACCURACY_LOW;
+
+		if (sr & (RV3029_STATUS_VLOW2 | RV3029_STATUS_PON))
+			vl |= RTC_VL_DATA_INVALID;
+
+		return put_user(vl, (unsigned int __user *)arg);
+
+	case RTC_VL_CLR:
+		return regmap_update_bits(rv3029->regmap, RV3029_STATUS,
+					  RV3029_STATUS_VLOW1, 0);
+
+	default:
+		return -ENOIOCTLCMD;
+	}
+}
+
 static const struct rv3029_trickle_tab_elem {
 	u32 r;		/* resistance in ohms */
 	u8 conf;	/* trickle config bits */
@@ -672,6 +701,7 @@ static void rv3029_hwmon_register(struct device *dev, const char *name)
 static struct rtc_class_ops rv3029_rtc_ops = {
 	.read_time	= rv3029_read_time,
 	.set_time	= rv3029_set_time,
+	.ioctl		= rv3029_ioctl,
 };
 
 static int rv3029_probe(struct device *dev, struct regmap *regmap, int irq,
-- 
2.23.0

