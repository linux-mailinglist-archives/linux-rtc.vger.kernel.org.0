Return-Path: <linux-rtc+bounces-2852-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C89A8A07300
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Jan 2025 11:26:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D924188B6D4
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Jan 2025 10:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C99BC2185B1;
	Thu,  9 Jan 2025 10:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H8lKv3Xk"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8827A2153F5;
	Thu,  9 Jan 2025 10:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736418229; cv=none; b=ISZjtmrkGe6BqXo810pz3J4tTzdtg4AA8tvPWGir6MLQ4ZoqAt0I9NBahpBPgoPJ6oVfFYLMeD/ubZKOAo6UGBvALOUwezQn56fMkoD50q9rSBh8DfWNdgpmJW00EApWDTecR/PS9cdKhVPQg3yijJDLXv596hF3mZEOF9k4Lsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736418229; c=relaxed/simple;
	bh=zXeLEwiAoXEkQtz764smFDBzZjb9Ud3jHLkg0f2L0lA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V9Xmy7x9FYbxPcYUG8wp9fMPDe79mBys/8F7yj/WU//MhbmFF8TWzVeOw8H4898pdJ4SHxHHw+ptTHvRZ7com8FDx7JA2qvhOoCOwH+FEt8+r4SzLcEy554gJhbkLZf/jBhE+pbBlXsVPbyPw/8iQKjUMEzwfcZxQH4uD4dOPx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H8lKv3Xk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 23D08C4CEE1;
	Thu,  9 Jan 2025 10:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736418229;
	bh=zXeLEwiAoXEkQtz764smFDBzZjb9Ud3jHLkg0f2L0lA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=H8lKv3XkLJcm74qVnYvIwXI3BCrfeuGbvQivVE1eKDYfgv6KtaObmkpaM+PyPNQMV
	 kNHSW6ziqXaE2FxYBITIWiqvb1smVLfyhJroKXtHOpP0Y56c35+by98qSIh1SVt6+X
	 FsmX7My0keMv8y6Lilgf/sp8rKrNBi+cx+tIX/qyVFQIINsPXktlYAHT4stzzHX5Q8
	 9UWeqp6OLRQXnY1WyFYSQBiADT45ZWyts2vfFN2KL20E3XEBjz7DB+xM4sCtIaOwqh
	 Q/udXU9CNFd4fZLhLOmZrLns6E+u7T8DRrKo/fINBDgx4pYx3hzjgLULUw/mziUhuk
	 NGQUllHF42BmQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17D67E77197;
	Thu,  9 Jan 2025 10:23:49 +0000 (UTC)
From: PavithraUdayakumar-adi via B4 Relay <devnull+pavithra.u.analog.com@kernel.org>
Date: Thu, 09 Jan 2025 15:59:58 +0530
Subject: [PATCH v3 2/2] rtc: max31335: Add driver support for max31331
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-add_support_max31331_fix_3-v1-2-a74fac29bf49@analog.com>
References: <20250109-add_support_max31331_fix_3-v1-0-a74fac29bf49@analog.com>
In-Reply-To: <20250109-add_support_max31331_fix_3-v1-0-a74fac29bf49@analog.com>
To: Antoniu Miclaus <antoniu.miclaus@analog.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 PavithraUdayakumar-adi <pavithra.u@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736418610; l=12411;
 i=pavithra.u@analog.com; s=20241220; h=from:subject:message-id;
 bh=6qqwZdZMsx8uYPaxC/OR1gGzTcvgt3A3wegOTAdkcG0=;
 b=fS7U07fpaqsRqHvm626dni6ojLz4rDn74JLbeBijbgkGPnTZscQw5w2535V8Br3LDBTsH8Ezj
 lRDjdKfUrb/A9l74oa6OMzzqD5dATcvln5rxqxnSEtTklcnwljgZOTX
X-Developer-Key: i=pavithra.u@analog.com; a=ed25519;
 pk=RIhZrdpg71GEnmwm1eNn95TYUMDJOKVsFd37Fv8xf1U=
X-Endpoint-Received: by B4 Relay for pavithra.u@analog.com/20241220 with
 auth_id=303
X-Original-From: PavithraUdayakumar-adi <pavithra.u@analog.com>
Reply-To: pavithra.u@analog.com

From: PavithraUdayakumar-adi <pavithra.u@analog.com>

MAX31331 is an ultra-low-power, I2C Real-Time Clock RTC.

Signed-off-by: PavithraUdayakumar-adi <pavithra.u@analog.com>
---
 drivers/rtc/rtc-max31335.c | 163 +++++++++++++++++++++++++++++++++------------
 1 file changed, 120 insertions(+), 43 deletions(-)

diff --git a/drivers/rtc/rtc-max31335.c b/drivers/rtc/rtc-max31335.c
index 3fbcf5f6b92ffd4581e9c4dbc87ec848867522dc..9d8f220fba2b21fc6393d67bff47f99b0227c707 100644
--- a/drivers/rtc/rtc-max31335.c
+++ b/drivers/rtc/rtc-max31335.c
@@ -184,31 +184,88 @@
 #define MAX31335_RAM_SIZE			32
 #define MAX31335_TIME_SIZE			0x07
 
+/* MAX31331 Register Map */
+#define MAX31331_RTC_CONFIG2			0x04
+
 #define clk_hw_to_max31335(_hw) container_of(_hw, struct max31335_data, clkout)
 
+/* Supported Maxim RTC */
+enum max_rtc_ids {
+	ID_MAX31331,
+	ID_MAX31335,
+	MAX_RTC_ID_NR
+};
+
+struct chip_desc {
+	u8 sec_reg;
+	u8 alarm1_sec_reg;
+
+	u8 int_en_reg;
+	u8 int_status_reg;
+
+	u8 ram_reg;
+	u8 ram_size;
+
+	u8 temp_reg;
+
+	u8 trickle_reg;
+
+	u8 clkout_reg;
+};
+
 struct max31335_data {
+	enum max_rtc_ids id;
 	struct regmap *regmap;
 	struct rtc_device *rtc;
 	struct clk_hw clkout;
+	struct clk *clkin;
+	const struct chip_desc *chip;
+	int irq;
 };
 
 static const int max31335_clkout_freq[] = { 1, 64, 1024, 32768 };
 
+static const struct chip_desc chip[MAX_RTC_ID_NR] = {
+	[ID_MAX31331] = {
+		.int_en_reg = 0x01,
+		.int_status_reg = 0x00,
+		.sec_reg = 0x08,
+		.alarm1_sec_reg = 0x0F,
+		.ram_reg = 0x20,
+		.ram_size = 32,
+		.trickle_reg = 0x1B,
+		.clkout_reg = 0x04,
+	},
+	[ID_MAX31335] = {
+		.int_en_reg = 0x01,
+		.int_status_reg = 0x00,
+		.sec_reg = 0x0A,
+		.alarm1_sec_reg = 0x11,
+		.ram_reg = 0x40,
+		.ram_size = 32,
+		.temp_reg = 0x35,
+		.trickle_reg = 0x1D,
+		.clkout_reg = 0x06,
+	},
+};
+
 static const u16 max31335_trickle_resistors[] = {3000, 6000, 11000};
 
 static bool max31335_volatile_reg(struct device *dev, unsigned int reg)
 {
+	struct max31335_data *max31335 = dev_get_drvdata(dev);
+	const struct chip_desc *chip = max31335->chip;
+
 	/* time keeping registers */
-	if (reg >= MAX31335_SECONDS &&
-	    reg < MAX31335_SECONDS + MAX31335_TIME_SIZE)
+	if (reg >= chip->sec_reg && reg < chip->sec_reg + MAX31335_TIME_SIZE)
 		return true;
 
 	/* interrupt status register */
-	if (reg == MAX31335_STATUS1)
+	if (reg == chip->int_status_reg)
 		return true;
 
-	/* temperature registers */
-	if (reg == MAX31335_TEMP_DATA_MSB || reg == MAX31335_TEMP_DATA_LSB)
+	/* temperature registers if valid */
+	if (chip->temp_reg && (reg == chip->temp_reg || reg == chip->temp_reg + 1))
 		return true;
 
 	return false;
@@ -227,7 +284,7 @@ static int max31335_read_time(struct device *dev, struct rtc_time *tm)
 	u8 date[7];
 	int ret;
 
-	ret = regmap_bulk_read(max31335->regmap, MAX31335_SECONDS, date,
+	ret = regmap_bulk_read(max31335->regmap, max31335->chip->sec_reg, date,
 			       sizeof(date));
 	if (ret)
 		return ret;
@@ -262,7 +319,7 @@ static int max31335_set_time(struct device *dev, struct rtc_time *tm)
 	if (tm->tm_year >= 200)
 		date[5] |= FIELD_PREP(MAX31335_MONTH_CENTURY, 1);
 
-	return regmap_bulk_write(max31335->regmap, MAX31335_SECONDS, date,
+	return regmap_bulk_write(max31335->regmap, max31335->chip->sec_reg, date,
 				 sizeof(date));
 }
 
@@ -273,7 +330,7 @@ static int max31335_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	struct rtc_time time;
 	u8 regs[6];
 
-	ret = regmap_bulk_read(max31335->regmap, MAX31335_ALM1_SEC, regs,
+	ret = regmap_bulk_read(max31335->regmap, max31335->chip->alarm1_sec_reg, regs,
 			       sizeof(regs));
 	if (ret)
 		return ret;
@@ -292,11 +349,11 @@ static int max31335_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	if (time.tm_year >= 200)
 		alrm->time.tm_year += 100;
 
-	ret = regmap_read(max31335->regmap, MAX31335_INT_EN1, &ctrl);
+	ret = regmap_read(max31335->regmap, max31335->chip->int_en_reg, &ctrl);
 	if (ret)
 		return ret;
 
-	ret = regmap_read(max31335->regmap, MAX31335_STATUS1, &status);
+	ret = regmap_read(max31335->regmap, max31335->chip->int_status_reg, &status);
 	if (ret)
 		return ret;
 
@@ -320,18 +377,18 @@ static int max31335_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	regs[4] = bin2bcd(alrm->time.tm_mon + 1);
 	regs[5] = bin2bcd(alrm->time.tm_year % 100);
 
-	ret = regmap_bulk_write(max31335->regmap, MAX31335_ALM1_SEC,
+	ret = regmap_bulk_write(max31335->regmap, max31335->chip->alarm1_sec_reg,
 				regs, sizeof(regs));
 	if (ret)
 		return ret;
 
 	reg = FIELD_PREP(MAX31335_INT_EN1_A1IE, alrm->enabled);
-	ret = regmap_update_bits(max31335->regmap, MAX31335_INT_EN1,
+	ret = regmap_update_bits(max31335->regmap, max31335->chip->int_en_reg,
 				 MAX31335_INT_EN1_A1IE, reg);
 	if (ret)
 		return ret;
 
-	ret = regmap_update_bits(max31335->regmap, MAX31335_STATUS1,
+	ret = regmap_update_bits(max31335->regmap, max31335->chip->int_status_reg,
 				 MAX31335_STATUS1_A1F, 0);
 
 	return 0;
@@ -341,23 +398,33 @@ static int max31335_alarm_irq_enable(struct device *dev, unsigned int enabled)
 {
 	struct max31335_data *max31335 = dev_get_drvdata(dev);
 
-	return regmap_update_bits(max31335->regmap, MAX31335_INT_EN1,
+	return regmap_update_bits(max31335->regmap, max31335->chip->int_en_reg,
 				  MAX31335_INT_EN1_A1IE, enabled);
 }
 
 static irqreturn_t max31335_handle_irq(int irq, void *dev_id)
 {
 	struct max31335_data *max31335 = dev_id;
-	bool status;
-	int ret;
+	struct mutex *lock = &max31335->rtc->ops_lock;
+	int ret, status;
+
+	mutex_lock(lock);
 
-	ret = regmap_update_bits_check(max31335->regmap, MAX31335_STATUS1,
-				       MAX31335_STATUS1_A1F, 0, &status);
+	ret = regmap_read(max31335->regmap, max31335->chip->int_status_reg, &status);
 	if (ret)
-		return IRQ_HANDLED;
+		goto exit;
+
+	if (FIELD_GET(MAX31335_STATUS1_A1F, status)) {
+		ret = regmap_update_bits(max31335->regmap, max31335->chip->int_status_reg,
+					 MAX31335_STATUS1_A1F, 0);
+		if (ret)
+			goto exit;
 
-	if (status)
 		rtc_update_irq(max31335->rtc, 1, RTC_AF | RTC_IRQF);
+	}
+
+exit:
+	mutex_unlock(lock);
 
 	return IRQ_HANDLED;
 }
@@ -404,7 +471,7 @@ static int max31335_trickle_charger_setup(struct device *dev,
 
 	i = i + trickle_cfg;
 
-	return regmap_write(max31335->regmap, MAX31335_TRICKLE_REG,
+	return regmap_write(max31335->regmap, max31335->chip->trickle_reg,
 			    FIELD_PREP(MAX31335_TRICKLE_REG_TRICKLE, i) |
 			    FIELD_PREP(MAX31335_TRICKLE_REG_EN_TRICKLE,
 				       chargeable));
@@ -418,7 +485,7 @@ static unsigned long max31335_clkout_recalc_rate(struct clk_hw *hw,
 	unsigned int reg;
 	int ret;
 
-	ret = regmap_read(max31335->regmap, MAX31335_RTC_CONFIG2, &reg);
+	ret = regmap_read(max31335->regmap, max31335->chip->clkout_reg, &reg);
 	if (ret)
 		return 0;
 
@@ -449,23 +516,23 @@ static int max31335_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
 			     ARRAY_SIZE(max31335_clkout_freq));
 	freq_mask = __roundup_pow_of_two(ARRAY_SIZE(max31335_clkout_freq)) - 1;
 
-	return regmap_update_bits(max31335->regmap, MAX31335_RTC_CONFIG2,
-				  freq_mask, index);
+	return regmap_update_bits(max31335->regmap, max31335->chip->clkout_reg,
+				 freq_mask, index);
 }
 
 static int max31335_clkout_enable(struct clk_hw *hw)
 {
 	struct max31335_data *max31335 = clk_hw_to_max31335(hw);
 
-	return regmap_set_bits(max31335->regmap, MAX31335_RTC_CONFIG2,
-			       MAX31335_RTC_CONFIG2_ENCLKO);
+	return regmap_set_bits(max31335->regmap, max31335->chip->clkout_reg,
+			      MAX31335_RTC_CONFIG2_ENCLKO);
 }
 
 static void max31335_clkout_disable(struct clk_hw *hw)
 {
 	struct max31335_data *max31335 = clk_hw_to_max31335(hw);
 
-	regmap_clear_bits(max31335->regmap, MAX31335_RTC_CONFIG2,
+	regmap_clear_bits(max31335->regmap, max31335->chip->clkout_reg,
 			  MAX31335_RTC_CONFIG2_ENCLKO);
 }
 
@@ -475,7 +542,7 @@ static int max31335_clkout_is_enabled(struct clk_hw *hw)
 	unsigned int reg;
 	int ret;
 
-	ret = regmap_read(max31335->regmap, MAX31335_RTC_CONFIG2, &reg);
+	ret = regmap_read(max31335->regmap, max31335->chip->clkout_reg, &reg);
 	if (ret)
 		return ret;
 
@@ -500,7 +567,7 @@ static int max31335_nvmem_reg_read(void *priv, unsigned int offset,
 				   void *val, size_t bytes)
 {
 	struct max31335_data *max31335 = priv;
-	unsigned int reg = MAX31335_TS0_SEC_1_128 + offset;
+	unsigned int reg = max31335->chip->ram_reg + offset;
 
 	return regmap_bulk_read(max31335->regmap, reg, val, bytes);
 }
@@ -509,7 +576,7 @@ static int max31335_nvmem_reg_write(void *priv, unsigned int offset,
 				    void *val, size_t bytes)
 {
 	struct max31335_data *max31335 = priv;
-	unsigned int reg = MAX31335_TS0_SEC_1_128 + offset;
+	unsigned int reg = max31335->chip->ram_reg + offset;
 
 	return regmap_bulk_write(max31335->regmap, reg, val, bytes);
 }
@@ -533,7 +600,7 @@ static int max31335_read_temp(struct device *dev, enum hwmon_sensor_types type,
 	if (type != hwmon_temp || attr != hwmon_temp_input)
 		return -EOPNOTSUPP;
 
-	ret = regmap_bulk_read(max31335->regmap, MAX31335_TEMP_DATA_MSB,
+	ret = regmap_bulk_read(max31335->regmap, max31335->chip->temp_reg,
 			       reg, 2);
 	if (ret)
 		return ret;
@@ -577,8 +644,8 @@ static int max31335_clkout_register(struct device *dev)
 	int ret;
 
 	if (!device_property_present(dev, "#clock-cells"))
-		return regmap_clear_bits(max31335->regmap, MAX31335_RTC_CONFIG2,
-					 MAX31335_RTC_CONFIG2_ENCLKO);
+		return regmap_clear_bits(max31335->regmap, max31335->chip->clkout_reg,
+				  MAX31335_RTC_CONFIG2_ENCLKO);
 
 	max31335->clkout.init = &max31335_clk_init;
 
@@ -605,6 +672,7 @@ static int max31335_probe(struct i2c_client *client)
 #if IS_REACHABLE(HWMON)
 	struct device *hwmon;
 #endif
+	const struct chip_desc *match;
 	int ret;
 
 	max31335 = devm_kzalloc(&client->dev, sizeof(*max31335), GFP_KERNEL);
@@ -616,7 +684,11 @@ static int max31335_probe(struct i2c_client *client)
 		return PTR_ERR(max31335->regmap);
 
 	i2c_set_clientdata(client, max31335);
-
+	match = i2c_get_match_data(client);
+	if (!match)
+		return -ENODEV;
+	max31335->chip = match;
+	max31335->id = max31335->chip - chip;
 	max31335->rtc = devm_rtc_allocate_device(&client->dev);
 	if (IS_ERR(max31335->rtc))
 		return PTR_ERR(max31335->rtc);
@@ -639,6 +711,8 @@ static int max31335_probe(struct i2c_client *client)
 			dev_warn(&client->dev,
 				 "unable to request IRQ, alarm max31335 disabled\n");
 			client->irq = 0;
+		} else {
+			max31335->irq = client->irq;
 		}
 	}
 
@@ -652,13 +726,13 @@ static int max31335_probe(struct i2c_client *client)
 				     "cannot register rtc nvmem\n");
 
 #if IS_REACHABLE(HWMON)
-	hwmon = devm_hwmon_device_register_with_info(&client->dev, client->name,
-						     max31335,
-						     &max31335_chip_info,
-						     NULL);
-	if (IS_ERR(hwmon))
-		return dev_err_probe(&client->dev, PTR_ERR(hwmon),
-				     "cannot register hwmon device\n");
+	if (max31335->chip->temp_reg) {
+		hwmon = devm_hwmon_device_register_with_info(&client->dev, client->name, max31335,
+							     &max31335_chip_info, NULL);
+		if (IS_ERR(hwmon))
+			return dev_err_probe(&client->dev, PTR_ERR(hwmon),
+					     "cannot register hwmon device\n");
+	}
 #endif
 
 	ret = max31335_trickle_charger_setup(&client->dev, max31335);
@@ -669,14 +743,16 @@ static int max31335_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id max31335_id[] = {
-	{ "max31335" },
+	{ "max31331", (kernel_ulong_t)&chip[ID_MAX31331] },
+	{ "max31335", (kernel_ulong_t)&chip[ID_MAX31335] },
 	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, max31335_id);
 
 static const struct of_device_id max31335_of_match[] = {
-	{ .compatible = "adi,max31335" },
+	{ .compatible = "adi,max31331", .data = &chip[ID_MAX31331] },
+	{ .compatible = "adi,max31335", .data = &chip[ID_MAX31335] },
 	{ }
 };
 
@@ -693,5 +769,6 @@ static struct i2c_driver max31335_driver = {
 module_i2c_driver(max31335_driver);
 
 MODULE_AUTHOR("Antoniu Miclaus <antoniu.miclaus@analog.com>");
+MODULE_AUTHOR("Saket Kumar Purwar <Saket.Kumarpurwar@analog.com>");
 MODULE_DESCRIPTION("MAX31335 RTC driver");
 MODULE_LICENSE("GPL");

-- 
2.25.1



