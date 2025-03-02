Return-Path: <linux-rtc+bounces-3358-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D43A4B491
	for <lists+linux-rtc@lfdr.de>; Sun,  2 Mar 2025 20:52:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 47B3A7A5572
	for <lists+linux-rtc@lfdr.de>; Sun,  2 Mar 2025 19:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEF6B1EE7BC;
	Sun,  2 Mar 2025 19:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MWeviYg7"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B431EDA29;
	Sun,  2 Mar 2025 19:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740945147; cv=none; b=HDrcUnfW0txMJ46XegNRJJy2+Js4XNXFSDp1REooMepyLZsxRbgjWDYNotb/PjLUEM5SrBvTqXUKn5cv2b4bpoY3eq9CXKturiKEwf+F11fcozNOej8DW7M0DLHYW5ie1xvy9bqpmpKk3TY9v7es1MsQwFVZKGCnen7hS8oFItE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740945147; c=relaxed/simple;
	bh=B80PE1Vm4MvBM3NpDwi1bHwpSg2maEdXzFPTVdHk5dQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UJrEz19QvVHDwL+EHxuzsD9Jqc7jWVy3IF3KgP4edjLiSq9FqJ2FTjeDnnguiBRFBokJkzo/ro/QXPxLe65P3qPIeMs5TO+LEE6MhtZhlU4WNhCa+oqFqWuYHQ6fIfZR6xlIBOiR7lWVWpbEInKoEWt/aVCsSbD0QB5FhEshswE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MWeviYg7; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-abf57138cfaso221451366b.1;
        Sun, 02 Mar 2025 11:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740945144; x=1741549944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=geqIJH4ZbhDfifYmudp+lR9EwCjUFtE9Nbs9m0I7Hhw=;
        b=MWeviYg7Lf0jDKVtwyucGbEYv7o8tItnFpF/qcK8KbT+5n276PC104ZwvCqhCHqqSp
         S0e0PjICWzDh2dgvIB8n/LAUtTgo2oW0DB046tUAjcFXpMBy+7rKib0PipO1l6WsZKBn
         l18gf3FwafpNBGjYnp/gqU2CWMJ6supADxq/Wbly0yjwwppk8T1aBB0COfu57Oj+EHe+
         QE3O7ouoa64ww97oDFWEyPYRA4CQ5HO0VnNt7BxVKa270VWeqHu3eYRsMOj5GP+7mKKD
         vXbefOOc5Iq7dZvhrZTdYnKINdEoM7upO2EwrVP6WyJmw/y7Wy74S/Ln27eukOhBiHqV
         F63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740945144; x=1741549944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=geqIJH4ZbhDfifYmudp+lR9EwCjUFtE9Nbs9m0I7Hhw=;
        b=CKPJ16lbHW/8JOG4fa9rF0P+yktYO9xZr/XyjWpqk7ts9D15o3mvbHlMwelzqL5d9y
         Sh5Qp7Q1Bnyjed8eXyEXo9pfkvQ+g1yk1uYWcmu9HwnJkf3Q48mKQv/RXzhYrYUtNg6U
         w63gfT3qXhDsS7Lfcd2WdRGBz/Dln8i0XcXFjDiLrky8O9hvsNb7SNtslW8N6etK1jeu
         5d1jehvk4MooNCGymCdhrlfCjgSNsavBwcFwFGOqx2okm5FF5XpLFhTdoVZcISg3ketC
         jQDAPjghI83cHzFNYVHEspbw5ftY/7ZCL5ZHfPqrH0BF2wZ1EHhNvbFBWbGoXhc0fn8Y
         FPgQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0dbcWDd59YQu+R3c+ZR3oVrM0sDtyIZ8wtglvDnmj1n0mJinvcO1J6EfqLLxgWJTu7RbEAJtxjGGC@vger.kernel.org, AJvYcCXSowxxk4PLlytgAF/06zAqrHQkdu4sbJgVN7Db+pBcnB71vO25giAN5fRHRAIlyszkngS/WrNkBeM0NBE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjkPOH5e748IWHMM1p8PoEmjZsI6EtTwBCAZqNRFqu0XnuiQlZ
	nGIbv2e81YdDcTmABAKdUmSS5DXV6MLaAj3FlO8mVcRy5W8bP0Mpe1bjzsu3
X-Gm-Gg: ASbGncto9s65718wIpkN20uZCBWPcjnJY0lhBqatad6tKhuhmjJW5/VWQeTeL/Fojwk
	yETvs2pZEKXm0GCXiSET2SxNXF6HIryHi5vrXsGCsMSpZaQ+MbacmGCAjPG/wUZ2UoNaw4T0MTD
	x1NtWptWUZanAu845NU6DPZ0MGwdS0TlfzOjJae+S246sDa8vt5z0VEwJRFhKOhzS0NHVCy2r1Y
	MB2GcpCKJpaRrql7Z7cWW43BVmnN3xNeNLDnIjuAd2GMDXtOg1Hmbajas+Tk8odCuHVlKrq2Vmo
	tcIEmz3LtzbmnRIWeO/ZbMSFIxrAtwa4oK3Ca8y/yXgHkBDtHd2lO8SVLg==
X-Google-Smtp-Source: AGHT+IEVQi87WpvJPE+ITZKW4KN8LE8ET2pDw7bFNwsDi7FEYME4D4Cx72dGVTss6isDxSYXAcgHKA==
X-Received: by 2002:a17:907:9620:b0:abe:f8c0:c1ab with SMTP id a640c23a62f3a-abf265d3be4mr1399615466b.46.1740945143564;
        Sun, 02 Mar 2025 11:52:23 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c43a5acdsm5809705a12.77.2025.03.02.11.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 11:52:23 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-rtc@vger.kernel.org
Cc: Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	dlan@gentoo.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	sophgo@lists.linux.dev,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Subject: [PATCH v12 3/3] rtc: sophgo: add rtc support for Sophgo CV1800 SoC
Date: Sun,  2 Mar 2025 20:51:56 +0100
Message-ID: <20250302195205.3183174-4-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250302195205.3183174-1-alexander.sverdlin@gmail.com>
References: <20250302195205.3183174-1-alexander.sverdlin@gmail.com>
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
index 446156998380..d4e0569da602 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22186,6 +22186,7 @@ M:	Inochi Amaoto <inochiama@outlook.com>
 T:	git https://github.com/sophgo/linux.git
 S:	Maintained
 F:	drivers/mfd/cv1800-rtcsys.c
+F:	drivers/rtc/rtc-cv1800.c
 N:	sophgo
 K:	sophgo
 
diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 0bbbf778ecfa..9da247ec4084 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1395,6 +1395,18 @@ config RTC_DRV_ASM9260
 	  This driver can also be built as a module. If so, the module
 	  will be called rtc-asm9260.
 
+config RTC_DRV_CV1800
+	tristate "Sophgo CV1800 RTC"
+	depends on MFD_CV1800_RTCSYS || COMPILE_TEST
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


