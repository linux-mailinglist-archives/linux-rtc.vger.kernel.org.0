Return-Path: <linux-rtc+bounces-838-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 486C188797B
	for <lists+linux-rtc@lfdr.de>; Sat, 23 Mar 2024 17:44:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75CD01C20BBC
	for <lists+linux-rtc@lfdr.de>; Sat, 23 Mar 2024 16:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D934047A58;
	Sat, 23 Mar 2024 16:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="klVa+bUG"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C2C45029
	for <linux-rtc@vger.kernel.org>; Sat, 23 Mar 2024 16:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711212256; cv=none; b=VHWmrqDljlWl4t6Q6vsvYGUA63lfpzuCxNr5dQDf+WO99QllqR8lq1l2snCUu5he6+q93siDiSgmc7a7lz6rTyZUZGqeG1UPKOG7XFbG+5T0B0PeN0lTnBLE7pCax9MxEAswZCAbWd+SwywjlPObfAhl9Rl03JNEaTYwl7H9dn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711212256; c=relaxed/simple;
	bh=Cy3x0gjUNe7GeXcPeJ8OQAdSSUun6L0Wph3z3uFX4CQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HP1nwTT9qqPvG/vkoy/Qj87pS5k+X2xOokfvhWL5XnwBxTe9IEbqaT2pR7FSSEwfgCIlsWvEqKMY4mSRxr/sIYcA3H9cmURiI6UZjN21Gb5k6idogyLKz3GIrB8x3qIsMbDiDxIvqKjJBl999JN/nbW8oFlYHUGsIWLLWkBAORA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=klVa+bUG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3552FC433A6;
	Sat, 23 Mar 2024 16:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711212256;
	bh=Cy3x0gjUNe7GeXcPeJ8OQAdSSUun6L0Wph3z3uFX4CQ=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=klVa+bUGnV00RS5qqvkheN96Zry1WrDGD8cZuMRBBFi9JwH1kblXcZqHwr+GIEpa3
	 UgmVXN6WNYZbJxeezCddT78/SO5v/YjaKayuCGdLqxXAQv2WR6d53PeLkJ+Q2V3T80
	 hQEmZqnSDr7FHdlgbZJEy66XRXMmSDfQW8JSuVA3xD55JJ1C00QZuBgzZVMSqv2Fqd
	 IJtJmFpb5tGcr62vej5fjEE93iXt4SeHG+tQnjDaTBo+Q+z9WSuWmPEOs4cr9DfH9S
	 ZFA+AjxTM2ZrXZCpf4eb0fBW5G3UCifwGayi00GDjf0it8CyPNfqCZ3xz+4EYBu7YL
	 wUjgk7Ttnph4A==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	soc@kernel.org,
	arm@kernel.org,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Andy Shevchenko <andy@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-rtc@vger.kernel.org
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v5 04/11] platform: cznic: turris-omnia-mcu: Add support for poweroff and wakeup
Date: Sat, 23 Mar 2024 17:43:52 +0100
Message-ID: <20240323164359.21642-5-kabel@kernel.org>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240323164359.21642-1-kabel@kernel.org>
References: <20240323164359.21642-1-kabel@kernel.org>
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
Changes since v4:
- the driver now registers the RTC with feature bit
  RTC_FEATURE_ALARM_WAKEUP_ONLY, as requested by Alexandre Belloni
  (see commit e99653afeb95 for explanation)
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
index a6177f5b4fff..6f1470d1f673 100644
--- a/drivers/platform/cznic/Makefile
+++ b/drivers/platform/cznic/Makefile
@@ -3,3 +3,4 @@
 obj-$(CONFIG_TURRIS_OMNIA_MCU)	+= turris-omnia-mcu.o
 turris-omnia-mcu-objs		:= turris-omnia-mcu-base.o
 turris-omnia-mcu-objs		+= turris-omnia-mcu-gpio.o
+turris-omnia-mcu-objs		+= turris-omnia-mcu-sys-off-wakeup.o
diff --git a/drivers/platform/cznic/turris-omnia-mcu-base.c b/drivers/platform/cznic/turris-omnia-mcu-base.c
index 4edaf7a53242..6ab4494335ca 100644
--- a/drivers/platform/cznic/turris-omnia-mcu-base.c
+++ b/drivers/platform/cznic/turris-omnia-mcu-base.c
@@ -161,6 +161,7 @@ static const struct attribute_group omnia_mcu_base_group = {
 static const struct attribute_group *omnia_mcu_groups[] = {
 	&omnia_mcu_base_group,
 	&omnia_mcu_gpio_group,
+	&omnia_mcu_poweroff_group,
 	NULL
 };
 
@@ -326,6 +327,10 @@ static int omnia_mcu_probe(struct i2c_client *client)
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
index 000000000000..80144f288451
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
+	struct omnia_mcu *mcu = i2c_get_clientdata(to_i2c_client(dev));
+
+	return sysfs_emit(buf, "%d\n", mcu->front_button_poweron);
+}
+
+static ssize_t front_button_poweron_store(struct device *dev,
+					  struct device_attribute *a,
+					  const char *buf, size_t count)
+{
+	struct omnia_mcu *mcu = i2c_get_clientdata(to_i2c_client(dev));
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
+	struct omnia_mcu *mcu = i2c_get_clientdata(to_i2c_client(dev));
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
index 143c63001e8f..af9845d1c6d2 100644
--- a/drivers/platform/cznic/turris-omnia-mcu.h
+++ b/drivers/platform/cznic/turris-omnia-mcu.h
@@ -13,9 +13,11 @@
 #include <linux/i2c.h>
 #include <linux/if_ether.h>
 #include <linux/mutex.h>
+#include <linux/rtc.h>
 #include <linux/types.h>
 #include <linux/workqueue.h>
 #include <asm/byteorder.h>
+#include <asm/unaligned.h>
 
 struct omnia_mcu {
 	struct i2c_client *client;
@@ -35,6 +37,11 @@ struct omnia_mcu {
 	struct delayed_work button_release_emul_work;
 	u16 last_status;
 	bool button_pressed_emul;
+
+	/* RTC device for configuring wake-up */
+	struct rtc_device *rtcdev;
+	u32 rtc_alarm;
+	bool front_button_poweron;
 };
 
 static inline int omnia_cmd_write(const struct i2c_client *client, void *cmd,
@@ -47,6 +54,17 @@ static inline int omnia_cmd_write(const struct i2c_client *client, void *cmd,
 	return ret < 0 ? ret : 0;
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
@@ -126,7 +144,9 @@ static inline int omnia_cmd_read_u8(const struct i2c_client *client, u8 cmd)
 }
 
 extern const struct attribute_group omnia_mcu_gpio_group;
+extern const struct attribute_group omnia_mcu_poweroff_group;
 
 int omnia_mcu_register_gpiochip(struct omnia_mcu *mcu);
+int omnia_mcu_register_sys_off_and_wakeup(struct omnia_mcu *mcu);
 
 #endif /* __TURRIS_OMNIA_MCU_H */
-- 
2.43.2


