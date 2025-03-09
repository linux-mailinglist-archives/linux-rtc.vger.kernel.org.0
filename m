Return-Path: <linux-rtc+bounces-3440-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09642A5882A
	for <lists+linux-rtc@lfdr.de>; Sun,  9 Mar 2025 21:27:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1E38188DD70
	for <lists+linux-rtc@lfdr.de>; Sun,  9 Mar 2025 20:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DECEB21C9FB;
	Sun,  9 Mar 2025 20:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TjU0ZNY5"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEF821B1BE;
	Sun,  9 Mar 2025 20:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741552011; cv=none; b=SxRsVp7GPdVUQ2qq3etszw7vFsldXuzh2CJkEIPZq5Zc19+Z+38Kl/vWP++zp0xJ9n0BoP9TUM8yf6nl2zOqYaW/FAZtrIf/0x04BHP9HCyz8VUHlqyrOo/WHjjhPEYB8C7dpqrQHxG2YqgUmeAdR4WVtJzSbMuPypCYuTDRcwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741552011; c=relaxed/simple;
	bh=JlNZJiSrRTG2CRBUO5hEK/QMgLdercFEvvrI/JrL3to=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CdsQ1U4hVGW4nPR077FtSxOJysACDpexprrggGngJ1oH5UO8Jl2VJMESI8I57P1UXgBr/z8wnZvgwqQo55QqWxd1Bpuz2ZMM9jDU3pgDgrj60xSCWghWOPtrcNAQIkHt+2m5gK69j5jEdXC0u9cT6ggJ/+w/CZS7Te9HspwD0MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TjU0ZNY5; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-abf45d8db04so544107666b.1;
        Sun, 09 Mar 2025 13:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741552008; x=1742156808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AgX9a1Aq9JdDvGqYLnfOnFZ6qHi3vH+XQ7U6CnatI+A=;
        b=TjU0ZNY5g4fMyLZLaLSRvfaK2/42mjELTUopIN+odU0xyyjw35Bme4C1eNTqs8LfmY
         6QgiACFelErCUDdFS5gYVI5G2LDt6HLEm5d1YZdeipsmAO5Ub1ayreSZzoPsFDTbANlL
         AUX9c4bnWlrtTU//L7J5shzjCwZ7Sd7Qx61dhr+5FoH1pV2QlkNQ7vUsgxu9y6tn+GIB
         uRQRoe+l9pnML6+xz0Zdhs6pexRHg1kd42fWQEsqev8v+8cI8ge6naosOiaxZGahtbwl
         8xKicz8jU4Bqew04Ee6TKLT1VTYoZuWn9eO5nRb37cYjscd/qGfxB/cnCmoemhOmp7X3
         XC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741552008; x=1742156808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AgX9a1Aq9JdDvGqYLnfOnFZ6qHi3vH+XQ7U6CnatI+A=;
        b=AiWHZ9mByo33d6RJFtI1a/RYDo0i4oXDNMImzomNPLgQEnSCNDCu8zypLjcHUbNsKD
         0DGGoSKeRnuSHETfuQ8VgBGUP8AIOPseHxg3RjkXRImy7G8pN+WpApjPDLKzraHlSgaW
         OuaHuZOVJfQsve7yFzsN7OzmcHaMy4AZ35I5g3iuWreZyQTWajdPfawVkSwLZt84DzfG
         ihS29Rr7+Fh7x8Sh89uzE9AnqEyqrdrri4Ko2TReV0HN1CartDpBQGZcmKfxIeV3YMk9
         54uxoexWNCMEg6qjA9+nBBbJ5FLw5xYLJ7K7alw87xeUAEb4ZSym5ec3tfCbTopiIIHv
         QMmw==
X-Forwarded-Encrypted: i=1; AJvYcCUj6ErJ/FzT4qHx8lMD2IBFCZk4FT0assStkiFcgRTtQzCwEH2IasBzvrlSVl+hGzLMglYkFgXNur4f@vger.kernel.org, AJvYcCVECYV3VOqol9ZronQGwyNkdQvs1DSH10qLWjWfjJ7gBuvZAItxDvH3vWKoYnr8qsHINQZbYtlYIK+J@vger.kernel.org, AJvYcCXqff67mbRfgrlqgY4zwzFfuDFNSEcrQdA9oiseQvrlGRp/SlYtpPHx9+Ndwsk5KCcC22xOe5VPD/gjBj0u@vger.kernel.org
X-Gm-Message-State: AOJu0YymT5mIOSoD/VtSyGpeYRhicsIWyO6/JyoeH6HiIFZ7H+uc7gPQ
	BmNCTLlp7TxCWGdSCAGrBvzd1+OOs9Whn2+VP1U7+ooDRtaOuh9K
X-Gm-Gg: ASbGncvyAMGVGzDkeQ9EBY+YeE2lYHziLA16nicu/p1vmALusypi8X90L4Hy89Iedci
	Z2j121Z16MgqBIhXCN3rKIXiWES6wuUFyqZSyjN14BzF6QrqyvMh6vG1yBhbJOhH+UoVjWkvroD
	Obl0w57ylMWwm+pLxqKInr9707IyUCxcd8QXzzfFBWD5XrwXTPp2Abvu7m1DM3kgT9Bxwbi66Bx
	WM1zD09vpXJZRFIBMHHFdTYzZlyIPUPaRgi7eTsLhpVFGq1h28TDHGHwlfkPEENYgnCUp3Mc0pN
	H/BuR5Mj8RgyH5VMjma7FUSLgxmI1tE86qVuy1Sp3jCu9ttDdzBogOY4jOyucAS/jGIT
X-Google-Smtp-Source: AGHT+IGtDIxOlAVM/YPDW2Uqggt56ekJGM3Hytlqa9FsP51qMBCQBLySx7tKlXb3Bz4oCLEqdlrYwA==
X-Received: by 2002:a17:907:1b05:b0:ac2:4b9:dff8 with SMTP id a640c23a62f3a-ac2527048b1mr1192209466b.32.1741552007848;
        Sun, 09 Mar 2025 13:26:47 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac27c7e29bbsm281833966b.92.2025.03.09.13.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 13:26:47 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: sophgo@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rtc@vger.kernel.org
Cc: Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Yangyu Chen <cyy@cyyself.name>,
	linux-kernel@vger.kernel.org,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Subject: [PATCH v13 3/3] rtc: sophgo: add rtc support for Sophgo CV1800 SoC
Date: Sun,  9 Mar 2025 21:26:25 +0100
Message-ID: <20250309202629.3516822-4-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309202629.3516822-1-alexander.sverdlin@gmail.com>
References: <20250309202629.3516822-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>

Implement the RTC driver for CV1800, which able to provide time alarm.

Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v13:
- Change in the Kconfig dependency caused by the move of the previous
  patch from MFD into SOC
v12:
- added MAINTAINERS entry
- depends on cv1800-rtcsys MFD driver
- use syscon for regmap
- get named clock from parent MFD
- corresponding platform device is expected to be instantiated by MFD stub
Changes since v10:
- only start RTC on set_time;
Changes since v9:
- further simplified bitmask macros;
- unconditional RTC start (rtc_enable_sec_counter()), otherwise
didn't start on SG2000;
- dropped ANA_CALIB modification (has been forgotten in v8 with
the drop of SW calibration to switch to HW calibration);
- successfully tested on SG2000;


 MAINTAINERS              |   1 +
 drivers/rtc/Kconfig      |  12 +++
 drivers/rtc/Makefile     |   1 +
 drivers/rtc/rtc-cv1800.c | 218 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 232 insertions(+)
 create mode 100644 drivers/rtc/rtc-cv1800.c

diff --git a/MAINTAINERS b/MAINTAINERS
index ac15e448fffb..be8fee50a49c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22354,6 +22354,7 @@ L:	sophgo@lists.linux.dev
 W:	https://github.com/sophgo/linux/wiki
 T:	git https://github.com/sophgo/linux.git
 S:	Maintained
+F:	drivers/rtc/rtc-cv1800.c
 F:	drivers/soc/sophgo/cv1800-rtcsys.c
 N:	sophgo
 K:	sophgo
diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 0bbbf778ecfa..46593103db11 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1395,6 +1395,18 @@ config RTC_DRV_ASM9260
 	  This driver can also be built as a module. If so, the module
 	  will be called rtc-asm9260.
 
+config RTC_DRV_CV1800
+	tristate "Sophgo CV1800 RTC"
+	depends on SOPHGO_CV1800_RTCSYS || COMPILE_TEST
+	select MFD_SYSCON
+	select REGMAP
+	help
+	  If you say yes here you get support the RTC driver for Sophgo CV1800
+	  series SoC.
+
+	  This driver can also be built as a module. If so, the module will be
+	  called rtc-cv1800.
+
 config RTC_DRV_DIGICOLOR
 	tristate "Conexant Digicolor RTC"
 	depends on ARCH_DIGICOLOR || COMPILE_TEST
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 489b4ab07068..621b30a33dda 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -44,6 +44,7 @@ obj-$(CONFIG_RTC_DRV_CADENCE)	+= rtc-cadence.o
 obj-$(CONFIG_RTC_DRV_CMOS)	+= rtc-cmos.o
 obj-$(CONFIG_RTC_DRV_CPCAP)	+= rtc-cpcap.o
 obj-$(CONFIG_RTC_DRV_CROS_EC)	+= rtc-cros-ec.o
+obj-$(CONFIG_RTC_DRV_CV1800)	+= rtc-cv1800.o
 obj-$(CONFIG_RTC_DRV_DA9052)	+= rtc-da9052.o
 obj-$(CONFIG_RTC_DRV_DA9055)	+= rtc-da9055.o
 obj-$(CONFIG_RTC_DRV_DA9063)	+= rtc-da9063.o
diff --git a/drivers/rtc/rtc-cv1800.c b/drivers/rtc/rtc-cv1800.c
new file mode 100644
index 000000000000..18bc542bbdb8
--- /dev/null
+++ b/drivers/rtc/rtc-cv1800.c
@@ -0,0 +1,218 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * rtc-cv1800.c: RTC driver for Sophgo cv1800 RTC
+ *
+ * Author: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/irq.h>
+#include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/rtc.h>
+
+#define SEC_PULSE_GEN          0x1004
+#define ALARM_TIME             0x1008
+#define ALARM_ENABLE           0x100C
+#define SET_SEC_CNTR_VAL       0x1010
+#define SET_SEC_CNTR_TRIG      0x1014
+#define SEC_CNTR_VAL           0x1018
+
+/*
+ * When in VDDBKUP domain, this MACRO register
+ * does not power down
+ */
+#define MACRO_RO_T             0x14A8
+#define MACRO_RG_SET_T         0x1498
+
+#define ALARM_ENABLE_MASK      BIT(0)
+#define SEL_SEC_PULSE          BIT(31)
+
+struct cv1800_rtc_priv {
+	struct rtc_device *rtc_dev;
+	struct regmap *rtc_map;
+	struct clk *clk;
+	int irq;
+};
+
+static bool cv1800_rtc_enabled(struct device *dev)
+{
+	struct cv1800_rtc_priv *info = dev_get_drvdata(dev);
+	u32 reg;
+
+	regmap_read(info->rtc_map, SEC_PULSE_GEN, &reg);
+
+	return (reg & SEL_SEC_PULSE) == 0;
+}
+
+static void cv1800_rtc_enable(struct device *dev)
+{
+	struct cv1800_rtc_priv *info = dev_get_drvdata(dev);
+
+	/* Sec pulse generated internally */
+	regmap_update_bits(info->rtc_map, SEC_PULSE_GEN, SEL_SEC_PULSE, 0);
+}
+
+static int cv1800_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
+{
+	struct cv1800_rtc_priv *info = dev_get_drvdata(dev);
+
+	regmap_write(info->rtc_map, ALARM_ENABLE, enabled);
+
+	return 0;
+}
+
+static int cv1800_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct cv1800_rtc_priv *info = dev_get_drvdata(dev);
+	unsigned long alarm_time;
+
+	alarm_time = rtc_tm_to_time64(&alrm->time);
+
+	cv1800_rtc_alarm_irq_enable(dev, 0);
+
+	regmap_write(info->rtc_map, ALARM_TIME, alarm_time);
+
+	cv1800_rtc_alarm_irq_enable(dev, alrm->enabled);
+
+	return 0;
+}
+
+static int cv1800_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
+{
+	struct cv1800_rtc_priv *info = dev_get_drvdata(dev);
+	u32 enabled;
+	u32 time;
+
+	if (!cv1800_rtc_enabled(dev)) {
+		alarm->enabled = 0;
+		return 0;
+	}
+
+	regmap_read(info->rtc_map, ALARM_ENABLE, &enabled);
+
+	alarm->enabled = enabled & ALARM_ENABLE_MASK;
+
+	regmap_read(info->rtc_map, ALARM_TIME, &time);
+
+	rtc_time64_to_tm(time, &alarm->time);
+
+	return 0;
+}
+
+static int cv1800_rtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	struct cv1800_rtc_priv *info = dev_get_drvdata(dev);
+	u32 sec;
+
+	if (!cv1800_rtc_enabled(dev))
+		return -EINVAL;
+
+	regmap_read(info->rtc_map, SEC_CNTR_VAL, &sec);
+
+	rtc_time64_to_tm(sec, tm);
+
+	return 0;
+}
+
+static int cv1800_rtc_set_time(struct device *dev, struct rtc_time *tm)
+{
+	struct cv1800_rtc_priv *info = dev_get_drvdata(dev);
+	unsigned long sec;
+
+	sec = rtc_tm_to_time64(tm);
+
+	regmap_write(info->rtc_map, SET_SEC_CNTR_VAL, sec);
+	regmap_write(info->rtc_map, SET_SEC_CNTR_TRIG, 1);
+
+	regmap_write(info->rtc_map, MACRO_RG_SET_T, sec);
+
+	cv1800_rtc_enable(dev);
+
+	return 0;
+}
+
+static irqreturn_t cv1800_rtc_irq_handler(int irq, void *dev_id)
+{
+	struct cv1800_rtc_priv *info = dev_id;
+
+	rtc_update_irq(info->rtc_dev, 1, RTC_IRQF | RTC_AF);
+
+	regmap_write(info->rtc_map, ALARM_ENABLE, 0);
+
+	return IRQ_HANDLED;
+}
+
+static const struct rtc_class_ops cv1800_rtc_ops = {
+	.read_time = cv1800_rtc_read_time,
+	.set_time = cv1800_rtc_set_time,
+	.read_alarm = cv1800_rtc_read_alarm,
+	.set_alarm = cv1800_rtc_set_alarm,
+	.alarm_irq_enable = cv1800_rtc_alarm_irq_enable,
+};
+
+static int cv1800_rtc_probe(struct platform_device *pdev)
+{
+	struct cv1800_rtc_priv *rtc;
+	int ret;
+
+	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
+	if (!rtc)
+		return -ENOMEM;
+
+	rtc->rtc_map = device_node_to_regmap(pdev->dev.parent->of_node);
+	if (IS_ERR(rtc->rtc_map))
+		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->rtc_map),
+				     "cannot get parent regmap\n");
+
+	rtc->irq = platform_get_irq(pdev, 0);
+	if (rtc->irq < 0)
+		return rtc->irq;
+
+	rtc->clk = devm_clk_get_enabled(pdev->dev.parent, "rtc");
+	if (IS_ERR(rtc->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->clk),
+				     "rtc clk not found\n");
+
+	platform_set_drvdata(pdev, rtc);
+
+	device_init_wakeup(&pdev->dev, 1);
+
+	rtc->rtc_dev = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(rtc->rtc_dev))
+		return PTR_ERR(rtc->rtc_dev);
+
+	rtc->rtc_dev->ops = &cv1800_rtc_ops;
+	rtc->rtc_dev->range_max = U32_MAX;
+
+	ret = devm_request_irq(&pdev->dev, rtc->irq, cv1800_rtc_irq_handler,
+			       IRQF_TRIGGER_HIGH, "rtc alarm", rtc);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "cannot register interrupt handler\n");
+
+	return devm_rtc_register_device(rtc->rtc_dev);
+}
+
+static const struct platform_device_id cv1800_rtc_id[] = {
+	{ .name = "cv1800-rtc" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(platform, cv1800_rtc_id);
+
+static struct platform_driver cv1800_rtc_driver = {
+	.driver = {
+		.name = "sophgo-cv1800-rtc",
+	},
+	.probe = cv1800_rtc_probe,
+	.id_table = cv1800_rtc_id,
+};
+
+module_platform_driver(cv1800_rtc_driver);
+MODULE_AUTHOR("Jingbao Qiu");
+MODULE_DESCRIPTION("Sophgo cv1800 RTC Driver");
+MODULE_LICENSE("GPL");
-- 
2.48.1


