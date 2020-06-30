Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 716A720EB88
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Jun 2020 04:42:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728634AbgF3Cm4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 29 Jun 2020 22:42:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbgF3Cm4 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 29 Jun 2020 22:42:56 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 042E4C061755
        for <linux-rtc@vger.kernel.org>; Mon, 29 Jun 2020 19:42:56 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id v19so14495705qtq.10
        for <linux-rtc@vger.kernel.org>; Mon, 29 Jun 2020 19:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hGU4pHFXZ7A+mVkdty66FwWa1uMudVTeioHLvhdTon4=;
        b=hAZ5SA5J/hEbk58UTAWyV8VjIc/3j49JA83+hs4YDjcT6JlLt0JiryvI1788BNkwgP
         +YVGRB/Jp34RwQTmLSxUva3HGizkAE5ER2a74GXM/9XQ2KgWSZLESxA9+lmLmsTkUj1j
         MSDyTBkOBswTzjkkNPAK7Nw2oYwzI2tsvzztMfkaOCB/9s4k3sHdJmfRQuNeXkKI9XF6
         JE31fG9CcULrjpHUfxHte8Q8mKhQmvg+H3ofRlzmK3+r051Y5AyoZIy/Xdu4Qzy6U6zm
         RWI3/3XoiaVbbqjwn8CZENWhcVOrrAlJd5wa17zMEKPCCNC4DP+1+jUq+cx1RT9c6LLH
         X41Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hGU4pHFXZ7A+mVkdty66FwWa1uMudVTeioHLvhdTon4=;
        b=mZIQwU+FB+uKJzuuoAETdlwasStCHhzvbhGqI/AdzrXUmk35Aa9e760Dgac1cHqR1/
         m63Zdl73iItg3xH4N025+sBA3lM2WVdWDsfQdDef/pyNOHF9UkisEWK3+ylVaVvmRjzT
         PUrU+MfG5Z25V7q/xsyYhvVS4D8UCKRvbvggFVQyletZ3r+f8jeSmetpbZenIXPQf21o
         ulVFP8jHczqn/fHUJTCt9Xxw//V3gDVpC7wPoQoeDmW2nsjn7LrwIgII5CiQ6hE55JRd
         6ehBtFG/6NwZ8tm9JZQ8CDtYvgG8AB5DjTAfQh+w5g5xLbqXFkBP6kspfaZ8o0RwjHYl
         lW0Q==
X-Gm-Message-State: AOAM533eXKTXogLjboBRwvPftpEXUgsQE8mDJ07aYGkUFcHdysfsWiWz
        4Zrd9dBzqs8kpoDnThsobjU=
X-Google-Smtp-Source: ABdhPJyUoLsq05PVSX9BaWo7qDxrbahVWJB49sPLdH/3NfCU64w2exiv6uYA4DSQMTTiEsjkayMLOA==
X-Received: by 2002:ac8:36ad:: with SMTP id a42mr19462518qtc.21.1593484975205;
        Mon, 29 Jun 2020 19:42:55 -0700 (PDT)
Received: from localhost.localdomain (198-48-202-89.cpe.pppoe.ca. [198.48.202.89])
        by smtp.gmail.com with ESMTPSA id p66sm1911185qkf.58.2020.06.29.19.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 19:42:54 -0700 (PDT)
From:   Liam Beguin <liambeguin@gmail.com>
To:     bruno.thomsen@gmail.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org
Subject: [PATCH v4 2/2] rtc: pcf2127: add alarm support
Date:   Mon, 29 Jun 2020 22:42:11 -0400
Message-Id: <20200630024211.12782-3-liambeguin@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200630024211.12782-1-liambeguin@gmail.com>
References: <20200630024211.12782-1-liambeguin@gmail.com>
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
Reviewed-by: Bruno Thomsen <bruno.thomsen@gmail.com>
---
Changes since v1:
- Add calls to pcf2127_wdt_active_ping after accessing CTRL2
- Cleanup calls to regmap_{read,write,update_bits}
- Cleanup debug trace
- Add interrupt handler, untested because of hardware limitations
- Add wakeup-source devicetree option

Changes since v2:
- Avoid forward declaration of pcf2127_wdt_active_ping
- Remove dev_err strings
- Remove dev_dbg traces since they are now part of the core
- Remove redundant if in pcf2127_rtc_alarm_irq_enable
- Remove duplicate watchdog ping in pcf2127_rtc_irq
- Avoid unnecessary read in pcf2127_rtc_irq with regmap_write
- Add extra rtc_class_ops struct with alarm functions

Changes since v3:
- Replace "goto irq_err" with "return IRQ_NONE" in interrupt handler
- Add Reviewed-by trailer

 drivers/rtc/rtc-pcf2127.c | 134 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 134 insertions(+)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 4accee09bfad..4e99c45a87d7 100644
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
@@ -324,6 +333,114 @@ static const struct watchdog_ops pcf2127_watchdog_ops = {
 	.set_timeout = pcf2127_wdt_set_timeout,
 };
 
+/* Alarm */
+static int pcf2127_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
+	unsigned int buf[5], ctrl2;
+	int ret;
+
+	ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL2, &ctrl2);
+	if (ret)
+		return ret;
+
+	ret = pcf2127_wdt_active_ping(&pcf2127->wdd);
+	if (ret)
+		return ret;
+
+	ret = regmap_bulk_read(pcf2127->regmap, PCF2127_REG_ALARM_SC, buf,
+			       sizeof(buf));
+	if (ret)
+		return ret;
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
+	if (ret)
+		return ret;
+
+	return pcf2127_wdt_active_ping(&pcf2127->wdd);
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
+	if (ret)
+		return ret;
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
+	ret = regmap_bulk_write(pcf2127->regmap, PCF2127_REG_ALARM_SC, buf,
+				sizeof(buf));
+	if (ret)
+		return ret;
+
+	return pcf2127_rtc_alarm_irq_enable(dev, alrm->enabled);
+}
+
+static irqreturn_t pcf2127_rtc_irq(int irq, void *dev)
+{
+	struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
+	unsigned int ctrl2 = 0;
+	int ret = 0;
+
+	ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL2, &ctrl2);
+	if (ret)
+		return IRQ_NONE;
+
+	if (ctrl2 & PCF2127_BIT_CTRL2_AF) {
+		regmap_write(pcf2127->regmap, PCF2127_REG_CTRL2,
+			     ctrl2 & ~PCF2127_BIT_CTRL2_AF);
+
+		rtc_update_irq(pcf2127->rtc, 1, RTC_IRQF | RTC_AF);
+	}
+
+	ret = pcf2127_wdt_active_ping(&pcf2127->wdd);
+	if (ret)
+		return IRQ_NONE;
+
+	return IRQ_HANDLED;
+}
+
+static const struct rtc_class_ops pcf2127_rtc_alrm_ops = {
+	.ioctl            = pcf2127_rtc_ioctl,
+	.read_time        = pcf2127_rtc_read_time,
+	.set_time         = pcf2127_rtc_set_time,
+	.read_alarm       = pcf2127_rtc_read_alarm,
+	.set_alarm        = pcf2127_rtc_set_alarm,
+	.alarm_irq_enable = pcf2127_rtc_alarm_irq_enable,
+};
+
 /* sysfs interface */
 
 static ssize_t timestamp0_store(struct device *dev,
@@ -419,6 +536,7 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 			const char *name, bool has_nvmem)
 {
 	struct pcf2127 *pcf2127;
+	int alarm_irq = 0;
 	u32 wdd_timeout;
 	int ret = 0;
 
@@ -441,6 +559,22 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 	pcf2127->rtc->range_max = RTC_TIMESTAMP_END_2099;
 	pcf2127->rtc->set_start_time = true; /* Sets actual start to 1970 */
 
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
+	if (alarm_irq >= 0 || device_property_read_bool(dev, "wakeup-source")) {
+		device_init_wakeup(dev, true);
+		pcf2127->rtc->ops = &pcf2127_rtc_alrm_ops;
+	}
+
 	pcf2127->wdd.parent = dev;
 	pcf2127->wdd.info = &pcf2127_wdt_info;
 	pcf2127->wdd.ops = &pcf2127_watchdog_ops;
-- 
2.27.0

