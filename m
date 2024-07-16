Return-Path: <linux-rtc+bounces-1510-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EC59323F2
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Jul 2024 12:31:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F65A281C06
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Jul 2024 10:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEA231990D2;
	Tue, 16 Jul 2024 10:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="DPcIsWxu"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD14198E79
	for <linux-rtc@vger.kernel.org>; Tue, 16 Jul 2024 10:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721125842; cv=none; b=nXCmV+ylulmek32VwK4G/dFfyJ95DSgalT5fxJZfUOqVEL+MtRELoMay4jrFsuyZ9NOEsAcM5PJ6cnqSISwjh1hUCLBTwA+zF9Ye2SdL/raOds9xEVq50Mux0lJV1Qce6H+ksvzqnI99uuU2wfKpu2beIwJNGkChtEfpZQ0mvv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721125842; c=relaxed/simple;
	bh=ETbaEy+22ovLXxvQSezV0AojhPWcArdMl1tGqum6kSo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZMgWYny42tH4ulUFevBkQGphtjahlb9LrPW9GbFBiuuGBJFY/6wqPnJ8UioHfP6Fh9U1ZqttJe4PQ8LXuxwGBexFNGYzcLukR6iOyJpwfWGyxIzf0QYT7Q8OdccJlz0Whr7B+q3z1cf/iF0kVSkAjGqrhETE0wZ4C1oNheOvc6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=DPcIsWxu; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4266182a9d7so33988265e9.0
        for <linux-rtc@vger.kernel.org>; Tue, 16 Jul 2024 03:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1721125839; x=1721730639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wPLuLQoZENDdi//jkP+m+sJa9j1xpR49CY9yYB9V7TA=;
        b=DPcIsWxuwG8P75V5sKvvArZAw9qjJDM/yoQh1DyTPjJnX5b4XuZEsYAiwg0pa4jC1Q
         nc+xx+FE6CObIP7d6IYnFjxPeiyBsLbZnb6VwVAJe/AJ1uljZinzRFOPinr5pDYLDAoR
         2UM0o6yeM5C7a7T/IIarTi10RFc9Sg6q9arRm68wqUsY4KuUJXEkPCeRIKnhtHwfA0Lw
         GchrqtoR2YRwSyBC1grcSQ2U1CSjtYv5uDUk2vyds9CUTTHQvMtU8wlX2Q/BtNamfChJ
         ZXxQ4PZWjZ+NHVlYYUlyLLg09jD1wMRs2zjXrOhCFj/BhOTy00GK9EmZ0Q18Y2ElERGk
         DzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721125839; x=1721730639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wPLuLQoZENDdi//jkP+m+sJa9j1xpR49CY9yYB9V7TA=;
        b=LKCGd14A0aUbyzqw4eCMuRd8fu/CVlUevoB66ew/OkLOVOjkNuTiMf68UDQMTcHUXa
         WSkihWgFfS95W8IgUmsiOTxZs/5Z3c/1Z5YkGZEDuhm23qRNcOcsxdHEoZWwQLCjABM+
         VT/mJqqZW0q4ONTePVkjEA+urdfYLa4h4tXTKGUCKHGwgnM+6RdAT15y0V4amFsgGmHP
         pyiV+l9vpppMgGCCBHkIByr7vTswUcAEh1SuGMfhsNR7CrlIAodLM1pUrJsi/ZlUvEr9
         G6KNvPfh9c5ywG/8r+B+KqWNATF4Q9Ld6RdaUTobV5q2dWxH87z2Rgmt/+qcrXysMtCF
         +UAw==
X-Forwarded-Encrypted: i=1; AJvYcCVqo5EhvcxepUftpNlz5Fda3ny6UTHTFtPuJAXOa5SSb6b6Cm4CNbrvGYQf/Uhi38RHuoaQ3Z55gwfEBVkSD6xLwVYh9idtl+lh
X-Gm-Message-State: AOJu0YxMfbKDC3o/ancEJbPIXnAb9rxKPhdk3//EyhMAqSUJlpsLUMA2
	nyR0YYmwA/vs6/5owW1XteaXIGc8xElPN/Lc6hXwsFmX72d3oC9LeDH00J3EhCU=
X-Google-Smtp-Source: AGHT+IHVW6yRfdgEc3IWW0j9GtIckJ7vtGhNTVh5Ka58Ken968QRPKCQQvNko4nwFp7mgOiOKSesPg==
X-Received: by 2002:a05:600c:4e92:b0:426:5cee:4abc with SMTP id 5b1f17b1804b1-427ba691136mr12483235e9.20.1721125839410;
        Tue, 16 Jul 2024 03:30:39 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5e77488sm121546145e9.9.2024.07.16.03.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 03:30:38 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 02/11] mfd: renesas-vbattb: Add a MFD driver for the Renesas VBATTB IP
Date: Tue, 16 Jul 2024 13:30:16 +0300
Message-Id: <20240716103025.1198495-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240716103025.1198495-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240716103025.1198495-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Renesas VBATTB IP has logic to control the RTC clock, tamper detection
and a small 128B memory. Add a MFD driver to do the basic initialization
of the VBATTB IP for the inner components to work.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none; this driver is new

 drivers/mfd/Kconfig          |  8 ++++
 drivers/mfd/Makefile         |  1 +
 drivers/mfd/renesas-vbattb.c | 78 ++++++++++++++++++++++++++++++++++++
 3 files changed, 87 insertions(+)
 create mode 100644 drivers/mfd/renesas-vbattb.c

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index bc8be2e593b6..df93e8b05065 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1383,6 +1383,14 @@ config MFD_SC27XX_PMIC
 	  This driver provides common support for accessing the SC27xx PMICs,
 	  and it also adds the irq_chip parts for handling the PMIC chip events.
 
+config MFD_RENESAS_VBATTB
+	tristate "Renesas VBATTB driver"
+	depends on (ARCH_RZG2L && OF) || COMPILE_TEST
+	select MFD_CORE
+	help
+	  Select this option to enable Renesas RZ/G3S VBATTB driver which
+	  provides support for the RTC clock, tamper detector and 128B SRAM.
+
 config RZ_MTU3
 	tristate "Renesas RZ/G2L MTU3a core driver"
 	depends on (ARCH_RZG2L && OF) || COMPILE_TEST
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 02b651cd7535..cd2f27492df2 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -186,6 +186,7 @@ pcf50633-objs			:= pcf50633-core.o pcf50633-irq.o
 obj-$(CONFIG_MFD_PCF50633)	+= pcf50633.o
 obj-$(CONFIG_PCF50633_ADC)	+= pcf50633-adc.o
 obj-$(CONFIG_PCF50633_GPIO)	+= pcf50633-gpio.o
+obj-$(CONFIG_MFD_RENESAS_VBATTB)	+= renesas-vbattb.o
 obj-$(CONFIG_RZ_MTU3)		+= rz-mtu3.o
 obj-$(CONFIG_ABX500_CORE)	+= abx500-core.o
 obj-$(CONFIG_MFD_DB8500_PRCMU)	+= db8500-prcmu.o
diff --git a/drivers/mfd/renesas-vbattb.c b/drivers/mfd/renesas-vbattb.c
new file mode 100644
index 000000000000..5d71565b8cbf
--- /dev/null
+++ b/drivers/mfd/renesas-vbattb.c
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * VBATTB driver
+ *
+ * Copyright (C) 2024 Renesas Electronics Corp.
+ */
+
+#include <linux/mod_devicetable.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+
+static int vbattb_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct reset_control *rstc;
+	int ret;
+
+	rstc = devm_reset_control_array_get_exclusive(dev);
+	if (IS_ERR(rstc))
+		return PTR_ERR(rstc);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return ret;
+
+	ret = reset_control_deassert(rstc);
+	if (ret)
+		goto rpm_put;
+
+	platform_set_drvdata(pdev, rstc);
+
+	ret = devm_of_platform_populate(dev);
+	if (ret)
+		goto reset_assert;
+
+	return 0;
+
+reset_assert:
+	reset_control_assert(rstc);
+rpm_put:
+	pm_runtime_put(dev);
+	return ret;
+}
+
+static void vbattb_remove(struct platform_device *pdev)
+{
+	struct reset_control *rstc = platform_get_drvdata(pdev);
+
+	reset_control_assert(rstc);
+	pm_runtime_put(&pdev->dev);
+}
+
+static const struct of_device_id vbattb_match[] = {
+	{ .compatible = "renesas,r9a08g045-vbattb" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, vbattb_match);
+
+static struct platform_driver vbattb_driver = {
+	.probe = vbattb_probe,
+	.remove_new = vbattb_remove,
+	.driver = {
+		.name = "renesas-vbattb",
+		.of_match_table = vbattb_match,
+	},
+};
+module_platform_driver(vbattb_driver);
+
+MODULE_ALIAS("platform:renesas-vbattb");
+MODULE_AUTHOR("Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>");
+MODULE_DESCRIPTION("Renesas VBATTB driver");
+MODULE_LICENSE("GPL");
-- 
2.39.2


