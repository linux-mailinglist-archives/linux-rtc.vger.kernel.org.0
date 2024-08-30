Return-Path: <linux-rtc+bounces-1784-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7117F965A79
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2024 10:36:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 281FA2871D9
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2024 08:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 423AB16DC26;
	Fri, 30 Aug 2024 08:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cU0Esq3/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F85916C84C;
	Fri, 30 Aug 2024 08:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725007005; cv=none; b=X0wn/dIvpXaTsMka/xaLMmSSsX+n/ro4wA+whgv8bhgo7/UOW20h2c1s6YB8g327bMyEsWItPRaotQ4sidQ3ldowDIwGcyPtO7wEaFA7CAeS1Sr9BJGXs0iMzp7RV1ZDGEeSINzo4sDDBQw1SR5LGUwaTR4Ac1uwe1OFP4xjnyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725007005; c=relaxed/simple;
	bh=ZUz+UwKZADiM9d5GLfgNl/NZnCEUTL0DNtSy6NVyG2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RyP5G9fWHC/ZRMmpCfO4LHBPSPuUcDLzh1e7EgP4b7w2ON9v09CaX5uVMHTnp3qhumXouEg2uwCp2omYsSCRR/Vqc2rzLQhLE/IFzh4P05itJdDpU60pVlIofmBAImH2KVGUpZYtk6XbaR48WUAWlDRWlgXWJwschMAePWbz1OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cU0Esq3/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B26C9C4CEC7;
	Fri, 30 Aug 2024 08:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725007004;
	bh=ZUz+UwKZADiM9d5GLfgNl/NZnCEUTL0DNtSy6NVyG2U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cU0Esq3/tEKe7YP31YmlBC3Lh2h1y6tIM/Po96YMuoQFicgPoBBbi8i411zbzGAJ4
	 gNy5F9HJAstTzbPhtxvJv1FNjhQNyBAknmkN+tbf937vnOAtjqF+a579lz2Kw8AJTC
	 Yidnak/InFKllp1isDi2VhJJBRNg1jcIpSpxWblwgYAslWzHWlM/9cYRET2gCN1nua
	 rdDeEBh5K51B4VP21801WgqJWragz6L8CuWK2Ai3EZbJv1Qy6OC0wr8Gnxs/M13Lni
	 R08NTHUeMe8A1pnFDNtyKGo0/kwWWkeBFG9SfdB2jX9Dol0MzObNehwR2P1uhqkqGU
	 1xurQHmGS0ttg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D296CA0EED;
	Fri, 30 Aug 2024 08:36:44 +0000 (UTC)
From: =?utf-8?q?T=C3=B3th_J=C3=A1nos_via_B4_Relay?= <devnull+gomba007.gmail.com@kernel.org>
Date: Fri, 30 Aug 2024 10:36:39 +0200
Subject: [PATCH v7 1/3] drivers: rtc: Add driver for SD2405AL.
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240830-rtc-sd2405al-v7-1-2f7102621b1d@gmail.com>
References: <20240830-rtc-sd2405al-v7-0-2f7102621b1d@gmail.com>
In-Reply-To: <20240830-rtc-sd2405al-v7-0-2f7102621b1d@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>, 
 =?utf-8?q?Cs=C3=B3k=C3=A1s_Bence?= <csokas.bence@prolan.hu>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725007003; l=9219;
 i=gomba007@gmail.com; s=20230706; h=from:subject:message-id;
 bh=llQTE5VgwwI330WeHnWVMSwEoNFOOn1T6DOJ4+JU8pM=;
 b=KyT0uMmIjDNpFyyWhVVihylUIUXr+Eea88rMTk0ULfVRa8QzLoswBzhqDmZq3tAq/UFxdDJ+0
 28zihcpipnbBra9JP9I2I3E1c0tRq1S+ZL4wae4X/tmXgoKDTJkKIr6
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

Reviewed-by: Csókás Bence <csokas.bence@prolan.hu>
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



