Return-Path: <linux-rtc+bounces-1768-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C658B964304
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2024 13:32:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55C2D1F21B69
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2024 11:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEE49191F8B;
	Thu, 29 Aug 2024 11:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LU+aI8I3"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42C219007E;
	Thu, 29 Aug 2024 11:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724931118; cv=none; b=miTqNYXf8s+kSCd/ksccNJsMG74Vsdn13f+D0hgse4EvVe5pQ7yHptIR0NOfkaS6EmfH+KWWKahqF/z0FtUHRv9JJ+zAdjRqMgfipZN69msvVjalqEGG3svSSZB6xUMOETukHSvtH0GzF0U9d9W7uq5bcovSt+9p+yelCD7YgZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724931118; c=relaxed/simple;
	bh=jQF4TuKxtASy1sEZW0DYTAdUhFbAY1ygbfElaDGjIJk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KSiZ+ozWo4n+KhMNf5y6v9Xq+5Q1PZCiB0OooWoi8kdgzHF8+dJPDxWgi3KM75dhNeX2yiTePZoHtNU8PpykuuchYiytsGm/inqV6494XW9ms9EN383ukfdyKdH/Wcx9TH8yTBuDfNFfKfrCjv1Cw72yV3gFBfu9sxUmlwIBrvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LU+aI8I3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5C86BC4CEC8;
	Thu, 29 Aug 2024 11:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724931118;
	bh=jQF4TuKxtASy1sEZW0DYTAdUhFbAY1ygbfElaDGjIJk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LU+aI8I3f6fQ0Ww4pH3Y5SpzRVklM74HlZJQPS5OCUnsWrjC2NjHyODE6SvC9TcFB
	 0cu7SFEocIZ2UsIKu48PJLHY55JvwPypb6tSaFuRor6i/X5cN6IcUAHlg++UyRIsZ+
	 gwumkumigAUcvtmFiTv2QT58FoYzne9qaYxTqbIZzTxD01qNMNVG36csNJgGtS2oFO
	 QaLnwZEdvtOsrS2iZ7PnwXGS8ARI7Qq34IvzRtZhvYc8wPzcQMQ5aQvjfpRgUHX+7w
	 dEgARtPhxYOCgP1SypdOEKaxhatpFD+k7ZlPv4XzIhcVD9geUB91abqkrkFiMTdOYT
	 Ix9c9Yjvd3wgQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F0B6C83F07;
	Thu, 29 Aug 2024 11:31:58 +0000 (UTC)
From: =?utf-8?q?T=C3=B3th_J=C3=A1nos_via_B4_Relay?= <devnull+gomba007.gmail.com@kernel.org>
Date: Thu, 29 Aug 2024 13:31:44 +0200
Subject: [PATCH v6 1/2] drivers: rtc: Add driver for SD2405AL.
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240829-rtc-sd2405al-v6-1-4fbfe2624aa7@gmail.com>
References: <20240829-rtc-sd2405al-v6-0-4fbfe2624aa7@gmail.com>
In-Reply-To: <20240829-rtc-sd2405al-v6-0-4fbfe2624aa7@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 csokas.bence@prolan.hu, devicetree@vger.kernel.org, 
 =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724931117; l=9165;
 i=gomba007@gmail.com; s=20230706; h=from:subject:message-id;
 bh=ABNdZnaYDhckxTTHByDoB2+Rr1ZEBUu38qqJSPguoZ8=;
 b=1Q89Jt617ggPTPjGQajKdXgslKlN6GDqwn0f8sR+KkCOj/IHOENR6H9XoigbWUf7rMp1cgWlk
 RBisnvL8ebUDy8kp44c0nVFORYHQnAqQee+wGbDJewKdBSUH2eNuR7u
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
 drivers/rtc/Kconfig        |  10 ++
 drivers/rtc/Makefile       |   1 +
 drivers/rtc/rtc-sd2405al.c | 227 +++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 244 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 878dcd23b331..cb4e5fcde44e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6476,6 +6476,12 @@ F:	include/net/devlink.h
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
index 000000000000..d2568c3e3876
--- /dev/null
+++ b/drivers/rtc/rtc-sd2405al.c
@@ -0,0 +1,227 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * RTC driver for the SD2405AL Real-Time Clock
+ *
+ * Datasheet:
+ * https://image.dfrobot.com/image/data/TOY0021/SD2405AL%20datasheet%20(Angelo%20v0.1).pdf
+ *
+ * Copyright (C) 2024 Tóth János <gomba007@gmail.com>
+ */
+
+#include <linux/bcd.h>
+#include <linux/i2c.h>
+#include <linux/regmap.h>
+#include <linux/rtc.h>
+
+/* Real time clock registers */
+#define SD2405AL_REG_T_SEC	0x00
+#define SD2405AL_REG_T_MIN	0x01
+#define SD2405AL_REG_T_HOUR	0x02
+#	define SD2405AL_BIT_12H_PM	BIT(5)
+#	define SD2405AL_BIT_24H		BIT(7)
+#define SD2405AL_REG_T_WEEK	0x03
+#define SD2405AL_REG_T_DAY	0x04
+#define SD2405AL_REG_T_MON	0x05
+#define SD2405AL_REG_T_YEAR	0x06
+
+#define SD2405AL_NUM_T_REGS	(SD2405AL_REG_T_YEAR - SD2405AL_REG_T_SEC + 1)
+
+/* Control registers */
+#define SD2405AL_REG_CTR1	0x0F
+#	define SD2405AL_BIT_WRTC2	BIT(2)
+#	define SD2405AL_BIT_WRTC3	BIT(7)
+#define SD2405AL_REG_CTR2	0x10
+#	define SD2405AL_BIT_WRTC1	BIT(7)
+#define SD2405AL_REG_CTR3	0x11
+#define SD2405AL_REG_TTF	0x12
+#define SD2405AL_REG_CNTDWN	0x13
+
+/* General RAM */
+#define SD2405AL_REG_M_START	0x14
+#define SD2405AL_REG_M_END	0x1F
+
+struct sd2405al {
+	struct device		*dev;
+	struct rtc_device	*rtc;
+	struct regmap		*regmap;
+};
+
+static int sd2405al_enable_reg_write(struct sd2405al *sd2405al)
+{
+	int ret;
+
+	/* order of writes is important */
+	ret = regmap_update_bits(sd2405al->regmap, SD2405AL_REG_CTR2,
+				 SD2405AL_BIT_WRTC1, SD2405AL_BIT_WRTC1);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_update_bits(sd2405al->regmap, SD2405AL_REG_CTR1,
+				 SD2405AL_BIT_WRTC2 | SD2405AL_BIT_WRTC3,
+				 SD2405AL_BIT_WRTC2 | SD2405AL_BIT_WRTC3);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int sd2405al_disable_reg_write(struct sd2405al *sd2405al)
+{
+	int ret;
+
+	/* order of writes is important */
+	ret = regmap_update_bits(sd2405al->regmap, SD2405AL_REG_CTR1,
+				 SD2405AL_BIT_WRTC2 | SD2405AL_BIT_WRTC3, 0x00);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_update_bits(sd2405al->regmap, SD2405AL_REG_CTR2,
+				 SD2405AL_BIT_WRTC1, 0x00);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int sd2405al_read_time(struct device *dev, struct rtc_time *time)
+{
+	u8 data[SD2405AL_NUM_T_REGS] = { 0 };
+	struct sd2405al *sd2405al = dev_get_drvdata(dev);
+	int ret;
+
+	ret = regmap_bulk_read(sd2405al->regmap, SD2405AL_REG_T_SEC, data,
+			       SD2405AL_NUM_T_REGS);
+	if (ret < 0)
+		return ret;
+
+	time->tm_sec = bcd2bin(data[SD2405AL_REG_T_SEC] & 0x7F);
+	time->tm_min = bcd2bin(data[SD2405AL_REG_T_MIN] & 0x7F);
+
+	if (data[SD2405AL_REG_T_HOUR] & SD2405AL_BIT_24H)
+		time->tm_hour = bcd2bin(data[SD2405AL_REG_T_HOUR] & 0x3F);
+	else
+		if (data[SD2405AL_REG_T_HOUR] & SD2405AL_BIT_12H_PM)
+			time->tm_hour = bcd2bin(data[SD2405AL_REG_T_HOUR]
+						& 0x1F) + 12;
+		else /* 12 hour mode, AM */
+			time->tm_hour = bcd2bin(data[SD2405AL_REG_T_HOUR]
+						& 0x1F);
+
+	time->tm_wday = bcd2bin(data[SD2405AL_REG_T_WEEK] & 0x07);
+	time->tm_mday = bcd2bin(data[SD2405AL_REG_T_DAY] & 0x3F);
+	time->tm_mon = bcd2bin(data[SD2405AL_REG_T_MON] & 0x1F) - 1;
+	time->tm_year = bcd2bin(data[SD2405AL_REG_T_YEAR]) + 100;
+
+	dev_dbg(sd2405al->dev, "read time: %ptR (%d)\n", time, time->tm_wday);
+
+	return 0;
+}
+
+static int sd2405al_set_time(struct device *dev, struct rtc_time *time)
+{
+	u8 data[SD2405AL_NUM_T_REGS];
+	struct sd2405al *sd2405al = dev_get_drvdata(dev);
+	int ret;
+
+	data[SD2405AL_REG_T_SEC] = bin2bcd(time->tm_sec);
+	data[SD2405AL_REG_T_MIN] = bin2bcd(time->tm_min);
+	data[SD2405AL_REG_T_HOUR] = bin2bcd(time->tm_hour) | SD2405AL_BIT_24H;
+	data[SD2405AL_REG_T_DAY] = bin2bcd(time->tm_mday);
+	data[SD2405AL_REG_T_WEEK] = bin2bcd(time->tm_wday);
+	data[SD2405AL_REG_T_MON] = bin2bcd(time->tm_mon) + 1;
+	data[SD2405AL_REG_T_YEAR] = bin2bcd(time->tm_year - 100);
+
+	ret = sd2405al_enable_reg_write(sd2405al);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_bulk_write(sd2405al->regmap, SD2405AL_REG_T_SEC, data,
+				SD2405AL_NUM_T_REGS);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_write(sd2405al->regmap, SD2405AL_REG_TTF, 0x00);
+	if (ret < 0)
+		return ret;
+
+	ret = sd2405al_disable_reg_write(sd2405al);
+	if (ret < 0)
+		return ret;
+
+	dev_dbg(sd2405al->dev, "set time: %ptR (%d)\n", time, time->tm_wday);
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
+	int ret;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
+		return -ENODEV;
+
+	sd2405al = devm_kzalloc(&client->dev, sizeof(*sd2405al), GFP_KERNEL);
+	if (!sd2405al)
+		return -ENOMEM;
+
+	sd2405al->dev = &client->dev;
+
+	sd2405al->regmap = devm_regmap_init_i2c(client, &sd2405al_regmap_conf);
+	if (IS_ERR(sd2405al->regmap))
+		return PTR_ERR(sd2405al->regmap);
+
+	sd2405al->rtc = devm_rtc_allocate_device(&client->dev);
+	if (IS_ERR(sd2405al->rtc))
+		return PTR_ERR(sd2405al->rtc);
+
+	sd2405al->rtc->ops = &sd2405al_rtc_ops;
+	sd2405al->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	sd2405al->rtc->range_max = RTC_TIMESTAMP_END_2099;
+
+	dev_set_drvdata(&client->dev, sd2405al);
+
+	ret = devm_rtc_register_device(sd2405al->rtc);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static const struct i2c_device_id sd2405al_id[] = {
+	{ "sd2405al" },
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
+MODULE_AUTHOR("Tóth János <gomba007@gmail.com>");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("SD2405AL RTC driver");

-- 
2.34.1



