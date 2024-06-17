Return-Path: <linux-rtc+bounces-1345-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F7490B52B
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Jun 2024 17:50:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23BA91F21130
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Jun 2024 15:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F10A91D9532;
	Mon, 17 Jun 2024 15:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lrn4cxgv"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC6F1D952D
	for <linux-rtc@vger.kernel.org>; Mon, 17 Jun 2024 15:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718637989; cv=none; b=ZvgW2S+bJY/g/SAO42+10UJONhSZ5+ArjpDK1te0L0bA3bGn2GK0Rp/rcBIFqklMaGqTGSsDFzsq07H5PNTaAOS+8KFZmWLzlxm7rHi5P+K5xAVM549JDI407Kh3OSEEJIdiUT9kKra0JwL2/0FWHt22sotbMCbI2U7cHqZbcAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718637989; c=relaxed/simple;
	bh=GDefUOLKa6HZ+jn19hPuXZP0AbTmSP1rTIsRqlXAh7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O069TWjVE6XN7BZu6/1bt57ZcbLk1c+AX+wheKAPDqcHhvCBe32kbjB7Hjs05DUvj3rrW0lL2IBaSGqXqy5DME7AunL+Xh6gFCAhcCqBjAaiPuwxGweaF5iSojdEih3D75Gb6Wo1k2DeO7VO+7EoQZ0dJiLyPR5mX9c+CxvCPP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lrn4cxgv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB574C4AF4D;
	Mon, 17 Jun 2024 15:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718637989;
	bh=GDefUOLKa6HZ+jn19hPuXZP0AbTmSP1rTIsRqlXAh7w=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lrn4cxgvuiMrHASSMj5JXxvU0XKvy6fukQQXM4C7JwNoeLIR7i5uPADdGB1MdPvHt
	 OqwV6pa9eocEpZP7EGrmZN/NEPhcb6wdMjRsBR5Jg/dF1FjPi4aYZfKeqrxpxqJbZ7
	 WVox3NFFxJf04H6DNeEQWNhTtYeNekOxPM4A2c4ThTYVPic6ZmMd8kWLHYtxhIogLM
	 5ZS4SpOLHsPBKU3oy2p3PR8LUyN5VNJuxnTqLfyVB2tKb7JerqvkHv5kgT80eIiMNa
	 HMruOnSDAgyiI/AuCcI+UdUrgjRtMJSdkCUvCF2+zfu5WFtRxtWOPOfqSiMrCGlAet
	 rtr71QhOFqWVQ==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-rtc@vger.kernel.org
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v12 4/8] platform: cznic: turris-omnia-mcu: Add support for poweroff and wakeup
Date: Mon, 17 Jun 2024 17:26:02 +0200
Message-ID: <20240617152606.26191-5-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240617152606.26191-1-kabel@kernel.org>
References: <20240617152606.26191-1-kabel@kernel.org>
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
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
---
 .../sysfs-bus-i2c-devices-turris-omnia-mcu    |  16 ++
 drivers/platform/cznic/Kconfig                |   4 +
 drivers/platform/cznic/Makefile               |   1 +
 .../platform/cznic/turris-omnia-mcu-base.c    |   5 +
 .../cznic/turris-omnia-mcu-sys-off-wakeup.c   | 260 ++++++++++++++++++
 drivers/platform/cznic/turris-omnia-mcu.h     |  20 ++
 6 files changed, 306 insertions(+)
 create mode 100644 drivers/platform/cznic/turris-omnia-mcu-sys-off-wakeup.c

diff --git a/Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu b/Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu
index 86360249080c..307a55f599cb 100644
--- a/Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu
+++ b/Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu
@@ -38,6 +38,22 @@ Description:	(RW) The front button on the Turris Omnia router can be
 
 		Format: %s.
 
+What:		/sys/bus/i2c/devices/<mcu_device>/front_button_poweron
+Date:		September 2024
+KernelVersion:	6.11
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
 Date:		September 2024
 KernelVersion:	6.11
diff --git a/drivers/platform/cznic/Kconfig b/drivers/platform/cznic/Kconfig
index d95e7c83c7ae..c1e719235517 100644
--- a/drivers/platform/cznic/Kconfig
+++ b/drivers/platform/cznic/Kconfig
@@ -18,10 +18,14 @@ config TURRIS_OMNIA_MCU
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
index 4481484b2f94..338a7ab12bd0 100644
--- a/drivers/platform/cznic/turris-omnia-mcu-base.c
+++ b/drivers/platform/cznic/turris-omnia-mcu-base.c
@@ -198,6 +198,7 @@ static const struct attribute_group omnia_mcu_base_group = {
 static const struct attribute_group *omnia_mcu_groups[] = {
 	&omnia_mcu_base_group,
 	&omnia_mcu_gpio_group,
+	&omnia_mcu_poweroff_group,
 	NULL
 };
 
@@ -372,6 +373,10 @@ static int omnia_mcu_probe(struct i2c_client *client)
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
index 000000000000..0e8ab15b6037
--- /dev/null
+++ b/drivers/platform/cznic/turris-omnia-mcu-sys-off-wakeup.c
@@ -0,0 +1,260 @@
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
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/kstrtox.h>
+#include <linux/reboot.h>
+#include <linux/rtc.h>
+#include <linux/sysfs.h>
+#include <linux/types.h>
+
+#include <linux/turris-omnia-mcu-interface.h>
+#include "turris-omnia-mcu.h"
+
+static int omnia_get_uptime_wakeup(const struct i2c_client *client, u32 *uptime,
+				   u32 *wakeup)
+{
+	__le32 reply[2];
+	int err;
+
+	err = omnia_cmd_read(client, OMNIA_CMD_GET_UPTIME_AND_WAKEUP, reply,
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
+		return omnia_cmd_write_u32(client, OMNIA_CMD_SET_WAKEUP,
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
+	return omnia_cmd_write_u32(client, OMNIA_CMD_SET_WAKEUP,
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
+		arg = OMNIA_CMD_POWER_OFF_POWERON_BUTTON;
+	else
+		arg = 0;
+
+	cmd[0] = OMNIA_CMD_POWER_OFF;
+	put_unaligned_le16(OMNIA_CMD_POWER_OFF_MAGIC, &cmd[1]);
+	put_unaligned_le16(arg, &cmd[3]);
+
+	/*
+	 * Although all values from and to MCU are passed in little-endian, the
+	 * MCU's CRC unit uses big-endian CRC32 polynomial (0x04c11db7), so we
+	 * need to use crc32_be() here.
+	 */
+	tmp = cpu_to_be32(get_unaligned_le32(&cmd[1]));
+	put_unaligned_le32(crc32_be(~0, (void *)&tmp, sizeof(tmp)), &cmd[5]);
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
+	cmd[0] = OMNIA_CMD_GENERAL_CONTROL;
+
+	if (reboot_mode == REBOOT_HARD)
+		cmd[1] = cmd[2] = OMNIA_CTL_HARD_RST;
+	else
+		cmd[1] = cmd[2] = OMNIA_CTL_LIGHT_RST;
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
+	if (mcu->features & OMNIA_FEAT_POWEROFF_WAKEUP)
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
+	if (!(mcu->features & OMNIA_FEAT_POWEROFF_WAKEUP))
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
index 3d2dd0054499..2a1c68ba9b7f 100644
--- a/drivers/platform/cznic/turris-omnia-mcu.h
+++ b/drivers/platform/cznic/turris-omnia-mcu.h
@@ -15,8 +15,10 @@
 #include <linux/types.h>
 #include <linux/workqueue.h>
 #include <asm/byteorder.h>
+#include <asm/unaligned.h>
 
 struct i2c_client;
+struct rtc_device;
 
 struct omnia_mcu {
 	struct i2c_client *client;
@@ -36,6 +38,11 @@ struct omnia_mcu {
 	struct delayed_work button_release_emul_work;
 	unsigned long last_status;
 	bool button_pressed_emul;
+
+	/* RTC device for configuring wake-up */
+	struct rtc_device *rtcdev;
+	u32 rtc_alarm;
+	bool front_button_poweron;
 };
 
 int omnia_cmd_write_read(const struct i2c_client *client,
@@ -48,6 +55,17 @@ static inline int omnia_cmd_write(const struct i2c_client *client, void *cmd,
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
@@ -136,7 +154,9 @@ static inline int omnia_cmd_read_u8(const struct i2c_client *client, u8 cmd,
 }
 
 extern const struct attribute_group omnia_mcu_gpio_group;
+extern const struct attribute_group omnia_mcu_poweroff_group;
 
 int omnia_mcu_register_gpiochip(struct omnia_mcu *mcu);
+int omnia_mcu_register_sys_off_and_wakeup(struct omnia_mcu *mcu);
 
 #endif /* __TURRIS_OMNIA_MCU_H */
-- 
2.44.2


