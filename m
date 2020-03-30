Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41D221972AC
	for <lists+linux-rtc@lfdr.de>; Mon, 30 Mar 2020 04:55:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729297AbgC3CzJ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 29 Mar 2020 22:55:09 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:57397 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728965AbgC3CzJ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 29 Mar 2020 22:55:09 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id AE3E28066C;
        Mon, 30 Mar 2020 15:55:05 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1585536905;
        bh=zGZx7ixRgffAVX78YePwGzh+4RQA61TjGUCaBeBSMrQ=;
        h=From:To:Cc:Subject:Date;
        b=VqZFo52q/P2AcP0PLr3PUQCD26EcYB0ppMI8MLdboLvYZwSKo8StpH4ci0zHQai4L
         QvnjMNQmFgcVIscnD/6SP7HqcdTBSmFKbG25UUSUhXcCh2MBc+EhasqjtXk4fnIHNE
         IJGWRXybN8AiOgmhuJIxcbvrfsEpxq80TEW677POEtvOSnSUCjYnzbl5US5osxeP4W
         CDi6zbNEE058RB0+UUVcL2E5kyr70ozAnENhlyq2rwB0+ftIqhIjk5ziOi2wWCELsv
         2KzyAocrYryQcgX5mo44o0dPozewMdvMJ0vIcr0guGqVZ9/fGUNSwFDToV2ugSp5Jn
         2IGXzMPs17Vrg==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5e815f870000>; Mon, 30 Mar 2020 15:55:03 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id 4AEB213ED7D;
        Mon, 30 Mar 2020 15:55:05 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 7A43028006C; Mon, 30 Mar 2020 15:55:05 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        wim@linux-watchdog.org, linux@roeck-us.net
Cc:     linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v3] rtc: ds1307: add support for watchdog timer on ds1388
Date:   Mon, 30 Mar 2020 15:55:00 +1300
Message-Id: <20200330025500.6991-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The DS1388 variant has watchdog timer capabilities. When using a DS1388
and having enabled CONFIG_WATCHDOG_CORE register a watchdog device for
the DS1388.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
Changes in v3:
- Address review comments from Guenter. Add select WATCHDOG_CORE, remove
  unnecessary wdt member, add set_timeout op, use devm_watchdog_register
Changes in v2:
- Address review comments from Alexandre, the only functional change is s=
etting
  the hundredths of seconds to 0 instead of 99.

 drivers/rtc/Kconfig      |   1 +
 drivers/rtc/rtc-ds1307.c | 115 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 116 insertions(+)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 34c8b6c7e095..729851a38511 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -241,6 +241,7 @@ config RTC_DRV_AS3722
 config RTC_DRV_DS1307
 	tristate "Dallas/Maxim DS1307/37/38/39/40/41, ST M41T00, EPSON RX-8025,=
 ISL12057"
 	select REGMAP_I2C
+	select WATCHDOG_CORE if WATCHDOG
 	help
 	  If you say yes here you get support for various compatible RTC
 	  chips (often with battery backup) connected with I2C. This driver
diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index 31a38d468378..fad042118862 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -22,6 +22,7 @@
 #include <linux/hwmon-sysfs.h>
 #include <linux/clk-provider.h>
 #include <linux/regmap.h>
+#include <linux/watchdog.h>
=20
 /*
  * We can't determine type by probing, but if we expect pre-Linux code
@@ -144,8 +145,15 @@ enum ds_type {
 #	define M41TXX_BIT_CALIB_SIGN	BIT(5)
 #	define M41TXX_M_CALIBRATION	GENMASK(4, 0)
=20
+#define DS1388_REG_WDOG_HUN_SECS	0x08
+#define DS1388_REG_WDOG_SECS		0x09
 #define DS1388_REG_FLAG			0x0b
+#	define DS1388_BIT_WF		BIT(6)
 #	define DS1388_BIT_OSF		BIT(7)
+#define DS1388_REG_CONTROL		0x0c
+#	define DS1388_BIT_RST		BIT(0)
+#	define DS1388_BIT_WDE		BIT(1)
+
 /* negative offset step is -2.034ppm */
 #define M41TXX_NEG_OFFSET_STEP_PPB	2034
 /* positive offset step is +4.068ppm */
@@ -854,6 +862,72 @@ static int m41txx_rtc_set_offset(struct device *dev,=
 long offset)
 				  ctrl_reg);
 }
=20
+#ifdef CONFIG_WATCHDOG_CORE
+static int ds1388_wdt_start(struct watchdog_device *wdt_dev)
+{
+	struct ds1307 *ds1307 =3D watchdog_get_drvdata(wdt_dev);
+	u8 regs[2];
+	int ret;
+
+	ret =3D regmap_update_bits(ds1307->regmap, DS1388_REG_FLAG,
+				 DS1388_BIT_WF, 0);
+	if (ret)
+		return ret;
+
+	ret =3D regmap_update_bits(ds1307->regmap, DS1388_REG_CONTROL,
+				 DS1388_BIT_WDE | DS1388_BIT_RST, 0);
+	if (ret)
+		return ret;
+
+	/*
+	 * watchdog timeouts are measured in seconds. So ignore hundredths of
+	 * seconds field.
+	 */
+	regs[0] =3D 0;
+	regs[1] =3D bin2bcd(wdt_dev->timeout);
+
+	ret =3D regmap_bulk_write(ds1307->regmap, DS1388_REG_WDOG_HUN_SECS, reg=
s,
+				sizeof(regs));
+	if (ret)
+		return ret;
+
+	return regmap_update_bits(ds1307->regmap, DS1388_REG_CONTROL,
+				  DS1388_BIT_WDE | DS1388_BIT_RST,
+				  DS1388_BIT_WDE | DS1388_BIT_RST);
+}
+
+static int ds1388_wdt_stop(struct watchdog_device *wdt_dev)
+{
+	struct ds1307 *ds1307 =3D watchdog_get_drvdata(wdt_dev);
+
+	return regmap_update_bits(ds1307->regmap, DS1388_REG_CONTROL,
+				  DS1388_BIT_WDE | DS1388_BIT_RST, 0);
+}
+
+static int ds1388_wdt_ping(struct watchdog_device *wdt_dev)
+{
+	struct ds1307 *ds1307 =3D watchdog_get_drvdata(wdt_dev);
+	u8 regs[2];
+
+	return regmap_bulk_read(ds1307->regmap, DS1388_REG_WDOG_HUN_SECS, regs,
+				sizeof(regs));
+}
+
+static int ds1388_wdt_set_timeout(struct watchdog_device *wdt_dev,
+				  unsigned int val)
+{
+	struct ds1307 *ds1307 =3D watchdog_get_drvdata(wdt_dev);
+	u8 regs[2];
+
+	wdt_dev->timeout =3D val;
+	regs[0] =3D 0;
+	regs[1] =3D bin2bcd(wdt_dev->timeout);
+
+	return regmap_bulk_write(ds1307->regmap, DS1388_REG_WDOG_HUN_SECS, regs=
,
+				 sizeof(regs));
+}
+#endif
+
 static const struct rtc_class_ops rx8130_rtc_ops =3D {
 	.read_time      =3D ds1307_get_time,
 	.set_time       =3D ds1307_set_time,
@@ -1576,6 +1650,46 @@ static void ds1307_clks_register(struct ds1307 *ds=
1307)
=20
 #endif /* CONFIG_COMMON_CLK */
=20
+#ifdef CONFIG_WATCHDOG_CORE
+static const struct watchdog_info ds1388_wdt_info =3D {
+	.options =3D WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
+	.identity =3D "DS1388 watchdog",
+};
+
+static const struct watchdog_ops ds1388_wdt_ops =3D {
+	.owner =3D THIS_MODULE,
+	.start =3D ds1388_wdt_start,
+	.stop =3D ds1388_wdt_stop,
+	.ping =3D ds1388_wdt_ping,
+	.set_timeout =3D ds1388_wdt_set_timeout,
+
+};
+
+static void ds1307_wdt_register(struct ds1307 *ds1307)
+{
+	struct watchdog_device	*wdt;
+
+	if (ds1307->type !=3D ds_1388)
+		return;
+
+	wdt =3D devm_kzalloc(ds1307->dev, sizeof(*wdt), GFP_KERNEL);
+
+	wdt->info =3D &ds1388_wdt_info;
+	wdt->ops =3D &ds1388_wdt_ops;
+	wdt->timeout =3D 99;
+	wdt->max_timeout =3D 99;
+	wdt->min_timeout =3D 1;
+
+	watchdog_init_timeout(wdt, 0, ds1307->dev);
+	watchdog_set_drvdata(wdt, ds1307);
+	devm_watchdog_register_device(ds1307->dev, wdt);
+}
+#else
+static void ds1307_wdt_register(struct ds1307 *ds1307)
+{
+}
+#endif /* CONFIG_WATCHDOG_CORE */
+
 static const struct regmap_config regmap_config =3D {
 	.reg_bits =3D 8,
 	.val_bits =3D 8,
@@ -1865,6 +1979,7 @@ static int ds1307_probe(struct i2c_client *client,
=20
 	ds1307_hwmon_register(ds1307);
 	ds1307_clks_register(ds1307);
+	ds1307_wdt_register(ds1307);
=20
 	return 0;
=20
--=20
2.25.1

