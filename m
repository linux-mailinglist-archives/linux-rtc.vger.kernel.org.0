Return-Path: <linux-rtc+bounces-4770-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C6BB380CD
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Aug 2025 13:23:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 382EE16EAAE
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Aug 2025 11:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4717350D65;
	Wed, 27 Aug 2025 11:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V4qmCjpM"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D7334F468;
	Wed, 27 Aug 2025 11:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756293794; cv=none; b=ZizwBiaZhF/3cEWasmRBmLhbYpA7B/qcpsTlkJJAfz/pi3VQmJyp+1q38lInpJDrdIeIszw0gUXC7M3J34xJF7yykR3hDCFWxoXmSnitAZid4B9AHZ4mf23PQ9sZ3Jn4z6+oFuBoAUdUaxDmVE0b19k+qOBs91m9CAPhclQD0aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756293794; c=relaxed/simple;
	bh=kOHCh1tmOZfsjtAJTxIUfVW8g8Mep1vWd7pXV+GQ63g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=umcmWMx5XSxJUlFWZh2ha0xrvHWO/CCRZBNMNeQ9TaV29fmssUBWgV1yeQ36YrDUJG9MaBUx0O0aQBdNBu/SWMDrih3I25GEUIy4Qp5XPJvJBejY/UON/8VXmWQQ/fqhyWPHSBOcz8tBvHLO44MkIW7n/RIiBMF4+CleOaCdxAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V4qmCjpM; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-770530175a6so2380440b3a.3;
        Wed, 27 Aug 2025 04:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756293792; x=1756898592; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V1KClXnYNESaxX6nw8jQRbh+BCfXEal+QzR0BXC9Jp4=;
        b=V4qmCjpMF7LQFDhXchhi76gTEUh0yqSHKhbG0rbydGRoPXtIrsf0iUhJgv001GK1dN
         gTn7jnQdyTHnUH/qKo89W8u8wKiPxTquqoguYV+VVLCbni8mHQoICWJCZmlOJ3ZHn2pr
         vFCDjvhBbI9p5McSbn1feQJD9RMltpGsaNcpBdW1KxM5nqfYNn9qczXoB2hEvVhvKSPv
         n8GuzAMrAqVmxzMjhiPozaAjPHirOV1UYk2t3xh50sEci1y+PG1VZ7swAK7NTAZfA7y3
         7x/3Dy2fmcMgAOnZnFPv+d++TVnpARX3DV0/Kv0/vmc8gd0H7LfuMxvCobgEtl9TMWMN
         SZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756293792; x=1756898592;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V1KClXnYNESaxX6nw8jQRbh+BCfXEal+QzR0BXC9Jp4=;
        b=qQuF3vCp+VI3JjcD7yqczpge9NUFomCJI790fgDcKC2B1oJIv3F5J0/YK9tLRnfeGw
         sgHJwzePux5ioKgwOAKg+YU6XFaJtkzmE3SQNIbGWBinIaGGaMecZ6z4Orm8yAqGRg9l
         /g8lo16RE+6qYXaY7QKnLfJkRXt7lrX6AzKQPQYxsNa2zDm7RECyP3cUFaRk7M72aiGC
         kR+n0OfSTNPybDYd9HcUuFTmZJUiEcaRHwhvVsfG27LIXuwQfEEra9JAV27CWD1Hy5aw
         z2kooiA33NXkn4GF0va8dNMn4TN2tJaFWXnCaVYP3syjTx/vmubtiWl0Da079lqLFKhw
         ilFw==
X-Forwarded-Encrypted: i=1; AJvYcCVOhkX/XFe5wZyg2hS3IDwYf2rtk/3nioFPVKsg19uST04YnWRMNnpLQz1xC7lbZ4meO7eFZL7QReH480Y=@vger.kernel.org, AJvYcCWbhtfXRPKA+d4AzayLTJDAXyM3XuC5dc2c9ittMkd06EhPonyzW99+6BcAla29qDLzgg2fOtbNpf04@vger.kernel.org, AJvYcCX2dr2PTDmwzMk/ObXzDLjMvHC7v76qsAHSdIx8x/QjbKdoDeYjCzUrkHVxe6DxqhLLupiAzsLJQ8Nx3+Y=@vger.kernel.org, AJvYcCXoaZtBiRevbReUnH4+aHSqi3xK3n9/p2rBCSwULhB/RMJEA1bOw2dK7NtpJfYZNTMaHG4Iuz8dWEKEHo+a@vger.kernel.org, AJvYcCXzbs/6YF9XNLCCxaygSXkGu/6Hscv32tlz55ewMmydKiRIYuCNQWD/TzAMjQ7n9KNs7UxTJRjtpKra@vger.kernel.org
X-Gm-Message-State: AOJu0YwLmJKob/AUddJNB6iYH3YjyQmZ/VrlSDqz8lDUmmnlJZSrMCMd
	XU1qsII8b4lTP+cfW6Zl0E89rTOGIECK4efvPfi6n5M6TqVuZXEom6AZwbSI39Jj
X-Gm-Gg: ASbGncutpWWqEPM33f4C+mUWOAfSkCn4SXgjBtZXN6AC++uKbv3RLMOUxm/wSOm1zF4
	ylXcyPrtHj2qHIB84uxSIV4gC4aL2Prn2oVbEngdzCls8k48h7CDSImfdFwuWr+GiR2E/d9i87M
	nLBhExSIJK72H0blq4vpOf8q6/HY5qn1isr7TElHs7WQ1piiK+mDUstOVFUmAYcYqkeYQhtC2Ev
	9knN2+SdREuCeR2OyGf97PUFEAi2spBs9H9CjxELK4+ZpkKWmA3X79rn2j+S5zzA6hXwvMNsnnt
	TBMM7GF9pfR6nPVe+BR66SUaO7iztr6QNSaUx7gwhbNc9DWDnANaNza0ylUpnIaqLQ6rCAycjSM
	uay+u4od2w9rV/TOdm+pqBhw48N+VEBqoAGBl8rMuHo0ypZ56vigMSmvcJ4g+FnaX44CLx7pfWr
	MWA/kWxszQ/SG4Mf+h
X-Google-Smtp-Source: AGHT+IE6Tu6wufrIlj+Kudc31D3OvoV/icWKSCI7R614I9GYVkGOYOO+IfrlAxI3vaqnE2V0vypq7A==
X-Received: by 2002:a17:903:22c5:b0:245:fb83:25da with SMTP id d9443c01a7336-2462ee8dcc8mr203216505ad.22.1756293792214;
        Wed, 27 Aug 2025 04:23:12 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fcd6232sm1819708a91.16.2025.08.27.04.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 04:23:11 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 27 Aug 2025 21:22:37 +1000
Subject: [PATCH v2 03/11] rtc: Add new rtc-macsmc driver for Apple Silicon
 Macs
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-macsmc-subdevs-v2-3-ce5e99d54c28@gmail.com>
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
In-Reply-To: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7121;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=fFYNx5MTaxomGmqTFhn5OXWgUInA1frn00iHExvU3h4=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBnrXjV9LEg3D811Ofwr5/LdmH1FWr66Mis4ZHNOC9XNV
 tsy8//vjlIWBjEuBlkxRZYNTUIes43YbvaLVO6FmcPKBDKEgYtTACYyxZThf7bzYwOFO0V5nHeX
 TGIT8e7SZNBdebLoTKf3xf8dTdsKXBkZPqVdjFbdPMOoz/rc47pJko+PrRJtiDktuDD/UdQuHV9
 ffgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

Apple Silicon Macs (M1, etc.) have an RTC that is part of the PMU IC,
but most of the PMU functionality is abstracted out by the SMC.
On T600x machines, the RTC counter must be accessed via the SMC to
get full functionality, and it seems likely that future machines
will move towards making SMC handle all RTC functionality.

The SMC RTC counter access is implemented on all current machines
as of the time of this writing, on firmware 12.x. However, the RTC
offset (needed to set the time) is still only accessible via direct
PMU access. To handle this, we expose the RTC offset as an NVMEM
cell from the SPMI PMU device node, and this driver consumes that
cell and uses it to compute/set the current time.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Sven Peter <sven@kernel.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 MAINTAINERS              |   1 +
 drivers/rtc/Kconfig      |  11 ++
 drivers/rtc/Makefile     |   1 +
 drivers/rtc/rtc-macsmc.c | 141 +++++++++++++++++++++++++
 4 files changed, 154 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 56aabfbc2520749beb9dba235f8e86c15e17b7b6..5d53d243dc9abdf1db5865f8e6bcddbac3eafebe 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2422,6 +2422,7 @@ F:	drivers/nvmem/apple-spmi-nvmem.c
 F:	drivers/pinctrl/pinctrl-apple-gpio.c
 F:	drivers/power/reset/macsmc-reboot.c
 F:	drivers/pwm/pwm-apple.c
+F:	drivers/rtc/rtc-macsmc.c
 F:	drivers/soc/apple/*
 F:	drivers/spi/spi-apple.c
 F:	drivers/spmi/spmi-apple-controller.c
diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 64f6e9756aff4a1f6f6c50f9b4fc2140f66a8578..d28a46a89c85e6b30b402aec155e8972ed2aaa8e 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -2068,6 +2068,17 @@ config RTC_DRV_WILCO_EC
 	  This can also be built as a module. If so, the module will
 	  be named "rtc_wilco_ec".
 
+config RTC_DRV_MACSMC
+	tristate "Apple Mac System Management Controller RTC"
+	depends on MFD_MACSMC
+	help
+	  If you say yes here you get support for RTC functions
+	  inside Apple SPMI PMUs accessed through the SoC's
+	  System Management Controller
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called rtc-macsmc.
+
 config RTC_DRV_MSC313
 	tristate "MStar MSC313 RTC"
         depends on ARCH_MSTARV7 || COMPILE_TEST
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 789bddfea99d8fcd024566891c37ee73e527cf93..bcb43b5878a562454986cbb9ab8cc45cec248dda 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -93,6 +93,7 @@ obj-$(CONFIG_RTC_DRV_M48T35)	+= rtc-m48t35.o
 obj-$(CONFIG_RTC_DRV_M48T59)	+= rtc-m48t59.o
 obj-$(CONFIG_RTC_DRV_M48T86)	+= rtc-m48t86.o
 obj-$(CONFIG_RTC_DRV_MA35D1)	+= rtc-ma35d1.o
+obj-$(CONFIG_RTC_DRV_MACSMC)	+= rtc-macsmc.o
 obj-$(CONFIG_RTC_DRV_MAX31335)	+= rtc-max31335.o
 obj-$(CONFIG_RTC_DRV_MAX6900)	+= rtc-max6900.o
 obj-$(CONFIG_RTC_DRV_MAX6902)	+= rtc-max6902.o
diff --git a/drivers/rtc/rtc-macsmc.c b/drivers/rtc/rtc-macsmc.c
new file mode 100644
index 0000000000000000000000000000000000000000..05e360277f630f3368b2856aadef1f2b96426c37
--- /dev/null
+++ b/drivers/rtc/rtc-macsmc.c
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Apple SMC RTC driver
+ * Copyright The Asahi Linux Contributors
+ */
+
+#include <linux/bitops.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/macsmc.h>
+#include <linux/module.h>
+#include <linux/nvmem-consumer.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/rtc.h>
+#include <linux/slab.h>
+
+/* 48-bit RTC */
+#define RTC_BYTES 6
+#define RTC_BITS (8 * RTC_BYTES)
+
+/* 32768 Hz clock */
+#define RTC_SEC_SHIFT 15
+
+struct macsmc_rtc {
+	struct device *dev;
+	struct apple_smc *smc;
+	struct rtc_device *rtc_dev;
+	struct nvmem_cell *rtc_offset;
+};
+
+static int macsmc_rtc_get_time(struct device *dev, struct rtc_time *tm)
+{
+	struct macsmc_rtc *rtc = dev_get_drvdata(dev);
+	u64 ctr = 0, off = 0;
+	time64_t now;
+	void *p_off;
+	size_t len;
+	int ret;
+
+	ret = apple_smc_read(rtc->smc, SMC_KEY(CLKM), &ctr, RTC_BYTES);
+	if (ret < 0)
+		return ret;
+	if (ret != RTC_BYTES)
+		return -EIO;
+
+	p_off = nvmem_cell_read(rtc->rtc_offset, &len);
+	if (IS_ERR(p_off))
+		return PTR_ERR(p_off);
+	if (len < RTC_BYTES) {
+		kfree(p_off);
+		return -EIO;
+	}
+
+	memcpy(&off, p_off, RTC_BYTES);
+	kfree(p_off);
+
+	/* Sign extend from 48 to 64 bits, then arithmetic shift right 15 bits to get seconds */
+	now = sign_extend64(ctr + off, RTC_BITS - 1) >> RTC_SEC_SHIFT;
+	rtc_time64_to_tm(now, tm);
+
+	return ret;
+}
+
+static int macsmc_rtc_set_time(struct device *dev, struct rtc_time *tm)
+{
+	struct macsmc_rtc *rtc = dev_get_drvdata(dev);
+	u64 ctr = 0, off = 0;
+	int ret;
+
+	ret = apple_smc_read(rtc->smc, SMC_KEY(CLKM), &ctr, RTC_BYTES);
+	if (ret < 0)
+		return ret;
+	if (ret != RTC_BYTES)
+		return -EIO;
+
+	/* This sets the offset such that the set second begins now */
+	off = (rtc_tm_to_time64(tm) << RTC_SEC_SHIFT) - ctr;
+	return nvmem_cell_write(rtc->rtc_offset, &off, RTC_BYTES);
+}
+
+static const struct rtc_class_ops macsmc_rtc_ops = {
+	.read_time = macsmc_rtc_get_time,
+	.set_time = macsmc_rtc_set_time,
+};
+
+static int macsmc_rtc_probe(struct platform_device *pdev)
+{
+	struct apple_smc *smc = dev_get_drvdata(pdev->dev.parent);
+	struct macsmc_rtc *rtc;
+
+	/*
+	 * MFD will probe this device even without a node in the device tree,
+	 * thus bail out early if the SMC on the current machines does not
+	 * support RTC and has no node in the device tree.
+	 */
+	if (!pdev->dev.of_node)
+		return -ENODEV;
+
+	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
+	if (!rtc)
+		return -ENOMEM;
+
+	rtc->dev = &pdev->dev;
+	rtc->smc = smc;
+
+	rtc->rtc_offset = devm_nvmem_cell_get(&pdev->dev, "rtc_offset");
+	if (IS_ERR(rtc->rtc_offset))
+		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->rtc_offset),
+				     "Failed to get rtc_offset NVMEM cell\n");
+
+	rtc->rtc_dev = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(rtc->rtc_dev))
+		return PTR_ERR(rtc->rtc_dev);
+
+	rtc->rtc_dev->ops = &macsmc_rtc_ops;
+	rtc->rtc_dev->range_min = S64_MIN >> (RTC_SEC_SHIFT + (64 - RTC_BITS));
+	rtc->rtc_dev->range_max = S64_MAX >> (RTC_SEC_SHIFT + (64 - RTC_BITS));
+
+	platform_set_drvdata(pdev, rtc);
+
+	return devm_rtc_register_device(rtc->rtc_dev);
+}
+
+static const struct of_device_id macsmc_rtc_of_table[] = {
+	{ .compatible = "apple,smc-rtc", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, macsmc_rtc_of_table);
+
+static struct platform_driver macsmc_rtc_driver = {
+	.driver = {
+		.name = "macsmc-rtc",
+		.of_match_table = macsmc_rtc_of_table,
+	},
+	.probe = macsmc_rtc_probe,
+};
+module_platform_driver(macsmc_rtc_driver);
+
+MODULE_LICENSE("Dual MIT/GPL");
+MODULE_DESCRIPTION("Apple SMC RTC driver");
+MODULE_AUTHOR("Hector Martin <marcan@marcan.st>");

-- 
2.51.0


