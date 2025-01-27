Return-Path: <linux-rtc+bounces-3051-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B51A1DA85
	for <lists+linux-rtc@lfdr.de>; Mon, 27 Jan 2025 17:27:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E0751888B0E
	for <lists+linux-rtc@lfdr.de>; Mon, 27 Jan 2025 16:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE9D7156C79;
	Mon, 27 Jan 2025 16:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VWR5jBkQ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BA1155382;
	Mon, 27 Jan 2025 16:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737995269; cv=none; b=ZxiedoMFmH3OwlNzmdDVYIZW3wGLYGIXhlpkHyeulXjY4buc+bVhMDuZfukUGClng1g6yCJ0GHX7Mq72Fxjp51tR+r7+D34C3zajRIeOe2EbdJhJOw7q19TfuuMgsl2iSkaNXbrnJ7YgrW5ousTVBFwLHlUkEA6a2ejUT/j52Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737995269; c=relaxed/simple;
	bh=DT3TrQGmnDyb/lrAnY/BEAI6Bm68ORajZeSKDso0V4g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gWd7+InqnZ5yynT1hyUdbDBZwapV/M1YsDN+p8GkG4JTTrPy4Yoc+bXjwMnigEZdRATv6YjAW1NEtRDibV+XADjf8WB01zWrxLaOSng+98fnS3r6xn2BdEBDT7CUpoLxs8svXDFsHEe0Lvo79+zC6Dre9jk25q6sZbFc5KZCxxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VWR5jBkQ; arc=none smtp.client-ip=217.70.178.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id BD697C0A0D;
	Mon, 27 Jan 2025 16:27:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EA60C1C0006;
	Mon, 27 Jan 2025 16:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737995256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mwfXSGuL5GbpXlv1OfsLFffgzfwf8MzavfPOxC7y9Ec=;
	b=VWR5jBkQOseDmBUKEJyhca32nHTIAF+YB+0Pr5y06ySJDBJxF7ybRrNClNzq+n0+f8Vq/s
	h9ETRUXFNVYJDggacWok2I9w0Cy5JvdYgCzKgEbXyfGbQHfp9UO5lF0Os3n5dTR9Z3S0sL
	RRLpDXGtNITEcS8+TMphzSITk4cx+ayT1VPIo6eLIgQOw5nwkzNuEmhcpWQUEx5Mc3SX9Z
	0uS4YIEewRXDAReHV/lVUBXAZc0kiUqun72t5se49ouAfbRCYWtJFswnKOtC3L1c5FwAoq
	g4RrbJQ22F1wmTeM1imqm03zxdfBd2Zh1Ionp3AAjCyVnkrbOSXu4UTyQPnC2g==
From: alexandre.belloni@bootlin.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] rtc: pcf2127: add BSM support
Date: Mon, 27 Jan 2025 17:27:28 +0100
Message-ID: <20250127162728.86234-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.48.1
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
 drivers/rtc/rtc-pcf2127.c | 82 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 9c04c4e1a49c..31c7dca8f469 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -20,6 +20,7 @@
 #include <linux/i2c.h>
 #include <linux/spi/spi.h>
 #include <linux/bcd.h>
+#include <linux/bitfield.h>
 #include <linux/rtc.h>
 #include <linux/slab.h>
 #include <linux/module.h>
@@ -48,6 +49,7 @@
 #define PCF2127_BIT_CTRL3_BLF			BIT(2)
 #define PCF2127_BIT_CTRL3_BF			BIT(3)
 #define PCF2127_BIT_CTRL3_BTSE			BIT(4)
+#define PCF2127_CTRL3_PM			GENMASK(7, 5)
 /* Time and date registers */
 #define PCF2127_REG_TIME_BASE		0x03
 #define PCF2127_BIT_SC_OSF			BIT(7)
@@ -331,6 +333,84 @@ static int pcf2127_rtc_set_time(struct device *dev, struct rtc_time *tm)
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
@@ -741,6 +821,8 @@ static const struct rtc_class_ops pcf2127_rtc_ops = {
 	.read_alarm       = pcf2127_rtc_read_alarm,
 	.set_alarm        = pcf2127_rtc_set_alarm,
 	.alarm_irq_enable = pcf2127_rtc_alarm_irq_enable,
+	.param_get        = pcf2127_param_get,
+	.param_set        = pcf2127_param_set,
 };
 
 /* sysfs interface */
-- 
2.48.1


