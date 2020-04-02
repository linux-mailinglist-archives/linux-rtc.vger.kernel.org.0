Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56D6819C340
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Apr 2020 15:54:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731780AbgDBNy3 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 2 Apr 2020 09:54:29 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:41788 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726425AbgDBNy3 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 2 Apr 2020 09:54:29 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1jK0GI-0003LD-1Y; Thu, 02 Apr 2020 13:52:02 +0000
From:   Colin King <colin.king@canonical.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linux-rtc@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][V2][next] rtc: ds1307: check for failed memory allocation on wdt
Date:   Thu,  2 Apr 2020 14:52:01 +0100
Message-Id: <20200402135201.548313-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently a failed memory allocation will lead to a null pointer
dereference on point wdt.  Fix this by checking for a failed allocation
and adding error return handling to function ds1307_wdt_register.
Also move the error exit label "exit" to allow a return statement to
be removed.

Addresses-Coverity: ("Dereference null return")
Fixes: fd90d48db037 ("rtc: ds1307: add support for watchdog timer on ds1388")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
V2: move error exit label and remove a return statement, thanks to 
    Walter Harms for spotting this clean up.
---
 drivers/rtc/rtc-ds1307.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index fad042118862..c058b02efb4d 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -1665,14 +1665,16 @@ static const struct watchdog_ops ds1388_wdt_ops = {
 
 };
 
-static void ds1307_wdt_register(struct ds1307 *ds1307)
+static int ds1307_wdt_register(struct ds1307 *ds1307)
 {
 	struct watchdog_device	*wdt;
 
 	if (ds1307->type != ds_1388)
-		return;
+		return 0;
 
 	wdt = devm_kzalloc(ds1307->dev, sizeof(*wdt), GFP_KERNEL);
+	if (!wdt)
+		return -ENOMEM;
 
 	wdt->info = &ds1388_wdt_info;
 	wdt->ops = &ds1388_wdt_ops;
@@ -1683,10 +1685,13 @@ static void ds1307_wdt_register(struct ds1307 *ds1307)
 	watchdog_init_timeout(wdt, 0, ds1307->dev);
 	watchdog_set_drvdata(wdt, ds1307);
 	devm_watchdog_register_device(ds1307->dev, wdt);
+
+	return 0;
 }
 #else
-static void ds1307_wdt_register(struct ds1307 *ds1307)
+static int ds1307_wdt_register(struct ds1307 *ds1307)
 {
+	return 0;
 }
 #endif /* CONFIG_WATCHDOG_CORE */
 
@@ -1979,10 +1984,7 @@ static int ds1307_probe(struct i2c_client *client,
 
 	ds1307_hwmon_register(ds1307);
 	ds1307_clks_register(ds1307);
-	ds1307_wdt_register(ds1307);
-
-	return 0;
-
+	err = ds1307_wdt_register(ds1307);
 exit:
 	return err;
 }
-- 
2.25.1

