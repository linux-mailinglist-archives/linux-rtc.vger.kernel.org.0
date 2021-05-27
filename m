Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 065A2392C35
	for <lists+linux-rtc@lfdr.de>; Thu, 27 May 2021 12:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236217AbhE0LAC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 27 May 2021 07:00:02 -0400
Received: from mail-lj1-f170.google.com ([209.85.208.170]:39688 "EHLO
        mail-lj1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236204AbhE0LAB (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 27 May 2021 07:00:01 -0400
Received: by mail-lj1-f170.google.com with SMTP id w7so207543lji.6;
        Thu, 27 May 2021 03:58:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=KDmxczimwrDm8uB5QRdfoitoPKlULy9tkYLOYxjrDz4=;
        b=amPF6aZKznpX4Gh5w9UMdR9bw2jO32SOF5JHEzM5LrmpMQjHSacLf+L+sKElrIFxKq
         o5ncQ3bCrPWOEuiem0/J9vyC6iPu4iE0IVPe2R+Mk2b3rHs5xGXyLLeYIWuj9MpHevMW
         iMYf8ngGr5TQJdWsjRa9nhmMpryF3uA27Ixrz+66W0/8lP9xfLiA2CCkI6CRNnUq1BZM
         ZE35+OeK1lAPjp6vlW9V/Hp1RfHKiOuPSLReDsGDYZ9xCYdeA9vO3Q+5VyiJ2do+Zz22
         ojD4nLIyh4myshuaSU5glGP1yn2eqIvyTbYlovQFwxPks5lwtNP9xESCfVk41NcH6aS4
         9B8g==
X-Gm-Message-State: AOAM530QeGDOhcTQ46i6YMlkqYcaNv9xFm/NC9FRU/7u9QdImq4C9X0P
        uEcP2NaHlWl7iaNgiRQmhBpNtozNbVo=
X-Google-Smtp-Source: ABdhPJyWW4iGUZgLi+vSTPpQ2DhJCw8jmi1C9p3HqRYHBnzH4jSamFRDqV33j2egz/MQsqOcGgiybw==
X-Received: by 2002:a2e:bb8a:: with SMTP id y10mr2110097lje.78.1622113106600;
        Thu, 27 May 2021 03:58:26 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::4])
        by smtp.gmail.com with ESMTPSA id r5sm211168ljk.90.2021.05.27.03.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 03:58:25 -0700 (PDT)
Date:   Thu, 27 May 2021 13:58:19 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-power@fi.rohmeurope.com,
        linux-rtc@vger.kernel.org
Subject: [PATCH] rtc: bd70528: Drop BD70528 support
Message-ID: <20210527105819.GA3111334@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The only known BD70528 use-cases are such that the PMIC is controlled
=66rom separate MCU which is not running Linux. I am not aware of
any Linux driver users. Furthermore, it seems there is no demand for
this IC. Let's ease the maintenance burden and drop the driver. We can
always add it back if there is sudden need for it.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
This was previously part of the series here:
https://lore.kernel.org/lkml/cover.1621937490.git.matti.vaittinen@fi.rohmeu=
rope.com/

 drivers/rtc/Kconfig       |   7 +-
 drivers/rtc/rtc-bd70528.c | 316 ++------------------------------------
 2 files changed, 14 insertions(+), 309 deletions(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 914497abeef9..12153d5801ce 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -501,12 +501,11 @@ config RTC_DRV_M41T80_WDT
 	  watchdog timer in the ST M41T60 and M41T80 RTC chips series.
=20
 config RTC_DRV_BD70528
-	tristate "ROHM BD70528, BD71815 and BD71828 PMIC RTC"
-	depends on MFD_ROHM_BD71828 || MFD_ROHM_BD70528
-	depends on BD70528_WATCHDOG || !BD70528_WATCHDOG
+	tristate "ROHM BD71815 and BD71828 PMIC RTC"
+	depends on MFD_ROHM_BD71828
 	help
 	  If you say Y here you will get support for the RTC
-	  block on ROHM BD70528, BD71815 and BD71828 Power Management IC.
+	  block on ROHM BD71815 and BD71828 Power Management IC.
=20
 	  This driver can also be built as a module. If so, the module
 	  will be called rtc-bd70528.
diff --git a/drivers/rtc/rtc-bd70528.c b/drivers/rtc/rtc-bd70528.c
index 6454afca02a6..59b627fc1ecf 100644
--- a/drivers/rtc/rtc-bd70528.c
+++ b/drivers/rtc/rtc-bd70528.c
@@ -2,10 +2,9 @@
 //
 // Copyright (C) 2018 ROHM Semiconductors
 //
-// RTC driver for ROHM BD70528 PMIC
+// RTC driver for ROHM BD71828 and BD71815 PMIC
=20
 #include <linux/bcd.h>
-#include <linux/mfd/rohm-bd70528.h>
 #include <linux/mfd/rohm-bd71815.h>
 #include <linux/mfd/rohm-bd71828.h>
 #include <linux/module.h>
@@ -39,11 +38,6 @@ struct bd70528_rtc_data {
 	u8 year;
 } __packed;
=20
-struct bd70528_rtc_wake {
-	struct bd70528_rtc_day time;
-	u8 ctrl;
-} __packed;
-
 struct bd71828_rtc_alm {
 	struct bd70528_rtc_data alm0;
 	struct bd70528_rtc_data alm1;
@@ -51,141 +45,14 @@ struct bd71828_rtc_alm {
 	u8 alm1_mask;
 } __packed;
=20
-struct bd70528_rtc_alm {
-	struct bd70528_rtc_data data;
-	u8 alm_mask;
-	u8 alm_repeat;
-} __packed;
-
 struct bd70528_rtc {
 	struct rohm_regmap_dev *parent;
 	struct regmap *regmap;
 	struct device *dev;
 	u8 reg_time_start;
 	u8 bd718xx_alm_block_start;
-	bool has_rtc_timers;
 };
=20
-static int bd70528_set_wake(struct rohm_regmap_dev *bd70528,
-			    int enable, int *old_state)
-{
-	int ret;
-	unsigned int ctrl_reg;
-
-	ret =3D regmap_read(bd70528->regmap, BD70528_REG_WAKE_EN, &ctrl_reg);
-	if (ret)
-		return ret;
-
-	if (old_state) {
-		if (ctrl_reg & BD70528_MASK_WAKE_EN)
-			*old_state |=3D BD70528_WAKE_STATE_BIT;
-		else
-			*old_state &=3D ~BD70528_WAKE_STATE_BIT;
-
-		if (!enable =3D=3D !(*old_state & BD70528_WAKE_STATE_BIT))
-			return 0;
-	}
-
-	if (enable)
-		ctrl_reg |=3D BD70528_MASK_WAKE_EN;
-	else
-		ctrl_reg &=3D ~BD70528_MASK_WAKE_EN;
-
-	return regmap_write(bd70528->regmap, BD70528_REG_WAKE_EN,
-			    ctrl_reg);
-}
-
-static int bd70528_set_elapsed_tmr(struct rohm_regmap_dev *bd70528,
-				   int enable, int *old_state)
-{
-	int ret;
-	unsigned int ctrl_reg;
-
-	/*
-	 * TBD
-	 * What is the purpose of elapsed timer ?
-	 * Is the timeout registers counting down, or is the disable - re-enable
-	 * going to restart the elapsed-time counting? If counting is restarted
-	 * the timeout should be decreased by the amount of time that has
-	 * elapsed since starting the timer. Maybe we should store the monotonic
-	 * clock value when timer is started so that if RTC is set while timer
-	 * is armed we could do the compensation. This is a hack if RTC/system
-	 * clk are drifting. OTOH, RTC controlled via I2C is in any case
-	 * inaccurate...
-	 */
-	ret =3D regmap_read(bd70528->regmap, BD70528_REG_ELAPSED_TIMER_EN,
-			  &ctrl_reg);
-	if (ret)
-		return ret;
-
-	if (old_state) {
-		if (ctrl_reg & BD70528_MASK_ELAPSED_TIMER_EN)
-			*old_state |=3D BD70528_ELAPSED_STATE_BIT;
-		else
-			*old_state &=3D ~BD70528_ELAPSED_STATE_BIT;
-
-		if ((!enable) =3D=3D (!(*old_state & BD70528_ELAPSED_STATE_BIT)))
-			return 0;
-	}
-
-	if (enable)
-		ctrl_reg |=3D BD70528_MASK_ELAPSED_TIMER_EN;
-	else
-		ctrl_reg &=3D ~BD70528_MASK_ELAPSED_TIMER_EN;
-
-	return regmap_write(bd70528->regmap, BD70528_REG_ELAPSED_TIMER_EN,
-			    ctrl_reg);
-}
-
-static int bd70528_set_rtc_based_timers(struct bd70528_rtc *r, int new_sta=
te,
-					int *old_state)
-{
-	int ret;
-
-	ret =3D bd70528_wdt_set(r->parent, new_state & BD70528_WDT_STATE_BIT,
-			      old_state);
-	if (ret) {
-		dev_err(r->dev,
-			"Failed to disable WDG for RTC setting (%d)\n", ret);
-		return ret;
-	}
-	ret =3D bd70528_set_elapsed_tmr(r->parent,
-				      new_state & BD70528_ELAPSED_STATE_BIT,
-				      old_state);
-	if (ret) {
-		dev_err(r->dev,
-			"Failed to disable 'elapsed timer' for RTC setting\n");
-		return ret;
-	}
-	ret =3D bd70528_set_wake(r->parent, new_state & BD70528_WAKE_STATE_BIT,
-			       old_state);
-	if (ret) {
-		dev_err(r->dev,
-			"Failed to disable 'wake timer' for RTC setting\n");
-		return ret;
-	}
-
-	return ret;
-}
-
-static int bd70528_re_enable_rtc_based_timers(struct bd70528_rtc *r,
-					      int old_state)
-{
-	if (!r->has_rtc_timers)
-		return 0;
-
-	return bd70528_set_rtc_based_timers(r, old_state, NULL);
-}
-
-static int bd70528_disable_rtc_based_timers(struct bd70528_rtc *r,
-					    int *old_state)
-{
-	if (!r->has_rtc_timers)
-		return 0;
-
-	return bd70528_set_rtc_based_timers(r, 0, old_state);
-}
-
 static inline void tmday2rtc(struct rtc_time *t, struct bd70528_rtc_day *d)
 {
 	d->sec &=3D ~BD70528_MASK_RTC_SEC;
@@ -267,52 +134,6 @@ static int bd71828_set_alarm(struct device *dev, struc=
t rtc_wkalrm *a)
=20
 }
=20
-static int bd70528_set_alarm(struct device *dev, struct rtc_wkalrm *a)
-{
-	struct bd70528_rtc_wake wake;
-	struct bd70528_rtc_alm alm;
-	int ret;
-	struct bd70528_rtc *r =3D dev_get_drvdata(dev);
-
-	ret =3D regmap_bulk_read(r->regmap, BD70528_REG_RTC_WAKE_START, &wake,
-			       sizeof(wake));
-	if (ret) {
-		dev_err(dev, "Failed to read wake regs\n");
-		return ret;
-	}
-
-	ret =3D regmap_bulk_read(r->regmap, BD70528_REG_RTC_ALM_START, &alm,
-			       sizeof(alm));
-	if (ret) {
-		dev_err(dev, "Failed to read alarm regs\n");
-		return ret;
-	}
-
-	tm2rtc(&a->time, &alm.data);
-	tmday2rtc(&a->time, &wake.time);
-
-	if (a->enabled) {
-		alm.alm_mask &=3D ~BD70528_MASK_ALM_EN;
-		wake.ctrl |=3D BD70528_MASK_WAKE_EN;
-	} else {
-		alm.alm_mask |=3D BD70528_MASK_ALM_EN;
-		wake.ctrl &=3D ~BD70528_MASK_WAKE_EN;
-	}
-
-	ret =3D regmap_bulk_write(r->regmap, BD70528_REG_RTC_WAKE_START, &wake,
-				sizeof(wake));
-	if (ret) {
-		dev_err(dev, "Failed to set wake time\n");
-		return ret;
-	}
-	ret =3D regmap_bulk_write(r->regmap, BD70528_REG_RTC_ALM_START, &alm,
-				sizeof(alm));
-	if (ret)
-		dev_err(dev, "Failed to set alarm time\n");
-
-	return ret;
-}
-
 static int bd71828_read_alarm(struct device *dev, struct rtc_wkalrm *a)
 {
 	int ret;
@@ -336,78 +157,28 @@ static int bd71828_read_alarm(struct device *dev, str=
uct rtc_wkalrm *a)
 	return 0;
 }
=20
-static int bd70528_read_alarm(struct device *dev, struct rtc_wkalrm *a)
+static int bd71828_set_time(struct device *dev, struct rtc_time *t)
 {
-	struct bd70528_rtc_alm alm;
 	int ret;
-	struct bd70528_rtc *r =3D dev_get_drvdata(dev);
-
-	ret =3D regmap_bulk_read(r->regmap, BD70528_REG_RTC_ALM_START, &alm,
-			       sizeof(alm));
-	if (ret) {
-		dev_err(dev, "Failed to read alarm regs\n");
-		return ret;
-	}
-
-	rtc2tm(&alm.data, &a->time);
-	a->time.tm_mday =3D -1;
-	a->time.tm_mon =3D -1;
-	a->time.tm_year =3D -1;
-	a->enabled =3D !(alm.alm_mask & BD70528_MASK_ALM_EN);
-	a->pending =3D 0;
-
-	return 0;
-}
-
-static int bd70528_set_time_locked(struct device *dev, struct rtc_time *t)
-{
-	int ret, tmpret, old_states;
 	struct bd70528_rtc_data rtc_data;
 	struct bd70528_rtc *r =3D dev_get_drvdata(dev);
=20
-	ret =3D bd70528_disable_rtc_based_timers(r, &old_states);
-	if (ret)
-		return ret;
-
-	tmpret =3D regmap_bulk_read(r->regmap, r->reg_time_start, &rtc_data,
-				  sizeof(rtc_data));
-	if (tmpret) {
+	ret =3D regmap_bulk_read(r->regmap, r->reg_time_start, &rtc_data,
+			       sizeof(rtc_data));
+	if (ret) {
 		dev_err(dev, "Failed to read RTC time registers\n");
-		goto renable_out;
+		return ret;
 	}
 	tm2rtc(t, &rtc_data);
=20
-	tmpret =3D regmap_bulk_write(r->regmap, r->reg_time_start, &rtc_data,
-				   sizeof(rtc_data));
-	if (tmpret) {
+	ret =3D regmap_bulk_write(r->regmap, r->reg_time_start, &rtc_data,
+				sizeof(rtc_data));
+	if (ret)
 		dev_err(dev, "Failed to set RTC time\n");
-		goto renable_out;
-	}
-
-renable_out:
-	ret =3D bd70528_re_enable_rtc_based_timers(r, old_states);
-	if (tmpret)
-		ret =3D tmpret;
=20
 	return ret;
 }
=20
-static int bd71828_set_time(struct device *dev, struct rtc_time *t)
-{
-	return bd70528_set_time_locked(dev, t);
-}
-
-static int bd70528_set_time(struct device *dev, struct rtc_time *t)
-{
-	int ret;
-	struct bd70528_rtc *r =3D dev_get_drvdata(dev);
-
-	bd70528_wdt_lock(r->parent);
-	ret =3D bd70528_set_time_locked(dev, t);
-	bd70528_wdt_unlock(r->parent);
-	return ret;
-}
-
 static int bd70528_get_time(struct device *dev, struct rtc_time *t)
 {
 	struct bd70528_rtc *r =3D dev_get_drvdata(dev);
@@ -427,31 +198,6 @@ static int bd70528_get_time(struct device *dev, struct=
 rtc_time *t)
 	return 0;
 }
=20
-static int bd70528_alm_enable(struct device *dev, unsigned int enabled)
-{
-	int ret;
-	unsigned int enableval =3D BD70528_MASK_ALM_EN;
-	struct bd70528_rtc *r =3D dev_get_drvdata(dev);
-
-	if (enabled)
-		enableval =3D 0;
-
-	bd70528_wdt_lock(r->parent);
-	ret =3D bd70528_set_wake(r->parent, enabled, NULL);
-	if (ret) {
-		dev_err(dev, "Failed to change wake state\n");
-		goto out_unlock;
-	}
-	ret =3D regmap_update_bits(r->regmap, BD70528_REG_RTC_ALM_MASK,
-				 BD70528_MASK_ALM_EN, enableval);
-	if (ret)
-		dev_err(dev, "Failed to change alarm state\n");
-
-out_unlock:
-	bd70528_wdt_unlock(r->parent);
-	return ret;
-}
-
 static int bd71828_alm_enable(struct device *dev, unsigned int enabled)
 {
 	int ret;
@@ -470,14 +216,6 @@ static int bd71828_alm_enable(struct device *dev, unsi=
gned int enabled)
 	return ret;
 }
=20
-static const struct rtc_class_ops bd70528_rtc_ops =3D {
-	.read_time		=3D bd70528_get_time,
-	.set_time		=3D bd70528_set_time,
-	.read_alarm		=3D bd70528_read_alarm,
-	.set_alarm		=3D bd70528_set_alarm,
-	.alarm_irq_enable	=3D bd70528_alm_enable,
-};
-
 static const struct rtc_class_ops bd71828_rtc_ops =3D {
 	.read_time		=3D bd70528_get_time,
 	.set_time		=3D bd71828_set_time,
@@ -503,7 +241,6 @@ static int bd70528_probe(struct platform_device *pdev)
 	struct rtc_device *rtc;
 	int irq;
 	unsigned int hr;
-	bool enable_main_irq =3D false;
 	u8 hour_reg;
 	enum rohm_chip_type chip =3D platform_get_device_id(pdev)->driver_data;
=20
@@ -518,21 +255,9 @@ static int bd70528_probe(struct platform_device *pdev)
 	}
=20
 	bd_rtc->dev =3D &pdev->dev;
+	rtc_ops =3D &bd71828_rtc_ops;
=20
 	switch (chip) {
-	case ROHM_CHIP_TYPE_BD70528:
-		bd_rtc->parent =3D dev_get_drvdata(pdev->dev.parent);
-		if (!bd_rtc->parent) {
-			dev_err(&pdev->dev, "No MFD data\n");
-			return -EINVAL;
-		}
-		irq_name =3D "bd70528-rtc-alm";
-		bd_rtc->has_rtc_timers =3D true;
-		bd_rtc->reg_time_start =3D BD70528_REG_RTC_START;
-		hour_reg =3D BD70528_REG_RTC_HOUR;
-		enable_main_irq =3D true;
-		rtc_ops =3D &bd70528_rtc_ops;
-		break;
 	case ROHM_CHIP_TYPE_BD71815:
 		irq_name =3D "bd71815-rtc-alm-0";
 		bd_rtc->reg_time_start =3D BD71815_REG_RTC_START;
@@ -549,14 +274,12 @@ static int bd70528_probe(struct platform_device *pdev)
 		 */
 		bd_rtc->bd718xx_alm_block_start =3D BD71815_REG_RTC_ALM_START;
 		hour_reg =3D BD71815_REG_HOUR;
-		rtc_ops =3D &bd71828_rtc_ops;
 		break;
 	case ROHM_CHIP_TYPE_BD71828:
 		irq_name =3D "bd71828-rtc-alm-0";
 		bd_rtc->reg_time_start =3D BD71828_REG_RTC_START;
 		bd_rtc->bd718xx_alm_block_start =3D BD71828_REG_RTC_ALM_START;
 		hour_reg =3D BD71828_REG_RTC_HOUR;
-		rtc_ops =3D &bd71828_rtc_ops;
 		break;
 	default:
 		dev_err(&pdev->dev, "Unknown chip\n");
@@ -611,27 +334,10 @@ static int bd70528_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
=20
-	/*
-	 *  BD70528 irq controller is not touching the main mask register.
-	 *  So enable the RTC block interrupts at main level. We can just
-	 *  leave them enabled as irq-controller should disable irqs
-	 *  from sub-registers when IRQ is disabled or freed.
-	 */
-	if (enable_main_irq) {
-		ret =3D regmap_update_bits(bd_rtc->regmap,
-				 BD70528_REG_INT_MAIN_MASK,
-				 BD70528_INT_RTC_MASK, 0);
-		if (ret) {
-			dev_err(&pdev->dev, "Failed to enable RTC interrupts\n");
-			return ret;
-		}
-	}
-
 	return devm_rtc_register_device(rtc);
 }
=20
 static const struct platform_device_id bd718x7_rtc_id[] =3D {
-	{ "bd70528-rtc", ROHM_CHIP_TYPE_BD70528 },
 	{ "bd71828-rtc", ROHM_CHIP_TYPE_BD71828 },
 	{ "bd71815-rtc", ROHM_CHIP_TYPE_BD71815 },
 	{ },
@@ -649,6 +355,6 @@ static struct platform_driver bd70528_rtc =3D {
 module_platform_driver(bd70528_rtc);
=20
 MODULE_AUTHOR("Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>");
-MODULE_DESCRIPTION("ROHM BD70528 and BD71828 PMIC RTC driver");
+MODULE_DESCRIPTION("ROHM BD71828 and BD71815 PMIC RTC driver");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:bd70528-rtc");

base-commit: bcae59d0d45b866d5b9525ea8ece6d671e6767c8
--=20
2.25.4


--=20
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =3D]=20

--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmCve0MACgkQeFA3/03a
ocVeXAgAhqJ6af0k4ipb502GqzW+8bEdw7YHK1MAAV54TRMVX2hE6ey1jrxVHPae
xqotSY8ABRH9RAu0LZueZ9eRbtgb+GcqSkQIOIZGTV4wlQeFSj2+ORsUNepezHqo
gtHgP5M0xD9a9qMEzfAlyS5wz8QID/O0DnIUBkPboqG9GadT0I/d5+7R2p3bRwjC
roMtl8AmC5aQC/z0CyF+V+cA2YH/9SwtNebohxzXbHYWELFWarXtM1tLE/G/5jmk
oeeFfvlcpcBOtVCNB0ZrWIeP/2LrgwPN5Lg3O+AeFtVBciSBsTgbWIujRwdmgDKi
dyk23rUTybYLqav5TP5EXPG3gVrgBw==
=Q6YM
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--
