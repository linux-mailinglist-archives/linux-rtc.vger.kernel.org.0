Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E81D44D33F
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Nov 2021 09:36:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230300AbhKKIjT (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 11 Nov 2021 03:39:19 -0500
Received: from smtp1.axis.com ([195.60.68.17]:51035 "EHLO smtp1.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229674AbhKKIjT (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 11 Nov 2021 03:39:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1636619791;
  x=1668155791;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LJ6rFTRpRnIkmc+2EB6nm5K94RP+xrX+RZYjjyX2tTA=;
  b=Btq1j+DD8P/Q6/qR0gruc05+05oh4AVM5XVPPpb/9YnOT9+zHiB/vhg8
   Fe2N3P+ytawx1UOshS3gJZZFBBQ+KaNHp/TDdk1SANhs0yk3YYIz7ZuJl
   Z1fpoFtaMen+qMPtA5E2gdVezjN1hmHUNtk3Ja+IpDlVvHVBHBBivokXV
   +TB6KE0rnNEU62eGPJkLzSVnd/y8hN45TWl2+GC1OmLeIz5TxN/Ncblrj
   S/y2d237E20eGFJlDG+VTFFqAP5VOcr6pwkaIFB7ba58uCuKvpMbIzGad
   BVlcefmzrQNvNhdilEGDJ/TCfdQjSAhsbS8i7dCTDZS1Rcy9fulOSeWRv
   g==;
From:   Camel Guo <camel.guo@axis.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     <kernel@axis.com>, Camel Guo <camelg@axis.com>,
        <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3] rtc: rs5c372: Add RTC_VL_READ, RTC_VL_CLR ioctls
Date:   Thu, 11 Nov 2021 09:36:25 +0100
Message-ID: <20211111083625.10216-1-camel.guo@axis.com>
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

Notes:
    v2: Set RTC_VL_BACKUP_LOW if VDET is set. Do not clear PON, XSTP in
    RTC_VL_CLR ioctl
    
    v3: Avoid setting registers in RTC_VL_CLR when unnecessary

 drivers/rtc/rtc-rs5c372.c | 55 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/rtc/rtc-rs5c372.c b/drivers/rtc/rtc-rs5c372.c
index 80980414890c..955513514179 100644
--- a/drivers/rtc/rtc-rs5c372.c
+++ b/drivers/rtc/rtc-rs5c372.c
@@ -485,6 +485,60 @@ static int rs5c372_rtc_proc(struct device *dev, struct seq_file *seq)
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
+		if (rs5c->type == rtc_r2025sd || rs5c->type == rtc_r2221tl) {
+			ctrl2 &= ~R2x2x_CTRL2_VDET;
+			if (i2c_smbus_write_byte_data(rs5c->client, addr, ctrl2) < 0) {
+				dev_dbg(&rs5c->client->dev, "%s: write error in line %i\n",
+						__func__, __LINE__);
+				return -EIO;
+			}
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
@@ -492,6 +546,7 @@ static const struct rtc_class_ops rs5c372_rtc_ops = {
 	.read_alarm	= rs5c_read_alarm,
 	.set_alarm	= rs5c_set_alarm,
 	.alarm_irq_enable = rs5c_rtc_alarm_irq_enable,
+	.ioctl		= rs5c372_ioctl,
 };
 
 #if IS_ENABLED(CONFIG_RTC_INTF_SYSFS)
-- 
2.20.1

