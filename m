Return-Path: <linux-rtc+bounces-3508-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 04477A632BF
	for <lists+linux-rtc@lfdr.de>; Sat, 15 Mar 2025 23:49:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 66C267A8845
	for <lists+linux-rtc@lfdr.de>; Sat, 15 Mar 2025 22:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 021761C84A6;
	Sat, 15 Mar 2025 22:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ej6dHtno"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF741A23AD;
	Sat, 15 Mar 2025 22:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742078970; cv=none; b=NdfCA56QYgGJCReDfHA0vGK6orSDhYce6gVm0hRRFEzxqYUhZMp/KCEkK43NFB6l5Klhs5OFMPMbpr4i/70t3lTR1wHfKSgDo/C9pQy/ehXazNE4F92Tdij1Do/lTXv8TAo6dsLhe1jCoH1IEIO4SgdhXhVYZ0Vq4UQnR4K83io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742078970; c=relaxed/simple;
	bh=U8t57nZLwFK6PPGjQ8PzzY+8JraTkbKjs1mBleewIVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b2Mblx60JPhjIbHoaCoWv7HEDkXPlKr19VbbpnOzkwJ06Y8CWvwJCJZwYohyYCHZJVvxxEDKvryj2psfuhC0I0d5FpZcW4g1nePMDXuWAd9TZplsST6cgeC3f3QuhlTm+WQbv240I9bRFvEG5aXyQfB51IIDxQ9bNrKFjBYO1qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ej6dHtno; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e6f4b3ebe5so5694427a12.0;
        Sat, 15 Mar 2025 15:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742078967; x=1742683767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nug7jayKl8l2iBeYI/mQ4BwgeetvmfA+QYLNvW8wCpc=;
        b=ej6dHtno90o481FHAbKtZxteN4qhMPLw2o3ibMVUfujCiWKu5L5ToNEASdKnDQfglO
         kTI82vYl1iRUXvFCoQsMaXba0JzEsNgPH+rErZo2bYwLbSOJ5tmw6y4vroZNakzCgokL
         Pq1YIyU+b3DjucngKtaqtlQ/KxKJeH4d996sHkQ5adD89GqhgJh3xWGdOWYE6j/MkdKp
         ROptBK2oZKJs1Hj13YakfD3OxQghCY3K5i0VYyAhUIf3VKQWRXrSfRXNbdINw+XKdAuH
         ejGnv39WWe8NviFqKDdaE16fXdQO/mTNx7adTkOhqH+2EyPwoEcI8jKcl9BZdLCnW0HL
         HaAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742078967; x=1742683767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nug7jayKl8l2iBeYI/mQ4BwgeetvmfA+QYLNvW8wCpc=;
        b=pYPQQk92oH+RhGUPMl+wREN/b5aZE4dx4oGyMXM49JIxWjjx1uFHKiDtOGv4zmPZaf
         YYrOGp051a+Z6gl8qfzLNxj4mKt6ChcsRKDYIxopXGcfJxSC5SWAdi3B6ziw5l8NjE8G
         mm1fI2ypNorC5te8zYZIFPXBc0IWs8GU+uzQdDiVAKGpoU375MB4o9hRtEiZT610dKuN
         uxX+RD9FuOVxM/573LuLqLNZiLy4ExPEBSZehQTfWik/TKMDmG3Xhy7cy9dCZurJHbg+
         k0mgVy4Mg6WPezETHN+4kOGQhZ2ZMWkS/hANMHiHwJwzdDUpMUVvgQOB6Of9EA1hKXUU
         484A==
X-Forwarded-Encrypted: i=1; AJvYcCU3J2tf0oyvpaGPkeaKGQge9vPy3qb/Hf2O/L/sPfl9wNBpQLqRc3UMIBQKkT8GbW6Thmf+XqK2Q9JZ@vger.kernel.org, AJvYcCUjD8Jb2i+Z6dJj04u4p22bCT9Zjaptonh84aqzKxVdNGrSvEy9seVlM8CG/3lkOaKA5IhnnFaEKgTR62de@vger.kernel.org, AJvYcCWzBxiSQRq+SVVQLBhcDCbfurcWkQr/9eT9YTxK4CyN8fXpFMJ4lwv/G/W2cH8Ap4r0I1iNqlnP5c3I@vger.kernel.org
X-Gm-Message-State: AOJu0YzMzttX1AY5PbK3SnzSWZqPK2Or10k+m0XFZ2NtdJelPXW3CnH6
	5rXsT2cmSHpq8KCotYtknp5b8J2IVNPA2YQcsodL2lQ0groyOEmK
X-Gm-Gg: ASbGncvzGk1px6sjaEry/u6wjNgdkPl1bVsKqqfFd1tOZJt3NaKrEgcfC3r1Sc8Oytw
	0FUcqYTayJ5sgpWmBJitnAIRA8q9hpCxld4/WIkFurCvamVSTXJMEHY92ehmgnSgq5vI67b9lLn
	r1qsDKnXD6BzckNGxI6dO/X4VyYpAQg0Agh4s7S+ohZu8kpFshGj1W9gdnl7v9BtZGNHqWDDwEZ
	YU5nMh4WMGcBU0XAKhPUDJh3ZXfa4y6gscWj9Z2LhFaGNZKWqIin6jrZgsQFLOW14nUOV2r6wsJ
	Ii2jcDNLYKLymvsj7e/Ob8Ioz8osCeV4rzrX2NXkr1nJuxOY3TewrvXw5w==
X-Google-Smtp-Source: AGHT+IG2H7DhKVvR7WttZfYnmI/NT3GgvADoWlUJyxvS3Zc8Lbo8pm2sWfgDnCAhYjqx6VsSEhNLzw==
X-Received: by 2002:a05:6402:5251:b0:5e0:9390:f0d2 with SMTP id 4fb4d7f45d1cf-5e8a0228606mr7374898a12.20.1742078967312;
        Sat, 15 Mar 2025 15:49:27 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e8169b160dsm3775586a12.41.2025.03.15.15.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 15:49:27 -0700 (PDT)
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
Subject: [PATCH v14 2/3] soc: sophgo: cv1800: rtcsys: New driver (handling RTC only)
Date: Sat, 15 Mar 2025 23:49:13 +0100
Message-ID: <20250315224921.3627852-3-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250315224921.3627852-1-alexander.sverdlin@gmail.com>
References: <20250315224921.3627852-1-alexander.sverdlin@gmail.com>
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
v14:
- Dropped MAINTAINERS F: entry in favour of the existing N: entry
- mfd_cell name "cv1800-rtc" -> "cv1800b-rtc"
- Removed Cvitek brand from Kconfig
- Not built by default if COMPILE_TEST
v13:
- Moved the driver from MFD into SOC subsystem
- Dropped unused "cv1800_rtcsys_rtc_subdev"
v12:
- new patch

 drivers/soc/Kconfig                |  1 +
 drivers/soc/Makefile               |  1 +
 drivers/soc/sophgo/Kconfig         | 23 ++++++++++++
 drivers/soc/sophgo/Makefile        |  3 ++
 drivers/soc/sophgo/cv1800-rtcsys.c | 63 ++++++++++++++++++++++++++++++
 6 files changed, 93 insertions(+)
 create mode 100644 drivers/soc/sophgo/Kconfig
 create mode 100644 drivers/soc/sophgo/Makefile
 create mode 100644 drivers/soc/sophgo/cv1800-rtcsys.c

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
@@ -0,0 +1,23 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Sophgo SoC drivers
+#
+
+if ARCH_SOPHGO || COMPILE_TEST
+menu "Sophgo SoC drivers"
+
+config SOPHGO_CV1800_RTCSYS
+	tristate "Sophgo CV1800 RTC MFD"
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
+		.name = "cv1800b-rtc",
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


