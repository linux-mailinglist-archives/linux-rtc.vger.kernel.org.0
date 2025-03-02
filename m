Return-Path: <linux-rtc+bounces-3357-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C0828A4B48D
	for <lists+linux-rtc@lfdr.de>; Sun,  2 Mar 2025 20:52:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF56D7A4FF5
	for <lists+linux-rtc@lfdr.de>; Sun,  2 Mar 2025 19:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51E321EE004;
	Sun,  2 Mar 2025 19:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bg07W/O1"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E831EB1B9;
	Sun,  2 Mar 2025 19:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740945146; cv=none; b=Fbbsz2pVtsH+JRRzj30JN/F/xzc8rf9QJ1RNZ+TM9sBWThabVPyijy42k6cPfhsc1/7yJHxtnHTYBowE6fuf74DTJ2eHvl5PWyTinIFoUl6WGAnYPzG5nUY0qr7yphwmCxOtr8ljNkjOcgrjekAhVhFT1ui2nmckGlrbRPYkKfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740945146; c=relaxed/simple;
	bh=UBLmED1236Hkrt5K8YwytJ8MX5lmhSsTZg1nQyDlAUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CaMAtG8TVOLxzHlVMob+RYeFlVS2r3pQmT9qb//vS6NbybYlP+PIGqLmOrzOElWgJK7vdGWW3XgFGPJpacv+wHm5669mzfmhCuw6qTPlixX8SyBOnAFowLKTbcPE8hAtQ3V6qR0ThXkWO07b59RWPSmhwI9s4xejIGQs7yI1mn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bg07W/O1; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e50de0b5easo1947231a12.3;
        Sun, 02 Mar 2025 11:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740945142; x=1741549942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tBIPfPR4UgxUw2DZuLDEZ4PWQB7JnRoO7gZczhX9Dz4=;
        b=Bg07W/O1eLf7K1ehDmqeJmEr6pXqv+j0SM+yvRd3riYS3x9DRKLOgnCxs2GGsDVITp
         /X/OCFiZR4esv0zZK7nxDEdTNzPzLWotSPgib5K/i8Vx+nGwt6gtY039prWWSrZAg1I3
         +5h/8S4F46ot8ihIIk/NAMKu333IKqI55n8FcIiDD6hGa7GpWK8JzCN1tJgdLUFeDAmT
         7pOhurf3CZcfTinjToaA/7s6N142XQKlTI2pWYdGAQGbM5z+THg6/9vHJVuLTV3EvFJN
         o+bvUYpY2Q1PJ6Z0wIVuUORFhCPqSsOwIGuuXgpQQJ/OKHAy4jKkIvycMtFLADszDwWJ
         6iNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740945142; x=1741549942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tBIPfPR4UgxUw2DZuLDEZ4PWQB7JnRoO7gZczhX9Dz4=;
        b=lzHl/+suvt9tc0AZDtp/Wk2n6r/t0sFWMtcN8I8WvfIlVTqafLha7QeX/xjoKZLN8b
         7qwqfhA/+Qk7vfxF02HzIUNIJDlBdwmTJnT2XBK8xCk7iLHSU0aoRmWfhJBzdMA7rTuf
         TIu6FhWe3Ma25MczpoG1UIlsSUxCGxSx0Io1jUFnVG+FJEXczikXyEspMmL0U6d6+Jne
         MsquYADJcVVjqNnyC8KcwNbxjJTidK8nvwxXwUsu4xlU/MFYmrMWa3NMYoBVsSXzNPZl
         Y7s8sMVhxr/Zp6hpzoirj/QNJAceaN8/FMR2cOvEp1GQGkzfklO+Qu4CxRYkyJTb9rPh
         uUJA==
X-Forwarded-Encrypted: i=1; AJvYcCWKGe3AR1C6b1pDg/MLSwMdtzxs6RMzR/4hkLhwV1nAdy3Et6i8C4tYuFwpvYiSnQGIeEhUfRoMmhtC@vger.kernel.org, AJvYcCX2y0AbdAslnkA2StJCD4bpuiIr5caPrRFsPUTiklRZ+VUBUwdsc+Do4jLOH2Ug0d3Kb4QpqOfxJ8x5Fa0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyK74mPmd8doqUKJsemHTp1Z4H7Ljnb1rHNyv+WHJNdNaAxrDg0
	QuSpZ507elbSyIEcUynoQSdzCFXTSVfXVtVSv0xta6WLQ6xEU5546H2bCWGv
X-Gm-Gg: ASbGncuKi2x1ny6zlBGsPTCyh5nDtetB5/5mi9jZqxDeFaH7WpvKwn86ULSB3nB4Bt0
	RrXf+bHl3DdTItXXScj2/x2tAC8IvZ8PFAfIRNxV/O1lHNHxr0n5Xn43addevf6qbNShqneMsCq
	NAMBZbxZpK7dGapUmVux+Kdv1fnjImyZoH22YG7y7PWhxIR439qcWGfPVkYMr05DuVv4JaFLbW6
	heSp0U2KwgrMtQZ2oEgifj4QD9Mgw8kNbe7CRBwIaxKeBw/LcarSk25KuG+2Zz+rokguSGKEjc2
	nx/P+vCUPkG6z9MsI81PEYKfspslaRk6pqg73tKsI0mGcqKkP2eR7tUGag==
X-Google-Smtp-Source: AGHT+IFuq//yKaBD8TJ1fGUNSicZNMgRwkWcmO30Mxpb/rZWbY3IEDKofA4wWgUEzTrF67UfWfThGw==
X-Received: by 2002:a05:6402:3715:b0:5e0:5605:211a with SMTP id 4fb4d7f45d1cf-5e4d6b0e4admr12438605a12.18.1740945142275;
        Sun, 02 Mar 2025 11:52:22 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c43a5acdsm5809705a12.77.2025.03.02.11.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 11:52:21 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-rtc@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	dlan@gentoo.org,
	linux-kernel@vger.kernel.org,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	sophgo@lists.linux.dev
Subject: [PATCH v12 2/3] mfd: sophgo: cv1800: rtcsys: New driver (handling RTC only)
Date: Sun,  2 Mar 2025 20:51:55 +0100
Message-ID: <20250302195205.3183174-3-alexander.sverdlin@gmail.com>
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

Add driver for Sophgo CV1800 series SoC RTC MFD. The RTC module comprises
a 32kHz oscillator, Power-on-Reset (PoR) sub-module, HW state machine to
control chip power-on, power-off and reset. Furthermore, the 8051 subsystem
is located within RTCSYS including associated SRAM block.

This patch only populates RTC sub-device.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v12:
- new patch

 MAINTAINERS                 |  1 +
 drivers/mfd/Kconfig         | 14 ++++++++
 drivers/mfd/Makefile        |  1 +
 drivers/mfd/cv1800-rtcsys.c | 66 +++++++++++++++++++++++++++++++++++++
 4 files changed, 82 insertions(+)
 create mode 100644 drivers/mfd/cv1800-rtcsys.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 92fc0eca7061..446156998380 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22185,6 +22185,7 @@ M:	Chen Wang <unicorn_wang@outlook.com>
 M:	Inochi Amaoto <inochiama@outlook.com>
 T:	git https://github.com/sophgo/linux.git
 S:	Maintained
+F:	drivers/mfd/cv1800-rtcsys.c
 N:	sophgo
 K:	sophgo
 
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 6b0682af6e32..842cc4d95c4b 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -285,6 +285,20 @@ config MFD_CS42L43_SDW
 	  Select this to support the Cirrus Logic CS42L43 PC CODEC with
 	  headphone and class D speaker drivers over SoundWire.
 
+config MFD_CV1800_RTCSYS
+	tristate "Sophgo CV1800 RTC MFD"
+	depends on ARCH_SOPHGO || COMPILE_TEST
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
 config MFD_MADERA
 	tristate "Cirrus Logic Madera codecs"
 	select MFD_CORE
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 9220eaf7cf12..3cf03ffeedbb 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -18,6 +18,7 @@ obj-$(CONFIG_MFD_CROS_EC_DEV)	+= cros_ec_dev.o
 obj-$(CONFIG_MFD_CS42L43)	+= cs42l43.o
 obj-$(CONFIG_MFD_CS42L43_I2C)	+= cs42l43-i2c.o
 obj-$(CONFIG_MFD_CS42L43_SDW)	+= cs42l43-sdw.o
+obj-$(CONFIG_MFD_CV1800_RTCSYS)	+= cv1800-rtcsys.o
 obj-$(CONFIG_MFD_ENE_KB3930)	+= ene-kb3930.o
 obj-$(CONFIG_MFD_EXYNOS_LPASS)	+= exynos-lpass.o
 obj-$(CONFIG_MFD_GATEWORKS_GSC)	+= gateworks-gsc.o
diff --git a/drivers/mfd/cv1800-rtcsys.c b/drivers/mfd/cv1800-rtcsys.c
new file mode 100644
index 000000000000..72d11284f1de
--- /dev/null
+++ b/drivers/mfd/cv1800-rtcsys.c
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for Sophgo CV1800 series SoC RTC MFD
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
+static const struct mfd_cell cv1800_rtcsys_rtc_subdev =
+	MFD_CELL_NAME("cv1800-rtc");
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
+MODULE_DESCRIPTION("Sophgo CV1800 series SoC RTC MFD driver");
+MODULE_LICENSE("GPL");
-- 
2.48.1


