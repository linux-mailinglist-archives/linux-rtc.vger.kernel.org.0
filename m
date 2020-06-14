Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8CA41F867A
	for <lists+linux-rtc@lfdr.de>; Sun, 14 Jun 2020 06:04:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725385AbgFNEEZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 14 Jun 2020 00:04:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbgFNEEY (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 14 Jun 2020 00:04:24 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92633C03E96F
        for <linux-rtc@vger.kernel.org>; Sat, 13 Jun 2020 21:04:24 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id w9so10189485qtv.3
        for <linux-rtc@vger.kernel.org>; Sat, 13 Jun 2020 21:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iBF4SRmiBweG+X+Pe5LiUxcDozMQKtnkd1Q9aEDUm4E=;
        b=uh8naTYulZjI4f+EGO8U9+fHi4tj8sDMZh9imghR+VA3GjHxA0jKwu1GYvJwYpxiXC
         O1kr8NHLHtyAUObSpAVOR4bxm/SbbRjOSoNQEauuY9mJcQlotdg0Ey/Ai3/2YagfYjui
         iNHUmEvH7b/8rS9mjNBfuUVP3FvZCEYO5k+/AdV0+ch4Om7f/dQIOqzl62B/dHK02fYg
         kVoJCtApxaXMPOgmcKcV6NQm/uO3P8nF1eSYbz14HfjxzhkH+BSr+FBZBKZFL3uBR2JU
         I5QVCtaWLiiAvL6fyDW0+lgJFi0tQNe90ufsItyqOvU9FXuZYMO3pfmm+NmHPLh7XkVr
         iZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iBF4SRmiBweG+X+Pe5LiUxcDozMQKtnkd1Q9aEDUm4E=;
        b=t6Wef0731DKrAIUOXiYjo9sBb6hUNfmU/FSB3eXdmO4tPwOf1HSfUhGRqlT7Q0OhB6
         VnxIeQIbmy7X8F39uzoCjzKHomM45Um+e3ndmimkvSKSdB91mNdDdjsL/t3DPemkfDwB
         TYgYz9urHzgKNmXMV5rZld6RfpCjAevcquQ7O9UxeG5YSC6tXPoZyUAmj8yVRzYa/HVV
         A9MX6fG54O733QocNcso/gmcOw68O5GLjBn6LQ92h6PvZVw4psejPQkXsWFcyUyDLsK+
         ZaEzetEcmbre6FYYPgOmrHaGL2EJDbJLdcaAQ/LayCENZQSJf3n4HS+5RQj6m7LzVhgC
         +hmQ==
X-Gm-Message-State: AOAM531dddLKROvacqnhWPRhN1pVxfHrrm2ouLijy6JQJtWRkrkaUXRF
        BcCMyHwGw42uj/lXbeMwfySomEiG
X-Google-Smtp-Source: ABdhPJxWQt4f8ebvtWi1WNRFx34kuXNJDneiq5gUys9KAyc/Tx3dSRcqaEKL0ol1Onwq6SqTZ6zxJA==
X-Received: by 2002:ac8:339c:: with SMTP id c28mr10594148qtb.9.1592107463473;
        Sat, 13 Jun 2020 21:04:23 -0700 (PDT)
Received: from atris.xiphos.ca (198-48-202-89.cpe.pppoe.ca. [198.48.202.89])
        by smtp.gmail.com with ESMTPSA id a1sm8094870qkn.87.2020.06.13.21.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 21:04:22 -0700 (PDT)
From:   Liam Beguin <liambeguin@gmail.com>
To:     bruno.thomsen@gmail.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, linux-rtc@vger.kernel.org
Subject: [PATCH v2 0/2] rtc: pcf2127: add alarm support
Date:   Sun, 14 Jun 2020 00:04:07 -0400
Message-Id: <20200614040409.30302-1-liambeguin@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The board used to test this series has the interrupt line of the RTC
connected to a circuit controlling the power of the board.
An event on the interrupt line while the board is off will power it on.
Because of these hardware limitations, the irq handler added in this
patch wasn't fully tested.

The alarm fuctionality was tested on a PCA2129, with:

	$ date "2010-10-10 10:10"
	Sun Oct 10 10:10:00 UTC 2010
	$ /usr/sbin/rtcwake -u -d /dev/rtc0  -s10 --mode off
	[ ... ]
	$ # power on after 10 seconds

Changes since v1:
- Document new compatible string for the pca2129
- Add calls to pcf2127_wdt_active_ping after accessing CTRL2
- Use sizeof(buf) instead of hadcoding value
- Cleanup debug trace
- Add interrupt handler and wakeup-source devicetree option

Liam Beguin (2):
  rtc: pcf2127: add pca2129 device id
  rtc: pcf2127: add alarm support

 .../devicetree/bindings/rtc/trivial-rtc.yaml  |   2 +
 drivers/rtc/rtc-pcf2127.c                     | 172 +++++++++++++++++-
 2 files changed, 171 insertions(+), 3 deletions(-)

Interdiff against v1:
diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
index 18cb456752f6..c7d14de214c4 100644
--- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
@@ -52,6 +52,8 @@ properties:
       - nxp,pcf2127
       # Real-time clock
       - nxp,pcf2129
+      # Real-time clock
+      - nxp,pca2129
       # Real-time Clock Module
       - pericom,pt7c4338
       # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index f004a4030970..87ecb29247c6 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -20,6 +20,7 @@
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_irq.h>
 #include <linux/regmap.h>
 #include <linux/watchdog.h>
 
@@ -87,6 +88,8 @@
 #define PCF2127_WD_VAL_MAX		255
 #define PCF2127_WD_VAL_DEFAULT		60
 
+static int pcf2127_wdt_active_ping(struct watchdog_device *wdd);
+
 struct pcf2127 {
 	struct rtc_device *rtc;
 	struct watchdog_device wdd;
@@ -204,7 +207,13 @@ static int pcf2127_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 		dev_err(dev, "%s: ctrl2 read error\n", __func__);
 		return ret;
 	}
-	ret = regmap_bulk_read(pcf2127->regmap, PCF2127_REG_ALARM_SC, buf, 5);
+
+	ret = pcf2127_wdt_active_ping(&pcf2127->wdd);
+	if (ret)
+		return ret;
+
+	ret = regmap_bulk_read(pcf2127->regmap, PCF2127_REG_ALARM_SC, buf,
+			       sizeof(buf));
 	if (ret) {
 		dev_err(dev, "%s: alarm read error\n", __func__);
 		return ret;
@@ -229,29 +238,21 @@ static int pcf2127_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 static int pcf2127_rtc_alarm_irq_enable(struct device *dev, u32 enable)
 {
 	struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
-	unsigned int ctrl2;
 	int ret;
 
-	dev_dbg(dev, "%s: %s\n", __func__, enable ? "enable" : "disable");
-
-	ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL2, &ctrl2);
+	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL2,
+				 PCF2127_BIT_CTRL2_AIE,
+				 enable ? PCF2127_BIT_CTRL2_AIE : 0);
 	if (ret) {
-		dev_err(dev, "%s: ctrl2 read error\n", __func__);
+		dev_err(dev, "%s: failed to %s alarm (%d)\n", __func__,
+			enable ? "enable" : "disable",
+			ret);
 		return ret;
 	}
 
-	if (enable)
-		ret = regmap_write(pcf2127->regmap, PCF2127_REG_CTRL2,
-				   ctrl2 | PCF2127_BIT_CTRL2_AIE);
-	else
-		ret = regmap_write(pcf2127->regmap, PCF2127_REG_CTRL2,
-				   ctrl2 & ~PCF2127_BIT_CTRL2_AIE);
-
-	if (ret) {
-		dev_err(dev, "%s: failed to enable alarm (%d)\n", __func__,
-			ret);
+	ret = pcf2127_wdt_active_ping(&pcf2127->wdd);
+	if (ret)
 		return ret;
-	}
 
 	return 0;
 }
@@ -259,19 +260,21 @@ static int pcf2127_rtc_alarm_irq_enable(struct device *dev, u32 enable)
 static int pcf2127_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 {
 	struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
-	unsigned int ctrl2;
 	uint8_t buf[5];
 	int ret;
 
 	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL2,
-				 PCF2127_BIT_CTRL2_AF,
-				 (unsigned int)~PCF2127_BIT_CTRL2_AF);
+				 PCF2127_BIT_CTRL2_AF, 0);
 	if (ret) {
 		dev_err(dev, "%s: failed to clear alarm interrupt flag (%d)",
 			__func__, ret);
 		return ret;
 	}
 
+	ret = pcf2127_wdt_active_ping(&pcf2127->wdd);
+	if (ret)
+		return ret;
+
 	buf[0] = bin2bcd(alrm->time.tm_sec);
 	buf[1] = bin2bcd(alrm->time.tm_min);
 	buf[2] = bin2bcd(alrm->time.tm_hour);
@@ -282,7 +285,8 @@ static int pcf2127_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 		__func__, alrm->time.tm_hour, alrm->time.tm_min,
 		alrm->time.tm_sec, alrm->time.tm_mday, alrm->time.tm_wday);
 
-	ret = regmap_bulk_write(pcf2127->regmap, PCF2127_REG_ALARM_SC, buf, 5);
+	ret = regmap_bulk_write(pcf2127->regmap, PCF2127_REG_ALARM_SC, buf,
+				sizeof(buf));
 	if (ret) {
 		dev_err(dev, "%s: failed to write alarm registers (%d)",
 			__func__, ret);
@@ -294,6 +298,38 @@ static int pcf2127_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	return 0;
 }
 
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
@@ -527,6 +563,7 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 			const char *name, bool has_nvmem)
 {
 	struct pcf2127 *pcf2127;
+	int alarm_irq = 0;
 	u32 wdd_timeout;
 	int ret = 0;
 
@@ -546,15 +583,19 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 
 	pcf2127->rtc->ops = &pcf2127_rtc_ops;
 
-	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL2,
-				 PCF2127_BIT_CTRL2_AIE, 0);
-	if (ret) {
-		dev_err(dev, "%s: failed to clear interrupt enable bit (%d)",
-			__func__, ret);
-		return ret;
+	alarm_irq = of_irq_get_byname(dev->of_node, "alarm");
+	if (alarm_irq >= 0) {
+		ret = devm_request_irq(dev, alarm_irq, pcf2127_rtc_irq,
+				       IRQF_TRIGGER_LOW | IRQF_ONESHOT,
+				       dev_name(dev), dev);
+		if (ret) {
+			dev_err(dev, "failed to request alarm irq\n");
+			return ret;
+		}
 	}
 
-	device_init_wakeup(dev, true);
+	if (alarm_irq >= 0 || device_property_read_bool(dev, "wakeup-source"))
+		device_init_wakeup(dev, true);
 
 	pcf2127->wdd.parent = dev;
 	pcf2127->wdd.info = &pcf2127_wdt_info;

base-commit: aaa2faab4ed8e5fe0111e04d6e168c028fe2987f
-- 
2.27.0

