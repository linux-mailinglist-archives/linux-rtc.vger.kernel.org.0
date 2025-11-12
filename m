Return-Path: <linux-rtc+bounces-5320-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 927CCC5205A
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Nov 2025 12:39:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 449384EFEBE
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Nov 2025 11:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE3913126D3;
	Wed, 12 Nov 2025 11:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fqIaNTaI"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BE73126D0
	for <linux-rtc@vger.kernel.org>; Wed, 12 Nov 2025 11:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762946317; cv=none; b=Uet/tLeAqIniry9AatgDybSBIz4554h/upS9GgL925Ur9A67QoDw3ksmBukz+uC+ZHN07LmGqCNXziPU0Whesp+U42XPsswIbaTw8O+/bVzkVhdrJX0Qt4q/bYcY7ar8/tSK2jwFWxf2ivPesSuIXKu2hP6FIMrRw3CURyei95c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762946317; c=relaxed/simple;
	bh=YG9lZXx46fthBKtkemmOX5y4IihWTRLCINMuSXC89CM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fcjFjePNn7sHpAl/+Q43ZWZ0GTvx6FIPnsMUSPVKNJc/06cBafTzG1E/3Ys1Ei420xZZRf2xRIVb9bDh9q2rmjlmu33OfZWjflhsH92bVBYdD+S6hYxQOSyniDJ93ihNOvUSQxkbAHfrWp1HqrQDap42oizApShmZ2sakluuecw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fqIaNTaI; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b98983bae80so476093a12.0
        for <linux-rtc@vger.kernel.org>; Wed, 12 Nov 2025 03:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762946315; x=1763551115; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dnFl3jR9iWlGxe75DpO1WG65kqZjCS4whQ+cV4m7NwY=;
        b=fqIaNTaIeZeodPUDQkxQI46UsP/BFy6LXohushkxYcR7gNXAX67BDg1mtZ8sHnhLuS
         YzoF8cQs8lPSR2DuBDOJqc4oVLvb/02ay1yBCKvYbq6BGKejETD3zOu91c3mNXJ10nq+
         6D0pCewArwCdfGMhCGfi+LtZZ9kNUwEBrTv4eOh4drHnCTOUqZini4UMfO4CafyniW9v
         tK2fRlNY8+po4Z6E1oHzb4xKLW8nF/O7U9+NqM8L2Zt4/5aty9JOWG+DRY3ksFzcGAMo
         41cDQqxsiMYcMDZ0tEmO0GrwG95hD0AqPjx0I4VSHjC8JhXhtPgctMyRsoSuGFHeRV8J
         ziJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762946315; x=1763551115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dnFl3jR9iWlGxe75DpO1WG65kqZjCS4whQ+cV4m7NwY=;
        b=N/MGPaenz3fooMzOsZRqaQZRRQ0Afayi501ab5VmWxgGAb2vzCx/2VoCKG1xpsxhSc
         UlIt3yQAhwOwXLou6E4UMLYL6YllIBRkqky7dqvn0DTENZYPpqiaQCN2GBDHphnfISyE
         TIR2fvobjHZ9d7RWRgetOVHQ3yFXF6hQ1MbsGKc/8R/TnQpxvnXohNjSUdjokU8sRzot
         w/DrKWcAJp5zA0/DI7WX45FAkwIuczzF03Ffy0LbQaxYX73l4fCknZwYJqQWh7TppM2q
         8FP6KfV0QPDC4gNJpL+gBLqCxWPaKVgMzcqWIO63qBNXE1iugedonAOQypmvrbIcwxZs
         pTVA==
X-Forwarded-Encrypted: i=1; AJvYcCXuP/ksRmfEa10Zh+q4H3Dhvlfop78RnImAE49oaJwpqwzOVqVApScGPJH+AGyGX7qDVP1ouFfiLmM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6DuhBea07lRscvLFQqgkKaj0Jxpcg11Z+OqucIIrzJEH+g8lQ
	NPFO4bR84VPdRYS6AfbBQJoG613/4vjKUMUuOBZvAiWO18fFbrbZHNv+
X-Gm-Gg: ASbGnctRnEyd74gcaVNyjBUt0e9lXmkiw11JkUYUBoGywKHNxSN55Oy7T3UDY0mTeW1
	pZk+px7R7nEk0Dm3dPXh2UeBSkwfv426lARnF2rLFMyVj5bCofkdsBg/NHHbw4qSlUll5URMuNv
	0eY/IC5kJ82jM/hNLLM9ZDr3haMpL3fskXU5MhSFgWEWEfJ2loQaBdC8uBHUF44+crceygYQm2c
	8QGCdTi0dtqAbWce/Ru9M3PiaoWtoNqGMCk9cQZlRLqqAszqrIhfidA0KTcI4I5J4Wou+HI8xPv
	v/0bisFZBovZjk3kFb4kJXOrjv/FgKF0Dh/rBySwoo1SqGJtvagyfuwh8wyg0CgtaftLNkSoKwV
	lE0efKbrswQ3ZPf6XixFF1TVXDC/FoxbiiBqNI7Tc3ERcAuSbem/KQNRzpCKA4o2cxKOyTCgQIw
	ZkFxVoJm2HdGx+JgPIEFYXii9lHUYTa6++2znlLLi6WspyW9/LtVQw/sf2DzfYEj7ODhtQcXyw2
	PT0wsxilRpGuKRLaDeo1R2sDJMIRn3aQ5+mVq02QQ7EiDmRBJ507Hg=
X-Google-Smtp-Source: AGHT+IEJnkOpx+jDFVfDVEVAA+9A9htten4O+Wk4t2zNWyEJvllanqgQ7zHEta0E1x/ieCf2f13qzw==
X-Received: by 2002:a17:902:e80e:b0:297:f2e7:96f3 with SMTP id d9443c01a7336-2984edd4b8emr35121165ad.50.1762946314741;
        Wed, 12 Nov 2025 03:18:34 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dca0f28sm27386695ad.60.2025.11.12.03.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 03:18:34 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 12 Nov 2025 21:16:54 +1000
Subject: [PATCH v5 08/11] input: macsmc-input: New driver to handle the
 Apple Mac SMC buttons/lid
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-macsmc-subdevs-v5-8-728e4b91fe81@gmail.com>
References: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
In-Reply-To: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9126;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=vKrgoKS2nGnHKHWU3/7kM0p9rJhzpYANMfZNDN+lKBc=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJkiOUfPHN89o9hO0CbnPdeS8tl1U/X+hP3QcmGL0l+85
 0jxL/M/HRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNQx1jFi4OIUgKk2tGVk+Nvp56y6z4ONvd9Y20Ls765PGd/YYjTSdf+wRdytKu0RYWR4sZ/T4cq
 TQr2aiWrfbN3UXsje6jvcl3JqnpnTxc1d5sIsAA==
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
 drivers/input/misc/macsmc-input.c | 207 +++++++++++++++++++++++++
 4 files changed, 220 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fb55a167699e..48bdca6943f3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2455,6 +2455,7 @@ F:	drivers/hwmon/macsmc-hwmon.c
 F:	drivers/pmdomain/apple/
 F:	drivers/i2c/busses/i2c-pasemi-core.c
 F:	drivers/i2c/busses/i2c-pasemi-platform.c
+F:	drivers/input/misc/macsmc-input.c
 F:	drivers/input/touchscreen/apple_z2.c
 F:	drivers/iommu/apple-dart.c
 F:	drivers/iommu/io-pgtable-dart.c
diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index cc2558630797..1144ba151dbf 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -992,4 +992,15 @@ config INPUT_STPMIC1_ONKEY
 	  To compile this driver as a module, choose M here: the
 	  module will be called stpmic1_onkey.
 
+config INPUT_MACSMC
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
index f5ebfa9d9983..c6394105252f 100644
--- a/drivers/input/misc/Makefile
+++ b/drivers/input/misc/Makefile
@@ -52,6 +52,7 @@ obj-$(CONFIG_INPUT_IQS7222)		+= iqs7222.o
 obj-$(CONFIG_INPUT_KEYSPAN_REMOTE)	+= keyspan_remote.o
 obj-$(CONFIG_INPUT_KXTJ9)		+= kxtj9.o
 obj-$(CONFIG_INPUT_M68K_BEEP)		+= m68kspkr.o
+obj-$(CONFIG_INPUT_MACSMC_INPUT)	+= macsmc-input.o
 obj-$(CONFIG_INPUT_MAX7360_ROTARY)	+= max7360-rotary.o
 obj-$(CONFIG_INPUT_MAX77650_ONKEY)	+= max77650-onkey.o
 obj-$(CONFIG_INPUT_MAX77693_HAPTIC)	+= max77693-haptic.o
diff --git a/drivers/input/misc/macsmc-input.c b/drivers/input/misc/macsmc-input.c
new file mode 100644
index 000000000000..f4598e65fc80
--- /dev/null
+++ b/drivers/input/misc/macsmc-input.c
@@ -0,0 +1,207 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Apple SMC input event driver
+ * Copyright The Asahi Linux Contributors
+ *
+ * This driver exposes certain events from the SMC as an input device.
+ * This includes the lid open/close and power button notifications.
+ */
+
+#include <linux/device.h>
+#include <linux/input.h>
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
+		pm_wakeup_dev_event(smcin->dev, 0, (smcin->wakeup_mode && state));
+
+		/* Suppress KEY_POWER event to prevent immediate shutdown on wake */
+		if (smcin->wakeup_mode)
+			return;
+
+		input_report_key(smcin->input, KEY_POWER, state);
+		input_sync(smcin->input);
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
+	pm_wakeup_dev_event(smcin->dev, 0, (smcin->wakeup_mode && !lid_state));
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
+	device_init_wakeup(&pdev->dev, true);
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
+MODULE_ALIAS("platform:macsmc-input");

-- 
2.51.2


