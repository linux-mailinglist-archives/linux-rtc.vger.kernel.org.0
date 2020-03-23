Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA08918F4DA
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Mar 2020 13:44:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727816AbgCWMoJ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 23 Mar 2020 08:44:09 -0400
Received: from smtpbgbr2.qq.com ([54.207.22.56]:51276 "EHLO smtpbgbr2.qq.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727130AbgCWMoI (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 23 Mar 2020 08:44:08 -0400
X-QQ-mid: bizesmtp18t1584967435ti4jciih
Received: from localhost.localdomain (unknown [111.28.140.218])
        by esmtp6.qq.com (ESMTP) with 
        id ; Mon, 23 Mar 2020 20:43:50 +0800 (CST)
X-QQ-SSF: 01400000002000N0LK40000A0000000
X-QQ-FEAT: l6IKqkG+NbmnTzhhSjlwXeIFg3xPimgfC6ypQbKVpI1J+Ab2fXpp0EFJeK9wk
        M1HzUXoowpwDnu2dwtLabXaHW6uAlbvNGa4vxLSUxOjFbQGTnM2BmHLMkWjQHjuZoukhXrg
        9CoW9ZeTJhfK02dIom67FBJENnH1vSl/mwAgpDlhKbiksMNgUrSZEpaUDQ9v4RoJyLiT5zI
        TKXffPiQWqmVa5VCQ6NbWL6vcxOz5FatAy0iNUQqaIcexRBP7JDWbRAt1RuUiUy/BNFJz+n
        jpC3sgJR6Xmfo1GsHP11GerXNjjVPFr9A1OAb/QySvKqMKEogpfQJIE/+MLCJ3ChtRKQcI7
        M1JQwVq
X-QQ-GoodBg: 2
From:   xiaolinkui <xiaolinkui@tj.kylinos.cn>
To:     a.zummo@towertech.it
Cc:     alexandre.belloni@bootlin.com, linux-rtc@vger.kernel.org,
        xiaolinkui <xiaolinkui@tj.kylinos.cn>
Subject: [PATCH] rtc: Kconfig: change the tristate type to bool
Date:   Mon, 23 Mar 2020 20:43:39 +0800
Message-Id: <20200323124339.6520-1-xiaolinkui@tj.kylinos.cn>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tj.kylinos.cn:qybgforeign:qybgforeign6
X-QQ-Bgrelay: 1
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

If the rtc driver is compiled into a module, hctosys can't
read the rtc clock during system startup.
The dmesg log will have the following information:

[    2.286512] hctosys: unable to open rtc device (rtc0)

So the rtc driver configuration we need cannot be set to m.

Signed-off-by: xiaolinkui <xiaolinkui@tj.kylinos.cn>
---
 drivers/rtc/Kconfig | 321 ++++++++++++++++++++++----------------------
 1 file changed, 160 insertions(+), 161 deletions(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 8e503881d9d6..b12f22d9d41b 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -139,7 +139,7 @@ config RTC_INTF_DEV_UIE_EMUL
 	  only if you know that you really need it.
 
 config RTC_DRV_TEST
-	tristate "Test driver/device"
+	bool "Test driver/device"
 	help
 	  If you say yes here you get support for the
 	  RTC test driver. It's a software RTC which can be
@@ -157,7 +157,7 @@ comment "I2C RTC drivers"
 if I2C
 
 config RTC_DRV_88PM860X
-	tristate "Marvell 88PM860x"
+	bool "Marvell 88PM860x"
 	depends on MFD_88PM860X
 	help
 	  If you say yes here you get support for RTC function in Marvell
@@ -167,7 +167,7 @@ config RTC_DRV_88PM860X
 	  will be called rtc-88pm860x.
 
 config RTC_DRV_88PM80X
-	tristate "Marvell 88PM80x"
+	bool "Marvell 88PM80x"
 	depends on MFD_88PM800
 	help
 	  If you say yes here you get support for RTC function in Marvell
@@ -178,7 +178,7 @@ config RTC_DRV_88PM80X
 
 config RTC_DRV_ABB5ZES3
 	select REGMAP_I2C
-	tristate "Abracon AB-RTCMC-32.768kHz-B5ZE-S3"
+	bool "Abracon AB-RTCMC-32.768kHz-B5ZE-S3"
 	help
 	  If you say yes here you get support for the Abracon
 	  AB-RTCMC-32.768kHz-B5ZE-S3 I2C RTC chip.
@@ -188,7 +188,7 @@ config RTC_DRV_ABB5ZES3
 
 config RTC_DRV_ABEOZ9
 	select REGMAP_I2C
-	tristate "Abracon AB-RTCMC-32.768kHz-EOZ9"
+	bool "Abracon AB-RTCMC-32.768kHz-EOZ9"
 	help
 	  If you say yes here you get support for the Abracon
 	  AB-RTCMC-32.768kHz-EOA9 I2C RTC chip.
@@ -197,7 +197,7 @@ config RTC_DRV_ABEOZ9
 	  will be called rtc-ab-e0z9.
 
 config RTC_DRV_ABX80X
-	tristate "Abracon ABx80x"
+	bool "Abracon ABx80x"
 	select WATCHDOG_CORE if WATCHDOG
 	help
 	  If you say yes here you get support for Abracon AB080X and AB180X
@@ -208,7 +208,7 @@ config RTC_DRV_ABX80X
 	  will be called rtc-abx80x.
 
 config RTC_DRV_AC100
-	tristate "X-Powers AC100"
+	bool "X-Powers AC100"
 	depends on MFD_AC100
 	help
 	  If you say yes here you get support for the real-time clock found
@@ -218,7 +218,7 @@ config RTC_DRV_AC100
 	  will be called rtc-ac100.
 
 config RTC_DRV_BRCMSTB
-	tristate "Broadcom STB wake-timer"
+	bool "Broadcom STB wake-timer"
 	depends on ARCH_BRCMSTB || BMIPS_GENERIC || COMPILE_TEST
 	default ARCH_BRCMSTB || BMIPS_GENERIC
 	help
@@ -229,7 +229,7 @@ config RTC_DRV_BRCMSTB
 	  be called rtc-brcmstb-waketimer.
 
 config RTC_DRV_AS3722
-	tristate "ams AS3722 RTC driver"
+	bool "ams AS3722 RTC driver"
 	depends on MFD_AS3722
 	help
 	  If you say yes here you get support for the RTC of ams AS3722 PMIC
@@ -239,7 +239,7 @@ config RTC_DRV_AS3722
 	  will be called rtc-as3722.
 
 config RTC_DRV_DS1307
-	tristate "Dallas/Maxim DS1307/37/38/39/40/41, ST M41T00, EPSON RX-8025, ISL12057"
+	bool "Dallas/Maxim DS1307/37/38/39/40/41, ST M41T00, EPSON RX-8025, ISL12057"
 	select REGMAP_I2C
 	help
 	  If you say yes here you get support for various compatible RTC
@@ -272,7 +272,7 @@ config RTC_DRV_DS1307_CENTURY
 	  the RTC date and then boot a kernel with this option set.
 
 config RTC_DRV_DS1374
-	tristate "Dallas/Maxim DS1374"
+	bool "Dallas/Maxim DS1374"
 	help
 	  If you say yes here you get support for Dallas Semiconductor
 	  DS1374 real-time clock chips. If an interrupt is associated
@@ -290,7 +290,7 @@ config RTC_DRV_DS1374_WDT
 	  real-time clock chips.
 
 config RTC_DRV_DS1672
-	tristate "Dallas/Maxim DS1672"
+	bool "Dallas/Maxim DS1672"
 	help
 	  If you say yes here you get support for the
 	  Dallas/Maxim DS1672 timekeeping chip.
@@ -299,7 +299,7 @@ config RTC_DRV_DS1672
 	  will be called rtc-ds1672.
 
 config RTC_DRV_HYM8563
-	tristate "Haoyu Microelectronics HYM8563"
+	bool "Haoyu Microelectronics HYM8563"
 	depends on OF
 	help
 	  Say Y to enable support for the HYM8563 I2C RTC chip. Apart
@@ -310,13 +310,13 @@ config RTC_DRV_HYM8563
 	  will be called rtc-hym8563.
 
 config RTC_DRV_LP8788
-	tristate "TI LP8788 RTC driver"
+	bool "TI LP8788 RTC driver"
 	depends on MFD_LP8788
 	help
 	  Say Y to enable support for the LP8788 RTC/ALARM driver.
 
 config RTC_DRV_MAX6900
-	tristate "Maxim MAX6900"
+	bool "Maxim MAX6900"
 	help
 	  If you say yes here you will get support for the
 	  Maxim MAX6900 I2C RTC chip.
@@ -325,7 +325,7 @@ config RTC_DRV_MAX6900
 	  will be called rtc-max6900.
 
 config RTC_DRV_MAX8907
-	tristate "Maxim MAX8907"
+	bool "Maxim MAX8907"
 	depends on MFD_MAX8907 || COMPILE_TEST
 	select REGMAP_IRQ
 	help
@@ -336,7 +336,7 @@ config RTC_DRV_MAX8907
 	  will be called rtc-max8907.
 
 config RTC_DRV_MAX8925
-	tristate "Maxim MAX8925"
+	bool "Maxim MAX8925"
 	depends on MFD_MAX8925
 	help
 	  If you say yes here you will get support for the
@@ -346,7 +346,7 @@ config RTC_DRV_MAX8925
 	  will be called rtc-max8925.
 
 config RTC_DRV_MAX8998
-	tristate "Maxim MAX8998"
+	bool "Maxim MAX8998"
 	depends on MFD_MAX8998
 	help
 	  If you say yes here you will get support for the
@@ -356,7 +356,7 @@ config RTC_DRV_MAX8998
 	  will be called rtc-max8998.
 
 config RTC_DRV_MAX8997
-	tristate "Maxim MAX8997"
+	bool "Maxim MAX8997"
 	depends on MFD_MAX8997
 	help
 	  If you say yes here you will get support for the
@@ -366,7 +366,7 @@ config RTC_DRV_MAX8997
 	  will be called rtc-max8997.
 
 config RTC_DRV_MAX77686
-	tristate "Maxim MAX77686"
+	bool "Maxim MAX77686"
 	depends on MFD_MAX77686 || MFD_MAX77620 || COMPILE_TEST
 	help
 	  If you say yes here you will get support for the
@@ -376,7 +376,7 @@ config RTC_DRV_MAX77686
 	  will be called rtc-max77686.
 
 config RTC_DRV_RK808
-	tristate "Rockchip RK805/RK808/RK809/RK817/RK818 RTC"
+	bool "Rockchip RK805/RK808/RK809/RK817/RK818 RTC"
 	depends on MFD_RK808
 	help
 	  If you say yes here you will get support for the
@@ -386,7 +386,7 @@ config RTC_DRV_RK808
 	  will be called rk808-rtc.
 
 config RTC_DRV_RS5C372
-	tristate "Ricoh R2025S/D, RS5C372A/B, RV5C386, RV5C387A"
+	bool "Ricoh R2025S/D, RS5C372A/B, RV5C386, RV5C387A"
 	help
 	  If you say yes here you get support for the
 	  Ricoh R2025S/D, RS5C372A, RS5C372B, RV5C386, and RV5C387A RTC chips.
@@ -395,7 +395,7 @@ config RTC_DRV_RS5C372
 	  will be called rtc-rs5c372.
 
 config RTC_DRV_ISL1208
-	tristate "Intersil ISL1208"
+	bool "Intersil ISL1208"
 	help
 	  If you say yes here you get support for the
 	  Intersil ISL1208 RTC chip.
@@ -404,7 +404,7 @@ config RTC_DRV_ISL1208
 	  will be called rtc-isl1208.
 
 config RTC_DRV_ISL12022
-	tristate "Intersil ISL12022"
+	bool "Intersil ISL12022"
 	help
 	  If you say yes here you get support for the
 	  Intersil ISL12022 RTC chip.
@@ -413,7 +413,7 @@ config RTC_DRV_ISL12022
 	  will be called rtc-isl12022.
 
 config RTC_DRV_ISL12026
-	tristate "Intersil ISL12026"
+	bool "Intersil ISL12026"
 	depends on OF || COMPILE_TEST
 	help
 	  If you say yes here you get support for the
@@ -423,7 +423,7 @@ config RTC_DRV_ISL12026
 	  will be called rtc-isl12026.
 
 config RTC_DRV_X1205
-	tristate "Xicor/Intersil X1205"
+	bool "Xicor/Intersil X1205"
 	help
 	  If you say yes here you get support for the
 	  Xicor/Intersil X1205 RTC chip.
@@ -432,7 +432,7 @@ config RTC_DRV_X1205
 	  will be called rtc-x1205.
 
 config RTC_DRV_PCF8523
-	tristate "NXP PCF8523"
+	bool "NXP PCF8523"
 	help
 	  If you say yes here you get support for the NXP PCF8523 RTC
 	  chips.
@@ -441,7 +441,7 @@ config RTC_DRV_PCF8523
 	  will be called rtc-pcf8523.
 
 config RTC_DRV_PCF85063
-	tristate "NXP PCF85063"
+	bool "NXP PCF85063"
 	select REGMAP_I2C
 	help
 	  If you say yes here you get support for the PCF85063 RTC chip
@@ -450,7 +450,7 @@ config RTC_DRV_PCF85063
 	  will be called rtc-pcf85063.
 
 config RTC_DRV_PCF85363
-	tristate "NXP PCF85363"
+	bool "NXP PCF85363"
 	select REGMAP_I2C
 	help
 	  If you say yes here you get support for the PCF85363 RTC chip.
@@ -462,7 +462,7 @@ config RTC_DRV_PCF85363
 	  zero-based instance number.
 
 config RTC_DRV_PCF8563
-	tristate "Philips PCF8563/Epson RTC8564"
+	bool "Philips PCF8563/Epson RTC8564"
 	help
 	  If you say yes here you get support for the
 	  Philips PCF8563 RTC chip. The Epson RTC8564
@@ -472,7 +472,7 @@ config RTC_DRV_PCF8563
 	  will be called rtc-pcf8563.
 
 config RTC_DRV_PCF8583
-	tristate "Philips PCF8583"
+	bool "Philips PCF8583"
 	help
 	  If you say yes here you get support for the Philips PCF8583
 	  RTC chip found on Acorn RiscPCs. This driver supports the
@@ -484,7 +484,7 @@ config RTC_DRV_PCF8583
 	  will be called rtc-pcf8583.
 
 config RTC_DRV_M41T80
-	tristate "ST M41T62/65/M41T80/81/82/83/84/85/87 and compatible"
+	bool "ST M41T62/65/M41T80/81/82/83/84/85/87 and compatible"
 	help
 	  If you say Y here you will get support for the ST M41T60
 	  and M41T80 RTC chips series. Currently, the following chips are
@@ -502,7 +502,7 @@ config RTC_DRV_M41T80_WDT
 	  watchdog timer in the ST M41T60 and M41T80 RTC chips series.
 
 config RTC_DRV_BD70528
-	tristate "ROHM BD70528 PMIC RTC"
+	bool "ROHM BD70528 PMIC RTC"
 	depends on MFD_ROHM_BD70528 && (BD70528_WATCHDOG || !BD70528_WATCHDOG)
 	help
 	  If you say Y here you will get support for the RTC
@@ -512,7 +512,7 @@ config RTC_DRV_BD70528
 	  will be called rtc-bd70528.
 
 config RTC_DRV_BQ32K
-	tristate "TI BQ32000"
+	bool "TI BQ32000"
 	help
 	  If you say Y here you will get support for the TI
 	  BQ32000 I2C RTC chip.
@@ -521,7 +521,7 @@ config RTC_DRV_BQ32K
 	  will be called rtc-bq32k.
 
 config RTC_DRV_DM355EVM
-	tristate "TI DaVinci DM355 EVM RTC"
+	bool "TI DaVinci DM355 EVM RTC"
 	depends on MFD_DM355EVM_MSP
 	help
 	  Supports the RTC firmware in the MSP430 on the DM355 EVM.
@@ -536,7 +536,7 @@ config RTC_DRV_TWL92330
 	  the Menelaus driver; it's not separate module.
 
 config RTC_DRV_TWL4030
-	tristate "TI TWL4030/TWL5030/TWL6030/TPS659x0"
+	bool "TI TWL4030/TWL5030/TWL6030/TPS659x0"
 	depends on TWL4030_CORE
 	depends on OF
 	help
@@ -547,7 +547,7 @@ config RTC_DRV_TWL4030
 	  will be called rtc-twl.
 
 config RTC_DRV_PALMAS
-	tristate "TI Palmas RTC driver"
+	bool "TI Palmas RTC driver"
 	depends on MFD_PALMAS
 	help
 	  If you say yes here you get support for the RTC of TI PALMA series PMIC
@@ -557,7 +557,7 @@ config RTC_DRV_PALMAS
 	  will be called rtc-palma.
 
 config RTC_DRV_TPS6586X
-	tristate "TI TPS6586X RTC driver"
+	bool "TI TPS6586X RTC driver"
 	depends on MFD_TPS6586X
 	help
 	  TI Power Management IC TPS6586X supports RTC functionality
@@ -565,7 +565,7 @@ config RTC_DRV_TPS6586X
 	  the TPS6586X RTC module.
 
 config RTC_DRV_TPS65910
-	tristate "TI TPS65910 RTC driver"
+	bool "TI TPS65910 RTC driver"
 	depends on MFD_TPS65910
 	help
 	  If you say yes here you get support for the RTC on the
@@ -575,7 +575,7 @@ config RTC_DRV_TPS65910
 	  will be called rtc-tps65910.
 
 config RTC_DRV_TPS80031
-	tristate "TI TPS80031/TPS80032 RTC driver"
+	bool "TI TPS80031/TPS80032 RTC driver"
 	depends on MFD_TPS80031
 	help
 	  TI Power Management IC TPS80031 supports RTC functionality
@@ -583,7 +583,7 @@ config RTC_DRV_TPS80031
 	  the TPS80031 RTC module.
 
 config RTC_DRV_RC5T583
-	tristate "RICOH 5T583 RTC driver"
+	bool "RICOH 5T583 RTC driver"
 	depends on MFD_RC5T583
 	help
 	  If you say yes here you get support for the RTC on the
@@ -593,7 +593,7 @@ config RTC_DRV_RC5T583
 	  will be called rtc-rc5t583.
 
 config RTC_DRV_S35390A
-	tristate "Seiko Instruments S-35390A"
+	bool "Seiko Instruments S-35390A"
 	select BITREVERSE
 	help
 	  If you say yes here you will get support for the Seiko
@@ -603,7 +603,7 @@ config RTC_DRV_S35390A
 	  will be called rtc-s35390a.
 
 config RTC_DRV_FM3130
-	tristate "Ramtron FM3130"
+	bool "Ramtron FM3130"
 	help
 	  If you say Y here you will get support for the
 	  Ramtron FM3130 RTC chips.
@@ -614,7 +614,7 @@ config RTC_DRV_FM3130
 	  will be called rtc-fm3130.
 
 config RTC_DRV_RX8010
-	tristate "Epson RX8010SJ"
+	bool "Epson RX8010SJ"
 	help
 	  If you say yes here you get support for the Epson RX8010SJ RTC
 	  chip.
@@ -623,7 +623,7 @@ config RTC_DRV_RX8010
 	  will be called rtc-rx8010.
 
 config RTC_DRV_RX8581
-	tristate "Epson RX-8571/RX-8581"
+	bool "Epson RX-8571/RX-8581"
 	select REGMAP_I2C
 	help
 	  If you say yes here you will get support for the Epson RX-8571/
@@ -633,7 +633,7 @@ config RTC_DRV_RX8581
 	  will be called rtc-rx8581.
 
 config RTC_DRV_RX8025
-	tristate "Epson RX-8025SA/NB"
+	bool "Epson RX-8025SA/NB"
 	help
 	  If you say yes here you get support for the Epson
 	  RX-8025SA/NB RTC chips.
@@ -642,7 +642,7 @@ config RTC_DRV_RX8025
 	  will be called rtc-rx8025.
 
 config RTC_DRV_EM3027
-	tristate "EM Microelectronic EM3027"
+	bool "EM Microelectronic EM3027"
 	help
 	  If you say yes here you get support for the EM
 	  Microelectronic EM3027 RTC chips.
@@ -651,7 +651,7 @@ config RTC_DRV_EM3027
 	  will be called rtc-em3027.
 
 config RTC_DRV_RV3028
-	tristate "Micro Crystal RV3028"
+	bool "Micro Crystal RV3028"
 	select REGMAP_I2C
 	help
 	  If you say yes here you get support for the Micro Crystal
@@ -661,7 +661,7 @@ config RTC_DRV_RV3028
 	  will be called rtc-rv3028.
 
 config RTC_DRV_RV8803
-	tristate "Micro Crystal RV8803, Epson RX8900"
+	bool "Micro Crystal RV8803, Epson RX8900"
 	help
 	  If you say yes here you get support for the Micro Crystal RV8803 and
 	  Epson RX8900 RTC chips.
@@ -670,7 +670,7 @@ config RTC_DRV_RV8803
 	  will be called rtc-rv8803.
 
 config RTC_DRV_S5M
-	tristate "Samsung S2M/S5M series"
+	bool "Samsung S2M/S5M series"
 	depends on MFD_SEC_CORE || COMPILE_TEST
 	select REGMAP_IRQ
 	help
@@ -681,7 +681,7 @@ config RTC_DRV_S5M
 	  will be called rtc-s5m.
 
 config RTC_DRV_SD3078
-	tristate "ZXW Shenzhen whwave SD3078"
+	bool "ZXW Shenzhen whwave SD3078"
 	select REGMAP_I2C
 	help
 	  If you say yes here you get support for the ZXW Shenzhen whwave
@@ -697,7 +697,7 @@ comment "SPI RTC drivers"
 if SPI_MASTER
 
 config RTC_DRV_M41T93
-	tristate "ST M41T93"
+	bool "ST M41T93"
 	help
 	  If you say yes here you will get support for the
 	  ST M41T93 SPI RTC chip.
@@ -706,7 +706,7 @@ config RTC_DRV_M41T93
 	  will be called rtc-m41t93.
 
 config RTC_DRV_M41T94
-	tristate "ST M41T94"
+	bool "ST M41T94"
 	help
 	  If you say yes here you will get support for the
 	  ST M41T94 SPI RTC chip.
@@ -715,7 +715,7 @@ config RTC_DRV_M41T94
 	  will be called rtc-m41t94.
 
 config RTC_DRV_DS1302
-	tristate "Dallas/Maxim DS1302"
+	bool "Dallas/Maxim DS1302"
 	depends on SPI
 	help
 	  If you say yes here you get support for the Dallas DS1302 RTC chips.
@@ -724,7 +724,7 @@ config RTC_DRV_DS1302
 	  will be called rtc-ds1302.
 
 config RTC_DRV_DS1305
-	tristate "Dallas/Maxim DS1305/DS1306"
+	bool "Dallas/Maxim DS1305/DS1306"
 	help
 	  Select this driver to get support for the Dallas/Maxim DS1305
 	  and DS1306 real time clock chips. These support a trickle
@@ -735,7 +735,7 @@ config RTC_DRV_DS1305
 
 config RTC_DRV_DS1343
 	select REGMAP_SPI
-	tristate "Dallas/Maxim DS1343/DS1344"
+	bool "Dallas/Maxim DS1343/DS1344"
 	help
 	  If you say yes here you get support for the
 	  Dallas/Maxim DS1343 and DS1344 real time clock chips.
@@ -746,7 +746,7 @@ config RTC_DRV_DS1343
 
 config RTC_DRV_DS1347
 	select REGMAP_SPI
-	tristate "Dallas/Maxim DS1347"
+	bool "Dallas/Maxim DS1347"
 	help
 	  If you say yes here you get support for the
 	  Dallas/Maxim DS1347 chips.
@@ -758,7 +758,7 @@ config RTC_DRV_DS1347
 	  will be called rtc-ds1347.
 
 config RTC_DRV_DS1390
-	tristate "Dallas/Maxim DS1390/93/94"
+	bool "Dallas/Maxim DS1390/93/94"
 	help
 	  If you say yes here you get support for the
 	  Dallas/Maxim DS1390/93/94 chips.
@@ -770,7 +770,7 @@ config RTC_DRV_DS1390
 	  will be called rtc-ds1390.
 
 config RTC_DRV_MAX6916
-	tristate "Maxim MAX6916"
+	bool "Maxim MAX6916"
 	help
 	  If you say yes here you will get support for the
 	  Maxim MAX6916 SPI RTC chip.
@@ -782,7 +782,7 @@ config RTC_DRV_MAX6916
 	  will be called rtc-max6916.
 
 config RTC_DRV_R9701
-	tristate "Epson RTC-9701JE"
+	bool "Epson RTC-9701JE"
 	help
 	  If you say yes here you will get support for the
 	  Epson RTC-9701JE SPI RTC chip.
@@ -791,7 +791,7 @@ config RTC_DRV_R9701
 	  will be called rtc-r9701.
 
 config RTC_DRV_RX4581
-	tristate "Epson RX-4581"
+	bool "Epson RX-4581"
 	help
 	  If you say yes here you will get support for the Epson RX-4581.
 
@@ -799,7 +799,7 @@ config RTC_DRV_RX4581
 	  will be called rtc-rx4581.
 
 config RTC_DRV_RX6110
-	tristate "Epson RX-6110"
+	bool "Epson RX-6110"
 	select REGMAP_SPI
 	help
 	  If you say yes here you will get support for the Epson RX-6610.
@@ -808,7 +808,7 @@ config RTC_DRV_RX6110
 	  will be called rtc-rx6110.
 
 config RTC_DRV_RS5C348
-	tristate "Ricoh RS5C348A/B"
+	bool "Ricoh RS5C348A/B"
 	help
 	  If you say yes here you get support for the
 	  Ricoh RS5C348A and RS5C348B RTC chips.
@@ -817,7 +817,7 @@ config RTC_DRV_RS5C348
 	  will be called rtc-rs5c348.
 
 config RTC_DRV_MAX6902
-	tristate "Maxim MAX6902"
+	bool "Maxim MAX6902"
 	help
 	  If you say yes here you will get support for the
 	  Maxim MAX6902 SPI RTC chip.
@@ -826,7 +826,7 @@ config RTC_DRV_MAX6902
 	  will be called rtc-max6902.
 
 config RTC_DRV_PCF2123
-	tristate "NXP PCF2123"
+	bool "NXP PCF2123"
 	select REGMAP_SPI
 	help
 	  If you say yes here you get support for the NXP PCF2123
@@ -836,7 +836,7 @@ config RTC_DRV_PCF2123
 	  will be called rtc-pcf2123.
 
 config RTC_DRV_MCP795
-	tristate "Microchip MCP795"
+	bool "Microchip MCP795"
 	help
 	  If you say yes here you will get support for the Microchip MCP795.
 
@@ -850,15 +850,14 @@ endif # SPI_MASTER
 # modular.  See SND_SOC_I2C_AND_SPI for more information
 #
 config RTC_I2C_AND_SPI
-	tristate
-	default m if I2C=m
+	bool
 	default y if I2C=y
 	default y if SPI_MASTER=y
 
 comment "SPI and I2C RTC drivers"
 
 config RTC_DRV_DS3232
-	tristate "Dallas/Maxim DS3232/DS3234"
+	bool "Dallas/Maxim DS3232/DS3234"
 	depends on RTC_I2C_AND_SPI
 	select REGMAP_I2C if I2C
 	select REGMAP_SPI if SPI_MASTER
@@ -879,7 +878,7 @@ config RTC_DRV_DS3232_HWMON
 	  rtc-ds3232
 
 config RTC_DRV_PCF2127
-	tristate "NXP PCF2127"
+	bool "NXP PCF2127"
 	depends on RTC_I2C_AND_SPI
 	select REGMAP_I2C if I2C
 	select REGMAP_SPI if SPI_MASTER
@@ -897,7 +896,7 @@ config RTC_DRV_PCF2127
 	  will be called rtc-pcf2127.
 
 config RTC_DRV_RV3029C2
-	tristate "Micro Crystal RV3029/3049"
+	bool "Micro Crystal RV3029/3049"
 	depends on RTC_I2C_AND_SPI
 	select REGMAP_I2C if I2C
 	select REGMAP_SPI if SPI_MASTER
@@ -924,7 +923,7 @@ comment "Platform RTC drivers"
 # global rtc_lock ... it's not yet just another platform_device.
 
 config RTC_DRV_CMOS
-	tristate "PC-style 'CMOS'"
+	bool "PC-style 'CMOS'"
 	depends on X86 || ARM || PPC || MIPS || SPARC64
 	default y if X86
 	select RTC_MC146818_LIB
@@ -953,7 +952,7 @@ config RTC_DRV_ALPHA
 	  system, specifically MC146818 compatibles.  If in doubt, say Y.
 
 config RTC_DRV_VRTC
-	tristate "Virtual RTC for Intel MID platforms"
+	bool "Virtual RTC for Intel MID platforms"
 	depends on X86_INTEL_MID
 	default y if X86_INTEL_MID
 
@@ -965,19 +964,19 @@ config RTC_DRV_VRTC
 	updates are done via IPC calls to the system controller FW.
 
 config RTC_DRV_DS1216
-	tristate "Dallas DS1216"
+	bool "Dallas DS1216"
 	depends on SNI_RM
 	help
 	  If you say yes here you get support for the Dallas DS1216 RTC chips.
 
 config RTC_DRV_DS1286
-	tristate "Dallas DS1286"
+	bool "Dallas DS1286"
 	depends on HAS_IOMEM
 	help
 	  If you say yes here you get support for the Dallas DS1286 RTC chips.
 
 config RTC_DRV_DS1511
-	tristate "Dallas DS1511"
+	bool "Dallas DS1511"
 	depends on HAS_IOMEM
 	help
 	  If you say yes here you get support for the
@@ -987,7 +986,7 @@ config RTC_DRV_DS1511
 	  will be called rtc-ds1511.
 
 config RTC_DRV_DS1553
-	tristate "Maxim/Dallas DS1553"
+	bool "Maxim/Dallas DS1553"
 	depends on HAS_IOMEM
 	help
 	  If you say yes here you get support for the
@@ -997,7 +996,7 @@ config RTC_DRV_DS1553
 	  will be called rtc-ds1553.
 
 config RTC_DRV_DS1685_FAMILY
-	tristate "Dallas/Maxim DS1685 Family"
+	bool "Dallas/Maxim DS1685 Family"
 	help
 	  If you say yes here you get support for the Dallas/Maxim DS1685
 	  family of real time chips.  This family includes the DS1685/DS1687,
@@ -1064,7 +1063,7 @@ config RTC_DRV_DS17885
 endchoice
 
 config RTC_DRV_DS1742
-	tristate "Maxim/Dallas DS1742/1743"
+	bool "Maxim/Dallas DS1742/1743"
 	depends on HAS_IOMEM
 	help
 	  If you say yes here you get support for the
@@ -1074,7 +1073,7 @@ config RTC_DRV_DS1742
 	  will be called rtc-ds1742.
 
 config RTC_DRV_DS2404
-	tristate "Maxim/Dallas DS2404"
+	bool "Maxim/Dallas DS2404"
 	help
 	  If you say yes here you get support for the
 	  Dallas DS2404 RTC chip.
@@ -1083,14 +1082,14 @@ config RTC_DRV_DS2404
 	  will be called rtc-ds2404.
 
 config RTC_DRV_DA9052
-	tristate "Dialog DA9052/DA9053 RTC"
+	bool "Dialog DA9052/DA9053 RTC"
 	depends on PMIC_DA9052
 	help
 	  Say y here to support the RTC driver for Dialog Semiconductor
 	  DA9052-BC and DA9053-AA/Bx PMICs.
 
 config RTC_DRV_DA9055
-	tristate "Dialog Semiconductor DA9055 RTC"
+	bool "Dialog Semiconductor DA9055 RTC"
 	depends on MFD_DA9055
 	help
 	  If you say yes here you will get support for the
@@ -1100,7 +1099,7 @@ config RTC_DRV_DA9055
 	  will be called rtc-da9055
 
 config RTC_DRV_DA9063
-	tristate "Dialog Semiconductor DA9063/DA9062 RTC"
+	bool "Dialog Semiconductor DA9063/DA9062 RTC"
 	depends on MFD_DA9063 || MFD_DA9062
 	help
 	  If you say yes here you will get support for the RTC subsystem
@@ -1110,7 +1109,7 @@ config RTC_DRV_DA9063
 	  will be called "rtc-da9063".
 
 config RTC_DRV_EFI
-	tristate "EFI RTC"
+	bool "EFI RTC"
 	depends on EFI && !X86
 	help
 	  If you say yes here you will get support for the EFI
@@ -1120,7 +1119,7 @@ config RTC_DRV_EFI
 	  will be called rtc-efi.
 
 config RTC_DRV_STK17TA8
-	tristate "Simtek STK17TA8"
+	bool "Simtek STK17TA8"
 	depends on HAS_IOMEM
 	help
 	  If you say yes here you get support for the
@@ -1130,7 +1129,7 @@ config RTC_DRV_STK17TA8
 	  will be called rtc-stk17ta8.
 
 config RTC_DRV_M48T86
-	tristate "ST M48T86/Dallas DS12887"
+	bool "ST M48T86/Dallas DS12887"
 	help
 	  If you say Y here you will get support for the
 	  ST M48T86 and Dallas DS12887 RTC chips.
@@ -1139,7 +1138,7 @@ config RTC_DRV_M48T86
 	  will be called rtc-m48t86.
 
 config RTC_DRV_M48T35
-	tristate "ST M48T35"
+	bool "ST M48T35"
 	depends on HAS_IOMEM
 	help
 	  If you say Y here you will get support for the
@@ -1149,7 +1148,7 @@ config RTC_DRV_M48T35
 	  will be called "rtc-m48t35".
 
 config RTC_DRV_M48T59
-	tristate "ST M48T59/M48T08/M48T02"
+	bool "ST M48T59/M48T08/M48T02"
 	depends on HAS_IOMEM
 	help
 	  If you say Y here you will get support for the
@@ -1162,7 +1161,7 @@ config RTC_DRV_M48T59
 	  will be called "rtc-m48t59".
 
 config RTC_DRV_MSM6242
-	tristate "Oki MSM6242"
+	bool "Oki MSM6242"
 	depends on HAS_IOMEM
 	help
 	  If you say yes here you get support for the Oki MSM6242
@@ -1172,7 +1171,7 @@ config RTC_DRV_MSM6242
 	  will be called rtc-msm6242.
 
 config RTC_DRV_BQ4802
-	tristate "TI BQ4802"
+	bool "TI BQ4802"
 	depends on HAS_IOMEM
 	help
 	  If you say Y here you will get support for the TI
@@ -1182,7 +1181,7 @@ config RTC_DRV_BQ4802
 	  will be called rtc-bq4802.
 
 config RTC_DRV_RP5C01
-	tristate "Ricoh RP5C01"
+	bool "Ricoh RP5C01"
 	depends on HAS_IOMEM
 	help
 	  If you say yes here you get support for the Ricoh RP5C01
@@ -1193,7 +1192,7 @@ config RTC_DRV_RP5C01
 	  will be called rtc-rp5c01.
 
 config RTC_DRV_V3020
-	tristate "EM Microelectronic V3020"
+	bool "EM Microelectronic V3020"
 	help
 	  If you say yes here you will get support for the
 	  EM Microelectronic v3020 RTC chip.
@@ -1202,7 +1201,7 @@ config RTC_DRV_V3020
 	  will be called rtc-v3020.
 
 config RTC_DRV_WM831X
-	tristate "Wolfson Microelectronics WM831x RTC"
+	bool "Wolfson Microelectronics WM831x RTC"
 	depends on MFD_WM831X
 	help
 	  If you say yes here you will get support for the RTC subsystem
@@ -1212,7 +1211,7 @@ config RTC_DRV_WM831X
 	  will be called "rtc-wm831x".
 
 config RTC_DRV_WM8350
-	tristate "Wolfson Microelectronics WM8350 RTC"
+	bool "Wolfson Microelectronics WM8350 RTC"
 	depends on MFD_WM8350
 	help
 	  If you say yes here you will get support for the RTC subsystem
@@ -1222,7 +1221,7 @@ config RTC_DRV_WM8350
 	  will be called "rtc-wm8350".
 
 config RTC_DRV_SC27XX
-	tristate "Spreadtrum SC27xx RTC"
+	bool "Spreadtrum SC27xx RTC"
 	depends on MFD_SC27XX_PMIC || COMPILE_TEST
 	help
 	  If you say Y here you will get support for the RTC subsystem
@@ -1233,7 +1232,7 @@ config RTC_DRV_SC27XX
 	  will be called rtc-sc27xx.
 
 config RTC_DRV_SPEAR
-	tristate "SPEAR ST RTC"
+	bool "SPEAR ST RTC"
 	depends on PLAT_SPEAR || COMPILE_TEST
 	default y
 	help
@@ -1242,13 +1241,13 @@ config RTC_DRV_SPEAR
 
 config RTC_DRV_PCF50633
 	depends on MFD_PCF50633
-	tristate "NXP PCF50633 RTC"
+	bool "NXP PCF50633 RTC"
 	help
 	  If you say yes here you get support for the RTC subsystem of the
 	  NXP PCF50633 used in embedded systems.
 
 config RTC_DRV_AB3100
-	tristate "ST-Ericsson AB3100 RTC"
+	bool "ST-Ericsson AB3100 RTC"
 	depends on AB3100_CORE
 	default y if AB3100_CORE
 	help
@@ -1256,7 +1255,7 @@ config RTC_DRV_AB3100
 	  support. This chip contains a battery- and capacitor-backed RTC.
 
 config RTC_DRV_AB8500
-	tristate "ST-Ericsson AB8500 RTC"
+	bool "ST-Ericsson AB8500 RTC"
 	depends on AB8500_CORE
 	select RTC_INTF_DEV
 	select RTC_INTF_DEV_UIE_EMUL
@@ -1265,7 +1264,7 @@ config RTC_DRV_AB8500
 	  support. This chip contains a battery- and capacitor-backed RTC.
 
 config RTC_DRV_OPAL
-	tristate "IBM OPAL RTC driver"
+	bool "IBM OPAL RTC driver"
 	depends on PPC_POWERNV
 	default y
 	help
@@ -1276,14 +1275,14 @@ config RTC_DRV_OPAL
 	  will be called rtc-opal.
 
 config RTC_DRV_ZYNQMP
-	tristate "Xilinx Zynq Ultrascale+ MPSoC RTC"
+	bool "Xilinx Zynq Ultrascale+ MPSoC RTC"
 	depends on OF
 	help
 	  If you say yes here you get support for the RTC controller found on
 	  Xilinx Zynq Ultrascale+ MPSoC.
 
 config RTC_DRV_CROS_EC
-	tristate "Chrome OS EC RTC driver"
+	bool "Chrome OS EC RTC driver"
 	depends on CROS_EC
 	help
 	  If you say yes here you will get support for the
@@ -1295,7 +1294,7 @@ config RTC_DRV_CROS_EC
 comment "on-CPU RTC drivers"
 
 config RTC_DRV_ASM9260
-	tristate "Alphascale asm9260 RTC"
+	bool "Alphascale asm9260 RTC"
 	depends on MACH_ASM9260 || COMPILE_TEST
 	help
 	  If you say yes here you get support for the RTC on the
@@ -1305,7 +1304,7 @@ config RTC_DRV_ASM9260
 	  will be called rtc-asm9260.
 
 config RTC_DRV_DAVINCI
-	tristate "TI DaVinci RTC"
+	bool "TI DaVinci RTC"
 	depends on ARCH_DAVINCI_DM365 || COMPILE_TEST
 	help
 	  If you say yes here you get support for the RTC on the
@@ -1315,7 +1314,7 @@ config RTC_DRV_DAVINCI
 	  will be called rtc-davinci.
 
 config RTC_DRV_DIGICOLOR
-	tristate "Conexant Digicolor RTC"
+	bool "Conexant Digicolor RTC"
 	depends on ARCH_DIGICOLOR || COMPILE_TEST
 	help
 	  If you say yes here you get support for the RTC on Conexant
@@ -1325,7 +1324,7 @@ config RTC_DRV_DIGICOLOR
 	  will be called rtc-digicolor.
 
 config RTC_DRV_IMXDI
-	tristate "Freescale IMX DryIce Real Time Clock"
+	bool "Freescale IMX DryIce Real Time Clock"
 	depends on ARCH_MXC
 	help
 	   Support for Freescale IMX DryIce RTC
@@ -1334,7 +1333,7 @@ config RTC_DRV_IMXDI
 	   will be called "rtc-imxdi".
 
 config RTC_DRV_FSL_FTM_ALARM
-	tristate "Freescale FlexTimer alarm timer"
+	bool "Freescale FlexTimer alarm timer"
 	depends on ARCH_LAYERSCAPE || SOC_LS1021A
 	help
 	   For the FlexTimer in LS1012A, LS1021A, LS1028A, LS1043A, LS1046A,
@@ -1347,7 +1346,7 @@ config RTC_DRV_FSL_FTM_ALARM
 	   will be called "rtc-fsl-ftm-alarm".
 
 config RTC_DRV_MESON
-	tristate "Amlogic Meson RTC"
+	bool "Amlogic Meson RTC"
 	depends on (ARM && ARCH_MESON) || COMPILE_TEST
 	select REGMAP_MMIO
 	help
@@ -1358,7 +1357,7 @@ config RTC_DRV_MESON
 	   will be called "rtc-meson".
 
 config RTC_DRV_MESON_VRTC
-	tristate "Amlogic Meson Virtual RTC"
+	bool "Amlogic Meson Virtual RTC"
 	depends on ARCH_MESON || COMPILE_TEST
 	default m if ARCH_MESON
 	help
@@ -1369,7 +1368,7 @@ config RTC_DRV_MESON_VRTC
 	  will be called rtc-meson-vrtc.
 
 config RTC_DRV_OMAP
-	tristate "TI OMAP Real Time Clock"
+	bool "TI OMAP Real Time Clock"
 	depends on ARCH_OMAP || ARCH_DAVINCI || COMPILE_TEST
 	depends on OF
 	depends on PINCTRL
@@ -1389,7 +1388,7 @@ config HAVE_S3C_RTC
 	  select this in the respective mach-XXXX/Kconfig file.
 
 config RTC_DRV_S3C
-	tristate "Samsung S3C series SoC RTC"
+	bool "Samsung S3C series SoC RTC"
 	depends on ARCH_S3C64XX || HAVE_S3C_RTC || COMPILE_TEST
 	help
 	  RTC (Realtime Clock) driver for the clock inbuilt into the
@@ -1405,7 +1404,7 @@ config RTC_DRV_S3C
 	  will be called rtc-s3c.
 
 config RTC_DRV_EP93XX
-	tristate "Cirrus Logic EP93XX"
+	bool "Cirrus Logic EP93XX"
 	depends on ARCH_EP93XX || COMPILE_TEST
 	help
 	  If you say yes here you get support for the
@@ -1415,7 +1414,7 @@ config RTC_DRV_EP93XX
 	  will be called rtc-ep93xx.
 
 config RTC_DRV_SA1100
-	tristate "SA11x0/PXA2xx/PXA910"
+	bool "SA11x0/PXA2xx/PXA910"
 	depends on ARCH_SA1100 || ARCH_PXA || ARCH_MMP
 	help
 	  If you say Y here you will get access to the real time clock
@@ -1425,7 +1424,7 @@ config RTC_DRV_SA1100
 	  module will be called rtc-sa1100.
 
 config RTC_DRV_SH
-	tristate "SuperH On-Chip RTC"
+	bool "SuperH On-Chip RTC"
 	depends on SUPERH || ARCH_RENESAS
 	help
 	  Say Y here to enable support for the on-chip RTC found in
@@ -1435,7 +1434,7 @@ config RTC_DRV_SH
 	  module will be called rtc-sh.
 
 config RTC_DRV_VR41XX
-	tristate "NEC VR41XX"
+	bool "NEC VR41XX"
 	depends on CPU_VR41XX || COMPILE_TEST
 	help
 	  If you say Y here you will get access to the real time clock
@@ -1445,7 +1444,7 @@ config RTC_DRV_VR41XX
 	  module will be called rtc-vr41xx.
 
 config RTC_DRV_PL030
-	tristate "ARM AMBA PL030 RTC"
+	bool "ARM AMBA PL030 RTC"
 	depends on ARM_AMBA
 	help
 	  If you say Y here you will get access to ARM AMBA
@@ -1455,7 +1454,7 @@ config RTC_DRV_PL030
 	  module will be called rtc-pl030.
 
 config RTC_DRV_PL031
-	tristate "ARM AMBA PL031 RTC"
+	bool "ARM AMBA PL031 RTC"
 	depends on ARM_AMBA
 	help
 	  If you say Y here you will get access to ARM AMBA
@@ -1465,7 +1464,7 @@ config RTC_DRV_PL031
 	  module will be called rtc-pl031.
 
 config RTC_DRV_AT91RM9200
-	tristate "AT91RM9200 or some AT91SAM9 RTC"
+	bool "AT91RM9200 or some AT91SAM9 RTC"
 	depends on ARCH_AT91 || COMPILE_TEST
 	depends on OF
 	help
@@ -1474,7 +1473,7 @@ config RTC_DRV_AT91RM9200
 	  this is powered by the backup power supply.
 
 config RTC_DRV_AT91SAM9
-	tristate "AT91SAM9 RTT as RTC"
+	bool "AT91SAM9 RTT as RTC"
 	depends on ARCH_AT91 || COMPILE_TEST
 	depends on OF && HAS_IOMEM
 	select MFD_SYSCON
@@ -1489,7 +1488,7 @@ config RTC_DRV_AT91SAM9
 	  RTC" driver.
 
 config RTC_DRV_AU1XXX
-	tristate "Au1xxx Counter0 RTC support"
+	bool "Au1xxx Counter0 RTC support"
 	depends on MIPS_ALCHEMY
 	help
 	  This is a driver for the Au1xxx on-chip Counter0 (Time-Of-Year
@@ -1499,13 +1498,13 @@ config RTC_DRV_AU1XXX
 	  will be called rtc-au1xxx.
 
 config RTC_DRV_RS5C313
-	tristate "Ricoh RS5C313"
+	bool "Ricoh RS5C313"
 	depends on SH_LANDISK
 	help
 	  If you say yes here you get support for the Ricoh RS5C313 RTC chips.
 
 config RTC_DRV_GENERIC
-	tristate "Generic RTC support"
+	bool "Generic RTC support"
 	# Please consider writing a new RTC driver instead of using the generic
 	# RTC abstraction
 	depends on PARISC || M68K || PPC || SUPERH32 || COMPILE_TEST
@@ -1515,7 +1514,7 @@ config RTC_DRV_GENERIC
 	  just say Y.
 
 config RTC_DRV_PXA
-	tristate "PXA27x/PXA3xx"
+	bool "PXA27x/PXA3xx"
 	depends on ARCH_PXA
 	select RTC_DRV_SA1100
 	help
@@ -1527,7 +1526,7 @@ config RTC_DRV_PXA
 	 series (RDxR, RYxR) instead of legacy RCNR, RTAR.
 
 config RTC_DRV_VT8500
-	tristate "VIA/WonderMedia 85xx SoC RTC"
+	bool "VIA/WonderMedia 85xx SoC RTC"
 	depends on ARCH_VT8500 || COMPILE_TEST
 	help
 	  If you say Y here you will get access to the real time clock
@@ -1551,7 +1550,7 @@ config RTC_DRV_SUN6I
 	  some Allwinner SoCs like the A31 or the A64.
 
 config RTC_DRV_SUNXI
-	tristate "Allwinner sun4i/sun7i RTC"
+	bool "Allwinner sun4i/sun7i RTC"
 	depends on MACH_SUN4I || MACH_SUN7I || COMPILE_TEST
 	help
 	  If you say Y here you will get support for the RTC found on
@@ -1565,14 +1564,14 @@ config RTC_DRV_STARFIRE
 	  Starfire systems.
 
 config RTC_DRV_TX4939
-	tristate "TX4939 SoC"
+	bool "TX4939 SoC"
 	depends on SOC_TX4939 || COMPILE_TEST
 	help
 	  Driver for the internal RTC (Realtime Clock) module found on
 	  Toshiba TX4939 SoC.
 
 config RTC_DRV_MV
-	tristate "Marvell SoC RTC"
+	bool "Marvell SoC RTC"
 	depends on ARCH_DOVE || ARCH_MVEBU || COMPILE_TEST
 	help
 	  If you say yes here you will get support for the in-chip RTC
@@ -1583,7 +1582,7 @@ config RTC_DRV_MV
 	  will be called rtc-mv.
 
 config RTC_DRV_ARMADA38X
-	tristate "Armada 38x Marvell SoC RTC"
+	bool "Armada 38x Marvell SoC RTC"
 	depends on ARCH_MVEBU || COMPILE_TEST
 	help
 	  If you say yes here you will get support for the in-chip RTC
@@ -1593,7 +1592,7 @@ config RTC_DRV_ARMADA38X
 	  will be called armada38x-rtc.
 
 config RTC_DRV_CADENCE
-	tristate "Cadence RTC driver"
+	bool "Cadence RTC driver"
 	depends on OF && HAS_IOMEM
 	help
 	  If you say Y here you will get access to Cadence RTC IP
@@ -1603,7 +1602,7 @@ config RTC_DRV_CADENCE
 	  module will be called rtc-cadence.
 
 config RTC_DRV_FTRTC010
-	tristate "Faraday Technology FTRTC010 RTC"
+	bool "Faraday Technology FTRTC010 RTC"
 	depends on HAS_IOMEM
 	default ARCH_GEMINI
 	help
@@ -1614,7 +1613,7 @@ config RTC_DRV_FTRTC010
 	  will be called rtc-ftrtc010.
 
 config RTC_DRV_PS3
-	tristate "PS3 RTC"
+	bool "PS3 RTC"
 	depends on PPC_PS3
 	help
 	  If you say yes here you will get support for the RTC on PS3.
@@ -1623,7 +1622,7 @@ config RTC_DRV_PS3
 	  will be called rtc-ps3.
 
 config RTC_DRV_COH901331
-	tristate "ST-Ericsson COH 901 331 RTC"
+	bool "ST-Ericsson COH 901 331 RTC"
 	depends on ARCH_U300 || COMPILE_TEST
 	help
 	  If you say Y here you will get access to ST-Ericsson
@@ -1635,7 +1634,7 @@ config RTC_DRV_COH901331
 
 
 config RTC_DRV_STMP
-	tristate "Freescale STMP3xxx/i.MX23/i.MX28 RTC"
+	bool "Freescale STMP3xxx/i.MX23/i.MX28 RTC"
 	depends on ARCH_MXS || COMPILE_TEST
 	select STMP_DEVICE
 	help
@@ -1646,7 +1645,7 @@ config RTC_DRV_STMP
 	  will be called rtc-stmp3xxx.
 
 config RTC_DRV_PCAP
-	tristate "PCAP RTC"
+	bool "PCAP RTC"
 	depends on EZX_PCAP
 	help
 	  If you say Y here you will get support for the RTC found on
@@ -1654,13 +1653,13 @@ config RTC_DRV_PCAP
 
 config RTC_DRV_MC13XXX
 	depends on MFD_MC13XXX
-	tristate "Freescale MC13xxx RTC"
+	bool "Freescale MC13xxx RTC"
 	help
 	  This enables support for the RTCs found on Freescale's PMICs
 	  MC13783 and MC13892.
 
 config RTC_DRV_MPC5121
-	tristate "Freescale MPC5121 built-in RTC"
+	bool "Freescale MPC5121 built-in RTC"
 	depends on PPC_MPC512x || PPC_MPC52xx
 	help
 	  If you say yes here you will get support for the
@@ -1670,7 +1669,7 @@ config RTC_DRV_MPC5121
 	  will be called rtc-mpc5121.
 
 config RTC_DRV_JZ4740
-	tristate "Ingenic JZ4740 SoC"
+	bool "Ingenic JZ4740 SoC"
 	depends on MIPS || COMPILE_TEST
 	help
 	  If you say yes here you get support for the Ingenic JZ47xx SoCs RTC
@@ -1680,7 +1679,7 @@ config RTC_DRV_JZ4740
 	  will be called rtc-jz4740.
 
 config RTC_DRV_LPC24XX
-	tristate "NXP RTC for LPC178x/18xx/408x/43xx"
+	bool "NXP RTC for LPC178x/18xx/408x/43xx"
 	depends on ARCH_LPC18XX || COMPILE_TEST
 	depends on OF && HAS_IOMEM
 	help
@@ -1693,7 +1692,7 @@ config RTC_DRV_LPC24XX
 
 config RTC_DRV_LPC32XX
 	depends on ARCH_LPC32XX || COMPILE_TEST
-	tristate "NXP LPC32XX RTC"
+	bool "NXP LPC32XX RTC"
 	help
 	  This enables support for the NXP RTC in the LPC32XX
 
@@ -1701,7 +1700,7 @@ config RTC_DRV_LPC32XX
 	  will be called rtc-lpc32xx.
 
 config RTC_DRV_PM8XXX
-	tristate "Qualcomm PMIC8XXX RTC"
+	bool "Qualcomm PMIC8XXX RTC"
 	depends on MFD_PM8XXX || MFD_SPMI_PMIC || COMPILE_TEST
 	help
 	  If you say yes here you get support for the
@@ -1711,7 +1710,7 @@ config RTC_DRV_PM8XXX
 	  module will be called rtc-pm8xxx.
 
 config RTC_DRV_TEGRA
-	tristate "NVIDIA Tegra Internal RTC driver"
+	bool "NVIDIA Tegra Internal RTC driver"
 	depends on ARCH_TEGRA || COMPILE_TEST
 	help
 	  If you say yes here you get support for the
@@ -1721,7 +1720,7 @@ config RTC_DRV_TEGRA
 	  will be called rtc-tegra.
 
 config RTC_DRV_PUV3
-	tristate "PKUnity v3 RTC support"
+	bool "PKUnity v3 RTC support"
 	depends on ARCH_PUV3
 	help
 	  This enables support for the RTC in the PKUnity-v3 SoCs.
@@ -1730,7 +1729,7 @@ config RTC_DRV_PUV3
 	  will be called rtc-puv3.
 
 config RTC_DRV_LOONGSON1
-	tristate "loongson1 RTC support"
+	bool "loongson1 RTC support"
 	depends on MACH_LOONGSON32
 	help
 	  This is a driver for the loongson1 on-chip Counter0 (Time-Of-Year
@@ -1740,7 +1739,7 @@ config RTC_DRV_LOONGSON1
 	  will be called rtc-ls1x.
 
 config RTC_DRV_MXC
-	tristate "Freescale MXC Real Time Clock"
+	bool "Freescale MXC Real Time Clock"
 	depends on ARCH_MXC
 	help
 	   If you say yes here you get support for the Freescale MXC
@@ -1750,7 +1749,7 @@ config RTC_DRV_MXC
 	   will be called "rtc-mxc".
 
 config RTC_DRV_MXC_V2
-	tristate "Freescale MXC Real Time Clock for i.MX53"
+	bool "Freescale MXC Real Time Clock for i.MX53"
 	depends on ARCH_MXC
 	help
 	   If you say yes here you get support for the Freescale MXC
@@ -1760,7 +1759,7 @@ config RTC_DRV_MXC_V2
 	   will be called "rtc-mxc_v2".
 
 config RTC_DRV_SNVS
-	tristate "Freescale SNVS RTC support"
+	bool "Freescale SNVS RTC support"
 	select REGMAP_MMIO
 	depends on HAS_IOMEM
 	depends on OF
@@ -1774,20 +1773,20 @@ config RTC_DRV_SNVS
 config RTC_DRV_IMX_SC
 	depends on IMX_SCU
 	depends on HAVE_ARM_SMCCC
-	tristate "NXP i.MX System Controller RTC support"
+	bool "NXP i.MX System Controller RTC support"
 	help
 	   If you say yes here you get support for the NXP i.MX System
 	   Controller RTC module.
 
 config RTC_DRV_SIRFSOC
-	tristate "SiRFSOC RTC"
+	bool "SiRFSOC RTC"
 	depends on ARCH_SIRF
 	help
 	  Say "yes" here to support the real time clock on SiRF SOC chips.
 	  This driver can also be built as a module called rtc-sirfsoc.
 
 config RTC_DRV_ST_LPC
-	tristate "STMicroelectronics LPC RTC"
+	bool "STMicroelectronics LPC RTC"
 	depends on ARCH_STI
 	depends on OF
 	help
@@ -1798,7 +1797,7 @@ config RTC_DRV_ST_LPC
 	  module will be called rtc-st-lpc.
 
 config RTC_DRV_MOXART
-	tristate "MOXA ART RTC"
+	bool "MOXA ART RTC"
 	depends on ARCH_MOXART || COMPILE_TEST
 	help
 	   If you say yes here you get support for the MOXA ART
@@ -1808,7 +1807,7 @@ config RTC_DRV_MOXART
 	   will be called rtc-moxart
 
 config RTC_DRV_MT6397
-	tristate "MediaTek PMIC based RTC"
+	bool "MediaTek PMIC based RTC"
 	depends on MFD_MT6397 || (COMPILE_TEST && IRQ_DOMAIN)
 	help
 	  This selects the MediaTek(R) RTC driver. RTC is part of MediaTek
@@ -1818,7 +1817,7 @@ config RTC_DRV_MT6397
 	  If you want to use MediaTek(R) RTC interface, select Y or M here.
 
 config RTC_DRV_MT7622
-	tristate "MediaTek SoC based RTC"
+	bool "MediaTek SoC based RTC"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	help
 	  This enables support for the real time clock built in the MediaTek
@@ -1828,7 +1827,7 @@ config RTC_DRV_MT7622
 	  will be called rtc-mt7622.
 
 config RTC_DRV_XGENE
-	tristate "APM X-Gene RTC"
+	bool "APM X-Gene RTC"
 	depends on HAS_IOMEM
 	depends on ARCH_XGENE || COMPILE_TEST
 	help
@@ -1839,7 +1838,7 @@ config RTC_DRV_XGENE
 	  will be called "rtc-xgene".
 
 config RTC_DRV_PIC32
-	tristate "Microchip PIC32 RTC"
+	bool "Microchip PIC32 RTC"
 	depends on MACH_PIC32
 	default y
 	help
@@ -1849,7 +1848,7 @@ config RTC_DRV_PIC32
 	   will be called rtc-pic32
 
 config RTC_DRV_R7301
-	tristate "EPSON TOYOCOM RTC-7301SF/DG"
+	bool "EPSON TOYOCOM RTC-7301SF/DG"
 	select REGMAP_MMIO
 	depends on OF && HAS_IOMEM
 	help
@@ -1860,7 +1859,7 @@ config RTC_DRV_R7301
 	   will be called rtc-r7301.
 
 config RTC_DRV_STM32
-	tristate "STM32 RTC"
+	bool "STM32 RTC"
 	select REGMAP_MMIO
 	depends on ARCH_STM32 || COMPILE_TEST
 	help
@@ -1872,7 +1871,7 @@ config RTC_DRV_STM32
 
 config RTC_DRV_CPCAP
 	depends on MFD_CPCAP
-	tristate "Motorola CPCAP RTC"
+	bool "Motorola CPCAP RTC"
 	help
 	   Say y here for CPCAP rtc found on some Motorola phones
 	   and tablets such as Droid 4.
@@ -1886,7 +1885,7 @@ config RTC_DRV_RTD119X
 	  Real Time Clock.
 
 config RTC_DRV_ASPEED
-	tristate "ASPEED RTC"
+	bool "ASPEED RTC"
 	depends on OF
 	depends on ARCH_ASPEED || COMPILE_TEST
 	help
@@ -1899,7 +1898,7 @@ config RTC_DRV_ASPEED
 comment "HID Sensor RTC drivers"
 
 config RTC_DRV_HID_SENSOR_TIME
-	tristate "HID Sensor Time"
+	bool "HID Sensor Time"
 	depends on USB_HID
 	depends on HID_SENSOR_HUB && IIO
 	select HID_SENSOR_IIO_COMMON
@@ -1911,7 +1910,7 @@ config RTC_DRV_HID_SENSOR_TIME
 	  rtc-hid-sensor-time.
 
 config RTC_DRV_GOLDFISH
-	tristate "Goldfish Real Time Clock"
+	bool "Goldfish Real Time Clock"
 	depends on OF && HAS_IOMEM
 	depends on GOLDFISH || COMPILE_TEST
 	help
@@ -1921,7 +1920,7 @@ config RTC_DRV_GOLDFISH
 	  for Android emulation.
 
 config RTC_DRV_WILCO_EC
-	tristate "Wilco EC RTC"
+	bool "Wilco EC RTC"
 	depends on WILCO_EC
 	default m
 	help
-- 
2.17.1



