Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA4B644C05D
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Nov 2021 12:55:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231158AbhKJL5y (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 10 Nov 2021 06:57:54 -0500
Received: from smtp2.axis.com ([195.60.68.18]:64144 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229653AbhKJL5y (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 10 Nov 2021 06:57:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1636545307;
  x=1668081307;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nFz8bbCmbiBSXgPgIsGgGj7OU80UEBAzAe1S9VX0wlY=;
  b=M06Kd4+WvoHPOhf6HSCL2zTxg+Pbvp/zSUwB9zFDy3zjkDG4KC26xz4a
   zUjY28d5SnnUSgIFQIi/lT8Qg4k04lzU0zCgNGjoEZIoN368+VULXYN7x
   TogYpOEgfWWW6TzOA65Awy69bkWHmU5dcArLnFCj/wguPjOeNl6F7ztD2
   h4YLM748A/RshTOaS2zC6vmrfZWIDMGWpcA+qIwkhX92L8IJ95I3yHVjg
   +bgaerDva4oDyr3fE134KWSMfBcuVoYFeQSjI6At3RcJunJah5W0B2A4W
   4kyxh3ATztWjgUWhA83K/GXcd/n6InxBlLhfGpPb3X3H+BJtP1gzDim3Z
   w==;
From:   Camel Guo <camel.guo@axis.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     <kernel@axis.com>, Camel Guo <camelg@axis.com>,
        <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] rtc: rs5c372: Add RTC_VL_READ, RTC_VL_CLR ioctls
Date:   Wed, 10 Nov 2021 12:54:54 +0100
Message-ID: <20211110115455.18699-1-camel.guo@axis.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Camel Guo <camelg@axis.com>

In order to make it possible to get battery voltage status, this commit
adds RTC_VL_READ, RTC_VL_CLR ioctl commands to rtc-rs5c372.

Signed-off-by: Camel Guo <camelg@axis.com>
---
 drivers/rtc/rtc-rs5c372.c | 66 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/rtc/rtc-rs5c372.c b/drivers/rtc/rtc-rs5c372.c
index 80980414890c..5a96e5d3663a 100644
--- a/drivers/rtc/rtc-rs5c372.c
+++ b/drivers/rtc/rtc-rs5c372.c
@@ -485,6 +485,71 @@ static int rs5c372_rtc_proc(struct device *dev, struct seq_file *seq)
 #define	rs5c372_rtc_proc	NULL
 #endif
 
+#ifdef CONFIG_RTC_INTF_DEV
+static int rs5c372_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
+{
+	struct rs5c372	*rs5c = i2c_get_clientdata(to_i2c_client(dev));
+	unsigned char	ctrl2;
+	int		addr;
+	unsigned int	flags;
+
+	dev_dbg(dev, "%s: cmd=%x\n", __func__, cmd);
+
+	addr = RS5C_ADDR(RS5C_REG_CTRL2);
+	ctrl2 = i2c_smbus_read_byte_data(rs5c->client, addr);
+
+	switch (cmd) {
+	case RTC_VL_READ:
+		flags = 0;
+
+		switch (rs5c->type) {
+		case rtc_r2025sd:
+		case rtc_r2221tl:
+			if ((rs5c->type == rtc_r2025sd && !(ctrl2 & R2x2x_CTRL2_XSTP)) ||
+				(rs5c->type == rtc_r2221tl &&  (ctrl2 & R2x2x_CTRL2_XSTP))) {
+				flags |= RTC_VL_DATA_INVALID;
+			}
+			if (ctrl2 & R2x2x_CTRL2_VDET)
+				flags |= RTC_VL_ACCURACY_LOW;
+			break;
+		default:
+			if (ctrl2 & RS5C_CTRL2_XSTP)
+				flags |= RTC_VL_DATA_INVALID;
+			break;
+		}
+
+		return put_user(flags, (unsigned int __user *)arg);
+	case RTC_VL_CLR:
+		/* clear rtc VDET, PON and XSTP bits */
+		switch (rs5c->type) {
+		case rtc_r2025sd:
+		case rtc_r2221tl:
+			ctrl2 &= ~(R2x2x_CTRL2_VDET | R2x2x_CTRL2_PON);
+			if (rs5c->type == rtc_r2025sd)
+				ctrl2 |= R2x2x_CTRL2_XSTP;
+			else
+				ctrl2 &= ~R2x2x_CTRL2_XSTP;
+			break;
+		default:
+			ctrl2 &= ~RS5C_CTRL2_XSTP;
+			break;
+		}
+
+		if (i2c_smbus_write_byte_data(rs5c->client, addr, ctrl2) < 0) {
+			dev_dbg(&rs5c->client->dev, "%s: write error in line %i\n",
+					__func__, __LINE__);
+			return -EIO;
+		}
+		return 0;
+	default:
+		return -ENOIOCTLCMD;
+	}
+	return 0;
+}
+#else
+#define rs5c372_ioctl	NULL
+#endif
+
 static const struct rtc_class_ops rs5c372_rtc_ops = {
 	.proc		= rs5c372_rtc_proc,
 	.read_time	= rs5c372_rtc_read_time,
@@ -492,6 +557,7 @@ static const struct rtc_class_ops rs5c372_rtc_ops = {
 	.read_alarm	= rs5c_read_alarm,
 	.set_alarm	= rs5c_set_alarm,
 	.alarm_irq_enable = rs5c_rtc_alarm_irq_enable,
+	.ioctl		= rs5c372_ioctl,
 };
 
 #if IS_ENABLED(CONFIG_RTC_INTF_SYSFS)
-- 
2.20.1

