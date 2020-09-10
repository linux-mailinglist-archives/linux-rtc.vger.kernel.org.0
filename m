Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D5922653C9
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Sep 2020 23:40:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728093AbgIJVkm (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 10 Sep 2020 17:40:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730377AbgIJNGb (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 10 Sep 2020 09:06:31 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CB60C0617AA
        for <linux-rtc@vger.kernel.org>; Thu, 10 Sep 2020 06:05:10 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id e16so6654601wrm.2
        for <linux-rtc@vger.kernel.org>; Thu, 10 Sep 2020 06:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ab7Hamq6ohtTp+rP2MQP/0xufjbYYELDWh0uY2DTobw=;
        b=OCenwqp39IfG831ee8meZHTiHKCXoL9GZemRMSBiGXjSOpjjDYqIIMMcolFpc2SXnS
         ihio9WElD1mPO/9SvEYK2lTWcGgEdrgYgSuo6swwYs7JHsmd2Am4GNpBtNnILwt1seB1
         UPmrOzGWo0bIj1gFP1H5haVyt1wGJ2S3qqWa1RFbP0FLLMBV7atediK66xcq/hczVUjL
         SoEhp779HuSSwXGjxtvQqgjO9iuoKY3b/aksiLtEonOny0TeuIqrndjv3b0MdeJUhR07
         1MzpuYtiMz4gT1hggeiEC2M1sTwtrSctVKrSLrG/7ESqnHzItVxfMCZCi4x7qZH+UGEb
         Kq2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ab7Hamq6ohtTp+rP2MQP/0xufjbYYELDWh0uY2DTobw=;
        b=LMaTGpbj+VfwQGPc+wwA+tWH2zROlXbse5AxRrZKVGNlezJGn+AtLNH0iFLVMoVHKm
         4f+RIawViV2SfkGBmyUMMZjMCuEveeCisfQLdGLIAOFn87qHFlAadHYgPcq9miArW3J9
         Fb74+W5mTh2Aq8DTq8IY2ECbxze12K876soqPNExrOkc2ewfvfAe6l1A+6YjYoYbkqEc
         VBMvEn3MsUlKKlbm5CBjVGBI5U5WoYeFJniE4b4TkEUnntX3nPTUCuHKeZDsp4T+vAOk
         3FTuUfjV3D1p5Dm9q8LWPDKFwJChlqBBJXweR1MA1kgKYbykkZqnhPOBqVUelxMO0MzI
         R+pA==
X-Gm-Message-State: AOAM530yfX228f2lwATWydH5hMqISdNLhTA8K4iB+P23HwT3ZoTLfEeZ
        zVbzv+7P2vZgaknaou3bOPkF1A==
X-Google-Smtp-Source: ABdhPJwc27wNhnaU6FL0uzWRHsRNOj5f0W9v2F5VM+O63TOoHv4AcdQ68Vs8SdsrSikY5VJoRP+n8w==
X-Received: by 2002:a5d:4a49:: with SMTP id v9mr4867460wrs.153.1599743109143;
        Thu, 10 Sep 2020 06:05:09 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id p16sm9321988wro.71.2020.09.10.06.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 06:05:08 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 10/11] rtc: rx8010: convert to using regmap
Date:   Thu, 10 Sep 2020 15:04:45 +0200
Message-Id: <20200910130446.5689-11-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200910130446.5689-1-brgl@bgdev.pl>
References: <20200910130446.5689-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This driver requires SMBUS to work. We can relax this requirement if we
switch to using i2c regmap and let the regmap sub-system figure out how
to talk to the bus.

This also has the advantage of shrinking the code for register updates.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/rtc/rtc-rx8010.c | 198 ++++++++++++++++-----------------------
 1 file changed, 79 insertions(+), 119 deletions(-)

diff --git a/drivers/rtc/rtc-rx8010.c b/drivers/rtc/rtc-rx8010.c
index bb6578aad972..636e0de02d9b 100644
--- a/drivers/rtc/rtc-rx8010.c
+++ b/drivers/rtc/rtc-rx8010.c
@@ -11,6 +11,7 @@
 #include <linux/i2c.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/regmap.h>
 #include <linux/rtc.h>
 
 #define RX8010_SEC		0x10
@@ -61,7 +62,7 @@ static const struct of_device_id rx8010_of_match[] = {
 MODULE_DEVICE_TABLE(of, rx8010_of_match);
 
 struct rx8010_data {
-	struct i2c_client *client;
+	struct regmap *regs;
 	struct rtc_device *rtc;
 	u8 ctrlreg;
 };
@@ -70,13 +71,12 @@ static irqreturn_t rx8010_irq_1_handler(int irq, void *dev_id)
 {
 	struct i2c_client *client = dev_id;
 	struct rx8010_data *rx8010 = i2c_get_clientdata(client);
-	int flagreg;
+	int flagreg, err;
 
 	mutex_lock(&rx8010->rtc->ops_lock);
 
-	flagreg = i2c_smbus_read_byte_data(client, RX8010_FLAG);
-
-	if (flagreg <= 0) {
+	err = regmap_read(rx8010->regs, RX8010_FLAG, &flagreg);
+	if (err) {
 		mutex_unlock(&rx8010->rtc->ops_lock);
 		return IRQ_NONE;
 	}
@@ -99,10 +99,9 @@ static irqreturn_t rx8010_irq_1_handler(int irq, void *dev_id)
 		rtc_update_irq(rx8010->rtc, 1, RTC_UF | RTC_IRQF);
 	}
 
-	i2c_smbus_write_byte_data(client, RX8010_FLAG, flagreg);
-
+	err = regmap_write(rx8010->regs, RX8010_FLAG, flagreg);
 	mutex_unlock(&rx8010->rtc->ops_lock);
-	return IRQ_HANDLED;
+	return err ? IRQ_NONE : IRQ_HANDLED;
 }
 
 static int rx8010_get_time(struct device *dev, struct rtc_time *dt)
@@ -111,19 +110,18 @@ static int rx8010_get_time(struct device *dev, struct rtc_time *dt)
 	u8 date[RX8010_YEAR - RX8010_SEC + 1];
 	int flagreg, err;
 
-	flagreg = i2c_smbus_read_byte_data(rx8010->client, RX8010_FLAG);
-	if (flagreg < 0)
-		return flagreg;
+	err = regmap_read(rx8010->regs, RX8010_FLAG, &flagreg);
+	if (err)
+		return err;
 
 	if (flagreg & RX8010_FLAG_VLF) {
 		dev_warn(dev, "Frequency stop detected\n");
 		return -EINVAL;
 	}
 
-	err = i2c_smbus_read_i2c_block_data(rx8010->client, RX8010_SEC,
-					    sizeof(date), date);
-	if (err != sizeof(date))
-		return err < 0 ? err : -EIO;
+	err = regmap_bulk_read(rx8010->regs, RX8010_SEC, date, sizeof(date));
+	if (err)
+		return err;
 
 	dt->tm_sec = bcd2bin(date[RX8010_SEC - RX8010_SEC] & 0x7f);
 	dt->tm_min = bcd2bin(date[RX8010_MIN - RX8010_SEC] & 0x7f);
@@ -140,19 +138,14 @@ static int rx8010_set_time(struct device *dev, struct rtc_time *dt)
 {
 	struct rx8010_data *rx8010 = dev_get_drvdata(dev);
 	u8 date[RX8010_YEAR - RX8010_SEC + 1];
-	int ctrl, flagreg, err;
+	int err;
 
 	if ((dt->tm_year < 100) || (dt->tm_year > 199))
 		return -EINVAL;
 
 	/* set STOP bit before changing clock/calendar */
-	ctrl = i2c_smbus_read_byte_data(rx8010->client, RX8010_CTRL);
-	if (ctrl < 0)
-		return ctrl;
-	rx8010->ctrlreg = ctrl | RX8010_CTRL_STOP;
-	err = i2c_smbus_write_byte_data(rx8010->client, RX8010_CTRL,
-					rx8010->ctrlreg);
-	if (err < 0)
+	err = regmap_set_bits(rx8010->regs, RX8010_CTRL, RX8010_CTRL_STOP);
+	if (err)
 		return err;
 
 	date[RX8010_SEC - RX8010_SEC] = bin2bcd(dt->tm_sec);
@@ -163,66 +156,54 @@ static int rx8010_set_time(struct device *dev, struct rtc_time *dt)
 	date[RX8010_YEAR - RX8010_SEC] = bin2bcd(dt->tm_year - 100);
 	date[RX8010_WDAY - RX8010_SEC] = bin2bcd(1 << dt->tm_wday);
 
-	err = i2c_smbus_write_i2c_block_data(rx8010->client,
-					     RX8010_SEC, sizeof(date),
-					     date);
-	if (err < 0)
+	err = regmap_bulk_write(rx8010->regs, RX8010_SEC, date, sizeof(date));
+	if (err)
 		return err;
 
 	/* clear STOP bit after changing clock/calendar */
-	ctrl = i2c_smbus_read_byte_data(rx8010->client, RX8010_CTRL);
-	if (ctrl < 0)
-		return ctrl;
-	rx8010->ctrlreg = ctrl & ~RX8010_CTRL_STOP;
-	err = i2c_smbus_write_byte_data(rx8010->client, RX8010_CTRL,
-					rx8010->ctrlreg);
-	if (err < 0)
+	err = regmap_clear_bits(rx8010->regs, RX8010_CTRL, RX8010_CTRL_STOP);
+	if (err)
 		return err;
 
-	flagreg = i2c_smbus_read_byte_data(rx8010->client, RX8010_FLAG);
-	if (flagreg < 0)
-		return flagreg;
-
-	if (flagreg & RX8010_FLAG_VLF)
-		err = i2c_smbus_write_byte_data(rx8010->client, RX8010_FLAG,
-						flagreg & ~RX8010_FLAG_VLF);
+	err = regmap_clear_bits(rx8010->regs, RX8010_FLAG, RX8010_FLAG_VLF);
+	if (err)
+		return err;
 
 	return 0;
 }
 
-static int rx8010_init_client(struct i2c_client *client)
+static int rx8010_init_client(struct device *dev)
 {
-	struct rx8010_data *rx8010 = i2c_get_clientdata(client);
+	struct rx8010_data *rx8010 = dev_get_drvdata(dev);
 	u8 ctrl[2];
 	int need_clear = 0, err;
 
 	/* Initialize reserved registers as specified in datasheet */
-	err = i2c_smbus_write_byte_data(client, RX8010_RESV17, 0xD8);
-	if (err < 0)
+	err = regmap_write(rx8010->regs, RX8010_RESV17, 0xD8);
+	if (err)
 		return err;
 
-	err = i2c_smbus_write_byte_data(client, RX8010_RESV30, 0x00);
-	if (err < 0)
+	err = regmap_write(rx8010->regs, RX8010_RESV30, 0x00);
+	if (err)
 		return err;
 
-	err = i2c_smbus_write_byte_data(client, RX8010_RESV31, 0x08);
-	if (err < 0)
+	err = regmap_write(rx8010->regs, RX8010_RESV31, 0x08);
+	if (err)
 		return err;
 
-	err = i2c_smbus_write_byte_data(client, RX8010_IRQ, 0x00);
-	if (err < 0)
+	err = regmap_write(rx8010->regs, RX8010_IRQ, 0x00);
+	if (err)
 		return err;
 
-	err = i2c_smbus_read_i2c_block_data(rx8010->client, RX8010_FLAG,
-					    2, ctrl);
-	if (err != 2)
-		return err < 0 ? err : -EIO;
+	err = regmap_bulk_read(rx8010->regs, RX8010_FLAG, ctrl, 2);
+	if (err)
+		return err;
 
 	if (ctrl[0] & RX8010_FLAG_VLF)
-		dev_warn(&client->dev, "Frequency stop was detected\n");
+		dev_warn(dev, "Frequency stop was detected\n");
 
 	if (ctrl[0] & RX8010_FLAG_AF) {
-		dev_warn(&client->dev, "Alarm was detected\n");
+		dev_warn(dev, "Alarm was detected\n");
 		need_clear = 1;
 	}
 
@@ -234,8 +215,8 @@ static int rx8010_init_client(struct i2c_client *client)
 
 	if (need_clear) {
 		ctrl[0] &= ~(RX8010_FLAG_AF | RX8010_FLAG_TF | RX8010_FLAG_UF);
-		err = i2c_smbus_write_byte_data(client, RX8010_FLAG, ctrl[0]);
-		if (err < 0)
+		err = regmap_write(rx8010->regs, RX8010_FLAG, ctrl[0]);
+		if (err)
 			return err;
 	}
 
@@ -247,17 +228,16 @@ static int rx8010_init_client(struct i2c_client *client)
 static int rx8010_read_alarm(struct device *dev, struct rtc_wkalrm *t)
 {
 	struct rx8010_data *rx8010 = dev_get_drvdata(dev);
-	struct i2c_client *client = rx8010->client;
 	u8 alarmvals[3];
 	int flagreg, err;
 
-	err = i2c_smbus_read_i2c_block_data(client, RX8010_ALMIN, 3, alarmvals);
-	if (err != 3)
-		return err < 0 ? err : -EIO;
+	err = regmap_bulk_read(rx8010->regs, RX8010_ALMIN, alarmvals, 3);
+	if (err)
+		return err;
 
-	flagreg = i2c_smbus_read_byte_data(client, RX8010_FLAG);
-	if (flagreg < 0)
-		return flagreg;
+	err = regmap_read(rx8010->regs, RX8010_FLAG, &flagreg);
+	if (err)
+		return err;
 
 	t->time.tm_sec = 0;
 	t->time.tm_min = bcd2bin(alarmvals[0] & 0x7f);
@@ -274,52 +254,38 @@ static int rx8010_read_alarm(struct device *dev, struct rtc_wkalrm *t)
 
 static int rx8010_set_alarm(struct device *dev, struct rtc_wkalrm *t)
 {
-	struct i2c_client *client = to_i2c_client(dev);
 	struct rx8010_data *rx8010 = dev_get_drvdata(dev);
 	u8 alarmvals[3];
-	int extreg, flagreg, err;
-
-	flagreg = i2c_smbus_read_byte_data(client, RX8010_FLAG);
-	if (flagreg < 0)
-		return flagreg;
+	int err;
 
 	if (rx8010->ctrlreg & (RX8010_CTRL_AIE | RX8010_CTRL_UIE)) {
 		rx8010->ctrlreg &= ~(RX8010_CTRL_AIE | RX8010_CTRL_UIE);
-		err = i2c_smbus_write_byte_data(rx8010->client, RX8010_CTRL,
-						rx8010->ctrlreg);
-		if (err < 0)
+		err = regmap_write(rx8010->regs, RX8010_CTRL, rx8010->ctrlreg);
+		if (err)
 			return err;
 	}
 
-	flagreg &= ~RX8010_FLAG_AF;
-	err = i2c_smbus_write_byte_data(rx8010->client, RX8010_FLAG, flagreg);
-	if (err < 0)
+	err = regmap_clear_bits(rx8010->regs, RX8010_FLAG, RX8010_FLAG_AF);
+	if (err)
 		return err;
 
 	alarmvals[0] = bin2bcd(t->time.tm_min);
 	alarmvals[1] = bin2bcd(t->time.tm_hour);
 	alarmvals[2] = bin2bcd(t->time.tm_mday);
 
-	err = i2c_smbus_write_i2c_block_data(rx8010->client, RX8010_ALMIN,
-					     2, alarmvals);
-	if (err < 0)
+	err = regmap_bulk_write(rx8010->regs, RX8010_ALMIN, alarmvals, 2);
+	if (err)
 		return err;
 
-	extreg = i2c_smbus_read_byte_data(client, RX8010_EXT);
-	if (extreg < 0)
-		return extreg;
-
-	extreg |= RX8010_EXT_WADA;
-	err = i2c_smbus_write_byte_data(rx8010->client, RX8010_EXT, extreg);
-	if (err < 0)
+	err = regmap_clear_bits(rx8010->regs, RX8010_EXT, RX8010_EXT_WADA);
+	if (err)
 		return err;
 
 	if (alarmvals[2] == 0)
 		alarmvals[2] |= RX8010_ALARM_AE;
 
-	err = i2c_smbus_write_byte_data(rx8010->client, RX8010_ALWDAY,
-					alarmvals[2]);
-	if (err < 0)
+	err = regmap_write(rx8010->regs, RX8010_ALWDAY, alarmvals[2]);
+	if (err)
 		return err;
 
 	if (t->enabled) {
@@ -329,9 +295,8 @@ static int rx8010_set_alarm(struct device *dev, struct rtc_wkalrm *t)
 			rx8010->ctrlreg |=
 				(RX8010_CTRL_AIE | RX8010_CTRL_UIE);
 
-		err = i2c_smbus_write_byte_data(rx8010->client, RX8010_CTRL,
-						rx8010->ctrlreg);
-		if (err < 0)
+		err = regmap_write(rx8010->regs, RX8010_CTRL, rx8010->ctrlreg);
+		if (err)
 			return err;
 	}
 
@@ -341,9 +306,8 @@ static int rx8010_set_alarm(struct device *dev, struct rtc_wkalrm *t)
 static int rx8010_alarm_irq_enable(struct device *dev,
 				   unsigned int enabled)
 {
-	struct i2c_client *client = to_i2c_client(dev);
 	struct rx8010_data *rx8010 = dev_get_drvdata(dev);
-	int flagreg, err;
+	int err;
 	u8 ctrl;
 
 	ctrl = rx8010->ctrlreg;
@@ -360,20 +324,14 @@ static int rx8010_alarm_irq_enable(struct device *dev,
 			ctrl &= ~RX8010_CTRL_AIE;
 	}
 
-	flagreg = i2c_smbus_read_byte_data(client, RX8010_FLAG);
-	if (flagreg < 0)
-		return flagreg;
-
-	flagreg &= ~RX8010_FLAG_AF;
-	err = i2c_smbus_write_byte_data(rx8010->client, RX8010_FLAG, flagreg);
-	if (err < 0)
+	err = regmap_clear_bits(rx8010->regs, RX8010_FLAG, RX8010_FLAG_AF);
+	if (err)
 		return err;
 
 	if (ctrl != rx8010->ctrlreg) {
 		rx8010->ctrlreg = ctrl;
-		err = i2c_smbus_write_byte_data(rx8010->client, RX8010_CTRL,
-						rx8010->ctrlreg);
-		if (err < 0)
+		err = regmap_write(rx8010->regs, RX8010_CTRL, rx8010->ctrlreg);
+		if (err)
 			return err;
 	}
 
@@ -383,13 +341,13 @@ static int rx8010_alarm_irq_enable(struct device *dev,
 static int rx8010_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
 {
 	struct rx8010_data *rx8010 = dev_get_drvdata(dev);
-	int tmp, flagreg;
+	int tmp, flagreg, err;
 
 	switch (cmd) {
 	case RTC_VL_READ:
-		flagreg = i2c_smbus_read_byte_data(rx8010->client, RX8010_FLAG);
-		if (flagreg < 0)
-			return flagreg;
+		err = regmap_read(rx8010->regs, RX8010_FLAG, &flagreg);
+		if (err)
+			return err;
 
 		tmp = flagreg & RX8010_FLAG_VLF ? RTC_VL_DATA_INVALID : 0;
 		return put_user(tmp, (unsigned int __user *)arg);
@@ -405,28 +363,30 @@ static struct rtc_class_ops rx8010_rtc_ops = {
 	.ioctl = rx8010_ioctl,
 };
 
+static const struct regmap_config rx8010_regmap_config = {
+	.name = "rx8010-rtc",
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
 static int rx8010_probe(struct i2c_client *client,
 			const struct i2c_device_id *id)
 {
-	struct i2c_adapter *adapter = client->adapter;
 	struct device *dev = &client->dev;
 	struct rx8010_data *rx8010;
 	int err = 0;
 
-	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA
-		| I2C_FUNC_SMBUS_I2C_BLOCK)) {
-		dev_err(&adapter->dev, "doesn't support required functionality\n");
-		return -EIO;
-	}
-
 	rx8010 = devm_kzalloc(dev, sizeof(*rx8010), GFP_KERNEL);
 	if (!rx8010)
 		return -ENOMEM;
 
-	rx8010->client = client;
 	i2c_set_clientdata(client, rx8010);
 
-	err = rx8010_init_client(client);
+	rx8010->regs = devm_regmap_init_i2c(client, &rx8010_regmap_config);
+	if (IS_ERR(rx8010->regs))
+		return PTR_ERR(rx8010->regs);
+
+	err = rx8010_init_client(dev);
 	if (err)
 		return err;
 
-- 
2.26.1

