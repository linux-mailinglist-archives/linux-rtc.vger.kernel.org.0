Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F7AE1F0D42
	for <lists+linux-rtc@lfdr.de>; Sun,  7 Jun 2020 19:06:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726738AbgFGRGq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 7 Jun 2020 13:06:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbgFGRGq (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 7 Jun 2020 13:06:46 -0400
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com [IPv6:2607:f8b0:4864:20::f44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1883C08C5C3
        for <linux-rtc@vger.kernel.org>; Sun,  7 Jun 2020 10:06:45 -0700 (PDT)
Received: by mail-qv1-xf44.google.com with SMTP id e20so7275688qvu.0
        for <linux-rtc@vger.kernel.org>; Sun, 07 Jun 2020 10:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2mma7YMkEbm1lyp0nNpDt+zye0QjNzRP1n9zZdT3EQg=;
        b=QdS3c87QVfoVjUqtzVwhn9WTGjCqv1hg73+8XNJkb+9Kb4iMRWPgDkPPrclCLQCM8Q
         d/3yQATlWWEwRC3trBB+zWla7/xQyMFS0rl4+JiL9ZqEDucrazx9s4lkDnaJR+zXU9u7
         41eSeP0tWD0fAJdfqKBiozLEgUt50pJX2LJ/o85A+WPf7z/GWT+ht4TyEAquORYzJgvQ
         PqQqnvQLs++DugQE2D/uK3IX8YePUwtV7qxhjOJC6mRhQRoi2+8enE32PppbHeen6jUx
         C2yg63n7M0PUqMMxGjuEPCD1M/yBCppTDXRKwO3b1ND1rd7T0/TckjqGG7AG02et6HWD
         ds7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2mma7YMkEbm1lyp0nNpDt+zye0QjNzRP1n9zZdT3EQg=;
        b=NR7vIcvLYR2yrtP/r59Ghdc7+Nx2nxwNANqmn/F/vo0DOg+NDe5ZhA+7Pq8vvUPtxk
         zAgn0/A59nFAw9tYxv1xxkBQoB5+BhXK8YulMLpogrlLtvezRvuaGe+VKRwDzULkzWvl
         GgfXbS8y7C1m4upjPexiAkEEnCb5DcxjrDjpb+aOyeotM8qiqDyPPYgGQPM+0y+nwPVc
         QyMapc9j0uXv7WieoiLrQfgzk4ptiOgWW/dl7FtXeRGH8NYeqIy1soHoAOc+DHyCW11R
         ra7/fYKZKQmlioxopcbiUeKHXclnD5UlS9/NT5ZGdhtVzKjCqbq2XxIl/QYe+lt1t7ot
         921Q==
X-Gm-Message-State: AOAM532iTYssfxF7xITeU6SlE6IAqqeJ8DlJXqMkE5oS6oJOmCKoDrEY
        jWDazWxSsygfGrOHqUv+WNlvDo6y
X-Google-Smtp-Source: ABdhPJzcHcJQpu4FtoWw9qohk9wPTpKwDPoxYLNLTufVOiJzzN7izqi23+UrsTRBoRKoCLo/xYolng==
X-Received: by 2002:ad4:5551:: with SMTP id v17mr19148960qvy.89.1591549604916;
        Sun, 07 Jun 2020 10:06:44 -0700 (PDT)
Received: from localhost.localdomain (198-48-202-89.cpe.pppoe.ca. [198.48.202.89])
        by smtp.gmail.com with ESMTPSA id p203sm5047088qke.132.2020.06.07.10.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2020 10:06:44 -0700 (PDT)
From:   liambeguin@gmail.com
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        linux-rtc@vger.kernel.org
Subject: [PATCH 2/3] rtc: pcf2127: add alarm support
Date:   Sun,  7 Jun 2020 13:06:09 -0400
Message-Id: <20200607170610.24534-3-liambeguin@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200607170610.24534-1-liambeguin@gmail.com>
References: <20200607170610.24534-1-liambeguin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Liam Beguin <lvb@xiphos.com>

From: Liam Beguin <lvb@xiphos.com>

Add alarm support for the pcf2127 RTC chip family.
Tested on pca2129.

Signed-off-by: Liam Beguin <lvb@xiphos.com>
---
 drivers/rtc/rtc-pcf2127.c | 120 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 117 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 396a1144a213..3eeb085a7c72 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -28,7 +28,9 @@
 #define PCF2127_BIT_CTRL1_TSF1			BIT(4)
 /* Control register 2 */
 #define PCF2127_REG_CTRL2		0x01
+#define PCF2127_BIT_CTRL2_AIE			BIT(1)
 #define PCF2127_BIT_CTRL2_TSIE			BIT(2)
+#define PCF2127_BIT_CTRL2_AF			BIT(4)
 #define PCF2127_BIT_CTRL2_TSF2			BIT(5)
 /* Control register 3 */
 #define PCF2127_REG_CTRL3		0x02
@@ -46,6 +48,12 @@
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
@@ -185,6 +193,107 @@ static int pcf2127_rtc_set_time(struct device *dev, struct rtc_time *tm)
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
+	ret = regmap_bulk_read(pcf2127->regmap, PCF2127_REG_ALARM_SC, buf, 5);
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
+	unsigned int ctrl2;
+	int ret;
+
+	dev_dbg(dev, "%s: %s\n", __func__, enable ? "enable" : "disable");
+
+	ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL2, &ctrl2);
+	if (ret) {
+		dev_err(dev, "%s: ctrl2 read error\n", __func__);
+		return ret;
+	}
+
+	if (enable)
+		ret = regmap_write(pcf2127->regmap, PCF2127_REG_CTRL2,
+				   ctrl2 | PCF2127_BIT_CTRL2_AIE);
+	else
+		ret = regmap_write(pcf2127->regmap, PCF2127_REG_CTRL2,
+				   ctrl2 & ~PCF2127_BIT_CTRL2_AIE);
+
+	if (ret) {
+		dev_err(dev, "%s: failed to enable alarm (%d)\n", __func__,
+			ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int pcf2127_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
+	unsigned int ctrl2;
+	uint8_t buf[5];
+	int ret;
+
+	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL2,
+				 PCF2127_BIT_CTRL2_AF,
+				 (unsigned int)~PCF2127_BIT_CTRL2_AF);
+	if (ret) {
+		dev_err(dev, "%s: failed to clear alarm interrupt flag (%d)",
+			__func__, ret);
+		return ret;
+	}
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
+	ret = regmap_bulk_write(pcf2127->regmap, PCF2127_REG_ALARM_SC, buf, 5);
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
 #ifdef CONFIG_RTC_INTF_DEV
 static int pcf2127_rtc_ioctl(struct device *dev,
 				unsigned int cmd, unsigned long arg)
@@ -211,9 +320,12 @@ static int pcf2127_rtc_ioctl(struct device *dev,
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
@@ -434,6 +546,8 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 
 	pcf2127->rtc->ops = &pcf2127_rtc_ops;
 
+	device_init_wakeup(dev, true);
+
 	pcf2127->wdd.parent = dev;
 	pcf2127->wdd.info = &pcf2127_wdt_info;
 	pcf2127->wdd.ops = &pcf2127_watchdog_ops;
-- 
2.27.0

