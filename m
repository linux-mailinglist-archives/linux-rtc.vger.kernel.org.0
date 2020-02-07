Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C23711550F0
	for <lists+linux-rtc@lfdr.de>; Fri,  7 Feb 2020 04:18:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727477AbgBGDSY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 6 Feb 2020 22:18:24 -0500
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:60216 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726755AbgBGDSW (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 6 Feb 2020 22:18:22 -0500
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 0997F891A9;
        Fri,  7 Feb 2020 16:18:19 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1581045499;
        bh=ILYQDqCJD1u3b4RiOoaFsXGvgfZVD7O4KmtJrDPCTU4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=EWzvkfk/pXqncdr/l2RgogMcureP17wcoeIPJVyT7VEA0ojWfpesMv/NscRyi0Ecv
         v6pXEGcAry/sYp7LMS2Z4FiwlwnmGZYlTgUudEaIZg31y659b3ekYz8Lq0phTs2Yaz
         gnppObrOp5aa6Nj5XFW9qZ4BcP5lL87QbQcNJzqyA2yP8wQxLip+VVTFN7GxbNML6A
         KpbCCBhaGLWPUUMtNUyQDMSjOOcgWUUvZi01DgR5UKCibBhLtzhxPLRyyRGkpr9KdT
         B8aMQmFSiDQ6MhxtxK05wGymd3dsCwanL3MjspsenwP1CjpXAr1OpacWRxBddE6o2h
         lKuASjJZameHA==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5e3cd6fa0002>; Fri, 07 Feb 2020 16:18:18 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id C2FEE13EEDE;
        Fri,  7 Feb 2020 16:18:17 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id DF30628006E; Fri,  7 Feb 2020 16:18:18 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v1 2/2] rtc: ds1307: add support for watchdog timer on ds1388
Date:   Fri,  7 Feb 2020 16:18:12 +1300
Message-Id: <20200207031812.14424-3-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200207031812.14424-1-chris.packham@alliedtelesis.co.nz>
References: <20200207031812.14424-1-chris.packham@alliedtelesis.co.nz>
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
 drivers/rtc/rtc-ds1307.c | 105 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index 31a38d468378..e83d9e52aae5 100644
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
+			DS1388_BIT_WF, 0);
+	if (ret)
+		return ret;
+
+	ret =3D regmap_update_bits(ds1307->regmap, DS1388_REG_CONTROL,
+				 DS1388_BIT_WDE|DS1388_BIT_RST, 0);
+	if (ret)
+		return ret;
+
+	/*
+	 * watchdog timeouts are measured in seconds so max out hundreths of
+	 * seconds field.
+	 */
+	regs[0] =3D 0x99;
+	regs[1] =3D bin2bcd(wdt_dev->timeout);
+
+	ret =3D regmap_bulk_write(ds1307->regmap, DS1388_REG_WDOG_HUN_SECS, reg=
s,
+			sizeof(regs));
+	if (ret)
+		return ret;
+
+	return regmap_update_bits(ds1307->regmap, DS1388_REG_CONTROL,
+				  DS1388_BIT_WDE|DS1388_BIT_RST,
+				  DS1388_BIT_WDE|DS1388_BIT_RST);
+}
+
+static int ds1388_wdt_stop(struct watchdog_device *wdt_dev)
+{
+	struct ds1307 *ds1307 =3D watchdog_get_drvdata(wdt_dev);
+
+	return regmap_update_bits(ds1307->regmap, DS1388_REG_CONTROL,
+				  DS1388_BIT_WDE|DS1388_BIT_RST, 0);
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
@@ -880,6 +943,20 @@ static const struct rtc_class_ops m41txx_rtc_ops =3D=
 {
 	.set_offset	=3D m41txx_rtc_set_offset,
 };
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
+#endif
+
 static const struct chip_desc chips[last_ds_type] =3D {
 	[ds_1307] =3D {
 		.nvram_offset	=3D 8,
@@ -1576,6 +1653,33 @@ static void ds1307_clks_register(struct ds1307 *ds=
1307)
=20
 #endif /* CONFIG_COMMON_CLK */
=20
+#ifdef CONFIG_WATCHDOG_CORE
+static void ds1307_wdt_register(struct ds1307 *ds1307)
+{
+	int ret;
+
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
+	ret =3D watchdog_register_device(&ds1307->wdt);
+	if (ret) {
+		dev_warn(ds1307->dev, "unable to register watchdog device %d\n",
+			 ret);
+	}
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
@@ -1865,6 +1969,7 @@ static int ds1307_probe(struct i2c_client *client,
=20
 	ds1307_hwmon_register(ds1307);
 	ds1307_clks_register(ds1307);
+	ds1307_wdt_register(ds1307);
=20
 	return 0;
=20
--=20
2.25.0

