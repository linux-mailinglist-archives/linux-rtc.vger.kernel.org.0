Return-Path: <linux-rtc+bounces-4720-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 337A1B2C221
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Aug 2025 13:51:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0702A1887754
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Aug 2025 11:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0079335BD5;
	Tue, 19 Aug 2025 11:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FA7Fz/rC"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEA43314A0;
	Tue, 19 Aug 2025 11:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755604126; cv=none; b=cU+vfsDJkRzbguV7pCzoHJJzALiufdco6RmTWZLJW9dJF3XpVT0m6kY6IoQ3nH78Svej0na3Ifs8UBIIFdbK9XHnmS1AKSnLu5otj/KqnXQSmmmz+Fwg2xw+LJwMnhdSBMxyR68Ipf/dTBwZaVg2J7MrBIA3bLssjTtRMtF59tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755604126; c=relaxed/simple;
	bh=h/3XHUJRRkzWhH3que8CCD1U/Xs8MbOjWft7S2baHYQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VygRzQ85UaO11kQt/TVNxG/osVbqlm4d1CTB3BcyXyccxw/xepPDv6cfEEDzphi5ZMywaXFDgieujMWavgI53vZS10elOytanR9f9vgo0/P3pOYqz2TXNTm+PLNVi0ip6Nui4XsHaIUThfPncnPFbX2+9DHcsUqAUlRXJl9Ykjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FA7Fz/rC; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-76e2ea94c7cso4504722b3a.2;
        Tue, 19 Aug 2025 04:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755604123; x=1756208923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bXRoXM3DvDAsJ4ioc/Y/G/EGKWE3my87dTILegnnEzc=;
        b=FA7Fz/rCI4Bclt2LrrjTSFQR0YW1cnEkl5j0wFgbR0EBGJRg/opBdaw37UnJCs6mWl
         lxo0xuyIjshGI3UiT/KtnANZtArVKvuKbmwo9LATKXNxwdHnj3S9sibiLX1JIRJyEIt3
         nPPllwSJysg9D7/CaEGt3s5Zc93v2y8bQSyM3KzdfgHSYHePb2wUjAf43sSLDPAQVdhq
         ASWIgyldfwQxYbU75bBYxl2b+v7MqkSg6DhOqMFBBJhozJr2S/Lct+AJJ02McC0SBzjQ
         U0AaR9iaPBbN9/pTBvMGErFgpjtQdphEqspvZJj1cLOn/oCnJ6tafAyj2A2Ohyg8zJEp
         TwRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755604123; x=1756208923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bXRoXM3DvDAsJ4ioc/Y/G/EGKWE3my87dTILegnnEzc=;
        b=QskTTWmWZ9V4fvrcYWnZyZvLcNYDVLvsdVbihtr9TQmpwd7E6H3cmoxIz7a/LHzeFT
         RmCsiABazsZ9VDB/n6u8NS3p0IFkGqpbBXDLfKih8ysXIUZyI3XyXr9oTK7LC97Pylaf
         mYK330pW7S+UzHPXmE22sw4fz7HngYWSpeZgPYjFl7Qj5vkESRH1dQNI+Vem5J4p60qp
         k5VYBtY1u0MZLdPIOuIvxHyZIpoFLmwl74Vo+1tJv+QX7NpZOavpC2rAb7MET5F/klJ9
         iaBCxvm1/JHr7gYjDr9n3PbRoshWcLdqe+zXT1XUH0z9t/sXYcpR8n6a9hyFUwGW55FH
         F9Ag==
X-Forwarded-Encrypted: i=1; AJvYcCW0Ueo0ESpdVCt9JIB+4xAeCxzeY1zlAieD44f5Kd5726Mcd/gUHssWh8RD0/88OiO+PAiG+F/P4nn/KO7e@vger.kernel.org, AJvYcCWUKT7gd3tCR/K1yFucqe9B1JVnIGlU/TkmjQhfZRP1aYytrpPOFFM+OyCcECb5u2bDDloAQdzLYGAS@vger.kernel.org, AJvYcCWZbTLURWj3F8KQL6gM5Spm36K1+zw8Ydxr4YqmW0LNxhjHiAKd50EubeydTVe4qwsOuFXAHA2cQQdq@vger.kernel.org, AJvYcCWiTfOrEC2p6JHDl7qEVVy++sYsLkGwpi0KF5AX4VyORY3kqTAyY40NHKFc6zsw8FNco8zL8XtqjURSaHQ=@vger.kernel.org, AJvYcCXBiNXEg7l2wYHPCWIQFIVPqm5BGv+PEykT84M3sB0uFVV1lG1FhXrV3TaTKKUlp0qyl16uvPoqVKtTdWM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz2ci2grVY/FN4xVOvy/K1JubTqzL8zJh/lTk1MIjRnvwadSHR
	glEKWXkRb74LU1tiA5JJYJZ3t4dOWDPIrpv+aHQ+POZs1Zb2EWnldBgo9Cpzr08M
X-Gm-Gg: ASbGncsRZh27YeRnZ6QkNykJA1vapnQHRlg2mRsn8zLhfQgd7S+pC+MPxCyi9HKUEuX
	edyBbIThHS8SiG9Bg5qBl8qoweQZkuDB+nJ9+YSMqk6KItvj8d2cOG3QyYm0uIO/gbkU/uhKMel
	Pr9eiN6O/phTaACUeZ5p5ez0hZUxNiJKdtK+oOQOaMQkh4WbCuW6ByQ1Nns+PZIfPwgAsrLaLRZ
	bWGCvdPzoArNWii6/wUkZ3O6g41Hr3I2xybUmU/pGKxvyDK+Ekp7Xtx0+ZsuBI9dbclfOnU1cEJ
	eC+8S2YaokljTIqLZ3AkoAUCYaQl8W61giIArGfdKQ8suLtMTdJ4m5S86997p3uXkNu8oMV4HSp
	KSKiZqwtkTUnUjZfa0LSFuucvoJ9vTFqM7nJPzZKqcZarYnT8K7x/bE31DZO5FB/Wyjd2+StveN
	ecIL7ozZJh3yxVbx8=
X-Google-Smtp-Source: AGHT+IHNuaJ0iQlKsaqW/TpGaZtDz/UoIX9Qtn8OcFIfbGXQhTIKU1bXyqHLmLAOXfJrLMQXsEGaEQ==
X-Received: by 2002:a05:6a20:5483:b0:240:1c36:7979 with SMTP id adf61e73a8af0-2430d42cc7dmr2771195637.28.1755604123006;
        Tue, 19 Aug 2025 04:48:43 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d76a430sm10286316a12.43.2025.08.19.04.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:48:42 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 19 Aug 2025 21:47:57 +1000
Subject: [PATCH 5/8] input: macsmc-hid: New driver to handle the Apple Mac
 SMC buttons/lid
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-macsmc-subdevs-v1-5-57df6c3e5f19@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9790;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=Ywfc4mmL8m8wZ4DdTYNSycoo5uhc8m+LjSm+qJ/8tn0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlLUvJnlzfMFNCqmdL50kdKS2F5yNTMmsSzyg9a3GZO6
 tCXzzvWUcrCIMbFICumyLKhSchjthHbzX6Ryr0wc1iZQIYwcHEKwEQsVjAytEffkpeetOjJ/7yG
 S/0n+pUyplTJGkmIqXUpWN+b/6ZkCsM/oyMSHw0euftH3HWOSPd13cGTERix8bfYsqiY/rpq9fd
 8AA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

This driver implements power button and lid switch support for Apple Mac
devices using SMC controllers driven by the macsmc driver.

In addition to basic input support, this also responds to the final
shutdown warning (when the power button is held down long enough) by
doing an emergency kernel poweroff. This allows the NVMe controller to
be cleanly shut down, which prevents data loss for in-cache data.

Signed-off-by: Hector Martin <marcan@marcan.st>
Co-developed-by: Sven Peter <sven@kernel.org>
Signed-off-by: Sven Peter <sven@kernel.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 MAINTAINERS                     |   1 +
 drivers/input/misc/Kconfig      |  11 ++
 drivers/input/misc/Makefile     |   1 +
 drivers/input/misc/macsmc-hid.c | 210 +++++++++++++++++++++++++
 drivers/mfd/macsmc.c            |   1 +
 5 files changed, 224 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2eb23522654dd050262eb06e077587030cc335aa..b3b5220fcd0d4bbef67613c8ee9afa880c0aa45d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2412,6 +2412,7 @@ F:	drivers/hwmon/macsmc_hwmon.c
 F:	drivers/pmdomain/apple/
 F:	drivers/i2c/busses/i2c-pasemi-core.c
 F:	drivers/i2c/busses/i2c-pasemi-platform.c
+F:	drivers/input/misc/macsmc-hid.c
 F:	drivers/input/touchscreen/apple_z2.c
 F:	drivers/iommu/apple-dart.c
 F:	drivers/iommu/io-pgtable-dart.c
diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 0fb21c99a5e3d1230d7f40f99e0c2d360bbe80e8..a430c50e7f63f245bba56bd526026ec7901cf821 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -961,4 +961,15 @@ config INPUT_STPMIC1_ONKEY
 	  To compile this driver as a module, choose M here: the
 	  module will be called stpmic1_onkey.
 
+config INPUT_MACSMC_HID
+	tristate "Apple Mac SMC lid/buttons"
+	depends on MFD_MACSMC
+	help
+	  Say Y here if you want to use the input events delivered via the
+	  SMC controller on Apple Mac machines using the macsmc driver.
+	  This includes lid open/close and the power button.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called macsmc-hid.
+
 endif
diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
index d468c8140b93da5bb537e8a3baea2b90e7bb4229..95b8ebbb9ebbe6f3afc9db724d2ebeba1d75d1a6 100644
--- a/drivers/input/misc/Makefile
+++ b/drivers/input/misc/Makefile
@@ -51,6 +51,7 @@ obj-$(CONFIG_INPUT_IQS7222)		+= iqs7222.o
 obj-$(CONFIG_INPUT_KEYSPAN_REMOTE)	+= keyspan_remote.o
 obj-$(CONFIG_INPUT_KXTJ9)		+= kxtj9.o
 obj-$(CONFIG_INPUT_M68K_BEEP)		+= m68kspkr.o
+obj-$(CONFIG_INPUT_MACSMC_HID)		+= macsmc-hid.o
 obj-$(CONFIG_INPUT_MAX77650_ONKEY)	+= max77650-onkey.o
 obj-$(CONFIG_INPUT_MAX77693_HAPTIC)	+= max77693-haptic.o
 obj-$(CONFIG_INPUT_MAX8925_ONKEY)	+= max8925_onkey.o
diff --git a/drivers/input/misc/macsmc-hid.c b/drivers/input/misc/macsmc-hid.c
new file mode 100644
index 0000000000000000000000000000000000000000..cdeef6c4797f82f464e3a6a760dbaaf186e1c58d
--- /dev/null
+++ b/drivers/input/misc/macsmc-hid.c
@@ -0,0 +1,210 @@
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
+
+/**
+ * struct macsmc_hid
+ * @dev: Underlying struct device for the HID sub-device
+ * @smc: Pointer to apple_smc struct of the mfd parent
+ * @input: Allocated input_dev; devres managed
+ * @nb: Notifier block used for incoming events from SMC (e.g. button pressed down)
+ * @wakeup_mode: Set to true when system is suspended and power button events should wake it
+ */
+struct macsmc_hid {
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
+static void macsmc_hid_event_button(struct macsmc_hid *smchid, unsigned long event)
+{
+	u8 button = (event >> 8) & 0xff;
+	u8 state = !!(event & 0xff);
+
+	switch (button) {
+	case BTN_POWER:
+	case BTN_TOUCHID:
+		if (smchid->wakeup_mode) {
+			if (state)
+				pm_wakeup_hard_event(smchid->dev);
+		} else {
+			input_report_key(smchid->input, KEY_POWER, state);
+			input_sync(smchid->input);
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
+			dev_crit(smchid->dev, "Triggering forced shutdown!\n");
+			if (kernel_can_power_off())
+				kernel_power_off();
+			else /* Missing macsmc-reboot driver? */
+				kernel_restart("SMC power button triggered restart");
+		}
+		break;
+	default:
+		dev_warn(smchid->dev, "Unknown SMC button event: %04lx\n", event & 0xffff);
+	}
+}
+
+static void macsmc_hid_event_lid(struct macsmc_hid *smchid, unsigned long event)
+{
+	u8 lid_state = !!((event >> 8) & 0xff);
+
+	if (smchid->wakeup_mode && !lid_state)
+		pm_wakeup_hard_event(smchid->dev);
+
+	input_report_switch(smchid->input, SW_LID, lid_state);
+	input_sync(smchid->input);
+}
+
+static int macsmc_hid_event(struct notifier_block *nb, unsigned long event, void *data)
+{
+	struct macsmc_hid *smchid = container_of(nb, struct macsmc_hid, nb);
+	u16 type = event >> 16;
+
+	switch (type) {
+	case SMC_EV_BTN:
+		macsmc_hid_event_button(smchid, event);
+		return NOTIFY_OK;
+	case SMC_EV_LID:
+		macsmc_hid_event_lid(smchid, event);
+		return NOTIFY_OK;
+	default:
+		/* SMC event meant for another driver */
+		return NOTIFY_DONE;
+	}
+}
+
+static int macsmc_hid_probe(struct platform_device *pdev)
+{
+	struct apple_smc *smc = dev_get_drvdata(pdev->dev.parent);
+	struct macsmc_hid *smchid;
+	bool have_lid, have_power;
+	int ret;
+
+	/* Bail early if this SMC neither supports power button nor lid events */
+	have_lid = apple_smc_key_exists(smc, SMC_KEY(MSLD));
+	have_power = apple_smc_key_exists(smc, SMC_KEY(bHLD));
+	if (!have_lid && !have_power)
+		return -ENODEV;
+
+	smchid = devm_kzalloc(&pdev->dev, sizeof(*smchid), GFP_KERNEL);
+	if (!smchid)
+		return -ENOMEM;
+
+	smchid->dev = &pdev->dev;
+	smchid->smc = smc;
+	platform_set_drvdata(pdev, smchid);
+
+	smchid->input = devm_input_allocate_device(&pdev->dev);
+	if (!smchid->input)
+		return -ENOMEM;
+
+	smchid->input->phys = "macsmc-hid (0)";
+	smchid->input->name = "Apple SMC power/lid events";
+
+	if (have_lid)
+		input_set_capability(smchid->input, EV_SW, SW_LID);
+	if (have_power)
+		input_set_capability(smchid->input, EV_KEY, KEY_POWER);
+
+	ret = input_register_device(smchid->input);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to register input device: %d\n", ret);
+		return ret;
+	}
+
+	if (have_lid) {
+		u8 val;
+
+		ret = apple_smc_read_u8(smc, SMC_KEY(MSLD), &val);
+		if (ret < 0)
+			dev_warn(&pdev->dev, "Failed to read initial lid state\n");
+		else
+			input_report_switch(smchid->input, SW_LID, val);
+	}
+
+	if (have_power) {
+		u32 val;
+
+		ret = apple_smc_read_u32(smc, SMC_KEY(bHLD), &val);
+		if (ret < 0)
+			dev_warn(&pdev->dev, "Failed to read initial power button state\n");
+		else
+			input_report_key(smchid->input, KEY_POWER, val & 1);
+	}
+
+	input_sync(smchid->input);
+
+	smchid->nb.notifier_call = macsmc_hid_event;
+	blocking_notifier_chain_register(&smc->event_handlers, &smchid->nb);
+
+	device_init_wakeup(&pdev->dev, 1);
+
+	return 0;
+}
+
+static int macsmc_hid_pm_prepare(struct device *dev)
+{
+	struct macsmc_hid *smchid = dev_get_drvdata(dev);
+
+	smchid->wakeup_mode = true;
+	return 0;
+}
+
+static void macsmc_hid_pm_complete(struct device *dev)
+{
+	struct macsmc_hid *smchid = dev_get_drvdata(dev);
+
+	smchid->wakeup_mode = false;
+}
+
+static const struct dev_pm_ops macsmc_hid_pm_ops = {
+	.prepare = macsmc_hid_pm_prepare,
+	.complete = macsmc_hid_pm_complete,
+};
+
+static struct platform_driver macsmc_hid_driver = {
+	.driver = {
+		.name = "macsmc-hid",
+		.pm = &macsmc_hid_pm_ops,
+	},
+	.probe = macsmc_hid_probe,
+};
+module_platform_driver(macsmc_hid_driver);
+
+MODULE_AUTHOR("Hector Martin <marcan@marcan.st>");
+MODULE_LICENSE("Dual MIT/GPL");
+MODULE_DESCRIPTION("Apple SMC HID driver");
+MODULE_ALIAS("platform:macsmc-hid");
diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index bc4adf2fcfdce6c5ecbc51ced0e5985cbd36f54d..6a5ac449e23ddda0ebe4980614c49fe6c3bae50d 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -45,6 +45,7 @@
 #define SMC_TIMEOUT_MS		500
 
 static const struct mfd_cell apple_smc_devs[] = {
+	MFD_CELL_NAME("macsmc-hid"),
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),
 	MFD_CELL_OF("macsmc-rtc", NULL, NULL, 0, 0, "apple,smc-rtc"),

-- 
2.50.1


