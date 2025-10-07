Return-Path: <linux-rtc+bounces-5063-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E58BC126A
	for <lists+linux-rtc@lfdr.de>; Tue, 07 Oct 2025 13:19:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 734E319A041F
	for <lists+linux-rtc@lfdr.de>; Tue,  7 Oct 2025 11:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8B8D2DC779;
	Tue,  7 Oct 2025 11:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l63rTnYQ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711442DC76C
	for <linux-rtc@vger.kernel.org>; Tue,  7 Oct 2025 11:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759835902; cv=none; b=K5zfrz2a6J0ij1Q6LdnsH+5QxeMtnMpi4tD5m5Uefr3EpX+2hXxGSWL2q/JihFqBJV5clkoEmBr/tc4eajSF+YZjy8UBu8vhxV76SkTG/PlIjLDRyo+PJ/HgBLPry9jJczioN6bFqBOZcBdxE/nUQlvyJsaIJPiLSlh3K/MTdug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759835902; c=relaxed/simple;
	bh=KDSJK1hK+2MjMUGKNuhBBlRGQhDqmhOz6GlEutnac40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XE1IsZPHO8cogoILjZxOBAWeB9WnRyqYNikoOqRfkrnXjTwe4vrjpsku3yZgQjxq97k1xxdnXbcMIE7fey9Ykmy/uCPMS4dMHZ34TG22hJmpztpS16zmRhaLU3tMyIVKGkgMPOtRxk52+DZE+4BBdnX0WdanlFDo5XPITg485zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l63rTnYQ; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b550eff972eso4126629a12.3
        for <linux-rtc@vger.kernel.org>; Tue, 07 Oct 2025 04:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759835900; x=1760440700; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=igoCCgnZ/X1DMDEVudEaDJx1Zu4lUx4Hg3bpipB8g7I=;
        b=l63rTnYQwxvF509PjQ5ezBiaagMIyqxa9mH46t7Dn7CzgOU5OseXLebf40VHNgHTj2
         Wl28SdQFnOksssOR4Ih677QrV6xa5RZOVHUcL5b0sex6moiw1xHEB307CTsmSsr2n5NE
         xoYClHrV6iipXMq/Zb6RmbeI4PwWkp3+8p9/bLciRDD/C4rBYbn+81yjgmwtKg+07IC7
         SShXtnrB7+oIeeXIkLCZ6ROUgwYWSZ7/O231jQbHmg2q6B7UYqcsSk15tWnIQpRDk8vk
         zNHqT544pLSPdSaNq1e6M0dsdPwMN5IRTGg7P1i+td6lWR6EGlOsDPXnyucqyk+0/8JD
         873g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759835900; x=1760440700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=igoCCgnZ/X1DMDEVudEaDJx1Zu4lUx4Hg3bpipB8g7I=;
        b=IjZ98yqj7hnFdVX9nWfUjdGcytaIbwwEkikSS1VLAFQHSnTyqmSUJ5qb3f6EApMThu
         BXrijFSIEWRMvh5zW3RROgOZJRJA6NRA8wAhfLWS9VO0oPK0EePClr2yYBBOTWYUogAM
         O9LLiH7BRQ4NCcLzU6BWAIz7fVBPIXk9Q7ARTr756WjttbB1FxCCY7bq2/hPfGuLc68c
         gntfSKAz6r/krbztHFGWUAhNQLZbfIm727lr80wP7HGj5RvqhFFrYMR9OvB9AGhRJykd
         wh1/XnmgwLwA08AwAEnPwDql/0oFIZrlA6cnquH3AcQEnEz9nccZID0+19nyPVST0c45
         ce+g==
X-Forwarded-Encrypted: i=1; AJvYcCWTUU5R2DCLS6qR3wgFG4xOHK65SLKN7atdBn4swWwZQJQZmh9GMchTRY2Umo7qQdDhl+rkJf0jhhk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqRZLf9nmMUKUe47Y8ngbEmwb6Wma+1iM4d29rMLGPwZlO15QS
	KqW4rlXWf7dYxQ5Z7v8+jRLjnFKIQB1HWgEqOk++HqJJflxvILOgXK/+
X-Gm-Gg: ASbGnctdZ3IhAHWOnDo5GVDd0zWT9IqP8IJTpn/k7Mx/8IMY5j48EI7OiUxQLGa47CV
	IlodsYLFc4dC2bvyS3aaL33Tvm40JTAPFVNVY2LDvSZBwMuC6qRZ8qzedC7E462DO5ZQbpYfZLz
	dxyBhxlEjOnDX6oyPjYvt6lyg1Se4bWXjSEJ3STfXP/cErg5M+5lTq3wf+JMSces+yyoYXBfP17
	ODZ+V1RHnI6T1QxNokBplz2m+fiAtA0+Vc5s2nbRTkTmfNpBvI7wYj3AR/Je42LmrRnNjlpPOeS
	E4HYTWYH16Reu9Q/4CL0r4k9V9lasNht5oXF90Fq7hQvfkW1paZM4Cvgtro0ejaQJJ5qjmzzuqv
	MTAg5HhlsXMRSXRG01elbUVNCoq6BQK9TLmIW7wExMdrq7XLXJroNCLNoZ8I0HuXyj1XqnwSaFs
	PEZTnmnwVRN7CS9WULYJ72/JVlPr4ZvYwt4/4eo4awuA==
X-Google-Smtp-Source: AGHT+IFI5v34OHkG+BFkCWyO6dCr2DH0coMDDT0kpNcUl4tnkMlzQd9Njd2Uvgcn/+fuwyD7FqS6SQ==
X-Received: by 2002:a17:902:db0f:b0:267:af07:6528 with SMTP id d9443c01a7336-28e9a61a842mr185808585ad.35.1759835899767;
        Tue, 07 Oct 2025 04:18:19 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d31bdsm162509045ad.94.2025.10.07.04.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 04:18:19 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 07 Oct 2025 21:16:49 +1000
Subject: [PATCH v3 08/13] input: macsmc-input: New driver to handle the
 Apple Mac SMC buttons/lid
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-macsmc-subdevs-v3-8-d7d3bfd7ae02@gmail.com>
References: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
In-Reply-To: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9033;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=N7YD7RNasaiUaTxPQY55v7KHLaj7T+3xfqua/vl4ebg=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlPvm372yWfIr7EStiIpe5H49ZohcOnFcKm7dF1KF64b
 MO8RU+/d5SyMIhxMciKKbJsaBLymG3EdrNfpHIvzBxWJpAhDFycAjCRaRkM/5MmnX2leiyf03vj
 Zv/kkutl2Q0Buk+TZqXOVF25+8SaC9GMDGeM3tTP9JrH97y0SLSlJcJzfV3EEfbUA/a+8x9MV+J
 t4AQA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

This driver implements power button and lid switch support for Apple Mac
devices using SMC controllers driven by the macsmc driver.

In addition to basic input support, this also responds to the final
shutdown warning (when the power button is held down long enough) by
doing an emergency kernel poweroff. This allows the NVMe controller to
be cleanly shut down, which prevents data loss for in-cache data.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Hector Martin <marcan@marcan.st>
Co-developed-by: Sven Peter <sven@kernel.org>
Signed-off-by: Sven Peter <sven@kernel.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 MAINTAINERS                       |   1 +
 drivers/input/misc/Kconfig        |  11 ++
 drivers/input/misc/Makefile       |   1 +
 drivers/input/misc/macsmc-input.c | 208 +++++++++++++++++++++++++
 4 files changed, 221 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 79b9f40224a9..e8283f127f11 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2451,6 +2451,7 @@ F:	drivers/hwmon/macsmc-hwmon.c
 F:	drivers/pmdomain/apple/
 F:	drivers/i2c/busses/i2c-pasemi-core.c
 F:	drivers/i2c/busses/i2c-pasemi-platform.c
+F:	drivers/input/misc/macsmc-input.c
 F:	drivers/input/touchscreen/apple_z2.c
 F:	drivers/iommu/apple-dart.c
 F:	drivers/iommu/io-pgtable-dart.c
diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 0e6b49fb54bc..5ab8a4729e0a 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -981,4 +981,15 @@ config INPUT_STPMIC1_ONKEY
 	  To compile this driver as a module, choose M here: the
 	  module will be called stpmic1_onkey.
 
+config INPUT_MACSMC_INPUT
+	tristate "Apple Mac SMC lid/buttons"
+	depends on MFD_MACSMC
+	help
+	  Say Y here if you want to use the input events delivered via the
+	  SMC controller on Apple Mac machines using the macsmc driver.
+	  This includes lid open/close and the power button.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called macsmc-input.
+
 endif
diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
index ae857c24f48e..480a0d08d4ae 100644
--- a/drivers/input/misc/Makefile
+++ b/drivers/input/misc/Makefile
@@ -51,6 +51,7 @@ obj-$(CONFIG_INPUT_IQS7222)		+= iqs7222.o
 obj-$(CONFIG_INPUT_KEYSPAN_REMOTE)	+= keyspan_remote.o
 obj-$(CONFIG_INPUT_KXTJ9)		+= kxtj9.o
 obj-$(CONFIG_INPUT_M68K_BEEP)		+= m68kspkr.o
+obj-$(CONFIG_INPUT_MACSMC_INPUT)	+= macsmc-input.o
 obj-$(CONFIG_INPUT_MAX7360_ROTARY)	+= max7360-rotary.o
 obj-$(CONFIG_INPUT_MAX77650_ONKEY)	+= max77650-onkey.o
 obj-$(CONFIG_INPUT_MAX77693_HAPTIC)	+= max77693-haptic.o
diff --git a/drivers/input/misc/macsmc-input.c b/drivers/input/misc/macsmc-input.c
new file mode 100644
index 000000000000..ebbc7dfc31f5
--- /dev/null
+++ b/drivers/input/misc/macsmc-input.c
@@ -0,0 +1,208 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Apple SMC input event driver
+ * Copyright The Asahi Linux Contributors
+ *
+ * This driver exposes HID events from the SMC as an input device.
+ * This includes the lid open/close and power button notifications.
+ */
+
+#include <linux/device.h>
+#include <linux/input.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/macsmc.h>
+#include <linux/module.h>
+#include <linux/reboot.h>
+
+/**
+ * struct macsmc_input
+ * @dev: Underlying struct device for the input sub-device
+ * @smc: Pointer to apple_smc struct of the mfd parent
+ * @input: Allocated input_dev; devres managed
+ * @nb: Notifier block used for incoming events from SMC (e.g. button pressed down)
+ * @wakeup_mode: Set to true when system is suspended and power button events should wake it
+ */
+struct macsmc_input {
+	struct device *dev;
+	struct apple_smc *smc;
+	struct input_dev *input;
+	struct notifier_block nb;
+	bool wakeup_mode;
+};
+
+#define SMC_EV_BTN 0x7201
+#define SMC_EV_LID 0x7203
+
+#define BTN_POWER		0x01 /* power button on e.g. Mac Mini chasis pressed */
+#define BTN_TOUCHID		0x06 /* combined TouchID / power button on MacBooks pressed */
+#define BTN_POWER_HELD_SHORT	0xfe /* power button briefly held down */
+#define BTN_POWER_HELD_LONG	0x00 /* power button held down; sent just before forced poweroff */
+
+static void macsmc_input_event_button(struct macsmc_input *smcin, unsigned long event)
+{
+	u8 button = (event >> 8) & 0xff;
+	u8 state = !!(event & 0xff);
+
+	switch (button) {
+	case BTN_POWER:
+	case BTN_TOUCHID:
+		if (smcin->wakeup_mode) {
+			if (state)
+				pm_wakeup_event(smcin->dev, 0);
+		} else {
+			input_report_key(smcin->input, KEY_POWER, state);
+			input_sync(smcin->input);
+		}
+		break;
+	case BTN_POWER_HELD_SHORT: /* power button held down; ignore */
+		break;
+	case BTN_POWER_HELD_LONG:
+		/*
+		 * If we get here the power button has been held down for a while and
+		 * we have about 4 seconds before forced power-off is triggered by SMC.
+		 * Try to do an emergency shutdown to make sure the NVMe cache is
+		 * flushed. macOS actually does this by panicing (!)...
+		 */
+		if (state) {
+			dev_crit(smcin->dev, "Triggering forced shutdown!\n");
+			if (kernel_can_power_off())
+				kernel_power_off();
+			else /* Missing macsmc-reboot driver? */
+				kernel_restart("SMC power button triggered restart");
+		}
+		break;
+	default:
+		dev_warn(smcin->dev, "Unknown SMC button event: %04lx\n", event & 0xffff);
+	}
+}
+
+static void macsmc_input_event_lid(struct macsmc_input *smcin, unsigned long event)
+{
+	u8 lid_state = !!((event >> 8) & 0xff);
+
+	if (smcin->wakeup_mode && !lid_state)
+		pm_wakeup_event(smcin->dev, 0);
+
+	input_report_switch(smcin->input, SW_LID, lid_state);
+	input_sync(smcin->input);
+}
+
+static int macsmc_input_event(struct notifier_block *nb, unsigned long event, void *data)
+{
+	struct macsmc_input *smcin = container_of(nb, struct macsmc_input, nb);
+	u16 type = event >> 16;
+
+	switch (type) {
+	case SMC_EV_BTN:
+		macsmc_input_event_button(smcin, event);
+		return NOTIFY_OK;
+	case SMC_EV_LID:
+		macsmc_input_event_lid(smcin, event);
+		return NOTIFY_OK;
+	default:
+		/* SMC event meant for another driver */
+		return NOTIFY_DONE;
+	}
+}
+
+static int macsmc_input_probe(struct platform_device *pdev)
+{
+	struct apple_smc *smc = dev_get_drvdata(pdev->dev.parent);
+	struct macsmc_input *smcin;
+	bool have_lid, have_power;
+	int error;
+
+	/* Bail early if this SMC neither supports power button nor lid events */
+	have_lid = apple_smc_key_exists(smc, SMC_KEY(MSLD));
+	have_power = apple_smc_key_exists(smc, SMC_KEY(bHLD));
+	if (!have_lid && !have_power)
+		return -ENODEV;
+
+	smcin = devm_kzalloc(&pdev->dev, sizeof(*smcin), GFP_KERNEL);
+	if (!smcin)
+		return -ENOMEM;
+
+	smcin->dev = &pdev->dev;
+	smcin->smc = smc;
+	platform_set_drvdata(pdev, smcin);
+
+	smcin->input = devm_input_allocate_device(&pdev->dev);
+	if (!smcin->input)
+		return -ENOMEM;
+
+	smcin->input->phys = "macsmc-input (0)";
+	smcin->input->name = "Apple SMC power/lid events";
+
+	if (have_lid)
+		input_set_capability(smcin->input, EV_SW, SW_LID);
+	if (have_power)
+		input_set_capability(smcin->input, EV_KEY, KEY_POWER);
+
+	if (have_lid) {
+		u8 val;
+
+		error = apple_smc_read_u8(smc, SMC_KEY(MSLD), &val);
+		if (error < 0)
+			dev_warn(&pdev->dev, "Failed to read initial lid state\n");
+		else
+			input_report_switch(smcin->input, SW_LID, val);
+	}
+
+	if (have_power) {
+		u32 val;
+
+		error = apple_smc_read_u32(smc, SMC_KEY(bHLD), &val);
+		if (error < 0)
+			dev_warn(&pdev->dev, "Failed to read initial power button state\n");
+		else
+			input_report_key(smcin->input, KEY_POWER, val & 1);
+	}
+
+	error = input_register_device(smcin->input);
+	if (error) {
+		dev_err(&pdev->dev, "Failed to register input device: %d\n", error);
+		return error;
+	}
+
+	input_sync(smcin->input);
+
+	smcin->nb.notifier_call = macsmc_input_event;
+	blocking_notifier_chain_register(&smc->event_handlers, &smcin->nb);
+
+	device_init_wakeup(&pdev->dev, 1);
+
+	return 0;
+}
+
+static int macsmc_input_pm_prepare(struct device *dev)
+{
+	struct macsmc_input *smcin = dev_get_drvdata(dev);
+
+	smcin->wakeup_mode = true;
+	return 0;
+}
+
+static void macsmc_input_pm_complete(struct device *dev)
+{
+	struct macsmc_input *smcin = dev_get_drvdata(dev);
+
+	smcin->wakeup_mode = false;
+}
+
+static const struct dev_pm_ops macsmc_input_pm_ops = {
+	.prepare = macsmc_input_pm_prepare,
+	.complete = macsmc_input_pm_complete,
+};
+
+static struct platform_driver macsmc_input_driver = {
+	.driver = {
+		.name = "macsmc-input",
+		.pm = &macsmc_input_pm_ops,
+	},
+	.probe = macsmc_input_probe,
+};
+module_platform_driver(macsmc_input_driver);
+
+MODULE_AUTHOR("Hector Martin <marcan@marcan.st>");
+MODULE_LICENSE("Dual MIT/GPL");
+MODULE_DESCRIPTION("Apple SMC input driver");

-- 
2.51.0


