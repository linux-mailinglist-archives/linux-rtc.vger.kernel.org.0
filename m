Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45F8242FBED
	for <lists+linux-rtc@lfdr.de>; Fri, 15 Oct 2021 21:21:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242683AbhJOTXj (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 15 Oct 2021 15:23:39 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:47937 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242673AbhJOTXi (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 15 Oct 2021 15:23:38 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 71EC620008;
        Fri, 15 Oct 2021 19:21:30 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] rtc: rv3028: add BSM support
Date:   Fri, 15 Oct 2021 21:21:19 +0200
Message-Id: <20211015192121.817642-7-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211015192121.817642-1-alexandre.belloni@bootlin.com>
References: <20211015192121.817642-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Backup Switch Mode controls how the RTC decides when to switch to the
backup power supply. As it is disabled by default, provide a way to enable
and configure it.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-rv3028.c | 73 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/drivers/rtc/rtc-rv3028.c b/drivers/rtc/rtc-rv3028.c
index 12c807306893..45c82e59d68f 100644
--- a/drivers/rtc/rtc-rv3028.c
+++ b/drivers/rtc/rtc-rv3028.c
@@ -10,6 +10,7 @@
 
 #include <linux/clk-provider.h>
 #include <linux/bcd.h>
+#include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
@@ -80,6 +81,10 @@
 
 #define RV3028_BACKUP_TCE		BIT(5)
 #define RV3028_BACKUP_TCR_MASK		GENMASK(1,0)
+#define RV3028_BACKUP_BSM		GENMASK(3,2)
+
+#define RV3028_BACKUP_BSM_DSM		0x1
+#define RV3028_BACKUP_BSM_LSM		0x3
 
 #define OFFSET_STEP_PPT			953674
 
@@ -512,6 +517,72 @@ static int rv3028_set_offset(struct device *dev, long offset)
 
 }
 
+static int rv3028_param_get(struct device *dev, struct rtc_param *param)
+{
+	struct rv3028_data *rv3028 = dev_get_drvdata(dev);
+	int ret;
+
+	switch(param->param) {
+		u32 value;
+
+	case RTC_PARAM_BACKUP_SWITCH_MODE:
+		ret = regmap_read(rv3028->regmap, RV3028_BACKUP, &value);
+		if (ret < 0)
+			return ret;
+
+		value = FIELD_GET(RV3028_BACKUP_BSM, value);
+
+		switch(value) {
+		case RV3028_BACKUP_BSM_DSM:
+			param->uvalue = RTC_BSM_DIRECT;
+			break;
+		case RV3028_BACKUP_BSM_LSM:
+			param->uvalue = RTC_BSM_LEVEL;
+			break;
+		default:
+			param->uvalue = RTC_BSM_DISABLED;
+		}
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int rv3028_param_set(struct device *dev, struct rtc_param *param)
+{
+	struct rv3028_data *rv3028 = dev_get_drvdata(dev);
+
+	switch(param->param) {
+		u8 mode;
+	case RTC_PARAM_BACKUP_SWITCH_MODE:
+		switch (param->uvalue) {
+		case RTC_BSM_DISABLED:
+			mode = 0;
+			break;
+		case RTC_BSM_DIRECT:
+			mode = RV3028_BACKUP_BSM_DSM;
+			break;
+		case RTC_BSM_LEVEL:
+			mode = RV3028_BACKUP_BSM_LSM;
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		rv3028_update_cfg(rv3028, RV3028_BACKUP, RV3028_BACKUP_BSM,
+				  FIELD_PREP(RV3028_BACKUP_BSM, mode));
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int rv3028_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
 {
 	struct rv3028_data *rv3028 = dev_get_drvdata(dev);
@@ -776,6 +847,8 @@ static const struct rtc_class_ops rv3028_rtc_ops = {
 	.read_offset = rv3028_read_offset,
 	.set_offset = rv3028_set_offset,
 	.ioctl = rv3028_ioctl,
+	.param_get = rv3028_param_get,
+	.param_set = rv3028_param_set,
 };
 
 static const struct regmap_config regmap_config = {
-- 
2.31.1

