Return-Path: <linux-rtc+bounces-5151-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DA6C08689
	for <lists+linux-rtc@lfdr.de>; Sat, 25 Oct 2025 02:25:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A17954015A1
	for <lists+linux-rtc@lfdr.de>; Sat, 25 Oct 2025 00:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8551D19CC0C;
	Sat, 25 Oct 2025 00:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XUpZdpHx"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F941993B9
	for <linux-rtc@vger.kernel.org>; Sat, 25 Oct 2025 00:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761351920; cv=none; b=qLRQShKp3HwGcf+l1WSGzPNBsWeFCPXtHLjvk0C9jbRSatgXHg4s2KyxAS/AhsgjGALQe/x+GdnxV0kDfu1JfeCX0xr4tOTek4uqOVJxBF8lmTAW//nv6w49MGMf7s91Gw9iW+Nyr80cqBkJv6pZ5i81rIjaLnj1becfGsUJHcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761351920; c=relaxed/simple;
	bh=STfTCmac9Yu0j7eiVhtHMDKv6NipIWLHTlXOi1zHZmY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b5OrDadrotwCqrqOzrKj9E6D0PCsID8GTcMLSV2QexB5gs4Y3SG0sz3dYR1FXWHj4OYc4TXQPoC0ZXWSRv2fxG/5jqdufkaFsozlICbiO+jJjAINYq5FbDPoUCtLnSSV9WxTUzommlUIVd7g6mDQjdgbeO7uK5BnXcQVA5AOx5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XUpZdpHx; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2698d47e776so21889035ad.1
        for <linux-rtc@vger.kernel.org>; Fri, 24 Oct 2025 17:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761351917; x=1761956717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LpjDHQIYIRylJPTB3diZWWrLmxC+Ub3kw5EOc9yYTqo=;
        b=XUpZdpHx4cLMT70PLNXc7mBZv6DpDyN7wE54TTRyzySWg2ZwYuZRRI4K8yQG6rQeOG
         67ClP3lr7YJzN1bAzwH1h/SLAG8DjBjjPvllI1vInnb2IPKym7USMMqWm3ray4Okm9Nh
         qemqydJTS29Hpji4I/utbtNUW0XT2pOBQ3n74oomFu3rkesf1uGRuYvShvLQEM//5Uiw
         /WOgfYT8yYIfb2eAbtqog/zMivY9rkQbWAdmewTxlExhcOG8qv1UbnCnXBOoD/QjMhse
         Qf79W1m5t9e37AjiZcCe0mErWq2CCQicRq0HIdpTCWhO/bNb6FWGPvpja9MwwFIzOHiB
         NUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761351917; x=1761956717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LpjDHQIYIRylJPTB3diZWWrLmxC+Ub3kw5EOc9yYTqo=;
        b=cGcGY/9VFgHej3fv4HKypgo7ZASvwIAtAo4Syk6zNOwgyMdhelJImDLQUGfHNYNs+L
         Ycc7WbZSeSy+3LO0wjZk1GID45kh5Rsyk2BQLAb+I+odY6nLkAk7lpfzhcj/vcrzjVcJ
         dPyIdGbLpdB8Hij8UcHZbBZ67WVMJPwN+qDrU5uxFSi0GW9qLujuINRPVSCsep87dzIV
         c5rNa95uWfu7IyUGfq7sgb7ZId/w8WsP7J7aAkVZuCoS2DErXUO8/Brhr8wg2E74P+JO
         7vvqbacNll6VGwf7kQ1E07yfePNBZNhm+tbDC4ylVDV0ljKBUsA+rBANorBXARkTf1+z
         4gnw==
X-Forwarded-Encrypted: i=1; AJvYcCVXXwDf4tFy0Dvc0nNVcxaK+m3asZ9i8ROIyD1sm/PjAIhCx5h3ELmgI+vDQRHEH2yR7ahsjz+1LcQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvQB581ZIuhnLT8iXNqV87/pl0YfeQJSQ66YHv4suHott1ehyE
	+pxrwJQ+luJfaOgdRaRc/tdZoERuJFcLphbLTAjE6dTPvjq90tH/2HAn
X-Gm-Gg: ASbGncuSBSIZY6pzK7nxtha5zBu4JhVBy/Vm/QvUwIfZPbTxCqgD3X7kJlq2Fo14TVq
	TAq5tLUTpuEgzBdXT4pH3+dZXm/AhJhoMZC7ED2Sp1w0xSgw6Ng4ocNs4Guasa33S45Eu2NQDyc
	UmWGrSNLZpqd7e124nonHPNtyRj1eAgZ5/CFsEpAozFn8A0PTZPS3Ruq8rE7yJmgqxq9/FifB3Y
	11N1LNHVJSosTO4TA2liWiY3lHL1Izx58VbWQi/R135n/QmD7OexCZQanWfum+oaW9CqIVr0zSA
	sqclRIqB1O1tZfJUHN5WXxLAX78KDt0KW5PGOZWX9wJ00ghoOdwFb60qwgt4kIjezpDx/sF6kw3
	fNNJEkbXC744YMDv+0zl4mjXOH1ty43Oc6yyll5NsTQywmefOwyD2tuAk8U2UDxQWGVfRSs+rdD
	F1MBN7KaRnQC6Rw18fK5QC46O5ryiDbfczTq+hw3A0ZvpiaQ3hcGNE7AKZBFfSyvvCZ6dgj23qO
	Xt1RFY1VYH6HoUtE4Xtd8R/X3DlKvzueHH5bcDr2vF0wpU9K6KjljZnIH/1rMFE
X-Google-Smtp-Source: AGHT+IFvT7pNHTbj5DmC5yeORCKubjL7ZVBJx6hFhUmbeqmG4NbiAwaY0R/f8Kd7Jj5Yxiy8PVThtw==
X-Received: by 2002:a17:903:8c6:b0:28d:18fb:bb93 with SMTP id d9443c01a7336-290c9c8968cmr397545735ad.7.1761351917386;
        Fri, 24 Oct 2025 17:25:17 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3f4asm4728885ad.11.2025.10.24.17.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 17:25:17 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 25 Oct 2025 10:24:34 +1000
Subject: [PATCH v4 03/11] rtc: Add new rtc-macsmc driver for Apple Silicon
 Macs
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251025-macsmc-subdevs-v4-3-374d5c9eba0e@gmail.com>
References: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
In-Reply-To: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6897;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=obg0EdYz2H0oIXhGRk+CbCHk2jpdlqeTG6wlPWzOz4k=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBl/JM7GJFixFJx7YVvhW3ybT7RodoPFG06v6tOf4m0jJ
 rtkXWPvmMjCIMbFYCmmyLKhSchjthHbzX6Ryr0wc1iZQIZIizQwAAELA19uYl6pkY6Rnqm2oZ6h
 oY6xjhEDF6cATPUBPoZ/WrkvHWZucfqgOo2xS4dpbtol3vmvtbS8XDU+1/G6qhUtYvhfpDF9kdC
 FGzmCF7g+uezI7PA7dX1ZtVGa4aH8OOMCwXpWAA==
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
index 10f4c0034b5e..3c6322872dd1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2460,6 +2460,7 @@ F:	drivers/nvmem/apple-spmi-nvmem.c
 F:	drivers/pinctrl/pinctrl-apple-gpio.c
 F:	drivers/power/reset/macsmc-reboot.c
 F:	drivers/pwm/pwm-apple.c
+F:	drivers/rtc/rtc-macsmc.c
 F:	drivers/soc/apple/*
 F:	drivers/spi/spi-apple.c
 F:	drivers/spmi/spmi-apple-controller.c
diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 4a8dc8d0a4b7..e165301d4abb 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -2078,6 +2078,17 @@ config RTC_DRV_WILCO_EC
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
index 610a9ee5fd33..32083bd5bb81 100644
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
index 000000000000..05e360277f63
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


