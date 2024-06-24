Return-Path: <linux-rtc+bounces-1393-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10939914896
	for <lists+linux-rtc@lfdr.de>; Mon, 24 Jun 2024 13:25:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB9912820BF
	for <lists+linux-rtc@lfdr.de>; Mon, 24 Jun 2024 11:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 004121386B3;
	Mon, 24 Jun 2024 11:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sqMzsZMO"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3BC13A256;
	Mon, 24 Jun 2024 11:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719228320; cv=none; b=oRwsTNCdS2B+G2uXARXBbGRhZSMA7q6TSHiIxM3w1p/sAuWMR3w3R06b56OmcaQN5hEsgtsvIELxXaK3NBGhJyyuumyLSM/tdxvfkDfJyor839RG+qdBO4vFyehu5mu80hFamxWttvEoU6CIO4GHAUVL0AjEENmZ2QFI94npzQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719228320; c=relaxed/simple;
	bh=Z2Camxsr76FjS6ZkYymoc61LxPcAH0m6ilcuZKrgeZs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BIBnrYQnH+AprhAH8TLaMvZNKTbLikfByftgCuI/fqeeOQioaGByYrzIDdTkOo57g0M177qUDm3M3Y6Iv+cuArcHxhNNHm+Cbq197/cjcFwkwaV4btqen91E7K1Yh60WbnC1Oi1HNG3uG/pdZSiTqb2ZnxdoDACfar7LuTV81KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sqMzsZMO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A8C82C2BBFC;
	Mon, 24 Jun 2024 11:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719228319;
	bh=Z2Camxsr76FjS6ZkYymoc61LxPcAH0m6ilcuZKrgeZs=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=sqMzsZMOtwGu4b3fgMkozpinYGiyQ07gi9bS255FzMg29bDDvrgnSzWPwSog9gUIq
	 bXLdvcXF2yw450E+edoTiwWDc9eZIcp1UK8VDRWg0AOjadkhcxamZQ2iZ/Nt1nznmO
	 kXPgHSW6fcIZT/qD3sBH7x5GONHTnMJLUKM4brTWNjDpGJi9831iUHfYc36IlU3bSQ
	 boTqQ6cC2MMhEx98KcjFb0/Dda1aaEr8f2bTSokUmRw53pW67EOuBQqZoWZ7dP/01G
	 cQ2La9yD07h2p8shV+anIw5P6czCtK4p5YGZwO3oQDkh0msVL1sBhntw8AatudKe5j
	 YxKlB46OEtU3w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95689C2BD05;
	Mon, 24 Jun 2024 11:25:19 +0000 (UTC)
From: =?utf-8?q?T=C3=B3th_J=C3=A1nos_via_B4_Relay?= <devnull+gomba007.gmail.com@kernel.org>
Date: Mon, 24 Jun 2024 13:25:13 +0200
Subject: [PATCH v4] drivers: rtc: Add driver for SD2405AL.
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240624-rtc-sd2405al-v4-1-2b2bc759f98f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJhXeWYC/3XMyQrDIBSF4VcJrmtxiFq76nuULq5DEiFD0SAtI
 e9ek1UIdPkf+M6Cko/BJ3SvFhR9DilMY4n6UiHbwdh6HFxpxAiriSQKx9ni5EoI6DEQXSuulFX
 coULe0Tfhs989X6W7kOYpfvf3TLf1z1GmmGLBhVbUK7hJ+WgHCP3VTgPajjI7YKpPmBXMtfHAt
 HEMxBnzA2bkhHnBUjhhDKHQCHLE67r+AKHRVW0iAQAA
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 csokas.bence@prolan.hu, 
 =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719228318; l=12741;
 i=gomba007@gmail.com; s=20230706; h=from:subject:message-id;
 bh=lY39a9Rg21EKsTFsds/Xw2qrf6x615sSPqU2Gawhd4M=;
 b=1xWi764vOKHbbG1ybUf012+J5Bll/xVtx/v531RAjqb68/TLYMhsk/Z+hFRFZ/HVYaxkd2ygX
 2sOIX8XLv02DDB+6vi/4XwLpQfOSMz5Cd6uFVck9Qr54vSfFuwM5ev/
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
Changes in v4:
- Implement more comprehensive data validation.
- Inline some temporary variables.
- Link to v3: https://lore.kernel.org/r/20240620-rtc-sd2405al-v3-1-65d5bb01af50@gmail.com

Changes in v3:
- #define-s of registers are reworked.
- Minor revisions based on the reviewer's suggestions.
- Link to v2: https://lore.kernel.org/r/20240619-rtc-sd2405al-v2-1-39bea29bd2a5@gmail.com

Changes in v2:
- Refactored based on reviewer's suggestions.
- I couldn't get the I2C IRQ to work on Raspberry Pi 4, so alarm is
  skipped.
- Link to v1: https://lore.kernel.org/r/20240607-rtc-sd2405al-v1-1-535971e7a866@gmail.com
---
 MAINTAINERS                |   6 +
 drivers/rtc/Kconfig        |  10 ++
 drivers/rtc/Makefile       |   1 +
 drivers/rtc/rtc-sd2405al.c | 319 +++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 336 insertions(+)

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
index 000000000000..5440cc1aed1d
--- /dev/null
+++ b/drivers/rtc/rtc-sd2405al.c
@@ -0,0 +1,319 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * RTC driver for the SD2405AL Real-Time Clock
+ *
+ * Datasheet:
+ * https://image.dfrobot.com/image/data/TOY0021/SD2405AL%20datasheet%20(Angelo%20v0.1).pdf
+ *
+ * Copyright (C) 2024 Tóth János <gomba007@gmail.com>
+ * Copyright (C) 2018 Zoro Li <long17.cool@163.com> (rtc-sd3078.c)
+ * Copyright (C) 2005 James Chapman (rtc-ds1307.c)
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
+#	define SD2405AL_BIT_WRTC3	BIT(6)
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
+static int sd2405al_check_writable(struct sd2405al *sd2405al)
+{
+	u8 data[2] = { 0 };
+	int ret;
+
+	ret = regmap_bulk_read(sd2405al->regmap, SD2405AL_REG_CTR1, data, 2);
+	if (ret < 0) {
+		dev_err(sd2405al->dev, "read failed: %d\n", ret);
+		return ret;
+	}
+
+	return (data[0] & (SD2405AL_BIT_WRTC2 | SD2405AL_BIT_WRTC3)) != 0 &&
+	       (data[1] & SD2405AL_BIT_WRTC1) != 0;
+}
+
+static int sd2405al_setup(struct sd2405al *sd2405al)
+{
+	int ret;
+
+	/* order of writes is important */
+	/*
+	 * CTR2.WRTC1 = 1, device is writable
+	 * CTR2.IM = 0, single event alarm
+	 * CTR2.S{1,0} = 0, disable INT pin
+	 * CTR2.FOBAT = 0, interrupt enabled during battery backup mode
+	 * CTR2.INTDE = 0, countdown interrupt disabled
+	 * CTR2.INTAE = 0, alarm interrupt disabled
+	 * CTR2.INTFE = 0, frequency interrupt disabled
+	 */
+	ret = regmap_write(sd2405al->regmap, SD2405AL_REG_CTR2,
+			   SD2405AL_BIT_WRTC1);
+	if (ret < 0) {
+		dev_err(sd2405al->dev, "write failed: %d\n", ret);
+		return ret;
+	}
+
+	/*
+	 * CTR2.WRTC3 = 1, device is writable
+	 * CTR1.INTAF = 0, clear alarm interrupt flag
+	 * CTR2.INTDF = 0, clear countdown interrupt flag
+	 * CTR2.WRTC2 = 1, device is writable
+	 */
+	ret = regmap_write(sd2405al->regmap, SD2405AL_REG_CTR1,
+			   SD2405AL_BIT_WRTC2 | SD2405AL_BIT_WRTC3);
+	if (ret < 0) {
+		dev_err(sd2405al->dev, "write failed: %d\n", ret);
+		return ret;
+	}
+
+	/*
+	 * CRT3.ARTS = 0, disable auto reset of interrupt flags
+	 * CTR3.TDS{1,0} = 0, unused, since countdown interrupt is disabled
+	 * CTR3.FS{3,2,1,0} = 0, unused since frequency interrupt is disabled
+	 */
+	ret = regmap_write(sd2405al->regmap, SD2405AL_REG_CTR3, 0);
+	if (ret < 0) {
+		dev_err(sd2405al->dev, "write failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = sd2405al_check_writable(sd2405al);
+	if (ret == 0) {
+		dev_err(sd2405al->dev, "device is not writable\n");
+		return -EINVAL;
+	} else if (ret < 0) {
+		return ret;
+	} else {
+		dev_dbg(sd2405al->dev, "device is writable\n");
+	}
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
+	if (ret < 0) {
+		dev_err(sd2405al->dev, "read failed: %d\n", ret);
+		return ret;
+	}
+
+	if (data[SD2405AL_REG_T_SEC] & 0x80) {
+		dev_err(sd2405al->dev, "invalid second\n");
+		return -EINVAL;
+	}
+
+	if (data[SD2405AL_REG_T_MIN] & 0x80) {
+		dev_err(sd2405al->dev, "invalid minute\n");
+		return -EINVAL;
+	}
+
+	if (data[SD2405AL_REG_T_HOUR] & 0x40) {
+		dev_err(sd2405al->dev, "invalid hour\n");
+		return -EINVAL;
+	}
+
+	if (data[SD2405AL_REG_T_WEEK] & 0xF8) {
+		dev_err(sd2405al->dev, "invalid week\n");
+		return -EINVAL;
+	}
+
+	if (data[SD2405AL_REG_T_DAY] & 0xC0) {
+		dev_err(sd2405al->dev, "invalid day\n");
+		return -EINVAL;
+	}
+
+	if (data[SD2405AL_REG_T_MON] & 0xE0) {
+		dev_err(sd2405al->dev, "invalid month\n");
+		return -EINVAL;
+	}
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
+	time->tm_wday = data[SD2405AL_REG_T_WEEK] & 0x07;
+	time->tm_mday = bcd2bin(data[SD2405AL_REG_T_DAY] & 0x3F);
+	time->tm_mon = bcd2bin(data[SD2405AL_REG_T_MON] & 0x1F) - 1;
+	time->tm_year = bcd2bin(data[SD2405AL_REG_T_YEAR]) + 100;
+
+	dev_dbg(sd2405al->dev, "read time: %d-%02d-%02d %02d:%02d:%02d\n",
+			       time->tm_year, time->tm_mon, time->tm_mday,
+			       time->tm_hour, time->tm_min, time->tm_sec);
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
+	ret = sd2405al_check_writable(sd2405al);
+	if (ret == 0) {
+		dev_err(sd2405al->dev, "device is not writable\n");
+		return -EINVAL;
+	} else if (ret < 0) {
+		return ret;
+	} else {
+		dev_dbg(sd2405al->dev, "device is writable\n");
+	}
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
+		dev_err(sd2405al->dev, "write failed: %d\n", ret);
+		return ret;
+	}
+
+	dev_dbg(sd2405al->dev, "set time: %d-%02d-%02d %02d:%02d:%02d\n",
+			       time->tm_year, time->tm_mon, time->tm_mday,
+			       time->tm_hour, time->tm_min, time->tm_sec);
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
+		dev_err(&client->dev, "invalid adapter\n");
+		return -ENODEV;
+	}
+
+	sd2405al = devm_kzalloc(&client->dev, sizeof(*sd2405al), GFP_KERNEL);
+	if (!sd2405al) {
+		dev_err(&client->dev, "unable to allocate memory\n");
+		return -ENOMEM;
+	}
+
+	sd2405al->dev = &client->dev;
+
+	sd2405al->regmap = devm_regmap_init_i2c(client, &sd2405al_regmap_conf);
+	if (IS_ERR(sd2405al->regmap)) {
+		dev_err(sd2405al->dev, "unable to allocate regmap\n");
+		return PTR_ERR(sd2405al->regmap);
+	}
+
+	ret = sd2405al_setup(sd2405al);
+	if (ret < 0) {
+		dev_err(sd2405al->dev, "unable to setup device\n");
+		return ret;
+	}
+
+	sd2405al->rtc = devm_rtc_allocate_device(&client->dev);
+	if (IS_ERR(sd2405al->rtc)) {
+		dev_err(sd2405al->dev, "unable to allocate device\n");
+		return PTR_ERR(sd2405al->rtc);
+	}
+
+	sd2405al->rtc->ops = &sd2405al_rtc_ops;
+	sd2405al->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	sd2405al->rtc->range_max = RTC_TIMESTAMP_END_2099;
+
+	dev_set_drvdata(&client->dev, sd2405al);
+
+	ret = devm_rtc_register_device(sd2405al->rtc);
+	if (ret < 0) {
+		dev_err(sd2405al->dev, "unable to register device: %d\n", ret);
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



