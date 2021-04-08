Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 487B7357A7B
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Apr 2021 04:40:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbhDHCkx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 7 Apr 2021 22:40:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbhDHCkv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 7 Apr 2021 22:40:51 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3385BC061761
        for <linux-rtc@vger.kernel.org>; Wed,  7 Apr 2021 19:40:40 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id x9so353604qto.8
        for <linux-rtc@vger.kernel.org>; Wed, 07 Apr 2021 19:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a8H2er2hoE6OOaPTRGgvr+9HfPOXdtcl19DMyXTtMiw=;
        b=jNUL3xCu1si/pCkWllw/O4OEC4fb3IKNGXmt1stE40JTuFEyrwTNy+oKe6o/68Htph
         sBgprbD8q+ZQJboBM33k1ISvYnlagdBDyPjmRabb2ti3qZZW6KsBIqSJTmGvC+Kv6Vmg
         PTALBnhMzbQzQ2mW3WAaOBey86t099DqmekJ2hYlcy5HsQ8VV94Jjs8T45hfO813FucR
         5p2Ehob360L9SE3aDgaCHYPKVLZF8TfRbPTZt4qAhxC+PYolWpnF4cZEa+qSSRxex/uN
         CIXIq//LQIxdMqQnI3ZliLMwA236HmHR/GMrqQbUHH3jldQAMAk+w0BbJGJbwfiWztC3
         NTcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a8H2er2hoE6OOaPTRGgvr+9HfPOXdtcl19DMyXTtMiw=;
        b=kyxTNxBjywftlzyhFnjyABeSIr8SqD5U76M/bT4AQT/SI5sEjm2bgJoL7xW+VTL2O8
         sjnEzJ3gsXSQ2jRtbuaKsk+iLmnvkgGdYEVp8IScOJ3kmSe4ZLbUwhQRyQO3LsGsyFnQ
         DSuzibIhJYqN4miHwHNIzIFx079cnC5jUXiLALKg+Vbk4gQ9vU4PQIYORr+LlZnEU6ex
         fto2XuLbw0YqHNlYbmRPEVjUg4oOPheoUKyWgeDzR58xlGensb7CUBlyHX2O5kyDBrih
         RtdBr3fMSj13Z1nnIg2nxlT5B1LWChVUt0wsIhfNtM7UbghPzbhG33c6L1OhmDK75NgR
         6Ksw==
X-Gm-Message-State: AOAM533MUYhpbV2HIUg5xcDwNp/JB0Q2P9OfKHcBdIrycJxLJ3z3ZFnn
        fgXnCuYIzr8BvyFBWnHJZeM=
X-Google-Smtp-Source: ABdhPJwNPiYXP0IIvydV7SUpsXoBUdauTqwyX8gS4J1YFnm5pWEA3SM5239n3dGiUB4NGOHNkbWEwg==
X-Received: by 2002:ac8:5cd2:: with SMTP id s18mr5616668qta.202.1617849639482;
        Wed, 07 Apr 2021 19:40:39 -0700 (PDT)
Received: from shaak.xiphos.ca (198-48-202-89.cpe.pppoe.ca. [198.48.202.89])
        by smtp.gmail.com with ESMTPSA id v128sm20102383qkc.127.2021.04.07.19.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 19:40:39 -0700 (PDT)
From:   Liam Beguin <liambeguin@gmail.com>
To:     liambeguin@gmail.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, panfilov.artyom@gmail.com
Cc:     linux-rtc@vger.kernel.org
Subject: [PATCH v2 2/3] rtc: ab-eoz9: add alarm support
Date:   Wed,  7 Apr 2021 22:40:27 -0400
Message-Id: <20210408024028.3526564-3-liambeguin@gmail.com>
X-Mailer: git-send-email 2.30.1.489.g328c10930387
In-Reply-To: <20210408024028.3526564-1-liambeguin@gmail.com>
References: <20210408024028.3526564-1-liambeguin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Liam Beguin <lvb@xiphos.com>

Add alarm support for the rtc-ab-eoz9.

Signed-off-by: Liam Beguin <lvb@xiphos.com>
---
 drivers/rtc/rtc-ab-eoz9.c | 136 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/drivers/rtc/rtc-ab-eoz9.c b/drivers/rtc/rtc-ab-eoz9.c
index dee17a76a72b..7dc96fabc76f 100644
--- a/drivers/rtc/rtc-ab-eoz9.c
+++ b/drivers/rtc/rtc-ab-eoz9.c
@@ -11,6 +11,7 @@
 #include <linux/bcd.h>
 #include <linux/of.h>
 #include <linux/regmap.h>
+#include <linux/bitfield.h>
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
 
@@ -57,6 +58,24 @@
 
 #define ABEOZ9_SEC_LEN			7
 
+#define ABEOZ9_REG_ALARM_SEC		0x10
+#define ABEOZ9_BIT_ALARM_SEC		GENMASK(6, 0)
+#define ABEOZ9_REG_ALARM_MIN		0x11
+#define ABEOZ9_BIT_ALARM_MIN		GENMASK(6, 0)
+#define ABEOZ9_REG_ALARM_HOURS		0x12
+#define ABEOZ9_BIT_ALARM_HOURS_PM	BIT(5)
+#define ABEOZ9_BIT_ALARM_HOURS		GENMASK(4, 0)
+#define ABEOZ9_REG_ALARM_DAYS		0x13
+#define ABEOZ9_BIT_ALARM_DAYS		GENMASK(5, 0)
+#define ABEOZ9_REG_ALARM_WEEKDAYS	0x14
+#define ABEOZ9_BIT_ALARM_WEEKDAYS	GENMASK(2, 0)
+#define ABEOZ9_REG_ALARM_MONTHS		0x15
+#define ABEOZ9_BIT_ALARM_MONTHS		GENMASK(4, 0)
+#define ABEOZ9_REG_ALARM_YEARS		0x16
+
+#define ABEOZ9_ALARM_LEN		7
+#define ABEOZ9_BIT_ALARM_AE		BIT(7)
+
 #define ABEOZ9_REG_REG_TEMP		0x20
 #define ABEOZ953_TEMP_MAX		120
 #define ABEOZ953_TEMP_MIN		-60
@@ -186,6 +205,98 @@ static int abeoz9_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	return abeoz9_reset_validity(regmap);
 }
 
+static int abeoz9_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
+{
+	struct abeoz9_rtc_data *data = dev_get_drvdata(dev);
+	struct regmap *regmap = data->regmap;
+	u8 regs[ABEOZ9_ALARM_LEN];
+	u8 val[2];
+	int ret;
+
+	ret = abeoz9_check_validity(dev);
+	if (ret)
+		return ret;
+
+	ret = regmap_bulk_read(regmap, ABEOZ9_REG_CTRL_INT, val, sizeof(val));
+	if (ret)
+		return ret;
+
+	alarm->enabled = val[0] & ABEOZ9_REG_CTRL_INT_AIE;
+	alarm->pending = val[1] & ABEOZ9_REG_CTRL_INT_FLAG_AF;
+
+	ret = regmap_bulk_read(regmap, ABEOZ9_REG_ALARM_SEC, regs, sizeof(regs));
+	if (ret)
+		return ret;
+
+	alarm->time.tm_sec = bcd2bin(FIELD_GET(ABEOZ9_BIT_ALARM_SEC, regs[0]));
+	alarm->time.tm_min = bcd2bin(FIELD_GET(ABEOZ9_BIT_ALARM_MIN, regs[1]));
+	alarm->time.tm_hour = bcd2bin(FIELD_GET(ABEOZ9_BIT_ALARM_HOURS, regs[2]));
+	if (FIELD_GET(ABEOZ9_BIT_ALARM_HOURS_PM, regs[2]))
+		alarm->time.tm_hour += 12;
+
+	alarm->time.tm_mday = bcd2bin(FIELD_GET(ABEOZ9_BIT_ALARM_DAYS, regs[3]));
+
+	return 0;
+}
+
+static int abeoz9_rtc_alarm_irq_enable(struct device *dev, u32 enable)
+{
+	struct abeoz9_rtc_data *data = dev_get_drvdata(dev);
+
+	return regmap_update_bits(data->regmap, ABEOZ9_REG_CTRL_INT,
+				  ABEOZ9_REG_CTRL_INT_AIE,
+				  FIELD_PREP(ABEOZ9_REG_CTRL_INT_AIE, enable));
+}
+
+static int abeoz9_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
+{
+	struct abeoz9_rtc_data *data = dev_get_drvdata(dev);
+	u8 regs[ABEOZ9_ALARM_LEN] = {0};
+	int ret;
+
+	ret = regmap_update_bits(data->regmap, ABEOZ9_REG_CTRL_INT_FLAG,
+				 ABEOZ9_REG_CTRL_INT_FLAG_AF, 0);
+	if (ret)
+		return ret;
+
+	regs[0] = ABEOZ9_BIT_ALARM_AE | FIELD_PREP(ABEOZ9_BIT_ALARM_SEC,
+						   bin2bcd(alarm->time.tm_sec));
+	regs[1] = ABEOZ9_BIT_ALARM_AE | FIELD_PREP(ABEOZ9_BIT_ALARM_MIN,
+						   bin2bcd(alarm->time.tm_min));
+	regs[2] = ABEOZ9_BIT_ALARM_AE | FIELD_PREP(ABEOZ9_BIT_ALARM_HOURS,
+						   bin2bcd(alarm->time.tm_hour));
+	regs[3] = ABEOZ9_BIT_ALARM_AE | FIELD_PREP(ABEOZ9_BIT_ALARM_DAYS,
+						   bin2bcd(alarm->time.tm_mday));
+
+	ret = regmap_bulk_write(data->regmap, ABEOZ9_REG_ALARM_SEC, regs,
+				sizeof(regs));
+	if (ret)
+		return ret;
+
+	return abeoz9_rtc_alarm_irq_enable(dev, alarm->enabled);
+}
+
+static irqreturn_t abeoz9_rtc_irq(int irq, void *dev)
+{
+	struct abeoz9_rtc_data *data = dev_get_drvdata(dev);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(data->regmap, ABEOZ9_REG_CTRL_INT_FLAG, &val);
+	if (ret)
+		return IRQ_NONE;
+
+	if (!FIELD_GET(ABEOZ9_REG_CTRL_INT_FLAG_AF, val))
+		return IRQ_NONE;
+
+	regmap_update_bits(data->regmap, ABEOZ9_REG_CTRL_INT_FLAG,
+			   ABEOZ9_REG_CTRL_INT_FLAG_AF, 0);
+
+	rtc_update_irq(data->rtc, 1, RTC_IRQF | RTC_AF);
+
+	return IRQ_HANDLED;
+}
+
 static int abeoz9_trickle_parse_dt(struct device_node *node)
 {
 	u32 ohms = 0;
@@ -261,6 +372,14 @@ static const struct rtc_class_ops rtc_ops = {
 	.set_time  = abeoz9_rtc_set_time,
 };
 
+static const struct rtc_class_ops rtc_alarm_ops = {
+	.read_time = abeoz9_rtc_get_time,
+	.set_time = abeoz9_rtc_set_time,
+	.read_alarm = abeoz9_rtc_read_alarm,
+	.set_alarm = abeoz9_rtc_set_alarm,
+	.alarm_irq_enable = abeoz9_rtc_alarm_irq_enable,
+};
+
 static const struct regmap_config abeoz9_rtc_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
@@ -420,6 +539,23 @@ static int abeoz9_probe(struct i2c_client *client,
 	data->rtc->ops = &rtc_ops;
 	data->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
 	data->rtc->range_max = RTC_TIMESTAMP_END_2099;
+	data->rtc->uie_unsupported = 1;
+
+	if (client->irq > 0) {
+		ret = devm_request_threaded_irq(dev, client->irq, NULL,
+						abeoz9_rtc_irq,
+						IRQF_TRIGGER_LOW | IRQF_ONESHOT,
+						dev_name(dev), dev);
+		if (ret) {
+			dev_err(dev, "failed to request alarm irq\n");
+			return ret;
+		}
+	}
+
+	if (client->irq > 0 || device_property_read_bool(dev, "wakeup-source")) {
+		ret = device_init_wakeup(dev, true);
+		data->rtc->ops = &rtc_alarm_ops;
+	}
 
 	ret = devm_rtc_register_device(data->rtc);
 	if (ret)
-- 
2.30.1.489.g328c10930387

