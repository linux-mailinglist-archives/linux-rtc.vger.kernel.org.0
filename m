Return-Path: <linux-rtc+bounces-4330-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C40AAAE2E36
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Jun 2025 05:30:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC0B9188F0F1
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Jun 2025 03:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 599DE17A2E6;
	Sun, 22 Jun 2025 03:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ma1FYeDV"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E0B1684AC
	for <linux-rtc@vger.kernel.org>; Sun, 22 Jun 2025 03:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750562995; cv=none; b=OWEfuRXm/Uy7zIpWjbaVL4ZwUZ7ifKtEx26BNLt2pRcGgLiLZ3nHAaj6REasOVFqfurb2lnaY/PnwzOins2WD7f32m35DvJeD8I02bAqyHKJpYuO0RKvvnfeg3QY1xFXBrjzgBnY1vNvB3/FYFKciJ/JJI2K5MO1/bJsgSyM2XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750562995; c=relaxed/simple;
	bh=Go0wu4UyU0raaHDkQ1guPLHZtEwJ0SpS66RX5zWEIgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EhhpMFwoLv/GP/FuAGY5OjVcxpyRSKrFWhP/EX6j/YJHgUifiJH2rHYdq0s2EZ/2tD5OmgdEoRDpLgmcW1G291JHECINeIIqD9D+6WO1hq+3CeVd9RwXsGnEmGU8WYhhu3FqtP4g3ydLCtb2O9NAHXPle4WVcEnA/BdHp8EjwOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ma1FYeDV; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6fac7147cb8so62182266d6.1
        for <linux-rtc@vger.kernel.org>; Sat, 21 Jun 2025 20:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750562991; x=1751167791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYVDfYJEfBaM0ssLbKCKZebV837CxPuDOg/+Kg5KUqU=;
        b=ma1FYeDVbt9pOEDK8Fz+oDRo1w3UhduQagsxnlvjt1AxPIQU7okV7ehw1PbzOeBGl5
         eeu44+pl9chRKXnK9/X2KM/JjGokMjPhWL6jla1eIqwjvivzDMgA/DAuw3XhVqPAYmjl
         g3RDhg076cVXalmjMlSUd17Uh3u9e+7UJZYSgenPLipIwKHdVsCIBg3fNKf5HPxboIY5
         OVae+ZO96JHEr4M2sGyzeWdr1BMUwexw9TsN1eTSa0B6qkVsdzh3L6j/VfS8G+7L9+QJ
         MkCxY7gx+439KaO4D3gT19FSdXZV064D4MSy8HiYRkpMDAHYpALvw5wg09MEn3uffUzm
         5rkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750562991; x=1751167791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FYVDfYJEfBaM0ssLbKCKZebV837CxPuDOg/+Kg5KUqU=;
        b=LdGoznfpHwSTKd4qZTszspyZwlOodyoPi6wJiXn+wBA9a6YiV9T5EmrQtVvLLMK4c+
         ppbjFouJ0zBjnJgiqtfllxnXmvs5Owm5BUHjQ8USWMyLSXR2B3GDLwURothwwE108V4G
         8Evg1hPUeif+dcIuVmkQNDeUTf6Yn8CZY27ffVGwsgFR1z7y3W8/XHOK5BRPnVXjnOrC
         al2x3QxNQw0czvN8uU+jJW52tpvs/NHhw34aLbKJfJsmstDrb8vIbyEpPMRyVvceEL4r
         +Juh7G4eVVZl4d3IDqelJixyvlAWGBQd2BQiPnWPFmPT9wZsqPMXT2L/XXirk/LD+I5K
         ABiQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8S6N+1r6pUvAhhlB0R6dvVU2Qj8kOWhsKqXUEreN3H0x+5p7cRpjSHhdLkmBdB72w2FVExSvFiq0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyK08c1fSGYpKHtLw1OXwwofYPrFxVcK8O8wxGiUncbLcaXWvuj
	ypZ6/6fW6G6WmL3zgsUrobcg6bkVdGhIVZAaZOTgyYnTUce6cNY+k6xtgsdwag6tLiw=
X-Gm-Gg: ASbGncvetNXC4N4T/lV9rxGuK1rCgI9bcvIKNJV2LO5ZixxeDfqjgi4N1ffHD3nto9V
	ot2yCCOoyiCPIBeFx3yDEIe/8txC/JqwoZ6Uhfb2HslQ22CKaGfbcuiVPzbhgoUOyEayZfUZG0R
	zbUFoG9HFZkq7/vM1t/qQn1yOATQtAnF4cgNtSN7IV5+nGI+FgDiHwpPQJTLwT8cSZ39eKpzoGA
	ZAlA/iP+X3yaIdEoahEwPaXbujd/pQeBpyx6GgeAFLwQwkn7HO6VdSo3LT04ReqqQk3mqX6L421
	LWRPo6/EAFRKIQGX0aEdSLOtMLs9vqGxc/jpm29CStLSPNJCCNmLTgiiSfW3cAn9jOgkdUPjLAW
	WTMrQKlggNSW/JLdBr4hBLiw4xXmSjzOphzo=
X-Google-Smtp-Source: AGHT+IEzbUQ+7RVQuRV0EbLr3Cx1IwLGHmCYPT6OmFah/l6Db4G4Rk9xcbyX4PneJMhTkAYKbjMc7A==
X-Received: by 2002:a05:6214:469e:b0:6fa:9a6a:7cfc with SMTP id 6a1803df08f44-6fd0a51c75emr132820726d6.26.1750562991350;
        Sat, 21 Jun 2025 20:29:51 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd0945183dsm30014526d6.44.2025.06.21.20.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 20:29:51 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	alexandre.belloni@bootlin.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	wangruikang@iscas.ac.cn,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-rtc@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 4/7] rtc: spacemit: support the SpacemiT P1 RTC
Date: Sat, 21 Jun 2025 22:29:36 -0500
Message-ID: <20250622032941.3768912-5-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250622032941.3768912-1-elder@riscstar.com>
References: <20250622032941.3768912-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the RTC found in the SpacemiT P1 PMIC.  Initially
only setting and reading the time are supported.

The PMIC is implemented as a multi-function device.  This RTC is
probed based on this driver being named in a MFD cell in the simple
MFD I2C driver.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v3: - Added this driver to the series, in response to Lee Jones saying
      more than one MFD sub-device was required to be acceptable

 drivers/rtc/Kconfig  |  10 ++++
 drivers/rtc/Makefile |   1 +
 drivers/rtc/rtc-p1.c | 137 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 148 insertions(+)
 create mode 100644 drivers/rtc/rtc-p1.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 9aec922613cec..27cff02ba4e66 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -406,6 +406,16 @@ config RTC_DRV_MAX77686
 	  This driver can also be built as a module. If so, the module
 	  will be called rtc-max77686.
 
+config RTC_DRV_P1
+	tristate "SpacemiT P1 RTC"
+	depends on ARCH_SPACEMIT || COMPILE_TEST
+	select MFD_SPACEMIT_P1
+	default ARCH_SPACEMIT
+	help
+	  Enable support for the RTC function in the SpacemiT P1 PMIC.
+	  This driver can also be built as a module, which will be called
+	  "spacemit-p1-rtc".
+
 config RTC_DRV_NCT3018Y
 	tristate "Nuvoton NCT3018Y"
 	depends on OF
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 4619aa2ac4697..f8588426e2ba4 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -171,6 +171,7 @@ obj-$(CONFIG_RTC_DRV_SD2405AL)	+= rtc-sd2405al.o
 obj-$(CONFIG_RTC_DRV_SD3078)	+= rtc-sd3078.o
 obj-$(CONFIG_RTC_DRV_SH)	+= rtc-sh.o
 obj-$(CONFIG_RTC_DRV_SNVS)	+= rtc-snvs.o
+obj-$(CONFIG_RTC_DRV_P1)	+= rtc-p1.o
 obj-$(CONFIG_RTC_DRV_SPEAR)	+= rtc-spear.o
 obj-$(CONFIG_RTC_DRV_STARFIRE)	+= rtc-starfire.o
 obj-$(CONFIG_RTC_DRV_STK17TA8)	+= rtc-stk17ta8.o
diff --git a/drivers/rtc/rtc-p1.c b/drivers/rtc/rtc-p1.c
new file mode 100644
index 0000000000000..e0d2c0c822142
--- /dev/null
+++ b/drivers/rtc/rtc-p1.c
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for the RTC found in the SpacemiT P1 PMIC
+ *
+ * Copyright (C) 2025 by RISCstar Solutions Corporation.  All rights reserved.
+ */
+
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/rtc.h>
+
+#define MOD_NAME	"spacemit-p1-rtc"
+
+/* Offset to byte containing the given time unit */
+enum time_unit {
+	tu_second = 0,		/* 0-59 */
+	tu_minute,		/* 0-59 */
+	tu_hour,		/* 0-59 */
+	tu_day,			/* 0-30 (struct tm uses 1-31) */
+	tu_month,		/* 0-11 */
+	tu_year,		/* Years since 2000 (struct tm uses 1900) */
+	tu_count,		/* Last; not a time unit */
+};
+
+/* Consecutive bytes contain seconds, minutes, etc. */
+#define RTC_COUNT_BASE		0x0d
+
+#define RTC_CTRL		0x1d
+#define RTC_EN		BIT(2)
+
+struct p1_rtc {
+	struct regmap *regmap;
+	struct rtc_device *rtc;
+};
+
+static int p1_rtc_read_time(struct device *dev, struct rtc_time *t)
+{
+	struct p1_rtc *p1 = dev_get_drvdata(dev);
+	u8 time[tu_count];
+	int ret;
+
+	ret = regmap_bulk_read(p1->regmap, RTC_COUNT_BASE, &time, sizeof(time));
+	if (ret)
+		return ret;
+
+	t->tm_sec = time[tu_second] & GENMASK(5, 0);
+	t->tm_min = time[tu_minute] & GENMASK(5, 0);
+	t->tm_hour = time[tu_hour] & GENMASK(4, 0);
+	t->tm_mday = (time[tu_day] & GENMASK(4, 0)) + 1;
+	t->tm_mon = time[tu_month] & GENMASK(3, 0);
+	t->tm_year = (time[tu_year] & GENMASK(5, 0)) + 100;
+	/* tm_wday, tm_yday, and tm_isdst aren't used */
+
+	return 0;
+}
+
+static int p1_rtc_set_time(struct device *dev, struct rtc_time *t)
+{
+	struct p1_rtc *p1 = dev_get_drvdata(dev);
+	u8 time[tu_count];
+	int ret;
+
+	time[tu_second] = t->tm_sec;
+	time[tu_minute] = t->tm_min;
+	time[tu_hour] = t->tm_hour;
+	time[tu_day] = t->tm_mday - 1;
+	time[tu_month] = t->tm_mon;
+	time[tu_year] = t->tm_year - 100;
+
+	/* Disable the RTC to update; re-enable again when done */
+	ret = regmap_update_bits(p1->regmap, RTC_CTRL, RTC_EN, 0);
+	if (ret)
+		return ret;
+
+	ret = regmap_bulk_write(p1->regmap, RTC_COUNT_BASE, time, sizeof(time));
+
+	(void)regmap_update_bits(p1->regmap, RTC_CTRL, RTC_EN, RTC_EN);
+
+	return ret;
+}
+
+static const struct rtc_class_ops p1_rtc_class_ops = {
+	.read_time = p1_rtc_read_time,
+	.set_time = p1_rtc_set_time,
+};
+
+static int p1_rtc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rtc_device *rtc;
+	struct p1_rtc *p1;
+	int ret;
+
+	p1 = devm_kzalloc(dev, sizeof(*p1), GFP_KERNEL);
+	if (!p1)
+		return -ENOMEM;
+	dev_set_drvdata(dev, p1);
+
+	p1->regmap = dev_get_regmap(dev->parent, NULL);
+	if (!p1->regmap)
+		return dev_err_probe(dev, -ENODEV, "failed to get regmap\n");
+
+	rtc = devm_rtc_allocate_device(dev);
+	if (IS_ERR(rtc))
+		return dev_err_probe(dev, PTR_ERR(rtc),
+				     "error allocating device\n");
+	p1->rtc = rtc;
+
+	rtc->ops = &p1_rtc_class_ops;
+	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	rtc->range_max = RTC_TIMESTAMP_END_2063;
+
+	clear_bit(RTC_FEATURE_ALARM, rtc->features);
+	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->features);
+
+	ret = devm_rtc_register_device(rtc);
+	if (ret)
+		return dev_err_probe(dev, ret, "error registering RTC\n");
+
+	return 0;
+}
+
+static struct platform_driver p1_rtc_driver = {
+	.probe = p1_rtc_probe,
+	.driver = {
+		.name = MOD_NAME,
+	},
+};
+
+module_platform_driver(p1_rtc_driver);
+
+MODULE_DESCRIPTION("SpacemiT P1 RTC driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:" MOD_NAME);
-- 
2.45.2


