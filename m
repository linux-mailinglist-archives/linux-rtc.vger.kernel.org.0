Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC573122B00
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Dec 2019 13:12:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727804AbfLQMM6 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 17 Dec 2019 07:12:58 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:44050 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726383AbfLQMM6 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 17 Dec 2019 07:12:58 -0500
Received: by mail-pg1-f193.google.com with SMTP id x7so5558944pgl.11
        for <linux-rtc@vger.kernel.org>; Tue, 17 Dec 2019 04:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mJdcluQXxj5OtwQqfsjIczjKo/yaeQ8i3VSRCA7I7Bo=;
        b=IwJkQVuIWbwYi9mwzy7RJdC8A4/37MFu5MhRJ/7VJ9nLGy9oKdlQOB6bQo8a8V//Oa
         kl9qTBsrNiqcLDWT9Dx5egS/9tSMrkQkjVHVNUDUlsjc6ss8iw2mZvqiT/EJot+krKjw
         Wt3CwIHg433nc1oTdqMMbyeGeYIiQ97MSG1VdIEbsuvwP36a0nTjUKsz/x0V96pD5R4x
         31mWjYOaC+O47PJdTyeon2WG36vr4peahcUqXd4y7SAWh5S2BNeAXtOGXpfZCYy5XYtg
         +lBVAxGUDKNJ/xJh4St0cJDfp/ELGdsMqMp/ITm78/oDlvfbgvndstq1tWjQjDtNbzrt
         2DBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mJdcluQXxj5OtwQqfsjIczjKo/yaeQ8i3VSRCA7I7Bo=;
        b=F0f1JUGYhh/eJKjIRQ4aTXa4VEsIIWDeQKNSw5Fkuhkc5HQ0jOCA2ed50cpURyFBgm
         6iO6FvftmA0+v/qwPkNtiC4tJSRW7eV5kjGGhFzVefho//T96luQSYtvyzgAU56I4nSu
         jX8pVSjC8A5zbOWH/PRjVzr8ndY/wmXwbSj/JKMM6n49WsLhPf+5xzSTGs96A60h8GCK
         /cJYEk8WrnyXbCdnMNRIOH344BkbHwnyX7Fgs8//b/JEJ4scTEpOcmurfwSzmSp7+mHR
         F+KRmQmJgI+oGeMe6E65bOxe9cvGwkfb6enncU0wCrdlYsi1V6dav48G9uYTpDHHkmk2
         bjOQ==
X-Gm-Message-State: APjAAAXytycSwG4NPTYitfhwxPjJscTpxH3sptazQsSHbN9IQVjAKGMQ
        t8SCRZmCrbiiLisM1f2zQO9heRhk4w==
X-Google-Smtp-Source: APXvYqwH6Rqgy+ffukN554tVPE+jnnZjoT1ZaEBAxHL5oJUKlzFxMTZ+opXm21Sl01f8Mwlf9cMzkQ==
X-Received: by 2002:a63:fa50:: with SMTP id g16mr18083497pgk.202.1576584776900;
        Tue, 17 Dec 2019 04:12:56 -0800 (PST)
Received: from localhost ([2405:6581:5360:1800:49ba:c4f5:5ab9:da22])
        by smtp.gmail.com with ESMTPSA id j22sm3169106pji.16.2019.12.17.04.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2019 04:12:56 -0800 (PST)
From:   Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
To:     linux-rtc@vger.kernel.org
Cc:     Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Akshay Bhat <akshay.bhat@timesys.com>
Subject: [PATCH] rtc: rx8010: Remove struct i2c_client from struct rx8010_data
Date:   Tue, 17 Dec 2019 21:12:30 +0900
Message-Id: <20191217121231.2698817-1-iwamatsu@nigauri.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The struct i2c_client can be obtained using to_i2c_client with struct
device. This driver does not need to have it in struct rx8010_data.

CC: Alessandro Zummo <a.zummo@towertech.it>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Akshay Bhat <akshay.bhat@timesys.com>
Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
---
 drivers/rtc/rtc-rx8010.c | 48 +++++++++++++++++++---------------------
 1 file changed, 23 insertions(+), 25 deletions(-)

diff --git a/drivers/rtc/rtc-rx8010.c b/drivers/rtc/rtc-rx8010.c
index 8102469e27c05..c5d3ad2163475 100644
--- a/drivers/rtc/rtc-rx8010.c
+++ b/drivers/rtc/rtc-rx8010.c
@@ -61,7 +61,6 @@ static const struct of_device_id rx8010_of_match[] = {
 MODULE_DEVICE_TABLE(of, rx8010_of_match);
 
 struct rx8010_data {
-	struct i2c_client *client;
 	struct rtc_device *rtc;
 	u8 ctrlreg;
 };
@@ -107,12 +106,12 @@ static irqreturn_t rx8010_irq_1_handler(int irq, void *dev_id)
 
 static int rx8010_get_time(struct device *dev, struct rtc_time *dt)
 {
-	struct rx8010_data *rx8010 = dev_get_drvdata(dev);
+	struct i2c_client *client = to_i2c_client(dev);
 	u8 date[7];
 	int flagreg;
 	int err;
 
-	flagreg = i2c_smbus_read_byte_data(rx8010->client, RX8010_FLAG);
+	flagreg = i2c_smbus_read_byte_data(client, RX8010_FLAG);
 	if (flagreg < 0)
 		return flagreg;
 
@@ -121,7 +120,7 @@ static int rx8010_get_time(struct device *dev, struct rtc_time *dt)
 		return -EINVAL;
 	}
 
-	err = i2c_smbus_read_i2c_block_data(rx8010->client, RX8010_SEC,
+	err = i2c_smbus_read_i2c_block_data(client, RX8010_SEC,
 					    7, date);
 	if (err != 7)
 		return err < 0 ? err : -EIO;
@@ -139,6 +138,7 @@ static int rx8010_get_time(struct device *dev, struct rtc_time *dt)
 
 static int rx8010_set_time(struct device *dev, struct rtc_time *dt)
 {
+	struct i2c_client *client = to_i2c_client(dev);
 	struct rx8010_data *rx8010 = dev_get_drvdata(dev);
 	u8 date[7];
 	int ctrl, flagreg;
@@ -148,11 +148,11 @@ static int rx8010_set_time(struct device *dev, struct rtc_time *dt)
 		return -EINVAL;
 
 	/* set STOP bit before changing clock/calendar */
-	ctrl = i2c_smbus_read_byte_data(rx8010->client, RX8010_CTRL);
+	ctrl = i2c_smbus_read_byte_data(client, RX8010_CTRL);
 	if (ctrl < 0)
 		return ctrl;
 	rx8010->ctrlreg = ctrl | RX8010_CTRL_STOP;
-	ret = i2c_smbus_write_byte_data(rx8010->client, RX8010_CTRL,
+	ret = i2c_smbus_write_byte_data(client, RX8010_CTRL,
 					rx8010->ctrlreg);
 	if (ret < 0)
 		return ret;
@@ -165,28 +165,28 @@ static int rx8010_set_time(struct device *dev, struct rtc_time *dt)
 	date[RX8010_YEAR - RX8010_SEC] = bin2bcd(dt->tm_year - 100);
 	date[RX8010_WDAY - RX8010_SEC] = bin2bcd(1 << dt->tm_wday);
 
-	ret = i2c_smbus_write_i2c_block_data(rx8010->client,
+	ret = i2c_smbus_write_i2c_block_data(client,
 					     RX8010_SEC, 7, date);
 	if (ret < 0)
 		return ret;
 
 	/* clear STOP bit after changing clock/calendar */
-	ctrl = i2c_smbus_read_byte_data(rx8010->client, RX8010_CTRL);
+	ctrl = i2c_smbus_read_byte_data(client, RX8010_CTRL);
 	if (ctrl < 0)
 		return ctrl;
 	rx8010->ctrlreg = ctrl & ~RX8010_CTRL_STOP;
-	ret = i2c_smbus_write_byte_data(rx8010->client, RX8010_CTRL,
+	ret = i2c_smbus_write_byte_data(client, RX8010_CTRL,
 					rx8010->ctrlreg);
 	if (ret < 0)
 		return ret;
 
-	flagreg = i2c_smbus_read_byte_data(rx8010->client, RX8010_FLAG);
+	flagreg = i2c_smbus_read_byte_data(client, RX8010_FLAG);
 	if (flagreg < 0) {
 		return flagreg;
 	}
 
 	if (flagreg & RX8010_FLAG_VLF)
-		ret = i2c_smbus_write_byte_data(rx8010->client, RX8010_FLAG,
+		ret = i2c_smbus_write_byte_data(client, RX8010_FLAG,
 						flagreg & ~RX8010_FLAG_VLF);
 
 	return 0;
@@ -215,7 +215,7 @@ static int rx8010_init_client(struct i2c_client *client)
 	if (err < 0)
 		return err;
 
-	err = i2c_smbus_read_i2c_block_data(rx8010->client, RX8010_FLAG,
+	err = i2c_smbus_read_i2c_block_data(client, RX8010_FLAG,
 					    2, ctrl);
 	if (err != 2)
 		return err < 0 ? err : -EIO;
@@ -248,8 +248,8 @@ static int rx8010_init_client(struct i2c_client *client)
 
 static int rx8010_read_alarm(struct device *dev, struct rtc_wkalrm *t)
 {
+	struct i2c_client *client = to_i2c_client(dev);
 	struct rx8010_data *rx8010 = dev_get_drvdata(dev);
-	struct i2c_client *client = rx8010->client;
 	u8 alarmvals[3];
 	int flagreg;
 	int err;
@@ -290,7 +290,7 @@ static int rx8010_set_alarm(struct device *dev, struct rtc_wkalrm *t)
 
 	if (rx8010->ctrlreg & (RX8010_CTRL_AIE | RX8010_CTRL_UIE)) {
 		rx8010->ctrlreg &= ~(RX8010_CTRL_AIE | RX8010_CTRL_UIE);
-		err = i2c_smbus_write_byte_data(rx8010->client, RX8010_CTRL,
+		err = i2c_smbus_write_byte_data(client, RX8010_CTRL,
 						rx8010->ctrlreg);
 		if (err < 0) {
 			return err;
@@ -298,7 +298,7 @@ static int rx8010_set_alarm(struct device *dev, struct rtc_wkalrm *t)
 	}
 
 	flagreg &= ~RX8010_FLAG_AF;
-	err = i2c_smbus_write_byte_data(rx8010->client, RX8010_FLAG, flagreg);
+	err = i2c_smbus_write_byte_data(client, RX8010_FLAG, flagreg);
 	if (err < 0)
 		return err;
 
@@ -306,7 +306,7 @@ static int rx8010_set_alarm(struct device *dev, struct rtc_wkalrm *t)
 	alarmvals[1] = bin2bcd(t->time.tm_hour);
 	alarmvals[2] = bin2bcd(t->time.tm_mday);
 
-	err = i2c_smbus_write_i2c_block_data(rx8010->client, RX8010_ALMIN,
+	err = i2c_smbus_write_i2c_block_data(client, RX8010_ALMIN,
 					     2, alarmvals);
 	if (err < 0)
 		return err;
@@ -316,14 +316,14 @@ static int rx8010_set_alarm(struct device *dev, struct rtc_wkalrm *t)
 		return extreg;
 
 	extreg |= RX8010_EXT_WADA;
-	err = i2c_smbus_write_byte_data(rx8010->client, RX8010_EXT, extreg);
+	err = i2c_smbus_write_byte_data(client, RX8010_EXT, extreg);
 	if (err < 0)
 		return err;
 
 	if (alarmvals[2] == 0)
 		alarmvals[2] |= RX8010_ALARM_AE;
 
-	err = i2c_smbus_write_byte_data(rx8010->client, RX8010_ALWDAY,
+	err = i2c_smbus_write_byte_data(client, RX8010_ALWDAY,
 					alarmvals[2]);
 	if (err < 0)
 		return err;
@@ -335,7 +335,7 @@ static int rx8010_set_alarm(struct device *dev, struct rtc_wkalrm *t)
 			rx8010->ctrlreg |=
 				(RX8010_CTRL_AIE | RX8010_CTRL_UIE);
 
-		err = i2c_smbus_write_byte_data(rx8010->client, RX8010_CTRL,
+		err = i2c_smbus_write_byte_data(client, RX8010_CTRL,
 						rx8010->ctrlreg);
 		if (err < 0)
 			return err;
@@ -372,13 +372,13 @@ static int rx8010_alarm_irq_enable(struct device *dev,
 		return flagreg;
 
 	flagreg &= ~RX8010_FLAG_AF;
-	err = i2c_smbus_write_byte_data(rx8010->client, RX8010_FLAG, flagreg);
+	err = i2c_smbus_write_byte_data(client, RX8010_FLAG, flagreg);
 	if (err < 0)
 		return err;
 
 	if (ctrl != rx8010->ctrlreg) {
 		rx8010->ctrlreg = ctrl;
-		err = i2c_smbus_write_byte_data(rx8010->client, RX8010_CTRL,
+		err = i2c_smbus_write_byte_data(client, RX8010_CTRL,
 						rx8010->ctrlreg);
 		if (err < 0)
 			return err;
@@ -390,13 +390,12 @@ static int rx8010_alarm_irq_enable(struct device *dev,
 static int rx8010_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
 {
 	struct i2c_client *client = to_i2c_client(dev);
-	struct rx8010_data *rx8010 = dev_get_drvdata(dev);
 	int ret, tmp;
 	int flagreg;
 
 	switch (cmd) {
 	case RTC_VL_READ:
-		flagreg = i2c_smbus_read_byte_data(rx8010->client, RX8010_FLAG);
+		flagreg = i2c_smbus_read_byte_data(client, RX8010_FLAG);
 		if (flagreg < 0)
 			return flagreg;
 
@@ -407,7 +406,7 @@ static int rx8010_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
 		return 0;
 
 	case RTC_VL_CLR:
-		flagreg = i2c_smbus_read_byte_data(rx8010->client, RX8010_FLAG);
+		flagreg = i2c_smbus_read_byte_data(client, RX8010_FLAG);
 		if (flagreg < 0) {
 			return flagreg;
 		}
@@ -448,7 +447,6 @@ static int rx8010_probe(struct i2c_client *client,
 	if (!rx8010)
 		return -ENOMEM;
 
-	rx8010->client = client;
 	i2c_set_clientdata(client, rx8010);
 
 	err = rx8010_init_client(client);
-- 
2.24.0

