Return-Path: <linux-rtc+bounces-3432-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD65A587BE
	for <lists+linux-rtc@lfdr.de>; Sun,  9 Mar 2025 20:37:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 494C77A3D25
	for <lists+linux-rtc@lfdr.de>; Sun,  9 Mar 2025 19:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D40621639A;
	Sun,  9 Mar 2025 19:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="SILeZuVP"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A86216388;
	Sun,  9 Mar 2025 19:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741549014; cv=none; b=smXpyY2jqX4enS0NOSj+4E1t3YgU9PaKfE6L5EgPGq13omLn5kTWrU8vlCvwgqVkRXs3HRw9ZtFLGPqZ4zcoYo5jCu1zWlQtjr22PRE6DO1S+d9JHWfAe5AJ2oMg3KzZyXce1bsy/lNntQ6ecG7/DcfxOfjSYEPVSHEHWZ50xfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741549014; c=relaxed/simple;
	bh=AmOnxCl6VMkvyUIZIBYPteXM3jnjk8O+hDJEzX9PwFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E2VIZXLAjqbMRpHAjnxAnQ01FFbFA25/EGGRgh3GW/NqRf7iwuDZDOXY3JM1wHycKBXeWHHn9lsPKXx/yEN/i2AmVTGW1KfT5M1TKcBo4+YShB54lnstPBWm1kjOVTdldtpNGXlHrLBhYMsGAU7Yen62d2H54z2uYvm/oIKiX3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=SILeZuVP; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=wXJG4DdPfH5YbEXGNyBX36kBZ9j7FqrQdHP7jpJY2MY=; b=SILeZuVPup7kTuoo
	ItaTd1943KG0AIm0wP/3YtqTbHgs7GHSoHn+Q5xgX99xqjMoYNxEyBia55oFkvcyNt2gInIo8TO1q
	ui0UkwprdlyQUHr7qPU2CSLXGjz0GVC0oSoy4bMVtGKl16BVvCBTPItQ9binzVJe06zxZr87H7pc3
	EqzghXcRXWROQ771hBD6kT91bBg2rXiY9U6L40rKBOnO/RUb8+HrBbdWg5Rhlr+IINlQz1A25VngP
	8efari02x7nQ4PMVrZrT/CSJjcJGURa3x+3kQezeIbcAAvzvQiLINm5ZD0D2+1K0MmkCz6pNH/xv3
	a/nqlTY3i8TxuNP+yw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1trMS6-003kFU-2O;
	Sun, 09 Mar 2025 19:36:46 +0000
From: linux@treblig.org
To: arnd@arndb.de,
	lee@kernel.org,
	dmitry.torokhov@gmail.com,
	sre@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	danielt@kernel.org,
	jingoohan1@gmail.com,
	deller@gmx.de,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 5/9] Input: pcf50633-input - Remove
Date: Sun,  9 Mar 2025 19:36:08 +0000
Message-ID: <20250309193612.251929-6-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309193612.251929-1-linux@treblig.org>
References: <20250309193612.251929-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

The pcf50633 was used as part of the OpenMoko devices but
the support for its main chip was recently removed in:
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support")

See https://lore.kernel.org/all/Z8z236h4B5A6Ki3D@gallifrey/

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/input/misc/Kconfig          |   7 --
 drivers/input/misc/Makefile         |   1 -
 drivers/input/misc/pcf50633-input.c | 113 ----------------------------
 drivers/mfd/pcf50633-core.c         |   2 -
 include/linux/mfd/pcf50633/core.h   |   1 -
 5 files changed, 124 deletions(-)
 delete mode 100644 drivers/input/misc/pcf50633-input.c

diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 13d135257e06..62819144bd8c 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -584,13 +584,6 @@ config INPUT_PALMAS_PWRBUTTON
 	  To compile this driver as a module, choose M here. The module will
 	  be called palmas_pwrbutton.
 
-config INPUT_PCF50633_PMU
-	tristate "PCF50633 PMU events"
-	depends on MFD_PCF50633
-	help
-	 Say Y to include support for delivering  PMU events via  input
-	 layer on NXP PCF50633.
-
 config INPUT_PCF8574
 	tristate "PCF8574 Keypad input device"
 	depends on I2C
diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
index 6d91804d0a6f..d468c8140b93 100644
--- a/drivers/input/misc/Makefile
+++ b/drivers/input/misc/Makefile
@@ -59,7 +59,6 @@ obj-$(CONFIG_INPUT_MC13783_PWRBUTTON)	+= mc13783-pwrbutton.o
 obj-$(CONFIG_INPUT_MMA8450)		+= mma8450.o
 obj-$(CONFIG_INPUT_PALMAS_PWRBUTTON)	+= palmas-pwrbutton.o
 obj-$(CONFIG_INPUT_PCAP)		+= pcap_keys.o
-obj-$(CONFIG_INPUT_PCF50633_PMU)	+= pcf50633-input.o
 obj-$(CONFIG_INPUT_PCF8574)		+= pcf8574_keypad.o
 obj-$(CONFIG_INPUT_PCSPKR)		+= pcspkr.o
 obj-$(CONFIG_INPUT_PM8941_PWRKEY)	+= pm8941-pwrkey.o
diff --git a/drivers/input/misc/pcf50633-input.c b/drivers/input/misc/pcf50633-input.c
deleted file mode 100644
index 6d046e236ba6..000000000000
--- a/drivers/input/misc/pcf50633-input.c
+++ /dev/null
@@ -1,113 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/* NXP PCF50633 Input Driver
- *
- * (C) 2006-2008 by Openmoko, Inc.
- * Author: Balaji Rao <balajirrao@openmoko.org>
- * All rights reserved.
- *
- * Broken down from monstrous PCF50633 driver mainly by
- * Harald Welte, Andy Green and Werner Almesberger
- */
-
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/device.h>
-#include <linux/platform_device.h>
-#include <linux/input.h>
-#include <linux/slab.h>
-
-#include <linux/mfd/pcf50633/core.h>
-
-#define PCF50633_OOCSTAT_ONKEY	0x01
-#define PCF50633_REG_OOCSTAT	0x12
-#define PCF50633_REG_OOCMODE	0x10
-
-struct pcf50633_input {
-	struct pcf50633 *pcf;
-	struct input_dev *input_dev;
-};
-
-static void
-pcf50633_input_irq(int irq, void *data)
-{
-	struct pcf50633_input *input;
-	int onkey_released;
-
-	input = data;
-
-	/* We report only one event depending on the key press status */
-	onkey_released = pcf50633_reg_read(input->pcf, PCF50633_REG_OOCSTAT)
-						& PCF50633_OOCSTAT_ONKEY;
-
-	if (irq == PCF50633_IRQ_ONKEYF && !onkey_released)
-		input_report_key(input->input_dev, KEY_POWER, 1);
-	else if (irq == PCF50633_IRQ_ONKEYR && onkey_released)
-		input_report_key(input->input_dev, KEY_POWER, 0);
-
-	input_sync(input->input_dev);
-}
-
-static int pcf50633_input_probe(struct platform_device *pdev)
-{
-	struct pcf50633_input *input;
-	struct input_dev *input_dev;
-	int ret;
-
-
-	input = kzalloc(sizeof(*input), GFP_KERNEL);
-	if (!input)
-		return -ENOMEM;
-
-	input_dev = input_allocate_device();
-	if (!input_dev) {
-		kfree(input);
-		return -ENOMEM;
-	}
-
-	platform_set_drvdata(pdev, input);
-	input->pcf = dev_to_pcf50633(pdev->dev.parent);
-	input->input_dev = input_dev;
-
-	input_dev->name = "PCF50633 PMU events";
-	input_dev->id.bustype = BUS_I2C;
-	input_dev->evbit[0] = BIT(EV_KEY) | BIT(EV_PWR);
-	set_bit(KEY_POWER, input_dev->keybit);
-
-	ret = input_register_device(input_dev);
-	if (ret) {
-		input_free_device(input_dev);
-		kfree(input);
-		return ret;
-	}
-	pcf50633_register_irq(input->pcf, PCF50633_IRQ_ONKEYR,
-				pcf50633_input_irq, input);
-	pcf50633_register_irq(input->pcf, PCF50633_IRQ_ONKEYF,
-				pcf50633_input_irq, input);
-
-	return 0;
-}
-
-static void pcf50633_input_remove(struct platform_device *pdev)
-{
-	struct pcf50633_input *input  = platform_get_drvdata(pdev);
-
-	pcf50633_free_irq(input->pcf, PCF50633_IRQ_ONKEYR);
-	pcf50633_free_irq(input->pcf, PCF50633_IRQ_ONKEYF);
-
-	input_unregister_device(input->input_dev);
-	kfree(input);
-}
-
-static struct platform_driver pcf50633_input_driver = {
-	.driver = {
-		.name = "pcf50633-input",
-	},
-	.probe = pcf50633_input_probe,
-	.remove = pcf50633_input_remove,
-};
-module_platform_driver(pcf50633_input_driver);
-
-MODULE_AUTHOR("Balaji Rao <balajirrao@openmoko.org>");
-MODULE_DESCRIPTION("PCF50633 input driver");
-MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:pcf50633-input");
diff --git a/drivers/mfd/pcf50633-core.c b/drivers/mfd/pcf50633-core.c
index d991a77f6dd2..f12359f42140 100644
--- a/drivers/mfd/pcf50633-core.c
+++ b/drivers/mfd/pcf50633-core.c
@@ -207,7 +207,6 @@ static int pcf50633_probe(struct i2c_client *client)
 	pcf50633_irq_init(pcf, client->irq);
 
 	/* Create sub devices */
-	pcf50633_client_dev_register(pcf, "pcf50633-input", &pcf->input_pdev);
 	pcf50633_client_dev_register(pcf, "pcf50633-mbc", &pcf->mbc_pdev);
 
 
@@ -257,7 +256,6 @@ static void pcf50633_remove(struct i2c_client *client)
 	sysfs_remove_group(&client->dev.kobj, &pcf_attr_group);
 	pcf50633_irq_free(pcf);
 
-	platform_device_unregister(pcf->input_pdev);
 	platform_device_unregister(pcf->mbc_pdev);
 
 	for (i = 0; i < PCF50633_NUM_REGULATORS; i++)
diff --git a/include/linux/mfd/pcf50633/core.h b/include/linux/mfd/pcf50633/core.h
index f5ab3e64c230..8d63059f1153 100644
--- a/include/linux/mfd/pcf50633/core.h
+++ b/include/linux/mfd/pcf50633/core.h
@@ -147,7 +147,6 @@ struct pcf50633 {
 	int onkey1s_held;
 
 	struct platform_device *mbc_pdev;
-	struct platform_device *input_pdev;
 	struct platform_device *regulator_pdev[PCF50633_NUM_REGULATORS];
 };
 
-- 
2.48.1


