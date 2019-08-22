Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D536A994C6
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2019 15:19:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733017AbfHVNT6 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 22 Aug 2019 09:19:58 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:38996 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730621AbfHVNT5 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 22 Aug 2019 09:19:57 -0400
Received: by mail-wr1-f67.google.com with SMTP id t16so5409962wra.6;
        Thu, 22 Aug 2019 06:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8YzNQFejHcUxRGGGHyCklNkZB6Rv3yiFGAIZAAgoOvo=;
        b=mz61uVpt8xGUHMFran+MeTmkZJ/zLONa/gyVZgB8L52h4b7TPpGRYbRqnCl00O6maa
         eyydiWuT3agYR9sF+a+BCQtXGlFEVOhazQV0+QWP0WRQ5Oekt6hCjlNj3mtw/gleVBNC
         DRAUMmu8XNtqqxHklRBJwcPXWa3pxQ2VVU68EvNJQCHkEOm2MPOWBHM7+kvNATZJU5CW
         jGAdYR01jtiWbvLUcUR1i8w+aNomi2l0KcvJfMCc0PJ7pTpS0oImsEShBSQB5vEK8wP3
         qxDOOrDe5vB8I2PpPyig5TRsvTH+L8nowPrS6dHyZ+c7J1yFqNMh+jdwgrDyZ1g5vw44
         GlUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8YzNQFejHcUxRGGGHyCklNkZB6Rv3yiFGAIZAAgoOvo=;
        b=SK795YVYQf1ct5X0OPKhW9zhJfkWcfjqdDNqW4GcnVf5CHS3htKfu61oH7V9zvIYcI
         qmsHirOtYWdGYamYark4+mrO0zTCer0jyYYvbklFB+VM5LSQbA8fo7HjUCkuIL8eZ7wx
         31RuMD4GqczLk18XDf6wvq38YT8rkUq3Vxshj5QhnAlEdw6ZhGvuYGoDG5BGTRVbkhhL
         xEvlaXLCcV3tVQQf38Vofyo5lgffItjmVBB+ZqmssKc5lWOtKGq7JfJPs3B/+n/yZVMi
         wv+uF4LNTpR7a2DS9pqK1WrCnll+7cMQ5acnQvdbn7bJEvVOlqFmVyWj4TCrJnV17Ut0
         VpGw==
X-Gm-Message-State: APjAAAWDoC/Hc3uq5C7YB5bC06uVdhNMHzqSjEzMNGj1liRvYUEXI866
        PwrGUcDLa9PnHg5yJa6BDHp4w+M2BNGDAA==
X-Google-Smtp-Source: APXvYqxawesr4/ade+dpooRHdXcn2CsBAKF3KJyVQYDgaaGxsU6+RvY7bGpd4JW/n7klWZONGMKUuQ==
X-Received: by 2002:adf:fe12:: with SMTP id n18mr47027619wrr.105.1566479994040;
        Thu, 22 Aug 2019 06:19:54 -0700 (PDT)
Received: from localhost.localdomain (3e6b1cc1.rev.stofanet.dk. [62.107.28.193])
        by smtp.googlemail.com with ESMTPSA id d19sm34644045wrb.7.2019.08.22.06.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2019 06:19:53 -0700 (PDT)
From:   Bruno Thomsen <bruno.thomsen@gmail.com>
To:     linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc:     alexandre.belloni@bootlin.com, a.zummo@towertech.it,
        wim@linux-watchdog.org, linux@roeck-us.net,
        u.kleine-koenig@pengutronix.de, bth@kamstrup.com,
        bruno.thomsen@gmail.com
Subject: [PATCH v3 5/5] rtc: pcf2127: add tamper detection support
Date:   Thu, 22 Aug 2019 15:19:36 +0200
Message-Id: <20190822131936.18772-5-bruno.thomsen@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190822131936.18772-1-bruno.thomsen@gmail.com>
References: <20190822131936.18772-1-bruno.thomsen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Add support for integrated tamper detection function in both PCF2127 and
PCF2129 chips. This patch implements the feature by adding an additional
timestamp0 file to sysfs device path. This file contains seconds since
epoch, if an event occurred, or is empty, if none occurred.
Interface should match ISL1208 and RV3028 RTC drivers.

Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
---
v3: no change.
v2: call pcf2127_wdt_active_ping after CTRL2 register read.
    add dev_dbg() trace in timestamp0_show().
    minor regmap dev_err() text update in pcf2127_probe().

 drivers/rtc/rtc-pcf2127.c | 160 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 160 insertions(+)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 8d6eda455d81..3ec87d320766 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -25,11 +25,18 @@
 
 /* Control register 1 */
 #define PCF2127_REG_CTRL1		0x00
+#define PCF2127_BIT_CTRL1_TSF1			BIT(4)
 /* Control register 2 */
 #define PCF2127_REG_CTRL2		0x01
+#define PCF2127_BIT_CTRL2_TSIE			BIT(2)
+#define PCF2127_BIT_CTRL2_TSF2			BIT(5)
 /* Control register 3 */
 #define PCF2127_REG_CTRL3		0x02
+#define PCF2127_BIT_CTRL3_BLIE			BIT(0)
+#define PCF2127_BIT_CTRL3_BIE			BIT(1)
 #define PCF2127_BIT_CTRL3_BLF			BIT(2)
+#define PCF2127_BIT_CTRL3_BF			BIT(3)
+#define PCF2127_BIT_CTRL3_BTSE			BIT(4)
 /* Time and date registers */
 #define PCF2127_REG_SC			0x03
 #define PCF2127_BIT_SC_OSF			BIT(7)
@@ -46,6 +53,16 @@
 #define PCF2127_BIT_WD_CTL_CD0			BIT(6)
 #define PCF2127_BIT_WD_CTL_CD1			BIT(7)
 #define PCF2127_REG_WD_VAL		0x11
+/* Tamper timestamp registers */
+#define PCF2127_REG_TS_CTRL		0x12
+#define PCF2127_BIT_TS_CTRL_TSOFF		BIT(6)
+#define PCF2127_BIT_TS_CTRL_TSM			BIT(7)
+#define PCF2127_REG_TS_SC		0x13
+#define PCF2127_REG_TS_MN		0x14
+#define PCF2127_REG_TS_HR		0x15
+#define PCF2127_REG_TS_DM		0x16
+#define PCF2127_REG_TS_MO		0x17
+#define PCF2127_REG_TS_YR		0x18
 /*
  * RAM registers
  * PCF2127 has 512 bytes general-purpose static RAM (SRAM) that is
@@ -305,6 +322,97 @@ static const struct watchdog_ops pcf2127_watchdog_ops = {
 	.set_timeout = pcf2127_wdt_set_timeout,
 };
 
+/* sysfs interface */
+
+static ssize_t timestamp0_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf, size_t count)
+{
+	struct pcf2127 *pcf2127 = dev_get_drvdata(dev->parent);
+	int ret;
+
+	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL1,
+				 PCF2127_BIT_CTRL1_TSF1, 0);
+	if (ret) {
+		dev_err(dev, "%s: update ctrl1 ret=%d\n", __func__, ret);
+		return ret;
+	}
+
+	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL2,
+				 PCF2127_BIT_CTRL2_TSF2, 0);
+	if (ret) {
+		dev_err(dev, "%s: update ctrl2 ret=%d\n", __func__, ret);
+		return ret;
+	}
+
+	ret = pcf2127_wdt_active_ping(&pcf2127->wdd);
+	if (ret)
+		return ret;
+
+	return count;
+};
+
+static ssize_t timestamp0_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	struct pcf2127 *pcf2127 = dev_get_drvdata(dev->parent);
+	struct rtc_time tm;
+	int ret;
+	unsigned char data[25];
+
+	ret = regmap_bulk_read(pcf2127->regmap, PCF2127_REG_CTRL1, data,
+			       sizeof(data));
+	if (ret) {
+		dev_err(dev, "%s: read error ret=%d\n", __func__, ret);
+		return ret;
+	}
+
+	dev_dbg(dev,
+		"%s: raw data is cr1=%02x, cr2=%02x, cr3=%02x, ts_sc=%02x, "
+		"ts_mn=%02x, ts_hr=%02x, ts_dm=%02x, ts_mo=%02x, ts_yr=%02x\n",
+		__func__, data[PCF2127_REG_CTRL1], data[PCF2127_REG_CTRL2],
+		data[PCF2127_REG_CTRL3], data[PCF2127_REG_TS_SC],
+		data[PCF2127_REG_TS_MN], data[PCF2127_REG_TS_HR],
+		data[PCF2127_REG_TS_DM], data[PCF2127_REG_TS_MO],
+		data[PCF2127_REG_TS_YR]);
+
+	ret = pcf2127_wdt_active_ping(&pcf2127->wdd);
+	if (ret)
+		return ret;
+
+	if (!(data[PCF2127_REG_CTRL1] & PCF2127_BIT_CTRL1_TSF1) &&
+	    !(data[PCF2127_REG_CTRL2] & PCF2127_BIT_CTRL2_TSF2))
+		return 0;
+
+	tm.tm_sec = bcd2bin(data[PCF2127_REG_TS_SC] & 0x7F);
+	tm.tm_min = bcd2bin(data[PCF2127_REG_TS_MN] & 0x7F);
+	tm.tm_hour = bcd2bin(data[PCF2127_REG_TS_HR] & 0x3F);
+	tm.tm_mday = bcd2bin(data[PCF2127_REG_TS_DM] & 0x3F);
+	/* TS_MO register (month) value range: 1-12 */
+	tm.tm_mon = bcd2bin(data[PCF2127_REG_TS_MO] & 0x1F) - 1;
+	tm.tm_year = bcd2bin(data[PCF2127_REG_TS_YR]);
+	if (tm.tm_year < 70)
+		tm.tm_year += 100; /* assume we are in 1970...2069 */
+
+	ret = rtc_valid_tm(&tm);
+	if (ret)
+		return ret;
+
+	return sprintf(buf, "%llu\n",
+		       (unsigned long long)rtc_tm_to_time64(&tm));
+};
+
+static DEVICE_ATTR_RW(timestamp0);
+
+static struct attribute *pcf2127_attrs[] = {
+	&dev_attr_timestamp0.attr,
+	NULL
+};
+
+static const struct attribute_group pcf2127_attr_group = {
+	.attrs	= pcf2127_attrs,
+};
+
 static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 			const char *name, bool has_nvmem)
 {
@@ -371,6 +479,58 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 	if (ret)
 		return ret;
 
+	/*
+	 * Disable battery low/switch-over timestamp and interrupts.
+	 * Clear battery interrupt flags which can block new trigger events.
+	 * Note: This is the default chip behaviour but added to ensure
+	 * correct tamper timestamp and interrupt function.
+	 */
+	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL3,
+				 PCF2127_BIT_CTRL3_BTSE |
+				 PCF2127_BIT_CTRL3_BF |
+				 PCF2127_BIT_CTRL3_BIE |
+				 PCF2127_BIT_CTRL3_BLIE, 0);
+	if (ret) {
+		dev_err(dev, "%s: interrupt config (ctrl3) failed\n",
+			__func__);
+		return ret;
+	}
+
+	/*
+	 * Enable timestamp function and store timestamp of first trigger
+	 * event until TSF1 and TFS2 interrupt flags are cleared.
+	 */
+	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_TS_CTRL,
+				 PCF2127_BIT_TS_CTRL_TSOFF |
+				 PCF2127_BIT_TS_CTRL_TSM,
+				 PCF2127_BIT_TS_CTRL_TSM);
+	if (ret) {
+		dev_err(dev, "%s: tamper detection config (ts_ctrl) failed\n",
+			__func__);
+		return ret;
+	}
+
+	/*
+	 * Enable interrupt generation when TSF1 or TSF2 timestamp flags
+	 * are set. Interrupt signal is an open-drain output and can be
+	 * left floating if unused.
+	 */
+	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL2,
+				 PCF2127_BIT_CTRL2_TSIE,
+				 PCF2127_BIT_CTRL2_TSIE);
+	if (ret) {
+		dev_err(dev, "%s: tamper detection config (ctrl2) failed\n",
+			__func__);
+		return ret;
+	}
+
+	ret = rtc_add_group(pcf2127->rtc, &pcf2127_attr_group);
+	if (ret) {
+		dev_err(dev, "%s: tamper sysfs registering failed\n",
+			__func__);
+		return ret;
+	}
+
 	return rtc_register_device(pcf2127->rtc);
 }
 
-- 
2.21.0

