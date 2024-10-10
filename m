Return-Path: <linux-rtc+bounces-2141-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48219998102
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2024 10:56:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47C7C1C2A645
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2024 08:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7939D1CB520;
	Thu, 10 Oct 2024 08:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nigauri-org.20230601.gappssmtp.com header.i=@nigauri-org.20230601.gappssmtp.com header.b="OiS/7bZQ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8013C1CB516
	for <linux-rtc@vger.kernel.org>; Thu, 10 Oct 2024 08:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728550205; cv=none; b=lmKE3l6OJbNmpDwdcwOhUwnthWWcFQONaQIz8ffLK8VwkTjriWE8cRZC861a1OswxAohECPpBb2FwREuA0MOnWGMukz1BZW/PpMPRFDE1w2oQ2ze6/mIIblf5PvU5X3o9Y6Dtev8RvPG8alIjU1aExdHKNjqhNyaHlF5sKQX8F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728550205; c=relaxed/simple;
	bh=DUPx7+6PyBbpHV1F9gXZQQ3JX90R9/TBX/a5+0Fe91g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c+mfE5Dh2Hz82zFOooulseFDA7TrdtMACuVgXauGOyCVrUJa+SFXK5aXpd0siTDlAEj9bva0sgxAJIUiZ6oAhiaJFg1pnt5glxLohWaoreal8CbsMKDP1aedF6RDilaZxm8fWc5EV8gV+d38+StdI1LqUjLhv2AkNxWCNfASng8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org; spf=none smtp.mailfrom=nigauri.org; dkim=pass (2048-bit key) header.d=nigauri-org.20230601.gappssmtp.com header.i=@nigauri-org.20230601.gappssmtp.com header.b=OiS/7bZQ; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nigauri.org
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2e18856feb4so671896a91.3
        for <linux-rtc@vger.kernel.org>; Thu, 10 Oct 2024 01:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20230601.gappssmtp.com; s=20230601; t=1728550203; x=1729155003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6rI7kXSkKdbmWWOMICXxBlMd8CC6HZSiwxpsKC34uXQ=;
        b=OiS/7bZQCnLnpHDkQo8bdOVwP3TyidIOSbJwSt+E6MEojZqIbmwCIlzAwlRiPEgvyI
         BfRvWsnG9MKSwJVH79floUXRFzQonRhXF0XZ50LnKAAO5iAojV8DOB0Sg8w/qawJC4ut
         ej2dh9nr18F1KyVcLTRoiFuhZQkhIcJasMmwin/fpLf4540ZJ5LRHVj/bRhGPpmT83D/
         R9vTNiT4MTAjAbYtrZ0Miv+BR4fmm/W8fVtng+pl3qTDwsg7B3BTQvE/XK4bYrSHuzrX
         30Nohs95aJMDTe4Bm1ptSLL9Pu1It/Necyz3RZnwUr1YQM3/4t69OrWBZBrQ2TIVyNNc
         bF+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728550203; x=1729155003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6rI7kXSkKdbmWWOMICXxBlMd8CC6HZSiwxpsKC34uXQ=;
        b=xEPeH18Ityc0LV1su2jKb1FVTHK2L7NmUbIA1tlWX9Vy3+T0l78Od/R8H8PGkhoAQG
         2UKnlR8jpabZwb0CQj7lH0h7ovscMY7A/CmCqK/Ift8PMS5ltRoMXFrP0PzqPKVWx9tm
         Z2dwTQKcSL11SXMmIAVaknfYLk6hk2zUzsIeTnH0RTMREJ+ue2/tJEveeg3hEFhOVFEA
         M9IAfwm46GJUQ8L4QU1bPZOkeLKbJYbFwaFE1cyof9llFoT50RTENF7Zf+QNqZeu8X2G
         aTZN7OrdmCAKPtsoK4Tx5iENMg4qjPB73s1E5w+2W6xxi9A+bD1QxH6EoFDVb0auF+vP
         ReWw==
X-Forwarded-Encrypted: i=1; AJvYcCV0SOY56yjCTAyHal8/+Q+C4uWspxUhH5MwvBhdGycGVi/zBAGBfpKhb21qrj3fZsBIyJAtTfh/D4U=@vger.kernel.org
X-Gm-Message-State: AOJu0YysKmNktN4lNwPE4WlZ9ixqG/hGvUNN6qsTlCjsAceNoTdkBq1x
	6cLWZTtaCtu3AFyyWiZj58p5oQsqaamuub6w02mSXqgMBVQvuWKfqwleJwEGKuYs+1NGHaHzoQ=
	=
X-Google-Smtp-Source: AGHT+IGAPcc620EhjS3AniDGQlHwii8T/lhe1slawVI9rv/BpEyiQlbfNe1ebhwYwWmWwEaJC3ilHw==
X-Received: by 2002:a17:90a:740c:b0:2e2:d82b:d144 with SMTP id 98e67ed59e1d1-2e2d82bd29amr1439802a91.37.1728550202705;
        Thu, 10 Oct 2024 01:50:02 -0700 (PDT)
Received: from localhost ([2405:6581:5360:1800:beed:8ae1:b5d8:8b56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2d5fc4764sm763257a91.47.2024.10.10.01.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 01:50:02 -0700 (PDT)
From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
To: alexandre.belloni@bootlin.com,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: [PATCH 2/2] rtc: pcf8563: Switch to regmap
Date: Thu, 10 Oct 2024 17:49:49 +0900
Message-ID: <20241010084949.3351182-3-iwamatsu@nigauri.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241010084949.3351182-1-iwamatsu@nigauri.org>
References: <20241010084949.3351182-1-iwamatsu@nigauri.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch the i2c_transfer methods to regmap APIs.

Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
---
 drivers/rtc/Kconfig       |   1 +
 drivers/rtc/rtc-pcf8563.c | 204 +++++++++++++++-----------------------
 2 files changed, 82 insertions(+), 123 deletions(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 66eb1122248b65..6bcd5e447b74cf 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -496,6 +496,7 @@ config RTC_DRV_PCF85363
 
 config RTC_DRV_PCF8563
 	tristate "Philips PCF8563/Epson RTC8564"
+	select REGMAP_I2C
 	help
 	  If you say yes here you get support for the
 	  Philips PCF8563 RTC chip. The Epson RTC8564
diff --git a/drivers/rtc/rtc-pcf8563.c b/drivers/rtc/rtc-pcf8563.c
index 4c375e8694da4e..5a084d426e58d0 100644
--- a/drivers/rtc/rtc-pcf8563.c
+++ b/drivers/rtc/rtc-pcf8563.c
@@ -17,6 +17,7 @@
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/regmap.h>
 #include <linux/rtc.h>
 #include <linux/slab.h>
 
@@ -77,64 +78,18 @@ struct pcf8563 {
 	 */
 	int c_polarity;	/* 0: MO_C=1 means 19xx, otherwise MO_C=1 means 20xx */
 
-	struct i2c_client *client;
+	struct regmap *regmap;
 #ifdef CONFIG_COMMON_CLK
 	struct clk_hw		clkout_hw;
 #endif
 };
 
-static int pcf8563_read_block_data(struct i2c_client *client, unsigned char reg,
-				   unsigned char length, unsigned char *buf)
+static int pcf8563_set_alarm_mode(struct pcf8563 *pcf8563, bool on)
 {
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
-static int pcf8563_set_alarm_mode(struct i2c_client *client, bool on)
-{
-	unsigned char buf;
+	u32 buf;
 	int err;
 
-	err = pcf8563_read_block_data(client, PCF8563_REG_ST2, 1, &buf);
+	err = regmap_read(pcf8563->regmap, PCF8563_REG_ST2, &buf);
 	if (err < 0)
 		return err;
 
@@ -145,23 +100,17 @@ static int pcf8563_set_alarm_mode(struct i2c_client *client, bool on)
 
 	buf &= ~(PCF8563_BIT_AF | PCF8563_BITS_ST2_N);
 
-	err = pcf8563_write_block_data(client, PCF8563_REG_ST2, 1, &buf);
-	if (err < 0) {
-		dev_err(&client->dev, "%s: write error\n", __func__);
-		return -EIO;
-	}
-
-	return 0;
+	return regmap_write(pcf8563->regmap, PCF8563_REG_ST2, buf);
 }
 
-static int pcf8563_get_alarm_mode(struct i2c_client *client, unsigned char *en,
+static int pcf8563_get_alarm_mode(struct pcf8563 *pcf8563, unsigned char *en,
 				  unsigned char *pen)
 {
-	unsigned char buf;
+	u32 buf;
 	int err;
 
-	err = pcf8563_read_block_data(client, PCF8563_REG_ST2, 1, &buf);
-	if (err)
+	err = regmap_read(pcf8563->regmap, PCF8563_REG_ST2, &buf);
+	if (err < 0)
 		return err;
 
 	if (en)
@@ -174,17 +123,17 @@ static int pcf8563_get_alarm_mode(struct i2c_client *client, unsigned char *en,
 
 static irqreturn_t pcf8563_irq(int irq, void *dev_id)
 {
-	struct pcf8563 *pcf8563 = i2c_get_clientdata(dev_id);
-	int err;
+	struct pcf8563 *pcf8563 = dev_id;
 	char pending;
+	int err;
 
-	err = pcf8563_get_alarm_mode(pcf8563->client, NULL, &pending);
+	err = pcf8563_get_alarm_mode(pcf8563, NULL, &pending);
 	if (err)
 		return IRQ_NONE;
 
 	if (pending) {
 		rtc_update_irq(pcf8563->rtc, 1, RTC_IRQF | RTC_AF);
-		pcf8563_set_alarm_mode(pcf8563->client, 1);
+		pcf8563_set_alarm_mode(pcf8563, 1);
 		return IRQ_HANDLED;
 	}
 
@@ -197,22 +146,22 @@ static irqreturn_t pcf8563_irq(int irq, void *dev_id)
  */
 static int pcf8563_rtc_read_time(struct device *dev, struct rtc_time *tm)
 {
-	struct i2c_client *client = to_i2c_client(dev);
-	struct pcf8563 *pcf8563 = i2c_get_clientdata(client);
+	struct pcf8563 *pcf8563 = dev_get_drvdata(dev);
 	unsigned char buf[9];
 	int err;
 
-	err = pcf8563_read_block_data(client, PCF8563_REG_ST1, 9, buf);
-	if (err)
+	err = regmap_bulk_read(pcf8563->regmap, PCF8563_REG_ST1, buf,
+			       sizeof(buf));
+	if (err < 0)
 		return err;
 
 	if (buf[PCF8563_REG_SC] & PCF8563_SC_LV) {
-		dev_err(&client->dev,
+		dev_err(dev,
 			"low voltage detected, date/time is not reliable.\n");
 		return -EINVAL;
 	}
 
-	dev_dbg(&client->dev,
+	dev_dbg(dev,
 		"%s: raw data is st1=%02x, st2=%02x, sec=%02x, min=%02x, hr=%02x, "
 		"mday=%02x, wday=%02x, mon=%02x, year=%02x\n",
 		__func__,
@@ -220,7 +169,6 @@ static int pcf8563_rtc_read_time(struct device *dev, struct rtc_time *tm)
 		buf[4], buf[5], buf[6], buf[7],
 		buf[8]);
 
-
 	tm->tm_sec = bcd2bin(buf[PCF8563_REG_SC] & 0x7F);
 	tm->tm_min = bcd2bin(buf[PCF8563_REG_MN] & 0x7F);
 	tm->tm_hour = bcd2bin(buf[PCF8563_REG_HR] & 0x3F); /* rtc hr 0-23 */
@@ -232,7 +180,7 @@ static int pcf8563_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	pcf8563->c_polarity = (buf[PCF8563_REG_MO] & PCF8563_MO_C) ?
 		(tm->tm_year >= 100) : (tm->tm_year < 100);
 
-	dev_dbg(&client->dev, "%s: tm is secs=%d, mins=%d, hours=%d, "
+	dev_dbg(dev, "%s: tm is secs=%d, mins=%d, hours=%d, "
 		"mday=%d, mon=%d, year=%d, wday=%d\n",
 		__func__,
 		tm->tm_sec, tm->tm_min, tm->tm_hour,
@@ -243,11 +191,10 @@ static int pcf8563_rtc_read_time(struct device *dev, struct rtc_time *tm)
 
 static int pcf8563_rtc_set_time(struct device *dev, struct rtc_time *tm)
 {
-	struct i2c_client *client = to_i2c_client(dev);
-	struct pcf8563 *pcf8563 = i2c_get_clientdata(client);
+	struct pcf8563 *pcf8563 = dev_get_drvdata(dev);
 	unsigned char buf[9];
 
-	dev_dbg(&client->dev, "%s: secs=%d, mins=%d, hours=%d, "
+	dev_dbg(dev, "%s: secs=%d, mins=%d, hours=%d, "
 		"mday=%d, mon=%d, year=%d, wday=%d\n",
 		__func__,
 		tm->tm_sec, tm->tm_min, tm->tm_hour,
@@ -270,22 +217,24 @@ static int pcf8563_rtc_set_time(struct device *dev, struct rtc_time *tm)
 
 	buf[PCF8563_REG_DW] = tm->tm_wday & 0x07;
 
-	return pcf8563_write_block_data(client, PCF8563_REG_SC,
-				9 - PCF8563_REG_SC, buf + PCF8563_REG_SC);
+	return regmap_bulk_write(pcf8563->regmap, PCF8563_REG_SC,
+				buf + PCF8563_REG_SC,
+				sizeof(buf) - PCF8563_REG_SC);
 }
 
 static int pcf8563_rtc_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
 {
-	struct i2c_client *client = to_i2c_client(dev);
+	struct pcf8563 *pcf8563 = dev_get_drvdata(dev);
 	int ret;
 
 	switch (cmd) {
 	case RTC_VL_READ:
-		ret = i2c_smbus_read_byte_data(client, PCF8563_REG_SC);
+		ret = regmap_test_bits(pcf8563->regmap, PCF8563_REG_SC,
+				       PCF8563_SC_LV);
 		if (ret < 0)
 			return ret;
 
-		return put_user(ret & PCF8563_SC_LV ? RTC_VL_DATA_INVALID : 0,
+		return put_user(ret ? RTC_VL_DATA_INVALID : 0,
 				(unsigned int __user *)arg);
 	default:
 		return -ENOIOCTLCMD;
@@ -294,15 +243,16 @@ static int pcf8563_rtc_ioctl(struct device *dev, unsigned int cmd, unsigned long
 
 static int pcf8563_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *tm)
 {
-	struct i2c_client *client = to_i2c_client(dev);
+	struct pcf8563 *pcf8563 = dev_get_drvdata(dev);
 	unsigned char buf[4];
 	int err;
 
-	err = pcf8563_read_block_data(client, PCF8563_REG_AMN, 4, buf);
-	if (err)
+	err = regmap_bulk_read(pcf8563->regmap, PCF8563_REG_AMN, buf,
+			       sizeof(buf));
+	if (err < 0)
 		return err;
 
-	dev_dbg(&client->dev,
+	dev_dbg(dev,
 		"%s: raw data is min=%02x, hr=%02x, mday=%02x, wday=%02x\n",
 		__func__, buf[0], buf[1], buf[2], buf[3]);
 
@@ -312,11 +262,11 @@ static int pcf8563_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *tm)
 	tm->time.tm_mday = bcd2bin(buf[2] & 0x3F);
 	tm->time.tm_wday = bcd2bin(buf[3] & 0x7);
 
-	err = pcf8563_get_alarm_mode(client, &tm->enabled, &tm->pending);
+	err = pcf8563_get_alarm_mode(pcf8563, &tm->enabled, &tm->pending);
 	if (err < 0)
 		return err;
 
-	dev_dbg(&client->dev, "%s: tm is mins=%d, hours=%d, mday=%d, wday=%d,"
+	dev_dbg(dev, "%s: tm is mins=%d, hours=%d, mday=%d, wday=%d,"
 		" enabled=%d, pending=%d\n", __func__, tm->time.tm_min,
 		tm->time.tm_hour, tm->time.tm_mday, tm->time.tm_wday,
 		tm->enabled, tm->pending);
@@ -326,7 +276,7 @@ static int pcf8563_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *tm)
 
 static int pcf8563_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *tm)
 {
-	struct i2c_client *client = to_i2c_client(dev);
+	struct pcf8563 *pcf8563 = dev_get_drvdata(dev);
 	unsigned char buf[4];
 	int err;
 
@@ -335,17 +285,20 @@ static int pcf8563_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *tm)
 	buf[2] = bin2bcd(tm->time.tm_mday);
 	buf[3] = tm->time.tm_wday & 0x07;
 
-	err = pcf8563_write_block_data(client, PCF8563_REG_AMN, 4, buf);
+	err = regmap_bulk_write(pcf8563->regmap, PCF8563_REG_SC, buf,
+				sizeof(buf));
 	if (err)
 		return err;
 
-	return pcf8563_set_alarm_mode(client, !!tm->enabled);
+	return pcf8563_set_alarm_mode(pcf8563, !!tm->enabled);
 }
 
 static int pcf8563_irq_enable(struct device *dev, unsigned int enabled)
 {
+	struct pcf8563 *pcf8563 = dev_get_drvdata(dev);
+
 	dev_dbg(dev, "%s: en=%d\n", __func__, enabled);
-	return pcf8563_set_alarm_mode(to_i2c_client(dev), !!enabled);
+	return pcf8563_set_alarm_mode(pcf8563, !!enabled);
 }
 
 #ifdef CONFIG_COMMON_CLK
@@ -366,10 +319,10 @@ static unsigned long pcf8563_clkout_recalc_rate(struct clk_hw *hw,
 						unsigned long parent_rate)
 {
 	struct pcf8563 *pcf8563 = clkout_hw_to_pcf8563(hw);
-	struct i2c_client *client = pcf8563->client;
-	unsigned char buf;
-	int ret = pcf8563_read_block_data(client, PCF8563_REG_CLKO, 1, &buf);
+	u32 buf;
+	int ret;
 
+	ret = regmap_read(pcf8563->regmap, PCF8563_REG_CLKO, &buf);
 	if (ret < 0)
 		return 0;
 
@@ -393,11 +346,10 @@ static int pcf8563_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
 				   unsigned long parent_rate)
 {
 	struct pcf8563 *pcf8563 = clkout_hw_to_pcf8563(hw);
-	struct i2c_client *client = pcf8563->client;
-	unsigned char buf;
-	int ret = pcf8563_read_block_data(client, PCF8563_REG_CLKO, 1, &buf);
-	int i;
+	int i, ret;
+	u32 buf;
 
+	ret = regmap_read(pcf8563->regmap, PCF8563_REG_CLKO, &buf);
 	if (ret < 0)
 		return ret;
 
@@ -405,10 +357,10 @@ static int pcf8563_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
 		if (clkout_rates[i] == rate) {
 			buf &= ~PCF8563_REG_CLKO_F_MASK;
 			buf |= i;
-			ret = pcf8563_write_block_data(client,
-						       PCF8563_REG_CLKO, 1,
-						       &buf);
-			return ret;
+			return regmap_update_bits(pcf8563->regmap,
+					    PCF8563_REG_CLKO,
+					    PCF8563_REG_CLKO_F_MASK,
+					    buf);
 		}
 
 	return -EINVAL;
@@ -417,10 +369,10 @@ static int pcf8563_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
 static int pcf8563_clkout_control(struct clk_hw *hw, bool enable)
 {
 	struct pcf8563 *pcf8563 = clkout_hw_to_pcf8563(hw);
-	struct i2c_client *client = pcf8563->client;
-	unsigned char buf;
-	int ret = pcf8563_read_block_data(client, PCF8563_REG_CLKO, 1, &buf);
+	u32 buf;
+	int ret;
 
+	ret = regmap_read(pcf8563->regmap, PCF8563_REG_CLKO, &buf);
 	if (ret < 0)
 		return ret;
 
@@ -429,8 +381,8 @@ static int pcf8563_clkout_control(struct clk_hw *hw, bool enable)
 	else
 		buf &= ~PCF8563_REG_CLKO_FE;
 
-	ret = pcf8563_write_block_data(client, PCF8563_REG_CLKO, 1, &buf);
-	return ret;
+	return regmap_update_bits(pcf8563->regmap, PCF8563_REG_CLKO,
+				  PCF8563_REG_CLKO_FE, buf);
 }
 
 static int pcf8563_clkout_prepare(struct clk_hw *hw)
@@ -446,10 +398,10 @@ static void pcf8563_clkout_unprepare(struct clk_hw *hw)
 static int pcf8563_clkout_is_prepared(struct clk_hw *hw)
 {
 	struct pcf8563 *pcf8563 = clkout_hw_to_pcf8563(hw);
-	struct i2c_client *client = pcf8563->client;
-	unsigned char buf;
-	int ret = pcf8563_read_block_data(client, PCF8563_REG_CLKO, 1, &buf);
+	u32 buf;
+	int ret;
 
+	ret = regmap_read(pcf8563->regmap, PCF8563_REG_CLKO, &buf);
 	if (ret < 0)
 		return ret;
 
@@ -467,16 +419,14 @@ static const struct clk_ops pcf8563_clkout_ops = {
 
 static struct clk *pcf8563_clkout_register_clk(struct pcf8563 *pcf8563)
 {
-	struct i2c_client *client = pcf8563->client;
-	struct device_node *node = client->dev.of_node;
-	struct clk *clk;
+	struct device_node *node = pcf8563->rtc->dev.of_node;
 	struct clk_init_data init;
+	struct clk *clk;
 	int ret;
-	unsigned char buf;
 
 	/* disable the clkout output */
-	buf = 0;
-	ret = pcf8563_write_block_data(client, PCF8563_REG_CLKO, 1, &buf);
+	ret = regmap_clear_bits(pcf8563->regmap, PCF8563_REG_CLKO,
+				PCF8563_REG_CLKO_FE);
 	if (ret < 0)
 		return ERR_PTR(ret);
 
@@ -491,7 +441,7 @@ static struct clk *pcf8563_clkout_register_clk(struct pcf8563 *pcf8563)
 	of_property_read_string(node, "clock-output-names", &init.name);
 
 	/* register the clock */
-	clk = devm_clk_register(&client->dev, &pcf8563->clkout_hw);
+	clk = devm_clk_register(&pcf8563->rtc->dev, &pcf8563->clkout_hw);
 
 	if (!IS_ERR(clk))
 		of_clk_add_provider(node, of_clk_src_simple_get, clk);
@@ -509,11 +459,16 @@ static const struct rtc_class_ops pcf8563_rtc_ops = {
 	.alarm_irq_enable = pcf8563_irq_enable,
 };
 
+static const struct regmap_config regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = 0xF,
+};
+
 static int pcf8563_probe(struct i2c_client *client)
 {
 	struct pcf8563 *pcf8563;
 	int err;
-	unsigned char buf;
 
 	dev_dbg(&client->dev, "%s\n", __func__);
 
@@ -525,20 +480,23 @@ static int pcf8563_probe(struct i2c_client *client)
 	if (!pcf8563)
 		return -ENOMEM;
 
+	pcf8563->regmap = devm_regmap_init_i2c(client, &regmap_config);
+	if (IS_ERR(pcf8563->regmap))
+		return PTR_ERR(pcf8563->regmap);
+
 	i2c_set_clientdata(client, pcf8563);
-	pcf8563->client = client;
+	device_set_wakeup_capable(&client->dev, 1);
 
 	/* Set timer to lowest frequency to save power (ref Haoyu datasheet) */
-	buf = PCF8563_TMRC_1_60;
-	err = pcf8563_write_block_data(client, PCF8563_REG_TMRC, 1, &buf);
+	err = regmap_set_bits(pcf8563->regmap, PCF8563_REG_TMRC,
+			      PCF8563_TMRC_1_60);
 	if (err < 0) {
 		dev_err(&client->dev, "%s: write error\n", __func__);
 		return err;
 	}
 
 	/* Clear flags and disable interrupts */
-	buf = 0;
-	err = pcf8563_write_block_data(client, PCF8563_REG_ST2, 1, &buf);
+	err = regmap_write(pcf8563->regmap, PCF8563_REG_ST2, 0);
 	if (err < 0) {
 		dev_err(&client->dev, "%s: write error\n", __func__);
 		return err;
-- 
2.45.2


