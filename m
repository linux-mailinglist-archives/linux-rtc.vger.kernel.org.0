Return-Path: <linux-rtc+bounces-1920-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 747769733F6
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Sep 2024 12:36:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C326B29B72
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Sep 2024 10:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F7801A00C5;
	Tue, 10 Sep 2024 10:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="KpL+b2K9"
X-Original-To: linux-rtc@vger.kernel.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CE518FDB1;
	Tue, 10 Sep 2024 10:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.30.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725964047; cv=none; b=l+M/cu92c+Uq8Io4SFHXcMTo/2WIsqsmiWvsJzKuuunVvWUH8yLSRhdy5iFGSkgSoHKTYU3rE6naQi4u/KoN5aqNG0xpii4rYQ3wH7LNRG8X8T1xopni1Kjqyp2WBQxMKMySik7Ek4ect9GdKwvhE4BPvhWGn15Kq59t+lw/Vqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725964047; c=relaxed/simple;
	bh=/VCo3XRpUVs+ODdkjbFXah0zX1uRcsm6ZU80nw+Wnkg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I0tTKzGsvJi2US4bWi17oVdvocp6SmIztoP/9mH+kwdbuDW2FPC4Hkhu7OgzB67YTKeaEyit8m1QOIG5VaBnfG2YZhaz0EZJiS6cddqjr/nQvYpuQJYHBTqc4Hfbm16c3Or8+COqw2PnYeKT1H5P4meChEP981Pg0hq9MNJHsnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=KpL+b2K9; arc=none smtp.client-ip=188.40.30.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=yt9WoZ0adE82ZlbhbGGDqQ9EFvIA4tp5imjpHwFF5ms=; b=KpL+b2K93gmmywGJkOg6r9b9BK
	qoTIN4ETEXzXFSeSkmqAGCsTWL5QVhkoReSTvMAcXdG6kr4Q9laOtIxN1jd+G4OOBi59//6LC7WJ+
	gQ7+VJZawlnsfBBUX5YttlHel1aaPXXqL2oNTXE8kYweSMQGg6/nGQ3zqvA4jtlhvVWhEJ4U/Jqow
	l/DtaYZqAvMHDXozfuSC7ubF2EC1g/iAhQiFWBIzrXUirS1HF99pSAwedQdFMKLcuIdzIpupl5HMr
	7dhkzcK9cI1y1y2+d85tuYNcwwkBzhv5F5COgFC4qOZvOgm7JgG5+Bsft+Uv7wZoys54kUu1bf0Xe
	9ii+DbJQ==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sny5h-000GsJ-I2; Tue, 10 Sep 2024 12:27:21 +0200
Received: from [80.62.117.18] (helo=localhost)
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sny5h-000Ml6-2c;
	Tue, 10 Sep 2024 12:27:21 +0200
From: Esben Haabendal <esben@geanix.com>
Date: Tue, 10 Sep 2024 12:27:11 +0200
Subject: [PATCH 2/2] rtc: isl12022: Add alarm support
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240910-rtc-isl12022-alarm-irq-v1-2-d875cedc997f@geanix.com>
References: <20240910-rtc-isl12022-alarm-irq-v1-0-d875cedc997f@geanix.com>
In-Reply-To: <20240910-rtc-isl12022-alarm-irq-v1-0-d875cedc997f@geanix.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725964039; l=10043;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=/VCo3XRpUVs+ODdkjbFXah0zX1uRcsm6ZU80nw+Wnkg=;
 b=iOGDNc8FZHtSZxRt6z7QypzBk2Kc7GZ+wx/kMBEjUPUOyevm45ZHP+SWAsC8SYKXvuB/H89Zd
 vfJuV8sNOoZDW7hyNd8eAz5h2hj9Hag+ayw6UyehK/+Z7zW5IBfKqv+
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27394/Tue Sep 10 10:30:36 2024)

The ISL12022 RTC has a combined INT/fOUT pin, which can be used for alarm
interrupt when frequency output is not enabled.

The device-tree bindings should ensure that interrupt and clock output is
not enabled at the same time.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/rtc/rtc-isl12022.c | 244 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 241 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-isl12022.c b/drivers/rtc/rtc-isl12022.c
index d82278fdc29b..682b1bf10160 100644
--- a/drivers/rtc/rtc-isl12022.c
+++ b/drivers/rtc/rtc-isl12022.c
@@ -21,7 +21,7 @@
 
 #include <asm/byteorder.h>
 
-/* ISL register offsets */
+/* RTC - Real time clock registers */
 #define ISL12022_REG_SC		0x00
 #define ISL12022_REG_MN		0x01
 #define ISL12022_REG_HR		0x02
@@ -30,21 +30,36 @@
 #define ISL12022_REG_YR		0x05
 #define ISL12022_REG_DW		0x06
 
+/* CSR - Control and status registers */
 #define ISL12022_REG_SR		0x07
 #define ISL12022_REG_INT	0x08
-
 #define ISL12022_REG_PWR_VBAT	0x0a
-
 #define ISL12022_REG_BETA	0x0d
+
+/* ALARM - Alarm registers */
+#define ISL12022_REG_SCA0	0x10
+#define ISL12022_REG_MNA0	0x11
+#define ISL12022_REG_HRA0	0x12
+#define ISL12022_REG_DTA0	0x13
+#define ISL12022_REG_MOA0	0x14
+#define ISL12022_REG_DWA0	0x15
+#define ISL12022_ALARM_SECTION		ISL12022_REG_SCA0
+#define ISL12022_ALARM_SECTION_LEN	(ISL12022_REG_DWA0 - ISL12022_REG_SCA0 + 1)
+
+/* TEMP - Temperature sensor registers */
 #define ISL12022_REG_TEMP_L	0x28
 
 /* ISL register bits */
 #define ISL12022_HR_MIL		(1 << 7)	/* military or 24 hour time */
 
+#define ISL12022_SR_ALM		(1 << 4)
 #define ISL12022_SR_LBAT85	(1 << 2)
 #define ISL12022_SR_LBAT75	(1 << 1)
 
+#define ISL12022_INT_ARST	(1 << 7)
 #define ISL12022_INT_WRTC	(1 << 6)
+#define ISL12022_INT_IM		(1 << 5)
+#define ISL12022_INT_FOBATB	(1 << 4)
 #define ISL12022_INT_FO_MASK	GENMASK(3, 0)
 #define ISL12022_INT_FO_OFF	0x0
 #define ISL12022_INT_FO_32K	0x1
@@ -52,10 +67,18 @@
 #define ISL12022_REG_VB85_MASK	GENMASK(5, 3)
 #define ISL12022_REG_VB75_MASK	GENMASK(2, 0)
 
+#define ISL12022_ALARM_ENABLE	(1 << 7)	/* for all ALARM registers  */
+
 #define ISL12022_BETA_TSE	(1 << 7)
 
+static struct i2c_driver isl12022_driver;
+
 struct isl12022 {
+	struct i2c_client *i2c;
+	struct rtc_device *rtc;
 	struct regmap *regmap;
+	int irq;
+	bool irq_enabled;
 };
 
 static umode_t isl12022_hwmon_is_visible(const void *data,
@@ -215,6 +238,208 @@ static int isl12022_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	return regmap_bulk_write(regmap, ISL12022_REG_SC, buf, sizeof(buf));
 }
 
+static int isl12022_rtc_read_alarm(struct device *dev,
+				   struct rtc_wkalrm *alarm)
+{
+	struct rtc_time *const tm = &alarm->time;
+	struct isl12022 *isl12022 = dev_get_drvdata(dev);
+	struct regmap *regmap = isl12022->regmap;
+	uint8_t buf[ISL12022_ALARM_SECTION_LEN];
+	int ret, yr, i;
+
+	ret = regmap_bulk_read(regmap, ISL12022_ALARM_SECTION,
+			       buf, sizeof(buf));
+	if (ret) {
+		dev_err(dev, "%s: reading ALARM registers failed\n",
+			__func__);
+		return ret;
+	}
+
+	dev_dbg(dev,
+		"%s: sc=%02x, mn=%02x, hr=%02x, dt=%02x, mo=%02x, dw=%02x\n",
+		__func__, buf[0], buf[1], buf[2], buf[3], buf[4], buf[5]);
+
+	tm->tm_sec = bcd2bin(buf[ISL12022_REG_SCA0 - ISL12022_ALARM_SECTION]
+			     & 0x7F);
+	tm->tm_min = bcd2bin(buf[ISL12022_REG_MNA0 - ISL12022_ALARM_SECTION]
+			     & 0x7F);
+	tm->tm_hour = bcd2bin(buf[ISL12022_REG_HRA0 - ISL12022_ALARM_SECTION]
+			      & 0x3F);
+	tm->tm_mday = bcd2bin(buf[ISL12022_REG_DTA0 - ISL12022_ALARM_SECTION]
+			      & 0x3F);
+	tm->tm_mon = bcd2bin(buf[ISL12022_REG_MOA0 - ISL12022_ALARM_SECTION]
+			     & 0x1F) - 1;
+	tm->tm_wday = buf[ISL12022_REG_DWA0 - ISL12022_ALARM_SECTION] & 0x07;
+
+	/* The alarm doesn't store the year so get it from the rtc section */
+	ret = regmap_read(regmap, ISL12022_REG_YR, &yr);
+	if (ret) {
+		dev_err(dev, "%s: reading YR register failed\n", __func__);
+		return yr;
+	}
+	tm->tm_year = bcd2bin(yr) + 100;
+
+	for (i = 0 ; i < ISL12022_ALARM_SECTION_LEN ; i++) {
+		if (buf[i] & ISL12022_ALARM_ENABLE) {
+			alarm->enabled = 1;
+			break;
+		}
+	}
+
+	dev_dbg(dev, "%s: %ptR\n", __func__, tm);
+
+	return 0;
+}
+
+static int isl12022_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
+{
+	struct rtc_time *alarm_tm = &alarm->time;
+	struct isl12022 *isl12022 = dev_get_drvdata(dev);
+	struct regmap *regmap = isl12022->regmap;
+	u8 regs[ISL12022_ALARM_SECTION_LEN] = { 0, };
+	struct rtc_time rtc_tm;
+	int ret = 0, enable, dw;
+
+	ret = isl12022_rtc_read_time(dev, &rtc_tm);
+	if (ret)
+		return ret;
+
+	/* If the alarm time is before the current time disable the alarm */
+	if (!alarm->enabled || rtc_tm_sub(alarm_tm, &rtc_tm) <= 0)
+		enable = 0;
+	else
+		enable = ISL12022_ALARM_ENABLE;
+
+	/* Set non-matching tm_wday to safeguard against early false matching
+	 * while setting all the alarm registers (this rtc lacks a general
+	 * alarm/irq enable/disable bit).
+	 */
+	if (enable) {
+		ret = regmap_read(regmap, ISL12022_REG_DW, &dw);
+		if (ret) {
+			dev_err(dev, "%s: reading DW failed\n", __func__);
+			return ret;
+		}
+		/* ~4 days into the future should be enough to avoid match */
+		dw = ((dw + 4) % 7) | ISL12022_ALARM_ENABLE;
+		ret = regmap_write(regmap, ISL12022_REG_DWA0, dw);
+		if (ret) {
+			dev_err(dev, "%s: writing DWA0 failed\n", __func__);
+			return ret;
+		}
+	}
+
+	/* Program the alarm and enable it for each setting */
+	regs[ISL12022_REG_SCA0 - ISL12022_ALARM_SECTION] =
+		bin2bcd(alarm_tm->tm_sec) | enable;
+	regs[ISL12022_REG_MNA0 - ISL12022_ALARM_SECTION] =
+		bin2bcd(alarm_tm->tm_min) | enable;
+	regs[ISL12022_REG_HRA0 - ISL12022_ALARM_SECTION] =
+		bin2bcd(alarm_tm->tm_hour) | enable;
+	regs[ISL12022_REG_DTA0 - ISL12022_ALARM_SECTION] =
+		bin2bcd(alarm_tm->tm_mday) | enable;
+	regs[ISL12022_REG_MOA0 - ISL12022_ALARM_SECTION] =
+		bin2bcd(alarm_tm->tm_mon + 1) | enable;
+	regs[ISL12022_REG_DWA0 - ISL12022_ALARM_SECTION] =
+		bin2bcd(alarm_tm->tm_wday & 7) | enable;
+
+	/* write ALARM registers */
+	ret = regmap_bulk_write(regmap, ISL12022_REG_SCA0,
+				&regs, sizeof(regs));
+	if (ret) {
+		dev_err(dev, "%s: writing ALARM registers failed\n", __func__);
+		return ret;
+	}
+
+	return 0;
+}
+
+static irqreturn_t isl12022_rtc_interrupt(int irq, void *data)
+{
+	struct isl12022 *isl12022 = data;
+	struct rtc_device *rtc = isl12022->rtc;
+	struct device *dev = &rtc->dev;
+	struct regmap *regmap = isl12022->regmap;
+	u32 val = 0;
+	unsigned long events = 0;
+	int ret;
+
+	ret = regmap_read(regmap, ISL12022_REG_SR, &val);
+	if (ret) {
+		dev_err(dev, "%s: reading SR failed\n", __func__);
+		return IRQ_HANDLED;
+	}
+
+	if (val & ISL12022_SR_ALM)
+		events |= RTC_IRQF | RTC_AF;
+
+	if (events & RTC_AF)
+		dev_dbg(dev, "alarm!\n");
+
+	if (!events)
+		return IRQ_NONE;
+
+	rtc_update_irq(rtc, 1, events);
+	return IRQ_HANDLED;
+}
+
+static int isl12022_rtc_alarm_irq_enable(struct device *dev,
+					 unsigned int enabled)
+{
+	struct isl12022 *isl12022 = dev_get_drvdata(dev);
+
+	if (!isl12022->irq_enabled == !enabled)
+		return 0;
+
+	if (enabled)
+		enable_irq(isl12022->irq);
+	else
+		disable_irq(isl12022->irq);
+
+	isl12022->irq_enabled = !!enabled;
+
+	return 0;
+}
+
+static int isl12022_setup_irq(struct isl12022 *isl12022, int irq)
+{
+	struct device *dev = &isl12022->i2c->dev;
+	struct regmap *regmap = isl12022->regmap;
+	unsigned int reg_mask, reg_val;
+	u8 buf[ISL12022_ALARM_SECTION_LEN] = { 0, };
+	int ret;
+
+	/* Clear and disable all alarm registers */
+	ret = regmap_bulk_write(regmap, ISL12022_ALARM_SECTION,
+				buf, sizeof(buf));
+	if (ret)
+		return ret;
+
+	/* Enable automatic reset of ALM bit, enable single event interrupt
+	 * mode, and disable IRQ/fOUT pin during battery-backup mode.
+	 */
+	reg_mask = ISL12022_INT_ARST | ISL12022_INT_IM
+		| ISL12022_INT_FOBATB | ISL12022_INT_FO_MASK;
+	reg_val = ISL12022_INT_ARST | ISL12022_INT_FOBATB | ISL12022_INT_FO_OFF;
+	ret = regmap_write_bits(regmap, ISL12022_REG_INT,
+				reg_mask, reg_val);
+	if (ret)
+		return ret;
+
+	ret = devm_request_threaded_irq(dev, irq, NULL,
+					isl12022_rtc_interrupt,
+					IRQF_SHARED | IRQF_ONESHOT,
+					isl12022_driver.driver.name,
+					isl12022);
+	if (ret) {
+		dev_err(dev, "Unable to request irq %d\n", irq);
+		return ret;
+	}
+
+	isl12022->irq = irq;
+	return 0;
+}
+
 static int isl12022_rtc_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
 {
 	struct isl12022 *isl12022 = dev_get_drvdata(dev);
@@ -246,6 +471,9 @@ static const struct rtc_class_ops isl12022_rtc_ops = {
 	.ioctl		= isl12022_rtc_ioctl,
 	.read_time	= isl12022_rtc_read_time,
 	.set_time	= isl12022_rtc_set_time,
+	.read_alarm	= isl12022_rtc_read_alarm,
+	.set_alarm	= isl12022_rtc_set_alarm,
+	.alarm_irq_enable = isl12022_rtc_alarm_irq_enable,
 };
 
 static const struct regmap_config regmap_config = {
@@ -347,6 +575,7 @@ static int isl12022_probe(struct i2c_client *client)
 	isl12022 = devm_kzalloc(&client->dev, sizeof(*isl12022), GFP_KERNEL);
 	if (!isl12022)
 		return -ENOMEM;
+	isl12022->i2c = client;
 
 	regmap = devm_regmap_init_i2c(client, &regmap_config);
 	if (IS_ERR(regmap)) {
@@ -367,11 +596,20 @@ static int isl12022_probe(struct i2c_client *client)
 	rtc = devm_rtc_allocate_device(&client->dev);
 	if (IS_ERR(rtc))
 		return PTR_ERR(rtc);
+	isl12022->rtc = rtc;
 
 	rtc->ops = &isl12022_rtc_ops;
 	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
 	rtc->range_max = RTC_TIMESTAMP_END_2099;
 
+	if (client->irq > 0) {
+		ret = isl12022_setup_irq(isl12022, client->irq);
+		if (ret)
+			return ret;
+	} else {
+		clear_bit(RTC_FEATURE_ALARM, rtc->features);
+	}
+
 	return devm_rtc_register_device(rtc);
 }
 

-- 
2.46.0


