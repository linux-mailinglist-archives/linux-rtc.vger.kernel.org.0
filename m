Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0D8D44C2D0
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Nov 2021 15:14:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232177AbhKJORf (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 10 Nov 2021 09:17:35 -0500
Received: from smtp2.axis.com ([195.60.68.18]:1369 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232140AbhKJORe (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 10 Nov 2021 09:17:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1636553687;
  x=1668089687;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UY7psuy2ya+gdc/YToDbQCyYhSN3kpAe6lpC4hUBjm4=;
  b=etQ9ZWGlek81gNV7wcZhEBoSSVsi0t7FRKe9HCH7vV6Ed1+k+uSP/KYB
   gPb3Oy7PYrHLedMfmG0EgG8/r1cFwkgL1MLt7azLiNgF2sdFBqFflcyaP
   a3QYXEHngNQtD+62PmwR8IPYSjHEhfcQsYIOsN0ecYLiyeL3QgXOV1hxi
   tKejolMlM11yaIMfNGdqgiH7uKIezJCl9WOYdccKzyF/+ca4SIBaQCjxf
   nFnKpnj9NGALZZ3mPmBQZfKGd6yCr08W69U97FbEvvzhFqxihZv3FCL/e
   VgeGPfPrvolNYV6bu9I7IxDGrVUqepoHycQ7vH1uashkLkzJCtw4+TKpL
   A==;
From:   Camel Guo <camel.guo@axis.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     <kernel@axis.com>, Camel Guo <camelg@axis.com>,
        <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] rtc: rs5c372: Add RTC_VL_READ, RTC_VL_CLR ioctls
Date:   Wed, 10 Nov 2021 15:14:42 +0100
Message-ID: <20211110141442.9603-1-camel.guo@axis.com>
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

v2: Set RTC_VL_BACKUP_LOW if VDET is set. Do not clear PON, XSTP in
RTC_VL_CLR ioctl

 drivers/rtc/rtc-rs5c372.c | 60 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/drivers/rtc/rtc-rs5c372.c b/drivers/rtc/rtc-rs5c372.c
index 80980414890c..4ab8718d9360 100644
--- a/drivers/rtc/rtc-rs5c372.c
+++ b/drivers/rtc/rtc-rs5c372.c
@@ -485,6 +485,65 @@ static int rs5c372_rtc_proc(struct device *dev, struct seq_file *seq)
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
+				flags |= RTC_VL_BACKUP_LOW;
+			break;
+		default:
+			if (ctrl2 & RS5C_CTRL2_XSTP)
+				flags |= RTC_VL_DATA_INVALID;
+			break;
+		}
+
+		return put_user(flags, (unsigned int __user *)arg);
+	case RTC_VL_CLR:
+		/* clear VDET bit */
+		switch (rs5c->type) {
+		case rtc_r2025sd:
+		case rtc_r2221tl:
+			ctrl2 &= ~R2x2x_CTRL2_VDET;
+		default:
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
@@ -492,6 +551,7 @@ static const struct rtc_class_ops rs5c372_rtc_ops = {
 	.read_alarm	= rs5c_read_alarm,
 	.set_alarm	= rs5c_set_alarm,
 	.alarm_irq_enable = rs5c_rtc_alarm_irq_enable,
+	.ioctl		= rs5c372_ioctl,
 };
 
 #if IS_ENABLED(CONFIG_RTC_INTF_SYSFS)
-- 
2.20.1

