Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F328923B45B
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Aug 2020 07:18:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729067AbgHDFSK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 4 Aug 2020 01:18:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726000AbgHDFSI (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 4 Aug 2020 01:18:08 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A56BC06174A
        for <linux-rtc@vger.kernel.org>; Mon,  3 Aug 2020 22:18:07 -0700 (PDT)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id D31DB891B1;
        Tue,  4 Aug 2020 17:18:02 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1596518282;
        bh=zfP6/sULj//NkhxeKY3miXAqSNhqQ7vcIbwQEGAnxsI=;
        h=From:To:Cc:Subject:Date;
        b=P7CesnaAw5GuaaeryCdRqBDPv30qaqyxUihnGTchvgetugrC0eL3ZuDhy6+L0A2/d
         nOYJaVOz7ZuSvUWtf30cDb2ijbF8P9cCX5bOENx1iH+4YvrxEWBH8uT6Tickwe0URJ
         W6vonvs3HefW1y0VkkdX+plBqC9CnaPIpvJwAD2jBtq61EpnT57U4UE7yb0YpJ4W7r
         1XIUnZSwQ0jWzn/eyjU6VB1W4NaxpIbU9KM3tFDE33V+Q7/4/mTQ3VZa5NrNyk/REc
         eFAH+NOOhTjfjdcHByf6qzz6G5dspEAqM7nzLsOt+3Ro6nsWrP4kIcugqYGSYHp/0q
         dD5uR3tbLFMgQ==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5f28ef860000>; Tue, 04 Aug 2020 17:18:03 +1200
Received: from markto-dl.ws.atlnz.lc (markto-dl.ws.atlnz.lc [10.33.23.25])
        by smtp (Postfix) with ESMTP id 4CFB313EEBA;
        Tue,  4 Aug 2020 17:17:57 +1200 (NZST)
Received: by markto-dl.ws.atlnz.lc (Postfix, from userid 1155)
        id 9416434108A; Tue,  4 Aug 2020 17:17:57 +1200 (NZST)
From:   Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
Subject: [PATCH] RTC: Implement pretimeout watchdog for DS1307
Date:   Tue,  4 Aug 2020 17:17:43 +1200
Message-Id: <20200804051743.19115-1-mark.tomlinson@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

If the hardware watchdog in the clock chip simply pulls the reset line
of the CPU, then there is no chance to write a stack trace to help
determine what may have been blocking the CPU.

This patch adds a pretimeout to the watchdog, which, if enabled, sets
a timer to go off before the hardware watchdog kicks in, and calls
the standard pretimeout function, which can (for example) call panic.

Signed-off-by: Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
---
 drivers/rtc/rtc-ds1307.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index 49702942bb08..647f8659d0bd 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -23,6 +23,7 @@
 #include <linux/clk-provider.h>
 #include <linux/regmap.h>
 #include <linux/watchdog.h>
+#include <linux/timer.h>
=20
 /*
  * We can't determine type by probing, but if we expect pre-Linux code
@@ -174,6 +175,10 @@ struct ds1307 {
 #ifdef CONFIG_COMMON_CLK
 	struct clk_hw		clks[2];
 #endif
+#ifdef CONFIG_WATCHDOG_CORE
+	struct timer_list	soft_timer;
+	struct watchdog_device	*wdt;
+#endif
 };
=20
 struct chip_desc {
@@ -863,12 +868,34 @@ static int m41txx_rtc_set_offset(struct device *dev=
, long offset)
 }
=20
 #ifdef CONFIG_WATCHDOG_CORE
+static void ds1388_soft_wdt_expire(struct timer_list *soft_timer)
+{
+	struct ds1307 *ds1307 =3D container_of(soft_timer, struct ds1307, soft_=
timer);
+
+	watchdog_notify_pretimeout(ds1307->wdt);
+}
+
+static void ds1388_soft_timer_set(struct watchdog_device *wdt_dev)
+{
+	struct ds1307 *ds1307 =3D watchdog_get_drvdata(wdt_dev);
+	int soft_timeout;
+
+	if (wdt_dev->pretimeout > 0) {
+		soft_timeout =3D wdt_dev->timeout - wdt_dev->pretimeout;
+		mod_timer(&ds1307->soft_timer, jiffies + soft_timeout * HZ);
+	} else {
+		del_timer(&ds1307->soft_timer);
+	}
+}
+
 static int ds1388_wdt_start(struct watchdog_device *wdt_dev)
 {
 	struct ds1307 *ds1307 =3D watchdog_get_drvdata(wdt_dev);
 	u8 regs[2];
 	int ret;
=20
+	ds1388_soft_timer_set(wdt_dev);
+
 	ret =3D regmap_update_bits(ds1307->regmap, DS1388_REG_FLAG,
 				 DS1388_BIT_WF, 0);
 	if (ret)
@@ -900,6 +927,7 @@ static int ds1388_wdt_stop(struct watchdog_device *wd=
t_dev)
 {
 	struct ds1307 *ds1307 =3D watchdog_get_drvdata(wdt_dev);
=20
+	del_timer(&ds1307->soft_timer);
 	return regmap_update_bits(ds1307->regmap, DS1388_REG_CONTROL,
 				  DS1388_BIT_WDE | DS1388_BIT_RST, 0);
 }
@@ -909,6 +937,7 @@ static int ds1388_wdt_ping(struct watchdog_device *wd=
t_dev)
 	struct ds1307 *ds1307 =3D watchdog_get_drvdata(wdt_dev);
 	u8 regs[2];
=20
+	ds1388_soft_timer_set(wdt_dev);
 	return regmap_bulk_read(ds1307->regmap, DS1388_REG_WDOG_HUN_SECS, regs,
 				sizeof(regs));
 }
@@ -923,6 +952,7 @@ static int ds1388_wdt_set_timeout(struct watchdog_dev=
ice *wdt_dev,
 	regs[0] =3D 0;
 	regs[1] =3D bin2bcd(wdt_dev->timeout);
=20
+	ds1388_soft_timer_set(wdt_dev);
 	return regmap_bulk_write(ds1307->regmap, DS1388_REG_WDOG_HUN_SECS, regs=
,
 				 sizeof(regs));
 }
@@ -1652,7 +1682,8 @@ static void ds1307_clks_register(struct ds1307 *ds1=
307)
=20
 #ifdef CONFIG_WATCHDOG_CORE
 static const struct watchdog_info ds1388_wdt_info =3D {
-	.options =3D WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
+	.options =3D WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING |
+		   WDIOF_MAGICCLOSE | WDIOF_PRETIMEOUT,
 	.identity =3D "DS1388 watchdog",
 };
=20
@@ -1681,6 +1712,8 @@ static void ds1307_wdt_register(struct ds1307 *ds13=
07)
 	wdt->timeout =3D 99;
 	wdt->max_timeout =3D 99;
 	wdt->min_timeout =3D 1;
+	ds1307->wdt =3D wdt;
+	timer_setup(&ds1307->soft_timer, ds1388_soft_wdt_expire, 0);
=20
 	watchdog_init_timeout(wdt, 0, ds1307->dev);
 	watchdog_set_drvdata(wdt, ds1307);
--=20
2.28.0

