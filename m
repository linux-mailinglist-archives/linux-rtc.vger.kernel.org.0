Return-Path: <linux-rtc+bounces-5415-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EAFC6D7AF
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Nov 2025 09:42:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F3F584FA3B1
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Nov 2025 08:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9389232ABC0;
	Wed, 19 Nov 2025 08:33:54 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516E331D732;
	Wed, 19 Nov 2025 08:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763541234; cv=none; b=iFogMp9sRSMpMyUhRzCYhXE3smMxl0hQpVQBJhtfv1y025LLseHh9cIcTBDSJTGLqN92PWE1lvkGPpkkCiW8Klf5cKxXZVk4eAj/bBWXp+fqLanGPNt/wXMlRKHsu4lzajqY17T5bO+wF9VNm2sqRSqC3KkkbK9N/6Wl364L3q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763541234; c=relaxed/simple;
	bh=y9rMqYkLs+zZDzmTao3/Pti+22kJMYH4s0K9aKlEm6w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=px3o6n0bqWnjqAAaFPOG0zJlQmoiXICqCUPYgO7J9+O2zCzmn8L3UvIvl40NZ8dTd0E8/i/c3iMZRc63J6IezNLi2Ru8RWLKWUeZ8pwYoGwibQq7E/FGy6l0AofW8EFWePgMNQhIuF62WdMwRH0Mub6QpArb9Dd3bD4mXryT8bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 1552A1A2BF6;
	Wed, 19 Nov 2025 09:33:44 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D28AC1A2BF9;
	Wed, 19 Nov 2025 09:33:43 +0100 (CET)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 8CAC61800089;
	Wed, 19 Nov 2025 16:33:42 +0800 (+08)
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: alexandre.belloni@bootlin.com,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	linux-watchdog@vger.kernel.org
Cc: vikash.bansal@nxp.com,
	priyanka.jain@nxp.com,
	shashank.rebbapragada@nxp.com,
	Lakshay Piplani <lakshay.piplani@nxp.com>
Subject: [PATCH v3 3/5] rtc: pcf85363: add timestamp support with configurable timestamp mode
Date: Wed, 19 Nov 2025 14:03:34 +0530
Message-Id: <20251119083336.2241142-3-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251119083336.2241142-1-lakshay.piplani@nxp.com>
References: <20251119083336.2241142-1-lakshay.piplani@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

Add support for the timestamp capture registers available on PCF85263 and
PCF85363. The registers latch the current time when selected events occur,
such as TS pin activation or battery switch-over.

The capture source can be configured via the nxp,timestamp-mode device
tree property, and latched values are exported through read-only sysfs
attributes.

Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
---
V2 -> V3:
- Split into separate patches as suggested:
  - Battery switch-over detection.
  - Timestamp recording for TS pin and battery switch-over events.
  - Offset calibration.
  - Watchdog timer (to be reviewed by watchdog maintainers).
- Dropped Alarm2 support
- Switched to rtc_add_group() for sysfs attributes
- Removed failure paths after RTC device registration as per subsystem guidelines.
V1 -> V2:
- Watchdog related changes due to removal of vendor specific properties
  from device tree
  * remove vendor DT knobs (enable/timeout/stepsize/repeat)
  * use watchdog_init_timeout (with 10s default)
  * derive clock_sel from final timeout
  * default, repeat=true (repeat mode)
- Fixed uninitalised warning on 'ret' (reported by kernel test robot)
- Use dev_dbg instead of dev_info for debug related print messages
- Minor cleanup and comments

 drivers/rtc/rtc-pcf85363.c | 210 +++++++++++++++++++++++++++++++------
 1 file changed, 176 insertions(+), 34 deletions(-)

diff --git a/drivers/rtc/rtc-pcf85363.c b/drivers/rtc/rtc-pcf85363.c
index c03d5a65c5f7..a8b4f48d9894 100644
--- a/drivers/rtc/rtc-pcf85363.c
+++ b/drivers/rtc/rtc-pcf85363.c
@@ -101,19 +101,31 @@
 #define PIN_IO_INTA_OUT	2
 #define PIN_IO_INTA_HIZ	3
 
+#define PIN_IO_TSPM     GENMASK(3, 2)
+#define PIN_IO_TSIM     BIT(4)
+
 #define OSC_CAP_SEL	GENMASK(1, 0)
 #define OSC_CAP_6000	0x01
 #define OSC_CAP_12500	0x02
 
 #define STOP_EN_STOP	BIT(0)
+#define RTCM_BIT        BIT(4)
 
 #define RESET_CPR	0xa4
 
 #define NVRAM_SIZE	0x40
 
+#define TSR1_MASK       0x03
+#define TSR2_MASK       0x07
+#define TSR3_MASK       0x03
+#define TSR1_SHIFT      0
+#define TSR2_SHIFT      2
+#define TSR3_SHIFT      6
+
 struct pcf85363 {
 	struct rtc_device	*rtc;
 	struct regmap		*regmap;
+	u8 ts_valid_flags;
 };
 
 struct pcf85x63_config {
@@ -306,8 +318,11 @@ static irqreturn_t pcf85363_rtc_handle_irq(int irq, void *dev_id)
 		return IRQ_NONE;
 
 	if (flags) {
-		dev_dbg(&pcf85363->rtc->dev, "IRQ flags: 0x%02x%s%s\n",
+		dev_dbg(&pcf85363->rtc->dev, "IRQ flags: 0x%02x%s%s%s%s%s\n",
 			flags, (flags & FLAGS_A1F) ? " [A1F]" : "",
+			(flags & FLAGS_TSR1F) ? " [TSR1F]" : "",
+			(flags & FLAGS_TSR2F) ? " [TSR2F]" : "",
+			(flags & FLAGS_TSR3F) ? " [TSR3F]" : "",
 			(flags & FLAGS_BSF) ? " [BSF]" : "");
 	}
 
@@ -317,6 +332,24 @@ static irqreturn_t pcf85363_rtc_handle_irq(int irq, void *dev_id)
 		handled = true;
 	}
 
+	if (flags & FLAGS_TSR1F) {
+		regmap_update_bits(pcf85363->regmap, CTRL_FLAGS, FLAGS_TSR1F, 0);
+		pcf85363->ts_valid_flags |= FLAGS_TSR1F;
+		handled = true;
+	}
+
+	if (flags & FLAGS_TSR2F) {
+		regmap_update_bits(pcf85363->regmap, CTRL_FLAGS, FLAGS_TSR2F, 0);
+		pcf85363->ts_valid_flags |= FLAGS_TSR2F;
+		handled = true;
+	}
+
+	if (flags & FLAGS_TSR3F) {
+		regmap_update_bits(pcf85363->regmap, CTRL_FLAGS, FLAGS_TSR3F, 0);
+		pcf85363->ts_valid_flags |= FLAGS_TSR3F;
+		handled = true;
+	}
+
 	if (flags & FLAGS_BSF) {
 		regmap_update_bits(pcf85363->regmap, CTRL_FLAGS, FLAGS_BSF, 0);
 		handled = true;
@@ -424,11 +457,94 @@ static const struct pcf85x63_config pcf_85363_config = {
 	.num_nvram = 2
 };
 
+/*
+ * Reads 6 bytes of timestamp data starting at the given base register,
+ * converts them from BCD to binary, and formats the result into a
+ * human-readable string in "YYYY-MM-DD HH:MM:SS" format.
+ */
+static int pcf85363_read_timestamp(struct pcf85363 *pcf85363, u8 base_reg, char *buf)
+{
+	struct rtc_time tm;
+	u8 regs[6];
+	int ret;
+
+	ret = regmap_bulk_read(pcf85363->regmap, base_reg, regs, sizeof(regs));
+
+	if (ret)
+		return ret;
+
+	tm.tm_sec = bcd2bin(regs[0]);
+	tm.tm_min = bcd2bin(regs[1]);
+	tm.tm_hour = bcd2bin(regs[2]);
+	tm.tm_mday = bcd2bin(regs[3]);
+	tm.tm_mon = bcd2bin(regs[4]) - 1;
+	tm.tm_year = bcd2bin(regs[5]) + 100;
+
+	return sysfs_emit(buf, "%04d-%02d-%02d %02d:%02d:%02d\n",
+			  tm.tm_year + 1900, tm.tm_mon + 1, tm.tm_mday,
+			  tm.tm_hour, tm.tm_min, tm.tm_sec);
+}
+
+/*
+ * Checks whether a specific timestamp flag is set. If so, reads and
+ * returns the formatted timestamp. Otherwise, returns "00-00-00 00:00:00".
+ */
+
+static ssize_t pcf85363_timestamp_show(struct device *dev, char *buf,
+				       u8 timestamp_flag, u8 base_reg)
+{
+	struct pcf85363 *pcf85363 = dev_get_drvdata(dev);
+
+	if (!(pcf85363->ts_valid_flags & timestamp_flag))
+		return sysfs_emit(buf, "00-00-00 00:00:00\n");
+
+	return pcf85363_read_timestamp(pcf85363, base_reg, buf);
+}
+
+static ssize_t timestamp1_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	return pcf85363_timestamp_show(dev, buf, FLAGS_TSR1F, DT_TIMESTAMP1);
+}
+static DEVICE_ATTR_RO(timestamp1);
+
+static ssize_t timestamp2_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	return pcf85363_timestamp_show(dev, buf, FLAGS_TSR2F, DT_TIMESTAMP2);
+}
+static DEVICE_ATTR_RO(timestamp2);
+
+static ssize_t timestamp3_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	return pcf85363_timestamp_show(dev, buf, FLAGS_TSR3F, DT_TIMESTAMP3);
+}
+static DEVICE_ATTR_RO(timestamp3);
+
+static struct attribute *pcf85363_attrs[] = {
+	&dev_attr_timestamp1.attr,
+	&dev_attr_timestamp2.attr,
+	&dev_attr_timestamp3.attr,
+	NULL,
+};
+
+static const struct attribute_group pcf85363_attr_group = {
+	.attrs = pcf85363_attrs,
+};
+
 static int pcf85363_probe(struct i2c_client *client)
 {
-	struct pcf85363 *pcf85363;
 	const struct pcf85x63_config *config = &pcf_85363_config;
 	const void *data = of_device_get_match_data(&client->dev);
+	struct device *dev = &client->dev;
+	struct pcf85363 *pcf85363;
+	int irq_a = client->irq;
+	bool wakeup_source;
+	int ret, i, err;
+	u32 tsr_mode[3];
+	u8 val;
+
 	static struct nvmem_config nvmem_cfg[] = {
 		{
 			.name = "pcf85x63-",
@@ -446,25 +562,43 @@ static int pcf85363_probe(struct i2c_client *client)
 			.reg_write = pcf85363_nvram_write,
 		},
 	};
-	int ret, i, err;
-	bool wakeup_source;
 
 	if (data)
 		config = data;
 
-	pcf85363 = devm_kzalloc(&client->dev, sizeof(struct pcf85363),
-				GFP_KERNEL);
+	pcf85363 = devm_kzalloc(&client->dev, sizeof(*pcf85363), GFP_KERNEL);
 	if (!pcf85363)
 		return -ENOMEM;
 
+	pcf85363->ts_valid_flags = 0;
+
 	pcf85363->regmap = devm_regmap_init_i2c(client, &config->regmap);
-	if (IS_ERR(pcf85363->regmap)) {
-		dev_err(&client->dev, "regmap allocation failed\n");
-		return PTR_ERR(pcf85363->regmap);
-	}
+	if (IS_ERR(pcf85363->regmap))
+		return dev_err_probe(dev, PTR_ERR(pcf85363->regmap), "regmap init failed\n");
 
 	i2c_set_clientdata(client, pcf85363);
 
+	ret = regmap_update_bits(pcf85363->regmap, CTRL_FUNCTION, RTCM_BIT, 0);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable RTC mode\n");
+
+	if (!device_property_read_u32_array(dev, "nxp,timestamp-mode", tsr_mode, 3)) {
+		tsr_mode[0] &= TSR1_MASK;
+		tsr_mode[1] &= TSR2_MASK;
+		tsr_mode[2] &= TSR3_MASK;
+
+		val = (tsr_mode[2] << TSR3_SHIFT) |
+		      (tsr_mode[1] << TSR2_SHIFT) |
+		      (tsr_mode[0] << TSR1_SHIFT);
+
+		ret = regmap_write(pcf85363->regmap, DT_TS_MODE, val);
+		if (ret)
+			dev_warn(dev, "Failed to write timestamp mode register\n");
+
+		dev_dbg(dev, "Timestamp mode set: TSR1=0x%x TSR2=0x%x TSR3=0x%x\n",
+			tsr_mode[0], tsr_mode[1], tsr_mode[2]);
+	}
+
 	pcf85363->rtc = devm_rtc_allocate_device(&client->dev);
 	if (IS_ERR(pcf85363->rtc))
 		return PTR_ERR(pcf85363->rtc);
@@ -478,39 +612,47 @@ static int pcf85363_probe(struct i2c_client *client)
 	pcf85363->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
 	pcf85363->rtc->range_max = RTC_TIMESTAMP_END_2099;
 
-	wakeup_source = device_property_read_bool(&client->dev,
-						  "wakeup-source");
-	if (client->irq > 0 || wakeup_source) {
-		regmap_write(pcf85363->regmap, CTRL_FLAGS, 0);
-		regmap_update_bits(pcf85363->regmap, CTRL_PIN_IO,
-				   PIN_IO_INTAPM, PIN_IO_INTA_OUT);
-	}
+	wakeup_source = device_property_read_bool(dev, "wakeup-source");
+
+	ret = regmap_write(pcf85363->regmap, CTRL_FLAGS, 0x00);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to clear CTRL_FLAGS\n");
 
-	if (client->irq > 0) {
-		unsigned long irqflags = IRQF_TRIGGER_LOW;
+	if (irq_a > 0) {
+		regmap_update_bits(pcf85363->regmap, CTRL_PIN_IO, PIN_IO_INTAPM, PIN_IO_INTA_OUT);
+		ret = devm_request_threaded_irq(dev, irq_a, NULL,
+						pcf85363_rtc_handle_irq,
+						IRQF_TRIGGER_LOW | IRQF_ONESHOT,
+						"pcf85363-inta", client);
 
-		if (dev_fwnode(&client->dev))
-			irqflags = 0;
-		ret = devm_request_threaded_irq(&client->dev, client->irq,
-						NULL, pcf85363_rtc_handle_irq,
-						irqflags | IRQF_ONESHOT,
-						"pcf85363", client);
 		if (ret) {
-			dev_warn(&client->dev,
-				 "unable to request IRQ, alarms disabled\n");
-			client->irq = 0;
+			dev_err_probe(dev, ret, "INTA IRQ request failed\n");
+			irq_a = 0;
+		} else {
+			regmap_write(pcf85363->regmap, CTRL_INTA_EN, INT_BSIE
+				     | INT_TSRIE);
 		}
 	}
 
-	if (client->irq > 0 || wakeup_source) {
-		device_init_wakeup(&client->dev, true);
-		set_bit(RTC_FEATURE_ALARM, pcf85363->rtc->features);
-	} else {
-		clear_bit(RTC_FEATURE_ALARM, pcf85363->rtc->features);
-	}
+	regmap_update_bits(pcf85363->regmap, CTRL_PIN_IO,
+			   PIN_IO_TSPM | PIN_IO_TSIM,
+			   PIN_IO_TSPM | PIN_IO_TSIM);
+
+	if (irq_a > 0 || wakeup_source)
+		device_init_wakeup(dev, true);
+
+	dev_set_drvdata(&pcf85363->rtc->dev, pcf85363);
 
 	ret = devm_rtc_register_device(pcf85363->rtc);
 
+	if (ret)
+		return dev_err_probe(dev, ret, "RTC registration failed\n");
+
+	ret = sysfs_create_group(&pcf85363->rtc->dev.kobj, &pcf85363_attr_group);
+
+	if (ret)
+		return dev_err_probe(dev, ret, "Timestamp sysfs creation failed\n");
+
 	for (i = 0; i < config->num_nvram; i++) {
 		nvmem_cfg[i].priv = pcf85363;
 		devm_rtc_nvmem_register(pcf85363->rtc, &nvmem_cfg[i]);
-- 
2.25.1


