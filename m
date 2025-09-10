Return-Path: <linux-rtc+bounces-4855-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EEBB51862
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Sep 2025 15:53:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BE6A461FEB
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Sep 2025 13:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0718A21CC43;
	Wed, 10 Sep 2025 13:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b="L0cQNfmY"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp1.iitb.ac.in (smtpd9.iitb.ac.in [103.21.126.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7995E265CA6
	for <linux-rtc@vger.kernel.org>; Wed, 10 Sep 2025 13:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.21.126.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757512423; cv=none; b=Zw66brP51SF2ckUtvhChtrCP/guOvHFYfGhKTTSvptJrchE0KC2fy18w8ZC4dbA0MQSbfzHqrkdkwjD7eM/N9gf9zMPS6IUTEQGyLRRbYnwTbSLF5j56DvqYMgCnwT9r7C3pBGYmawxXSam/ASPljfu5HpxWCsDeP3qptakQSzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757512423; c=relaxed/simple;
	bh=lBULx7uqbmscImIjfEPqSce/EEelZHFj7L5TbmJLI7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wf7Ak/If0E9gnF57iYJCv4BbFKpSXFXZna45G13DOL4mC3XBGJNNzOGILwng4WnodvwMK3sHaxogjjmp49uGTvWB47d1DS8YG4694zDg4MEO7PXDX8AHXHA4RZ88VbBdMUz8hJ0LEj0JTjyrMe3xvYP+gMGrPZXhXKpdLBiIoO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in; spf=pass smtp.mailfrom=ee.iitb.ac.in; dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b=L0cQNfmY; arc=none smtp.client-ip=103.21.126.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ee.iitb.ac.in
Received: from ldns1.iitb.ac.in (ldns1.iitb.ac.in [10.200.12.1])
	by smtp1.iitb.ac.in (Postfix) with SMTP id A88311014039
	for <linux-rtc@vger.kernel.org>; Wed, 10 Sep 2025 19:23:38 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.iitb.ac.in A88311014039
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iitb.ac.in; s=mail;
	t=1757512418; bh=lBULx7uqbmscImIjfEPqSce/EEelZHFj7L5TbmJLI7s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L0cQNfmY9iA3YATgfmpZjzA7C6p++d8cvXlDCTI2cvluNDCZo/lS4JqSFAJNZfQ08
	 AwSF8cW+H5rQP/X/Q4Qo0e3zjgajbWNxQuxzpeyAK88ynF5RMlESaVpwwVXn2+DrIE
	 O/kA4IXqTY+Wf7uSsMQ76JBGpwxziWNlhDPriAYo=
Received: (qmail 32383 invoked by uid 510); 10 Sep 2025 19:23:38 +0530
X-Qmail-Scanner-Diagnostics: from 10.200.1.25 by ldns1 (envelope-from <akhilesh@ee.iitb.ac.in>, uid 501) with qmail-scanner-2.11
 spamassassin: 3.4.1. mhr: 1.0. {clamdscan: 0.101.4/26439} 
 Clear:RC:1(10.200.1.25):SA:0(0.0/7.0):. Processed in 5.338097 secs; 10 Sep 2025 19:23:38 +0530
X-Spam-Level: 
X-Spam-Pyzor: Reported 0 times.
X-Envelope-From: akhilesh@ee.iitb.ac.in
X-Qmail-Scanner-Mime-Attachments: |
X-Qmail-Scanner-Zip-Files: |
Received: from unknown (HELO ldns1.iitb.ac.in) (10.200.1.25)
  by ldns1.iitb.ac.in with SMTP; 10 Sep 2025 19:23:33 +0530
Received: from bhairav.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	by ldns1.iitb.ac.in (Postfix) with ESMTP id C255B360036;
	Wed, 10 Sep 2025 19:23:32 +0530 (IST)
Received: from bhairav-test.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	(Authenticated sender: akhilesh)
	by bhairav.ee.iitb.ac.in (Postfix) with ESMTPSA id BC4991E813E1;
	Wed, 10 Sep 2025 19:23:31 +0530 (IST)
Date: Wed, 10 Sep 2025 19:23:26 +0530
From: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
To: alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	akhileshpatilvnit@gmail.com
Subject: [PATCH v2 3/6] rtc: m41t93: migrate to regmap api for register access
Message-ID: <4281169cdf92ecdb2d90f7778ef76e4d4aac408e.1757510157.git.akhilesh@ee.iitb.ac.in>
References: <cover.1757510157.git.akhilesh@ee.iitb.ac.in>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1757510157.git.akhilesh@ee.iitb.ac.in>

Adapt driver to use regmap api with spi bus instead of direct spi
subsystem calls to access device registers. Simplify and standardize the
register interactions using more abstract and bus agnostic regmap api
to reduce code duplication and improve maintainability. Define spi regmap
config suitable for m41t93 spi bus protocol to achieve same transactions on
spi bus.

Tested on TI am62x sk board with m41t93 rtc chip connected over spi0.
Validated set and get time using hwclock tool and verified spi bus
transfers using logic analyzer.

Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
---
 drivers/rtc/rtc-m41t93.c | 121 ++++++++++++++++++++++-----------------
 1 file changed, 70 insertions(+), 51 deletions(-)

diff --git a/drivers/rtc/rtc-m41t93.c b/drivers/rtc/rtc-m41t93.c
index 4e803ff0ce49..ad862bf706b6 100644
--- a/drivers/rtc/rtc-m41t93.c
+++ b/drivers/rtc/rtc-m41t93.c
@@ -12,6 +12,7 @@
 #include <linux/platform_device.h>
 #include <linux/rtc.h>
 #include <linux/spi/spi.h>
+#include <linux/regmap.h>
 
 #define M41T93_REG_SSEC			0
 #define M41T93_REG_ST_SEC		1
@@ -31,23 +32,17 @@
 #define M41T93_FLAG_BL			(1 << 4)
 #define M41T93_FLAG_HT			(1 << 6)
 
-static inline int m41t93_set_reg(struct spi_device *spi, u8 addr, u8 data)
-{
-	u8 buf[2];
-
-	/* MSB must be '1' to write */
-	buf[0] = addr | 0x80;
-	buf[1] = data;
-
-	return spi_write(spi, buf, sizeof(buf));
-}
+struct m41t93_data {
+	struct rtc_device *rtc;
+	struct regmap *regmap;
+};
 
 static int m41t93_set_time(struct device *dev, struct rtc_time *tm)
 {
-	struct spi_device *spi = to_spi_device(dev);
-	int tmp;
-	u8 buf[9] = {0x80};        /* write cmd + 8 data bytes */
-	u8 * const data = &buf[1]; /* ptr to first data byte */
+	struct m41t93_data *m41t93 = dev_get_drvdata(dev);
+	int tmp, ret;
+	u8 buf[8] = {0};        /* 8 data bytes */
+	u8 * const data = &buf[0]; /* ptr to first data byte */
 
 	dev_dbg(dev, "%s secs=%d, mins=%d, "
 		"hours=%d, mday=%d, mon=%d, year=%d, wday=%d\n",
@@ -56,31 +51,31 @@ static int m41t93_set_time(struct device *dev, struct rtc_time *tm)
 		tm->tm_mon, tm->tm_year, tm->tm_wday);
 
 	if (tm->tm_year < 100) {
-		dev_warn(&spi->dev, "unsupported date (before 2000-01-01).\n");
+		dev_warn(dev, "unsupported date (before 2000-01-01).\n");
 		return -EINVAL;
 	}
 
-	tmp = spi_w8r8(spi, M41T93_REG_FLAGS);
-	if (tmp < 0)
-		return tmp;
+	ret = regmap_read(m41t93->regmap, M41T93_REG_FLAGS, &tmp);
+	if (ret < 0)
+		return ret;
 
 	if (tmp & M41T93_FLAG_OF) {
-		dev_warn(&spi->dev, "OF bit is set, resetting.\n");
-		m41t93_set_reg(spi, M41T93_REG_FLAGS, tmp & ~M41T93_FLAG_OF);
+		dev_warn(dev, "OF bit is set, resetting.\n");
+		regmap_write(m41t93->regmap, M41T93_REG_FLAGS, tmp & ~M41T93_FLAG_OF);
 
-		tmp = spi_w8r8(spi, M41T93_REG_FLAGS);
-		if (tmp < 0) {
-			return tmp;
+		ret = regmap_read(m41t93->regmap, M41T93_REG_FLAGS, &tmp);
+		if (ret < 0) {
+			return ret;
 		} else if (tmp & M41T93_FLAG_OF) {
 			/* OF cannot be immediately reset: oscillator has to be
 			 * restarted. */
 			u8 reset_osc = buf[M41T93_REG_ST_SEC] | M41T93_FLAG_ST;
 
-			dev_warn(&spi->dev,
+			dev_warn(dev,
 				 "OF bit is still set, kickstarting clock.\n");
-			m41t93_set_reg(spi, M41T93_REG_ST_SEC, reset_osc);
+			regmap_write(m41t93->regmap, M41T93_REG_ST_SEC, reset_osc);
 			reset_osc &= ~M41T93_FLAG_ST;
-			m41t93_set_reg(spi, M41T93_REG_ST_SEC, reset_osc);
+			regmap_write(m41t93->regmap, M41T93_REG_ST_SEC, reset_osc);
 		}
 	}
 
@@ -94,14 +89,13 @@ static int m41t93_set_time(struct device *dev, struct rtc_time *tm)
 	data[M41T93_REG_MON]		= bin2bcd(tm->tm_mon + 1);
 	data[M41T93_REG_YEAR]		= bin2bcd(tm->tm_year % 100);
 
-	return spi_write(spi, buf, sizeof(buf));
+	return regmap_bulk_write(m41t93->regmap, M41T93_REG_SSEC, buf, sizeof(buf));
 }
 
 
 static int m41t93_get_time(struct device *dev, struct rtc_time *tm)
 {
-	struct spi_device *spi = to_spi_device(dev);
-	const u8 start_addr = 0;
+	struct m41t93_data *m41t93 = dev_get_drvdata(dev);
 	u8 buf[8];
 	int century_after_1900;
 	int tmp;
@@ -113,32 +107,32 @@ static int m41t93_get_time(struct device *dev, struct rtc_time *tm)
 	      case after poweron. Time is valid after resetting HT bit.
 	   2. oscillator fail bit (OF) is set: time is invalid.
 	*/
-	tmp = spi_w8r8(spi, M41T93_REG_ALM_HOUR_HT);
-	if (tmp < 0)
-		return tmp;
+	ret = regmap_read(m41t93->regmap, M41T93_REG_ALM_HOUR_HT, &tmp);
+	if (ret < 0)
+		return ret;
 
 	if (tmp & M41T93_FLAG_HT) {
-		dev_dbg(&spi->dev, "HT bit is set, reenable clock update.\n");
-		m41t93_set_reg(spi, M41T93_REG_ALM_HOUR_HT,
-			       tmp & ~M41T93_FLAG_HT);
+		dev_dbg(dev, "HT bit is set, reenable clock update.\n");
+		regmap_write(m41t93->regmap, M41T93_REG_ALM_HOUR_HT,
+			     tmp & ~M41T93_FLAG_HT);
 	}
 
-	tmp = spi_w8r8(spi, M41T93_REG_FLAGS);
-	if (tmp < 0)
-		return tmp;
+	ret = regmap_read(m41t93->regmap, M41T93_REG_FLAGS, &tmp);
+	if (ret < 0)
+		return ret;
 
 	if (tmp & M41T93_FLAG_OF) {
 		ret = -EINVAL;
-		dev_warn(&spi->dev, "OF bit is set, write time to restart.\n");
+		dev_warn(dev, "OF bit is set, write time to restart.\n");
 	}
 
 	if (tmp & M41T93_FLAG_BL)
-		dev_warn(&spi->dev, "BL bit is set, replace battery.\n");
+		dev_warn(dev, "BL bit is set, replace battery.\n");
 
 	/* read actual time/date */
-	tmp = spi_write_then_read(spi, &start_addr, 1, buf, sizeof(buf));
-	if (tmp < 0)
-		return tmp;
+	ret = regmap_bulk_read(m41t93->regmap, M41T93_REG_SSEC, buf, sizeof(buf));
+	if (ret < 0)
+		return ret;
 
 	tm->tm_sec	= bcd2bin(buf[M41T93_REG_ST_SEC]);
 	tm->tm_min	= bcd2bin(buf[M41T93_REG_MIN]);
@@ -167,26 +161,51 @@ static const struct rtc_class_ops m41t93_rtc_ops = {
 
 static struct spi_driver m41t93_driver;
 
+static const struct regmap_config regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.read_flag_mask = 0x00,
+	.write_flag_mask = 0x80,
+	.zero_flag_mask = true,
+};
+
 static int m41t93_probe(struct spi_device *spi)
 {
-	struct rtc_device *rtc;
-	int res;
+	int res, ret;
+	struct m41t93_data *m41t93;
 
 	spi->bits_per_word = 8;
 	spi_setup(spi);
 
-	res = spi_w8r8(spi, M41T93_REG_WDAY);
+	m41t93 = devm_kzalloc(&spi->dev, sizeof(struct m41t93_data), GFP_KERNEL);
+
+	if (!m41t93)
+		return -ENOMEM;
+
+	/* Set up regmap to access device registers*/
+	m41t93->regmap = devm_regmap_init_spi(spi, &regmap_config);
+	if (IS_ERR(m41t93->regmap)) {
+		dev_err(&spi->dev, "regmap init failure\n");
+		return PTR_ERR(m41t93->regmap);
+	}
+
+	ret = regmap_read(m41t93->regmap, M41T93_REG_WDAY, &res);
+	if (ret < 0) {
+		dev_err(&spi->dev, "IO error\n");
+		return -EIO;
+	}
+
 	if (res < 0 || (res & 0xf8) != 0) {
 		dev_err(&spi->dev, "not found 0x%x.\n", res);
 		return -ENODEV;
 	}
 
-	rtc = devm_rtc_device_register(&spi->dev, m41t93_driver.driver.name,
-					&m41t93_rtc_ops, THIS_MODULE);
-	if (IS_ERR(rtc))
-		return PTR_ERR(rtc);
+	spi_set_drvdata(spi, m41t93);
 
-	spi_set_drvdata(spi, rtc);
+	m41t93->rtc = devm_rtc_device_register(&spi->dev, m41t93_driver.driver.name,
+					&m41t93_rtc_ops, THIS_MODULE);
+	if (IS_ERR(m41t93->rtc))
+		return PTR_ERR(m41t93->rtc);
 
 	return 0;
 }
-- 
2.34.1


