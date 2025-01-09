Return-Path: <linux-rtc+bounces-2853-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8D4A077F7
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Jan 2025 14:44:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 548011888470
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Jan 2025 13:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C767021B905;
	Thu,  9 Jan 2025 13:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OTmkiHF7"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE09218EB4;
	Thu,  9 Jan 2025 13:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736430183; cv=none; b=gq1KswMkomIWmRWSinK9QB3uNy2iNw9p7IdcavvIEyRMg67FYaUoeUiokMKdzSCIfOga/yTa/scQ8bKtX0+A9ikIOL8lmyctVyylo09suIvP+io08V+viSzCRkXz5Xyq278/zRmVs8RnJyt8nGZMLcQuGqnu92b+rJ2+Cf2NZK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736430183; c=relaxed/simple;
	bh=JFYC6zdgps1GvGNzbNKeygbGZOosR+W3XQIINDfxbWo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Aj9GGr0X3T7lVHJjQ9HpnNuNfwEDn3Cs1xSMWnchW0TtyHWC7Rf/ezCKMR7jMs5f/KmvCcMjT9AbaD/IF/lnYgLTtTEzb82aoWH5XuwmYhcQ8b3rkE+WhQi5WzKJPn9tM2T0U743hPe1d4HXxEOxKiE23ZsPYYLMGoD3yDaz+9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OTmkiHF7; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E0448C0005;
	Thu,  9 Jan 2025 13:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736430178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ptD9AvTYctt7SXIIS+M37918BnCnHCUacBd34xC0oFU=;
	b=OTmkiHF7JWz6TISr9zfMIKkWWS7UxM6GMqkjtK/QehhbwjtFmTUwKan7GbLQd77bDV/hiH
	tZjFzKBfPYyLcZoVVu8UeMyae7scRAlwuorPIVhJ1/4szLHsZF73Uj8Vcm/kpaoT/AacXf
	3hPqkO4qa3cqimGi0k7V+1sDL8WWDDuTjYf1uKeCVPq/P1iW+9LLgS4JUpESST/Qkp9ENM
	gPZj6NIl7Gd2lVfneJ4VpIwqQkzFEEn/Pj+b10ysGpyPOA65PAkIH3S3IudF+pDOLzX1YJ
	xxCb8G3JK4/WqZNrJ8CaR2kIdx9klbxOy0iRR6quJMsHRG73TbIJEOBLPr1GzA==
From: alexandre.belloni@bootlin.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: pcf2127: add BSM support
Date: Thu,  9 Jan 2025 14:42:53 +0100
Message-ID: <20250109134253.827796-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexandre.belloni@bootlin.com

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

The pcf2127 encodes BSM, BLD and power fail detection in the same set of
bits so it is necessary to do some calculation when changing BSM to keep
the rest of the configuration as-is. However, when BSM is disabled, there
is no configuration with BLD enabled so this will be lost when coming back
to a mode with BSM enabled.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pcf2127.c | 81 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 9c04c4e1a49c..a7f73192d53d 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -48,6 +48,7 @@
 #define PCF2127_BIT_CTRL3_BLF			BIT(2)
 #define PCF2127_BIT_CTRL3_BF			BIT(3)
 #define PCF2127_BIT_CTRL3_BTSE			BIT(4)
+#define PCF2127_CTRL3_PM			GENMASK(7, 5)
 /* Time and date registers */
 #define PCF2127_REG_TIME_BASE		0x03
 #define PCF2127_BIT_SC_OSF			BIT(7)
@@ -331,6 +332,84 @@ static int pcf2127_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	return 0;
 }
 
+static int pcf2127_param_get(struct device *dev, struct rtc_param *param)
+{
+	struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
+	u32 value;
+	int ret;
+
+	switch (param->param) {
+	case RTC_PARAM_BACKUP_SWITCH_MODE:
+		ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL3, &value);
+		if (ret < 0)
+			return ret;
+
+		value = FIELD_GET(PCF2127_CTRL3_PM, value);
+
+		if (value < 0x3)
+			param->uvalue = RTC_BSM_LEVEL;
+		else if (value < 0x6)
+			param->uvalue = RTC_BSM_DIRECT;
+		else
+			param->uvalue = RTC_BSM_DISABLED;
+
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int pcf2127_param_set(struct device *dev, struct rtc_param *param)
+{
+	struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
+	u8 mode = 0;
+	u32 value;
+	int ret;
+
+	switch (param->param) {
+	case RTC_PARAM_BACKUP_SWITCH_MODE:
+		ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL3, &value);
+		if (ret < 0)
+			return ret;
+
+		value = FIELD_GET(PCF2127_CTRL3_PM, value);
+
+		if (value > 5)
+			value -= 5;
+		else if (value > 2)
+			value -= 3;
+
+		switch (param->uvalue) {
+		case RTC_BSM_LEVEL:
+			break;
+		case RTC_BSM_DIRECT:
+			mode = 3;
+			break;
+		case RTC_BSM_DISABLED:
+			if (value == 0)
+				value = 1;
+			mode = 5;
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		return regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL3,
+					  PCF2127_CTRL3_PM,
+					  FIELD_PREP(PCF2127_CTRL3_PM, mode + value));
+
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int pcf2127_rtc_ioctl(struct device *dev,
 				unsigned int cmd, unsigned long arg)
 {
@@ -741,6 +820,8 @@ static const struct rtc_class_ops pcf2127_rtc_ops = {
 	.read_alarm       = pcf2127_rtc_read_alarm,
 	.set_alarm        = pcf2127_rtc_set_alarm,
 	.alarm_irq_enable = pcf2127_rtc_alarm_irq_enable,
+	.param_get        = pcf2127_param_get,
+	.param_set        = pcf2127_param_set,
 };
 
 /* sysfs interface */
-- 
2.47.1


