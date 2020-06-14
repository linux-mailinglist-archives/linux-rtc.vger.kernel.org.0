Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBE731F867C
	for <lists+linux-rtc@lfdr.de>; Sun, 14 Jun 2020 06:04:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725550AbgFNEE2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 14 Jun 2020 00:04:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725379AbgFNEE1 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 14 Jun 2020 00:04:27 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DA37C03E96F
        for <linux-rtc@vger.kernel.org>; Sat, 13 Jun 2020 21:04:26 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id g18so10162493qtu.13
        for <linux-rtc@vger.kernel.org>; Sat, 13 Jun 2020 21:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=tNbrvB7mQFTp1GhX1d/dEE8Q3PD5xMvyT3fecyE3zr8=;
        b=AuHBOb3qguZqLnjI7JQNH+EqMCfZlhbrOhgQxg6eBJUKqQ8oQrEp3geKS+JalcmL7G
         JXJiErziCiJQ9RxyyM39bL0+dY9z6GL6JFAVwJyG2weP7E8/optZJCGp4stcWVN8AGYr
         KzyaZEuy2V4Ao/M3zXIJBGfisDtEvDUwHY0Hik2MkFQK+TrKIDJIn46Q1NFeXGGpTBRP
         kfgrxctIeiFMXi0zRkr/tZpyI4VbyTXhDH2X/DcHGGsaVOzayt6flwPQlVeT4lPMyd6u
         BzyPKCTci7ZR8BMYTI8nR0KZ0QGJjUX3BPihIAjSS8tA4TwA9ycCdrp/3OyUQ3pLJ24D
         WfRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tNbrvB7mQFTp1GhX1d/dEE8Q3PD5xMvyT3fecyE3zr8=;
        b=QzfAamwmbHV4A+zvRbNA14byqqKAvzI5O0zmzVbqmwNKlVwhtuZOZEK9Xg7Y1+MR33
         NHjWh91VpKBkjA/L8gUlZUm1n9f1toR0bqE9maw6BKD4H7PPa1f1UTfubUZrH3GK2QNL
         hAYtldv0D3houAVAx/+5Vsj5Yq2oYztgmUmBqFwsItW0IFqvPqKB1VNk2S4MgkgvagZL
         srikoXfluX0ohXJX3NQGFBh1XbS5ZEwsF6zIvM7r4MbfGAXOCy97KRlGF4JC3jXXgD+q
         kHO81j3UcHuRumyaHVU+6kycf4ArL/vSCF1xTLn3OeM0WOI9KxJ4RSvRf6gIK9yK4j10
         e1ag==
X-Gm-Message-State: AOAM532qg3/7vha7Oqe/jKBVfwXKP+CJ2ABIF1NWOwK5zTs2CviyqL35
        0a70aHRB34/9h0jQ2PhD3WE=
X-Google-Smtp-Source: ABdhPJyNT3r8uY9B77XX22Q4G7vvuxw6yIJwRwTYjnLgsmVEalZLZFBjE5D+gTJr22U7Z7UXAYKbNA==
X-Received: by 2002:aed:3f25:: with SMTP id p34mr9890239qtf.92.1592107465777;
        Sat, 13 Jun 2020 21:04:25 -0700 (PDT)
Received: from atris.xiphos.ca (198-48-202-89.cpe.pppoe.ca. [198.48.202.89])
        by smtp.gmail.com with ESMTPSA id a1sm8094870qkn.87.2020.06.13.21.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 21:04:25 -0700 (PDT)
From:   Liam Beguin <liambeguin@gmail.com>
To:     bruno.thomsen@gmail.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, linux-rtc@vger.kernel.org
Subject: [PATCH v2 2/2] rtc: pcf2127: add alarm support
Date:   Sun, 14 Jun 2020 00:04:09 -0400
Message-Id: <20200614040409.30302-3-liambeguin@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614040409.30302-1-liambeguin@gmail.com>
References: <20200614040409.30302-1-liambeguin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Liam Beguin <lvb@xiphos.com>

Add alarm support for the pcf2127 RTC chip family.
Tested on pca2129.

Signed-off-by: Liam Beguin <lvb@xiphos.com>
---
Changes since v1:
- Add calls to pcf2127_wdt_active_ping after accessing CTRL2
- Cleanup calls to regmap_{read,write,update_bits}
- Cleanup debug trace
- Add interrupt handler, untested because of hardware limitations
- Add wakeup-source devicetree option

 drivers/rtc/rtc-pcf2127.c | 169 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 166 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 396a1144a213..87ecb29247c6 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -20,6 +20,7 @@
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_irq.h>
 #include <linux/regmap.h>
 #include <linux/watchdog.h>
 
@@ -28,7 +29,9 @@
 #define PCF2127_BIT_CTRL1_TSF1			BIT(4)
 /* Control register 2 */
 #define PCF2127_REG_CTRL2		0x01
+#define PCF2127_BIT_CTRL2_AIE			BIT(1)
 #define PCF2127_BIT_CTRL2_TSIE			BIT(2)
+#define PCF2127_BIT_CTRL2_AF			BIT(4)
 #define PCF2127_BIT_CTRL2_TSF2			BIT(5)
 /* Control register 3 */
 #define PCF2127_REG_CTRL3		0x02
@@ -46,6 +49,12 @@
 #define PCF2127_REG_DW			0x07
 #define PCF2127_REG_MO			0x08
 #define PCF2127_REG_YR			0x09
+/* Alarm registers */
+#define PCF2127_REG_ALARM_SC		0x0A
+#define PCF2127_REG_ALARM_MN		0x0B
+#define PCF2127_REG_ALARM_HR		0x0C
+#define PCF2127_REG_ALARM_DM		0x0D
+#define PCF2127_REG_ALARM_DW		0x0E
 /* Watchdog registers */
 #define PCF2127_REG_WD_CTL		0x10
 #define PCF2127_BIT_WD_CTL_TF0			BIT(0)
@@ -79,6 +88,8 @@
 #define PCF2127_WD_VAL_MAX		255
 #define PCF2127_WD_VAL_DEFAULT		60
 
+static int pcf2127_wdt_active_ping(struct watchdog_device *wdd);
+
 struct pcf2127 {
 	struct rtc_device *rtc;
 	struct watchdog_device wdd;
@@ -185,6 +196,140 @@ static int pcf2127_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	return 0;
 }
 
+static int pcf2127_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
+	unsigned int buf[5], ctrl2;
+	int ret;
+
+	ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL2, &ctrl2);
+	if (ret) {
+		dev_err(dev, "%s: ctrl2 read error\n", __func__);
+		return ret;
+	}
+
+	ret = pcf2127_wdt_active_ping(&pcf2127->wdd);
+	if (ret)
+		return ret;
+
+	ret = regmap_bulk_read(pcf2127->regmap, PCF2127_REG_ALARM_SC, buf,
+			       sizeof(buf));
+	if (ret) {
+		dev_err(dev, "%s: alarm read error\n", __func__);
+		return ret;
+	}
+
+	alrm->enabled = ctrl2 & PCF2127_BIT_CTRL2_AIE;
+	alrm->pending = ctrl2 & PCF2127_BIT_CTRL2_AF;
+
+	alrm->time.tm_sec = bcd2bin(buf[0] & 0x7F);
+	alrm->time.tm_min = bcd2bin(buf[1] & 0x7F);
+	alrm->time.tm_hour = bcd2bin(buf[2] & 0x3F);
+	alrm->time.tm_mday = bcd2bin(buf[3] & 0x3F);
+	alrm->time.tm_wday = buf[4] & 0x07;
+
+	dev_dbg(dev, "%s: alarm is %d:%d:%d, mday=%d, wday=%d\n", __func__,
+		alrm->time.tm_hour, alrm->time.tm_min, alrm->time.tm_sec,
+		alrm->time.tm_mday, alrm->time.tm_wday);
+
+	return 0;
+}
+
+static int pcf2127_rtc_alarm_irq_enable(struct device *dev, u32 enable)
+{
+	struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
+	int ret;
+
+	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL2,
+				 PCF2127_BIT_CTRL2_AIE,
+				 enable ? PCF2127_BIT_CTRL2_AIE : 0);
+	if (ret) {
+		dev_err(dev, "%s: failed to %s alarm (%d)\n", __func__,
+			enable ? "enable" : "disable",
+			ret);
+		return ret;
+	}
+
+	ret = pcf2127_wdt_active_ping(&pcf2127->wdd);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int pcf2127_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
+	uint8_t buf[5];
+	int ret;
+
+	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL2,
+				 PCF2127_BIT_CTRL2_AF, 0);
+	if (ret) {
+		dev_err(dev, "%s: failed to clear alarm interrupt flag (%d)",
+			__func__, ret);
+		return ret;
+	}
+
+	ret = pcf2127_wdt_active_ping(&pcf2127->wdd);
+	if (ret)
+		return ret;
+
+	buf[0] = bin2bcd(alrm->time.tm_sec);
+	buf[1] = bin2bcd(alrm->time.tm_min);
+	buf[2] = bin2bcd(alrm->time.tm_hour);
+	buf[3] = bin2bcd(alrm->time.tm_mday);
+	buf[4] = (alrm->time.tm_wday & 0x07);
+
+	dev_dbg(dev, "%s: alarm set for: %d:%d:%d, mday=%d, wday=%d\n",
+		__func__, alrm->time.tm_hour, alrm->time.tm_min,
+		alrm->time.tm_sec, alrm->time.tm_mday, alrm->time.tm_wday);
+
+	ret = regmap_bulk_write(pcf2127->regmap, PCF2127_REG_ALARM_SC, buf,
+				sizeof(buf));
+	if (ret) {
+		dev_err(dev, "%s: failed to write alarm registers (%d)",
+			__func__, ret);
+		return ret;
+	}
+
+	pcf2127_rtc_alarm_irq_enable(dev, alrm->enabled);
+
+	return 0;
+}
+
+static irqreturn_t pcf2127_rtc_irq(int irq, void *dev)
+{
+	struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
+	unsigned int ctrl2 = 0;
+	int ret = 0;
+
+	ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL2, &ctrl2);
+	if (ret) {
+		dev_err(dev, "%s: ctrl2 read error (%d)\n", __func__, ret);
+		goto irq_err;
+	}
+
+	ret = pcf2127_wdt_active_ping(&pcf2127->wdd);
+	if (ret)
+		goto irq_err;
+
+	if (ctrl2 & PCF2127_BIT_CTRL2_AF) {
+		regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL2,
+				   PCF2127_BIT_CTRL2_AF, 0);
+
+		ret = pcf2127_wdt_active_ping(&pcf2127->wdd);
+		if (ret)
+			goto irq_err;
+
+		rtc_update_irq(pcf2127->rtc, 1, RTC_IRQF | RTC_AF);
+	}
+
+	return IRQ_HANDLED;
+irq_err:
+	return IRQ_NONE;
+}
+
 #ifdef CONFIG_RTC_INTF_DEV
 static int pcf2127_rtc_ioctl(struct device *dev,
 				unsigned int cmd, unsigned long arg)
@@ -211,9 +356,12 @@ static int pcf2127_rtc_ioctl(struct device *dev,
 #endif
 
 static const struct rtc_class_ops pcf2127_rtc_ops = {
-	.ioctl		= pcf2127_rtc_ioctl,
-	.read_time	= pcf2127_rtc_read_time,
-	.set_time	= pcf2127_rtc_set_time,
+	.ioctl            = pcf2127_rtc_ioctl,
+	.read_time        = pcf2127_rtc_read_time,
+	.set_time         = pcf2127_rtc_set_time,
+	.read_alarm       = pcf2127_rtc_read_alarm,
+	.set_alarm        = pcf2127_rtc_set_alarm,
+	.alarm_irq_enable = pcf2127_rtc_alarm_irq_enable,
 };
 
 static int pcf2127_nvmem_read(void *priv, unsigned int offset,
@@ -415,6 +563,7 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 			const char *name, bool has_nvmem)
 {
 	struct pcf2127 *pcf2127;
+	int alarm_irq = 0;
 	u32 wdd_timeout;
 	int ret = 0;
 
@@ -434,6 +583,20 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 
 	pcf2127->rtc->ops = &pcf2127_rtc_ops;
 
+	alarm_irq = of_irq_get_byname(dev->of_node, "alarm");
+	if (alarm_irq >= 0) {
+		ret = devm_request_irq(dev, alarm_irq, pcf2127_rtc_irq,
+				       IRQF_TRIGGER_LOW | IRQF_ONESHOT,
+				       dev_name(dev), dev);
+		if (ret) {
+			dev_err(dev, "failed to request alarm irq\n");
+			return ret;
+		}
+	}
+
+	if (alarm_irq >= 0 || device_property_read_bool(dev, "wakeup-source"))
+		device_init_wakeup(dev, true);
+
 	pcf2127->wdd.parent = dev;
 	pcf2127->wdd.info = &pcf2127_wdt_info;
 	pcf2127->wdd.ops = &pcf2127_watchdog_ops;
-- 
2.27.0

