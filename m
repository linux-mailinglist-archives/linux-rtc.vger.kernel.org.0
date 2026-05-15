Return-Path: <linux-rtc+bounces-6529-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AY3O/OSB2pU9AIAu9opvQ
	(envelope-from <linux-rtc+bounces-6529-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 15 May 2026 23:41:07 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 956BC558514
	for <lists+linux-rtc@lfdr.de>; Fri, 15 May 2026 23:41:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 59F283017E50
	for <lists+linux-rtc@lfdr.de>; Fri, 15 May 2026 21:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3D673EDE7A;
	Fri, 15 May 2026 21:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="i1kqZTO3"
X-Original-To: linux-rtc@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D465B3EDE42;
	Fri, 15 May 2026 21:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778881218; cv=none; b=BXpYq1ILF2TLm+dL5NKhuyfCTK3cOP8udbxSHLs4mue+KVZDzvG9xmlYxbg/aNIylPetkMCutrkXilEVMHWSyk2qvVR7dyiBDgdaOZ9oUGv55ywfMLp1zv47RaHx5r+nIxHhq095W+naPG+hNLC4gxMuUWO2fRsmH7ZSEXPHiEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778881218; c=relaxed/simple;
	bh=LtJ2p+C07Hqb5o2CWBIZR0RsgdJAcrnGU55AOOt3XAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UhQjNRyqEMHictNU5u3rGu5xbD6cohDVc0vlFviG9OqIChFb5+RdR74KQmr2QLCvbKKdeMM/pN3ujfrNDL6rmXCY4YX+dElHH6l9j3JfJkK8X2WXs+9SFjzyRV+DREcGePhksl9GsZvCwA801MM0KHEAg6KyBPVBOVMEI5W/gzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=i1kqZTO3; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 7ABAB27179;
	Fri, 15 May 2026 23:40:15 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lf6403q45oGa; Fri, 15 May 2026 23:40:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1778881214; bh=LtJ2p+C07Hqb5o2CWBIZR0RsgdJAcrnGU55AOOt3XAU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=i1kqZTO3ZdgXYhUdjtm/EuBG9sJTEjGQ63jjVN9SgTAglbfgrLr4mHP8ouPBXcp6n
	 b7DxApQAOD8FFzMmZXWlGq7uG01qVCuTfJplvEy8fnh1HBbjmjhPF93VyUE/lgPbVz
	 0zvdlcwfIT55BBpBEgbhQrc+FtoDWPmMQCGs01MOVEx1R3vpWt/n9dcvYcNEclGOaz
	 2/BrPDHxwJcCCdDrR3VclUQRxplPSS25iZGiGOW8iqIgqDApEGsouT8AoGxCOokYaW
	 HnGB/5Y6duEQ9iAG283YcnNP8QL7sNu9X6Tf7+9ZPuHsapWPrCSl4M/8MIPPhjzT5j
	 imtGj2RRVaKaA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sat, 16 May 2026 03:08:39 +0530
Subject: [PATCH v7 07/10] leds: rgb: add support for Samsung S2M series
 PMIC RGB LED device
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-s2mu005-pmic-v7-7-73f9702fb461@disroot.org>
References: <20260516-s2mu005-pmic-v7-0-73f9702fb461@disroot.org>
In-Reply-To: <20260516-s2mu005-pmic-v7-0-73f9702fb461@disroot.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Sebastian Reichel <sre@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Nam Tran <trannamatk@gmail.com>, 
 =?utf-8?q?=C5=81ukasz_Lebiedzi=C5=84ski?= <kernel@lvkasz.us>, 
 Yassine Oudjana <y.oudjana@protonmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-doc@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Rspamd-Queue-Id: 956BC558514
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6529-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,samsung.com,linaro.org,bootlin.com,lwn.net,linuxfoundation.org,gmail.com,lvkasz.us,protonmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[disroot.org:email,disroot.org:mid,disroot.org:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Add support for the RGB LEDs found in certain Samsung S2M series PMICs.
The device has three LED channels, controlled as a single device. These
LEDs are typically used as status indicators in mobile phones.

The driver includes initial support for the S2MU005 PMIC RGB LEDs.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/leds/rgb/Kconfig        |  10 +
 drivers/leds/rgb/Makefile       |   1 +
 drivers/leds/rgb/leds-s2m-rgb.c | 426 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 437 insertions(+)

diff --git a/drivers/leds/rgb/Kconfig b/drivers/leds/rgb/Kconfig
index 28ef4c487367c..b16144b48b8f8 100644
--- a/drivers/leds/rgb/Kconfig
+++ b/drivers/leds/rgb/Kconfig
@@ -75,6 +75,16 @@ config LEDS_QCOM_LPG
 
 	  If compiled as a module, the module will be named leds-qcom-lpg.
 
+config LEDS_S2M_RGB
+	tristate "Samsung S2M series PMICs RGB LED support"
+	depends on LEDS_CLASS
+	depends on MFD_SEC_CORE
+	help
+	  This option enables support for the S2MU005 RGB LEDs. These devices
+	  have three LED channels, with 8-bit brightness control for each
+	  channel. The S2MU005 is usually found in mobile phones as status
+	  indicators.
+
 config LEDS_MT6370_RGB
 	tristate "LED Support for MediaTek MT6370 PMIC"
 	depends on MFD_MT6370
diff --git a/drivers/leds/rgb/Makefile b/drivers/leds/rgb/Makefile
index be45991f63f50..98050e1aa4255 100644
--- a/drivers/leds/rgb/Makefile
+++ b/drivers/leds/rgb/Makefile
@@ -6,4 +6,5 @@ obj-$(CONFIG_LEDS_LP5812)		+= leds-lp5812.o
 obj-$(CONFIG_LEDS_NCP5623)		+= leds-ncp5623.o
 obj-$(CONFIG_LEDS_PWM_MULTICOLOR)	+= leds-pwm-multicolor.o
 obj-$(CONFIG_LEDS_QCOM_LPG)		+= leds-qcom-lpg.o
+obj-$(CONFIG_LEDS_S2M_RGB)		+= leds-s2m-rgb.o
 obj-$(CONFIG_LEDS_MT6370_RGB)		+= leds-mt6370-rgb.o
diff --git a/drivers/leds/rgb/leds-s2m-rgb.c b/drivers/leds/rgb/leds-s2m-rgb.c
new file mode 100644
index 0000000000000..d239f54eee901
--- /dev/null
+++ b/drivers/leds/rgb/leds-s2m-rgb.c
@@ -0,0 +1,426 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * RGB LED Driver for Samsung S2M series PMICs.
+ *
+ * Copyright (c) 2015 Samsung Electronics Co., Ltd
+ * Copyright (c) 2026 Kaustabh Chakraborty <kauschluss@disroot.org>
+ */
+
+#include <linux/container_of.h>
+#include <linux/led-class-multicolor.h>
+#include <linux/mfd/samsung/core.h>
+#include <linux/mfd/samsung/s2mu005.h>
+#include <linux/minmax.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+struct s2m_rgb {
+	struct device *dev;
+	struct regmap *regmap;
+	struct led_classdev_mc mc;
+	/*
+	 * The mutex object prevents race conditions when evaluation and
+	 * application of LED pattern state.
+	 */
+	struct mutex lock;
+	/*
+	 * State variables representing the current LED pattern, these only to
+	 * be accessed when lock is held.
+	 */
+	u8 ramp_up;
+	u8 ramp_dn;
+	u8 stay_hi;
+	u8 stay_lo;
+};
+
+static struct led_classdev_mc *to_s2m_mc(struct led_classdev *cdev)
+{
+	return container_of(cdev, struct led_classdev_mc, led_cdev);
+}
+
+static struct s2m_rgb *to_s2m_rgb(struct led_classdev_mc *mc)
+{
+	return container_of(mc, struct s2m_rgb, mc);
+}
+
+static const u32 s2mu005_rgb_lut_ramp[] = {
+	0,	100,	200,	300,	400,	500,	600,	700,
+	800,	1000,	1200,	1400,	1600,	1800,	2000,	2200,
+};
+
+static const u32 s2mu005_rgb_lut_stay_hi[] = {
+	100,	200,	300,	400,	500,	750,	1000,	1250,
+	1500,	1750,	2000,	2250,	2500,	2750,	3000,	3250,
+};
+
+static const u32 s2mu005_rgb_lut_stay_lo[] = {
+	0,	500,	1000,	1500,	2000,	2500,	3000,	3500,
+	4000,	4500,	5000,	6000,	7000,	8000,	10000,	12000,
+};
+
+static int s2mu005_rgb_apply_params(struct s2m_rgb *rgb)
+{
+	struct regmap *regmap = rgb->regmap;
+	unsigned int ramp_val = 0;
+	unsigned int stay_val = 0;
+	int ret;
+
+	ramp_val |= FIELD_PREP(S2MU005_RGB_CH_RAMP_UP, rgb->ramp_up);
+	ramp_val |= FIELD_PREP(S2MU005_RGB_CH_RAMP_DN, rgb->ramp_dn);
+
+	stay_val |= FIELD_PREP(S2MU005_RGB_CH_STAY_HI, rgb->stay_hi);
+	stay_val |= FIELD_PREP(S2MU005_RGB_CH_STAY_LO, rgb->stay_lo);
+
+	ret = regmap_write(regmap, S2MU005_REG_RGB_EN, S2MU005_RGB_RESET);
+	if (ret) {
+		dev_err(rgb->dev, "failed to reset RGB LEDs\n");
+		return ret;
+	}
+
+	for (int i = 0; i < rgb->mc.num_colors; i++) {
+		ret = regmap_write(regmap, S2MU005_REG_RGB_CH_CTRL(i),
+				   rgb->mc.subled_info[i].brightness);
+		if (ret) {
+			dev_err(rgb->dev, "failed to set LED brightness\n");
+			return ret;
+		}
+
+		ret = regmap_write(regmap, S2MU005_REG_RGB_CH_RAMP(i), ramp_val);
+		if (ret) {
+			dev_err(rgb->dev, "failed to set ramp timings\n");
+			return ret;
+		}
+
+		ret = regmap_write(regmap, S2MU005_REG_RGB_CH_STAY(i), stay_val);
+		if (ret) {
+			dev_err(rgb->dev, "failed to set stay timings\n");
+			return ret;
+		}
+	}
+
+	ret = regmap_write(regmap, S2MU005_REG_RGB_EN, S2MU005_RGB_SLOPE_SMOOTH);
+	if (ret) {
+		dev_err(rgb->dev, "failed to set ramp slope\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int s2mu005_rgb_reset_params(struct s2m_rgb *rgb)
+{
+	struct regmap *regmap = rgb->regmap;
+	int ret;
+
+	ret = regmap_write(regmap, S2MU005_REG_RGB_EN, S2MU005_RGB_RESET);
+	if (ret) {
+		dev_err(rgb->dev, "failed to reset RGB LEDs\n");
+		return ret;
+	}
+
+	rgb->ramp_up = 0;
+	rgb->ramp_dn = 0;
+	rgb->stay_hi = 0;
+	rgb->stay_lo = 0;
+
+	return 0;
+}
+
+/*
+ * s2m_rgb_lut_get_closest_duration - find closest duration in look-up table
+ * @lut: the look-up table to search for the closest timing
+ * @len: number of elements in the look-up table array
+ * @duration: the timing duration requested
+ *
+ * This function does a binary search on the given array, and finds the closest
+ * value to the requested timing. It is expected that the look-up table to be
+ * provided, is already sorted.
+ *
+ * This function returns a negative error code, or a non-negative index of the
+ * value in the look-up table closest to the one requested.
+ */
+static int s2m_rgb_lut_get_closest_duration(const u32 *lut, const size_t len, const u32 duration)
+{
+	u32 closest_distance = abs(duration - lut[0]);
+	int closest_index = 0;
+	int lo = 0;
+	int hi = len - 1;
+
+	/*
+	 * Allow a small amount of extrapolation beyond the highest timing value.
+	 *
+	 * Consider x and y to be the two last values in the table, and x < y.
+	 * Since (y - x) / 2 integers, in the range [x + (y - x) / 2, y)
+	 * returns y as the closest, allow extrapolation for the succeeding
+	 * (y - x) / 2 integers as well, viz, up to (y, y + (y - x) / 2].
+	 * Anything beyond that is invalid.
+	 */
+	if (len >= 2 && duration > lut[len - 1] + (lut[len - 1] - lut[len - 2]) / 2)
+		return -EINVAL;
+
+	while (lo <= hi) {
+		int mid = lo + (hi - lo) / 2;
+
+		/* Narrow down search window as per binary-search algorithm. */
+		if (duration < lut[mid])
+			hi = mid - 1;
+		else
+			lo = mid + 1;
+
+		if (abs(duration - lut[mid]) < closest_distance) {
+			closest_distance = abs(duration - lut[mid]);
+			closest_index = mid;
+		}
+	}
+
+	return closest_index;
+}
+
+static int s2m_rgb_pattern_set(struct led_classdev *cdev, struct led_pattern *pattern, u32 len,
+			       int repeat)
+{
+	struct s2m_rgb *rgb = to_s2m_rgb(to_s2m_mc(cdev));
+	const u32 *lut_ramp_up, *lut_ramp_dn, *lut_stay_hi, *lut_stay_lo;
+	size_t lut_ramp_up_len, lut_ramp_dn_len, lut_stay_hi_len, lut_stay_lo_len;
+	int brightness_peak = 0;
+	u32 time_hi = 0, time_lo = 0;
+	bool ramp_up_en = false, ramp_dn_en = false;
+	int ret;
+
+	/*
+	 * The typical pattern supported by this device can be represented with
+	 * the following graph:
+	 *
+	 *  255 T ''''''-.                         .-'''''''-.
+	 *      |         '.                     .'           '.
+	 *      |           \                   /               \
+	 *      |            '.               .'                 '.
+	 *      |              '-...........-'                     '-
+	 *    0 +----------------------------------------------------> time (s)
+	 *
+	 *       <---- HIGH ----><-- LOW --><-------- HIGH --------->
+	 *       <-----><-------><---------><-------><-----><------->
+	 *       stay_hi ramp_dn   stay_lo   ramp_up stay_hi ramp_dn
+	 *
+	 * There are two states, named HIGH and LOW. HIGH has a non-zero
+	 * brightness level, while LOW is of zero brightness. The pattern
+	 * provided should mention only one zero and non-zero brightness level.
+	 * The hardware always starts the pattern from the HIGH state, as shown
+	 * in the graph.
+	 *
+	 * The HIGH state can be divided in three somewhat equal timings:
+	 * ramp_up, stay_hi, and ramp_dn. The LOW state has only one timing:
+	 * stay_lo.
+	 */
+
+	/* Only indefinitely looping patterns are supported. */
+	if (repeat != -1)
+		return -EINVAL;
+
+	/* Pattern should consist of at least two tuples. */
+	if (len < 2)
+		return -EINVAL;
+
+	for (int i = 0; i < len; i++) {
+		int brightness = pattern[i].brightness;
+		u32 delta_t = pattern[i].delta_t;
+
+		if (brightness) {
+			/*
+			 * The pattern should define only one non-zero
+			 * brightness in the HIGH state. The device doesn't
+			 * have any provisions to handle multiple peak
+			 * brightness levels.
+			 */
+			if (brightness_peak && brightness_peak != brightness)
+				return -EINVAL;
+
+			brightness_peak = brightness;
+			time_hi += delta_t;
+			ramp_dn_en = !!delta_t;
+		} else {
+			time_lo += delta_t;
+			ramp_up_en = !!delta_t;
+		}
+	}
+
+	/* LUTs are specific to device variant. */
+	lut_ramp_up = s2mu005_rgb_lut_ramp;
+	lut_ramp_up_len = ARRAY_SIZE(s2mu005_rgb_lut_ramp);
+	lut_ramp_dn = s2mu005_rgb_lut_ramp;
+	lut_ramp_dn_len = ARRAY_SIZE(s2mu005_rgb_lut_ramp);
+	lut_stay_hi = s2mu005_rgb_lut_stay_hi;
+	lut_stay_hi_len = ARRAY_SIZE(s2mu005_rgb_lut_stay_hi);
+	lut_stay_lo = s2mu005_rgb_lut_stay_lo;
+	lut_stay_lo_len = ARRAY_SIZE(s2mu005_rgb_lut_stay_lo);
+
+	mutex_lock(&rgb->lock);
+
+	/*
+	 * The timings ramp_up, stay_hi, and ramp_dn of the HIGH state are
+	 * roughly equal. Firstly, calculate and set timings for ramp_up and
+	 * ramp_dn (making sure they're exactly equal).
+	 */
+	rgb->ramp_up = 0;
+	rgb->ramp_dn = 0;
+
+	if (ramp_up_en) {
+		ret = s2m_rgb_lut_get_closest_duration(lut_ramp_up, lut_ramp_up_len, time_hi / 3);
+		if (ret < 0)
+			goto param_fail;
+		rgb->ramp_up = (u8)ret;
+	}
+
+	if (ramp_dn_en) {
+		ret = s2m_rgb_lut_get_closest_duration(lut_ramp_dn, lut_ramp_dn_len, time_hi / 3);
+		if (ret < 0)
+			goto param_fail;
+		rgb->ramp_dn = (u8)ret;
+	}
+
+	/*
+	 * Subtract the allocated ramp timings from time_hi (and also making
+	 * sure it doesn't underflow!). The remaining time is allocated to
+	 * stay_hi.
+	 */
+	time_hi -= min(time_hi, lut_ramp_up[rgb->ramp_up]);
+	time_hi -= min(time_hi, lut_ramp_dn[rgb->ramp_dn]);
+
+	ret = s2m_rgb_lut_get_closest_duration(lut_stay_hi, lut_stay_hi_len, time_hi);
+	if (ret < 0)
+		goto param_fail;
+	rgb->stay_hi = (u8)ret;
+
+	ret = s2m_rgb_lut_get_closest_duration(lut_stay_lo, lut_stay_lo_len, time_lo);
+	if (ret < 0)
+		goto param_fail;
+	rgb->stay_lo = (u8)ret;
+
+	led_mc_calc_color_components(&rgb->mc, brightness_peak);
+	/* Apply params with variant-specific implementation. */
+	ret = s2mu005_rgb_apply_params(rgb);
+	if (ret)
+		goto param_fail;
+
+	mutex_unlock(&rgb->lock);
+
+	return 0;
+
+param_fail:
+	rgb->ramp_up = 0;
+	rgb->ramp_dn = 0;
+	rgb->stay_hi = 0;
+	rgb->stay_lo = 0;
+
+	mutex_unlock(&rgb->lock);
+
+	return ret;
+}
+
+static int s2m_rgb_pattern_clear(struct led_classdev *cdev)
+{
+	struct s2m_rgb *rgb = to_s2m_rgb(to_s2m_mc(cdev));
+	int ret = 0;
+
+	mutex_lock(&rgb->lock);
+
+	/* Reset params with variant-specific implementation. */
+	ret = s2mu005_rgb_reset_params(rgb);
+
+	mutex_unlock(&rgb->lock);
+
+	return ret;
+}
+
+static int s2m_rgb_brightness_set(struct led_classdev *cdev, enum led_brightness value)
+{
+	struct s2m_rgb *rgb = to_s2m_rgb(to_s2m_mc(cdev));
+	int ret = 0;
+
+	if (!value)
+		return s2m_rgb_pattern_clear(cdev);
+
+	mutex_lock(&rgb->lock);
+
+	led_mc_calc_color_components(&rgb->mc, value);
+	/* Apply params with variant-specific implementation. */
+	ret = s2mu005_rgb_apply_params(rgb);
+
+	mutex_unlock(&rgb->lock);
+
+	return ret;
+}
+
+static const struct mc_subled s2mu005_rgb_subled_info[] = {
+	{ .channel = 0, .color_index = LED_COLOR_ID_BLUE },
+	{ .channel = 1, .color_index = LED_COLOR_ID_GREEN },
+	{ .channel = 2, .color_index = LED_COLOR_ID_RED },
+};
+
+static int s2m_rgb_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct sec_pmic_dev *pmic_drvdata = dev_get_drvdata(dev->parent);
+	struct s2m_rgb *rgb;
+	struct led_init_data init_data = {};
+	int ret;
+
+	rgb = devm_kzalloc(dev, sizeof(*rgb), GFP_KERNEL);
+	if (!rgb)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, rgb);
+	rgb->dev = dev;
+	rgb->regmap = pmic_drvdata->regmap_pmic;
+
+	/* Configure variant-specific details. */
+	rgb->mc.num_colors = ARRAY_SIZE(s2mu005_rgb_subled_info);
+	rgb->mc.subled_info = devm_kmemdup(dev, s2mu005_rgb_subled_info,
+					   sizeof(s2mu005_rgb_subled_info), GFP_KERNEL);
+	if (!rgb->mc.subled_info)
+		return -ENOMEM;
+
+	rgb->mc.led_cdev.max_brightness = 255;
+	rgb->mc.led_cdev.brightness_set_blocking = s2m_rgb_brightness_set;
+	rgb->mc.led_cdev.pattern_set = s2m_rgb_pattern_set;
+	rgb->mc.led_cdev.pattern_clear = s2m_rgb_pattern_clear;
+
+	ret = devm_mutex_init(dev, &rgb->lock);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to create mutex lock\n");
+
+	init_data.fwnode = of_fwnode_handle(dev->of_node);
+	ret = devm_led_classdev_multicolor_register_ext(dev, &rgb->mc, &init_data);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to create LED device\n");
+
+	return 0;
+}
+
+static const struct platform_device_id s2m_rgb_id_table[] = {
+	{ "s2mu005-rgb", S2MU005 },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(platform, s2m_rgb_id_table);
+
+static const struct of_device_id s2m_rgb_of_match_table[] = {
+	{ .compatible = "samsung,s2mu005-rgb", .data = (void *)S2MU005 },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, s2m_rgb_of_match_table);
+
+static struct platform_driver s2m_rgb_driver = {
+	.driver = {
+		.name = "s2m-rgb",
+	},
+	.probe = s2m_rgb_probe,
+	.id_table = s2m_rgb_id_table,
+};
+module_platform_driver(s2m_rgb_driver);
+
+MODULE_DESCRIPTION("RGB LED Driver for Samsung S2M Series PMICs");
+MODULE_AUTHOR("Kaustabh Chakraborty <kauschluss@disroot.org>");
+MODULE_LICENSE("GPL");

-- 
2.53.0


