Return-Path: <linux-rtc+bounces-3439-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA4BA58826
	for <lists+linux-rtc@lfdr.de>; Sun,  9 Mar 2025 21:27:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 755EF16912D
	for <lists+linux-rtc@lfdr.de>; Sun,  9 Mar 2025 20:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35DDB21B9FB;
	Sun,  9 Mar 2025 20:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NUKuf7cC"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB8721B190;
	Sun,  9 Mar 2025 20:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741552011; cv=none; b=hs4F4KMbZg7raVt1RUwytw913+mTRCEZIQPoHr9B9Oorr3AW4gmwEYxROV7tRw1PvWHONrsco8Zv4a71k0fulTTHR+oNtFviUi0UZ9KKVDZm19Mh2FvOwzZ41Rv6Zmtd+bAMeEjA4YDmnna7dagvFzlK+CU2T/y2cgCy8yCwi94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741552011; c=relaxed/simple;
	bh=7VX1BSlvhenQSbquGdgx+W88iFUaSsE3inny0vBm9As=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MW1EDbuCrMeNHLU2C04b4QqveJnge7Fq8TmRSTFJ0yYA5c7ygpnFrPOLdfhIFdtOGekgbblTKx0SwZMwFmkehfk7gK3IpmZpOyfRsA4oln9HOfrER1/wEX2raD9++V4cPogZtRHnxxr0zZk+xzn/xWhLiu/T8SVE6+Ta5cssZIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NUKuf7cC; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aaec111762bso679162866b.2;
        Sun, 09 Mar 2025 13:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741552007; x=1742156807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gw7/cRMLqRZEOHmaQSQc8kR2LyWY/sX3ioRlmxvefbM=;
        b=NUKuf7cCywlUG84eiNVrEGdmZXVlS/r+ZaoPI5iOsW3XNZZzirALYCSgx3GYyLrYwD
         vTzkfOVTHVSjPbW+SbXTKOZyNGKKJ3QttT/rCTB4fDi6Fzmp8g6mw/fUdMzLKu0EYoXu
         DRRuQ76qjYmkN+ARHiYL3uRV+/nyXjdA7mkAzNEm6F0ZvMBt/vO8nzLWpaRxEcYlTDUb
         1Hiy5IqHxiswaIl5wwl4rN58u3wmVBGm2zDvS3qcyh51FN8Iy0lbf+xFRzS2NUP/ZahL
         a6y2kV0DH0V3LlcC0CA8JMvehcLhZQ+Kf9JlbrrMFL0dorpaV3cgelT71IapbU5XO7ZK
         WgtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741552007; x=1742156807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gw7/cRMLqRZEOHmaQSQc8kR2LyWY/sX3ioRlmxvefbM=;
        b=c5+C3f+XEJ/hAm+ag2O0l0s3UNCQ4x8wg/tnZzC3VvIPWUHAsf+f4vHZmOPPr6rF3b
         FVPsVfgOqhp9axGgQvbjs2EaFh1PNWBVWSuZ5y6/WkSf8nYRz1cKDs6nS1jrWR/74idS
         b10VitRREdUWc88GedF7e6OgZcBUmO/5Pil1OKm4b4boJhuiEXTauztwsY6pISm1mH+Z
         ew8YgVar/jMSH0WyXmAyETRFFQxOp495d+WOw6DpbLkP+Y8HeLimB8I9bgZFQ91vXS0i
         ErLjBqUJ3oPQYmy8+yj/qZhNbO2NxQ3Gb/wpaDNG4Ze8tNqCygVj65fzN2Lah+YSup1G
         I18Q==
X-Forwarded-Encrypted: i=1; AJvYcCUAV1Vs3RFJ3NOoLR++KNCR58c8F5+E6EylEI8Eksg77c41lVHQayXSfV9dcH0KZkToMD7q1M9aaXrc@vger.kernel.org, AJvYcCWR6JqxLF18e1EyWPU2Vkm4KHS1/8fHUYoKtDLMcI03IlOJ/0Xt7aYk5Gu7uJO4QMRbt84+WLsH4lWa@vger.kernel.org, AJvYcCXZncNpNzw6nidUM6+MnTeTaNRq+7tZ0cl6zSHoWg8yO8OxjCy6A2Yv6bI533BLPnZVDKPQvacNQkXgR6bg@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6uSWQlH/+xLc990JaZQhC+h3bzpeHGg/hZWTpYSh5WvfRoUUI
	5humFr2kG6R3LS5I0pgnDEnlu8Q9MoHZy00pK3U/zSof2Io8mLHk
X-Gm-Gg: ASbGncsjUeKFqL1CvHFeAlpXB9MmCAtIaNLT++q27hJ36ymN4uhtaRITRUUEbov7LRU
	0OttS+fNlvWhs7XFIFquUlfPuwAR9Dno9UmYsGkSwhnMLtVVcQ9pwAePzvCT7iCKbPIjoe/OcVU
	U//lQbnwbTbrY8/3HFZPHWf40/dmNLpQi8hmOc0zYzIZhsK6r6jV2g/wn7KNK93crIcyw1i2TgE
	SyZWl4FxwROgOyzMqH/oOMkgUvQbGGdSq49DhqfjLMPmZjeCUdsNlK4NewT+HM+kM6jYSORYfo/
	dgFAVNP6Yc6Bq3WEnjquHDiBBe4hDojDRhWhhkCJ07LybydctvVX3Vj2fg==
X-Google-Smtp-Source: AGHT+IGAXfaXpuQ14waj4NhT86vpzngczi5+WF0SSRJjHCh71cfkSjOTmMNuBVqn+diVxJcamNjEVg==
X-Received: by 2002:a17:906:eecd:b0:ac2:4bf9:bf87 with SMTP id a640c23a62f3a-ac252e97382mr1502763366b.34.1741552007124;
        Sun, 09 Mar 2025 13:26:47 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac27c7e29bbsm281833966b.92.2025.03.09.13.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 13:26:46 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: sophgo@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rtc@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Yangyu Chen <cyy@cyyself.name>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v13 2/3] soc: sophgo: cv1800: rtcsys: New driver (handling RTC only)
Date: Sun,  9 Mar 2025 21:26:24 +0100
Message-ID: <20250309202629.3516822-3-alexander.sverdlin@gmail.com>
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

Add driver for Sophgo CV1800 series SoC RTC subsystem. The RTC module
comprises a 32kHz oscillator, Power-on-Reset (PoR) sub-module, HW state
machine to control chip power-on, power-off and reset. Furthermore, the
8051 subsystem is located within RTCSYS including associated SRAM block.

This patch only populates RTC sub-device.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v13:
- Moved the driver from MFD into SOC subsystem
- Dropped unused "cv1800_rtcsys_rtc_subdev"
v12:
- new patch

 MAINTAINERS                        |  1 +
 drivers/soc/Kconfig                |  1 +
 drivers/soc/Makefile               |  1 +
 drivers/soc/sophgo/Kconfig         | 24 ++++++++++++
 drivers/soc/sophgo/Makefile        |  3 ++
 drivers/soc/sophgo/cv1800-rtcsys.c | 63 ++++++++++++++++++++++++++++++
 6 files changed, 93 insertions(+)
 create mode 100644 drivers/soc/sophgo/Kconfig
 create mode 100644 drivers/soc/sophgo/Makefile
 create mode 100644 drivers/soc/sophgo/cv1800-rtcsys.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 3eee238c2ea2..ac15e448fffb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22354,6 +22354,7 @@ L:	sophgo@lists.linux.dev
 W:	https://github.com/sophgo/linux/wiki
 T:	git https://github.com/sophgo/linux.git
 S:	Maintained
+F:	drivers/soc/sophgo/cv1800-rtcsys.c
 N:	sophgo
 K:	sophgo
 
diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
index 6a8daeb8c4b9..11e2383c0654 100644
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@ -23,6 +23,7 @@ source "drivers/soc/qcom/Kconfig"
 source "drivers/soc/renesas/Kconfig"
 source "drivers/soc/rockchip/Kconfig"
 source "drivers/soc/samsung/Kconfig"
+source "drivers/soc/sophgo/Kconfig"
 source "drivers/soc/sunxi/Kconfig"
 source "drivers/soc/tegra/Kconfig"
 source "drivers/soc/ti/Kconfig"
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index 2037a8695cb2..0381a0abdec8 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -29,6 +29,7 @@ obj-y				+= qcom/
 obj-y				+= renesas/
 obj-y				+= rockchip/
 obj-$(CONFIG_SOC_SAMSUNG)	+= samsung/
+obj-y				+= sophgo/
 obj-y				+= sunxi/
 obj-$(CONFIG_ARCH_TEGRA)	+= tegra/
 obj-y				+= ti/
diff --git a/drivers/soc/sophgo/Kconfig b/drivers/soc/sophgo/Kconfig
new file mode 100644
index 000000000000..e50666e423a9
--- /dev/null
+++ b/drivers/soc/sophgo/Kconfig
@@ -0,0 +1,24 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Sophgo/Cvitek SoC drivers
+#
+
+if ARCH_SOPHGO || COMPILE_TEST
+menu "Sophgo/Cvitek SoC drivers"
+
+config SOPHGO_CV1800_RTCSYS
+	tristate "Sophgo CV1800 RTC MFD"
+	default y if COMPILE_TEST
+	select MFD_CORE
+	help
+	  If you say yes here you get support the RTC MFD driver for Sophgo
+	  CV1800 series SoC. The RTC module comprises a 32kHz oscillator,
+	  Power-on-Reset (PoR) sub-module, HW state machine to control chip
+	  power-on, power-off and reset. Furthermore, the 8051 subsystem is
+	  located within RTCSYS including associated SRAM block.
+
+	  This driver can also be built as a module. If so, the module will be
+	  called cv1800-rtcsys.
+
+endmenu
+endif
diff --git a/drivers/soc/sophgo/Makefile b/drivers/soc/sophgo/Makefile
new file mode 100644
index 000000000000..8f22b4e79311
--- /dev/null
+++ b/drivers/soc/sophgo/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_SOPHGO_CV1800_RTCSYS)	+= cv1800-rtcsys.o
diff --git a/drivers/soc/sophgo/cv1800-rtcsys.c b/drivers/soc/sophgo/cv1800-rtcsys.c
new file mode 100644
index 000000000000..cb271f02afcc
--- /dev/null
+++ b/drivers/soc/sophgo/cv1800-rtcsys.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for Sophgo CV1800 series SoC RTC subsystem
+ *
+ * The RTC module comprises a 32kHz oscillator, Power-on-Reset (PoR) sub-module,
+ * HW state machine to control chip power-on, power-off and reset. Furthermore,
+ * the 8051 subsystem is located within RTCSYS including associated SRAM block.
+ *
+ * Copyright (C) 2025 Alexander Sverdlin <alexander.sverdlin@gmail.com>
+ *
+ */
+
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/property.h>
+
+static struct resource cv1800_rtcsys_irq_resources[] = {
+	DEFINE_RES_IRQ_NAMED(0, "alarm"),
+};
+
+static const struct mfd_cell cv1800_rtcsys_subdev[] = {
+	{
+		.name = "cv1800-rtc",
+		.num_resources = 1,
+		.resources = &cv1800_rtcsys_irq_resources[0],
+	},
+};
+
+static int cv1800_rtcsys_probe(struct platform_device *pdev)
+{
+	int irq;
+
+	irq = platform_get_irq_byname(pdev, "alarm");
+	if (irq < 0)
+		return irq;
+	cv1800_rtcsys_irq_resources[0].start = irq;
+	cv1800_rtcsys_irq_resources[0].end = irq;
+
+	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
+				    cv1800_rtcsys_subdev,
+				    ARRAY_SIZE(cv1800_rtcsys_subdev),
+				    NULL, 0, NULL);
+}
+
+static const struct of_device_id cv1800_rtcsys_of_match[] = {
+	{ .compatible = "sophgo,cv1800b-rtc" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, cv1800_rtcsys_of_match);
+
+static struct platform_driver cv1800_rtcsys_mfd = {
+	.probe	= cv1800_rtcsys_probe,
+	.driver	= {
+		.name		= "cv1800_rtcsys",
+		.of_match_table	= cv1800_rtcsys_of_match,
+	},
+};
+module_platform_driver(cv1800_rtcsys_mfd);
+
+MODULE_AUTHOR("Alexander Sverdlin <alexander.sverdlin@gmail.com>");
+MODULE_DESCRIPTION("Sophgo CV1800 series SoC RTC subsystem driver");
+MODULE_LICENSE("GPL");
-- 
2.48.1


