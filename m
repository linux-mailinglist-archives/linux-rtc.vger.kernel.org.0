Return-Path: <linux-rtc+bounces-4718-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65590B2C0F1
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Aug 2025 13:49:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4889E7B5E89
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Aug 2025 11:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEFEF335BA9;
	Tue, 19 Aug 2025 11:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fflq0caU"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F48335BA5;
	Tue, 19 Aug 2025 11:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755604111; cv=none; b=DsKaNmXmM0CWToR+eCogUlx8tTpGDWAs68XoDrzzHiHLH0BqbLEZvXyAp+hL/Bc6LawzAvgOsc3zo61rILs0KJ9t54MaWEo2vDST5Mvlz4jlsSw5t//mbMmyECdnigw/D6I0q4GxPhfeYBtj53CoVWFbNaKgRT4hHje6xJwDmIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755604111; c=relaxed/simple;
	bh=pX3l+comaf19sKydYjNQBjkS+qk6cZSHNtN2Sn3yVXw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OlqVy1RpK2Q8ft1/OzT7dbIH8sXNvGkG3D6pSKrbhN7ux2LiEEzuw8ruW1ye8LMnbc/PZk4HOOqWddxmzaFvbHT3ezGEcs7Aw1Zc8jKkBiiFr4kjHU8ddluhA9k7ryESI6Mg35R4i8NILus7/XYoVF27n2JOu3Q508oOeovpcX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fflq0caU; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-323266d2d9eso3851940a91.0;
        Tue, 19 Aug 2025 04:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755604109; x=1756208909; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QxpNKKpp8zELIGdlUPJtYD+1S9kFQUpZJC758Xcu4Jg=;
        b=fflq0caUFQV+d2DO8LpGRD3p8Tw+IOhofWfB6k0CkgfL/1hvJLmF2wPNAuwf0eXqhK
         rV8a6XHYAnVSFcVaa92kSX1uzX4DxiP9BapQOGBAopGvfYo6L2E++34cYGaSb65XoJeI
         LtYhly0MuaENgB3TGCJWrtOi2vvdoKw2OKZGAA+B8Up5k6H0OAAWgSUBeWtWW1/X2INx
         irpA3SJNZfLrbqtZMcYnRLeeyoZlCqiPbDpI0MVRLL2CnyWg+1jidlAeQiYHyVaUXIqZ
         MFX0UbYTI7EnfpAOtRUtEZUvINTDmqBer577IA1vnaf87McGRh69MZEv3ZF9FB2ZQes2
         dF5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755604109; x=1756208909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QxpNKKpp8zELIGdlUPJtYD+1S9kFQUpZJC758Xcu4Jg=;
        b=rZsiWY2HjQ5nHzWcwbQUBk12CUMKo3bfKvr8edzImMlQGx1eijwoW2NeVo/pscWYnU
         7K733NmrVloN4Bn//RfORaGlTTIMNzi+cUYMLrRx/9pTiNjBnFcyX6kDdghP+RlMngtX
         D0yERNHU2oxje9C7PuugRAf06FTfnobfaBqxLUhJiUrPBy7Ge6osEXZmxeGj59KbY+rG
         GUZNawtKu+wgUkMeIevo9tumIfaVf3xlaphmI6XxV3g4AYONO9B3m2L7sNDIzKEvu/nU
         K8i8ZSpyOeZ6BWiM1vYPwt9dts2QhCd6k8xkVQG2gvemEpjis3OUxAC5WKebsdLHKoWX
         JyVA==
X-Forwarded-Encrypted: i=1; AJvYcCVGl/ybJWObaXD6s4VoJ8uSaREMsF1ZMfSrnAd1okIxMurpKo7MRUfekSYtTkPZ247SXZfwsLzz9DB5@vger.kernel.org, AJvYcCWpBzFkEdpfiD+aV5mCuc4zMFvkybKY1wWsCpIoWeJzRXsn0teW4sYq5qPMfUs7MXvRrcxuky2kkA2pRbI+@vger.kernel.org, AJvYcCXQpwphd/+PnuStKk++a6rQU0Ud+ywEBJ0567LX+zkIlzb92SBvOcKxCPNKO8FbVgx9mqqZRp8BTedDcLs=@vger.kernel.org, AJvYcCXRxSR7rM6baj2eaNUeTuYgHFbuC4SjiPPdWFNjiVcj4FUy4T+/6H9b0Oda4Pfxg6RnVXgOUBWT65kltp8=@vger.kernel.org, AJvYcCXi127NIqFyTg4sF4WiQNDbb/my91F/WdsjS+9UoAgzc5lZrPPOB2OHh3bjAeJEF8h0B4NQ/vKfoijP@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6M2tPolZJnniWt8ZyXVK1XrOO0g/1Be1qeY9id8MO0y2kFQmw
	Rcb91ynw2QKK+xKHoZAbXY24FnpFPYB8NWmgdnU88eeWuThoi3tfRfa/
X-Gm-Gg: ASbGncs1rIQnQ+nVND5OREpT9pzWlw9aZKpfp4CYSjSiaVi+NB20+8B8U4TMYCrsoZb
	0q5QfWo94yRmJq1D7H+IrIguUcHafUsE1U3+m6kLxCJJGJ3E50uMY4lNJvNgxw+FdWQMKxjmTVc
	poPqgcgKYw6YqelPmkm2wq7xnjQKnIXu+UCfS5JPsaHn9ANmCq8ReGvGqs7b4GleqEk8l9QvJou
	Gphj6YBX0+zU4I0HXeHnfMOTy6Vy4zQFhgIUbCl+UbbMepqwEvu5LGct7xCNn3gVgAtGj0hi6bc
	Z+NBze5keLpO3ExRnU0GBjwjB05qGjZSSCiNSyB7l70IfVAef7y38tx38G+GH0sqtbLv0XNRm+/
	Dq8KzWnTUbznyORcRGvau+jLw1XBtct3BDLmkHL+sePP0jgKrmxWm21Y06zj0Xs52X9P7qE0YoJ
	w6R+alOs1fChM9ioQ=
X-Google-Smtp-Source: AGHT+IGt4tZ3YizxmVlqLRL267iJJCoryKal9Swp4n/XAD46vspja1eGN8YTJcwrNfmlCxQ7ezZ3sg==
X-Received: by 2002:a17:902:e413:b0:242:fc4f:9fe3 with SMTP id d9443c01a7336-245e049d597mr18379525ad.37.1755604108731;
        Tue, 19 Aug 2025 04:48:28 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d76a430sm10286316a12.43.2025.08.19.04.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:48:28 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 19 Aug 2025 21:47:55 +1000
Subject: [PATCH 3/8] rtc: Add new rtc-macsmc driver for Apple Silicon Macs
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-macsmc-subdevs-v1-3-57df6c3e5f19@gmail.com>
References: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
In-Reply-To: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7724;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=aql9A5L2WO/MLIrJ+0awvsv3si3YNnYd6gxS7CPu6co=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlLUvI3fDr4J2KH7IYtl0xnn9mrvvdU4jnzA2yfQj73J
 6nrTnGc3lHKwiDGxSArpsiyoUnIY7YR281+kcq9MHNYmUCGMHBxCsBEUo8zMvRt1JjRejFRXdDS
 WkRk6q22eA6p0ukdBxunaArkzmVbls7I8N6y+PHb3wf/LD0SbHF4qez3MvGkjLVrI85ceLR6tjn
 PTG4A
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
 drivers/mfd/macsmc.c     |   1 +
 drivers/rtc/Kconfig      |  11 ++
 drivers/rtc/Makefile     |   1 +
 drivers/rtc/rtc-macsmc.c | 141 +++++++++++++++++++++++++
 5 files changed, 155 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index aaef8634985b35f54de1123ebb4176602066d177..029117b921ea97d1276f5496ea06a3f918929b20 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2421,6 +2421,7 @@ F:	drivers/nvmem/apple-spmi-nvmem.c
 F:	drivers/pinctrl/pinctrl-apple-gpio.c
 F:	drivers/power/reset/macsmc-reboot.c
 F:	drivers/pwm/pwm-apple.c
+F:	drivers/rtc/rtc-macsmc.c
 F:	drivers/soc/apple/*
 F:	drivers/spi/spi-apple.c
 F:	drivers/spmi/spmi-apple-controller.c
diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index 870c8b2028a8fc0e905c8934c2636824cbe5d527..59be894460d33afa754927630881532b548b7ad8 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -47,6 +47,7 @@
 static const struct mfd_cell apple_smc_devs[] = {
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),
+	MFD_CELL_OF("macsmc-rtc", NULL, NULL, 0, 0, "apple,smc-rtc"),
 };
 
 static int apple_smc_cmd_locked(struct apple_smc *smc, u64 cmd, u64 arg,
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
2.50.1


