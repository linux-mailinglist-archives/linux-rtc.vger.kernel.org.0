Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CEE94FB78
	for <lists+linux-rtc@lfdr.de>; Sun, 23 Jun 2019 14:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726453AbfFWMKx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 23 Jun 2019 08:10:53 -0400
Received: from mail-out.m-online.net ([212.18.0.10]:53137 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726429AbfFWMKx (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 23 Jun 2019 08:10:53 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 45WrqH1X3Fz1rbk7;
        Sun, 23 Jun 2019 14:10:51 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 45WrqH1FCNz1qrQJ;
        Sun, 23 Jun 2019 14:10:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id 7Qi0eW6wHmmb; Sun, 23 Jun 2019 14:10:50 +0200 (CEST)
X-Auth-Info: ThwALe0U7CD2BDTgZnIfWIK452KsZDoFZOFSl7WB8TA=
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz [86.49.110.70])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Sun, 23 Jun 2019 14:10:50 +0200 (CEST)
From:   Marek Vasut <marex@denx.de>
To:     linux-rtc@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: [PATCH] rtc: abx80x: Implement procfs interface
Date:   Sun, 23 Jun 2019 14:08:54 +0200
Message-Id: <20190623120854.3179-1-marex@denx.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Implement procfs interface for polling battery status of the RTC
via /proc/driver/rtc .

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 drivers/rtc/rtc-abx80x.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
index 73830670a41f..4fab024fb508 100644
--- a/drivers/rtc/rtc-abx80x.c
+++ b/drivers/rtc/rtc-abx80x.c
@@ -78,6 +78,10 @@
 
 #define ABX8XX_REG_ID0		0x28
 
+#define ABX8XX_REG_ANA_STATUS	0x2f
+#define ABX8XX_ANA_BREFD	BIT(7)
+#define ABX8XX_ANA_BMIN		BIT(6)
+
 #define ABX8XX_REG_OUT_CTRL	0x30
 #define ABX8XX_OUT_CTRL_EXDS	BIT(4)
 
@@ -548,6 +552,25 @@ static int abx80x_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
 	}
 }
 
+static int abx80x_proc(struct device *dev, struct seq_file *seq)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	int status, tmp;
+
+	status = i2c_smbus_read_byte_data(client, ABX8XX_REG_ANA_STATUS);
+	if (status < 0)
+		return status;
+
+	if (status & ABX8XX_ANA_BREFD)
+		seq_printf(seq, "battery\t\t: ok\n");
+	else if (status & ABX8XX_ANA_BMIN)
+		seq_printf(seq, "battery\t\t: low\n");
+	else
+		seq_printf(seq, "battery\t\t: exhausted\n");
+
+	return 0;
+}
+
 static const struct rtc_class_ops abx80x_rtc_ops = {
 	.read_time	= abx80x_rtc_read_time,
 	.set_time	= abx80x_rtc_set_time,
@@ -555,6 +578,7 @@ static const struct rtc_class_ops abx80x_rtc_ops = {
 	.set_alarm	= abx80x_set_alarm,
 	.alarm_irq_enable = abx80x_alarm_irq_enable,
 	.ioctl		= abx80x_ioctl,
+	.proc		= abx80x_proc,
 };
 
 static int abx80x_dt_trickle_cfg(struct device_node *np)
-- 
2.20.1

