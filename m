Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 414FC6048A0
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Oct 2022 16:01:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233242AbiJSOBm (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 19 Oct 2022 10:01:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233747AbiJSOBN (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 19 Oct 2022 10:01:13 -0400
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 901801E0989;
        Wed, 19 Oct 2022 06:41:58 -0700 (PDT)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29JDIDva008136;
        Wed, 19 Oct 2022 09:40:20 -0400
Received: from nwd2mta4.analog.com ([137.71.173.58])
        by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3k7pq7ftq2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 19 Oct 2022 09:40:20 -0400
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
        by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 29JDeJCP012716
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 19 Oct 2022 09:40:19 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Wed, 19 Oct
 2022 09:40:18 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Wed, 19 Oct 2022 09:40:18 -0400
Received: from IST-LT-39247.ad.analog.com (IST-LT-39247.ad.analog.com [10.25.16.14])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 29JDdxLS002874;
        Wed, 19 Oct 2022 09:40:03 -0400
From:   Ibrahim Tilki <Ibrahim.Tilki@analog.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <jdelvare@suse.com>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
CC:     Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
        <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Zeynep Arslanbenzer <Zeynep.Arslanbenzer@analog.com>
Subject: [PATCH 1/2] drivers: rtc: add max313xx series rtc driver
Date:   Wed, 19 Oct 2022 16:39:09 +0300
Message-ID: <20221019133910.282-1-Ibrahim.Tilki@analog.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: W2WJdM8C0ByTHm9K6RA-Aqk6-Xyoe_Fx
X-Proofpoint-GUID: W2WJdM8C0ByTHm9K6RA-Aqk6-Xyoe_Fx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-19_08,2022-10-19_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 clxscore=1011 mlxscore=0 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210190076
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Adding support for Analog Devices MAX313XX series RTCs.

Signed-off-by: Ibrahim Tilki <Ibrahim.Tilki@analog.com>
Signed-off-by: Zeynep Arslanbenzer <Zeynep.Arslanbenzer@analog.com>
---
 drivers/rtc/Kconfig        |   11 +
 drivers/rtc/Makefile       |    1 +
 drivers/rtc/rtc-max313xx.c | 1292 ++++++++++++++++++++++++++++++++++++
 3 files changed, 1304 insertions(+)
 create mode 100644 drivers/rtc/rtc-max313xx.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index b8de25118..71ea390dc 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -323,6 +323,17 @@ config RTC_DRV_LP8788
 	help
 	  Say Y to enable support for the LP8788 RTC/ALARM driver.
 
+config RTC_DRV_MAX313XX
+	tristate "Analog Devices MAX313XX RTC driver"
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  If you say yes here you will get support for the
+	  Analog Devices MAX313XX series RTC family.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called rtc-max313xx.
+
 config RTC_DRV_MAX6900
 	tristate "Maxim MAX6900"
 	help
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index aab22bc63..3d1aab897 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -89,6 +89,7 @@ obj-$(CONFIG_RTC_DRV_M41T94)	+= rtc-m41t94.o
 obj-$(CONFIG_RTC_DRV_M48T35)	+= rtc-m48t35.o
 obj-$(CONFIG_RTC_DRV_M48T59)	+= rtc-m48t59.o
 obj-$(CONFIG_RTC_DRV_M48T86)	+= rtc-m48t86.o
+obj-$(CONFIG_RTC_DRV_MAX313XX)	+= rtc-max313xx.o
 obj-$(CONFIG_RTC_DRV_MAX6900)	+= rtc-max6900.o
 obj-$(CONFIG_RTC_DRV_MAX6902)	+= rtc-max6902.o
 obj-$(CONFIG_RTC_DRV_MAX6916)	+= rtc-max6916.o
diff --git a/drivers/rtc/rtc-max313xx.c b/drivers/rtc/rtc-max313xx.c
new file mode 100644
index 000000000..1c1ca323f
--- /dev/null
+++ b/drivers/rtc/rtc-max313xx.c
@@ -0,0 +1,1292 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Analog Devices MAX313XX series I2C RTC driver
+ *
+ * Copyright 2022 Analog Devices Inc.
+ */
+#include <asm-generic/unaligned.h>
+#include <linux/bcd.h>
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/hwmon.h>
+#include <linux/i2c.h>
+#include <linux/regmap.h>
+#include <linux/rtc.h>
+#include <linux/util_macros.h>
+#include <linux/watchdog.h>
+
+/* common registers */
+#define MAX313XX_INT_ALARM1	BIT(0)
+#define MAX313XX_INT_ALARM2	BIT(1)
+#define MAX313XX_HRS_F_12_24	BIT(6)
+#define MAX313XX_HRS_F_AM_PM	BIT(5)
+#define MAX313XX_MONTH_CENTURY	BIT(7)
+
+#define MAX313XX_TMR_CFG_ENABLE		BIT(4)
+#define MAX313XX_TMR_CFG_FREQ_MASK	GENMASK(1, 0)
+#define MAX313XX_TMR_CFG_FREQ_16HZ	0x03
+
+#define MAX313XX_REG_MINUTE	0x01
+#define MAX313XX_REG_HOUR	0x02
+
+#define MAX313XX_TIME_SIZE	0x07
+
+/* device specific registers */
+#define MAX3134X_CFG_REG		0x00
+#define MAX3134X_CFG_INIT_MASK		(BIT(0) | BIT(3))
+#define MAX3134X_CFG_INIT_VALUE		0x01
+
+#define MAX3134X_CFG2_REG		0x01
+#define MAX3134X_CFG2_SET_RTC		BIT(1)
+
+#define MAX31341_TRICKLE_RES_MASK	GENMASK(1, 0)
+#define MAX31341_TRICKLE_DIODE_EN	BIT(2)
+#define MAX31341_TRICKLE_ENABLE_BIT	BIT(3)
+#define MAX31341_POWER_MGMT_REG		0x56
+#define MAX31341_POWER_MGMT_TRICKLE_BIT	BIT(0)
+
+#define MAX3133X_TRICKLE_RES_MASK	GENMASK(2, 1)
+#define MAX3133X_TRICKLE_DIODE_EN	BIT(3)
+#define MAX3133X_TRICKLE_ENABLE_BIT	BIT(0)
+
+#define MAX31329_TRICKLE_ENABLE_BIT	BIT(7)
+#define MAX31343_TRICKLE_ENABLE_MASK	GENMASK(7, 4)
+#define MAX31343_TRICKLE_ENABLE_CODE	5
+#define MAX31329_43_TRICKLE_RES_MASK	GENMASK(1, 0)
+#define MAX31329_43_TRICKLE_DIODE_EN	BIT(2)
+
+#define MAX31329_CONFIG2_REG		0x04
+#define MAX31329_CONFIG2_CLKIN_EN	BIT(2)
+#define MAX31329_CONFIG2_CLKIN_FREQ	GENMASK(1, 0)
+
+#define MAX31341_42_CONFIG1_REG		0x00
+#define MAX31341_42_CONFIG1_CLKIN_EN	BIT(7)
+#define MAX31341_42_CONFIG1_CLKIN_FREQ	GENMASK(5, 4)
+
+enum max313xx_ids {
+	ID_MAX31328,
+	ID_MAX31329,
+	ID_MAX31331,
+	ID_MAX31334,
+	ID_MAX31341,
+	ID_MAX31342,
+	ID_MAX31343,
+	MAX313XX_ID_NR
+};
+
+struct clkout_cfg {
+	const int *freq_avail;
+	u8 freq_size;
+	u8 freq_pos;
+	u8 reg;
+	u8 en_bit;
+	bool en_invert;
+};
+
+struct chip_desc {
+	struct clkout_cfg *clkout;
+	const char *clkout_name;
+	u8 sec_reg;
+	u8 alarm1_sec_reg;
+
+	u8 int_en_reg;
+	u8 int_status_reg;
+
+	u8 timer_cfg_reg;
+	u8 timer_count_reg;
+
+	u8 ram_reg;
+	u8 ram_size;
+
+	u8 temp_reg;
+
+	u8 trickle_reg;
+};
+
+#define clk_hw_to_max313xx(_hw) container_of(_hw, struct max313xx, clkout)
+
+struct max313xx {
+	enum max313xx_ids id;
+	struct regmap *regmap;
+	struct rtc_device *rtc;
+	struct watchdog_device wdd;
+	struct clk_hw clkout;
+	struct clk *clkin;
+	const struct chip_desc *chip;
+	int irqs[2];
+	int irq;
+};
+
+static const int max313xx_clkin_freq[] = { 1, 50, 60, 32768 };
+
+static const int max31328_clkout_freq[] = { 1, 1024, 4096, 8192 };
+static const int max31329_clkout_freq[] = { 1, 4096, 8192, 32768 };
+static const int max3133x_clkout_freq[] = { 1, 64, 1024, 32768 };
+static const int max31341_42_clkout_freq[] = { 1, 50, 60, 32768 };
+static const int max31343_clkout_freq[] = { 1, 2, 4, 8, 16, 32, 64, 128, 32875 };
+
+static struct clkout_cfg max31328_clkout = {
+	.freq_avail = max31328_clkout_freq,
+	.freq_size = ARRAY_SIZE(max31328_clkout_freq),
+	.freq_pos = 3,
+	.reg = 0x0E,
+	.en_bit = BIT(3),
+	.en_invert = true,
+};
+
+static struct clkout_cfg max31329_clkout = {
+	.freq_avail = max31329_clkout_freq,
+	.freq_size = ARRAY_SIZE(max31329_clkout_freq),
+	.freq_pos = 5,
+	.reg = 0x04,
+	.en_bit = BIT(7),
+};
+
+static struct clkout_cfg max3133x_clkout = {
+	.freq_avail = max3133x_clkout_freq,
+	.freq_size = ARRAY_SIZE(max3133x_clkout_freq),
+	.freq_pos = 0,
+	.reg = 0x04,
+	.en_bit = BIT(2),
+};
+
+static struct clkout_cfg max31341_42_clkout = {
+	.freq_avail = max31341_42_clkout_freq,
+	.freq_size = ARRAY_SIZE(max31341_42_clkout_freq),
+	.freq_pos = 1,
+	.reg = 0x00,
+	.en_bit = BIT(6),
+	.en_invert = true,
+};
+
+static struct clkout_cfg max31343_clkout = {
+	.freq_avail = max31343_clkout_freq,
+	.freq_size = ARRAY_SIZE(max31343_clkout_freq),
+	.freq_pos = 3,
+	.reg = 0x04,
+	.en_bit = BIT(7),
+};
+
+static const struct chip_desc chip[MAX313XX_ID_NR] = {
+	[ID_MAX31328] = {
+		.int_en_reg = 0x0E,
+		.int_status_reg = 0x0F,
+		.sec_reg = 0x00,
+		.alarm1_sec_reg = 0x07,
+		.temp_reg = 0x11,
+		.clkout = &max31328_clkout,
+		.clkout_name = "max31328-sqw",
+	},
+	[ID_MAX31329] = {
+		.int_en_reg = 0x01,
+		.int_status_reg = 0x00,
+		.sec_reg = 0x06,
+		.alarm1_sec_reg = 0x0D,
+		.timer_cfg_reg = 0x05,
+		.timer_count_reg = 0x16,
+		.ram_reg = 0x22,
+		.ram_size = 64,
+		.trickle_reg = 0x19,
+		.clkout = &max31329_clkout,
+		.clkout_name = "max31329-clkout",
+	},
+	[ID_MAX31331] = {
+		.int_en_reg = 0x01,
+		.int_status_reg = 0x00,
+		.sec_reg = 0x08,
+		.alarm1_sec_reg = 0x0F,
+		.timer_cfg_reg = 0x06,
+		.timer_count_reg = 0x18,
+		.ram_reg = 0x20,
+		.ram_size = 32,
+		.trickle_reg = 0x1B,
+		.clkout = &max3133x_clkout,
+		.clkout_name = "max31331-clkout",
+	},
+	[ID_MAX31334] = {
+		.int_en_reg = 0x01,
+		.int_status_reg = 0x00,
+		.sec_reg = 0x09,
+		.alarm1_sec_reg = 0x10,
+		.timer_cfg_reg = 0x06,
+		/* 16-bit timer */
+		.timer_count_reg = 0x19,
+		.ram_reg = 0x30,
+		.ram_size = 32,
+		.trickle_reg = 0x1E,
+		.clkout = &max3133x_clkout,
+		.clkout_name = "max31334-clkout",
+	},
+	[ID_MAX31341] = {
+		.int_en_reg = 0x04,
+		.int_status_reg = 0x05,
+		.sec_reg = 0x06,
+		.alarm1_sec_reg = 0x0D,
+		.timer_cfg_reg = 0x03,
+		.timer_count_reg = 0x14,
+		.ram_reg = 0x16,
+		.ram_size = 64,
+		.trickle_reg = 0x57,
+		.clkout = &max31341_42_clkout,
+		.clkout_name = "max31341-clkout",
+	},
+	[ID_MAX31342] = {
+		.int_en_reg = 0x04,
+		.int_status_reg = 0x05,
+		.sec_reg = 0x06,
+		.alarm1_sec_reg = 0x0D,
+		.timer_cfg_reg = 0x03,
+		.timer_count_reg = 0x16,
+		.clkout = &max31341_42_clkout,
+		.clkout_name = "max31342-clkout",
+	},
+	[ID_MAX31343] = {
+		.int_en_reg = 0x01,
+		.int_status_reg = 0x00,
+		.sec_reg = 0x06,
+		.alarm1_sec_reg = 0x0D,
+		.timer_cfg_reg = 0x05,
+		.timer_count_reg = 0x16,
+		.ram_reg = 0x22,
+		.ram_size = 64,
+		.temp_reg = 0x1A,
+		.trickle_reg = 0x19,
+		.clkout = &max31343_clkout,
+		.clkout_name = "max31343-sqw",
+	},
+};
+
+static const u32 max313xx_trickle_ohms[] = { 3000, 6000, 11000 };
+
+static bool max313xx_volatile_reg(struct device *dev, unsigned int reg)
+{
+	struct max313xx *rtc = dev_get_drvdata(dev);
+	const struct chip_desc *chip = rtc->chip;
+
+	/* time keeping registers */
+	if (reg >= chip->sec_reg && reg < chip->sec_reg + MAX313XX_TIME_SIZE)
+		return true;
+
+	/* interrupt status register */
+	if (reg == chip->int_status_reg)
+		return true;
+
+	/* temperature registers */
+	if (chip->temp_reg &&
+	    (reg == chip->temp_reg || reg == chip->temp_reg + 1))
+		return true;
+
+	/* timer count registers */
+	return reg == chip->timer_count_reg ||
+	       (rtc->id == ID_MAX31334 && reg == chip->timer_count_reg + 1);
+}
+
+static const struct regmap_config regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.cache_type = REGCACHE_RBTREE,
+	.volatile_reg = max313xx_volatile_reg,
+};
+
+static int max313xx_read_time(struct device *dev, struct rtc_time *t)
+{
+	struct max313xx *rtc = dev_get_drvdata(dev);
+	u8 regs[7];
+	int ret;
+
+	ret = regmap_bulk_read(rtc->regmap, rtc->chip->sec_reg, regs, 7);
+	if (ret)
+		return ret;
+
+	t->tm_sec = bcd2bin(regs[0] & 0x7f);
+	t->tm_min = bcd2bin(regs[1] & 0x7f);
+	t->tm_hour = bcd2bin(regs[2] & 0x3f);
+	t->tm_wday = bcd2bin(regs[3] & 0x07) - 1;
+	t->tm_mday = bcd2bin(regs[4] & 0x3f);
+	t->tm_mon = bcd2bin(regs[5] & 0x1f) - 1;
+	t->tm_year = bcd2bin(regs[6]) + 100;
+
+	if (FIELD_GET(MAX313XX_MONTH_CENTURY, regs[5]))
+		t->tm_year += 100;
+
+	return 0;
+}
+
+static int max313xx_set_time(struct device *dev, struct rtc_time *t)
+{
+	struct max313xx *rtc = dev_get_drvdata(dev);
+	u8 regs[7];
+	int ret;
+
+	if (t->tm_year < 100 || t->tm_year >= 300)
+		return -EINVAL;
+
+	regs[0] = bin2bcd(t->tm_sec);
+	regs[1] = bin2bcd(t->tm_min);
+	regs[2] = bin2bcd(t->tm_hour);
+	regs[3] = bin2bcd(t->tm_wday + 1);
+	regs[4] = bin2bcd(t->tm_mday);
+	regs[5] = bin2bcd(t->tm_mon + 1);
+
+	if (t->tm_year >= 200) {
+		regs[5] |= FIELD_PREP(MAX313XX_MONTH_CENTURY, 1);
+		regs[6] = bin2bcd(t->tm_year - 200);
+	} else {
+		regs[6] = bin2bcd(t->tm_year - 100);
+	}
+
+	/* Clkin needs to be disabled before setting time. */
+	if (rtc->clkin) {
+		switch (rtc->id) {
+		case ID_MAX31341:
+		case ID_MAX31342:
+			ret = regmap_clear_bits(rtc->regmap,
+						MAX31341_42_CONFIG1_REG,
+						MAX31341_42_CONFIG1_CLKIN_EN);
+			break;
+		default:
+			ret = 0;
+		}
+		if (ret)
+			return ret;
+	}
+
+	ret = regmap_bulk_write(rtc->regmap, rtc->chip->sec_reg, regs, 7);
+	if (ret)
+		return ret;
+
+	switch (rtc->id) {
+	case ID_MAX31341:
+	case ID_MAX31342:
+		ret = regmap_set_bits(rtc->regmap, MAX3134X_CFG2_REG,
+				      MAX3134X_CFG2_SET_RTC);
+		if (ret)
+			return ret;
+
+		fsleep(10000);
+
+		ret = regmap_clear_bits(rtc->regmap, MAX3134X_CFG2_REG,
+					MAX3134X_CFG2_SET_RTC);
+		if (ret)
+			return ret;
+
+		if (rtc->clkin)
+			ret = regmap_set_bits(rtc->regmap,
+					      MAX31341_42_CONFIG1_REG,
+					      MAX31341_42_CONFIG1_CLKIN_EN);
+
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+}
+
+static int max313xx_read_alarm(struct device *dev, struct rtc_wkalrm *t)
+{
+	struct max313xx *rtc = dev_get_drvdata(dev);
+	unsigned int status, int_en;
+	struct rtc_time time;
+	u8 regs[6];
+	int ret;
+
+	ret = regmap_bulk_read(rtc->regmap, rtc->chip->alarm1_sec_reg, regs,
+			       sizeof(regs));
+	if (ret)
+		return ret;
+
+	t->time.tm_sec = bcd2bin(regs[0] & 0x7f);
+	t->time.tm_min = bcd2bin(regs[1] & 0x7f);
+	t->time.tm_hour = bcd2bin(regs[2] & 0x3f);
+	t->time.tm_mday = bcd2bin(regs[3] & 0x3f);
+	t->time.tm_mon = bcd2bin(regs[4] & 0x1f) - 1;
+	t->time.tm_year = bcd2bin(regs[5]) + 100;
+
+	ret = max313xx_read_time(dev, &time);
+	if (ret)
+		return ret;
+
+	if (time.tm_year >= 200)
+		t->time.tm_year += 100;
+
+	ret = regmap_read(rtc->regmap, rtc->chip->int_status_reg, &status);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(rtc->regmap, rtc->chip->int_en_reg, &int_en);
+	if (ret)
+		return ret;
+
+	t->enabled = FIELD_GET(MAX313XX_INT_ALARM1, int_en);
+	t->pending = FIELD_GET(MAX313XX_INT_ALARM1, status);
+
+	return 0;
+}
+
+static int max313xx_set_alarm(struct device *dev, struct rtc_wkalrm *t)
+{
+	struct max313xx *rtc = dev_get_drvdata(dev);
+	struct rtc_time time;
+	unsigned int reg;
+	u8 regs[6];
+	int ret;
+
+	regs[0] = bin2bcd(t->time.tm_sec);
+	regs[1] = bin2bcd(t->time.tm_min);
+	regs[2] = bin2bcd(t->time.tm_hour);
+	regs[3] = bin2bcd(t->time.tm_mday);
+	regs[4] = bin2bcd(t->time.tm_mon + 1);
+
+	if (t->time.tm_year >= 200) {
+		/*
+		 * Century bit is shared between time and alarm registers so
+		 * make sure that new alarm and RTC time is in the same century.
+		 */
+		ret = max313xx_read_time(dev, &time);
+		if (ret)
+			return ret;
+
+		if (time.tm_year < 200)
+			return -EINVAL;
+
+		regs[5] = bin2bcd(t->time.tm_year - 200);
+	} else if (t->time.tm_year >= 100) {
+		regs[5] = bin2bcd(t->time.tm_year - 100);
+	} else {
+		return -EINVAL;
+	}
+
+	ret = regmap_bulk_write(rtc->regmap, rtc->chip->alarm1_sec_reg, regs,
+				sizeof(regs));
+	if (ret)
+		return ret;
+
+	reg = FIELD_PREP(MAX313XX_INT_ALARM1, t->enabled);
+	ret = regmap_update_bits(rtc->regmap, rtc->chip->int_en_reg,
+				 MAX313XX_INT_ALARM1 | MAX313XX_INT_ALARM2,
+				 reg);
+	if (ret)
+		return ret;
+
+	/* Clear status register */
+	return regmap_read(rtc->regmap, rtc->chip->int_status_reg, &reg);
+}
+
+static int max313xx_alarm_irq_enable(struct device *dev, unsigned int enabled)
+{
+	struct max313xx *rtc = dev_get_drvdata(dev);
+
+	return regmap_update_bits(rtc->regmap, rtc->chip->int_en_reg,
+				  MAX313XX_INT_ALARM1,
+				  FIELD_PREP(MAX313XX_INT_ALARM1, enabled));
+}
+
+static const struct rtc_class_ops max3133x_rtc_ops = {
+	.read_time	= max313xx_read_time,
+	.set_time	= max313xx_set_time,
+	.read_alarm	= max313xx_read_alarm,
+	.set_alarm	= max313xx_set_alarm,
+	.alarm_irq_enable = max313xx_alarm_irq_enable,
+};
+
+static irqreturn_t max313xx_irq(int irq, void *dev_id)
+{
+	struct max313xx	*rtc = dev_id;
+	struct mutex *lock = &rtc->rtc->ops_lock;
+	int stat, ret;
+
+	mutex_lock(lock);
+	ret = regmap_read(rtc->regmap, rtc->chip->int_status_reg, &stat);
+	if (ret)
+		goto out;
+
+	if (FIELD_GET(MAX313XX_INT_ALARM1, stat)) {
+		ret = regmap_update_bits(rtc->regmap, rtc->chip->int_en_reg,
+					 MAX313XX_INT_ALARM1, 0);
+		if (ret)
+			goto out;
+
+		rtc_update_irq(rtc->rtc, 1, RTC_AF | RTC_IRQF);
+	}
+
+out:
+	mutex_unlock(lock);
+
+	return IRQ_HANDLED;
+}
+
+static int max313xx_convert_24hr(struct max313xx *rtc)
+{
+	u8 reg[7], hour;
+	int ret;
+
+	switch (rtc->id) {
+	case ID_MAX31341:
+	case ID_MAX31342:
+	case ID_MAX31343:
+		return 0;
+	default:
+		break;
+	}
+
+	ret = regmap_bulk_read(rtc->regmap, rtc->chip->sec_reg, reg, 7);
+	if (ret)
+		return ret;
+
+	/* Already in 24Hr mode */
+	if (!FIELD_GET(MAX313XX_HRS_F_12_24, reg[MAX313XX_REG_HOUR]))
+		return 0;
+
+	/* Convert to 24Hr */
+	hour = bcd2bin(reg[MAX313XX_REG_HOUR] & 0x1f);
+	if (hour == 12)
+		hour = 0;
+
+	if (FIELD_GET(MAX313XX_HRS_F_AM_PM, reg[MAX313XX_REG_HOUR]))
+		hour += 12;
+
+	reg[MAX313XX_REG_HOUR] = bin2bcd(hour);
+	/*
+	 * If minute is 59, write all registers in case hour register
+	 * gets updated during read-write cycle
+	 */
+	if (reg[MAX313XX_REG_MINUTE] == 0x59)
+		return regmap_bulk_write(rtc->regmap, rtc->chip->sec_reg, reg, 7);
+
+	return regmap_write(rtc->regmap, rtc->chip->sec_reg + MAX313XX_REG_HOUR,
+			    reg[MAX313XX_REG_HOUR]);
+}
+
+static int max313xx_nvmem_reg_read(void *priv, unsigned int offset,
+				   void *val, size_t bytes)
+{
+	struct max313xx *rtc = priv;
+	unsigned int reg = rtc->chip->ram_reg + offset;
+
+	return regmap_bulk_read(rtc->regmap, reg, val, bytes);
+}
+
+static int max313xx_nvmem_reg_write(void *priv, unsigned int offset,
+				    void *val, size_t bytes)
+{
+	struct max313xx *rtc = priv;
+	unsigned int reg = rtc->chip->ram_reg + offset;
+
+	return regmap_bulk_write(rtc->regmap, reg, val, bytes);
+}
+
+struct nvmem_config max313xx_nvmem_cfg = {
+	.reg_read = max313xx_nvmem_reg_read,
+	.reg_write = max313xx_nvmem_reg_write,
+	.word_size = 8,
+};
+
+static unsigned long max313xx_clkout_recalc_rate(struct clk_hw *hw,
+						 unsigned long parent_rate)
+{
+	struct max313xx *rtc = clk_hw_to_max313xx(hw);
+	const struct clkout_cfg *clkout = rtc->chip->clkout;
+	unsigned int freq_mask;
+	unsigned int reg;
+	int ret;
+
+	ret = regmap_read(rtc->regmap, clkout->reg, &reg);
+	if (ret)
+		return 0;
+
+	freq_mask = __roundup_pow_of_two(clkout->freq_size) - 1;
+
+	return clkout->freq_avail[(reg >> clkout->freq_pos) & freq_mask];
+}
+
+static long max313xx_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
+				       unsigned long *prate)
+{
+	struct max313xx *rtc = clk_hw_to_max313xx(hw);
+	struct clkout_cfg *clkout = rtc->chip->clkout;
+	int index;
+
+	index = find_closest(rate, clkout->freq_avail, clkout->freq_size);
+	return clkout->freq_avail[index];
+}
+
+static int max313xx_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
+				    unsigned long parent_rate)
+{
+	struct max313xx *rtc = clk_hw_to_max313xx(hw);
+	struct clkout_cfg *clkout = rtc->chip->clkout;
+	unsigned int freq_mask;
+	int index;
+
+	index = find_closest(rate, clkout->freq_avail, clkout->freq_size);
+	freq_mask = __roundup_pow_of_two(clkout->freq_size) - 1;
+
+	return regmap_update_bits(rtc->regmap, clkout->reg,
+				  freq_mask << clkout->freq_pos,
+				  index << clkout->freq_pos);
+}
+
+static int max313xx_clkout_enable(struct clk_hw *hw)
+{
+	struct max313xx *rtc = clk_hw_to_max313xx(hw);
+	struct clkout_cfg *clkout = rtc->chip->clkout;
+
+	if (clkout->en_invert)
+		return regmap_clear_bits(rtc->regmap, clkout->reg,
+					 clkout->en_bit);
+
+	return regmap_set_bits(rtc->regmap, clkout->reg,  clkout->en_bit);
+}
+
+static void max313xx_clkout_disable(struct clk_hw *hw)
+{
+	struct max313xx *rtc = clk_hw_to_max313xx(hw);
+	struct clkout_cfg *clkout = rtc->chip->clkout;
+
+	switch (rtc->id) {
+	case ID_MAX31331:
+	case ID_MAX31334:
+		if (rtc->irq > 0) {
+			dev_err(rtc->rtc->dev.parent,
+				"clkout cannot be disabled when IRQ is requested");
+			return;
+		}
+	default:
+		break;
+	}
+
+	if (clkout->en_invert)
+		regmap_set_bits(rtc->regmap, clkout->reg, clkout->en_bit);
+	else
+		regmap_clear_bits(rtc->regmap, clkout->reg,  clkout->en_bit);
+}
+
+static int max313xx_clkout_is_enabled(struct clk_hw *hw)
+{
+	struct max313xx *rtc = clk_hw_to_max313xx(hw);
+	struct clkout_cfg *clkout = rtc->chip->clkout;
+	unsigned int reg;
+	int ret;
+
+	ret = regmap_read(rtc->regmap, clkout->reg, &reg);
+	if (ret)
+		return ret;
+
+	return !!(reg & clkout->en_bit) ^ clkout->en_invert;
+}
+
+static const struct clk_ops max313xx_clkout_ops = {
+	.recalc_rate = max313xx_clkout_recalc_rate,
+	.round_rate = max313xx_clkout_round_rate,
+	.set_rate = max313xx_clkout_set_rate,
+	.enable = max313xx_clkout_enable,
+	.disable = max313xx_clkout_disable,
+	.is_enabled = max313xx_clkout_is_enabled,
+};
+
+struct clk_init_data max313xx_clk_init = {
+	.name = "max313xx-clkout",
+	.ops = &max313xx_clkout_ops,
+};
+
+static int max313xx_read_temp(struct device *dev, enum hwmon_sensor_types type,
+			      u32 attr, int channel, long *val)
+{
+	struct max313xx *rtc = dev_get_drvdata(dev);
+	struct chip_desc desc = chip[rtc->id];
+	u8 reg[2];
+	s16 temp;
+	int ret;
+
+	if (type != hwmon_temp || attr != hwmon_temp_input)
+		return -EOPNOTSUPP;
+
+	ret = regmap_bulk_read(rtc->regmap, desc.temp_reg, reg, 2);
+	if (ret)
+		return ret;
+
+	temp = get_unaligned_be16(reg);
+
+	*val = (temp / 64) * 250;
+
+	return 0;
+}
+
+static umode_t max313xx_is_visible(const void *data,
+				   enum hwmon_sensor_types type,
+				   u32 attr, int channel)
+{
+	if (type == hwmon_temp && attr == hwmon_temp_input)
+		return 0444;
+
+	return 0;
+}
+
+static const struct hwmon_channel_info *max313xx_info[] = {
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
+	NULL
+};
+
+static const struct hwmon_ops max313xx_hwmon_ops = {
+	.is_visible = max313xx_is_visible,
+	.read = max313xx_read_temp,
+};
+
+static const struct hwmon_chip_info max313xx_chip_info = {
+	.ops = &max313xx_hwmon_ops,
+	.info = max313xx_info,
+};
+
+static int max313xx_wdt_start(struct watchdog_device *wdd)
+{
+	struct max313xx *rtc = watchdog_get_drvdata(wdd);
+
+	return regmap_set_bits(rtc->regmap, rtc->chip->timer_cfg_reg,
+			       MAX313XX_TMR_CFG_ENABLE);
+}
+
+static int max313xx_wdt_stop(struct watchdog_device *wdd)
+{
+	struct max313xx *rtc = watchdog_get_drvdata(wdd);
+
+	return regmap_clear_bits(rtc->regmap, rtc->chip->timer_cfg_reg,
+				 MAX313XX_TMR_CFG_ENABLE);
+}
+
+static int max313xx_wdt_ping(struct watchdog_device *wdd)
+{
+	int ret;
+
+	ret = max313xx_wdt_stop(wdd);
+	if (ret)
+		return ret;
+
+	return max313xx_wdt_start(wdd);
+}
+
+static int max313xx_wdt_set_timeout(struct watchdog_device *wdd,
+				    unsigned int new_timeout)
+{
+	struct max313xx *rtc = watchdog_get_drvdata(wdd);
+	unsigned int reg = rtc->chip->timer_count_reg;
+	unsigned int regval = new_timeout * 16;
+	unsigned int tmr_cfg;
+	u8 tmr_16[2];
+	int ret;
+
+	switch (rtc->id) {
+	case ID_MAX31334:
+		if (regval > 0xFFFF)
+			return -EINVAL;
+		break;
+	default:
+		if (regval > 255)
+			return -EINVAL;
+	}
+
+	/* timer has to be disabled before writing timer_init */
+	ret = regmap_read(rtc->regmap, rtc->chip->timer_cfg_reg, &tmr_cfg);
+	if (ret)
+		return ret;
+
+	ret = max313xx_wdt_stop(wdd);
+	if (ret)
+		return ret;
+
+	switch (rtc->id) {
+	case ID_MAX31334:
+		tmr_16[0] = regval >> 8;
+		tmr_16[1] = regval & 0xFF;
+
+		ret = regmap_bulk_write(rtc->regmap, reg + 2, tmr_16, 2);
+		break;
+	default:
+		ret = regmap_write(rtc->regmap, reg + 1, regval);
+	}
+
+	if (ret)
+		return ret;
+
+	wdd->timeout = new_timeout;
+
+	/* restore timer cfg */
+	return regmap_write(rtc->regmap, rtc->chip->timer_cfg_reg, tmr_cfg);
+}
+
+static unsigned int max313xx_wdt_get_timeleft(struct watchdog_device *wdd)
+{
+	struct max313xx *rtc = watchdog_get_drvdata(wdd);
+	unsigned int reg;
+	u8 regs[2];
+	int ret;
+
+	switch (rtc->id) {
+	case ID_MAX31334:
+		ret = regmap_bulk_read(rtc->regmap, rtc->chip->timer_count_reg,
+				       regs, 2);
+		reg = get_unaligned_be16(regs);
+		break;
+	default:
+		ret = regmap_read(rtc->regmap, rtc->chip->timer_count_reg, &reg);
+	}
+
+	if (ret) {
+		dev_err(rtc->rtc->dev.parent, "cannot read timer value");
+		return 0;
+	}
+
+	return reg / 16;
+}
+
+static const struct watchdog_info max313xx_wdt_info = {
+	.identity = "MAX313XX Watchdog",
+	.options = WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT,
+};
+
+static const struct watchdog_ops max313xx_watchdog_ops = {
+	.owner = THIS_MODULE,
+	.start = max313xx_wdt_start,
+	.stop = max313xx_wdt_stop,
+	.ping = max313xx_wdt_ping,
+	.set_timeout = max313xx_wdt_set_timeout,
+	.get_timeleft = max313xx_wdt_get_timeleft,
+};
+
+/* Some devices require initialization */
+static int max313xx_init(struct max313xx *rtc)
+{
+	switch (rtc->id) {
+	case ID_MAX31341:
+	case ID_MAX31342:
+		return regmap_update_bits(rtc->regmap, MAX3134X_CFG_REG,
+					  MAX3134X_CFG_INIT_MASK,
+					  MAX3134X_CFG_INIT_VALUE);
+	default:
+		return 0;
+	}
+}
+
+static int max313xx_clkout_register(struct device *dev)
+{
+	struct max313xx *rtc = dev_get_drvdata(dev);
+	int ret;
+
+	if (!device_property_present(dev, "#clock-cells"))
+		return 0;
+
+	max313xx_clk_init.name = rtc->chip->clkout_name;
+	device_property_read_string(dev, "clock-output-names",
+				    &max313xx_clk_init.name);
+	rtc->clkout.init = &max313xx_clk_init;
+
+	ret = devm_clk_hw_register(dev, &rtc->clkout);
+	if (ret)
+		return dev_err_probe(dev, ret, "cannot register clock\n");
+
+	return of_clk_add_provider(dev->of_node, of_clk_src_simple_get,
+				   rtc->clkout.clk);
+}
+
+static int max313xx_trickle_charger_setup(struct device *dev)
+{
+	struct max313xx *rtc = dev_get_drvdata(dev);
+	bool diode_disable;
+	int index, reg;
+	u32 ohms = 0;
+	int ret;
+
+	device_property_read_u32(dev, "trickle-resistor-ohms", &ohms);
+	if (!ohms)
+		return 0;
+
+	diode_disable = device_property_read_bool(dev, "trickle-diode-disable");
+
+	if (!rtc->chip->trickle_reg) {
+		dev_warn(dev, "device does not have trickle charger\n");
+		return 0;
+	}
+
+	index = find_closest(ohms, max313xx_trickle_ohms,
+			     ARRAY_SIZE(max313xx_trickle_ohms)) + 1;
+
+	switch (rtc->id) {
+	case ID_MAX31329:
+		reg = FIELD_PREP(MAX31329_TRICKLE_ENABLE_BIT, 1) |
+		      FIELD_PREP(MAX31329_43_TRICKLE_RES_MASK, index) |
+		      FIELD_PREP(MAX31329_43_TRICKLE_DIODE_EN, !diode_disable);
+		break;
+	case ID_MAX31331:
+	case ID_MAX31334:
+		reg = FIELD_PREP(MAX3133X_TRICKLE_ENABLE_BIT, 1) |
+		      FIELD_PREP(MAX3133X_TRICKLE_DIODE_EN, !diode_disable) |
+		      FIELD_PREP(MAX3133X_TRICKLE_RES_MASK, index);
+		break;
+	case ID_MAX31341:
+		if (index == 1)
+			index = 0;
+		reg = FIELD_PREP(MAX31341_TRICKLE_ENABLE_BIT, 1) |
+		      FIELD_PREP(MAX31341_TRICKLE_DIODE_EN, !diode_disable) |
+		      FIELD_PREP(MAX31341_TRICKLE_RES_MASK, index);
+
+		ret = regmap_set_bits(rtc->regmap, MAX31341_POWER_MGMT_REG,
+				      MAX31341_POWER_MGMT_TRICKLE_BIT);
+		if (ret)
+			return ret;
+
+		break;
+	case ID_MAX31343:
+		reg = FIELD_PREP(MAX31329_43_TRICKLE_RES_MASK, index) |
+		      FIELD_PREP(MAX31329_43_TRICKLE_DIODE_EN, !diode_disable) |
+		      FIELD_PREP(MAX31343_TRICKLE_ENABLE_MASK,
+				 MAX31343_TRICKLE_ENABLE_CODE);
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return regmap_write(rtc->regmap, rtc->chip->trickle_reg, reg);
+}
+
+static int max313xx_find_clkin_freq_index(struct clk *clk)
+{
+	unsigned long rate = clk_get_rate(clk);
+	int freq;
+	int i;
+
+	i = find_closest(rate, max313xx_clkin_freq,
+			 ARRAY_SIZE(max313xx_clkin_freq));
+	if (max313xx_clkin_freq[i] == rate)
+		return i;
+
+	for (i = ARRAY_SIZE(max313xx_clkin_freq) - 1; i >= 0; i--) {
+		freq = max313xx_clkin_freq[i];
+		if (freq == clk_round_rate(clk, freq))
+			return i;
+	}
+
+	/* supplied clock cannot produce one of desired frequency rate */
+	return -ENODEV;
+}
+
+static int max313xx_clkin_init(struct device *dev)
+{
+	struct max313xx *rtc = dev_get_drvdata(dev);
+	int rate;
+	int ret;
+
+	rtc->clkin = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(rtc->clkin)) {
+		if (PTR_ERR(rtc->clkin) == -ENOENT)
+			rtc->clkin = NULL;
+		else
+			return dev_err_probe(dev, PTR_ERR(rtc->clkin),
+					     "error while clkin setup\n");
+	}
+
+	if (!rtc->clkin) {
+		switch (rtc->id) {
+		case ID_MAX31329:
+			return regmap_clear_bits(rtc->regmap,
+						 MAX31329_CONFIG2_REG,
+						 MAX31329_CONFIG2_CLKIN_EN);
+		case ID_MAX31341:
+		case ID_MAX31342:
+			return regmap_clear_bits(rtc->regmap,
+						 MAX31341_42_CONFIG1_REG,
+						 MAX31341_42_CONFIG1_CLKIN_EN);
+		default:
+			return 0;
+		}
+	}
+
+	rate = max313xx_find_clkin_freq_index(rtc->clkin);
+	if (rate < 0)
+		return dev_err_probe(dev, rate,
+				     "clkin cannot produce required frequency\n");
+
+	ret = clk_set_rate(rtc->clkin, max313xx_clkin_freq[rate]);
+	if (ret)
+		return ret;
+
+	switch (rtc->id) {
+	case ID_MAX31329:
+		ret = regmap_update_bits(rtc->regmap, MAX31329_CONFIG2_REG,
+					 MAX31329_CONFIG2_CLKIN_FREQ, rate);
+		if (ret)
+			return ret;
+
+		return regmap_set_bits(rtc->regmap, MAX31329_CONFIG2_REG,
+				       MAX31329_CONFIG2_CLKIN_EN);
+	case ID_MAX31341:
+	case ID_MAX31342:
+		ret = regmap_update_bits(rtc->regmap, MAX31341_42_CONFIG1_REG,
+					 MAX31341_42_CONFIG1_CLKIN_FREQ,
+					 FIELD_PREP(MAX31341_42_CONFIG1_CLKIN_FREQ, rate));
+		if (ret)
+			return ret;
+
+		return regmap_set_bits(rtc->regmap, MAX31341_42_CONFIG1_REG,
+				       MAX31341_42_CONFIG1_CLKIN_EN);
+	default:
+		rtc->clkin = NULL;
+		dev_warn(dev, "device does not have clock input\n");
+		return 0;
+	}
+}
+
+static int max313xx_irq_init(struct device *dev, const char *devname)
+{
+	struct max313xx *rtc = dev_get_drvdata(dev);
+	bool wakeup;
+	int ret;
+
+	rtc->irq = rtc->irqs[0];
+
+	switch (rtc->id) {
+	case ID_MAX31328:
+		/* max31328 sqw ant int pin is shared */
+		if (rtc->id == ID_MAX31328 && rtc->irq > 0 && rtc->clkout.clk)
+			return dev_err_probe(dev, -EOPNOTSUPP,
+					"cannot have both sqw clock output and irq enabled");
+
+		break;
+	case ID_MAX31331:
+	case ID_MAX31334:
+		if (rtc->clkout.clk) {
+			/* clockout needs to be enabled for using INTA pin */
+			ret = clk_prepare_enable(rtc->clkout.clk);
+			if (ret)
+				return dev_err_probe(dev, ret,
+						     "cannot enable clkout\n");
+		} else {
+			rtc->irq = rtc->irqs[1];
+		}
+		break;
+	default:
+		if (rtc->clkin) {
+			rtc->irq = rtc->irqs[1];
+
+			/* wrong interrupt specified */
+			if (rtc->irqs[0] > 0 && rtc->irqs[1] <= 0)
+				dev_warn(dev, "INTA is specified but INTB required for irq when clkin is enabled\n");
+
+			if (rtc->clkout.clk && rtc->irq > 0)
+				return dev_err_probe(dev, -EOPNOTSUPP,
+						"irq not possible when both clkin and clkout are configured\n");
+
+			if (rtc->irq <= 0)
+				break;
+
+			/* clkout needs to be disabled for using INTB pin */
+			if (rtc->chip->clkout->en_invert)
+				ret = regmap_set_bits(rtc->regmap,
+						      rtc->chip->clkout->reg,
+						      rtc->chip->clkout->en_bit);
+			else
+				ret = regmap_clear_bits(rtc->regmap,
+							rtc->chip->clkout->reg,
+							rtc->chip->clkout->en_bit);
+
+			if (ret)
+				return ret;
+		}
+		break;
+	}
+
+	if (rtc->irq > 0) {
+		ret = devm_request_threaded_irq(dev, rtc->irq, NULL,
+						&max313xx_irq, IRQF_ONESHOT,
+						devname, rtc);
+		if (ret)
+			return ret;
+
+		wakeup = device_property_read_bool(dev, "wakeup-source");
+		return device_init_wakeup(dev, wakeup);
+	}
+
+	__clear_bit(RTC_FEATURE_ALARM, rtc->rtc->features);
+
+	return 0;
+}
+
+static int max313xx_probe(struct i2c_client *client,
+			  const struct i2c_device_id *id)
+{
+	struct device *dev = &client->dev;
+	struct max313xx *max313xx;
+	struct device *hwmon;
+	const void *match;
+	int ret;
+
+	max313xx = devm_kzalloc(&client->dev, sizeof(*max313xx), GFP_KERNEL);
+	if (!max313xx)
+		return -ENOMEM;
+
+	dev_set_drvdata(&client->dev, max313xx);
+
+	max313xx->regmap = devm_regmap_init_i2c(client, &regmap_config);
+	if (IS_ERR(max313xx->regmap)) {
+		return dev_err_probe(dev, PTR_ERR(max313xx->regmap),
+				     "regmap init failed\n");
+	}
+
+	i2c_set_clientdata(client, max313xx);
+
+	match = device_get_match_data(dev);
+	if (match)
+		max313xx->id = (enum max313xx_ids)match;
+	else if (id)
+		max313xx->id = id->driver_data;
+	else
+		return -ENODEV;
+
+	max313xx->chip = &chip[max313xx->id];
+
+	ret = max313xx_init(max313xx);
+	if (ret)
+		return ret;
+
+	ret = max313xx_convert_24hr(max313xx);
+	if (ret)
+		return ret;
+
+	max313xx->rtc = devm_rtc_allocate_device(dev);
+	if (IS_ERR(max313xx->rtc))
+		return PTR_ERR(max313xx->rtc);
+
+	max313xx->rtc->ops = &max3133x_rtc_ops;
+	max313xx->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	max313xx->rtc->range_max = RTC_TIMESTAMP_END_2199;
+
+	ret = devm_rtc_register_device(max313xx->rtc);
+	if (ret)
+		return ret;
+
+	switch (max313xx->id) {
+	case ID_MAX31328:
+	case ID_MAX31343:
+		max313xx->irqs[0] = client->irq;
+		break;
+	default:
+		max313xx->irqs[0] = fwnode_irq_get_byname(dev_fwnode(dev), "INTA");
+		max313xx->irqs[1] = fwnode_irq_get_byname(dev_fwnode(dev), "INTB");
+		if (max313xx->irqs[0] <= 0 && max313xx->irqs[1] <= 0 && client->irq)
+			return dev_err_probe(dev, -ENOENT,
+					     "interrupt requested but no interrupt name specified\n");
+
+		break;
+	}
+
+	ret = max313xx_clkout_register(dev);
+	if (ret)
+		return ret;
+
+	ret = max313xx_clkin_init(dev);
+	if (ret)
+		return ret;
+
+	/* IRQ wiring depends on the clock configuration so parse them first */
+	ret = max313xx_irq_init(dev, client->name);
+	if (ret)
+		return ret;
+
+	if (max313xx->chip->ram_size) {
+		max313xx_nvmem_cfg.size = max313xx->chip->ram_size;
+		max313xx_nvmem_cfg.priv = max313xx;
+
+		ret = devm_rtc_nvmem_register(max313xx->rtc, &max313xx_nvmem_cfg);
+		if (ret)
+			dev_warn(dev, "cannot register rtc nvmem\n");
+	}
+
+	if (max313xx->chip->temp_reg) {
+		hwmon = devm_hwmon_device_register_with_info(dev, client->name,
+							     max313xx,
+							     &max313xx_chip_info,
+							     NULL);
+		if (IS_ERR(hwmon))
+			dev_warn(dev, "cannot register hwmon device: %li\n",
+				 PTR_ERR(hwmon));
+	}
+
+	ret = max313xx_trickle_charger_setup(dev);
+	if (ret)
+		return ret;
+
+	if (max313xx->chip->timer_cfg_reg) {
+		max313xx->wdd.parent = dev;
+		max313xx->wdd.info = &max313xx_wdt_info;
+		max313xx->wdd.ops = &max313xx_watchdog_ops;
+		max313xx->wdd.status = WATCHDOG_NOWAYOUT_INIT_STATUS;
+		max313xx->wdd.min_timeout = 2;
+
+		switch (max313xx->id) {
+		case ID_MAX31334:
+			/* 16-bit, 16Hz */
+			max313xx->wdd.max_timeout = 4095;
+			break;
+		default:
+			/* 8-bit, 16Hz */
+			max313xx->wdd.max_timeout = 15;
+		}
+
+		watchdog_set_drvdata(&max313xx->wdd, max313xx);
+
+		/* Set timer frequency to minimum possible value */
+		ret = regmap_write(max313xx->regmap, max313xx->chip->timer_cfg_reg,
+				   FIELD_PREP(MAX313XX_TMR_CFG_FREQ_MASK,
+					      MAX313XX_TMR_CFG_FREQ_16HZ));
+		if (ret) {
+			dev_warn(dev, "cannot set timer frequency\n");
+		} else {
+			ret = devm_watchdog_register_device(dev, &max313xx->wdd);
+			if (ret)
+				dev_warn(dev, "cannot register watchdog dev\n");
+		}
+	}
+
+	return 0;
+}
+
+static const struct of_device_id max313xx_of_id[] = {
+	{ .compatible = "adi,max31328", .data = (void *)ID_MAX31328 },
+	{ .compatible = "adi,max31329", .data = (void *)ID_MAX31329 },
+	{ .compatible = "adi,max31331", .data = (void *)ID_MAX31331 },
+	{ .compatible = "adi,max31334", .data = (void *)ID_MAX31334 },
+	{ .compatible = "adi,max31341", .data = (void *)ID_MAX31341 },
+	{ .compatible = "adi,max31342", .data = (void *)ID_MAX31342 },
+	{ .compatible = "adi,max31343", .data = (void *)ID_MAX31343 },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, max313xx_of_id);
+
+static const struct i2c_device_id max313xx_id[] = {
+	{ "max31328", ID_MAX31328 },
+	{ "max31329", ID_MAX31329 },
+	{ "max31331", ID_MAX31331 },
+	{ "max31334", ID_MAX31334 },
+	{ "max31341", ID_MAX31341 },
+	{ "max31342", ID_MAX31342 },
+	{ "max31343", ID_MAX31343 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, max313xx_id);
+
+static struct i2c_driver max313xx_driver = {
+	.driver = {
+		.name	= "rtc-max313xx",
+		.of_match_table = max313xx_of_id,
+	},
+	.probe		= max313xx_probe,
+	.id_table	= max313xx_id,
+};
+module_i2c_driver(max313xx_driver);
+
+MODULE_DESCRIPTION("Analog Devices MAX313XX RTCs");
+MODULE_AUTHOR("Zeynep Arslanbenzer <Zeynep.Arslanbenzer@analog.com>");
+MODULE_AUTHOR("Ibrahim Tilki <Ibrahim.Tilki@analog.com>");
+MODULE_SOFTDEP("pre: regmap-i2c");
+MODULE_LICENSE("GPL");
+MODULE_VERSION("1.0");
-- 
2.25.1

