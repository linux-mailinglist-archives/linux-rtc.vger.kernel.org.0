Return-Path: <linux-rtc+bounces-4719-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4898FB2C238
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Aug 2025 13:52:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 974C43B1FA3
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Aug 2025 11:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48E62335BBD;
	Tue, 19 Aug 2025 11:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="THdKwJmP"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16C03314CC;
	Tue, 19 Aug 2025 11:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755604119; cv=none; b=IJs6StJ/aDoe70emwieX5IfMi/RTbggcEK+aok1yVYW+bIlysLScTPQayZVK0DdKAcaXMvjvYLrnyhT0qrk6n8fYawn58PaP2IMkySRYF89ZMcq2bLmhVLhjYCFhIf6jSzt74LRwMqDwiFjmvP/ix+OSsiJ38tpbtoEyhzLxM2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755604119; c=relaxed/simple;
	bh=cpgXtyIFSas689lNECu7v9+wpYgV0YcBGXtJtZ14aAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n29BApy5dLerOZN4M4VS1YctEM6roLeekQdetPgp2Nc4HUpdUJ+jCUlwv+hGmRVg7dsu1Hm8cdv3vkdFpWoN91waeRQncL3eGJ2nnjh8D8R5AVj1h6xrk9Fia3AEVLRP6VVTskMtgvN4QPRAkgPgm0djMaYBvMvLVAPrYwhhhs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=THdKwJmP; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-76e2e629fc4so5292466b3a.0;
        Tue, 19 Aug 2025 04:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755604116; x=1756208916; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dz0BPAKr/oe6B5Nr94B5KfH5jnTBdm8lrJ9/mXdIBV8=;
        b=THdKwJmPocqdJFHVPFcjWmYyUUw4WycMhZQISJWt4+8tCwBKzKONlDg11JrbJdT2Kb
         gjTmJ+ttN9lgGrAx06GjoXZgT+adbOy7VirvewbNrtaM9knStGZeMniVXHnoNRwQyEWV
         U22SoFbl0IHVhAimgFRazEZftNX5+IXBtFnJ91AsoP4hW0CPNxcV0fMUMHsgPss8HP7e
         3ZDMccFO55zh1eGwa3Kj/EvB3X1s8Z6PK3uzmf2IPladBJtq/wBNwGffVNrCp45w4I1S
         GyD82gu6aWnspIAMTYWv9fW0V0gbdtK+6EmtQu9yZG79dkFEHWI0la8nRzy0nuEJV6XX
         tB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755604116; x=1756208916;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dz0BPAKr/oe6B5Nr94B5KfH5jnTBdm8lrJ9/mXdIBV8=;
        b=Syu6sE6foMuqTgkcPXUu8eex00yX4UIPBp0esgcKpJfi8rzmBD31FCoiLG8DdK8wvl
         UFW6W2cPQpirVMqE/fzZpm5BnyDX+NBHVo+8DZMsWwQ/6Co5Zw5ZBRC2U5amofPFRAzn
         hT3Q+W+iY8iuD5QEdp8NalXrK8WsqO9aNKciqTM9soUTwD3c9dpo+cjq8v7TRcm2usiH
         GmLScPEXkYN4+kqztRKs2J7nllWI5x6MXkNnSuqKI6My4xKjAi480/vH2zm+ZhuY4l8p
         mVeMY3QSEzPKTA5emvKM0OwmIUW6j4KG0nAN5wdSaik+wL6WkBL64fhITMeSlFfZqBpR
         muag==
X-Forwarded-Encrypted: i=1; AJvYcCU3K6xQf/Gus4/AOEJA5jODSekAMo5wBF+92ZYlT7eYhYMVwAoka0SBau1hfIRakr0abu0bsTkd53P2@vger.kernel.org, AJvYcCW/0u2Z8wxEGPSOD33qmEqfV0jHTeKimcpLYFsGgEkctp3UbRqO1V3dmLLkx4fopj2ji/OJHUbKNdJA@vger.kernel.org, AJvYcCWYLyEU1luOeIHIVabl0JhFHkNAwn3plFlqCw1giNfdA2rjaftL4nQj/T31njKGkmKPhe/hN1x6eYCRsYsI@vger.kernel.org, AJvYcCWdAF/uPoHtgTXN62QBSiOXbTdYdbW/AJcONzNMItJheAHnM0jMChr1f9gN26Bj0THj5v4K28vj/rbjYlQ=@vger.kernel.org, AJvYcCWtuVN7t1yA1UhUqt1R5dfTVZbs571MkNOlAq247pANbK/eSkhk73VaNaS3lNoQUlGsEPr34psu27gdtE0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDeXMHc+j+AVLbSJ3sTFaduCJ2d8YxDCccK3lqXzlUgf1kZw5Z
	a/Ofv2qd9S+7k6gup/5Iwto/1HJ//CCo4nHA69oENKLQ9jsfxgMFB58Y
X-Gm-Gg: ASbGncsWK3PyVzV0FQLTLiVDN0eC+n86mRe+Lg+P+9CUZuK3l2h1kBL7vtq/tPTotW7
	yuTMovJDPzEbyY9RR5zuJ8JGD4VnQkrSfyMyiberzxuxq1+ShdLfdUKhQS6BsWR/Zv716lG7olU
	kL17uiSk1vr46jWJVImThEYTOD9kJaqe+Z74fBRq/qYHEgiR+JFiR/KYpcVDdHZzc/WjsJPvvT8
	5lN35wIM50O28Gy2NGLmjnuuQkYK3Cee6pUrX9DrggqIWS/pR6u/ReHuUjK0FkUSe2j3vML9W+W
	dDB8XxQqmuenfIMZii/Va74YjXXHCDQwV79+B6ACieyVc8tfBRONFmjwuGN6jYsmbtK3iddhFnt
	oksE34gbNXEZproEEd6VIn9NRgDtxITTU7VJ+c6X5Nd481Hcl4e0b7B/NtIedjHP0xRbTN2KrFW
	lGj5WEqfnfHSjHG52jCk1zPRCRQQ==
X-Google-Smtp-Source: AGHT+IHgHEo3dkkdezD+hHGPMrwPcRunym2Arw48dolBS92yAclI0eQwBuGOkPMkE6U4YGKziooy0g==
X-Received: by 2002:a05:6a21:6d81:b0:240:2234:6860 with SMTP id adf61e73a8af0-2430d491ccfmr3229856637.32.1755604115898;
        Tue, 19 Aug 2025 04:48:35 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d76a430sm10286316a12.43.2025.08.19.04.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:48:35 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 19 Aug 2025 21:47:56 +1000
Subject: [PATCH 4/8] hwmon: Add Apple Silicon SMC hwmon driver
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-macsmc-subdevs-v1-4-57df6c3e5f19@gmail.com>
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
 linux-input@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=28186;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=cpgXtyIFSas689lNECu7v9+wpYgV0YcBGXtJtZ14aAE=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlLUvIdVxfkKfuvrruuv57xyBUmx0zZWY9Wf/x7p3pP+
 Du74AjPjlIWBjEuBlkxRZYNTUIes43YbvaLVO6FmcPKBDKEgYtTACaSvIXhn9WX3izzfxcd3z+w
 bw/pVur4PUlGQncpa+/NfbP5Mw4b2jH8M/Z79vRDzaOcGwuVcsTUHVheKa9/emV1q7rOE65QpUf
 urAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The System Management Controller on Apple Silicon devices is responsible
for integrating and exposing the data reported by the vast array of
hardware monitoring sensors present on these devices. It is also
responsible for fan control, and allows users to manually set fan
speeds if they so desire. Add a hwmon driver to expose current,
power, temperature, and voltage monitoring sensors, as well as
fan speed monitoring and control via the SMC on Apple Silicon devices.

The SMC firmware has no consistency between devices, even when they
share an SoC. The FourCC keys used to access sensors are almost
random. An M1 Mac mini will have different FourCCs for its CPU core
temperature sensors to an M1 MacBook Pro, for example. For this
reason, the valid sensors for a given device are specified in a
child of the SMC Devicetree node. The driver uses this information
to determine which sensors to make available at runtime.

Co-developed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Janne Grunau <j@jannau.net>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 MAINTAINERS                  |   2 +
 drivers/hwmon/Kconfig        |  12 +
 drivers/hwmon/Makefile       |   1 +
 drivers/hwmon/macsmc_hwmon.c | 858 +++++++++++++++++++++++++
 drivers/mfd/macsmc.c         |   1 +
 5 files changed, 874 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 029117b921ea97d1276f5496ea06a3f918929b20..2eb23522654dd050262eb06e077587030cc335aa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2380,6 +2380,7 @@ F:	Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
 F:	Documentation/devicetree/bindings/dma/apple,admac.yaml
 F:	Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
 F:	Documentation/devicetree/bindings/gpu/apple,agx.yaml
+F:	Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
 F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
 F:	Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,*
@@ -2407,6 +2408,7 @@ F:	drivers/clk/clk-apple-nco.c
 F:	drivers/cpufreq/apple-soc-cpufreq.c
 F:	drivers/dma/apple-admac.c
 F:	drivers/gpio/gpio-macsmc.c
+F:	drivers/hwmon/macsmc_hwmon.c
 F:	drivers/pmdomain/apple/
 F:	drivers/i2c/busses/i2c-pasemi-core.c
 F:	drivers/i2c/busses/i2c-pasemi-platform.c
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 9d28fcf7cd2a6f9e2f54694a717bd85ff4047b46..1ca6db71e4d9da32717fd14487c10944433ada41 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1164,6 +1164,18 @@ config SENSORS_LTQ_CPUTEMP
 	  If you say yes here you get support for the temperature
 	  sensor inside your CPU.
 
+config SENSORS_MACSMC_HWMON
+	tristate "Apple SMC (Apple Silicon)"
+	depends on MFD_MACSMC && OF
+	help
+	  This driver enables hwmon support for current, power, temperature,
+	  and voltage sensors, as well as fan speed reporting and control
+	  on Apple Silicon devices. Say Y here if you have an Apple Silicon
+	  device.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called macsmc_hwmon.
+
 config SENSORS_MAX1111
 	tristate "Maxim MAX1111 Serial 8-bit ADC chip and compatibles"
 	depends on SPI_MASTER
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index cd8bc4752b4dbf015c6eb46157626f4e8f87dfae..80fc8447aff15b3b8e8583dc755c8accb3b6a93e 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -147,6 +147,7 @@ obj-$(CONFIG_SENSORS_LTC4260)	+= ltc4260.o
 obj-$(CONFIG_SENSORS_LTC4261)	+= ltc4261.o
 obj-$(CONFIG_SENSORS_LTC4282)	+= ltc4282.o
 obj-$(CONFIG_SENSORS_LTQ_CPUTEMP) += ltq-cputemp.o
+obj-$(CONFIG_SENSORS_MACSMC_HWMON)	+= macsmc_hwmon.o
 obj-$(CONFIG_SENSORS_MAX1111)	+= max1111.o
 obj-$(CONFIG_SENSORS_MAX127)	+= max127.o
 obj-$(CONFIG_SENSORS_MAX16065)	+= max16065.o
diff --git a/drivers/hwmon/macsmc_hwmon.c b/drivers/hwmon/macsmc_hwmon.c
new file mode 100644
index 0000000000000000000000000000000000000000..543a1ab50fc3587cc88625ec703d92a7e7db0825
--- /dev/null
+++ b/drivers/hwmon/macsmc_hwmon.c
@@ -0,0 +1,858 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Apple SMC hwmon driver for Apple Silicon platforms
+ *
+ * The System Management Controller on Apple Silicon devices is responsible for
+ * measuring data from sensors across the SoC and machine. These include power,
+ * temperature, voltage and current sensors. Some "sensors" actually expose
+ * derived values. An example of this is the key PHPC, which is an estimate
+ * of the heat energy being dissipated by the SoC.
+ *
+ * While each SoC only has one SMC variant, each platform exposes a different
+ * set of sensors. For example, M1 MacBooks expose battery telemetry sensors
+ * which are not present on the M1 Mac mini. For this reason, the available
+ * sensors for a given platform are described in the device tree in a child
+ * node of the SMC device. We must walk this list of available sensors and
+ * populate the required hwmon data structures at runtime.
+ *
+ * Originally based on a concept by Jean-Francois Bortolotti <jeff@borto.fr>
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/mfd/macsmc.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+#define MAX_LABEL_LENGTH 32
+#define NUM_SENSOR_TYPES 5 /* temp, volt, current, power, fan */
+
+#define FLT_EXP_BIAS 127
+#define FLT_EXP_MASK GENMASK(30, 23)
+#define FLT_MANT_BIAS 23
+#define FLT_MANT_MASK GENMASK(22, 0)
+#define FLT_SIGN_MASK BIT(31)
+
+static bool melt_my_mac;
+module_param_unsafe(melt_my_mac, bool, 0644);
+MODULE_PARM_DESC(
+	melt_my_mac,
+	"Override the SMC to set your own fan speeds on supported machines");
+
+struct macsmc_hwmon_sensor {
+	struct apple_smc_key_info info;
+	smc_key macsmc_key;
+	char label[MAX_LABEL_LENGTH];
+};
+
+struct macsmc_hwmon_fan {
+	struct macsmc_hwmon_sensor now;
+	struct macsmc_hwmon_sensor min;
+	struct macsmc_hwmon_sensor max;
+	struct macsmc_hwmon_sensor set;
+	struct macsmc_hwmon_sensor mode;
+	char label[MAX_LABEL_LENGTH];
+	u32 attrs;
+	bool manual;
+};
+
+struct macsmc_hwmon_sensors {
+	struct hwmon_channel_info channel_info;
+	struct macsmc_hwmon_sensor *sensors;
+	u32 n_sensors;
+};
+
+struct macsmc_hwmon_fans {
+	struct hwmon_channel_info channel_info;
+	struct macsmc_hwmon_fan *fans;
+	u32 n_fans;
+};
+
+struct macsmc_hwmon {
+	struct device *dev;
+	struct apple_smc *smc;
+	struct device *hwmon_dev;
+	struct hwmon_chip_info chip_info;
+	/* Chip + sensor types + NULL */
+	const struct hwmon_channel_info *channel_infos[1 + NUM_SENSOR_TYPES + 1];
+	struct macsmc_hwmon_sensors temp;
+	struct macsmc_hwmon_sensors volt;
+	struct macsmc_hwmon_sensors curr;
+	struct macsmc_hwmon_sensors power;
+	struct macsmc_hwmon_fans fan;
+};
+
+static int macsmc_hwmon_read_label(struct device *dev,
+				   enum hwmon_sensor_types type, u32 attr,
+				   int channel, const char **str)
+{
+	struct macsmc_hwmon *hwmon = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_temp:
+		if (channel >= hwmon->temp.n_sensors)
+			return -EINVAL;
+		*str = hwmon->temp.sensors[channel].label;
+		break;
+	case hwmon_in:
+		if (channel >= hwmon->volt.n_sensors)
+			return -EINVAL;
+		*str = hwmon->volt.sensors[channel].label;
+		break;
+	case hwmon_curr:
+		if (channel >= hwmon->curr.n_sensors)
+			return -EINVAL;
+		*str = hwmon->curr.sensors[channel].label;
+		break;
+	case hwmon_power:
+		if (channel >= hwmon->power.n_sensors)
+			return -EINVAL;
+		*str = hwmon->power.sensors[channel].label;
+		break;
+	case hwmon_fan:
+		if (channel >= hwmon->fan.n_fans)
+			return -EINVAL;
+		*str = hwmon->fan.fans[channel].label;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+/*
+ * A number of sensors report data in a 48.16 fixed-point decimal format that is
+ * not used by any other function of the SMC.
+ */
+static int macsmc_hwmon_read_ioft_scaled(struct apple_smc *smc, smc_key key,
+					 u64 *p, int scale)
+{
+	u64 val;
+	int ret;
+
+	ret = apple_smc_read_u64(smc, key, &val);
+	if (ret < 0)
+		return ret;
+
+	*p = mult_frac(val, scale, 65536);
+
+	return 0;
+}
+
+/*
+ * Many sensors report their data as IEEE-754 floats. No other SMC function uses
+ * them.
+ */
+static int macsmc_hwmon_read_f32_scaled(struct apple_smc *smc, smc_key key,
+					int *p, int scale)
+{
+	u32 fval;
+	u64 val;
+	int ret, exp;
+
+	ret = apple_smc_read_u32(smc, key, &fval);
+	if (ret < 0)
+		return ret;
+
+	val = ((u64)((fval & FLT_MANT_MASK) | BIT(23)));
+	exp = ((fval >> 23) & 0xff) - FLT_EXP_BIAS - FLT_MANT_BIAS;
+	if (scale < 0) {
+		val <<= 32;
+		exp -= 32;
+		val /= -scale;
+	} else {
+		val *= scale;
+	}
+
+	if (exp > 63)
+		val = U64_MAX;
+	else if (exp < -63)
+		val = 0;
+	else if (exp < 0)
+		val >>= -exp;
+	else if (exp != 0 && (val & ~((1UL << (64 - exp)) - 1))) /* overflow */
+		val = U64_MAX;
+	else
+		val <<= exp;
+
+	if (fval & FLT_SIGN_MASK) {
+		if (val > (-(s64)INT_MIN))
+			*p = INT_MIN;
+		else
+			*p = -val;
+	} else {
+		if (val > INT_MAX)
+			*p = INT_MAX;
+		else
+			*p = val;
+	}
+
+	return 0;
+}
+
+/*
+ * The SMC has keys of multiple types, denoted by a FourCC of the same format
+ * as the key ID. We don't know what data type a key encodes until we poke at it.
+ */
+static int macsmc_hwmon_read_key(struct apple_smc *smc,
+				 struct macsmc_hwmon_sensor *sensor, int scale,
+				 long *val)
+{
+	int ret = 0;
+
+	switch (sensor->info.type_code) {
+	/* 32-bit IEEE 754 float */
+	case _SMC_KEY("flt "): {
+		u32 flt_ = 0;
+
+		ret = macsmc_hwmon_read_f32_scaled(smc, sensor->macsmc_key,
+						   &flt_, scale);
+		*val = flt_;
+		break;
+	}
+	/* 48.16 fixed point decimal */
+	case _SMC_KEY("ioft"): {
+		u64 ioft = 0;
+
+		ret = macsmc_hwmon_read_ioft_scaled(smc, sensor->macsmc_key,
+						    &ioft, scale);
+		*val = (long)ioft;
+		break;
+	}
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	if (ret)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int macsmc_hwmon_write_f32_scaled(struct apple_smc *smc, smc_key key,
+					 int value, int scale)
+{
+	u64 val;
+	u32 fval = 0;
+	int exp = 0, neg;
+
+	val = abs(value);
+	neg = val != value;
+
+	if (scale > 1) {
+		val <<= 32;
+		exp = 32;
+		val /= scale;
+	} else if (scale < 1) {
+		val *= -scale;
+	}
+
+	if (val) {
+		int msb = __fls(val) - exp;
+
+		if (msb > 23) {
+			val >>= msb - 23;
+			exp -= msb - 23;
+		} else if (msb < 23) {
+			val <<= 23 - msb;
+			exp += msb;
+		}
+
+		fval = FIELD_PREP(FLT_SIGN_MASK, neg) |
+		       FIELD_PREP(FLT_EXP_MASK, exp + FLT_EXP_BIAS) |
+		       FIELD_PREP(FLT_MANT_MASK, val);
+	}
+
+	return apple_smc_write_u32(smc, key, fval);
+}
+
+static int macsmc_hwmon_write_key(struct apple_smc *smc,
+				  struct macsmc_hwmon_sensor *sensor, long val,
+				  int scale)
+{
+	switch (sensor->info.type_code) {
+	/* 32-bit IEEE 754 float */
+	case _SMC_KEY("flt "):
+		return macsmc_hwmon_write_f32_scaled(smc, sensor->macsmc_key,
+						     val, scale);
+	/* unsigned 8-bit integer */
+	case _SMC_KEY("ui8 "):
+		return apple_smc_write_u8(smc, sensor->macsmc_key, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int macsmc_hwmon_read_fan(struct macsmc_hwmon *hwmon, u32 attr, int chan,
+				 long *val)
+{
+	if (!(hwmon->fan.fans[chan].attrs & BIT(attr)))
+		return -EINVAL;
+
+	switch (attr) {
+	case hwmon_fan_input:
+		return macsmc_hwmon_read_key(
+			hwmon->smc, &hwmon->fan.fans[chan].now, 1, val);
+	case hwmon_fan_min:
+		return macsmc_hwmon_read_key(
+			hwmon->smc, &hwmon->fan.fans[chan].min, 1, val);
+	case hwmon_fan_max:
+		return macsmc_hwmon_read_key(
+			hwmon->smc, &hwmon->fan.fans[chan].max, 1, val);
+	case hwmon_fan_target:
+		return macsmc_hwmon_read_key(
+			hwmon->smc, &hwmon->fan.fans[chan].set, 1, val);
+	default:
+		return -EINVAL;
+	}
+}
+
+static int macsmc_hwmon_write_fan(struct device *dev, u32 attr, int channel,
+				  long val)
+{
+	struct macsmc_hwmon *hwmon = dev_get_drvdata(dev);
+	int ret = 0;
+	long min = 0;
+	long max = 0;
+
+	if (!melt_my_mac || hwmon->fan.fans[channel].mode.macsmc_key == 0)
+		return -EOPNOTSUPP;
+
+	if ((channel >= hwmon->fan.n_fans) ||
+	    !(hwmon->fan.fans[channel].attrs & BIT(attr)) ||
+	    (attr != hwmon_fan_target))
+		return -EINVAL;
+
+	/*
+	 * The SMC does no sanity checks on requested fan speeds, so we need to.
+	 */
+	ret = macsmc_hwmon_read_key(hwmon->smc, &hwmon->fan.fans[channel].min,
+				    1, &min);
+	if (ret)
+		return ret;
+	ret = macsmc_hwmon_read_key(hwmon->smc, &hwmon->fan.fans[channel].max,
+				    1, &max);
+	if (ret)
+		return ret;
+
+	if (val >= min && val <= max) {
+		if (!hwmon->fan.fans[channel].manual) {
+			/* Write 1 to mode key for manual control */
+			ret = macsmc_hwmon_write_key(
+				hwmon->smc, &hwmon->fan.fans[channel].mode, 1,
+				1);
+			if (ret < 0)
+				return ret;
+
+			hwmon->fan.fans[channel].manual = true;
+			dev_info(
+				dev,
+				"Fan %d now under manual control! Set target speed to 0 for automatic control.\n",
+				channel + 1);
+		}
+		return macsmc_hwmon_write_key(
+			hwmon->smc, &hwmon->fan.fans[channel].set, val, 1);
+	} else if (!val) {
+		if (hwmon->fan.fans[channel].manual) {
+			dev_info(dev, "Returning control of fan %d to SMC.\n",
+				 channel + 1);
+			ret = macsmc_hwmon_write_key(
+				hwmon->smc, &hwmon->fan.fans[channel].mode, 0,
+				1);
+			if (ret < 0)
+				return ret;
+
+			hwmon->fan.fans[channel].manual = false;
+		}
+	} else {
+		dev_err(dev, "Requested fan speed %ld out of range [%ld, %ld]",
+			val, min, max);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int macsmc_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+			     u32 attr, int channel, long *val)
+{
+	struct macsmc_hwmon *hwmon = dev_get_drvdata(dev);
+	int ret = 0;
+
+	switch (type) {
+	case hwmon_temp:
+		ret = macsmc_hwmon_read_key(
+			hwmon->smc, &hwmon->temp.sensors[channel], 1000, val);
+		break;
+	case hwmon_in:
+		ret = macsmc_hwmon_read_key(
+			hwmon->smc, &hwmon->volt.sensors[channel], 1000, val);
+		break;
+	case hwmon_curr:
+		ret = macsmc_hwmon_read_key(
+			hwmon->smc, &hwmon->curr.sensors[channel], 1000, val);
+		break;
+	case hwmon_power:
+		/* SMC returns power in Watts with acceptable precision to scale to uW */
+		ret = macsmc_hwmon_read_key(hwmon->smc,
+					    &hwmon->power.sensors[channel],
+					    1000000, val);
+		break;
+	case hwmon_fan:
+		ret = macsmc_hwmon_read_fan(hwmon, attr, channel, val);
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return ret;
+}
+
+static int macsmc_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
+			      u32 attr, int channel, long val)
+{
+	switch (type) {
+	case hwmon_fan:
+		return macsmc_hwmon_write_fan(dev, attr, channel, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static umode_t macsmc_hwmon_fan_is_visible(const void *data, u32 attr,
+					   int channel)
+{
+	const struct macsmc_hwmon *hwmon = data;
+
+	if (channel >= hwmon->fan.n_fans)
+		return -EINVAL;
+
+	if (melt_my_mac && attr == hwmon_fan_target &&
+	    hwmon->fan.fans[channel].mode.macsmc_key != 0)
+		return 0644;
+
+	return 0444;
+}
+
+static umode_t macsmc_hwmon_is_visible(const void *data,
+				       enum hwmon_sensor_types type, u32 attr,
+				       int channel)
+{
+	switch (type) {
+	case hwmon_fan:
+		return macsmc_hwmon_fan_is_visible(data, attr, channel);
+	default:
+		break;
+	}
+
+	return 0444;
+}
+
+static const struct hwmon_ops macsmc_hwmon_ops = {
+	.is_visible = macsmc_hwmon_is_visible,
+	.read = macsmc_hwmon_read,
+	.read_string = macsmc_hwmon_read_label,
+	.write = macsmc_hwmon_write,
+};
+
+/*
+ * Get the key metadata, including key data type, from the SMC.
+ */
+static int macsmc_hwmon_parse_key(struct device *dev, struct apple_smc *smc,
+				  struct macsmc_hwmon_sensor *sensor,
+				  const char *key)
+{
+	int ret = 0;
+
+	ret = apple_smc_get_key_info(smc, _SMC_KEY(key), &sensor->info);
+	if (ret) {
+		dev_err(dev, "Failed to retrieve key info for %s\n", key);
+		return ret;
+	}
+	sensor->macsmc_key = _SMC_KEY(key);
+
+	return 0;
+}
+
+/*
+ * A sensor is a single key-value pair as made available by the SMC.
+ * The devicetree gives us the SMC key ID and a friendly name where the
+ * purpose of the sensor is known.
+ */
+static int macsmc_hwmon_create_sensor(struct device *dev, struct apple_smc *smc,
+				      struct device_node *sensor_node,
+				      struct macsmc_hwmon_sensor *sensor)
+{
+	const char *key, *label;
+	int ret = 0;
+
+	ret = of_property_read_string(sensor_node, "apple,key-id", &key);
+	if (ret) {
+		dev_err(dev, "Could not find apple,key-id in sensor node");
+		return ret;
+	}
+
+	ret = macsmc_hwmon_parse_key(dev, smc, sensor, key);
+	if (ret)
+		return ret;
+
+	if (!of_property_read_string(sensor_node, "label", &label))
+		strscpy_pad(sensor->label, label, sizeof(sensor->label));
+	else
+		strscpy_pad(sensor->label, key, sizeof(sensor->label));
+
+	return 0;
+}
+
+/*
+ * Fan data is exposed by the SMC as multiple sensors.
+ *
+ * The devicetree schema reuses apple,key-id for the actual fan speed sensor.
+ * Mix, max and target keys do not need labels, so we can reuse label
+ * for naming the entire fan.
+ */
+static int macsmc_hwmon_create_fan(struct device *dev, struct apple_smc *smc,
+				   struct device_node *fan_node,
+				   struct macsmc_hwmon_fan *fan)
+{
+	const char *label;
+	const char *now;
+	const char *min;
+	const char *max;
+	const char *set;
+	const char *mode;
+	int ret = 0;
+
+	ret = of_property_read_string(fan_node, "apple,key-id", &now);
+	if (ret) {
+		dev_err(dev, "apple,key-id not found in fan node!");
+		return -EINVAL;
+	}
+
+	ret = macsmc_hwmon_parse_key(dev, smc, &fan->now, now);
+	if (ret)
+		return ret;
+
+	if (!of_property_read_string(fan_node, "label", &label))
+		strscpy_pad(fan->label, label, sizeof(fan->label));
+	else
+		strscpy_pad(fan->label, now, sizeof(fan->label));
+
+	fan->attrs = HWMON_F_LABEL | HWMON_F_INPUT;
+
+	ret = of_property_read_string(fan_node, "apple,fan-minimum", &min);
+	if (ret)
+		dev_warn(dev, "No minimum fan speed key for %s", fan->label);
+	else {
+		if (!macsmc_hwmon_parse_key(dev, smc, &fan->min, min))
+			fan->attrs |= HWMON_F_MIN;
+	}
+
+	ret = of_property_read_string(fan_node, "apple,fan-maximum", &max);
+	if (ret)
+		dev_warn(dev, "No maximum fan speed key for %s", fan->label);
+	else {
+		if (!macsmc_hwmon_parse_key(dev, smc, &fan->max, max))
+			fan->attrs |= HWMON_F_MAX;
+	}
+
+	ret = of_property_read_string(fan_node, "apple,fan-target", &set);
+	if (ret)
+		dev_warn(dev, "No target fan speed key for %s", fan->label);
+	else {
+		if (!macsmc_hwmon_parse_key(dev, smc, &fan->set, set))
+			fan->attrs |= HWMON_F_TARGET;
+	}
+
+	ret = of_property_read_string(fan_node, "apple,fan-mode", &mode);
+	if (ret)
+		dev_warn(dev, "No fan mode key for %s", fan->label);
+	else {
+		ret = macsmc_hwmon_parse_key(dev, smc, &fan->mode, mode);
+		if (ret)
+			return ret;
+	}
+
+	/* Initialise fan control mode to automatic */
+	fan->manual = false;
+
+	return 0;
+}
+
+static int macsmc_hwmon_populate_sensors(struct macsmc_hwmon *hwmon,
+					 struct device_node *hwmon_node)
+{
+	struct device_node *group_node = NULL;
+
+	for_each_child_of_node(hwmon_node, group_node) {
+		struct device_node *key_node = NULL;
+		struct macsmc_hwmon_sensors *sensor_group = NULL;
+		struct macsmc_hwmon_fans *fan_group = NULL;
+		u32 n_keys = 0;
+		int i = 0;
+
+		n_keys = of_get_child_count(group_node);
+		if (!n_keys) {
+			dev_err(hwmon->dev, "No keys found in %s!\n",
+				group_node->name);
+			continue;
+		}
+
+		if (strcmp(group_node->name, "temperature") == 0)
+			sensor_group = &hwmon->temp;
+		else if (strcmp(group_node->name, "voltage") == 0)
+			sensor_group = &hwmon->volt;
+		else if (strcmp(group_node->name, "current") == 0)
+			sensor_group = &hwmon->curr;
+		else if (strcmp(group_node->name, "power") == 0)
+			sensor_group = &hwmon->power;
+		else if (strcmp(group_node->name, "fan") == 0)
+			fan_group = &hwmon->fan;
+		else {
+			dev_err(hwmon->dev, "Invalid group node: %s",
+				group_node->name);
+			continue;
+		}
+
+		if (sensor_group) {
+			sensor_group->sensors = devm_kzalloc(
+				hwmon->dev,
+				sizeof(struct macsmc_hwmon_sensor) * n_keys,
+				GFP_KERNEL);
+			if (!sensor_group->sensors) {
+				of_node_put(group_node);
+				return -ENOMEM;
+			}
+
+			for_each_child_of_node(group_node, key_node) {
+				if (!macsmc_hwmon_create_sensor(
+					    hwmon->dev, hwmon->smc, key_node,
+					    &sensor_group->sensors[i]))
+					i++;
+			}
+
+			sensor_group->n_sensors = i;
+			if (!sensor_group->n_sensors) {
+				dev_err(hwmon->dev,
+					"No valid sensor keys found in %s\n",
+					group_node->name);
+				continue;
+			}
+		} else if (fan_group) {
+			fan_group->fans = devm_kzalloc(
+				hwmon->dev,
+				sizeof(struct macsmc_hwmon_fan) * n_keys,
+				GFP_KERNEL);
+
+			if (!fan_group->fans) {
+				of_node_put(group_node);
+				return -ENOMEM;
+			}
+
+			for_each_child_of_node(group_node, key_node) {
+				if (!macsmc_hwmon_create_fan(
+					    hwmon->dev, hwmon->smc, key_node,
+					    &fan_group->fans[i]))
+					i++;
+			}
+
+			fan_group->n_fans = i;
+			if (!fan_group->n_fans) {
+				dev_err(hwmon->dev,
+					"No valid sensor fans found in %s\n",
+					group_node->name);
+				continue;
+			}
+		}
+	}
+
+	return 0;
+}
+
+/* Create NULL-terminated config arrays */
+static void macsmc_hwmon_populate_configs(u32 *configs, u32 num_keys, u32 flags)
+{
+	int idx = 0;
+
+	for (idx = 0; idx < num_keys; idx++)
+		configs[idx] = flags;
+
+	configs[idx + 1] = 0;
+}
+
+static void macsmc_hwmon_populate_fan_configs(u32 *configs, u32 num_keys,
+					      struct macsmc_hwmon_fans *fans)
+{
+	int idx = 0;
+
+	for (idx = 0; idx < num_keys; idx++)
+		configs[idx] = fans->fans[idx].attrs;
+
+	configs[idx + 1] = 0;
+}
+
+static const struct hwmon_channel_info *const macsmc_chip_channel_info =
+	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ);
+
+static int macsmc_hwmon_create_infos(struct macsmc_hwmon *hwmon)
+{
+	int i = 0;
+	struct hwmon_channel_info *channel_info;
+
+	/* chip */
+	hwmon->channel_infos[i++] = macsmc_chip_channel_info;
+
+	if (hwmon->temp.n_sensors) {
+		channel_info = &hwmon->temp.channel_info;
+		channel_info->type = hwmon_temp;
+		channel_info->config = devm_kzalloc(
+			hwmon->dev, sizeof(u32) * hwmon->temp.n_sensors + 1,
+			GFP_KERNEL);
+		if (!channel_info->config)
+			return -ENOMEM;
+
+		macsmc_hwmon_populate_configs((u32 *)channel_info->config,
+					      hwmon->temp.n_sensors,
+					      (HWMON_T_INPUT | HWMON_T_LABEL));
+		hwmon->channel_infos[i++] = channel_info;
+	}
+
+	if (hwmon->volt.n_sensors) {
+		channel_info = &hwmon->volt.channel_info;
+		channel_info->type = hwmon_in;
+		channel_info->config = devm_kzalloc(
+			hwmon->dev, sizeof(u32) * hwmon->volt.n_sensors + 1,
+			GFP_KERNEL);
+		if (!channel_info->config)
+			return -ENOMEM;
+
+		macsmc_hwmon_populate_configs((u32 *)channel_info->config,
+					      hwmon->volt.n_sensors,
+					      (HWMON_I_INPUT | HWMON_I_LABEL));
+		hwmon->channel_infos[i++] = channel_info;
+	}
+
+	if (hwmon->curr.n_sensors) {
+		channel_info = &hwmon->curr.channel_info;
+		channel_info->type = hwmon_curr;
+		channel_info->config = devm_kzalloc(
+			hwmon->dev, sizeof(u32) * hwmon->curr.n_sensors + 1,
+			GFP_KERNEL);
+		if (!channel_info->config)
+			return -ENOMEM;
+
+		macsmc_hwmon_populate_configs((u32 *)channel_info->config,
+					      hwmon->curr.n_sensors,
+					      (HWMON_C_INPUT | HWMON_C_LABEL));
+		hwmon->channel_infos[i++] = channel_info;
+	}
+
+	if (hwmon->power.n_sensors) {
+		channel_info = &hwmon->power.channel_info;
+		channel_info->type = hwmon_power;
+		channel_info->config = devm_kzalloc(
+			hwmon->dev, sizeof(u32) * hwmon->power.n_sensors + 1,
+			GFP_KERNEL);
+		if (!channel_info->config)
+			return -ENOMEM;
+
+		macsmc_hwmon_populate_configs((u32 *)channel_info->config,
+					      hwmon->power.n_sensors,
+					      (HWMON_P_INPUT | HWMON_P_LABEL));
+		hwmon->channel_infos[i++] = channel_info;
+	}
+
+	if (hwmon->fan.n_fans) {
+		channel_info = &hwmon->fan.channel_info;
+		channel_info->type = hwmon_fan;
+		channel_info->config = devm_kzalloc(
+			hwmon->dev, sizeof(u32) * hwmon->fan.n_fans + 1,
+			GFP_KERNEL);
+		if (!channel_info->config)
+			return -ENOMEM;
+
+		macsmc_hwmon_populate_fan_configs((u32 *)channel_info->config,
+						  hwmon->fan.n_fans,
+						  &hwmon->fan);
+		hwmon->channel_infos[i++] = channel_info;
+	}
+
+	return 0;
+}
+
+static int macsmc_hwmon_probe(struct platform_device *pdev)
+{
+	struct apple_smc *smc = dev_get_drvdata(pdev->dev.parent);
+	struct macsmc_hwmon *hwmon;
+	struct device_node *hwmon_node;
+	int ret = 0;
+
+	hwmon = devm_kzalloc(&pdev->dev, sizeof(struct macsmc_hwmon),
+			     GFP_KERNEL);
+	if (!hwmon)
+		return -ENOMEM;
+
+	hwmon->dev = &pdev->dev;
+	hwmon->smc = smc;
+
+	hwmon_node = of_get_child_by_name(pdev->dev.parent->of_node, "hwmon");
+	if (!hwmon_node) {
+		dev_err(hwmon->dev, "SMC hwmon node not found in Devicetree\n");
+		return -ENODEV;
+	}
+
+	ret = macsmc_hwmon_populate_sensors(hwmon, hwmon_node);
+	if (ret)
+		dev_info(hwmon->dev, "Could not populate keys!\n");
+
+	of_node_put(hwmon_node);
+
+	if (!hwmon->temp.n_sensors && !hwmon->volt.n_sensors &&
+	    !hwmon->curr.n_sensors && !hwmon->power.n_sensors &&
+	    !hwmon->fan.n_fans) {
+		dev_err(hwmon->dev,
+			"No valid keys found of any supported type");
+		return -ENODEV;
+	}
+
+	ret = macsmc_hwmon_create_infos(hwmon);
+	if (ret)
+		return ret;
+
+	hwmon->chip_info.ops = &macsmc_hwmon_ops;
+	hwmon->chip_info.info =
+		(const struct hwmon_channel_info *const *)&hwmon->channel_infos;
+
+	hwmon->hwmon_dev = devm_hwmon_device_register_with_info(
+		&pdev->dev, "macsmc_hwmon", hwmon, &hwmon->chip_info, NULL);
+	if (IS_ERR(hwmon->hwmon_dev))
+		return dev_err_probe(hwmon->dev, PTR_ERR(hwmon->hwmon_dev),
+				     "Probing SMC hwmon device failed\n");
+
+	dev_info(hwmon->dev, "Registered SMC hwmon device. Sensors:");
+	dev_info(
+		hwmon->dev,
+		"Temperature: %d, Voltage: %d, Current: %d, Power: %d, Fans: %d",
+		hwmon->temp.n_sensors, hwmon->volt.n_sensors,
+		hwmon->curr.n_sensors, hwmon->power.n_sensors,
+		hwmon->fan.n_fans);
+
+	return 0;
+}
+
+static struct platform_driver macsmc_hwmon_driver = {
+	.probe = macsmc_hwmon_probe,
+	.driver = {
+		.name = "macsmc_hwmon",
+	},
+};
+module_platform_driver(macsmc_hwmon_driver);
+
+MODULE_DESCRIPTION("Apple Silicon SMC hwmon driver");
+MODULE_AUTHOR("James Calligeros <jcalligeros99@gmail.com>");
+MODULE_LICENSE("Dual MIT/GPL");
+MODULE_ALIAS("platform:macsmc_hwmon");
diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index 59be894460d33afa754927630881532b548b7ad8..bc4adf2fcfdce6c5ecbc51ced0e5985cbd36f54d 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -48,6 +48,7 @@ static const struct mfd_cell apple_smc_devs[] = {
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),
 	MFD_CELL_OF("macsmc-rtc", NULL, NULL, 0, 0, "apple,smc-rtc"),
+	MFD_CELL_OF("macsmc_hwmon", NULL, NULL, 0, 0, "apple,smc-hwmon"),
 };
 
 static int apple_smc_cmd_locked(struct apple_smc *smc, u64 cmd, u64 arg,

-- 
2.50.1


