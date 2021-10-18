Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DB494322A4
	for <lists+linux-rtc@lfdr.de>; Mon, 18 Oct 2021 17:19:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233530AbhJRPWC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 18 Oct 2021 11:22:02 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:53463 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233395AbhJRPV6 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 18 Oct 2021 11:21:58 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id E334024000C;
        Mon, 18 Oct 2021 15:19:44 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/7] rtc: rv3032: allow setting BSM
Date:   Mon, 18 Oct 2021 17:19:33 +0200
Message-Id: <20211018151933.76865-8-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211018151933.76865-1-alexandre.belloni@bootlin.com>
References: <20211018151933.76865-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Backup Switch Mode is currently set properly when the trickle charger is
enabled. However, in the case of a non-rechargeable battery, it is
necessary to be able to enable it, only allow that when the trickle charger
is disabled.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-rv3032.c | 76 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/drivers/rtc/rtc-rv3032.c b/drivers/rtc/rtc-rv3032.c
index 1b62ed2f1459..a3c73179ecb1 100644
--- a/drivers/rtc/rtc-rv3032.c
+++ b/drivers/rtc/rtc-rv3032.c
@@ -106,6 +106,7 @@
 struct rv3032_data {
 	struct regmap *regmap;
 	struct rtc_device *rtc;
+	bool trickle_charger_set;
 #ifdef CONFIG_COMMON_CLK
 	struct clk_hw clkout_hw;
 #endif
@@ -402,6 +403,75 @@ static int rv3032_set_offset(struct device *dev, long offset)
 				 FIELD_PREP(RV3032_OFFSET_MSK, offset));
 }
 
+static int rv3032_param_get(struct device *dev, struct rtc_param *param)
+{
+	struct rv3032_data *rv3032 = dev_get_drvdata(dev);
+	int ret;
+
+	switch(param->param) {
+		u32 value;
+
+	case RTC_PARAM_BACKUP_SWITCH_MODE:
+		ret = regmap_read(rv3032->regmap, RV3032_PMU, &value);
+		if (ret < 0)
+			return ret;
+
+		value = FIELD_GET(RV3032_PMU_BSM, value);
+
+		switch(value) {
+		case RV3032_PMU_BSM_DSM:
+			param->uvalue = RTC_BSM_DIRECT;
+			break;
+		case RV3032_PMU_BSM_LSM:
+			param->uvalue = RTC_BSM_LEVEL;
+			break;
+		default:
+			param->uvalue = RTC_BSM_DISABLED;
+		}
+
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int rv3032_param_set(struct device *dev, struct rtc_param *param)
+{
+	struct rv3032_data *rv3032 = dev_get_drvdata(dev);
+
+	switch(param->param) {
+		u8 mode;
+	case RTC_PARAM_BACKUP_SWITCH_MODE:
+		if (rv3032->trickle_charger_set)
+			return -EINVAL;
+
+		switch (param->uvalue) {
+		case RTC_BSM_DISABLED:
+			mode = 0;
+			break;
+		case RTC_BSM_DIRECT:
+			mode = RV3032_PMU_BSM_DSM;
+			break;
+		case RTC_BSM_LEVEL:
+			mode = RV3032_PMU_BSM_LSM;
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		return rv3032_update_cfg(rv3032, RV3032_PMU, RV3032_PMU_BSM,
+					 FIELD_PREP(RV3032_PMU_BSM, mode));
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int rv3032_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
 {
 	struct rv3032_data *rv3032 = dev_get_drvdata(dev);
@@ -541,6 +611,8 @@ static int rv3032_trickle_charger_setup(struct device *dev, struct rv3032_data *
 		return 0;
 	}
 
+	rv3032->trickle_charger_set = true;
+
 	return rv3032_update_cfg(rv3032, RV3032_PMU,
 				 RV3032_PMU_TCR | RV3032_PMU_TCM | RV3032_PMU_BSM,
 				 val | FIELD_PREP(RV3032_PMU_TCR, i));
@@ -813,6 +885,8 @@ static const struct rtc_class_ops rv3032_rtc_ops = {
 	.read_alarm = rv3032_get_alarm,
 	.set_alarm = rv3032_set_alarm,
 	.alarm_irq_enable = rv3032_alarm_irq_enable,
+	.param_get = rv3032_param_get,
+	.param_set = rv3032_param_set,
 };
 
 static const struct regmap_config regmap_config = {
@@ -883,6 +957,8 @@ static int rv3032_probe(struct i2c_client *client)
 
 	rv3032_trickle_charger_setup(&client->dev, rv3032);
 
+	set_bit(RTC_FEATURE_BACKUP_SWITCH_MODE, rv3032->rtc->features);
+
 	rv3032->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
 	rv3032->rtc->range_max = RTC_TIMESTAMP_END_2099;
 	rv3032->rtc->ops = &rv3032_rtc_ops;
-- 
2.31.1

