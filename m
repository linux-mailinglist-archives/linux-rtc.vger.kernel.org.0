Return-Path: <linux-rtc+bounces-3214-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 825E3A3832B
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Feb 2025 13:41:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 449911883E1B
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Feb 2025 12:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F39F321ADD1;
	Mon, 17 Feb 2025 12:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TFRtTRxt"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B9F13AA5D;
	Mon, 17 Feb 2025 12:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739796104; cv=none; b=lOsG7IU+LKQg7PHKTtnNuqfYDO5rObJfqfyHWXT+PYPKFdqtQ+RXuhzkeOU28jKwqnnj4Jk2T2GJugSFWTEmRAFtoC6bW4RZ7QXmzeWezhZ9h8001P0d4+xZE3DFUOu7h9udT5W4HQ8uaK2+0oxIRo5Uqhi2ibSXl6Q6ac8QXYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739796104; c=relaxed/simple;
	bh=HKotTF9Hfu06Aq3zzigEqgO5A23ICuHhxxdELQosKn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b1F9bV0cEI8/LZtfulPFxZIhgGRcDR9QBOw7JCbIf2blfaGhOuCNA0NxDQqoSfYMQU4eOsYDW+8SCpoiutkWKX52DjqcBZvAs8UfcnvT110qx7tGmjLsfLhGAD8PXFJo9h2H/G8eLxDjjYlAUt8xTDg1gVTRaxlmDhoY9+iBB3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TFRtTRxt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51D72C4CEE2;
	Mon, 17 Feb 2025 12:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739796104;
	bh=HKotTF9Hfu06Aq3zzigEqgO5A23ICuHhxxdELQosKn4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TFRtTRxt2osCT+4usW0PZ8lcj8sbjUEFd8mrj93EBhNe/Lc8lNc6APW9gc2a/wwa6
	 Csgfus/EKK2z7WH0X/DqcPOcTGoUaNwFAgDM5OU0hY1TjthzyNKB0FBH8pW0+Vncs7
	 ta1+d20T0BUQ5sza7c03I8w96K8lktlSLo/uydrhjqvK0reCFYh467wMI9eIhObYnT
	 NQjIypiuviCba58EhpX/2pJDI9d4W7NTj2B3Ed8hqGrKdSsktts50SkJ5FJkW2r1+b
	 lkpCEouKcQwDo3BZrSnMUfBZkoFuAiwUzYZuzHV6FDx+uBcfHMYU3sUeMbQ0+fFybr
	 tvhIgZ5sTfkGQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E17C021AD;
	Mon, 17 Feb 2025 12:41:44 +0000 (UTC)
From: PavithraUdayakumar-adi via B4 Relay <devnull+pavithra.u.analog.com@kernel.org>
Date: Mon, 17 Feb 2025 18:17:17 +0530
Subject: [PATCH RESEND v5 2/2] rtc: max31335: Add driver support for
 max31331
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-add_support_max31331_fix_8-v1-2-16ebcfc02336@analog.com>
References: <20250217-add_support_max31331_fix_8-v1-0-16ebcfc02336@analog.com>
In-Reply-To: <20250217-add_support_max31331_fix_8-v1-0-16ebcfc02336@analog.com>
To: Antoniu Miclaus <antoniu.miclaus@analog.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
 Guenter Roeck <linux@roeck-us.net>, 
 =?utf-8?q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 PavithraUdayakumar-adi <pavithra.u@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739796453; l=12419;
 i=pavithra.u@analog.com; s=20241220; h=from:subject:message-id;
 bh=1stnG/N6HE8QaQ6joNd5xgD+z3/Jmq/go1M+BD9Kck8=;
 b=u3odZIorXh0l1SccQrXJDQPBr4ymnlz6Urc82IqL1FdL7QwBYP0YtoYvJ35x6OV2EE0ocxEto
 NnEz9NMEQGXBV/Szn6eTlhjHryS8ZNsBgA80oR8cKnUX0ffBdeyGwfl
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
 drivers/rtc/rtc-max31335.c | 165 +++++++++++++++++++++++++++++++++------------
 1 file changed, 122 insertions(+), 43 deletions(-)

diff --git a/drivers/rtc/rtc-max31335.c b/drivers/rtc/rtc-max31335.c
index 3fbcf5f6b92ffd4581e9c4dbc87ec848867522dc..a7bb37aaab9e6e315db70bc6bc0dbaa553fdecfa 100644
--- a/drivers/rtc/rtc-max31335.c
+++ b/drivers/rtc/rtc-max31335.c
@@ -184,31 +184,91 @@
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
+
+	enum max_rtc_ids id;
+};
+
 struct max31335_data {
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
+		.id = ID_MAX31331,
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
+		.id = ID_MAX31335,
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
@@ -227,7 +287,7 @@ static int max31335_read_time(struct device *dev, struct rtc_time *tm)
 	u8 date[7];
 	int ret;
 
-	ret = regmap_bulk_read(max31335->regmap, MAX31335_SECONDS, date,
+	ret = regmap_bulk_read(max31335->regmap, max31335->chip->sec_reg, date,
 			       sizeof(date));
 	if (ret)
 		return ret;
@@ -262,7 +322,7 @@ static int max31335_set_time(struct device *dev, struct rtc_time *tm)
 	if (tm->tm_year >= 200)
 		date[5] |= FIELD_PREP(MAX31335_MONTH_CENTURY, 1);
 
-	return regmap_bulk_write(max31335->regmap, MAX31335_SECONDS, date,
+	return regmap_bulk_write(max31335->regmap, max31335->chip->sec_reg, date,
 				 sizeof(date));
 }
 
@@ -273,7 +333,7 @@ static int max31335_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	struct rtc_time time;
 	u8 regs[6];
 
-	ret = regmap_bulk_read(max31335->regmap, MAX31335_ALM1_SEC, regs,
+	ret = regmap_bulk_read(max31335->regmap, max31335->chip->alarm1_sec_reg, regs,
 			       sizeof(regs));
 	if (ret)
 		return ret;
@@ -292,11 +352,11 @@ static int max31335_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
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
 
@@ -320,18 +380,18 @@ static int max31335_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
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
@@ -341,23 +401,33 @@ static int max31335_alarm_irq_enable(struct device *dev, unsigned int enabled)
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
 
-	ret = regmap_update_bits_check(max31335->regmap, MAX31335_STATUS1,
-				       MAX31335_STATUS1_A1F, 0, &status);
+	mutex_lock(lock);
+
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
@@ -404,7 +474,7 @@ static int max31335_trickle_charger_setup(struct device *dev,
 
 	i = i + trickle_cfg;
 
-	return regmap_write(max31335->regmap, MAX31335_TRICKLE_REG,
+	return regmap_write(max31335->regmap, max31335->chip->trickle_reg,
 			    FIELD_PREP(MAX31335_TRICKLE_REG_TRICKLE, i) |
 			    FIELD_PREP(MAX31335_TRICKLE_REG_EN_TRICKLE,
 				       chargeable));
@@ -418,7 +488,7 @@ static unsigned long max31335_clkout_recalc_rate(struct clk_hw *hw,
 	unsigned int reg;
 	int ret;
 
-	ret = regmap_read(max31335->regmap, MAX31335_RTC_CONFIG2, &reg);
+	ret = regmap_read(max31335->regmap, max31335->chip->clkout_reg, &reg);
 	if (ret)
 		return 0;
 
@@ -449,23 +519,23 @@ static int max31335_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
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
 
@@ -475,7 +545,7 @@ static int max31335_clkout_is_enabled(struct clk_hw *hw)
 	unsigned int reg;
 	int ret;
 
-	ret = regmap_read(max31335->regmap, MAX31335_RTC_CONFIG2, &reg);
+	ret = regmap_read(max31335->regmap, max31335->chip->clkout_reg, &reg);
 	if (ret)
 		return ret;
 
@@ -500,7 +570,7 @@ static int max31335_nvmem_reg_read(void *priv, unsigned int offset,
 				   void *val, size_t bytes)
 {
 	struct max31335_data *max31335 = priv;
-	unsigned int reg = MAX31335_TS0_SEC_1_128 + offset;
+	unsigned int reg = max31335->chip->ram_reg + offset;
 
 	return regmap_bulk_read(max31335->regmap, reg, val, bytes);
 }
@@ -509,7 +579,7 @@ static int max31335_nvmem_reg_write(void *priv, unsigned int offset,
 				    void *val, size_t bytes)
 {
 	struct max31335_data *max31335 = priv;
-	unsigned int reg = MAX31335_TS0_SEC_1_128 + offset;
+	unsigned int reg = max31335->chip->ram_reg + offset;
 
 	return regmap_bulk_write(max31335->regmap, reg, val, bytes);
 }
@@ -533,7 +603,7 @@ static int max31335_read_temp(struct device *dev, enum hwmon_sensor_types type,
 	if (type != hwmon_temp || attr != hwmon_temp_input)
 		return -EOPNOTSUPP;
 
-	ret = regmap_bulk_read(max31335->regmap, MAX31335_TEMP_DATA_MSB,
+	ret = regmap_bulk_read(max31335->regmap, max31335->chip->temp_reg,
 			       reg, 2);
 	if (ret)
 		return ret;
@@ -577,8 +647,8 @@ static int max31335_clkout_register(struct device *dev)
 	int ret;
 
 	if (!device_property_present(dev, "#clock-cells"))
-		return regmap_clear_bits(max31335->regmap, MAX31335_RTC_CONFIG2,
-					 MAX31335_RTC_CONFIG2_ENCLKO);
+		return regmap_clear_bits(max31335->regmap, max31335->chip->clkout_reg,
+				  MAX31335_RTC_CONFIG2_ENCLKO);
 
 	max31335->clkout.init = &max31335_clk_init;
 
@@ -605,6 +675,7 @@ static int max31335_probe(struct i2c_client *client)
 #if IS_REACHABLE(HWMON)
 	struct device *hwmon;
 #endif
+	const struct chip_desc *match;
 	int ret;
 
 	max31335 = devm_kzalloc(&client->dev, sizeof(*max31335), GFP_KERNEL);
@@ -616,7 +687,10 @@ static int max31335_probe(struct i2c_client *client)
 		return PTR_ERR(max31335->regmap);
 
 	i2c_set_clientdata(client, max31335);
-
+	match = i2c_get_match_data(client);
+	if (!match)
+		return -ENODEV;
+	max31335->chip = match;
 	max31335->rtc = devm_rtc_allocate_device(&client->dev);
 	if (IS_ERR(max31335->rtc))
 		return PTR_ERR(max31335->rtc);
@@ -639,6 +713,8 @@ static int max31335_probe(struct i2c_client *client)
 			dev_warn(&client->dev,
 				 "unable to request IRQ, alarm max31335 disabled\n");
 			client->irq = 0;
+		} else {
+			max31335->irq = client->irq;
 		}
 	}
 
@@ -652,13 +728,13 @@ static int max31335_probe(struct i2c_client *client)
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
@@ -669,14 +745,16 @@ static int max31335_probe(struct i2c_client *client)
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
 
@@ -693,5 +771,6 @@ static struct i2c_driver max31335_driver = {
 module_i2c_driver(max31335_driver);
 
 MODULE_AUTHOR("Antoniu Miclaus <antoniu.miclaus@analog.com>");
+MODULE_AUTHOR("Saket Kumar Purwar <Saket.Kumarpurwar@analog.com>");
 MODULE_DESCRIPTION("MAX31335 RTC driver");
 MODULE_LICENSE("GPL");

-- 
2.25.1



