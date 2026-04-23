Return-Path: <linux-rtc+bounces-6403-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AM4NBhV46mkUzwIAu9opvQ
	(envelope-from <linux-rtc+bounces-6403-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 23 Apr 2026 21:50:45 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E64B3456EEE
	for <lists+linux-rtc@lfdr.de>; Thu, 23 Apr 2026 21:50:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 003B33004F1D
	for <lists+linux-rtc@lfdr.de>; Thu, 23 Apr 2026 19:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1918D397690;
	Thu, 23 Apr 2026 19:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="FG5yY2jl"
X-Original-To: linux-rtc@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F191D38E133;
	Thu, 23 Apr 2026 19:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776973842; cv=none; b=rxbc1b6lw7vM8SQfNglWcc8AcJxD48I4dnh6vaGWcE1Z5xmcKFAXkQuS2LcoGRDFIwToMaWmuFy54wA7izYcyVC1JzdOJVhw4nnVO4bLZZ5MfY6wDCxj7pOYgv/ersPgQkYvrKdf2JSvGhkrHET68xGBAJCxzEWu5/RwHQ9EUR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776973842; c=relaxed/simple;
	bh=cfpbhpQNgGVhnRRMf4ZxWDpz78+RDImmD7OiBUAm+hA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ePXMmC3G8P07PT11MZXF2KpKoWIc0CkqodhZL/MowXEb7WrCWFevqcAflCz+s9FNLM9W/MhgCbjQvy5zH8AQJvhgLXpF00RPjxgtswi0OsV1c5m2W4tEW2hziRwKvemxCqzSdaJZolNlwjcWJ1X/jsf4fXKruyKrL4HPgWVtcFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=FG5yY2jl; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 5210326E03;
	Thu, 23 Apr 2026 21:50:38 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nkHtpgpqGGSw; Thu, 23 Apr 2026 21:50:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1776973837; bh=cfpbhpQNgGVhnRRMf4ZxWDpz78+RDImmD7OiBUAm+hA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=FG5yY2jl8fE6Rz2oZwWYIabMo5KvT1kbFyJ/Ojuek+Kq+04AWIe9sDQXLhfZwzq+8
	 NJobiJpPid4Z4qE2xpi7at/N9WNJcCcirYawIbTfT50lJZv6oesMyOtsoj7vW5uNjX
	 M0CfF5aMJ71XXoh7Yw23w4qsSEO1rK2nxDm3PoTPlXmCMBZIHi7KIytKxTgLgOizV1
	 mGPuQR+RKEgfwODF0sOzlie4w8Pf+FQOHFcuE3bybn9iOnwTfFLgd0XClmQA5liro+
	 gXdX+x7VIR6lfcrarx0Jup2ovYDm+YLM4p1kH6bxBtYDswpHZFnFUyvPy7hn9ZPlD1
	 3zHHcK5JcSX8w==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 24 Apr 2026 01:09:06 +0530
Subject: [PATCH v5 07/11] leds: flash: add support for Samsung S2M series
 PMIC flash LED device
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-s2mu005-pmic-v5-7-fcbc9da5a004@disroot.org>
References: <20260424-s2mu005-pmic-v5-0-fcbc9da5a004@disroot.org>
In-Reply-To: <20260424-s2mu005-pmic-v5-0-fcbc9da5a004@disroot.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Sebastian Reichel <sre@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Nam Tran <trannamatk@gmail.com>, 
 =?utf-8?q?=C5=81ukasz_Lebiedzi=C5=84ski?= <kernel@lvkasz.us>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-doc@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6403-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,samsung.com,linaro.org,bootlin.com,lwn.net,linuxfoundation.org,gmail.com,lvkasz.us];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[disroot.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kauschluss@disroot.org,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,disroot.org:email,disroot.org:dkim,disroot.org:mid]
X-Rspamd-Queue-Id: E64B3456EEE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for flash LEDs found in certain Samsung S2M series PMICs.
The device has two channels for LEDs, typically for the back and front
cameras in mobile devices. Both channels can be independently
controlled, and can be operated in torch or flash modes.

The driver includes initial support for the S2MU005 PMIC flash LEDs.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/leds/flash/Kconfig          |  12 ++
 drivers/leds/flash/Makefile         |   1 +
 drivers/leds/flash/leds-s2m-flash.c | 358 ++++++++++++++++++++++++++++++++++++
 3 files changed, 371 insertions(+)

diff --git a/drivers/leds/flash/Kconfig b/drivers/leds/flash/Kconfig
index 5e08102a67841..be62e05277429 100644
--- a/drivers/leds/flash/Kconfig
+++ b/drivers/leds/flash/Kconfig
@@ -114,6 +114,18 @@ config LEDS_RT8515
 	  To compile this driver as a module, choose M here: the module
 	  will be called leds-rt8515.
 
+config LEDS_S2M_FLASH
+	tristate "Samsung S2M series PMICs flash/torch LED support"
+	depends on LEDS_CLASS
+	depends on MFD_SEC_CORE
+	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
+	select REGMAP_IRQ
+	help
+	  This option enables support for the flash/torch LEDs found in
+	  certain Samsung S2M series PMICs, such as the S2MU005. It has
+	  a LED channel dedicated for every physical LED. The LEDs can
+	  be controlled in flash and torch modes.
+
 config LEDS_SGM3140
 	tristate "LED support for the SGM3140"
 	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
diff --git a/drivers/leds/flash/Makefile b/drivers/leds/flash/Makefile
index 712fb737a428e..44e6c1b4beb37 100644
--- a/drivers/leds/flash/Makefile
+++ b/drivers/leds/flash/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_LEDS_MAX77693)	+= leds-max77693.o
 obj-$(CONFIG_LEDS_QCOM_FLASH)	+= leds-qcom-flash.o
 obj-$(CONFIG_LEDS_RT4505)	+= leds-rt4505.o
 obj-$(CONFIG_LEDS_RT8515)	+= leds-rt8515.o
+obj-$(CONFIG_LEDS_S2M_FLASH)	+= leds-s2m-flash.o
 obj-$(CONFIG_LEDS_SGM3140)	+= leds-sgm3140.o
 obj-$(CONFIG_LEDS_SY7802)	+= leds-sy7802.o
 obj-$(CONFIG_LEDS_TPS6131X)	+= leds-tps6131x.o
diff --git a/drivers/leds/flash/leds-s2m-flash.c b/drivers/leds/flash/leds-s2m-flash.c
new file mode 100644
index 0000000000000..177d23b432ce6
--- /dev/null
+++ b/drivers/leds/flash/leds-s2m-flash.c
@@ -0,0 +1,358 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Flash and Torch LED Driver for Samsung S2M series PMICs.
+ *
+ * Copyright (c) 2015 Samsung Electronics Co., Ltd
+ * Copyright (c) 2026 Kaustabh Chakraborty <kauschluss@disroot.org>
+ */
+
+#include <linux/container_of.h>
+#include <linux/led-class-flash.h>
+#include <linux/mfd/samsung/core.h>
+#include <linux/mfd/samsung/s2mu005.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <media/v4l2-flash-led-class.h>
+
+#define MAX_CHANNELS	2
+
+struct s2m_led {
+	struct regmap *regmap;
+	struct led_classdev_flash fled;
+	struct v4l2_flash *v4l2_flash;
+	/*
+	 * The mutex object prevents the concurrent access of flash control
+	 * registers by the LED and V4L2 subsystems.
+	 */
+	struct mutex lock;
+	unsigned int reg_enable;
+	u8 channel;
+	u8 flash_brightness;
+	u8 flash_timeout;
+};
+
+static struct s2m_led *to_s2m_led(struct led_classdev_flash *fled)
+{
+	return container_of(fled, struct s2m_led, fled);
+}
+
+static struct led_classdev_flash *to_s2m_fled(struct led_classdev *cdev)
+{
+	return container_of(cdev, struct led_classdev_flash, led_cdev);
+}
+
+static int s2m_fled_flash_brightness_set(struct led_classdev_flash *fled, u32 brightness)
+{
+	struct s2m_led *led = to_s2m_led(fled);
+	struct led_flash_setting *setting = &fled->brightness;
+
+	led->flash_brightness = (brightness - setting->min) / setting->step;
+
+	return 0;
+}
+
+static int s2m_fled_flash_timeout_set(struct led_classdev_flash *fled, u32 timeout)
+{
+	struct s2m_led *led = to_s2m_led(fled);
+	struct led_flash_setting *setting = &fled->timeout;
+
+	led->flash_timeout = (timeout - setting->min) / setting->step;
+
+	return 0;
+}
+
+#if IS_ENABLED(CONFIG_V4L2_FLASH_LED_CLASS)
+static int s2m_fled_flash_external_strobe_set(struct v4l2_flash *v4l2_flash, bool enable)
+{
+	struct s2m_led *led = to_led(v4l2_flash->fled_cdev);
+
+	mutex_lock(&led->lock);
+
+	led->fled.ops->strobe_set(&led->fled, enable);
+
+	mutex_unlock(&led->lock);
+
+	return 0;
+}
+
+static const struct v4l2_flash_ops s2m_fled_v4l2_flash_ops = {
+	.external_strobe_set = s2m_fled_flash_external_strobe_set,
+};
+#else
+static const struct v4l2_flash_ops s2m_fled_v4l2_flash_ops;
+#endif
+
+static void s2m_fled_v4l2_flash_release(void *v4l2_flash)
+{
+	v4l2_flash_release(v4l2_flash);
+}
+
+static int s2mu005_fled_torch_brightness_set(struct led_classdev *cdev, enum led_brightness value)
+{
+	struct s2m_led *led = to_s2m_led(to_s2m_fled(cdev));
+	int ret;
+
+	mutex_lock(&led->lock);
+
+	if (!value) {
+		ret = regmap_clear_bits(led->regmap, led->reg_enable,
+					S2MU005_FLED_TORCH_EN(led->channel));
+		if (ret < 0)
+			dev_err(cdev->dev, "failed to disable torch LED\n");
+		goto unlock;
+	}
+
+	ret = regmap_update_bits(led->regmap, S2MU005_REG_FLED_CH_CTRL1(led->channel),
+				 S2MU005_FLED_TORCH_IOUT,
+				 FIELD_PREP(S2MU005_FLED_TORCH_IOUT, value - 1));
+	if (ret < 0) {
+		dev_err(cdev->dev, "failed to set torch current\n");
+		goto unlock;
+	}
+
+	ret = regmap_set_bits(led->regmap, led->reg_enable, S2MU005_FLED_TORCH_EN(led->channel));
+	if (ret < 0) {
+		dev_err(cdev->dev, "failed to enable torch LED\n");
+		goto unlock;
+	}
+
+unlock:
+	mutex_unlock(&led->lock);
+
+	return ret;
+}
+
+static int s2mu005_fled_flash_strobe_set(struct led_classdev_flash *fled, bool state)
+{
+	struct s2m_led *led = to_s2m_led(fled);
+	int ret;
+
+	mutex_lock(&led->lock);
+
+	ret = regmap_clear_bits(led->regmap, led->reg_enable, S2MU005_FLED_FLASH_EN(led->channel));
+	if (ret < 0) {
+		dev_err(fled->led_cdev.dev, "failed to disable flash LED\n");
+		goto unlock;
+	}
+
+	if (!state)
+		goto unlock;
+
+	ret = regmap_update_bits(led->regmap, S2MU005_REG_FLED_CH_CTRL0(led->channel),
+				 S2MU005_FLED_FLASH_IOUT,
+				 FIELD_PREP(S2MU005_FLED_FLASH_IOUT, led->flash_brightness));
+	if (ret < 0) {
+		dev_err(fled->led_cdev.dev, "failed to set flash brightness\n");
+		goto unlock;
+	}
+
+	ret = regmap_update_bits(led->regmap, S2MU005_REG_FLED_CH_CTRL3(led->channel),
+				 S2MU005_FLED_FLASH_TIMEOUT,
+				 FIELD_PREP(S2MU005_FLED_FLASH_TIMEOUT, led->flash_timeout));
+	if (ret < 0) {
+		dev_err(fled->led_cdev.dev, "failed to set flash timeout\n");
+		goto unlock;
+	}
+
+	ret = regmap_set_bits(led->regmap, led->reg_enable, S2MU005_FLED_FLASH_EN(led->channel));
+	if (ret < 0) {
+		dev_err(fled->led_cdev.dev, "failed to enable flash LED\n");
+		goto unlock;
+	}
+
+unlock:
+	mutex_unlock(&led->lock);
+
+	return 0;
+}
+
+static int s2mu005_fled_flash_strobe_get(struct led_classdev_flash *fled, bool *state)
+{
+	struct s2m_led *led = to_s2m_led(fled);
+	u32 val;
+	int ret;
+
+	mutex_lock(&led->lock);
+
+	ret = regmap_read(led->regmap, S2MU005_REG_FLED_STATUS, &val);
+	if (ret < 0) {
+		dev_err(fled->led_cdev.dev, "failed to fetch LED status");
+		goto unlock;
+	}
+
+	*state = !!(val & S2MU005_FLED_FLASH_STATUS(led->channel));
+
+unlock:
+	mutex_unlock(&led->lock);
+
+	return ret;
+}
+
+static const struct led_flash_ops s2mu005_fled_flash_ops = {
+	.flash_brightness_set = s2m_fled_flash_brightness_set,
+	.timeout_set = s2m_fled_flash_timeout_set,
+	.strobe_set = s2mu005_fled_flash_strobe_set,
+	.strobe_get = s2mu005_fled_flash_strobe_get,
+};
+
+static int s2mu005_fled_init(struct s2m_led *led, struct device *dev, struct regmap *regmap,
+			     unsigned int nr_channels)
+{
+	unsigned int val;
+	int i, ret;
+
+	/* Enable the LED channels. */
+	ret = regmap_set_bits(regmap, S2MU005_REG_FLED_CTRL1, S2MU005_FLED_CH_EN);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to enable LED channels\n");
+
+	ret = regmap_read(regmap, S2MU005_REG_ID, &val);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to read revision\n");
+
+	for (i = 0; i < nr_channels; i++) {
+		/*
+		 * Read the revision register. Revision EVT0 has the register
+		 * at CTRL4, while EVT1 and higher have it at CTRL6.
+		 */
+		if (FIELD_GET(S2MU005_ID_MASK, val) == 0)
+			led[i].reg_enable = S2MU005_REG_FLED_CTRL4;
+		else
+			led[i].reg_enable = S2MU005_REG_FLED_CTRL6;
+	}
+
+	return 0;
+}
+
+static int s2mu005_fled_init_channel(struct s2m_led *led, struct device *dev,
+				     struct fwnode_handle *fwnp)
+{
+	struct led_classdev *cdev = &led->fled.led_cdev;
+	struct led_init_data init_data = {};
+	struct v4l2_flash_config v4l2_cfg = {};
+	int ret;
+
+	cdev->max_brightness = 16;
+	cdev->brightness_set_blocking = s2mu005_fled_torch_brightness_set;
+	cdev->flags |= LED_DEV_CAP_FLASH;
+
+	led->fled.timeout.min = 62000;
+	led->fled.timeout.step = 62000;
+	led->fled.timeout.max = 992000;
+	led->fled.timeout.val = 992000;
+
+	led->fled.brightness.min = 25000;
+	led->fled.brightness.step = 25000;
+	led->fled.brightness.max = 375000; /* 400000 causes flickering */
+	led->fled.brightness.val = 375000;
+
+	s2m_fled_flash_timeout_set(&led->fled, led->fled.timeout.val);
+	s2m_fled_flash_brightness_set(&led->fled, led->fled.brightness.val);
+
+	led->fled.ops = &s2mu005_fled_flash_ops;
+
+	init_data.fwnode = fwnp;
+	ret = devm_led_classdev_flash_register_ext(dev, &led->fled, &init_data);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to create LED flash device\n");
+
+	v4l2_cfg.intensity.min = led->fled.timeout.min;
+	v4l2_cfg.intensity.step = led->fled.timeout.step;
+	v4l2_cfg.intensity.max = led->fled.timeout.max;
+	v4l2_cfg.intensity.val = led->fled.timeout.val;
+
+	v4l2_cfg.has_external_strobe = true;
+
+	led->v4l2_flash = v4l2_flash_init(dev, fwnp, &led->fled, &s2m_fled_v4l2_flash_ops,
+					  &v4l2_cfg);
+	if (IS_ERR(led->v4l2_flash)) {
+		v4l2_flash_release(led->v4l2_flash);
+		return dev_err_probe(dev, PTR_ERR(led->v4l2_flash),
+				     "failed to create V4L2 flash device\n");
+	}
+
+	ret = devm_add_action_or_reset(dev, (void *)s2m_fled_v4l2_flash_release, led->v4l2_flash);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to add cleanup action\n");
+
+	return 0;
+}
+
+static int s2m_fled_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct sec_pmic_dev *ddata = dev_get_drvdata(dev->parent);
+	struct s2m_led *led;
+	int ret;
+
+	led = devm_kzalloc(dev, sizeof(*led) * MAX_CHANNELS, GFP_KERNEL);
+	if (!led)
+		return -ENOMEM;
+
+	switch (platform_get_device_id(pdev)->driver_data) {
+	case S2MU005:
+		ret = s2mu005_fled_init(led, dev, ddata->regmap_pmic, MAX_CHANNELS);
+		if (ret)
+			return ret;
+		break;
+	default:
+		return dev_err_probe(dev, -ENODEV, "device type %d is not supported by driver\n",
+				     ddata->device_type);
+	}
+
+	device_for_each_child_node_scoped(dev, child) {
+		u32 reg;
+
+		if (fwnode_property_read_u32(child, "reg", &reg))
+			continue;
+
+		if (led[reg].regmap) {
+			dev_warn(dev, "duplicate node for channel %d\n", reg);
+			continue;
+		}
+
+		led[reg].regmap = ddata->regmap_pmic;
+		led[reg].channel = (u8)reg;
+
+		ret = devm_mutex_init(dev, &led[reg].lock);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to create mutex\n");
+
+		switch (platform_get_device_id(pdev)->driver_data) {
+		case S2MU005:
+			ret = s2mu005_fled_init_channel(led + reg, dev, child);
+			if (ret < 0)
+				return ret;
+			break;
+		}
+	}
+
+	return 0;
+}
+
+static const struct platform_device_id s2m_fled_id_table[] = {
+	{ "s2mu005-flash", S2MU005 },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(platform, s2m_fled_id_table);
+
+static const struct of_device_id s2m_fled_of_match_table[] = {
+	{ .compatible = "samsung,s2mu005-flash", .data = (void *)S2MU005 },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, s2m_fled_of_match_table);
+
+static struct platform_driver s2m_fled_driver = {
+	.driver = {
+		.name = "s2m-flash",
+	},
+	.probe = s2m_fled_probe,
+	.id_table = s2m_fled_id_table,
+};
+module_platform_driver(s2m_fled_driver);
+
+MODULE_DESCRIPTION("Flash/Torch LED Driver For Samsung S2M Series PMICs");
+MODULE_AUTHOR("Kaustabh Chakraborty <kauschluss@disroot.org>");
+MODULE_LICENSE("GPL");

-- 
2.53.0


