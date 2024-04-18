Return-Path: <linux-rtc+bounces-1048-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA6F8A998C
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Apr 2024 14:11:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C14401C20A44
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Apr 2024 12:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36C9715F3FD;
	Thu, 18 Apr 2024 12:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RbwQLr6s"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133F115E814
	for <linux-rtc@vger.kernel.org>; Thu, 18 Apr 2024 12:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713442297; cv=none; b=uIJuuDMavMYRpdWsLEMkJ4EPuTrHUqdTmOGd3xx/SLxL/VkfKpZ+hCllYWQs9NMdQLo5VcAYuatQZp26B7ltsFRh/FEjEyvdG00Pl6O5EKSBVNty1uXI7iVdWeYJu9Zly8Lu2qUOBzOhIko3+3B84yFa2uMc5FGAWjw7XDPTBhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713442297; c=relaxed/simple;
	bh=nGHPRU8KnfEOU2FrE1MhEj++VkjD9iwgx6j4/7FPGdE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lIhrg6RMm8u6cAp/ZlJBYz8lunOi5yyZct/DU+2HAs+DFnZ3ZOhx69KBO2VgLF7cM5Pf3vMJnX6vtKSPr/Yr7DpdCziEgGv14xZJpLezyYthMxr7F32KLfZ0ypI37WLO7WXbGdJuu42mvDkNUYUbYgCwlLLZIiyqd6sQcsnA2Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RbwQLr6s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD121C113CC;
	Thu, 18 Apr 2024 12:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713442296;
	bh=nGHPRU8KnfEOU2FrE1MhEj++VkjD9iwgx6j4/7FPGdE=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RbwQLr6sg+wU/tESCqQ3A+5tEnawJH0bHwm0WCDa+hy78xgctZBXGA6JeWauIzWrd
	 SZWFH7DAy2eB5IXHhFbBSbvrg2v7rI/+Iv7m+jN7QwkKc3gWhHs/XieiIA/D3KVBSP
	 NYpqY4nE55sJjMtxLxP7mm3RFWh8m3uJ5jxd5WFipTS+Kljik16PK91z1nImoj9WB7
	 DYFJZKEGvcGR5d0GXj8hPUZoF8eRSXQzPVcfe5fflt7G5w7vwQ03rg7Wb2OrLdZhQw
	 o/vo9OMGsrTNXBmdfJxZGVsMucjjO9hDqZp5hwgxxI8rcW7fsvflHPbCBo5G2ObZEf
	 DtR3MBKMPNvRg==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Andy Shevchenko <andy@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-rtc@vger.kernel.org
Cc: arm@kernel.org,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v6 04/11] platform: cznic: turris-omnia-mcu: Add support for poweroff and wakeup
Date: Thu, 18 Apr 2024 14:11:09 +0200
Message-ID: <20240418121116.22184-5-kabel@kernel.org>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240418121116.22184-1-kabel@kernel.org>
References: <20240418121116.22184-1-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for true board poweroff (MCU can disable all unnecessary
voltage regulators) and wakeup at a specified time, implemented via a
RTC driver so that the rtcwake utility can be used to configure it.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 .../sysfs-bus-i2c-devices-turris-omnia-mcu    |  16 ++
 drivers/platform/cznic/Kconfig                |   4 +
 drivers/platform/cznic/Makefile               |   1 +
 .../platform/cznic/turris-omnia-mcu-base.c    |   5 +
 .../cznic/turris-omnia-mcu-sys-off-wakeup.c   | 258 ++++++++++++++++++
 drivers/platform/cznic/turris-omnia-mcu.h     |  20 ++
 6 files changed, 304 insertions(+)
 create mode 100644 drivers/platform/cznic/turris-omnia-mcu-sys-off-wakeup.c

diff --git a/Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu b/Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu
index b27b60d00c87..564119849388 100644
--- a/Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu
+++ b/Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu
@@ -38,6 +38,22 @@ Description:	(RW) The front button on the Turris Omnia router can be
 
 		Format: %s.
 
+What:		/sys/bus/i2c/devices/<mcu_device>/front_button_poweron
+Date:		July 2024
+KernelVersion:	6.10
+Contact:	Marek Behún <kabel@kernel.org>
+Description:	(RW) Newer versions of the microcontroller firmware of the
+		Turris Omnia router support powering off the router into true
+		low power mode. The router can be powered on by pressing the
+		front button.
+
+		This file configures whether front button power on is enabled.
+
+		This file is present only if the power off feature is supported
+		by the firmware.
+
+		Format: %i.
+
 What:		/sys/bus/i2c/devices/<mcu_device>/fw_features
 Date:		July 2024
 KernelVersion:	6.10
diff --git a/drivers/platform/cznic/Kconfig b/drivers/platform/cznic/Kconfig
index 3a8c3edcd7e6..0a752aa654fa 100644
--- a/drivers/platform/cznic/Kconfig
+++ b/drivers/platform/cznic/Kconfig
@@ -19,10 +19,14 @@ config TURRIS_OMNIA_MCU
 	depends on I2C
 	select GPIOLIB
 	select GPIOLIB_IRQCHIP
+	select RTC_CLASS
 	help
 	  Say Y here to add support for the features implemented by the
 	  microcontroller on the CZ.NIC's Turris Omnia SOHO router.
 	  The features include:
+	  - board poweroff into true low power mode (with voltage regulators
+	    disabled) and the ability to configure wake up from this mode (via
+	    rtcwake)
 	  - GPIO pins
 	    - to get front button press events (the front button can be
 	      configured either to generate press events to the CPU or to change
diff --git a/drivers/platform/cznic/Makefile b/drivers/platform/cznic/Makefile
index 53fd8f1777a3..a185ef882e44 100644
--- a/drivers/platform/cznic/Makefile
+++ b/drivers/platform/cznic/Makefile
@@ -3,3 +3,4 @@
 obj-$(CONFIG_TURRIS_OMNIA_MCU)	+= turris-omnia-mcu.o
 turris-omnia-mcu-y		:= turris-omnia-mcu-base.o
 turris-omnia-mcu-y		+= turris-omnia-mcu-gpio.o
+turris-omnia-mcu-y		+= turris-omnia-mcu-sys-off-wakeup.o
diff --git a/drivers/platform/cznic/turris-omnia-mcu-base.c b/drivers/platform/cznic/turris-omnia-mcu-base.c
index 708b084cb5da..697ace090bda 100644
--- a/drivers/platform/cznic/turris-omnia-mcu-base.c
+++ b/drivers/platform/cznic/turris-omnia-mcu-base.c
@@ -195,6 +195,7 @@ static const struct attribute_group omnia_mcu_base_group = {
 static const struct attribute_group *omnia_mcu_groups[] = {
 	&omnia_mcu_base_group,
 	&omnia_mcu_gpio_group,
+	&omnia_mcu_poweroff_group,
 	NULL
 };
 
@@ -360,6 +361,10 @@ static int omnia_mcu_probe(struct i2c_client *client)
 					     "Cannot read board info\n");
 	}
 
+	err = omnia_mcu_register_sys_off_and_wakeup(mcu);
+	if (err)
+		return err;
+
 	return omnia_mcu_register_gpiochip(mcu);
 }
 
diff --git a/drivers/platform/cznic/turris-omnia-mcu-sys-off-wakeup.c b/drivers/platform/cznic/turris-omnia-mcu-sys-off-wakeup.c
new file mode 100644
index 000000000000..fbd1b4cd7011
--- /dev/null
+++ b/drivers/platform/cznic/turris-omnia-mcu-sys-off-wakeup.c
@@ -0,0 +1,258 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * CZ.NIC's Turris Omnia MCU system off and RTC wakeup driver
+ *
+ * This is not a true RTC driver (in the sense that it does not provide a
+ * real-time clock), rather the MCU implements a wakeup from powered off state
+ * at a specified time relative to MCU boot, and we expose this feature via RTC
+ * alarm, so that it can be used via the rtcwake command, which is the standard
+ * Linux command for this.
+ *
+ * 2024 by Marek Behún <kabel@kernel.org>
+ */
+
+#include <linux/crc32.h>
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/reboot.h>
+#include <linux/rtc.h>
+#include <linux/sysfs.h>
+#include <linux/turris-omnia-mcu-interface.h>
+#include <linux/types.h>
+
+#include "turris-omnia-mcu.h"
+
+static int omnia_get_uptime_wakeup(const struct i2c_client *client, u32 *uptime,
+				   u32 *wakeup)
+{
+	__le32 reply[2];
+	int err;
+
+	err = omnia_cmd_read(client, CMD_GET_UPTIME_AND_WAKEUP, reply,
+			     sizeof(reply));
+	if (err)
+		return err;
+
+	if (uptime)
+		*uptime = le32_to_cpu(reply[0]);
+
+	if (wakeup)
+		*wakeup = le32_to_cpu(reply[1]);
+
+	return 0;
+}
+
+static int omnia_read_time(struct device *dev, struct rtc_time *tm)
+{
+	u32 uptime;
+	int err;
+
+	err = omnia_get_uptime_wakeup(to_i2c_client(dev), &uptime, NULL);
+	if (err)
+		return err;
+
+	rtc_time64_to_tm(uptime, tm);
+
+	return 0;
+}
+
+static int omnia_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct omnia_mcu *mcu = i2c_get_clientdata(client);
+	u32 wakeup;
+	int err;
+
+	err = omnia_get_uptime_wakeup(client, NULL, &wakeup);
+	if (err)
+		return err;
+
+	alrm->enabled = !!wakeup;
+	rtc_time64_to_tm(wakeup ?: mcu->rtc_alarm, &alrm->time);
+
+	return 0;
+}
+
+static int omnia_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct omnia_mcu *mcu = i2c_get_clientdata(client);
+
+	mcu->rtc_alarm = rtc_tm_to_time64(&alrm->time);
+
+	if (alrm->enabled)
+		return omnia_cmd_write_u32(client, CMD_SET_WAKEUP,
+					   mcu->rtc_alarm);
+
+	return 0;
+}
+
+static int omnia_alarm_irq_enable(struct device *dev, unsigned int enabled)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct omnia_mcu *mcu = i2c_get_clientdata(client);
+
+	return omnia_cmd_write_u32(client, CMD_SET_WAKEUP,
+				   enabled ? mcu->rtc_alarm : 0);
+}
+
+static const struct rtc_class_ops omnia_rtc_ops = {
+	.read_time		= omnia_read_time,
+	.read_alarm		= omnia_read_alarm,
+	.set_alarm		= omnia_set_alarm,
+	.alarm_irq_enable	= omnia_alarm_irq_enable,
+};
+
+static int omnia_power_off(struct sys_off_data *data)
+{
+	struct omnia_mcu *mcu = data->cb_data;
+	__be32 tmp;
+	u8 cmd[9];
+	u16 arg;
+	int err;
+
+	if (mcu->front_button_poweron)
+		arg = CMD_POWER_OFF_POWERON_BUTTON;
+	else
+		arg = 0;
+
+	cmd[0] = CMD_POWER_OFF;
+	put_unaligned_le16(CMD_POWER_OFF_MAGIC, &cmd[1]);
+	put_unaligned_le16(arg, &cmd[3]);
+
+	/*
+	 * Although all values from and to MCU are passed in little-endian, the
+	 * MCU's CRC unit uses big-endian CRC32 polynomial (0x04c11db7), so we
+	 * need to use crc32_be() here.
+	 */
+	tmp = cpu_to_be32(get_unaligned_le32(&cmd[1]));
+	put_unaligned_le32(crc32_be(0xffffffff, (void *)&tmp, sizeof(tmp)),
+			   &cmd[5]);
+
+	err = omnia_cmd_write(mcu->client, cmd, sizeof(cmd));
+	if (err)
+		dev_err(&mcu->client->dev,
+			"Unable to send the poweroff command: %d\n", err);
+
+	return NOTIFY_DONE;
+}
+
+static int omnia_restart(struct sys_off_data *data)
+{
+	struct omnia_mcu *mcu = data->cb_data;
+	u8 cmd[3];
+	int err;
+
+	cmd[0] = CMD_GENERAL_CONTROL;
+
+	if (reboot_mode == REBOOT_HARD)
+		cmd[1] = cmd[2] = CTL_HARD_RST;
+	else
+		cmd[1] = cmd[2] = CTL_LIGHT_RST;
+
+	err = omnia_cmd_write(mcu->client, cmd, sizeof(cmd));
+	if (err)
+		dev_err(&mcu->client->dev,
+			"Unable to send the restart command: %d\n", err);
+
+	/*
+	 * MCU needs a little bit to process the I2C command, otherwise it will
+	 * do a light reset based on SOC SYSRES_OUT pin.
+	 */
+	mdelay(1);
+
+	return NOTIFY_DONE;
+}
+
+static ssize_t front_button_poweron_show(struct device *dev,
+					 struct device_attribute *a, char *buf)
+{
+	struct omnia_mcu *mcu = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%d\n", mcu->front_button_poweron);
+}
+
+static ssize_t front_button_poweron_store(struct device *dev,
+					  struct device_attribute *a,
+					  const char *buf, size_t count)
+{
+	struct omnia_mcu *mcu = dev_get_drvdata(dev);
+	bool val;
+	int err;
+
+	err = kstrtobool(buf, &val);
+	if (err)
+		return err;
+
+	mcu->front_button_poweron = val;
+
+	return count;
+}
+static DEVICE_ATTR_RW(front_button_poweron);
+
+static struct attribute *omnia_mcu_poweroff_attrs[] = {
+	&dev_attr_front_button_poweron.attr,
+	NULL
+};
+
+static umode_t poweroff_attrs_visible(struct kobject *kobj, struct attribute *a,
+				      int n)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct omnia_mcu *mcu = dev_get_drvdata(dev);
+
+	if (mcu->features & FEAT_POWEROFF_WAKEUP)
+		return a->mode;
+
+	return 0;
+}
+
+const struct attribute_group omnia_mcu_poweroff_group = {
+	.attrs = omnia_mcu_poweroff_attrs,
+	.is_visible = poweroff_attrs_visible,
+};
+
+int omnia_mcu_register_sys_off_and_wakeup(struct omnia_mcu *mcu)
+{
+	struct device *dev = &mcu->client->dev;
+	int err;
+
+	/* MCU restart is always available */
+	err = devm_register_sys_off_handler(dev, SYS_OFF_MODE_RESTART,
+					    SYS_OFF_PRIO_FIRMWARE,
+					    omnia_restart, mcu);
+	if (err)
+		return dev_err_probe(dev, err,
+				     "Cannot register system restart handler\n");
+
+	/*
+	 * Poweroff and wakeup are available only if POWEROFF_WAKEUP feature is
+	 * present.
+	 */
+	if (!(mcu->features & FEAT_POWEROFF_WAKEUP))
+		return 0;
+
+	err = devm_register_sys_off_handler(dev, SYS_OFF_MODE_POWER_OFF,
+					    SYS_OFF_PRIO_FIRMWARE,
+					    omnia_power_off, mcu);
+	if (err)
+		return dev_err_probe(dev, err,
+				     "Cannot register system power off handler\n");
+
+	mcu->rtcdev = devm_rtc_allocate_device(dev);
+	if (IS_ERR(mcu->rtcdev))
+		return dev_err_probe(dev, PTR_ERR(mcu->rtcdev),
+				     "Cannot allocate RTC device\n");
+
+	mcu->rtcdev->ops = &omnia_rtc_ops;
+	mcu->rtcdev->range_max = U32_MAX;
+	set_bit(RTC_FEATURE_ALARM_WAKEUP_ONLY, mcu->rtcdev->features);
+
+	err = devm_rtc_register_device(mcu->rtcdev);
+	if (err)
+		return dev_err_probe(dev, err, "Cannot register RTC device\n");
+
+	mcu->front_button_poweron = true;
+
+	return 0;
+}
diff --git a/drivers/platform/cznic/turris-omnia-mcu.h b/drivers/platform/cznic/turris-omnia-mcu.h
index e8d9bf1c8fdc..6179a4f2069e 100644
--- a/drivers/platform/cznic/turris-omnia-mcu.h
+++ b/drivers/platform/cznic/turris-omnia-mcu.h
@@ -12,9 +12,11 @@
 #include <linux/gpio/driver.h>
 #include <linux/if_ether.h>
 #include <linux/mutex.h>
+#include <linux/rtc.h>
 #include <linux/types.h>
 #include <linux/workqueue.h>
 #include <asm/byteorder.h>
+#include <asm/unaligned.h>
 
 struct omnia_mcu {
 	struct i2c_client *client;
@@ -34,6 +36,11 @@ struct omnia_mcu {
 	struct delayed_work button_release_emul_work;
 	u16 last_status;
 	bool button_pressed_emul;
+
+	/* RTC device for configuring wake-up */
+	struct rtc_device *rtcdev;
+	u32 rtc_alarm;
+	bool front_button_poweron;
 };
 
 int omnia_cmd_write_read(const struct i2c_client *client,
@@ -46,6 +53,17 @@ static inline int omnia_cmd_write(const struct i2c_client *client, void *cmd,
 	return omnia_cmd_write_read(client, cmd, len, NULL, 0);
 }
 
+static inline int omnia_cmd_write_u32(const struct i2c_client *client, u8 cmd,
+				      u32 val)
+{
+	u8 buf[5];
+
+	buf[0] = cmd;
+	put_unaligned_le32(val, &buf[1]);
+
+	return omnia_cmd_write(client, buf, sizeof(buf));
+}
+
 static inline int omnia_cmd_read(const struct i2c_client *client, u8 cmd,
 				 void *reply, unsigned int len)
 {
@@ -107,7 +125,9 @@ static inline int omnia_cmd_read_u8(const struct i2c_client *client, u8 cmd)
 }
 
 extern const struct attribute_group omnia_mcu_gpio_group;
+extern const struct attribute_group omnia_mcu_poweroff_group;
 
 int omnia_mcu_register_gpiochip(struct omnia_mcu *mcu);
+int omnia_mcu_register_sys_off_and_wakeup(struct omnia_mcu *mcu);
 
 #endif /* __TURRIS_OMNIA_MCU_H */
-- 
2.43.2


