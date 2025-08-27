Return-Path: <linux-rtc+bounces-4774-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD84B380E6
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Aug 2025 13:24:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D25421892359
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Aug 2025 11:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39DB2353341;
	Wed, 27 Aug 2025 11:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m/nBBTdP"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D6A350D55;
	Wed, 27 Aug 2025 11:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756293822; cv=none; b=OVRHHVOX6A2NBcr6IWOA88RKJWdTKUnmPUhGDSGlwpzlo2x5DS4z0otmjjWHlrMs5JNwpQ6cZI2V7GEgNAjd4z56840HmC0JvsjQNj27ViHQLbAKy3GWfaIxUKqrlynC15p1wnoyi6Zm8IRiN6C7gLV8UOp84LhrA0kKlWqxeJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756293822; c=relaxed/simple;
	bh=aUnhkhc25O58Fa5YqFoMV6tmixZgQOKzbHMDZifR9M0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m5TGf9m1xNbt91z016qZEdbAN+kVhGQiF9AZESxsy66/vViAwvnkhj063TVg/cL7ULFUDzTKvmNi9Dtccs2jHzw+JY4Ar8UNvqeKpOIp8wUuMxhRZbT8chC6jFEjoZP9a7PJlzzKE3Vv2rWb/ngm6r//nIZsa3NFhWqoLmohPvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m/nBBTdP; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-24626e06f04so43801935ad.2;
        Wed, 27 Aug 2025 04:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756293819; x=1756898619; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nwFBAcqDyw+S573uPLSPlKVhyOT8QYSk9uAcEnyCHgg=;
        b=m/nBBTdPaxeprFvTx/X2SYqwW6qnemyHf1JyRoQa/A0MXSohGMHL30ma0mt5fY1djb
         9cf9pEm7GcUScw/PL42XDHMWKcp6cc8ARQ5ErbvouNVirBeTHLSdWjMY7KfVbe8QphaV
         jZ7oeYK9RxxL5ZfRFjjdDJ/QMjMNs/pTxXiGVmAQ2emPbkN/YSHs7bTvtscDDoF2RM4r
         sttR8BGRUwXzaNkQvFAy8YKIMyXe0837oSGfkUJcU/eJGDlyzQh6+6MBCwYQ4NsyDH9S
         D5zH0+tEdyQeqX3OxG1C0AFnD5uB9vnA0mVgWKnhyJPn7d4hX6lYxbjJ7NoBvon6905V
         8cIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756293819; x=1756898619;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nwFBAcqDyw+S573uPLSPlKVhyOT8QYSk9uAcEnyCHgg=;
        b=qePpn5UJ91radsAFqQJq+hXaG4AO0Hsb4I1ZIEaoKwdIZcg6ps0K024Cs31psRGpZv
         GSHHGr0Trh5HGfZJOsjVxeOUJmjquSIGzPwycVMmcXIUoNblskA0OKQp5xBc427OpEkN
         lAgTiDOblapTHP+yVwb/qRWTtTRdR+bz/eE+YGJoB7STMwZ1hfRba4Hp3i+fVBzQDg18
         eYhpabbKXzmW9zMd8ehn3DeHUFtTxR9YbxJdgh0UhIVt1OQfOEUqP3bjl2qClS2kt0xn
         Qq3GfX47eUBt3dy9g/ub1e0Iip2Gdv0vhBovah4eAlFnuynEjBSaLpSs3Y61ydvJBOqZ
         ijbg==
X-Forwarded-Encrypted: i=1; AJvYcCUciFzS5kRLMoqZW/SoHQLQmZk31KAPd+wXyWm7lGCSIuQS8MARE+OEfFtNDeEIzSvAhfFm7ZYXG7kmXtr7@vger.kernel.org, AJvYcCUfcTlK5SWS6zCDEQbstUS+TAsBUWKpubwmHBHIjTeKdtDa5JDY76g+2vlYtaKeDZWvNpg+hYq+OegMG60=@vger.kernel.org, AJvYcCUy+8tzAJyG+YFTWuOdnAlbC+Tk5kbaKSknuoOrG4RmxIUHnmvUn6CX2quJRUcJjdv7omorQBp6A8zEdyk=@vger.kernel.org, AJvYcCWmxj7bQVMHWcpvhoB3AuN9OC5cdq7LookSQmuZg5+hHeN2MxV8kVqrOyQpzKrgbpjNafeUSjKs3T49@vger.kernel.org, AJvYcCXHfF9dMXsn7P7AwNfp+RlGLQ6uEkXDUJRLvp+ik0ao9rpSOa2d2EnMpgstulCA6z+wXKh8FTdUMJbz@vger.kernel.org
X-Gm-Message-State: AOJu0YzB+gkBd0Kn9YWCIA1T7/zmY2Y/VTba9obmyndZeeybM4/PuCnB
	I8HX7GioL4tbik6zuNbfumrzz/QxI0Fm37zO562WuBNruYziktTaav6z
X-Gm-Gg: ASbGncuSYrTMWp6gdTE550znhNCp5XdRcfoiEB5JQMvQXRb/1lIRb9sYIiMwhnyrP6M
	n6jECSuhqr2elS5X3K+FREAb6ttPM51WIuc/eWBvBDnMQjrBVe2l9KYL7uZ5kQDUKyU/S4U9/a5
	2n7Vci+RvapIfZ6qEczeAH+hC/OhYLy8kyhnvdc5TlDAgYQEhHaWjlvb1MS0/PSSrZziePb+p4w
	VEKLTP0Jkg3tlrsOF+qr1nAb9onCDgx18K/36rENwoRLOgOqBqwcp0YNOzbWl3i6gyfLFMRNM3j
	C6t5UqjLtfDgJTFKSgutvgirIcle8NH3ZKTFhMhdH/NXvzxFzAPyBA6dEzI3EesF20D8XKlFD5B
	1VAR/Xq78hSbrmOy8kc66DlMP1VxNQntycK1NuCHplQ8xMRH6sHdoNQRwL8LdgvjtsLEUI83AIM
	rSZXaq3lvWl/roupiQeAO1LqrSZO4=
X-Google-Smtp-Source: AGHT+IFJaHVzCNRC2Yngvs+SjY+onmdAmALaD5W/5FLvmbcKLAz64u5tbi8pbz4jZXP8aGLhEK2vxg==
X-Received: by 2002:a17:903:228f:b0:246:61e:b562 with SMTP id d9443c01a7336-2462f1d5493mr247040625ad.59.1756293819391;
        Wed, 27 Aug 2025 04:23:39 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fcd6232sm1819708a91.16.2025.08.27.04.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 04:23:39 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 27 Aug 2025 21:22:41 +1000
Subject: [PATCH v2 07/11] input: macsmc-hid: New driver to handle the Apple
 Mac SMC buttons/lid
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-macsmc-subdevs-v2-7-ce5e99d54c28@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9195;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=svsWxCO/igBOuKhszf8mGDGeWre4rxAc9E2zZQZ5XiQ=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBnrXjW/2qQR8ZqPOafC+tE/P5PH0WetvN4qxElfeyHg5
 vru7YOejlIWBjEuBlkxRZYNTUIes43YbvaLVO6FmcPKBDKEgYtTACbi/5WR4UrfG6MzTrVZj3o/
 iF22sl7iX3r5u2r3hu13Z2/xsi2bdpyRoU30lZpSpnCG60354nnJLTIFigH1dvIGJuxGLz5s3NL
 JCgA=
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
 drivers/input/misc/macsmc-hid.c | 209 +++++++++++++++++++++++++
 4 files changed, 222 insertions(+)

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
index 0000000000000000000000000000000000000000..c7cd56e5c17f08936cc623f7d3690f27e05012a5
--- /dev/null
+++ b/drivers/input/misc/macsmc-hid.c
@@ -0,0 +1,209 @@
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

-- 
2.51.0


