Return-Path: <linux-rtc+bounces-1978-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C548977D71
	for <lists+linux-rtc@lfdr.de>; Fri, 13 Sep 2024 12:31:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DFF9FB2880E
	for <lists+linux-rtc@lfdr.de>; Fri, 13 Sep 2024 10:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96B471DA2E3;
	Fri, 13 Sep 2024 10:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="jVubuQeJ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3DD1DA10B;
	Fri, 13 Sep 2024 10:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.30.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726223363; cv=none; b=YEtCS1AUmFLIT0s2QKnRECxRYAZb6pLW/+tXb0sgkIhbCvpXJ1iZYVexBXWI9dCJBAuidA/S/+ZzxdL+htaLy7S+aNWj0SzTrDPhqNhMbe7BVYt6p2nlR6/vTr2n1OrHVtArVZHD7XCreZmu3hl6bgbUzxPz/HWqVnor3/SivSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726223363; c=relaxed/simple;
	bh=p5lW8kt+tBRv/bLQuedoXGoUXVQLK2RHiLH/s8cCZJU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TqHEL9YUXl44eh3Lc68kaQZ30dhmB+BuOe2kBTfH7/fzupwImIgTz02z4SdnFmJzci8VdAcKbaTAX7mKU+BJ5FR3hcZtJzuRJNaoLOWumuFJ91EyT4AAN1G99KNjpNAd6u2gs5uVU5cy3DeImAViayJtwkOIgHBLSY/uPXrfk2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=jVubuQeJ; arc=none smtp.client-ip=188.40.30.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=UFkDIJo7jJmHoq3pVOjUKPfo/r4/oVTviXKltWdeniw=; b=jVubuQeJWjnIEIioR4svZB1Khh
	6rVT2Kz+pGAmi+MvB5ByDYW9NT45sXeAsWxaX1FVo3ihRdf7ne4t2Yflg6Oz6DQ5V+bOpSB7qDpjQ
	DOvQITplHSrR6wtEYQFyMkU3QWZVsPBaNUkj7M7m6JqSyVAxv6Azo0KgJx6fLwk6kmh85PtGTCHjO
	Nk3Qd/DG8gsvnZFcC+Ty8latkUGT33IMCnYn1m1Qu+BQcp1RcxfcK3H+w6uU+xtMtf54T1qAdo7hR
	lvqS4TJE8DVOCSgedKCX6OmzVCBkyklwGaW6f7V/9lFV9KdA/9je8LFSWFHyMHVPHbPWvMqW69v7B
	iLWoMRCw==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sp3YF-0006Oe-67; Fri, 13 Sep 2024 12:29:19 +0200
Received: from [80.62.117.18] (helo=localhost)
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sp3YE-0006wr-1B;
	Fri, 13 Sep 2024 12:29:18 +0200
From: Esben Haabendal <esben@geanix.com>
Date: Fri, 13 Sep 2024 12:29:13 +0200
Subject: [PATCH v2 2/3] rtc: isl12022: Add alarm support
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240913-rtc-isl12022-alarm-irq-v2-2-37309d939723@geanix.com>
References: <20240913-rtc-isl12022-alarm-irq-v2-0-37309d939723@geanix.com>
In-Reply-To: <20240913-rtc-isl12022-alarm-irq-v2-0-37309d939723@geanix.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726223357; l=9873;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=p5lW8kt+tBRv/bLQuedoXGoUXVQLK2RHiLH/s8cCZJU=;
 b=i7YQkFAgGBLNJYX7yBB8+uB5k5t5Sl6epAwKTH5U0RbYQ0WamP95YKt+R9+nkSIPMP/OHIROv
 5qJbEwOehldB7ZNG6wXm8k5AmDeVdWFGaC65lq8f/AfAA0VN55ef72o
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27397/Fri Sep 13 10:48:01 2024)

The ISL12022 RTC has a combined INT/fOUT pin, which can be used for alarm
interrupt when frequency output is not enabled.

The device-tree bindings should ensure that interrupt and clock output is
not enabled at the same time.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/rtc/rtc-isl12022.c | 234 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 227 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-isl12022.c b/drivers/rtc/rtc-isl12022.c
index d82278fdc29b..8001e3c5da76 100644
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
+#define ISL12022_ALARM		ISL12022_REG_SCA0
+#define ISL12022_ALARM_LEN	(ISL12022_REG_DWA0 - ISL12022_REG_SCA0 + 1)
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
@@ -52,10 +67,17 @@
 #define ISL12022_REG_VB85_MASK	GENMASK(5, 3)
 #define ISL12022_REG_VB75_MASK	GENMASK(2, 0)
 
+#define ISL12022_ALARM_ENABLE	(1 << 7)	/* for all ALARM registers  */
+
 #define ISL12022_BETA_TSE	(1 << 7)
 
+static struct i2c_driver isl12022_driver;
+
 struct isl12022 {
+	struct rtc_device *rtc;
 	struct regmap *regmap;
+	int irq;
+	bool irq_enabled;
 };
 
 static umode_t isl12022_hwmon_is_visible(const void *data,
@@ -215,6 +237,194 @@ static int isl12022_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	return regmap_bulk_write(regmap, ISL12022_REG_SC, buf, sizeof(buf));
 }
 
+static int isl12022_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
+{
+	struct rtc_time *tm = &alarm->time;
+	struct isl12022 *isl12022 = dev_get_drvdata(dev);
+	struct regmap *regmap = isl12022->regmap;
+	u8 buf[ISL12022_ALARM_LEN];
+	unsigned int i, yr;
+	int ret;
+
+	ret = regmap_bulk_read(regmap, ISL12022_ALARM, buf, sizeof(buf));
+	if (ret) {
+		dev_dbg(dev, "%s: reading ALARM registers failed\n",
+			__func__);
+		return ret;
+	}
+
+	/* The alarm doesn't store the year so get it from the rtc section */
+	ret = regmap_read(regmap, ISL12022_REG_YR, &yr);
+	if (ret) {
+		dev_dbg(dev, "%s: reading YR register failed\n", __func__);
+		return ret;
+	}
+
+	dev_dbg(dev,
+		"%s: sc=%02x, mn=%02x, hr=%02x, dt=%02x, mo=%02x, dw=%02x yr=%u\n",
+		__func__, buf[0], buf[1], buf[2], buf[3], buf[4], buf[5], yr);
+
+	tm->tm_sec  = bcd2bin(buf[ISL12022_REG_SCA0 - ISL12022_ALARM] & 0x7F);
+	tm->tm_min  = bcd2bin(buf[ISL12022_REG_MNA0 - ISL12022_ALARM] & 0x7F);
+	tm->tm_hour = bcd2bin(buf[ISL12022_REG_HRA0 - ISL12022_ALARM] & 0x3F);
+	tm->tm_mday = bcd2bin(buf[ISL12022_REG_DTA0 - ISL12022_ALARM] & 0x3F);
+	tm->tm_mon  = bcd2bin(buf[ISL12022_REG_MOA0 - ISL12022_ALARM] & 0x1F) - 1;
+	tm->tm_wday = buf[ISL12022_REG_DWA0 - ISL12022_ALARM]         & 0x07;
+	tm->tm_year = bcd2bin(yr) + 100;
+
+	for (i = 0; i < ISL12022_ALARM_LEN; i++) {
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
+	u8 regs[ISL12022_ALARM_LEN] = { 0, };
+	struct rtc_time rtc_tm;
+	int ret, enable, dw;
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
+	/*
+	 * Set non-matching day of the week to safeguard against early false
+	 * matching while setting all the alarm registers (this rtc lacks a
+	 * general alarm/irq enable/disable bit).
+	 */
+	ret = regmap_read(regmap, ISL12022_REG_DW, &dw);
+	if (ret) {
+		dev_dbg(dev, "%s: reading DW failed\n", __func__);
+		return ret;
+	}
+	/* ~4 days into the future should be enough to avoid match */
+	dw = ((dw + 4) % 7) | ISL12022_ALARM_ENABLE;
+	ret = regmap_write(regmap, ISL12022_REG_DWA0, dw);
+	if (ret) {
+		dev_dbg(dev, "%s: writing DWA0 failed\n", __func__);
+		return ret;
+	}
+
+	/* Program the alarm and enable it for each setting */
+	regs[ISL12022_REG_SCA0 - ISL12022_ALARM] = bin2bcd(alarm_tm->tm_sec) | enable;
+	regs[ISL12022_REG_MNA0 - ISL12022_ALARM] = bin2bcd(alarm_tm->tm_min) | enable;
+	regs[ISL12022_REG_HRA0 - ISL12022_ALARM] = bin2bcd(alarm_tm->tm_hour) | enable;
+	regs[ISL12022_REG_DTA0 - ISL12022_ALARM] = bin2bcd(alarm_tm->tm_mday) | enable;
+	regs[ISL12022_REG_MOA0 - ISL12022_ALARM] = bin2bcd(alarm_tm->tm_mon + 1) | enable;
+	regs[ISL12022_REG_DWA0 - ISL12022_ALARM] = bin2bcd(alarm_tm->tm_wday & 7) | enable;
+
+	/* write ALARM registers */
+	ret = regmap_bulk_write(regmap, ISL12022_ALARM, &regs, sizeof(regs));
+	if (ret) {
+		dev_dbg(dev, "%s: writing ALARM registers failed\n", __func__);
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
+		dev_dbg(dev, "%s: reading SR failed\n", __func__);
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
+	/* Make sure enabled is 0 or 1 */
+	enabled = !!enabled;
+
+	if (isl12022->irq_enabled == enabled)
+		return 0;
+
+	if (enabled)
+		enable_irq(isl12022->irq);
+	else
+		disable_irq(isl12022->irq);
+
+	isl12022->irq_enabled = enabled;
+
+	return 0;
+}
+
+static int isl12022_setup_irq(struct device *dev, int irq)
+{
+	struct isl12022 *isl12022 = dev_get_drvdata(dev);
+	struct regmap *regmap = isl12022->regmap;
+	unsigned int reg_mask, reg_val;
+	u8 buf[ISL12022_ALARM_LEN] = { 0, };
+	int ret;
+
+	/* Clear and disable all alarm registers */
+	ret = regmap_bulk_write(regmap, ISL12022_ALARM, buf, sizeof(buf));
+	if (ret)
+		return ret;
+
+	/*
+	 * Enable automatic reset of ALM bit and enable single event interrupt
+	 * mode.
+	 */
+	reg_mask = ISL12022_INT_ARST | ISL12022_INT_IM | ISL12022_INT_FO_MASK;
+	reg_val = ISL12022_INT_ARST | ISL12022_INT_FO_OFF;
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
+	if (ret)
+		return dev_err_probe(dev, ret, "Unable to request irq %d\n", irq);
+
+	isl12022->irq = irq;
+	return 0;
+}
+
 static int isl12022_rtc_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
 {
 	struct isl12022 *isl12022 = dev_get_drvdata(dev);
@@ -246,6 +456,9 @@ static const struct rtc_class_ops isl12022_rtc_ops = {
 	.ioctl		= isl12022_rtc_ioctl,
 	.read_time	= isl12022_rtc_read_time,
 	.set_time	= isl12022_rtc_set_time,
+	.read_alarm	= isl12022_rtc_read_alarm,
+	.set_alarm	= isl12022_rtc_set_alarm,
+	.alarm_irq_enable = isl12022_rtc_alarm_irq_enable,
 };
 
 static const struct regmap_config regmap_config = {
@@ -349,10 +562,8 @@ static int isl12022_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	regmap = devm_regmap_init_i2c(client, &regmap_config);
-	if (IS_ERR(regmap)) {
-		dev_err(&client->dev, "regmap allocation failed\n");
-		return PTR_ERR(regmap);
-	}
+	if (IS_ERR(regmap))
+		return dev_err_probe(&client->dev, PTR_ERR(regmap), "regmap allocation failed\n");
 	isl12022->regmap = regmap;
 
 	dev_set_drvdata(&client->dev, isl12022);
@@ -367,11 +578,20 @@ static int isl12022_probe(struct i2c_client *client)
 	rtc = devm_rtc_allocate_device(&client->dev);
 	if (IS_ERR(rtc))
 		return PTR_ERR(rtc);
+	isl12022->rtc = rtc;
 
 	rtc->ops = &isl12022_rtc_ops;
 	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
 	rtc->range_max = RTC_TIMESTAMP_END_2099;
 
+	if (client->irq > 0) {
+		ret = isl12022_setup_irq(&client->dev, client->irq);
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


