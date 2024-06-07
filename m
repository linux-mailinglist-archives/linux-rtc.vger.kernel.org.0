Return-Path: <linux-rtc+bounces-1267-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 475AF900350
	for <lists+linux-rtc@lfdr.de>; Fri,  7 Jun 2024 14:20:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC6911F237E7
	for <lists+linux-rtc@lfdr.de>; Fri,  7 Jun 2024 12:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C42CA18F2E8;
	Fri,  7 Jun 2024 12:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rp0ZF0fe"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9D415B127;
	Fri,  7 Jun 2024 12:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717762855; cv=none; b=F3kkCnBOiwuRVqkgCTtJKD8lADDpkVAQe3oqLm85KaGdSK4asH+IHkup5Wio6P657wJnUA7FzeVbNBl/iutJU4Y2N2BpvGPbSLzVxCC+AaIHmx3REYSrkUy0gvKSP5Fay1Vg+Or949BFR/m1g6k1AH37xZRCw62PaIz4P4C01OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717762855; c=relaxed/simple;
	bh=eMCw1IJr5I1Ox93r2LuUPDZWr/JmobXcdGHWi8w1PYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XyYk+LVk1+8O0zNVtrDCGIvOdVnJSZPPZov6n19f5H7D0ggHCJ+9+GxwOFDuTq22H2R0riJ5n0wJ6hogaNeBpWS4Km3SxMJXUhjBXrB+3t8CAcgCvCNLUKol5pAHcYLBN1AZh6Pf/pcFSvvyJcPrEsdKFr3H+OYPU36S+z1BWTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rp0ZF0fe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2BF57C2BBFC;
	Fri,  7 Jun 2024 12:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717762855;
	bh=eMCw1IJr5I1Ox93r2LuUPDZWr/JmobXcdGHWi8w1PYo=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=rp0ZF0feWKUuvnL2SQriowxww73pGlCowcru8mpw+DWcETKrnfHWsDGr8VN+bS4Y2
	 GU5bUgSqm081/Exi0c9ZbDmd2QGfU+naJibNEUXe/jXs05CjTQCOsP6Ri2EVxLqKqQ
	 cHwm3ekbItti0XyO9is149VAX7E8vKmkdpPaEvbyfIEcsrYgqn1769q+BtiJgUswrw
	 07M5iUttsE9398UpPe5FqOoeFzYn5aNXZQ8rfhzGWP12zOUBTT/iISAXIeSx2GGKsA
	 2C/YTwEqJciywA+oF5Meuv+921ep/lXPa2kbbPAVh7n7J2wc4+M0cMIuIjFxeo8ajV
	 5rU9mRQoiQC6g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18D20C27C53;
	Fri,  7 Jun 2024 12:20:55 +0000 (UTC)
From: =?utf-8?q?T=C3=B3th_J=C3=A1nos_via_B4_Relay?= <devnull+gomba007.gmail.com@kernel.org>
Date: Fri, 07 Jun 2024 14:20:41 +0200
Subject: [PATCH] drivers: rtc: Add driver for SD2405AL.
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240607-rtc-sd2405al-v1-1-535971e7a866@gmail.com>
X-B4-Tracking: v=1; b=H4sIABj7YmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDMwNz3aKSZN3iFCDHNDFHN9HA0sTc2Nw82dw4RQmopaAoNS2zAmxcdGx
 tLQAkhCUBXgAAAA==
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717762854; l=8656;
 i=gomba007@gmail.com; s=20230706; h=from:subject:message-id;
 bh=o55Vp0mMCEzpw/fLJzQQKvJN8c5V9EiKu+siRTYRlmU=;
 b=9ehydTPKxYu6pmN23RlaoZdAHUK9vz83IGqJ6+Qk5AnvtxrZS0Lw+PE4ZN61aTiLnwQwj7mC2
 NCUlfFbWiU9BqUGaKAKtFWCxwdGVmgebhFTRmU2xvAENzDgolYs0RAO
X-Developer-Key: i=gomba007@gmail.com; a=ed25519;
 pk=iY9MjPCbud82ULS2PQJIq3QwjKyP/Sg730I6T2M8Y5U=
X-Endpoint-Received: by B4 Relay for gomba007@gmail.com/20230706 with
 auth_id=60
X-Original-From: =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>
Reply-To: gomba007@gmail.com

From: Tóth János <gomba007@gmail.com>

Add support for the DFRobot SD2405AL I2C RTC Module.

Datasheet:
	https://image.dfrobot.com/image/data/TOY0021/SD2405AL%20datasheet%20(Angelo%20v0.1).pdf

Product:
	https://www.dfrobot.com/product-1600.html

To instantiate (assuming device is connected to I2C-1)
as root:
	echo sd2405al 0x32 > /sys/bus/i2c/devices/i2c-1/new_device
as user:
	echo 'sd2405al 0x32' | sudo tee /sys/class/i2c-adapter/i2c-1/new_device

The driver is tested with:
	+ hwclock
	+ tools/testing/selftests/rtc/setdate
	+ tools/testing/selftests/rtc/rtctest

Signed-off-by: Tóth János <gomba007@gmail.com>
---
 MAINTAINERS                |   6 ++
 drivers/rtc/Kconfig        |  10 +++
 drivers/rtc/Makefile       |   1 +
 drivers/rtc/rtc-sd2405al.c | 195 +++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 212 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8754ac2c259d..c78587811433 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6337,6 +6337,12 @@ F:	include/net/devlink.h
 F:	include/uapi/linux/devlink.h
 F:	net/devlink/
 
+DFROBOT SD2405AL RTC DRIVER
+M:	Tóth János <gomba007@gmail.com>
+L:	linux-rtc@vger.kernel.org
+S:	Maintained
+F:	drivers/rtc/rtc-sd2405al.c
+
 DH ELECTRONICS IMX6 DHCOM/DHCOR BOARD SUPPORT
 M:	Christoph Niedermaier <cniedermaier@dh-electronics.com>
 L:	kernel@dh-electronics.com
diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 2a95b05982ad..15f1c0ba5759 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -743,6 +743,16 @@ config RTC_DRV_S5M
 	  This driver can also be built as a module. If so, the module
 	  will be called rtc-s5m.
 
+config RTC_DRV_SD2405AL
+	tristate "DFRobot SD2405AL"
+	select REGMAP_I2C
+	help
+	  If you say yes here you will get support for the
+	  DFRobot SD2405AL I2C RTC Module.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called rtc-sd2405al.
+
 config RTC_DRV_SD3078
 	tristate "ZXW Shenzhen whwave SD3078"
 	select REGMAP_I2C
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 3004e372f25f..3d19feba1e1c 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -162,6 +162,7 @@ obj-$(CONFIG_RTC_DRV_S3C)	+= rtc-s3c.o
 obj-$(CONFIG_RTC_DRV_S5M)	+= rtc-s5m.o
 obj-$(CONFIG_RTC_DRV_SA1100)	+= rtc-sa1100.o
 obj-$(CONFIG_RTC_DRV_SC27XX)	+= rtc-sc27xx.o
+obj-$(CONFIG_RTC_DRV_SD2405AL)	+= rtc-sd2405al.o
 obj-$(CONFIG_RTC_DRV_SD3078)   += rtc-sd3078.o
 obj-$(CONFIG_RTC_DRV_SH)	+= rtc-sh.o
 obj-$(CONFIG_RTC_DRV_SNVS)	+= rtc-snvs.o
diff --git a/drivers/rtc/rtc-sd2405al.c b/drivers/rtc/rtc-sd2405al.c
new file mode 100644
index 000000000000..3250c4616aa3
--- /dev/null
+++ b/drivers/rtc/rtc-sd2405al.c
@@ -0,0 +1,195 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * RTC driver for the SD2405AL Real-Time Clock
+ *
+ * Datasheet:
+ * https://image.dfrobot.com/image/data/TOY0021/SD2405AL%20datasheet%20(Angelo%20v0.1).pdf
+ *
+ * Copyright (C) 2024 Tóth János <gomba007@gmail.com>
+ * Copyright (C) 2018 Zoro Li <long17.cool@163.com>
+ */
+
+#include <linux/bcd.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/rtc.h>
+
+#define SD2405AL_REG_T_SEC	0x00
+#define SD2405AL_REG_T_MIN	0x01
+#define SD2405AL_REG_T_HOUR	0x02
+#define SD2405AL_REG_T_WEEK	0x03
+#define SD2405AL_REG_T_DAY	0x04
+#define SD2405AL_REG_T_MON	0x05
+#define SD2405AL_REG_T_YEAR	0x06
+
+#define SD2405AL_REG_A_SEC	0x07
+#define SD2405AL_REG_A_MIN	0x08
+#define SD2405AL_REG_A_HOUR	0x09
+#define SD2405AL_REG_A_WEEK	0x0A
+#define SD2405AL_REG_A_DAY	0x0B
+#define SD2405AL_REG_A_MON	0x0C
+#define SD2405AL_REG_A_YEAR	0x0D
+#define SD2405AL_REG_A_EN	0x0E
+
+#define SD2405AL_REG_CTR1	0x0F
+#define SD2405AL_REG_CTR2	0x10
+#define SD2405AL_REG_CTR3	0x11
+#define SD2405AL_REG_TTF	0x12
+#define SD2405AL_REG_CTR	0x13	/* count down register */
+
+#define SD2405AL_REG_M_START	0x14	/* general RAM start */
+#define SD2405AL_REG_M_END	0x1F	/* general RAM end */
+
+#define SD2405AL_NUM_T_REGS	(SD2405AL_REG_T_YEAR - SD2405AL_REG_T_SEC + 1)
+
+#define SD2405AL_BIT_24H	0x80
+#define SD2405AL_BIT_12H_PM	0x20
+
+struct sd2405al {
+	struct rtc_device	*rtc;
+	struct regmap		*regmap;
+};
+
+static int sd2405al_read_time(struct device *dev, struct rtc_time *time)
+{
+	u8 hour;
+	u8 data[SD2405AL_NUM_T_REGS] = { 0 };
+	struct i2c_client *client = to_i2c_client(dev);
+	struct sd2405al *sd2405al = i2c_get_clientdata(client);
+	int ret;
+
+	ret = regmap_bulk_read(sd2405al->regmap, SD2405AL_REG_T_SEC, data,
+			       SD2405AL_NUM_T_REGS);
+	if (ret < 0) {
+		printk(KBUILD_MODNAME ": reading failed: %d\n", ret);
+		return ret;
+	}
+
+	time->tm_sec = bcd2bin(data[SD2405AL_REG_T_SEC] & 0x7F);
+	time->tm_min = bcd2bin(data[SD2405AL_REG_T_MIN] & 0x7F);
+
+	hour = data[SD2405AL_REG_T_HOUR];
+	if (hour & SD2405AL_BIT_24H)
+		time->tm_hour = bcd2bin(hour & 0x3F);
+	else
+		if (hour & SD2405AL_BIT_12H_PM)
+			time->tm_hour = bcd2bin(hour & 0x1F) + 12;
+		else /* 12 hour mode, AM */
+			time->tm_hour = bcd2bin(hour & 0x1F);
+
+	time->tm_mday = bcd2bin(data[SD2405AL_REG_T_DAY] & 0x3F);
+	time->tm_wday = data[SD2405AL_REG_T_WEEK] & 0x07;
+	time->tm_mon = bcd2bin(data[SD2405AL_REG_T_MON] & 0x1F) - 1;
+	time->tm_year = bcd2bin(data[SD2405AL_REG_T_YEAR]) + 100;
+
+	return 0;
+}
+
+static int sd2405al_set_time(struct device *dev, struct rtc_time *time)
+{
+	u8 data[SD2405AL_NUM_T_REGS];
+	struct i2c_client *client = to_i2c_client(dev);
+	struct sd2405al *sd2405al = i2c_get_clientdata(client);
+	int ret;
+
+	data[SD2405AL_REG_T_SEC] = bin2bcd(time->tm_sec);
+	data[SD2405AL_REG_T_MIN] = bin2bcd(time->tm_min);
+	data[SD2405AL_REG_T_HOUR] = bin2bcd(time->tm_hour) | SD2405AL_BIT_24H;
+	data[SD2405AL_REG_T_DAY] = bin2bcd(time->tm_mday);
+	data[SD2405AL_REG_T_WEEK] = time->tm_wday & 0x07;
+	data[SD2405AL_REG_T_MON] = bin2bcd(time->tm_mon) + 1;
+	data[SD2405AL_REG_T_YEAR] = bin2bcd(time->tm_year - 100);
+
+	ret = regmap_bulk_write(sd2405al->regmap, SD2405AL_REG_T_SEC, data,
+				SD2405AL_NUM_T_REGS);
+	if (ret < 0) {
+		printk(KBUILD_MODNAME ": writing failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct rtc_class_ops sd2405al_rtc_ops = {
+	.read_time = sd2405al_read_time,
+	.set_time = sd2405al_set_time,
+};
+
+static const struct regmap_config sd2405al_regmap_conf = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = SD2405AL_REG_M_END,
+};
+
+static int sd2405al_probe(struct i2c_client *client)
+{
+	struct sd2405al *sd2405al;
+	int func;
+	int ret;
+
+	func = i2c_check_functionality(client->adapter, I2C_FUNC_I2C);
+	if (!func) {
+		printk(KBUILD_MODNAME ": invalid adapter\n");
+		return -ENODEV;
+	}
+
+	sd2405al = devm_kzalloc(&client->dev, sizeof(*sd2405al), GFP_KERNEL);
+	if (!sd2405al) {
+		printk(KBUILD_MODNAME ": unable to allocate memory\n");
+		return -ENOMEM;
+	}
+
+	sd2405al->regmap = devm_regmap_init_i2c(client, &sd2405al_regmap_conf);
+	if (IS_ERR(sd2405al->regmap)) {
+		printk(KBUILD_MODNAME ": unable to allocate regmap\n");
+		return PTR_ERR(sd2405al->regmap);
+	}
+
+	i2c_set_clientdata(client, sd2405al);
+
+	sd2405al->rtc = devm_rtc_allocate_device(&client->dev);
+	if (IS_ERR(sd2405al->rtc)) {
+		printk(KBUILD_MODNAME ": unable to allocate device\n");
+		return PTR_ERR(sd2405al->rtc);
+	}
+
+	sd2405al->rtc->ops = &sd2405al_rtc_ops;
+	sd2405al->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	sd2405al->rtc->range_max = RTC_TIMESTAMP_END_2099;
+
+	ret = devm_rtc_register_device(sd2405al->rtc);
+	if (ret < 0) {
+		printk(KBUILD_MODNAME ": unable to register device: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct i2c_device_id sd2405al_id[] = {
+	{ "sd2405al", 0 },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(i2c, sd2405al_id);
+
+static const __maybe_unused struct of_device_id sd2405al_of_match[] = {
+	{ .compatible = "dfrobot,sd2405al" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, sd2405al_of_match);
+
+static struct i2c_driver sd2405al_driver = {
+	.driver = {
+		.name = "sd2405al",
+		.of_match_table = of_match_ptr(sd2405al_of_match),
+	},
+	.probe = sd2405al_probe,
+	.id_table = sd2405al_id,
+};
+
+module_i2c_driver(sd2405al_driver);
+
+MODULE_AUTHOR("Tóth János");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("SD2405AL RTC driver");

---
base-commit: c3f38fa61af77b49866b006939479069cd451173
change-id: 20240607-rtc-sd2405al-a0947377c73d

Best regards,
-- 
Tóth János <gomba007@gmail.com>



