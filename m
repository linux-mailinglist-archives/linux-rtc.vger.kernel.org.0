Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7F57612DFE
	for <lists+linux-rtc@lfdr.de>; Mon, 31 Oct 2022 00:21:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbiJ3XVw (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 30 Oct 2022 19:21:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiJ3XVv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 30 Oct 2022 19:21:51 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7ED69FE1
        for <linux-rtc@vger.kernel.org>; Sun, 30 Oct 2022 16:21:49 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id bj12so25456816ejb.13
        for <linux-rtc@vger.kernel.org>; Sun, 30 Oct 2022 16:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S4SWRtaYww0+SnDUBv6oi7+BgnJzkElPos9hz1zIY5c=;
        b=FWuL0tNYAmSgSCF5jpaNuO2oEELLWAazmn3tkmlPWDTe64aMhDd+z6yCrWtu/tf+RQ
         e7inIhKXFzEgeAVcsLn3TcPap2rttqJr5K5/0kUeK7WVH1YvGWL8as0LJV9nihVLYylq
         IJP9V6CybxZra2/xlATHVRHsSzkyanA7FiKkqIHbdMH+YIrTOxX+rpvT6S1SlPSLQ3my
         FtRfabR6EPRcrq83DoIgeDZbBIzn5uYU2fF/j5llNErW1YOI5G2+S9TtJwaj3cpF9NJX
         iyZRJjJmJ79IQYuaA4nZ2Gm1nn9GioxCiLFAQ4ZK+tRLE2LPWlC0ncER3KOlstrr0Ned
         HVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S4SWRtaYww0+SnDUBv6oi7+BgnJzkElPos9hz1zIY5c=;
        b=XJPzEIh/etQ1Pa7rhkmQLc0bD7IpPKlm6u0j9HQ2w2DkFwkQEhJtbyATgz4PZS9hDH
         UaEgObY5nYxCSUeVGllD8p6d+WS9eWJCgQkujI+LZAHozzPvAI+WuUzWi6FdlcSwCtvU
         4wNo4UlYk0yCIFI0yJeSLAZody3eKUX3aRon0bYYaDj33XlLacCx7f+mP1M9VPjRA5ZI
         dcSmZjZSLDSgiHh2h+ATJcu0Av5hzn1olv6EPPXJj3gwVAgo1wcC8A4HpYip53cixYgl
         1811MzhenAZu5kbmC8IjbuBkhKw6lPTb42yPpQpsvHDAi6Xuu0lQYuby2jw8DBqkVetF
         vp8Q==
X-Gm-Message-State: ACrzQf1TF70faoeHllQTriNC+XuYXcNZeaKjgrmdz800D4VJGk1ClBKA
        mqZE1DvnB8lAbzNzmSum8Obggw==
X-Google-Smtp-Source: AMsMyM4q3AXeo9ILcgRDjWzg0fla4mBzWsYWoj1r/ERfIkps0E3f5NZWgkBAk2i2j91vLP3kF2jkTA==
X-Received: by 2002:a17:906:9b86:b0:73d:72cf:72af with SMTP id dd6-20020a1709069b8600b0073d72cf72afmr10374232ejc.440.1667172108176;
        Sun, 30 Oct 2022 16:21:48 -0700 (PDT)
Received: from localhost.localdomain (host-87-0-236-69.retail.telecomitalia.it. [87.0.236.69])
        by smtp.gmail.com with ESMTPSA id w27-20020a50d79b000000b00461e4498666sm2572055edi.11.2022.10.30.16.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 16:21:47 -0700 (PDT)
From:   Angelo Dureghello <angelo.dureghello@timesys.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org,
        Angelo Dureghello <angelo.dureghello@timesys.com>
Subject: [PATCH resend 1/2] rtc: add NXP PCF2131 support (i2c)
Date:   Mon, 31 Oct 2022 00:20:19 +0100
Message-Id: <20221030232020.465322-1-angelo.dureghello@timesys.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Started up this driver from similar rtc pcf2127.
Actually only i2c communication has been tested, spi
part can be easily added as needed in a later time.

Signed-off-by: Angelo Dureghello <angelo.dureghello@timesys.com>
---
 drivers/rtc/Kconfig       |  15 +
 drivers/rtc/Makefile      |   1 +
 drivers/rtc/rtc-pcf2131.c | 569 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 585 insertions(+)
 create mode 100644 drivers/rtc/rtc-pcf2131.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index bb63edb507da..0d727b94a024 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -921,6 +921,21 @@ config RTC_DRV_PCF2127
 	  This driver can also be built as a module. If so, the module
 	  will be called rtc-pcf2127.
 
+config RTC_DRV_PCF2131
+	tristate "NXP PCF2131"
+	depends on RTC_I2C
+	select REGMAP_I2C if I2C
+	select WATCHDOG_CORE if WATCHDOG
+	help
+	  If you say yes here you enable support for the NXP PCF2131 RTC
+	  chip, a CMOS RTC and calendar with an integrated temperature
+	  compensated crystal (Xtal) oscillator (TCXO) and a 32.768 kHz
+	  quartz crystal optimized for very high accuracy and ultra-low
+	  power consumption.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called rtc-pcf2131.
+
 config RTC_DRV_RV3029C2
 	tristate "Micro Crystal RV3029/3049"
 	depends on RTC_I2C_AND_SPI
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index aab22bc63432..30b429733c70 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -121,6 +121,7 @@ obj-$(CONFIG_RTC_DRV_PALMAS)	+= rtc-palmas.o
 obj-$(CONFIG_RTC_DRV_PCAP)	+= rtc-pcap.o
 obj-$(CONFIG_RTC_DRV_PCF2123)	+= rtc-pcf2123.o
 obj-$(CONFIG_RTC_DRV_PCF2127)	+= rtc-pcf2127.o
+obj-$(CONFIG_RTC_DRV_PCF2131)   += rtc-pcf2131.o
 obj-$(CONFIG_RTC_DRV_PCF50633)	+= rtc-pcf50633.o
 obj-$(CONFIG_RTC_DRV_PCF85063)	+= rtc-pcf85063.o
 obj-$(CONFIG_RTC_DRV_PCF8523)	+= rtc-pcf8523.o
diff --git a/drivers/rtc/rtc-pcf2131.c b/drivers/rtc/rtc-pcf2131.c
new file mode 100644
index 000000000000..38fabbc49030
--- /dev/null
+++ b/drivers/rtc/rtc-pcf2131.c
@@ -0,0 +1,569 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * An I2C and SPI driver for the NXP PCF2131 RTC
+ * Copyright 2022 Timesys Corp.
+ *
+ * Author: Angelo Dureghello <angelo.dureghello@timesys.com>
+ *
+ * Based on the other drivers in this same directory.
+ *
+ */
+
+#include <linux/i2c.h>
+#include <linux/spi/spi.h>
+#include <linux/bcd.h>
+#include <linux/rtc.h>
+#include <linux/slab.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include <linux/watchdog.h>
+
+#define PCF2131_REG_CTRL1		0x00
+#define PCF2131_BIT_CTRL1_STOP		BIT(5)
+
+#define PCF2131_REG_CTRL2		0x01
+
+/* Control register 3 */
+#define PCF2131_REG_CTRL3		0x02
+#define PCF2131_BIT_CTRL3_BLIE		BIT(0)
+#define PCF2131_BIT_CTRL3_BIE		BIT(1)
+#define PCF2131_BIT_CTRL3_BLF		BIT(2)
+#define PCF2131_BIT_CTRL3_BF		BIT(3)
+#define PCF2131_BIT_CTRL3_BTSE		BIT(4)
+
+#define PCF2131_REG_CTRL4		0x03
+#define PCF2131_BIT_CTRL4_TSF4		BIT(4)
+#define PCF2131_BIT_CTRL4_TSF3		BIT(5)
+#define PCF2131_BIT_CTRL4_TSF2		BIT(6)
+#define PCF2131_BIT_CTRL4_TSF1		BIT(7)
+
+#define PCF2131_REG_CTRL5		0x04
+#define PCF2131_BIT_CTRL5_TSIE4		BIT(4)
+#define PCF2131_BIT_CTRL5_TSIE3		BIT(5)
+#define PCF2131_BIT_CTRL5_TSIE2		BIT(6)
+#define PCF2131_BIT_CTRL5_TSIE1		BIT(7)
+
+#define PCF2131_REG_SW_RST		0x05
+#define PCF2131_BIT_SW_RST_CPR		BIT(7)
+
+/* Time and date registers */
+#define PCF2131_REG_SC			0x07
+#define PCF2131_BIT_SC_OSF		BIT(7)
+#define PCF2131_REG_MN			0x08
+#define PCF2131_REG_HR			0x09
+#define PCF2131_REG_DM			0x0a
+#define PCF2131_REG_DW			0x0b
+#define PCF2131_REG_MO			0x0c
+#define PCF2131_REG_YR			0x0d
+
+/* Timestamps registers */
+#define PCF2131_TIMESTAMPS		4
+#define PCF2131_REG_TS_SIZE		7
+#define PCF2131_REG_TS1_CTRL		0x14
+#define PCF2131_REG_TS2_CTRL		0x1b
+#define PCF2131_REG_TS3_CTRL		0x22
+#define PCF2131_REG_TS4_CTRL		0x29
+#define PCF2131_BIT_TS_CTRL_TSOFF	BIT(6)
+#define PCF2131_BIT_TS_CTRL_TSM		BIT(7)
+
+/* Watchdog registers */
+#define PCF2131_REG_WD_CTL		0x35
+#define PCF2131_BIT_WD_CTL_TF0		BIT(0)
+#define PCF2131_BIT_WD_CTL_TF1		BIT(1)
+#define PCF2131_BIT_WD_CTL_TI_TP	BIT(5)
+#define PCF2131_BIT_WD_CTL_CD		BIT(7)
+#define PCF2131_REG_WD_VAL		0x36
+
+/* Watchdog timer value constants */
+#define PCF2131_WD_VAL_STOP		0
+#define PCF2131_WD_VAL_MIN		2
+#define PCF2131_WD_VAL_MAX		255
+#define PCF2131_WD_VAL_DEFAULT		60
+
+struct pcf2131 {
+	struct rtc_device *rtc;
+	struct regmap *regmap;
+	struct watchdog_device wdd;
+};
+
+static int pcf2131_rtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	struct pcf2131 *pcf2131 = dev_get_drvdata(dev);
+	u8 buf[16];
+	int ret;
+
+	ret = regmap_bulk_read(pcf2131->regmap, PCF2131_REG_CTRL1,
+			       buf, sizeof(buf));
+	if (ret < 0)
+		return ret;
+
+	if (buf[PCF2131_REG_CTRL3] & PCF2131_BIT_CTRL3_BLF)
+		dev_info(dev, "low voltage, check/replace RTC battery.\n");
+
+	if (buf[PCF2131_REG_SC] & PCF2131_BIT_SC_OSF) {
+		dev_err(dev, "oscillator stop detected, time not reliable.\n");
+
+		return -EINVAL;
+	}
+
+	tm->tm_sec = bcd2bin(buf[PCF2131_REG_SC] & 0x7F);
+	tm->tm_min = bcd2bin(buf[PCF2131_REG_MN] & 0x7F);
+	tm->tm_hour = bcd2bin(buf[PCF2131_REG_HR] & 0x3F);
+	tm->tm_mday = bcd2bin(buf[PCF2131_REG_DM] & 0x3F);
+	tm->tm_wday = bcd2bin(buf[PCF2131_REG_DW] & 0x07);
+	tm->tm_mon = bcd2bin(buf[PCF2131_REG_MO] & 0x1F) - 1;
+	tm->tm_year = bcd2bin(buf[PCF2131_REG_YR]);
+	if (tm->tm_year < 70)
+		tm->tm_year += 100;
+
+	return 0;
+}
+
+static int pcf2131_rtc_stop(struct regmap *regmap)
+{
+	return regmap_update_bits(regmap, PCF2131_REG_CTRL1,
+					  PCF2131_BIT_CTRL1_STOP,
+					  PCF2131_BIT_CTRL1_STOP);
+}
+
+static int pcf2131_start_rtc(struct regmap *regmap)
+{
+	return regmap_update_bits(regmap, PCF2131_REG_CTRL1,
+					  PCF2131_BIT_CTRL1_STOP,
+					  0);
+}
+
+static int pcf2131_rtc_clear_prescaler(struct regmap *regmap)
+{
+	return regmap_update_bits(regmap, PCF2131_REG_SW_RST,
+					  PCF2131_BIT_SW_RST_CPR,
+					  PCF2131_BIT_SW_RST_CPR);
+}
+
+static int pcf2131_rtc_set_time(struct device *dev, struct rtc_time *tm)
+{
+	struct pcf2131 *pcf2131 = dev_get_drvdata(dev);
+	unsigned char buf[7];
+	int i = 0, err;
+
+	if (tm->tm_year < 100 || tm->tm_year >= 200)
+		return -EINVAL;
+
+	err = pcf2131_rtc_stop(pcf2131->regmap);
+	if (err)
+		goto ret_err;
+
+	err = pcf2131_rtc_clear_prescaler(pcf2131->regmap);
+	if (err)
+		goto ret_err;
+
+	/* this will also clear OSF flag */
+	buf[i++] = bin2bcd(tm->tm_sec);
+	buf[i++] = bin2bcd(tm->tm_min);
+	buf[i++] = bin2bcd(tm->tm_hour);
+	buf[i++] = bin2bcd(tm->tm_mday);
+	buf[i++] = bin2bcd(tm->tm_wday) & 0x07;
+	buf[i++] = bin2bcd(tm->tm_mon + 1);
+	buf[i++] = bin2bcd(tm->tm_year % 100);
+
+	err = regmap_bulk_write(pcf2131->regmap, PCF2131_REG_SC, buf, i);
+	if (err < 0) {
+		pcf2131_start_rtc(pcf2131->regmap);
+		goto ret_err;
+	}
+
+	if (pcf2131_start_rtc(pcf2131->regmap))
+		goto ret_err;
+
+	return 0;
+
+ret_err:
+	dev_err(dev, "%s: err=%d", __func__, err);
+
+	return err;
+}
+
+#ifdef CONFIG_RTC_INTF_DEV
+static int pcf2131_rtc_ioctl(struct device *dev,
+				unsigned int cmd, unsigned long arg)
+{
+	struct pcf2131 *pcf2131 = dev_get_drvdata(dev);
+	int ret, touser;
+
+	switch (cmd) {
+	case RTC_VL_READ:
+		ret = regmap_read(pcf2131->regmap, PCF2131_REG_CTRL3, &touser);
+		if (ret < 0)
+			return ret;
+
+		touser = touser & PCF2131_BIT_CTRL3_BLF ? 1 : 0;
+
+		if (copy_to_user((void __user *)arg, &touser, sizeof(int)))
+			return -EFAULT;
+		return 0;
+	default:
+		return -ENOIOCTLCMD;
+	}
+}
+#else
+#define pcf2131_rtc_ioctl NULL
+#endif
+
+static const struct rtc_class_ops pcf2131_rtc_ops = {
+	.ioctl = pcf2131_rtc_ioctl,
+	.read_time = pcf2131_rtc_read_time,
+	.set_time = pcf2131_rtc_set_time,
+};
+
+/* watchdog driver */
+
+static int pcf2131_wdt_ping(struct watchdog_device *wdd)
+{
+	struct pcf2131 *pcf2131 = watchdog_get_drvdata(wdd);
+
+	return regmap_write(pcf2131->regmap, PCF2131_REG_WD_VAL, wdd->timeout);
+}
+
+/*
+ * Restart watchdog timer if feature is active.
+ *
+ * Note: Reading CTRL2 register causes watchdog to stop which is unfortunate,
+ * since register also contain control/status flags for other features.
+ * Always call this function after reading CTRL2 register.
+ */
+static int pcf2131_wdt_active_ping(struct watchdog_device *wdd)
+{
+	int ret = 0;
+
+	if (watchdog_active(wdd)) {
+		ret = pcf2131_wdt_ping(wdd);
+		if (ret)
+			dev_err(wdd->parent,
+				"%s: watchdog restart failed, ret=%d\n",
+				__func__, ret);
+	}
+
+	return ret;
+}
+
+static int pcf2131_wdt_start(struct watchdog_device *wdd)
+{
+	return pcf2131_wdt_ping(wdd);
+}
+
+static int pcf2131_wdt_stop(struct watchdog_device *wdd)
+{
+	struct pcf2131 *pcf2131 = watchdog_get_drvdata(wdd);
+
+	return regmap_write(pcf2131->regmap, PCF2131_REG_WD_VAL,
+					     PCF2131_WD_VAL_STOP);
+}
+
+static int pcf2131_wdt_set_timeout(struct watchdog_device *wdd,
+				   unsigned int new_timeout)
+{
+	dev_dbg(wdd->parent, "new watchdog timeout: %is (old: %is)\n",
+		new_timeout, wdd->timeout);
+
+	wdd->timeout = new_timeout;
+
+	return pcf2131_wdt_active_ping(wdd);
+}
+
+static const struct watchdog_info pcf2131_wdt_info = {
+	.identity = "NXP PCF2131 Watchdog",
+	.options = WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT,
+};
+
+static const struct watchdog_ops pcf2131_watchdog_ops = {
+	.owner = THIS_MODULE,
+	.start = pcf2131_wdt_start,
+	.stop = pcf2131_wdt_stop,
+	.ping = pcf2131_wdt_ping,
+	.set_timeout = pcf2131_wdt_set_timeout,
+};
+
+/* sysfs interface */
+
+static ssize_t __timestamp_store(int idx,
+				 struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t count)
+{
+	struct pcf2131 *pcf2131 = dev_get_drvdata(dev);
+	int ret;
+
+	ret = regmap_update_bits(pcf2131->regmap,
+					PCF2131_REG_CTRL4,
+					PCF2131_BIT_CTRL4_TSF1 >> idx, 0);
+	if (ret < 0) {
+		dev_err(dev, "%s: update ctrl1 ret=%d\n", __func__, ret);
+		return ret;
+	}
+
+	ret = pcf2131_wdt_active_ping(&pcf2131->wdd);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static ssize_t timestamp0_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf, size_t count)
+{
+	return __timestamp_store(0, dev, attr, buf, count);
+}
+
+static ssize_t timestamp1_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf, size_t count)
+{
+	return __timestamp_store(1, dev, attr, buf, count);
+}
+
+static ssize_t timestamp2_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf, size_t count)
+{
+	return __timestamp_store(2, dev, attr, buf, count);
+}
+
+static ssize_t timestamp3_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf, size_t count)
+{
+	return __timestamp_store(3, dev, attr, buf, count);
+}
+
+static ssize_t __timestamp_show(int idx, struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct pcf2131 *pcf2131 = dev_get_drvdata(dev);
+	struct rtc_time tm;
+	int ret;
+	int offs;
+	unsigned char data[48];
+
+	ret = regmap_bulk_read(pcf2131->regmap, PCF2131_REG_CTRL1,
+			       data, sizeof(data));
+	if (ret < 0)
+		return ret;
+
+	offs = PCF2131_REG_TS1_CTRL + (idx * PCF2131_REG_TS_SIZE);
+
+	ret = pcf2131_wdt_active_ping(&pcf2131->wdd);
+	if (ret)
+		return ret;
+
+	if (!(data[PCF2131_REG_CTRL4] & (PCF2131_BIT_CTRL4_TSF1 >> idx)))
+		return 0;
+
+	tm.tm_sec = bcd2bin(data[offs + 1] & 0x7F);
+	tm.tm_min = bcd2bin(data[offs + 2] & 0x7F);
+	tm.tm_hour = bcd2bin(data[offs + 3] & 0x3F);
+	tm.tm_mday = bcd2bin(data[offs + 4] & 0x3F);
+	tm.tm_mon = bcd2bin(data[offs + 5] & 0x1F) - 1;
+	tm.tm_year = bcd2bin(data[offs + 6]);
+	if (tm.tm_year < 70)
+		tm.tm_year += 100;
+
+	ret = rtc_valid_tm(&tm);
+	if (ret)
+		return ret;
+
+	return sprintf(buf, "%llu\n",
+		       (unsigned long long)rtc_tm_to_time64(&tm));
+};
+
+static ssize_t timestamp0_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	return __timestamp_show(0, dev, attr, buf);
+}
+
+static ssize_t timestamp1_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	return __timestamp_show(1, dev, attr, buf);
+}
+static ssize_t timestamp2_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	return __timestamp_show(2, dev, attr, buf);
+}
+
+static ssize_t timestamp3_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	return __timestamp_show(3, dev, attr, buf);
+}
+
+static DEVICE_ATTR_RW(timestamp0);
+static DEVICE_ATTR_RW(timestamp1);
+static DEVICE_ATTR_RW(timestamp2);
+static DEVICE_ATTR_RW(timestamp3);
+
+static struct attribute *pcf2131_attrs[] = {
+	&dev_attr_timestamp0.attr,
+	&dev_attr_timestamp1.attr,
+	&dev_attr_timestamp2.attr,
+	&dev_attr_timestamp3.attr,
+	NULL
+};
+
+static const struct attribute_group pcf2131_attr_group = {
+	.attrs	= pcf2131_attrs,
+};
+
+/*
+ * This device does not support bulk transferts.
+ */
+static const struct regmap_config regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = 0x36,
+	.use_single_read = 1,
+	.use_single_write = 1,
+};
+
+static int pcf2131_rtc_probe(struct i2c_client *client)
+{
+	struct pcf2131 *pcf2131;
+	struct rtc_device *rtc;
+	int i, ret = 0;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
+		return -ENODEV;
+
+	pcf2131 = devm_kzalloc(&client->dev,
+			       sizeof(struct pcf2131), GFP_KERNEL);
+	if (!pcf2131)
+		return -ENOMEM;
+
+	pcf2131->regmap = devm_regmap_init_i2c(client, &regmap_config);
+	if (IS_ERR(pcf2131->regmap))
+		return PTR_ERR(pcf2131->regmap);
+
+	i2c_set_clientdata(client, pcf2131);
+
+	rtc = devm_rtc_allocate_device(&client->dev);
+	if (IS_ERR(rtc))
+		return PTR_ERR(rtc);
+	pcf2131->rtc = rtc;
+
+	pcf2131->rtc->ops = &pcf2131_rtc_ops;
+
+	pcf2131->wdd.parent = &client->dev;
+	pcf2131->wdd.info = &pcf2131_wdt_info;
+	pcf2131->wdd.ops = &pcf2131_watchdog_ops;
+	pcf2131->wdd.min_timeout = PCF2131_WD_VAL_MIN;
+	pcf2131->wdd.max_timeout = PCF2131_WD_VAL_MAX;
+	pcf2131->wdd.timeout = PCF2131_WD_VAL_DEFAULT;
+	pcf2131->wdd.min_hw_heartbeat_ms = 500;
+
+	watchdog_set_drvdata(&pcf2131->wdd, pcf2131);
+
+	/*
+	 * Watchdog timer enabled and int pins /INTA/B activated when timed out.
+	 * Select 4Hz clock source for watchdog timer.
+	 * Timer is not started until WD_VAL is loaded with a valid value.
+	 * Note: countdown timer not available.
+	 */
+	ret = regmap_update_bits(pcf2131->regmap, PCF2131_REG_WD_CTL,
+					PCF2131_BIT_WD_CTL_CD |
+					PCF2131_BIT_WD_CTL_TI_TP |
+					PCF2131_BIT_WD_CTL_TF1 |
+					PCF2131_BIT_WD_CTL_TF0,
+					PCF2131_BIT_WD_CTL_CD |
+					PCF2131_BIT_WD_CTL_TF0);
+	if (ret < 0) {
+		dev_err(&client->dev, "%s: watchdog config failed, err %d\n",
+			__func__, ret);
+		return ret;
+	}
+
+#ifdef CONFIG_WATCHDOG
+	ret = devm_watchdog_register_device(&client->dev, &pcf2131->wdd);
+	if (ret)
+		return ret;
+#endif /* CONFIG_WATCHDOG */
+
+	/*
+	 * Disable battery low/switch-over timestamp and interrupts.
+	 * Clear battery interrupt flags which can block new trigger events.
+	 * Note: This is the default chip behaviour but added to ensure
+	 * correct tamper timestamp and interrupt function.
+	 */
+	ret = regmap_update_bits(pcf2131->regmap, PCF2131_REG_CTRL3,
+					PCF2131_BIT_CTRL3_BTSE |
+					PCF2131_BIT_CTRL3_BF |
+					PCF2131_BIT_CTRL3_BIE |
+					PCF2131_BIT_CTRL3_BLIE, 0);
+	if (ret < 0) {
+		dev_err(&client->dev, "%s: interrupt config (ctrl3) failed\n",
+			__func__);
+		return ret;
+	}
+
+	for (i = 0; i < PCF2131_TIMESTAMPS; i++) {
+		int reg = PCF2131_REG_TS1_CTRL + i * PCF2131_REG_TS_SIZE;
+
+		ret = regmap_update_bits(pcf2131->regmap, reg,
+						PCF2131_BIT_TS_CTRL_TSOFF |
+						PCF2131_BIT_TS_CTRL_TSM,
+						PCF2131_BIT_TS_CTRL_TSM);
+		if (ret < 0) {
+			dev_err(&client->dev,
+				"%s: tamper detection %d config failed\n",
+				__func__, i);
+			return ret;
+		}
+
+		ret = regmap_update_bits(pcf2131->regmap, PCF2131_REG_CTRL5,
+						PCF2131_BIT_CTRL5_TSIE1 >> i,
+						PCF2131_BIT_CTRL5_TSIE1 >> i);
+		if (ret < 0) {
+			dev_err(&client->dev,
+				"%s: tamper interrupt config %d failed\n",
+				__func__, i);
+			return ret;
+		}
+	}
+
+	ret = rtc_add_group(rtc, &pcf2131_attr_group);
+	if (ret) {
+		dev_err(&client->dev, "%s: tamper sysfs registering failed\n",
+			__func__);
+		return ret;
+	}
+
+	return devm_rtc_register_device(rtc);
+}
+
+static const struct i2c_device_id pcf2131_id[] = {
+	{ "pcf2131", 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, pcf2131_id);
+
+static const struct of_device_id pcf2131_rtc_of_match[] = {
+	{ .compatible = "nxp,pcf2131" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, pcf2131_rtc_of_match);
+
+static struct i2c_driver pcf2131_rtc_driver = {
+	.driver = {
+		.name = "rtc-pcf2131-i2c",
+		.of_match_table = of_match_ptr(pcf2131_rtc_of_match),
+	},
+	.probe_new = pcf2131_rtc_probe,
+	.id_table = pcf2131_id,
+};
+module_i2c_driver(pcf2131_rtc_driver);
+
+MODULE_AUTHOR("Angelo Dureghello <angelo.dureghello@timesys.com>");
+MODULE_DESCRIPTION("NXP PCF2131 RTC driver");
+MODULE_LICENSE("GPL");
-- 
2.38.1

