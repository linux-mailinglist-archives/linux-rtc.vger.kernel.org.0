Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0704819C305
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Apr 2020 15:49:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732218AbgDBNtC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 2 Apr 2020 09:49:02 -0400
Received: from mx01-sz.bfs.de ([194.94.69.67]:18066 "EHLO mx02-sz.bfs.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727734AbgDBNtC (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 2 Apr 2020 09:49:02 -0400
X-Greylist: delayed 489 seconds by postgrey-1.27 at vger.kernel.org; Thu, 02 Apr 2020 09:49:01 EDT
Received: from SRVEX01-SZ.bfs.intern (exchange-sz.bfs.de [10.129.90.31])
        by mx02-sz.bfs.de (Postfix) with ESMTPS id AAA892032C;
        Thu,  2 Apr 2020 15:40:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bfs.de; s=dkim201901;
        t=1585834849;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QlZyfiAFQ9KUa3zeoxNhARJVXQImLekdjEDxCvhasc4=;
        b=Cf0jEKAhDqDvM0dE4hGtZNgiNPz0F5tb7EOeCsUjkVtXHNdEkLFL+jGKFnNWKxlr33DHoj
        e+VswiL+MGUfg8WYDJtT68M6zMZanhUoY0rkvX5BhPkEVKpJnUzLhq2kFJoX0dKF5sGTh1
        EMRZ5T74SEJcPLtq12cztffp5llGp09lbhh3YYFAzG3HR51Pux/8n6/+ch6hRhYvWvEehl
        j3+j6UU9iZ/ef3g5kCo/dIt8voc50K2cIgRe+9q4nmVDM+q1wg4su9Rmo4ewBFl76OETQn
        hwpFZB/dGdD7ym6b41E1OPbhzV1wHj7OXKwIuH4fJZxaRpd9Af1MKQ4FSKCKeg==
Received: from SRVEX01-SZ.bfs.intern (10.129.90.31) by SRVEX01-SZ.bfs.intern
 (10.129.90.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1913.5; Thu, 2 Apr 2020
 15:40:49 +0200
Received: from SRVEX01-SZ.bfs.intern ([fe80::7d2d:f9cb:2761:d24a]) by
 SRVEX01-SZ.bfs.intern ([fe80::7d2d:f9cb:2761:d24a%6]) with mapi id
 15.01.1913.005; Thu, 2 Apr 2020 15:40:49 +0200
From:   Walter Harms <wharms@bfs.de>
To:     Colin King <colin.king@canonical.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
CC:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: AW: [PATCH][next] rtc: ds1307: check for failed memory allocation on
 wdt
Thread-Topic: [PATCH][next] rtc: ds1307: check for failed memory allocation on
 wdt
Thread-Index: AQHWCPC8EF0a6BxpC06p5UODJlWRsahl1nQZ
Date:   Thu, 2 Apr 2020 13:40:49 +0000
Message-ID: <54a09b5502ee45e9a926a025ae576498@bfs.de>
References: <20200402131441.539088-1-colin.king@canonical.com>
In-Reply-To: <20200402131441.539088-1-colin.king@canonical.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.137.16.39]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Spam-Status: No, score=-2.87
Authentication-Results: mx02-sz.bfs.de;
        none
X-Spamd-Result: default: False [-2.87 / 7.00];
         ARC_NA(0.00)[];
         TO_DN_EQ_ADDR_SOME(0.00)[];
         HAS_XOIP(0.00)[];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         DKIM_SIGNED(0.00)[];
         RCPT_COUNT_SEVEN(0.00)[8];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[];
         BAYES_HAM(-2.87)[99.44%]
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


________________________________________
Von: kernel-janitors-owner@vger.kernel.org <kernel-janitors-owner@vger.kern=
el.org> im Auftrag von Colin King <colin.king@canonical.com>
Gesendet: Donnerstag, 2. April 2020 15:14
An: Alessandro Zummo; Alexandre Belloni; Guenter Roeck; Chris Packham; linu=
x-rtc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org
Betreff: [PATCH][next] rtc: ds1307: check for failed memory allocation on w=
dt

From: Colin Ian King <colin.king@canonical.com>

Currently a failed memory allocation will lead to a null pointer
dereference on point wdt.  Fix this by checking for a failed allocation
and adding error return handling to function ds1307_wdt_register.

Addresses-Coverity: ("Dereference null return")
Fixes: fd90d48db037 ("rtc: ds1307: add support for watchdog timer on ds1388=
")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/rtc/rtc-ds1307.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index fad042118862..95c5b6facc59 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -1665,14 +1665,16 @@ static const struct watchdog_ops ds1388_wdt_ops =3D=
 {

 };

-static void ds1307_wdt_register(struct ds1307 *ds1307)
+static int ds1307_wdt_register(struct ds1307 *ds1307)
 {
        struct watchdog_device  *wdt;

        if (ds1307->type !=3D ds_1388)
-               return;
+               return 0;

        wdt =3D devm_kzalloc(ds1307->dev, sizeof(*wdt), GFP_KERNEL);
+       if (!wdt)
+               return -ENOMEM;

        wdt->info =3D &ds1388_wdt_info;
        wdt->ops =3D &ds1388_wdt_ops;
@@ -1683,10 +1685,13 @@ static void ds1307_wdt_register(struct ds1307 *ds13=
07)
        watchdog_init_timeout(wdt, 0, ds1307->dev);
        watchdog_set_drvdata(wdt, ds1307);
        devm_watchdog_register_device(ds1307->dev, wdt);
+
+       return 0;
 }
 #else
-static void ds1307_wdt_register(struct ds1307 *ds1307)
+static int ds1307_wdt_register(struct ds1307 *ds1307)
 {
+       return 0;
 }
 #endif /* CONFIG_WATCHDOG_CORE */

@@ -1979,9 +1984,9 @@ static int ds1307_probe(struct i2c_client *client,

        ds1307_hwmon_register(ds1307);
        ds1307_clks_register(ds1307);
-       ds1307_wdt_register(ds1307);
+       err =3D ds1307_wdt_register(ds1307);

-       return 0;
+       return err;

 exit:
        return err;
--
2.25.1

IMHO, one "return err;" is sufficient.

re,
 wh
