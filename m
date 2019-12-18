Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FC60124197
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Dec 2019 09:26:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726705AbfLRI0K (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 18 Dec 2019 03:26:10 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:45373 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbfLRI0K (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 18 Dec 2019 03:26:10 -0500
Received: by mail-pl1-f196.google.com with SMTP id b22so633826pls.12
        for <linux-rtc@vger.kernel.org>; Wed, 18 Dec 2019 00:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zFt1iZknOhUjnCRzF1BzxqGyshetb14P5bT2CA8+rg0=;
        b=DUD2hAnnVxHl/3nIiQPvLoDZUpMSDuJuX8EHrvLTqgInqZdKSKPJiXli2IakoYUvft
         RhnI59uo18dxEJlYXeLHTpSBtLb2VleyICm8lbu4CmWvTV+XFonQ51rJkIuH8aqmyivG
         MTCojtErMqrIAARn7dfCs+HifoO5ERDO3R1aWC6APRMd1fG9SIHZsqomq85aZ2EpYQHG
         KurpZrgCMb3kuxIUUZ9L/8DFAG96yQgN7QvapAdD2u7CGr7UHn3X6qm+ooFFgKNAso2c
         uDp/jCfb4CHnKtCqiHQCYGuLlh/Tl1H+OshbxCaC6buLKS0qfzVJz1vaashviZY4odsp
         C4QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zFt1iZknOhUjnCRzF1BzxqGyshetb14P5bT2CA8+rg0=;
        b=bzV0nw7eAUdMMBIyaN1SRwa4KHEo+xv3BbpNlTDDpAd3qrW0XqqOIetttGhVfeAq1k
         uLO3+qCbib42eZDYmf+Jmub2n2xkqFp+z1cVDVFEm0QgXKgaHvIa6+izgOo0r2xiDpJO
         R6B5dsugeFN3buyc3Fyth2WzosIxdEN/f99aNnXrDE2vSEqep0xczN+gemDfC06x9y5v
         Zu4GaH0kvZcB1bf3JT07M6PDoPhPdPmhHbdVucwUwxZdX/TvtWgoW0kFZGpc3V7qRMUp
         LH8yRUI8rYEZPkzmqcumxYRA2QGHeQSUgV9K4Mu2IpSWuBcu2hrEXXrWrAyoKzAsGKTw
         5ILQ==
X-Gm-Message-State: APjAAAVZXNqG9SEREfKdOfXgNd7UG7Ves37PBgTQwsGKzxPzJjXe01Kp
        dKCLsoqnRniYKdLewO6rFiwiQ2l6Ug==
X-Google-Smtp-Source: APXvYqyeqG+GJiQouX4B7E/x7MizIkX7GPD+vW2mX3zpPsIU10DgY1zJIbhPB5AkaK3dTkF4+0lpPQ==
X-Received: by 2002:a17:902:8609:: with SMTP id f9mr541858plo.205.1576657569517;
        Wed, 18 Dec 2019 00:26:09 -0800 (PST)
Received: from localhost (om126208136186.22.openmobile.ne.jp. [126.208.136.186])
        by smtp.gmail.com with ESMTPSA id j7sm2142839pgn.0.2019.12.18.00.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 00:26:09 -0800 (PST)
From:   Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
To:     linux-rtc@vger.kernel.org
Cc:     Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: [PATCH] rtc: pcf8563: Replace i2c functions for smbus ones
Date:   Wed, 18 Dec 2019 17:26:04 +0900
Message-Id: <20191218082604.3309606-1-iwamatsu@nigauri.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>

The driver used i2c_transfer methods to read and set date/time. The smbus
methods should be used.
This commit replaces i2c_transfer functions by i2c_smbus_read/write_xxx
for reading and setting the datetime.

CC: Alessandro Zummo <a.zummo@towertech.it>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
---
 drivers/rtc/rtc-pcf8563.c | 144 ++++++++++++++------------------------
 1 file changed, 52 insertions(+), 92 deletions(-)

diff --git a/drivers/rtc/rtc-pcf8563.c b/drivers/rtc/rtc-pcf8563.c
index 65e2bb5644768..77e22a386b5be 100644
--- a/drivers/rtc/rtc-pcf8563.c
+++ b/drivers/rtc/rtc-pcf8563.c
@@ -21,6 +21,9 @@
 #include <linux/err.h>
 
 #define PCF8563_REG_ST1		0x00 /* status */
+#define PCF8563_TEST		BIT(7)
+#define PCF8563_STOP		BIT(5)
+#define PCF8563_TESTC		BIT(3)
 #define PCF8563_REG_ST2		0x01
 #define PCF8563_BIT_AIE		BIT(1)
 #define PCF8563_BIT_AF		BIT(3)
@@ -84,69 +87,21 @@ struct pcf8563 {
 #endif
 };
 
-static int pcf8563_read_block_data(struct i2c_client *client, unsigned char reg,
-				   unsigned char length, unsigned char *buf)
-{
-	struct i2c_msg msgs[] = {
-		{/* setup read ptr */
-			.addr = client->addr,
-			.len = 1,
-			.buf = &reg,
-		},
-		{
-			.addr = client->addr,
-			.flags = I2C_M_RD,
-			.len = length,
-			.buf = buf
-		},
-	};
-
-	if ((i2c_transfer(client->adapter, msgs, 2)) != 2) {
-		dev_err(&client->dev, "%s: read error\n", __func__);
-		return -EIO;
-	}
-
-	return 0;
-}
-
-static int pcf8563_write_block_data(struct i2c_client *client,
-				   unsigned char reg, unsigned char length,
-				   unsigned char *buf)
-{
-	int i, err;
-
-	for (i = 0; i < length; i++) {
-		unsigned char data[2] = { reg + i, buf[i] };
-
-		err = i2c_master_send(client, data, sizeof(data));
-		if (err != sizeof(data)) {
-			dev_err(&client->dev,
-				"%s: err=%d addr=%02x, data=%02x\n",
-				__func__, err, data[0], data[1]);
-			return -EIO;
-		}
-	}
-
-	return 0;
-}
-
 static int pcf8563_set_alarm_mode(struct i2c_client *client, bool on)
 {
-	unsigned char buf;
 	int err;
 
-	err = pcf8563_read_block_data(client, PCF8563_REG_ST2, 1, &buf);
+	err = i2c_smbus_read_byte_data(client, PCF8563_REG_ST2);
 	if (err < 0)
 		return err;
 
 	if (on)
-		buf |= PCF8563_BIT_AIE;
+		err |= PCF8563_BIT_AIE;
 	else
-		buf &= ~PCF8563_BIT_AIE;
-
-	buf &= ~(PCF8563_BIT_AF | PCF8563_BITS_ST2_N);
+		err &= ~PCF8563_BIT_AIE;
 
-	err = pcf8563_write_block_data(client, PCF8563_REG_ST2, 1, &buf);
+	err &= ~(PCF8563_BIT_AF | PCF8563_BITS_ST2_N);
+	err = i2c_smbus_write_byte_data(client, PCF8563_REG_ST2, err);
 	if (err < 0) {
 		dev_err(&client->dev, "%s: write error\n", __func__);
 		return -EIO;
@@ -158,17 +113,16 @@ static int pcf8563_set_alarm_mode(struct i2c_client *client, bool on)
 static int pcf8563_get_alarm_mode(struct i2c_client *client, unsigned char *en,
 				  unsigned char *pen)
 {
-	unsigned char buf;
 	int err;
 
-	err = pcf8563_read_block_data(client, PCF8563_REG_ST2, 1, &buf);
-	if (err)
+	err = i2c_smbus_read_byte_data(client, PCF8563_REG_ST2);
+	if (err < 0)
 		return err;
 
 	if (en)
-		*en = !!(buf & PCF8563_BIT_AIE);
+		*en = !!(err & PCF8563_BIT_AIE);
 	if (pen)
-		*pen = !!(buf & PCF8563_BIT_AF);
+		*pen = !!(err & PCF8563_BIT_AF);
 
 	return 0;
 }
@@ -203,8 +157,8 @@ static int pcf8563_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	unsigned char buf[9];
 	int err;
 
-	err = pcf8563_read_block_data(client, PCF8563_REG_ST1, 9, buf);
-	if (err)
+	err = i2c_smbus_read_i2c_block_data(client, PCF8563_REG_ST1, 9, buf);
+	if (err < 0)
 		return err;
 
 	if (buf[PCF8563_REG_SC] & PCF8563_SC_LV) {
@@ -245,6 +199,7 @@ static int pcf8563_rtc_read_time(struct device *dev, struct rtc_time *tm)
 
 static int pcf8563_rtc_set_time(struct device *dev, struct rtc_time *tm)
 {
+	int ret;
 	struct i2c_client *client = to_i2c_client(dev);
 	struct pcf8563 *pcf8563 = i2c_get_clientdata(client);
 	unsigned char buf[9];
@@ -272,8 +227,20 @@ static int pcf8563_rtc_set_time(struct device *dev, struct rtc_time *tm)
 
 	buf[PCF8563_REG_DW] = tm->tm_wday & 0x07;
 
-	return pcf8563_write_block_data(client, PCF8563_REG_SC,
-				9 - PCF8563_REG_SC, buf + PCF8563_REG_SC);
+	ret = i2c_smbus_write_byte_data(client, PCF8563_REG_ST1,
+						PCF8563_STOP);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_write_i2c_block_data(client, PCF8563_REG_SC, 7, buf + 2);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_write_byte_data(client, PCF8563_REG_ST1, 0);
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 
 #ifdef CONFIG_RTC_INTF_DEV
@@ -320,8 +287,8 @@ static int pcf8563_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *tm)
 	unsigned char buf[4];
 	int err;
 
-	err = pcf8563_read_block_data(client, PCF8563_REG_AMN, 4, buf);
-	if (err)
+	err = i2c_smbus_read_i2c_block_data(client, PCF8563_REG_AMN, 4, buf);
+	if (err < 0)
 		return err;
 
 	dev_dbg(&client->dev,
@@ -369,8 +336,7 @@ static int pcf8563_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *tm)
 	buf[1] = bin2bcd(tm->time.tm_hour);
 	buf[2] = bin2bcd(tm->time.tm_mday);
 	buf[3] = tm->time.tm_wday & 0x07;
-
-	err = pcf8563_write_block_data(client, PCF8563_REG_AMN, 4, buf);
+	err = i2c_smbus_write_i2c_block_data(client, PCF8563_REG_AMN, 4, buf);
 	if (err)
 		return err;
 
@@ -402,14 +368,13 @@ static unsigned long pcf8563_clkout_recalc_rate(struct clk_hw *hw,
 {
 	struct pcf8563 *pcf8563 = clkout_hw_to_pcf8563(hw);
 	struct i2c_client *client = pcf8563->client;
-	unsigned char buf;
-	int ret = pcf8563_read_block_data(client, PCF8563_REG_CLKO, 1, &buf);
+	int ret = i2c_smbus_read_byte_data(client, PCF8563_REG_CLKO);
 
 	if (ret < 0)
 		return 0;
 
-	buf &= PCF8563_REG_CLKO_F_MASK;
-	return clkout_rates[buf];
+	ret &= PCF8563_REG_CLKO_F_MASK;
+	return clkout_rates[ret];
 }
 
 static long pcf8563_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
@@ -420,7 +385,6 @@ static long pcf8563_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
 	for (i = 0; i < ARRAY_SIZE(clkout_rates); i++)
 		if (clkout_rates[i] <= rate)
 			return clkout_rates[i];
-
 	return 0;
 }
 
@@ -429,20 +393,18 @@ static int pcf8563_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
 {
 	struct pcf8563 *pcf8563 = clkout_hw_to_pcf8563(hw);
 	struct i2c_client *client = pcf8563->client;
-	unsigned char buf;
-	int ret = pcf8563_read_block_data(client, PCF8563_REG_CLKO, 1, &buf);
 	int i;
+	int ret = i2c_smbus_read_byte_data(client, PCF8563_REG_CLKO);
 
 	if (ret < 0)
 		return ret;
 
 	for (i = 0; i < ARRAY_SIZE(clkout_rates); i++)
 		if (clkout_rates[i] == rate) {
-			buf &= ~PCF8563_REG_CLKO_F_MASK;
-			buf |= i;
-			ret = pcf8563_write_block_data(client,
-						       PCF8563_REG_CLKO, 1,
-						       &buf);
+			ret &= ~PCF8563_REG_CLKO_F_MASK;
+			ret |= i;
+			ret =  i2c_smbus_write_byte_data(client,
+						PCF8563_REG_CLKO, ret);
 			return ret;
 		}
 
@@ -453,19 +415,20 @@ static int pcf8563_clkout_control(struct clk_hw *hw, bool enable)
 {
 	struct pcf8563 *pcf8563 = clkout_hw_to_pcf8563(hw);
 	struct i2c_client *client = pcf8563->client;
-	unsigned char buf;
-	int ret = pcf8563_read_block_data(client, PCF8563_REG_CLKO, 1, &buf);
+	int ret = i2c_smbus_read_byte_data(client, PCF8563_REG_CLKO);
 
 	if (ret < 0)
 		return ret;
 
 	if (enable)
-		buf |= PCF8563_REG_CLKO_FE;
+		ret |= PCF8563_REG_CLKO_FE;
 	else
-		buf &= ~PCF8563_REG_CLKO_FE;
+		ret &= ~PCF8563_REG_CLKO_FE;
+	ret =  i2c_smbus_write_byte_data(client, PCF8563_REG_CLKO, ret);
+	if (ret < 0)
+		return ret;
 
-	ret = pcf8563_write_block_data(client, PCF8563_REG_CLKO, 1, &buf);
-	return ret;
+	return 0;
 }
 
 static int pcf8563_clkout_prepare(struct clk_hw *hw)
@@ -482,13 +445,12 @@ static int pcf8563_clkout_is_prepared(struct clk_hw *hw)
 {
 	struct pcf8563 *pcf8563 = clkout_hw_to_pcf8563(hw);
 	struct i2c_client *client = pcf8563->client;
-	unsigned char buf;
-	int ret = pcf8563_read_block_data(client, PCF8563_REG_CLKO, 1, &buf);
+	int ret = i2c_smbus_read_byte_data(client, PCF8563_REG_CLKO);
 
 	if (ret < 0)
 		return ret;
 
-	return !!(buf & PCF8563_REG_CLKO_FE);
+	return !!(ret & PCF8563_REG_CLKO_FE);
 }
 
 static const struct clk_ops pcf8563_clkout_ops = {
@@ -507,11 +469,9 @@ static struct clk *pcf8563_clkout_register_clk(struct pcf8563 *pcf8563)
 	struct clk *clk;
 	struct clk_init_data init;
 	int ret;
-	unsigned char buf;
 
 	/* disable the clkout output */
-	buf = 0;
-	ret = pcf8563_write_block_data(client, PCF8563_REG_CLKO, 1, &buf);
+	ret =  i2c_smbus_write_byte_data(client, PCF8563_REG_CLKO, 0);
 	if (ret < 0)
 		return ERR_PTR(ret);
 
@@ -567,7 +527,7 @@ static int pcf8563_probe(struct i2c_client *client,
 
 	/* Set timer to lowest frequency to save power (ref Haoyu datasheet) */
 	buf = PCF8563_TMRC_1_60;
-	err = pcf8563_write_block_data(client, PCF8563_REG_TMRC, 1, &buf);
+	err = i2c_smbus_write_byte_data(client, PCF8563_REG_TMRC, buf);
 	if (err < 0) {
 		dev_err(&client->dev, "%s: write error\n", __func__);
 		return err;
@@ -575,7 +535,7 @@ static int pcf8563_probe(struct i2c_client *client,
 
 	/* Clear flags and disable interrupts */
 	buf = 0;
-	err = pcf8563_write_block_data(client, PCF8563_REG_ST2, 1, &buf);
+	err = i2c_smbus_write_byte_data(client, PCF8563_REG_ST2, buf);
 	if (err < 0) {
 		dev_err(&client->dev, "%s: write error\n", __func__);
 		return err;
-- 
2.24.0

