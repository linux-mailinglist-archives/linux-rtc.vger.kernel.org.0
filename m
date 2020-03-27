Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33AE4194FFE
	for <lists+linux-rtc@lfdr.de>; Fri, 27 Mar 2020 05:18:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726106AbgC0ESQ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 27 Mar 2020 00:18:16 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:55484 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbgC0ESQ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 27 Mar 2020 00:18:16 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 901B280237;
        Fri, 27 Mar 2020 17:18:12 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1585282692;
        bh=rWzErC/ba66zHapfPKXI81c1IflcLBV+nnSryfHwXwA=;
        h=From:To:Cc:Subject:Date;
        b=0g1fmZueMk51yLex3C8s+GfM70ah49mp6CsZ615iF/Ze/vGwxjtc6y+RAE6rmvpA9
         K89f1DjkMXk6dd/v0Z4V+OxeqlM8LByiktTt+9IPeFCXwh7oo8iG+Ehot9/+6N6xyK
         S0Bzl+bj//6he8p9muhxkfpnmQjnT5g72wweAp/fDZljEjhX7fcYA4Ln3uwyUZoRGa
         N/ZCvJOPJvJnK7c82334d9pVRZfqwH77ocdB+4K/FojrpYFGlIfjJjP2Gb85vDZFwD
         grUCyRn3KVwlUtF48WryAy+JZbueUKsA5fpNfQNVvjBk22b/rjBCHhhGA9sbxaZiYh
         OwYwDnAAwHVYw==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5e7d7e840000>; Fri, 27 Mar 2020 17:18:12 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id 63BF913EEB7;
        Fri, 27 Mar 2020 17:18:11 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 96C7128006C; Fri, 27 Mar 2020 17:18:11 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        wim@linux-watchdog.org, linux@roeck-us.net
Cc:     linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2] rtc: ds1307: add support for watchdog timer on ds1388
Date:   Fri, 27 Mar 2020 17:18:09 +1300
Message-Id: <20200327041809.2029-1-chris.packham@alliedtelesis.co.nz>
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
This is going to the linux-watchdog list as well this time so it's probab=
ly the
first time the watchdog maintainers have seen it.

Changes in v2:
- Address review comments from Alexandre, the only functional change is s=
etting
  the hundredths of seconds to 0 instead of 99.

 drivers/rtc/rtc-ds1307.c | 97 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index 31a38d468378..1452982c3a6a 100644
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
@@ -166,6 +174,9 @@ struct ds1307 {
 #ifdef CONFIG_COMMON_CLK
 	struct clk_hw		clks[2];
 #endif
+#ifdef CONFIG_WATCHDOG_CORE
+	struct watchdog_device	wdt;
+#endif
 };
=20
 struct chip_desc {
@@ -854,6 +865,58 @@ static int m41txx_rtc_set_offset(struct device *dev,=
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
+	 * watchdog timeouts are measured in seconds. So ignore hundreths of
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
+#endif
+
 static const struct rtc_class_ops rx8130_rtc_ops =3D {
 	.read_time      =3D ds1307_get_time,
 	.set_time       =3D ds1307_set_time,
@@ -1576,6 +1639,39 @@ static void ds1307_clks_register(struct ds1307 *ds=
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
+};
+
+static void ds1307_wdt_register(struct ds1307 *ds1307)
+{
+	if (ds1307->type !=3D ds_1388)
+		return;
+
+	ds1307->wdt.info =3D &ds1388_wdt_info;
+	ds1307->wdt.ops =3D &ds1388_wdt_ops;
+	ds1307->wdt.max_timeout =3D 99;
+	ds1307->wdt.min_timeout =3D 1;
+
+	watchdog_init_timeout(&ds1307->wdt, 99, ds1307->dev);
+	watchdog_set_drvdata(&ds1307->wdt, ds1307);
+	watchdog_register_device(&ds1307->wdt);
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
@@ -1865,6 +1961,7 @@ static int ds1307_probe(struct i2c_client *client,
=20
 	ds1307_hwmon_register(ds1307);
 	ds1307_clks_register(ds1307);
+	ds1307_wdt_register(ds1307);
=20
 	return 0;
=20
--=20
2.25.1

