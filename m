Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA3A7704BE
	for <lists+linux-rtc@lfdr.de>; Mon, 22 Jul 2019 17:58:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729644AbfGVP6d (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 22 Jul 2019 11:58:33 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:33568 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728154AbfGVP6d (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 22 Jul 2019 11:58:33 -0400
Received: by mail-wm1-f67.google.com with SMTP id h19so29093684wme.0
        for <linux-rtc@vger.kernel.org>; Mon, 22 Jul 2019 08:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yorLT3TVPJGWbjjNzGQ5RCCF9SbaBHIjlNtknTnF7UY=;
        b=NXFMkZ4cigAX+r2G3YIJoiYeZCEvaBzW9cTp/T8eYI1F4+hHdSpSVXNIRV0pmaptOd
         +eSMZKOYVZulexC193eTFgIqarRJRKKs1qqf+gTQKJHrb4t5xRDMdMisa5KwJRX19BaH
         3ljHOc8XWBLFcVPZMgPew4KPBO0dZT35MlQ/HtM9tAcq58YAw4yD90E3nHCHhDQXcCgI
         bm5vpYpKks0oen9sNeDgcr0n0wgjgwij90D0QJcVXoxNu9e3FiA6Giw8NFrGaZTbUnyG
         vC/EIVQT+mguTp6SoyCwZ2FWPuVRQHkMJbe0BNU7DMHMT+qJAqJ7MhF+gw8F1I4qx87I
         ajlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yorLT3TVPJGWbjjNzGQ5RCCF9SbaBHIjlNtknTnF7UY=;
        b=Do4cfkckDHHhu9871fLpglS42/Nsn+xSSa++BzphpfYsV/JTSgdCfDmIHa8aY2KnMx
         Byh5VATTyrGHCZHGYt7oLb5Y+h/DMqPNKGjR8DYRrGv4wWIOGwuic8GkYkfiJv7HEewi
         NvIdM/QZ4vcDN9fRZOs95Ppye6YinB5z+5sW0wHfZn6OUFtbQJIu1Tqxv7gOCaZXyuHK
         xbHyvb0/K3nFsPHU+DgbnVLMMSpSBoxf3QCDD+t7u7h3fSw4xYUveFDYwYNed0IzYvyf
         t9RJ1PwRQhLgNGR14i+xtWdgK9D+3Hgqr1mQjXjR5AXiVScP3i47RvIA3ceL94ZT0x04
         uCRA==
X-Gm-Message-State: APjAAAWv8og1o7iFfJd+2ihvBCQkT/AQmtxCnsBsd9U+BJc+AOaS1i5b
        7i490r+cxUw6Xk17VP4I0qlAtQhNoYo=
X-Google-Smtp-Source: APXvYqxvT+fKCJJ4yyIdqsgLpKcFmJ01Wmquh9jNxeNky2hbaLDyl1g29hWlD+eX+/42wQzdk1sHOw==
X-Received: by 2002:a1c:343:: with SMTP id 64mr60879722wmd.116.1563811110195;
        Mon, 22 Jul 2019 08:58:30 -0700 (PDT)
Received: from localhost.localdomain (3e6b1cc1.rev.stofanet.dk. [62.107.28.193])
        by smtp.googlemail.com with ESMTPSA id 91sm84840716wrp.3.2019.07.22.08.58.29
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 08:58:29 -0700 (PDT)
From:   Bruno Thomsen <bruno.thomsen@gmail.com>
To:     linux-rtc@vger.kernel.org
Cc:     alexandre.belloni@bootlin.com, a.zummo@towertech.it,
        bruno.thomsen@gmail.com, bth@kamstrup.com,
        u.kleine-koenig@pengutronix.de
Subject: [PATCH 3/4] rtc: pcf2127: add tamper detection support
Date:   Mon, 22 Jul 2019 17:58:10 +0200
Message-Id: <20190722155811.11980-4-bruno.thomsen@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190722155811.11980-1-bruno.thomsen@gmail.com>
References: <20190722155811.11980-1-bruno.thomsen@gmail.com>
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
 drivers/rtc/rtc-pcf2127.c | 139 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 139 insertions(+)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index cd8def79b379..ff09bedc02d4 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -21,11 +21,18 @@
 
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
@@ -35,6 +42,16 @@
 #define PCF2127_REG_DW			0x07
 #define PCF2127_REG_MO			0x08
 #define PCF2127_REG_YR			0x09
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
@@ -228,6 +245,80 @@ static int pcf2127_nvmem_write(void *priv, unsigned int offset,
 	return ret ?: bytes;
 }
 
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
+	return count;
+};
+
+static ssize_t timestamp0_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	struct pcf2127 *pcf2127 = dev_get_drvdata(dev->parent);
+	struct rtc_time tm;
+	int ret;
+	u8 data[25];
+
+	ret = regmap_bulk_read(pcf2127->regmap, PCF2127_REG_CTRL1, data,
+			       sizeof(data));
+	if (ret) {
+		dev_err(dev, "%s: read error ret=%d\n", __func__, ret);
+		return ret;
+	}
+
+	if (!(data[PCF2127_REG_CTRL1] & PCF2127_BIT_CTRL1_TSF1) &&
+	    !(data[PCF2127_REG_CTRL2] & PCF2127_BIT_CTRL2_TSF2))
+		return 0;
+
+	tm.tm_sec = bcd2bin(data[PCF2127_REG_TS_SC] & 0x7F);
+	tm.tm_min = bcd2bin(data[PCF2127_REG_TS_MN] & 0x7F);
+	tm.tm_hour = bcd2bin(data[PCF2127_REG_TS_HR] & 0x3F);
+	tm.tm_mday = bcd2bin(data[PCF2127_REG_TS_DM] & 0x3F);
+	/* REG_TS_MO 1-12 */
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
@@ -261,6 +352,54 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 		ret = rtc_nvmem_register(pcf2127->rtc, &nvmem_cfg);
 	}
 
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
+		dev_err(dev, "%s: battery config (ctrl3) failed\n", __func__);
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
+		dev_err(dev, "%s: tamper config (ts_ctrl) failed\n", __func__);
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
+		dev_err(dev, "%s: tamper config (ctrl2) failed\n", __func__);
+		return ret;
+	}
+
+	ret = rtc_add_group(pcf2127->rtc, &pcf2127_attr_group);
+	if (ret) {
+		dev_err(dev, "%s: tamper register failed\n", __func__);
+		return ret;
+	}
+
 	return rtc_register_device(pcf2127->rtc);
 }
 
-- 
2.21.0

