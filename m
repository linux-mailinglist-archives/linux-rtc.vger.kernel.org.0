Return-Path: <linux-rtc+bounces-4059-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AE6AAEC89
	for <lists+linux-rtc@lfdr.de>; Wed,  7 May 2025 21:56:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FCF41C06856
	for <lists+linux-rtc@lfdr.de>; Wed,  7 May 2025 19:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFF7228E5E2;
	Wed,  7 May 2025 19:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LxGWozlx"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0D620C029;
	Wed,  7 May 2025 19:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746647791; cv=none; b=d+c+nfHH3odJ3ddubknKXL58nRbira0eaO0MVy3mAeg7wg9YsgsKfqGDXgh7PVTqdFQ+Qt1Rnb38u4er1iGoXeosr9u4+3AI+lRcl3NE7LU30I4YSFctgraL71u5P8rj5FLgkX0Baa2BCBwvpezV9JozParTbRY7xXZDtGpHi/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746647791; c=relaxed/simple;
	bh=jP7cwJb7BQXpptavncYVB1y333BBlp7ZMaJKzFRSX8M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FUypl0IuamDUJ1nFRA5fOTinBYDbVM8NY4v87KAd3DW7dHlVU6Xwf/EV5j5t+2cFAmoeBkJTzhgXi9ZiiGXiAHiWu1kTMfPyU4q7O41tiLZAWq8yELm7D4zlm7ZMPNebtOkoHaz6TDIchbi/AcBYefSRci4tCbPs0N9SDDkXux0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LxGWozlx; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39c1ef4ae3aso212586f8f.1;
        Wed, 07 May 2025 12:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746647788; x=1747252588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=25rSMDMLx7blmHqby0vCgZmhAkbft50207hfiKZb/RM=;
        b=LxGWozlxVIT5c84E/s073QbsERxHBZ/x+I82dcKKzfO8GTc6lA7uy/5wR4W3KtxlwO
         CLX47c/dhZDLSlUQqGZSEiAsxbE4Et8104rBaTorShC0ti2YLI1w03Sd7s0h1jokOmce
         f8jr4HgIqBRqqwohg6EPDm63zEuJt0B1QWrdDZeIeDtvyjBtyJgvA2XkhTJjssNc21QR
         PNhkZOnDeXedMtlpKRUnalkgsv5RoA3wE03IgxK7hVNfEyKuj+xHJvYA7075INfNF5W2
         yD0PcvKWpWM1L9XH8rXzXo+M2vk6szj3i9Iyt+bvgwSxaiF6mJUGf0UN4pGOQpO2pIKV
         DY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746647788; x=1747252588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=25rSMDMLx7blmHqby0vCgZmhAkbft50207hfiKZb/RM=;
        b=HF31IuvjMa+XaGJiLyXgEF+8nQp/GgomYCKVixpwTORGOkusO6KM3/QU0nOl97hWwR
         HeDrCGFE0wxXqGQ1vMY8CcHojXTdfb0r8TTcnf2Jrqbq+9X/YzkbsCYQiNKK7H5EzmQr
         ZItNSWFgZoOB+ISdrUPiXfxJ2n7MOPJj0fa7XTr6ctMOliaHgd3SAQ5LoMo32H8KVXIY
         k6iWtKrAFAcppCgIWiLjDQ8UU7GyRdqEJltrgUUTU42330Gpxswk5aXemsxf3XFPKGMa
         L/IZtyfxmaC9ftMqdXUqm1Bwjd+x421R4XTedbC9L9emMm47XeY6eW6trp0pJDspqSJd
         U+4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVrOwSQ3/w5JkNW/TW943LCMIXU4jocmLGQe1T/PUDmdmzgBSsTZ5yJkrLUVz5TqzoviPzQlzQx0wMO@vger.kernel.org, AJvYcCXFe5lSDsv3n5xRxbcQYaxF5c0k05VeUX6h7954EE/LbxvQrES55gmVff+EPBeumktJOpKvI8qUfZ7gFC8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXwuPLVqN3JlbvRVfuTm53quLMMxSA73NS+Fl6zIRUtNdZnDJ8
	IjpF/njt4LgFZHqjJNAopDRPa9DsOetQpmHtBxm4P+ks2C081Xze
X-Gm-Gg: ASbGncvQ2Jo493JBlf3scZJBIniPe8MVRH0SZjP7YUVRxtGL7061Z9TRlWJZccxTNpc
	HczkDWvtgnEcvq1wOelrcTFj7kH+qtxsukYjKoOU+OqvTrLGIR8BRbssdwarEnRw6VEdeAdK+Ot
	0vPcyRCSnee/+MPrvWwtdKG1+8q2+RPyq+LthaUJ5Q0gRYMaZmbLCe8378+WlNFsdP36NUy14tZ
	QU0NR4bUy3C8dR+PxybooUYk8437NfvrHFLwCm9cxTNIcscCrvDl8czPHNlc63JBg2aG3PgdRyZ
	ZZYGH1MtrsRUvIMA0YqtAHzh7ShCcDcCDyOMJa2cmK0vbhd+Dw3PFw==
X-Google-Smtp-Source: AGHT+IEWGVunRe1T+TMBgKQkGEPuCsjWQh9IifYPVQbjPao9tYBd3DmTHFoXcA2n5FJUeK60pB0IgA==
X-Received: by 2002:a5d:5c84:0:b0:3a0:b8ba:849f with SMTP id ffacd0b85a97d-3a0b990852emr670708f8f.4.1746647787692;
        Wed, 07 May 2025 12:56:27 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b170e7sm17468159f8f.86.2025.05.07.12.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 12:56:27 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: sophgo@lists.linux.dev,
	linux-rtc@vger.kernel.org
Cc: Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-kernel@vger.kernel.org,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Subject: [PATCH v15] rtc: sophgo: add rtc support for Sophgo CV1800 SoC
Date: Wed,  7 May 2025 21:56:20 +0200
Message-ID: <20250507195626.502240-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
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
v15:
- the only patch in the series left
- dropped changes to MAINTAINERS file
v14:
- https://lore.kernel.org/lkml/gztsdu5p4tzt7emlwiuc3z74f4tfgkclcyrl324prqzp6dqhhf@ezrdmmhvf2nm/T/
- platform device name "cv1800-rtc" -> "cv1800b-rtc"
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


 drivers/rtc/Kconfig      |  12 +++
 drivers/rtc/Makefile     |   1 +
 drivers/rtc/rtc-cv1800.c | 218 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 232 insertions(+)
 create mode 100644 drivers/rtc/rtc-cv1800.c

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
+	{ .name = "cv1800b-rtc" },
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


